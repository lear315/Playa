import { RenderClearFlag } from "../../../RenderEngine/RenderEnum/RenderClearFlag";
import { RenderPassStatisticsInfo } from "../../../RenderEngine/RenderEnum/RenderStatInfo";
import { Camera } from "../../../d3/core/Camera";
import { CommandBuffer } from "../../../d3/core/render/command/CommandBuffer";
import { DepthPass } from "../../../d3/depthMap/DepthPass";
import { CameraCullInfo } from "../../../d3/shadowMap/ShadowSliceData";
import { Color } from "../../../maths/Color";
import { Vector4 } from "../../../maths/Vector4";
import { Viewport } from "../../../maths/Viewport";
import { DepthTextureMode } from "../../../resource/RenderTexture";
import { Stat } from "../../../utils/Stat";
import { RenderCullUtil } from "../../DriverCommon/RenderCullUtil";
import { RenderListQueue } from "../../DriverCommon/RenderListQueue";
import { PipelineMode } from "../../DriverDesign/3DRenderPass/I3DRenderPass";
import { InternalRenderTarget } from "../../DriverDesign/RenderDevice/InternalRenderTarget";
import { WebBaseRenderNode } from "../../RenderModuleData/WebModuleData/3D/WebBaseRenderNode";
import { WebCameraNodeData } from "../../RenderModuleData/WebModuleData/3D/WebModuleData";
import { WebGLRenderContext3D } from "./WebGLRenderContext3D";
import { WebGLRenderElement3D } from "./WebGLRenderElement3D";
export class WebGLForwardAddClusterRP {

    /** @internal*/
    static _context3DViewPortCatch: Viewport = new Viewport(0, 0, 0, 0);
    /** @internal*/
    static _contextScissorPortCatch: Vector4 = new Vector4(0, 0, 0, 0);
    /**@internal */
    cameraCullInfo: CameraCullInfo;
    /**@internal */
    beforeForwardCmds: Array<CommandBuffer>;
    /**@internal */
    beforeSkyboxCmds: Array<CommandBuffer>;
    /**@internal */
    beforeTransparentCmds: Array<CommandBuffer>;

    /**enable */
    enableOpaque: boolean;
    enableCMD: boolean;
    enableTransparent: boolean;

    /**@internal */
    destTarget: InternalRenderTarget;
    /**@internal */
    pipelineMode: PipelineMode;

    /**@internal */
    depthTarget: InternalRenderTarget;
    /**@internal */
    depthPipelineMode: PipelineMode;

    /**@internal */
    depthNormalTarget: InternalRenderTarget;
    /**@internal */
    depthNormalPipelineMode: PipelineMode

    /**@internal sky TODO*/
    skyRenderNode: WebBaseRenderNode;
    /**@internal */
    depthTextureMode: DepthTextureMode;

    opaqueTexture: InternalRenderTarget;

    blitOpaqueBuffer: CommandBuffer = new CommandBuffer();

    private _enableOpaqueTexture: boolean;

    public get enableOpaqueTexture(): boolean {
        return this._enableOpaqueTexture;
    }
    public set enableOpaqueTexture(value: boolean) {
        this._enableOpaqueTexture = value;
    }

    clearColor: Color;
    clearFlag: number;

    /**@internal */
    camera: WebCameraNodeData;

    private _viewPort: Viewport;
    setViewPort(value: Viewport) {
        value.cloneTo(this._viewPort);
    };

    private _scissor: Vector4;
    setScissor(value: Vector4) {
        value.cloneTo(this._scissor);
    }


    private opaqueList: RenderListQueue;
    private transparent: RenderListQueue;

    private _zBufferParams: Vector4;
    private _defaultNormalDepthColor;

    constructor() {
        this.opaqueList = new RenderListQueue(false);
        this.transparent = new RenderListQueue(true);
        this.cameraCullInfo = new CameraCullInfo();
        this._zBufferParams = new Vector4();
        this._scissor = new Vector4();
        this._viewPort = new Viewport();
        this._defaultNormalDepthColor = new Color(0.5, 0.5, 1.0, 0.0);
        this.clearColor = new Color();

        this.depthPipelineMode = "ShadowCaster";
        this.depthNormalPipelineMode = "DepthNormal";
    }

    setCameraCullInfo(value: Camera): void {
        this.cameraCullInfo.position = value._transform.position;
        this.cameraCullInfo.cullingMask = value.cullingMask;
        this.cameraCullInfo.staticMask = value.staticMask;
        this.cameraCullInfo.boundFrustum = value.boundFrustum;
        this.cameraCullInfo.useOcclusionCulling = value.useOcclusionCulling;
    }

    setBeforeForwardCmds(value: CommandBuffer[]): void {
        if (value && value.length > 0) {
            this.beforeForwardCmds = value;
            value.forEach(element => {
                element._apply(false);
            });
        }
    }
    setBeforeSkyboxCmds(value: CommandBuffer[]): void {
        if (value && value.length > 0) {
            this.beforeSkyboxCmds = value;
            value.forEach(element => {
                element._apply(false);
            });
        }

    }
    setBeforeTransparentCmds(value: CommandBuffer[]): void {
        if (value && value.length > 0) {
            this.beforeTransparentCmds = value;
            value.forEach(element => {
                element._apply(false);
            });
        }
    }

    /**
     * 渲染主流程（TODO:其他两个pass合并MulTargetRT）
     * @param context 
     * @param list 
     */
    render(context: WebGLRenderContext3D, list: WebBaseRenderNode[], count: number): void {
        context.cameraUpdateMask++
        this.opaqueList.clear();
        this.transparent.clear();

        var time = performance.now();//T_CameraMainCull Stat
        RenderCullUtil.cullByCameraCullInfo(this.cameraCullInfo, list, count, this.opaqueList, this.transparent, context)
        Stat.renderPassStatArray[RenderPassStatisticsInfo.T_CameraMainCull] += (performance.now() - time);//Stat

        time = performance.now();//T_Render_CameraOtherDest Stat
        if ((this.depthTextureMode & DepthTextureMode.Depth) != 0) {
            this._renderDepthPass(context);
        }
        if ((this.depthTextureMode & DepthTextureMode.DepthNormals) != 0) {
            this._renderDepthNormalPass(context);
        }
        Stat.renderPassStatArray[RenderPassStatisticsInfo.T_Render_CameraOtherDest] += (performance.now() - time);//Stat

        this._viewPort.cloneTo(WebGLForwardAddClusterRP._context3DViewPortCatch);
        this._scissor.cloneTo(WebGLForwardAddClusterRP._contextScissorPortCatch);
        this._mainPass(context);

        this.opaqueList._batch.recoverData();
    }

    /**
     * 渲染深度Pass
     * @param context
     * @param list
     */
    private _renderDepthPass(context: WebGLRenderContext3D): void {
        context.pipelineMode = this.depthPipelineMode;
        var viewport = this._viewPort;
        var shadervalue = context.sceneData;
        shadervalue.addDefine(DepthPass.DEPTHPASS);
        shadervalue.setVector(DepthPass.DEFINE_SHADOW_BIAS, Vector4.ZERO);
        Viewport._tempViewport.set(viewport.x, viewport.y, viewport.width, viewport.height);
        Vector4.tempVec4.setValue(viewport.x, viewport.y, viewport.width, viewport.height);
        context.setViewPort(Viewport._tempViewport);
        context.setScissor(Vector4.tempVec4);
        context.setRenderTarget(this.depthTarget, RenderClearFlag.Depth);
        context.setClearData(RenderClearFlag.Depth, Color.BLACK, 1, 0);

        // render
        this.opaqueList.renderQueue(context);
        Stat.depthCastDrawCall += this.opaqueList.elements.length;
        //渲染完后传入使用的参数
        var far = this.camera.farplane;
        var near = this.camera.nearplane;
        this._zBufferParams.setValue(1.0 - far / near, far / near, (near - far) / (near * far), 1 / near);
        context.cameraData.setVector(DepthPass.DEFINE_SHADOW_BIAS, DepthPass.SHADOW_BIAS);

        context.cameraData.setVector(DepthPass.DEPTHZBUFFERPARAMS, this._zBufferParams);
        shadervalue.removeDefine(DepthPass.DEPTHPASS);
    }


    /**
     * @param context
     * @private
     */
    private _transparentListRender(context: WebGLRenderContext3D) {
        this.transparent.renderQueue(context);
        Stat.transDrawCall+=this.transparent.elements.length;
    }

    /**
     * 渲染非透明物体Pass
     * @param context 
     * @param list
     */
    private _opaqueListRender(context: WebGLRenderContext3D) {
        this.opaqueList.renderQueue(context);
        Stat.opaqueDrawCall+=this.opaqueList.elements.length;
    }

    /**
     * 渲染法线深度Pass
     * @param context 
     * @param list
     */
    private _renderDepthNormalPass(context: WebGLRenderContext3D): void {
        context.pipelineMode = this.depthNormalPipelineMode;
        //传入shader该传的值
        var viewport = this._viewPort;
        Viewport._tempViewport.set(viewport.x, viewport.y, viewport.width, viewport.height);
        Vector4.tempVec4.setValue(viewport.x, viewport.y, viewport.width, viewport.height);
        context.setViewPort(Viewport._tempViewport);
        context.setScissor(Vector4.tempVec4);
        context.setClearData(RenderClearFlag.Color | RenderClearFlag.Depth, this._defaultNormalDepthColor, 1, 0);
        context.setRenderTarget(this.depthNormalTarget, RenderClearFlag.Color | RenderClearFlag.Depth);
        this.opaqueList.renderQueue(context);
        Stat.depthCastDrawCall += this.opaqueList.elements.length;
    }

    private opaqueTexturePass(context: WebGLRenderContext3D) {
        let commanbuffer = this.blitOpaqueBuffer;
        commanbuffer._apply(false);
        context.runCMDList(commanbuffer._renderCMDs);
    }

    private _mainPass(context: WebGLRenderContext3D): void {
        context.pipelineMode = this.pipelineMode;
        this._rendercmd(this.beforeForwardCmds, context);
        this._recoverRenderContext3D(context);
        context.setClearData(this.clearFlag, this.clearColor, 1, 0);

        var time = performance.now();//T_Render_OpaqueRender Stat
        this.enableOpaque && this._opaqueListRender(context);
        Stat.renderPassStatArray[RenderPassStatisticsInfo.T_Render_OpaqueRender] += (performance.now() - time);//Stat

        this._rendercmd(this.beforeSkyboxCmds, context);

        if (this.skyRenderNode) {
            let skyRenderNode = <WebBaseRenderNode>this.skyRenderNode;
            let skyRenderElement = skyRenderNode.renderelements[0] as WebGLRenderElement3D;
            context.drawRenderElementOne(skyRenderElement);
        }

        if (this.enableOpaque) {
            this.opaqueTexturePass(context);
        }

        this._rendercmd(this.beforeTransparentCmds, context);
        this._recoverRenderContext3D(context);

        time = performance.now();//T_Render_TransparentRender Stat
        this.transparent && this._transparentListRender(context);
        Stat.renderPassStatArray[RenderPassStatisticsInfo.T_Render_TransparentRender] += (performance.now() - time);//Stat

    }

    /**
     * @param cmds
     * @param context
     * @private
     */
    private _rendercmd(cmds: Array<CommandBuffer>, context: WebGLRenderContext3D) {
        if (!cmds || cmds.length == 0)
            return;
        var time = performance.now();//T_Render_CameraEventCMD Stat
        cmds.forEach(function (value) {
            context.runCMDList(value._renderCMDs);
        });
        Stat.renderPassStatArray[RenderPassStatisticsInfo.T_Render_CameraEventCMD] += (performance.now() - time);//Stat
    }

    private _recoverRenderContext3D(context: WebGLRenderContext3D) {
        const cacheViewPor = WebGLForwardAddClusterRP._context3DViewPortCatch;
        const cacheScissor = WebGLForwardAddClusterRP._contextScissorPortCatch;
        context.setViewPort(cacheViewPor);
        context.setScissor(cacheScissor);
        context.setRenderTarget(this.destTarget, RenderClearFlag.Nothing);
    }

}