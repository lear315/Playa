import Mesh = Laya.Mesh;
import VertexBuffer3D = Laya.VertexBuffer3D;
import LayaGL = Laya.LayaGL;
import BufferUsage = Laya.BufferUsage;
import IndexBuffer3D = Laya.IndexBuffer3D;
import IndexFormat = Laya.IndexFormat;
import VertexDeclaration = Laya.VertexDeclaration;
import Vector4 = Laya.Vector4;

import { MeshoptSimplifier } from "./meshopt_simplifier.module";


export class MeshSimplifyToolUtil {

    /**
     * 简化Mesh
     * @param mesh 
     * @param targetRate 0-1
     * @param lockBorder 边界是否保存
     */
    simplyfyMesh(mesh: Mesh, targetRate: number, lockBorder: boolean = true): Mesh {
        targetRate = Math.min(Math.max(targetRate, 0.01), 1.0);

        //@ts-ignore
        let state = mesh._bufferState;
        //@ts-ignore
        let vb = mesh._vertexBuffer;
        let vbPos = new Float32Array(vb.getFloat32Data());
        let vbPos8 = new Uint8Array(vb.getUint8Data());
        let stride = vb.vertexDeclaration.vertexStride / 4;
        let stridebyte = vb.vertexDeclaration.vertexStride;
        let ib = new Uint16Array(state._bindedIndexBuffer._buffer);
        //@ts-ignore
        let submeshs = mesh._subMeshes;
        let submeshSimplyIBs: Array<Uint16Array | Float32Array> = [];
        let startInfos: Array<number[]> = []
        let ibCount: number = 0;
        for (let i = 0, n = submeshs.length; i < n; i++) {
            let submesh = submeshs[i];
            let subInfo = []
            var subIndexBufferStart: number[] = submesh._subIndexBufferStart;
            var subIndexBufferCount: number[] = submesh._subIndexBufferCount;
            for (var j = 0, kn = subIndexBufferStart.length; j < kn; j++) {
                let spliceib = ib.slice(subIndexBufferStart[j], subIndexBufferStart[j] + subIndexBufferCount[j]);
                let submeshSimplyIB: Uint16Array | Float32Array = undefined
                try {
                    submeshSimplyIB = (this.simplyfiyIb(vbPos, spliceib, stride, targetRate, lockBorder) as any)[0]

                } catch {
                    //失败了
                    return null;
                }
                submeshSimplyIBs.push(submeshSimplyIB);
                subInfo.push(ibCount, submeshSimplyIB.length)
                ibCount += submeshSimplyIB.length;
            }
            startInfos.push(subInfo)

        }
        let newibdatas: Array<number> = [];
        //拼接新ib
        for (let i = 0, n = submeshSimplyIBs.length; i < n; i++) {
            newibdatas = newibdatas.concat(Array.from(submeshSimplyIBs[i]));
        }

        let compressDatas = this.compressIndex(newibdatas)
        let sorlist = compressDatas.list;
        let newvbDatas: Uint8Array = new Uint8Array(sorlist.length * stridebyte);
        //拼接新vb
        for (let i = 0, n = sorlist.length; i < n; i++) {
            let index = sorlist[i];
            newvbDatas.set(vbPos8.slice(index * stridebyte, (index + 1) * stridebyte), i * stridebyte)
        }


        return this.createNewMesh(mesh, new Float32Array(newvbDatas.buffer), vb.vertexDeclaration, compressDatas.data, startInfos);
    }

    /**
     * 根据压缩率输出压缩IB
     * @param vb 顶点
     * @param ib 
     * @param vbDeclar 
     * @param targetRate 
     * @param lockBorder 
     * @returns 
     */
    private simplyfiyIb(vb: Float32Array, ib: Uint16Array | Uint32Array, vbDeclar: number, targetRate: number, lockBorder: boolean = true): [Uint32Array, number] {
        let target = ib.length * targetRate;
        target -= target % 3;
        let newib = MeshoptSimplifier.simplify(ib, vb, vbDeclar, target, 0.01, lockBorder ? ["LockBorder"] : null);
        return newib;
    }

    private compressIndex(ib: Array<number>): any {
        if (ib.length > 65536) {
            //float32Array TODO
        }
        let sorlist = ib.slice(0, ib.length);
        //去重
        sorlist = Array.from(new Set(sorlist));
        sorlist = sorlist.sort((a, b) => {
            return a - b;
        });
        for (let i = 0, n = ib.length; i < n; i++) {
            ib[i] = sorlist.indexOf(ib[i]);
        }

        return {
            list: sorlist,
            data: new Uint16Array(ib)
        };
    }

    private createNewMesh(orimesh: Mesh, vb: Float32Array, vertexDeclaration: VertexDeclaration, ib: Uint16Array, startInfos: Array<number[]>) {
        let mesh = orimesh.clone() as Mesh;
        var vertexBuffer: VertexBuffer3D = Laya.Laya3DRender.renderOBJCreate.createVertexBuffer3D(vb.length * 4, BufferUsage.Static, true);
        vertexBuffer.vertexDeclaration = vertexDeclaration;
        vertexBuffer.setData(vb.buffer);
        //@ts-ignore
        mesh._vertexBuffer = vertexBuffer;
        //@ts-ignore
        mesh._vertexCount = vertexBuffer._byteLength / vertexDeclaration.vertexStride;
        var indexBuffer: IndexBuffer3D = Laya.Laya3DRender.renderOBJCreate.createIndexBuffer3D(IndexFormat.UInt16, ib.length, BufferUsage.Static, true);
        indexBuffer.setData(ib);
        //@ts-ignore
        mesh._indexBuffer = indexBuffer;
        //@ts-ignore
        mesh._setBuffer(vertexBuffer, indexBuffer);
        //@ts-ignore
        let submeshs = mesh._subMeshes;

        // let start = 0;
        for (let i = 0; i < submeshs.length; i++) {
            let startInfo: number[] = startInfos[i];
            let submesh = submeshs[i]
            submesh._vertexBuffer = vertexBuffer;
            submesh._indexBuffer = indexBuffer;
            var subIndexBufferStart: number[] = submesh._subIndexBufferStart;
            var subIndexBufferCount: number[] = submesh._subIndexBufferCount;
            let drawCount: number = subIndexBufferStart.length;
            let indexCount: number = 0;
            for (var j = 0; j < drawCount; j++) {
                subIndexBufferStart[j] = startInfo[j * 2]
                indexCount += subIndexBufferCount[j] = startInfo[j * 2 + 1]
            }
            submesh._setIndexRange(startInfo[0], indexCount);
        }
        mesh.bounds = orimesh.bounds;
        return mesh;
    }


}