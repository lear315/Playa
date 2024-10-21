import AnimationClip = Laya.AnimationClip;
import Animator = Laya.Animator;
import AnimatorControllerLayer = Laya.AnimatorControllerLayer;
import Component = Laya.Component;
import AnimatorState = Laya.AnimatorState;
import FloatKeyframe = Laya.FloatKeyframe;
import KeyFrameValueType = Laya.KeyFrameValueType;
import Matrix4x4 = Laya.Matrix4x4;
import Mesh = Laya.Mesh;
import MeshFilter = Laya.MeshFilter;
import MeshRenderer = Laya.MeshRenderer;
import Quaternion = Laya.Quaternion;
import SkinnedMeshRenderer = Laya.SkinnedMeshRenderer;
import KeyframeNode = Laya.KeyframeNode;
import KeyframeNodeList = Laya.KeyframeNodeList;
import Sprite3D = Laya.Sprite3D;
import Vector3 = Laya.Vector3;
import Utils3D = Laya.Utils3D;
import SimpleSkinnedMeshRenderer = Laya.SimpleSkinnedMeshRenderer;
import { BakeAnimatorUtils } from './BakeAnimatorUtils';

const TempMat: Matrix4x4 = new Matrix4x4();
import * as fpath from 'path';
import * as fs from "fs";

@IEditorEnv.regClass()
export class BackAnimatorData {
    public animatorGameObject: Sprite3D;
    public skinders: SkinnedMeshRenderer[];
    public animator: Animator;
    public stats: AnimatorState[];
    public currentFrame: number;
    public currentClipEndFrame: number;
    public allFrameLength: number;
    public pixelData: Float32Array;
    private _clipDatas: AnimationClip[];
    public isUpdate: boolean = true;
    public bones: Sprite3D[];
    public bondPos: Matrix4x4[];

    public deltaTime: number = 0;
    public bakeFPS: number;
    public textureWidth: number;
    public saveLaniindex: number;
    /** 挂点骨骼 列表*/
    public socketsBoneNames: string[]
    /** 所有骨骼 列表*/
    public boneNames: string[]
    private _currentClipIndex: number;
    private _animator: Animator;
    private _currentState: AnimatorState;
    private _controllerLayer: AnimatorControllerLayer;
    private _pixelDataOffset: number = 0;
    private _canBake: boolean = true;
    /** 是否忽略骨架*/
    private _ignoreSkeleton: boolean = false;

    private _keepNodeLists: Sprite3D[];
    private _savePath: string;

    constructor(fps: number, ignoreSkeleton: boolean, animatorObject: Sprite3D, savePath: string, errors: string[]) {
        this.bakeFPS = fps;
        this._savePath = savePath;
        this._ignoreSkeleton = ignoreSkeleton;
        this.deltaTime = 1.0 / fps;
        this.socketsBoneNames = [];
        let animator = this._animator = animatorObject.getComponent(Animator);

        if (animator.getControllerLayer(0) == undefined) {
            errors.push("The prefab's Animator should have a Animator Controller.")
            this._canBake = false;
            return;
        }
        let cloneObject: Sprite3D = this.animatorGameObject = animatorObject.clone() as Sprite3D;

        this.skinders = []
        this.getAllComponent(cloneObject, this.skinders, SkinnedMeshRenderer);
        this.boneNames = [];
        this.bones = [];
        this.bondPos = [];
        this._keepNodeLists = [];
        this.mergeBone();
        this.buildSocketBone();
        this.skinders.forEach((skin) => {
            if (skin instanceof SimpleSkinnedMeshRenderer) {
                errors.push("It's already a baking animation.")
                this._canBake = false;
            }
        })
        if (!this._canBake) {
            return;
        }
        let nodenames: string[] = []
        this.skinders.forEach((skin) => {
            if (nodenames.indexOf(skin.owner.name) < 0) {
                nodenames.push(skin.owner.name);
            } else {
                errors.push("the skinner names cannot be repeated.")
                this._canBake = false;
            }
        })
        if (!this._canBake) {
            return;
        }
        cloneObject.transform.position = Vector3.ZERO;
        cloneObject.transform.rotation = Quaternion.DEFAULT;
        cloneObject.transform.setWorldLossyScale(Vector3.ONE);
        animator = this.animator = cloneObject.getComponent(Animator);
        let layer: AnimatorControllerLayer = animator.getControllerLayer(0);
        //@ts-ignore
        let states: ReadonlyArray<AnimatorState> = layer.states;
        let clipStates: AnimatorState[] = this.stats = [];
        let usePixelNums: number = 0;
        let boneNums = this.boneNames.length;
        states.forEach((state) => {
            if (state.clip != undefined) {
                clipStates.push(state);
                let frameCount = BackAnimatorData.caculateClipPiel(state, this.bakeFPS);
                usePixelNums += BackAnimatorData.caculateFrameDataPiex(boneNums, frameCount);
            }
        })
        let textureWidth = BackAnimatorData.caculateTextureSize(usePixelNums);
        if (textureWidth > 2048) {
            errors.push("the animator data is too large!!!")
            this._canBake = false;
        }
        if (!this._canBake) {
            return;
        }
        this.textureWidth = textureWidth;
        this.pixelData = new Float32Array(textureWidth * textureWidth * 4);
        this.onStart()
    }
    public get canBake(): boolean {
        return this._canBake
    }
    private buildSocketBone() {
        let list: MeshRenderer[] = [];
        this.skinders.forEach((skiner) => {
            list.push(skiner);
            this.getAllComponent(skiner.rootBone, list, MeshRenderer);
        })
        let length = list.length;
        for (var i = 0; i < length; i++) {
            let target: Sprite3D = list[i].owner as Sprite3D;
            let nodeList: Sprite3D[] = [];
            while (target != undefined && target != this.animatorGameObject) {
                this._keepNodeLists.push(target)
                nodeList.unshift(target)
                target = target.parent as Sprite3D;
            }
            let nameList = []
            while (nodeList.length > 0) {
                target = nodeList.shift();
                nameList.push(target.name);
                let pathName = nameList.join(".")
                if (this.socketsBoneNames.indexOf(pathName) < 0) {
                    this.socketsBoneNames.push(pathName)
                }
            }
        }
    }
    private onStart() {
        this._clipDatas = [];
        this._currentClipIndex = 0;
        this._controllerLayer = this.animator.getControllerLayer(0);
        //清理动画遮罩
        this._controllerLayer.avatarMask = undefined;
        this._pixelDataOffset = 0;
        this._currentState = this.getClipState();
        this.onUpdate();
    }
    private getownerPath(module: Sprite3D): string[] {
        let ownerPath: string[] = []
        let nodes: Sprite3D = module;
        while (nodes != this.animatorGameObject) {
            ownerPath.unshift(nodes.name);
            nodes = nodes.parent as Sprite3D;
        }
        return ownerPath;
    }
    private createNewClip() {
        let state = this._currentState;
        let oldClip: AnimationClip = state.clip;
        var newClip: AnimationClip = new AnimationClip()
        let duration = (state.clipEnd - state.clipStart) * oldClip.duration();
        //@ts-ignore
        newClip._duration = duration;
        //@ts-ignore
        newClip._frameRate = this.bakeFPS;
        newClip.islooping = state.clip.islooping;
        let skinnerLength = this.skinders.length;
        //@ts-ignore
        var nodes: KeyframeNodeList = newClip._nodes!;
        nodes.count = skinnerLength * 2;
        //@ts-ignore
        var nodesMap: any = newClip._nodesMap = {};
        //@ts-ignore
        var nodesDic: any = newClip._nodesDic = {};
        var indexInList = 0;
        //@ts-ignore
        let olNodes: KeyframeNodeList = oldClip._nodes!;
        let nodeCount = olNodes.count;
        for (var i = 0; i < nodeCount; i++) {
            let kNode: KeyframeNode = olNodes.getNodeByIndex(i);
            //@ts-ignore
            let owerPath = kNode._ownerPath.join(".");
            if (this.socketsBoneNames.indexOf(owerPath) >= 0) {
                let copyNode: KeyframeNode = new KeyframeNode();
                //@ts-ignore
                copyNode._indexInList = indexInList;
                //@ts-ignore
                copyNode.type = kNode.type;
                //@ts-ignore
                copyNode._ownerPath = kNode._ownerPath.concat();
                //@ts-ignore
                copyNode._propertys = kNode._propertys.concat();
                //@ts-ignore
                copyNode._keyFrames = kNode._keyFrames.concat();
                //@ts-ignore
                copyNode.propertyOwner = kNode.propertyOwner;
                //@ts-ignore
                var nodePath: string = copyNode._joinOwnerPath("/");
                var mapArray: KeyframeNode[] = nodesMap[nodePath];
                (mapArray) || (nodesMap[nodePath] = mapArray = []);
                mapArray.push(copyNode);
                //@ts-ignore
                var fullPath: string = nodePath + "." + copyNode.propertyOwner + "." + copyNode._joinProperty(".");
                nodesDic[fullPath] = copyNode;
                //@ts-ignore
                copyNode.fullPath = fullPath;
                //@ts-ignore
                copyNode.nodePath = nodePath;
                nodes.setNodeByIndex(indexInList, copyNode);
                indexInList++;
            }
        }
        let tangent = (this.currentClipEndFrame - 1) / duration;
        for (var i = 0; i < skinnerLength; i++) {
            let skin: SkinnedMeshRenderer = this.skinders[i]
            let xnode: KeyframeNode = new KeyframeNode();
            //@ts-ignore
            xnode._indexInList = indexInList;
            //@ts-ignore
            xnode.type = KeyFrameValueType.Float;
            nodes.setNodeByIndex(indexInList, xnode);
            //@ts-ignore
            xnode._ownerPath = this.getownerPath(skin.owner);
            //@ts-ignore
            var nodePath: string = xnode._joinOwnerPath("/");
            var mapArray: KeyframeNode[] = nodesMap[nodePath];
            (mapArray) || (nodesMap[nodePath] = mapArray = []);
            mapArray.push(xnode);
            //@ts-ignore
            xnode.propertyOwner = "simpleSkinnedMeshRenderer";
            //@ts-ignore
            xnode._setPropertyByIndex(0, "simpleAnimatorOffset");
            //@ts-ignore
            xnode._setPropertyByIndex(1, "x");
            //@ts-ignore
            var fullPath: string = nodePath + "." + xnode.propertyOwner + "." + xnode._joinProperty(".");
            nodesDic[fullPath] = xnode;
            //@ts-ignore
            xnode.fullPath = fullPath;
            //@ts-ignore
            xnode.nodePath = nodePath;

            //@ts-ignore
            xnode._setKeyframeCount(2);
            var floatKeyframe: FloatKeyframe = new FloatKeyframe();
            floatKeyframe.inTangent = floatKeyframe.outTangent = floatKeyframe.inWeight = floatKeyframe.outWeight = 0;
            floatKeyframe.value = this._pixelDataOffset / 4;
            floatKeyframe.time = 0;
            //@ts-ignore
            xnode._setKeyframeByIndex(0, floatKeyframe)

            floatKeyframe = new FloatKeyframe();
            floatKeyframe.inTangent = floatKeyframe.outTangent = floatKeyframe.inWeight = floatKeyframe.outWeight = 0;
            floatKeyframe.value = this._pixelDataOffset / 4;
            floatKeyframe.time = duration;
            //@ts-ignore
            xnode._setKeyframeByIndex(1, floatKeyframe);
            indexInList++;


            let ynode: KeyframeNode = new KeyframeNode();
            //@ts-ignore
            ynode._indexInList = indexInList;
            //@ts-ignore
            ynode.type = KeyFrameValueType.Float;
            nodes.setNodeByIndex(indexInList, ynode);
            //@ts-ignore
            ynode._ownerPath = this.getownerPath(skin.owner);
            //@ts-ignore
            var nodePath: string = ynode._joinOwnerPath("/");
            var mapArray: KeyframeNode[] = nodesMap[nodePath];
            (mapArray) || (nodesMap[nodePath] = mapArray = []);
            mapArray.push(ynode);
            //@ts-ignore
            ynode.propertyOwner = "simpleSkinnedMeshRenderer";
            //@ts-ignore
            ynode._setPropertyByIndex(0, "simpleAnimatorOffset");
            //@ts-ignore
            ynode._setPropertyByIndex(1, "y");
            //@ts-ignore
            var fullPath: string = nodePath + "." + ynode.propertyOwner + "." + ynode._joinProperty(".");
            nodesDic[fullPath] = ynode;
            //@ts-ignore
            ynode.fullPath = fullPath;
            //@ts-ignore
            ynode.nodePath = nodePath;

            //@ts-ignore
            ynode._setKeyframeCount(2);
            var floatKeyframe: FloatKeyframe = new FloatKeyframe();
            floatKeyframe.inTangent = 0;
            floatKeyframe.outTangent = tangent;
            floatKeyframe.value = 0;
            floatKeyframe.time = 0;
            //@ts-ignore
            ynode._setKeyframeByIndex(0, floatKeyframe)

            floatKeyframe = new FloatKeyframe();
            floatKeyframe.outTangent = 0;
            floatKeyframe.inTangent = tangent;
            floatKeyframe.value = this.currentClipEndFrame - 1;
            floatKeyframe.time = duration;
            //@ts-ignore
            ynode._setKeyframeByIndex(1, floatKeyframe)
            indexInList++;
        }
        this._clipDatas.push(newClip);
    }

    private removeIgnoreSprite(node: Sprite3D) {
        if (node == undefined) {
            return;
        }

        for (var i = node.numChildren - 1; i >= 0; i--) {
            let child = node.getChildAt(i) as Sprite3D;
            if (this._keepNodeLists.indexOf(child) < 0) {
                child.removeSelf()
            } else {
                this.removeIgnoreSprite(child);
            }
        }
    }
    public async saveFiles() {
        let rootPath = fpath.join(EditorEnv.projectPath, this._savePath);
        if (!fs.existsSync(rootPath))
            fs.mkdirSync(rootPath, { recursive: true });
        rootPath = fpath.relative(EditorEnv.assetsPath, rootPath);
        for (var i = 0, n = this.skinders.length; i < n; i++) {
            let skiner: SkinnedMeshRenderer = this.skinders[i];
            (<Sprite3D>skiner.owner.parent).transform.worldMatrix.invert(TempMat);
            let skinSprite: Sprite3D = skiner.owner as Sprite3D;
            skinSprite.transform.localMatrix = TempMat;

            //@ts-ignore
            skiner.localBounds._tranform(TempMat, skiner.localBounds);
            skiner.rootBone = skiner.owner as Sprite3D;
        }

        //删除可忽略的动画节点
        if (this._ignoreSkeleton) {
            this.removeIgnoreSprite(this.animatorGameObject);
        }
        let lhContent = IEditorEnv.HierarchyWriter.write(this.animatorGameObject);
        // 贴图
        let simpAssets = EditorEnv.assetMgr.createFileAsset(fpath.join(rootPath, this.animatorGameObject.name + ".ktx"));
        await BakeAnimatorUtils.textureToKTX(this.pixelData, this.textureWidth, this.textureWidth, EditorEnv.assetMgr.getFullPath(simpAssets), "RGBA32")
        EditorEnv.assetMgr.setMetaData(simpAssets, { importer: { "sRGB": false, "filterMode": 0, "generateMipmap": false } });

        const assetData: any = await Laya.loader.load("res://" + this._animator.controller.uuid);
        let jsonData = assetData.data;
        let animRoot = fpath.join(rootPath, "anim");
        let controllerLayers = jsonData.controllerLayers;
        let stateMap: any = {}
        controllerLayers[0].states.forEach((element: any) => {
            let str = JSON.stringify(element);
            stateMap[element.name] = JSON.parse(str);
        });

        if (!fs.existsSync(animRoot))
            fs.mkdirSync(animRoot, { recursive: true });
        let animComp = lhContent._$comp.find((comp: { _$type: string; }) => comp._$type == "Animator")
        animComp.controllerLayers.length = 1;
        let layerData = animComp.controllerLayers[0];
        let state = [];
        state.push(stateMap["进入"])

        state.push(stateMap["任何状态"])
        //存储动画
        for (var i = 0, n = this._clipDatas.length; i < n; i++) {
            let clip: AnimationClip = this._clipDatas[i];
            let animName: string = layerData.states[i].name;
            let stateData = stateMap[animName]
            let clipUrl = fpath.join(animRoot, animName + ".lani");
            let clipData: ArrayBuffer = IEditorEnv.CreateAssetUtil.writeAnimationClip(clip);
            let asset = EditorEnv.assetMgr.createFileAsset(clipUrl);
            fs.writeFileSync(EditorEnv.assetMgr.getFullPath(asset), new Uint8Array(clipData));
            stateData.clip = { "_$uuid": asset.id };
            state.push(stateData)
        }
        layerData.states = state;
        let meshData: Map<string, any> = new Map<string, any>();
        this.findNode(lhContent, meshData);
        let animController = EditorEnv.assetMgr.createFileAsset(fpath.join(rootPath, this.animatorGameObject.name + ".controller"));
        await IEditorEnv.utils.writeJsonAsync(EditorEnv.assetMgr.getFullPath(animController), animComp)
        delete layerData.states;

        //存储模型
        for (var i = 0, n = this.skinders.length; i < n; i++) {
            let skiner: SkinnedMeshRenderer = this.skinders[i]
            let owner: Sprite3D = skiner.owner as Sprite3D;
            let mesh: Mesh = owner.getComponent(MeshFilter).sharedMesh;


            let bakemesh: Mesh = BakeAnimatorUtils.createNewMesh(mesh, this.boneNames, this.bondPos);
            let meshbuff = IEditorEnv.CreateAssetUtil.writeMesh(bakemesh);
            let meshUrl = fpath.join("mesh", owner.name + ".lm");
            let asset = EditorEnv.assetMgr.createFileAsset(fpath.join(rootPath, meshUrl));
            fs.writeFileSync(EditorEnv.assetMgr.getFullPath(asset), new Uint8Array(meshbuff));
            let skinNode = meshData.get(skiner.owner.name);
            let filter = skinNode._$comp.find((comp: { _$type: string; }) => comp._$type == "MeshFilter")
            filter.sharedMesh._$uuid = asset.id;
            let renderData = skinNode._$comp.find((comp: { _$type: string; }) => comp._$type == "SkinnedMeshRenderer")
            renderData._$type = "SimpleSkinnedMeshRenderer";
            renderData._bonesNums = this.boneNames.length;
            renderData.simpleAnimatorTexture = {
                _$type: "Texture2D",
                _$uuid: simpAssets.id
            }
        }
        animComp.controller = {
            "_$uuid": animController.id,
            "_$type": "AnimationController"
        }
        let asset = EditorEnv.assetMgr.createFileAsset(fpath.join(rootPath, this.animatorGameObject.name + ".lh"));
        await IEditorEnv.utils.writeJsonAsync(EditorEnv.assetMgr.getFullPath(asset), lhContent)
    }

    private findNode(lh: any, list: Map<string, any>) {
        let visitNode = (nodeData: any) => {
            if (nodeData._$child) {
                for (let child of nodeData._$child) {
                    if (visitNode(child))
                        return true;
                }
            }
            if (nodeData._$comp) {
                let renderdata = nodeData._$comp.find((comp: { _$type: string; }) => comp._$type == "SkinnedMeshRenderer")
                if (renderdata != undefined) {
                    list.set(nodeData.name, nodeData)
                }
            }

            return false;
        };

        visitNode(lh);
    }



    onUpdate(): void {
        if (!this.isUpdate) {
            return;
        }
        if (this._currentState == undefined) {
            this.isUpdate = false;
            return
        }


        var animatorState: AnimatorState = this._currentState;
        let clip: AnimationClip = animatorState.clip;
        //@ts-ignore
        var clipDuration = clip!._duration;
        let curPlayTime = animatorState.clipStart * clipDuration + this.currentFrame * this.deltaTime;
        //@ts-ignore
        clip._evaluateClipDatasRealTime(clip._nodes, curPlayTime, animatorState._currentFrameIndices, false, true, animatorState._realtimeDatas, null)
        //@ts-ignore
        this.animator._setClipDatasToNode(animatorState, false, 1, true, this._controllerLayer);

        //计算最后数据
        this.caculateSkinMatrixData();
        this.currentFrame++;
        if (this.currentFrame >= this.currentClipEndFrame) {
            this.createNewClip()
            this._pixelDataOffset += BackAnimatorData.caculateFrameDataPiex(this.bones.length, this.currentClipEndFrame) * 4;
            this._currentState = this.getClipState()
        }
        this.onUpdate();
    }
    private caculateSkinMatrixData() {
        let boneslen = this.bones.length;
        let offset = this._pixelDataOffset + BackAnimatorData.caculateFrameDataPiex(boneslen, this.currentFrame) * 4;
        for (var i = 0; i < boneslen; i++) {
            let bonee = this.bones[i].transform.worldMatrix.elements;
            let bindPosee = this.bondPos[i].elements;
            Utils3D.mulMatrixByArray(bonee, 0, bindPosee, 0, this.pixelData, offset + i * 16);
        }
    }
    private getClipState(): AnimatorState {
        let stat = this.stats[this._currentClipIndex]
        if (stat == null) {
            return null;
        }
        this.currentFrame = 0;
        this.currentClipEndFrame = BackAnimatorData.caculateClipPiel(stat, this.bakeFPS);
        this._currentClipIndex++;
        return stat;
    }
    private getAllComponent<T extends Component>(object: Sprite3D, list: any[], componentType: new () => T) {
        if (object == undefined) {
            return;
        }
        let comp = object.getComponent(componentType);
        if (comp != undefined && list.indexOf(comp) < 0) {
            list.push(comp)
        }
        for (var i = 0, n = object.numChildren; i < n; i++) {
            this.getAllComponent(object.getChildAt(i) as Sprite3D, list, componentType)
        }
    }

    private mergeBone() {
        for (let i = 0, n = this.skinders.length; i < n; i++) {
            let bones: Map<string, Sprite3D> = new Map<string, Sprite3D>()
            this.skinders[i].bones.forEach((bone) => {
                bones.set(bone.name, bone);
            })

            let mesh: Mesh = this.skinders[i].owner.getComponent(MeshFilter).sharedMesh;
            //@ts-ignore
            let boneNames: String = mesh._boneNames;
            let bonePose = mesh.inverseAbsoluteBindPoses;
            for (let j = 0; j < boneNames.length; j++) {
                let boneName = boneNames[j];

                if (this.boneNames.indexOf(boneName) < 0) {
                    this.boneNames.push(boneName);
                    this.bones.push(bones.get(boneName));
                    this.bondPos.push(bonePose[j]);
                }
            }
        }
    }
    public static caculateClipPiel(stata: AnimatorState, fps: number) {
        //@ts-ignore
        var clipDuration: number = stata._clip!._duration;
        var calclipduration = clipDuration * (stata.clipEnd - stata.clipStart);
        return Math.floor(calclipduration * fps + 0.5) + 1;
    }
    public static caculateFrameDataPiex(boneNums: number, frameCount: number) {
        return frameCount * boneNums * 4;
    }

    private static caculateTextureSize(usePixelNums: number): number {
        let pixelNums = Math.pow(2, Math.ceil(Math.log2(Math.sqrt(usePixelNums))));
        return Math.max(pixelNums, 32);
    }

}