import { Sprite } from "../../display/Sprite"
import { Matrix } from "../../maths/Matrix"
import { Context } from "../../renders/Context"
import { SubmitBase } from "../submit/SubmitBase"
import { CharRenderInfo } from "../text/CharRenderInfo"
import { Sprite2DGeometry } from "../utils/Sprite2DGeometry"
import { MeshQuadTexture } from "../utils/MeshQuadTexture"
import { MeshTexture } from "../utils/MeshTexture"
import { MeshVG } from "../utils/MeshVG"

/**
 * 对象 cacheas normal的时候，本质上只是想把submit缓存起来，以后直接执行
 * 为了避免各种各样的麻烦，这里采用复制相应部分的submit的方法。执行环境还是在原来的context中
 * 否则包括clip等都非常难以处理
 */
export class WebGLCacheAsNormalCanvas {
    submitStartPos = 0;	// 对应的context的submit的开始的地方
    submitEndPos = 0;
    context: Context;
    touches: CharRenderInfo[] = [];		//记录的文字信息。cacheas normal的话，文字要能正确touch
    submits: any[] = [];		// 从context中剪切的submit
    sprite: Sprite | null = null;	// 对应的sprite对象

    // submit需要关联稳定独立的mesh。所以这里要创建自己的mesh对象
    /**@internal */
    _mesh: MeshQuadTexture;			//用Mesh2D代替_vb,_ib. 当前使用的mesh
    private _pathMesh: MeshVG;			//矢量专用mesh。
    private _triangleMesh: MeshTexture;	//drawTriangles专用mesh。由于ib不固定，所以不能与_mesh通用
    meshlist: Sprite2DGeometry[] = [];			//本context用到的mesh

    // 原始context的原始值
    private _oldMesh: MeshQuadTexture | null;
    private _oldPathMesh: MeshVG | null;
    private _oldTriMesh: MeshTexture | null;
    private _oldMeshList: any[];

    // cache的时候对应的clip
    private cachedClipInfo: Matrix = new Matrix();	// 用来判断是否需要把cache无效
    //private var oldMatrix:Matrix = null;				//本地画的时候完全不应用矩阵，所以需要先保存老的，以便恢复		这样会丢失缩放信息，导致文字模糊，所以不用这种方式了
    private oldTx = 0;
    private oldTy = 0;
    private static matI: Matrix = new Matrix();

    // 创建这个canvas的时候对应的矩阵的逆矩阵。因为要保留矩阵的缩放信息。所以采用逆矩阵的方法。
    invMat: Matrix = new Matrix();

    constructor(ctx: Context, sp: Sprite) {
        this.context = ctx;
        this.sprite = sp;
        ctx._globalClipMatrix.copyTo(this.cachedClipInfo);
    }

    startRec(): void {
        // let context = this.context;
        // // 如果有文字优化，这里要先提交一下
        // if (context._charSubmitCache && context._charSubmitCache._enable) {
        //     context._charSubmitCache.enable(false, context);
        //     context._charSubmitCache.enable(true, context);
        // }
        // context._incache = true;
        // this.touches.length = 0;
        // //记录需要touch的文字资源
        // (<any>context).touches = this.touches;
        // context._globalClipMatrix.copyTo(this.cachedClipInfo);

        // this.submits.length = 0;
        // this.submitStartPos = context._submits._length;

        // this.meshlist.length = 0;

        // this._mesh = new MeshQuadTexture();
        // this._pathMesh = new  MeshVG();
        // this._triangleMesh = new MeshTexture();

        // this.meshlist.push(this._mesh);
        // this.meshlist.push(this._pathMesh);
        // this.meshlist.push(this._triangleMesh);

        // // 打断合并
        // context._curSubmit = SubmitBase.RENDERBASE;
        // // 接管context中的一些值
        // // this._oldMesh = context._mesh;
        // // this._oldPathMesh = context._pathMesh;
        // // this._oldTriMesh = context._triangleMesh;
        // // this._oldMeshList = context.meshlist;

        // // context._mesh = this._mesh;
        // // context._pathMesh = this._pathMesh;
        // // context._triangleMesh = this._triangleMesh;
        // // context.meshlist = this.meshlist;

        // // 要取消位置，因为以后会再传入位置。这里好乱
        // this.oldTx = context._curMat.tx;
        // this.oldTy = context._curMat.ty;
        // context._curMat.tx = 0;
        // context._curMat.ty = 0;

        // // 取消缩放等
        // context._curMat.copyTo(this.invMat);
        // this.invMat.invert();
        // //oldMatrix = context._curMat;
        // //context._curMat = matI;
    }

    endRec(): void {
        // let context = this.context;
        // // 如果有文字优化，这里要先提交一下
        // if (context._charSubmitCache && context._charSubmitCache._enable) {
        //     context._charSubmitCache.enable(false, context);
        //     context._charSubmitCache.enable(true, context);
        // }
        // // copy submit
        // var parsubmits: any = context._submits;
        // this.submitEndPos = parsubmits._length;
        // var num= this.submitEndPos - this.submitStartPos;
        // for (var i= 0; i < num; i++) {
        //     this.submits.push(parsubmits[this.submitStartPos + i]);
        // }
        // parsubmits._length -= num;

        // // 恢复原始context的值
        // // context._mesh = this._oldMesh;
        // // context._pathMesh = this._oldPathMesh;
        // // context._triangleMesh = this._oldTriMesh;
        // // context.meshlist = this._oldMeshList;

        // // 打断合并
        // context._curSubmit = SubmitBase.RENDERBASE;
        // // 恢复matrix
        // //context._curMat = oldMatrix;
        // context._curMat.tx = this.oldTx;
        // context._curMat.ty = this.oldTy;
        // (<any>context).touches = null;
        // context._incache = false;
    }


    isTextNeedRestore(): boolean {
        var textNeedRestore = false;
        var charRIs = this.touches;
        if (charRIs) {
            for (var ci = 0; ci < charRIs.length; ci++) {
                if (charRIs[ci].deleted) {
                    textNeedRestore = true;
                    break;
                }
            }
        }
        return textNeedRestore;
    }
    flushsubmit(): void {
        var curSubmit = SubmitBase.RENDERBASE;
        this.submits.forEach((subm: SubmitBase) => {
            if (subm == SubmitBase.RENDERBASE) return;
            //// ni SubmitBase.preRender = curSubmit;
            curSubmit = subm;
            //// ni subm.renderSubmit();
        });
    }

    releaseMem(): void {

    }
}