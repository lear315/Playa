import { UIComponent } from "./UIComponent";
import { Stage } from "../display/Stage";
import { Texture } from "../resource/Texture";
import { Texture2D } from "../resource/Texture2D";
import { TextureFormat } from "../RenderEngine/RenderEnum/TextureFormat";
import { ILaya } from "../../ILaya";
import { LayaEnv } from "../../LayaEnv";
import { Browser } from "../utils/Browser";

/**
 * @en OpenDataContext component for displaying OpenData in WeChat mini-games. Instantiate this component directly to optimally display OpenData based on the component's width, height, and position.
 * @zh 微信小游戏开放数据域显示组件，直接实例化本组件，即可根据组件宽高和位置，以最优的方式显示开放数据域数据。
 */
export class OpenDataContextView extends UIComponent {
    private _fps: number = 30;

    /** @ignore */
    constructor() {
        super();
        this._width = this._height = 200;
        let tex: Texture = new Texture(new Texture2D(this._width, this._height, TextureFormat.R8G8B8A8, false, false, true));
        tex.bitmap.lock = true;
        this.texture = tex;
    }

    /**
     * @en The frame rate.
     * @zh 帧率。
     */
    get fps() {
        return this._fps;
    }

    set fps(value: number) {
        if (this._fps != value) {
            this._fps = value;
            if (LayaEnv.isPlaying && this.activeInHierarchy
                && (window as any).wx && (window as any).sharedCanvas) {
                ILaya.timer.clear(this, this._onLoop);
                ILaya.timer.loop(1000 / value, this, this._onLoop);
            }
        }
    }

    /**
     * @ignore
     */
    _onActive(): void {
        if (!LayaEnv.isPlaying)
            return;

        if ((window as any).wx && (window as any).sharedCanvas)
            ILaya.timer.loop(1000 / this._fps, this, this._onLoop);
    }
    /**
     * @ignore
     */
    _onInActive(): void {
        if (!LayaEnv.isPlaying)
            return;

        this.postMsg({ type: "close" });
        ILaya.timer.clear(this, this._onLoop);
    }

    private _onLoop(): void {
        let tex = this.texture;
        let canvas: HTMLCanvasElement = (window as any).sharedCanvas;
        if (tex.width != canvas.width || tex.height != canvas.height) {
            tex.bitmap.destroy();
            tex.bitmap = new Texture2D(canvas.width, canvas.height, TextureFormat.R8G8B8A8, false, false, true, true);
            tex.bitmap.lock = true;
        }

        if (Browser.onMiniGame) {//小游戏保护
            if ((canvas as any).toTempFilePath) {
                (<Texture2D>tex.bitmap).setImageData(canvas, true, false);
            }
        } else
            (<Texture2D>tex.bitmap).setImageData(canvas, true, false);
    }

    /**
     * @ignore
     */
    _setWidth(value: number) {
        super._setWidth(value);
        if ((window as any).sharedCanvas) (window as any).sharedCanvas.width = value;
        this.callLater(this.updateViewPort);
    }

    /**
     * @ignore
     */
    _setHeight(value: number) {
        super._setHeight(value);
        if ((window as any).sharedCanvas) (window as any).sharedCanvas.height = value;
        this.callLater(this.updateViewPort);
    }

    /**
     * @en The x-coordinate of the component.
     * @zh 组件的 x 坐标。
     */
    get x() {
        return super.x;
    }

    set x(value: number) {
        super.x = value;
        this.callLater(this.updateViewPort);
    }

    /**
     * @en The y-coordinate of the component.
     * @zh 组件的 y 坐标。
     */
    get y() {
        return super.y;
    }

    set y(value: number) {
        super.y = value;
        this.callLater(this.updateViewPort);
    }


    private updateViewPort(): void {
        let stage: Stage = ILaya.stage;
        let sx = stage._canvasTransform.getScaleX() * this.globalScaleX * stage.transform.getScaleX();
        let sy = stage._canvasTransform.getScaleY() * this.globalScaleY * stage.transform.getScaleY();

        this.postMsg({
            type: "updateViewPort",
            box: {
                x: this.x * sx,
                y: this.y * sy,
                width: this.width * sx,
                height: this.height * sy,
            }
        });
    }

    /**
     * @en Send a message to the OpenData context.
     * @param msg Message to send.
     * @zh 向开放数据域发送消息。
     * @param msg 要发送的消息。
     */
    postMsg(msg: any): void {
        if ((window as any).wx && (window as any).wx.getOpenDataContext) {
            var openDataContext: any = (window as any).wx.getOpenDataContext();
            openDataContext.postMessage(msg);
        }
    }
}