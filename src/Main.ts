/**
 * Author: CUESOR
 * Date: 2024-07-25
 */
const { regClass, property } = Laya;

@regClass()
export class Main extends Laya.Script {

    @property( { type:Laya.Button } ) //拿到 Button 组件
    private button: Laya.Button; 

    onStart() {
        console.log("Game start");
        // 获取设备宽高
        const stageWidth = Laya.stage.width;
        const stageHeight = Laya.stage.height;

        // 根据宽高比例进行适配
        if (stageWidth / stageHeight > 9 / 16) {
            // 宽大于高，使用高适配
            Laya.stage.scaleMode = Laya.Stage.SCALE_SHOWALL;
            Laya.stage.width = stageHeight / 16 * 9;
        }

        this.button.on(Laya.Event.CLICK, this, this.onStartGame);
    }

    onStartGame() {
        console.log("Game start");


    }
}