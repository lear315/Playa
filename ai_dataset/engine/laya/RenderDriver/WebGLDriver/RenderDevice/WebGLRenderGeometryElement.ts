import { IRenderGeometryElement } from "../../DriverDesign/RenderDevice/IRenderGeometryElement";
import { DrawType } from "../../../RenderEngine/RenderEnum/DrawType";
import { IndexFormat } from "../../../RenderEngine/RenderEnum/IndexFormat";
import { MeshTopology } from "../../../RenderEngine/RenderEnum/RenderPologyMode";
import { FastSinglelist } from "../../../utils/SingletonList";
import { WebGLBufferState } from "./WebGLBufferState";
import { WebGLEngine } from "./WebGLEngine";

export class WebGLRenderGeometryElement implements IRenderGeometryElement {

    private static _idCounter: number = 0;

    /** @internal */
    _id: number = ++WebGLRenderGeometryElement._idCounter;

    /**@internal */
    bufferState: WebGLBufferState;

    /**@internal */
    private _mode: MeshTopology;

    /**@internal 优化使用*/
    _glmode: number;

    /**@internal */
    drawType: DrawType;

    /**@internal */
    drawParams: FastSinglelist<number>;

    /**@internal */
    instanceCount: number;

    /**@internal 优化*/
    _glindexFormat: number;

    /**@internal */
    private _indexFormat: IndexFormat;

    /**
     * index format
     */
    get indexFormat(): IndexFormat {
        return this._indexFormat;
    }

    set indexFormat(value: IndexFormat) {
        this._indexFormat = value;
        this._glindexFormat = WebGLEngine.instance.getDrawContext().getIndexType(this._indexFormat);
    }

    /**
     * Mesh Topology mode 
     */
    get mode(): MeshTopology {
        return this._mode;
    }

    set mode(value: MeshTopology) {
        this._mode = value;
        this._glmode = WebGLEngine.instance.getDrawContext().getMeshTopology(this._mode);
    }

    /**@internal */
    constructor(mode: MeshTopology, drawType: DrawType) {
        this.mode = mode;
        this.drawParams = new FastSinglelist();
        this.drawType = drawType;
    }

    /**@internal */
    setDrawArrayParams(first: number, count: number): void {
        this.drawParams.add(first);
        this.drawParams.add(count);
    }

    /**@internal */
    setDrawElemenParams(count: number, offset: number): void {
        this.drawParams.add(offset);
        this.drawParams.add(count);

    }

    /**@internal */
    destroy(): void {
        delete this.drawParams;
    }
    /**@internal */
    clearRenderParams() {
        this.drawParams.length = 0;
    }

    cloneTo(obj: WebGLRenderGeometryElement) {
        obj.mode = this.mode;
        obj.drawType = this.drawType;
        obj.indexFormat = this.indexFormat;
        obj.instanceCount = this.instanceCount;
        obj.drawParams.elements = this.drawParams.elements.slice();
        obj.drawParams.length = this.drawParams.length;
    }
}