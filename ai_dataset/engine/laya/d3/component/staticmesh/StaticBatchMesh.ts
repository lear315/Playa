import { Matrix4x4 } from "../../../maths/Matrix4x4";
import { BufferUsage } from "../../../RenderEngine/RenderEnum/BufferTargetType";
import { IndexFormat } from "../../../RenderEngine/RenderEnum/IndexFormat";
import { VertexMesh } from "../../../RenderEngine/RenderShader/VertexMesh";
import { BufferState } from "../../../webgl/utils/BufferState";
import { BlinnPhongMaterial } from "../../core/material/BlinnPhongMaterial";
import { Material } from "../../../resource/Material";
import { Sprite3D } from "../../core/Sprite3D";
import { IndexBuffer3D } from "../../graphics/IndexBuffer3D";
import { VertexBuffer3D } from "../../graphics/VertexBuffer3D";
import { Bounds } from "../../math/Bounds";
import { Laya3DRender } from "../../RenderObjs/Laya3DRender";
import { Utils3D } from "../../utils/Utils3D";
import { StaticBatchSubMesh } from "./StaticBatchSubMesh";
import { StaticMeshMergeInfo } from "./StaticMeshMergeInfo";


const tempMatrix = new Matrix4x4;

const TriangleIndices = [0, 1, 2];
const InvertTriangleIndices = [0, 2, 1];

/**
 * @en Represents a static batch mesh for efficient rendering of multiple static meshes.
 * @zh 用于高效渲染多个静态网格的静态批处理网格。
 */
export class StaticBatchMesh {

    /**
     * @en Creates a new StaticBatchMesh instance based on the provided merge information.
     * @param info The static mesh merge information.
     * @returns A new StaticBatchMesh instance.
     * @zh 根据提供的合并信息创建一个新的静态合批实例。
     * @param info 静态网格合并信息。
     * @returns 一个新的静态合批实例。
     */
    static create(info: StaticMeshMergeInfo): StaticBatchMesh {
        let staticMesh = new StaticBatchMesh();

        let vertexCount = info.vertexCount;
        let indexCount = info.indexCount;
        let vertexDec = info.vertexDec;
        let vertexFloatStride = vertexDec.vertexStride / 4;
        let vertexData = new ArrayBuffer(vertexDec.vertexStride * vertexCount);
        let vertexFloatArray = new Float32Array(vertexData);

        let mergeIndexFormat = IndexFormat.UInt16;
        let mergeIndexByteCount = 2;

        let indexArray: Uint16Array | Uint32Array;

        if (vertexCount > 65535) {
            mergeIndexFormat = IndexFormat.UInt32;
            mergeIndexByteCount = 4;
            indexArray = new Uint32Array(indexCount);
        }
        else {
            indexArray = new Uint16Array(indexCount);
        }

        // let positionElement = vertexDec.getVertexElementByUsage(VertexMesh.MESH_POSITION0);
        // let normalElement = vertexDec.getVertexElementByUsage(VertexMesh.MESH_NORMAL0);
        // let lightmapUVElement = vertexDec.getVertexElementByUsage(VertexMesh.MESH_TEXTURECOORDINATE1);
        // let tangentElement = vertexDec.getVertexElementByUsage(VertexMesh.MESH_TANGENT0);

        let vertexDataOffset = 0;
        let vertexCountOffset = 0;
        let indexOffset = 0;

        let bounds: Bounds;

        for (const render of info.renders) {
            let lightmapScaleOffset = render.lightmapScaleOffset;

            if (!bounds) {
                bounds = staticMesh.bounds;
                render.bounds.cloneTo(bounds);
            }

            Bounds.merge(bounds, render.bounds, bounds);

            let sp = <Sprite3D>render.owner;
            let invertFront = sp.transform._isFrontFaceInvert;
            let worldMat = sp.transform.worldMatrix;
            let normalMat = tempMatrix;
            worldMat.invert(normalMat);
            normalMat.transpose();

            let mesh = render.getMesh();
            let meshVertexCount = mesh.vertexCount;
            let meshIndexCount = mesh.indexCount;

            // todo 复制数据
            // todo 是否存在根节点
            let meshVertexData = mesh._vertexBuffer.getFloat32Data();
            vertexFloatArray.set(meshVertexData, vertexDataOffset);

            // todo 根据 vertex element 数据类型转换数据
            for (let index = 0; index < meshVertexCount; index++) {
                let elementOffset = index * vertexFloatStride;
                for (const element of vertexDec._vertexElements) {
                    elementOffset += element.offset / 4;
                    switch (element.elementUsage) {
                        case VertexMesh.MESH_POSITION0:
                            Utils3D.transformVector3ArrayToVector3ArrayCoordinate(meshVertexData, elementOffset, worldMat, vertexFloatArray, vertexDataOffset + elementOffset);
                            break;
                        case VertexMesh.MESH_NORMAL0:
                        case VertexMesh.MESH_TANGENT0:
                            Utils3D.transformVector3ArrayToVector3ArrayNormal(meshVertexData, elementOffset, normalMat, vertexFloatArray, vertexDataOffset + elementOffset);
                            break;
                        case VertexMesh.MESH_TEXTURECOORDINATE1:
                            Utils3D.transformLightingMapTexcoordArray(meshVertexData, elementOffset, lightmapScaleOffset, vertexFloatArray, vertexDataOffset + elementOffset);
                            break;
                    }
                }
            }

            let meshIndexData = mesh._indexBuffer.getData();
            // todo 非三角形渲染方式
            let triangleIndices = invertFront ? InvertTriangleIndices : TriangleIndices;
            for (let index = 0; index < meshIndexCount; index += 3) {
                indexArray[indexOffset + index] = meshIndexData[index + triangleIndices[0]] + vertexCountOffset;
                indexArray[indexOffset + index + 1] = meshIndexData[index + triangleIndices[1]] + vertexCountOffset;
                indexArray[indexOffset + index + 2] = meshIndexData[index + triangleIndices[2]] + vertexCountOffset;
            }

            let subMeshCount = mesh.subMeshCount;

            for (let index = 0; index < subMeshCount; index++) {
                // todo default material
                let material = render.sharedMaterials[index] || BlinnPhongMaterial.defaultMaterial;
                let staticSubMesh = staticMesh._staticSubMeshes.get(material);
                if (!staticSubMesh) {
                    staticSubMesh = new StaticBatchSubMesh();
                    staticSubMesh.indexByteCount = mergeIndexByteCount;
                    staticMesh._staticSubMeshes.set(material, staticSubMesh);
                    staticSubMesh.bufferState = staticMesh._bufferState;
                    staticSubMesh.indexFormat = mergeIndexFormat;
                }

                let subMesh = mesh.getSubMesh(index);
                // submesh bounds 使用 mesh bounds 代替
                // 视锥裁剪仍按照整个mesh
                // todo 换成单独的包围盒 ？
                staticSubMesh.addSubMesh(subMesh.indexCount, subMesh._indexStart + indexOffset, render.bounds);
            }

            vertexDataOffset += meshVertexData.length;
            vertexCountOffset += meshVertexCount;
            indexOffset += meshIndexData.length;
        }

        let vertexBuffer = Laya3DRender.renderOBJCreate.createVertexBuffer3D(vertexData.byteLength, BufferUsage.Static, false);
        vertexBuffer.vertexDeclaration = vertexDec;
        vertexBuffer.setData(vertexData);

        let indexBuffer = Laya3DRender.renderOBJCreate.createIndexBuffer3D(mergeIndexFormat, indexCount, BufferUsage.Static, false);
        indexBuffer.setData(indexArray);

        staticMesh.setBuffer(vertexBuffer, indexBuffer);

        return staticMesh;
    }
    /**@internal */
    _bufferState: BufferState;
    /**@internal */
    _vertexBuffer: VertexBuffer3D;
    /**@internal */
    _indexBuffer: IndexBuffer3D;
    /**@internal */
    _staticSubMeshes: Map<Material, StaticBatchSubMesh>;

    /**
     * @en The bounding volume of the static batch mesh.
     * @zh 静态批处理网格的边界体积。
     */
    bounds: Bounds;

    /**
     * @en Constructs, initializes a new static batch mesh.
     * @zh 构造方法，初始化静态网格合批。
     */
    constructor() {
        this._bufferState = new BufferState();
        this._staticSubMeshes = new Map();
        this.bounds = new Bounds();
    }

    /**
     * @en Sets the vertex and index buffers for this static batch mesh.
     * @param vertex The vertex buffer to set.
     * @param index The index buffer to set.
     * @zh 为此静态批处理网格设置顶点和索引缓冲区。
     * @param vertex 要设置的顶点缓冲区。
     * @param index 要设置的索引缓冲区。
     */
    setBuffer(vertex: VertexBuffer3D, index: IndexBuffer3D) {
        let bufferState = this._bufferState;

        this._vertexBuffer = vertex;
        this._indexBuffer = index;

        bufferState.applyState([vertex], index);
    }

    /**
     * @en Destroys this static batch mesh and releases all associated resources.
     * @zh 销毁此静态批处理网格并释放所有相关资源。
     */
    destroy() {
        this._staticSubMeshes.forEach(submesh => {
            submesh.destroy();
        });
        this._staticSubMeshes.clear();
        this._staticSubMeshes = null;
        this._bufferState.destroy();
    }


}