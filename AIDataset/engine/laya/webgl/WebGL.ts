import { LayaGL } from "../layagl/LayaGL";
import { RenderState2D } from "./utils/RenderState2D"

/**
 * @private
 */
export class WebGL {
    static isNativeRender_enable: boolean = false;

    static _nativeRender_enable(): void {
    }

    //使用webgl渲染器
    static enable(): boolean {
        return true;
    }

    static onStageResize(width: number, height: number): void {
        RenderState2D.width = width;
        RenderState2D.height = height;
        LayaGL.renderEngine.resizeOffScreen(width, height);
    }
}



