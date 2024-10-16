import { ISkinRenderElement3D } from "../../DriverDesign/3DRenderPass/I3DRenderPass";
import { GLESRenderElement3D } from "./GLESRenderElement3D";

export class GLESSkinRenderElement3D extends GLESRenderElement3D implements ISkinRenderElement3D {

    _skinnedData: Float32Array[];

    constructor() {
        super();
    }
    get skinnedData(): Float32Array[] {
        return this._skinnedData;
    }
    set skinnedData(data: Float32Array[]) {
        this._skinnedData = data;
        this._nativeObj.setSkinnedData(data);
    }
    init(): void {
        this._nativeObj = new (window as any).conchGLESSkinRenderElement3D();
    }
}