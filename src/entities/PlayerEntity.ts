import ResLoader from "../core/ResLoader";


export class PlayerEntity  {
    private _model: Laya.Sprite3D;
    private _animator: Laya.Animator;
    private _curAnimation: string = "";

    constructor() {
       
    }

    public async load(resourcePath: string): Promise<void> {
        this._model = await ResLoader.getResSync(resourcePath) as Laya.Sprite3D;
        if (this._model) {
            this._animator = this._model.getComponent(Laya.Animator) as Laya.Animator;
            console.log("玩家模型加载成功");
        } else {
            console.error("玩家模型加载失败");
        }
    }

    public addToScene(scene: Laya.Scene3D): void {
        if (this._model) {
            scene.addChild(this._model);
            this._model.transform.position = new Laya.Vector3(0, 0, 0);
            this._model.transform.localScale = new Laya.Vector3(1.5, 1.5, 1.5);
            console.log("玩家模型已添加到场景");
        } else {
            console.error("玩家模型未加载,无法添加到场景");
        }
    }

    public playAnimation(animationName: string): void {
        if (this._animator) {
            if (this._curAnimation === animationName) {
                return;
            }
            this._curAnimation = animationName;
            this._animator.play(animationName);
            console.log(`正在播放动画: ${animationName}`);
        } else {
            console.error("动画组件未找到,无法播放动画");
        }
    }

    public get model(): Laya.Sprite3D {
        return this._model;
    }

    destroy() {
        // 移除模型
        if (this.model) {
            this.model.removeSelf();
            this.model.destroy();
        }

        // 清理其他资源...
    }
}
