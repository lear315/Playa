import Mesh = Laya.Mesh;
import Matrix4x4 = Laya.Matrix4x4;
import Vector4 = Laya.Vector4;
import Vector3 = Laya.Vector3;

import * as fpath from 'path';
import * as fs from "fs";
import * as os from "os";

const HelpMat1: Matrix4x4 = new Matrix4x4();
const HelpMat2: Matrix4x4 = new Matrix4x4();

const addMatrixScale = function (left: Matrix4x4, right: Matrix4x4, scale: number) {
    if (scale == 0) {
        return;
    }

    let leftE: Float32Array = left.elements;
    let rightE: Float32Array = right.elements;
    for (var i = 0; i < 16; i++) {
        leftE[i] += rightE[i] * scale;
    }
}

@IEditorEnv.regClass()
export class BakeAnimatorUtils {

    static async textureToKTX(buffer: ArrayBufferView, w: number, h: number, outputPath: string, textureFormat = "RGBA32") {

        var tmpPath = os.tmpdir();
        let filePath = fpath.join(tmpPath, `tmpCube.bin`);
        fs.writeFileSync(filePath, buffer as any);
        var args: string[] = [];

        args.push("-w", w.toString(), "-h", h.toString(), "-f", textureFormat, "-i", filePath, "-o", outputPath);
        let ret = await IEditorEnv.utils.runTool("KtxPixelTool", args);
        if (ret.code != 0) {
            console.error(`KtxPixelTool failed with '${ret.output}'`);
            return false
        }
        return true
    }

    private static _boneIndexs: Vector4[]
    private static _boneWigths: Vector4[];
    private static _positions: Vector3[];
    private static _normals: Vector3[];

    private static updateBoneIndex(mergeboneLists: number[], mergeBones: Matrix4x4[], oldBones: Matrix4x4[], ibs: number[]) {
        let index: number = 0;
        let weight: number = 0;
        for (var i = 0, n = ibs.length; i < n; i++) {
            let vbIndex = ibs[i];

            //求累积权重
            Matrix4x4.ZERO.cloneTo(HelpMat1);
            Matrix4x4.ZERO.cloneTo(HelpMat2);
            let boneWeight: Vector4 = this._boneWigths[vbIndex];
            let boneIndex: Vector4 = this._boneIndexs[vbIndex];
            index = boneIndex.x;
            weight = boneWeight.x;
            addMatrixScale(HelpMat1, mergeBones[index], weight);
            addMatrixScale(HelpMat2, oldBones[index], weight);

            index = boneIndex.y;
            weight = boneWeight.y;
            addMatrixScale(HelpMat1, mergeBones[index], weight);
            addMatrixScale(HelpMat2, oldBones[index], weight);

            index = boneIndex.z;
            weight = boneWeight.z;
            addMatrixScale(HelpMat1, mergeBones[index], weight);
            addMatrixScale(HelpMat2, oldBones[index], weight);

            index = boneIndex.w;
            weight = boneWeight.w;
            addMatrixScale(HelpMat1, mergeBones[index], weight);
            addMatrixScale(HelpMat2, oldBones[index], weight);

            HelpMat2.invert(HelpMat2);
            Matrix4x4.multiply(HelpMat2, HelpMat1, HelpMat2);
            //修改顶点坐标
            let position: Vector3 = this._positions[vbIndex]
            Vector3.transformCoordinate(position, HelpMat2, position);
            //修改法线
            let normail = this._normals[vbIndex]
            Vector3.TransformNormal(normail, HelpMat2, normail);
            Vector3.normalize(normail, normail);
            //重置骨骼索引
            boneIndex.x = mergeboneLists[boneIndex.x];
            boneIndex.y = mergeboneLists[boneIndex.y];
            boneIndex.z = mergeboneLists[boneIndex.z];
            boneIndex.w = mergeboneLists[boneIndex.w];
        }
    }

    static createNewMesh(orimesh: Mesh, boneNames: string[], bondPos: Matrix4x4[]): Mesh {
        let mesh = orimesh.clone() as Mesh;
        this._boneIndexs = [];
        mesh.getBoneIndices(this._boneIndexs);
        this._boneWigths = []
        mesh.getBoneWeights(this._boneWigths);
        this._positions = []
        mesh.getPositions(this._positions);
        this._normals = []
        mesh.getNormals(this._normals);
        let inverseAbsoluteBindPoses: Matrix4x4[] = orimesh.inverseAbsoluteBindPoses
        let boneNameIndex: number[] = []
        let boneBindPos: Matrix4x4[] = []
        //@ts-ignore
        mesh._boneNames.forEach((boneName) => {
            let index = boneNames.indexOf(boneName)
            boneNameIndex.push(index);
            boneBindPos.push(bondPos[index]);
        })
        //@ts-ignore
        let submeshs = mesh._subMeshes;
        let ib = orimesh.getIndices();
        for (var i = 0, subMeshCount = submeshs.length; i < subMeshCount; i++) {
            let subMesh = submeshs[i];
            var subIndexBufferStart: number[] = subMesh._subIndexBufferStart;
            var subIndexBufferCount: number[] = subMesh._subIndexBufferCount;
            //@ts-ignore
            var boneIndicesLists: Uint16Array[] = subMesh._boneIndicesList;
            let drawCount: number = subIndexBufferCount.length;
            for (let k = 0; k < drawCount; k++) {
                let mergeboneLists: number[] = [];
                let mergeBones: Matrix4x4[] = [];
                let oldBones: Matrix4x4[] = []
                boneIndicesLists[k].forEach((value) => {
                    mergeboneLists.push(boneNameIndex[value]);
                    mergeBones.push(boneBindPos[value]);
                    oldBones.push(inverseAbsoluteBindPoses[value])
                })
                let startIndex = subIndexBufferStart[k];
                let count = subIndexBufferCount[k];
                let sorlist = Array.from(new Set(ib.slice(startIndex, startIndex + count)));
                sorlist = sorlist.sort((a, b) => {
                    return a - b;
                });
                this.updateBoneIndex(mergeboneLists, mergeBones, oldBones, sorlist);
            }
            subMesh._subIndexBufferStart = [subMesh._indexStart];
            subMesh._subIndexBufferCount = [subMesh._indexCount];
            subMesh._boneIndicesList = [new Uint16Array([1, 2, 3])];
        }
        //重新设置顶点数据到mesh上
        mesh.setPositions(this._positions);
        mesh.setNormals(this._normals);
        mesh.setBoneIndices(this._boneIndexs);
        this._boneIndexs = null;
        this._boneWigths = null;
        this._positions = null;
        this._normals = null;
        return mesh;
    }

}