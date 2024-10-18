export class Joystick extends Laya.Script {
    private _outer: Laya.Sprite;
    private _inner: Laya.Sprite;
    private _touchId: number = -1;
    private _centerX: number = 0;
    private _centerY: number = 0;
    private _radius: number = 0;

    private _moveX: number = 0;
    private _moveY: number = 0;

    constructor() {
        super();
    }

    onAwake() {
        this._outer = this.owner as Laya.Sprite;
        this._inner = this._outer.getChildByName("inner") as Laya.Sprite;

        this._centerX = this._outer.width / 2;
        this._centerY = this._outer.height / 2;
        this._radius = this._outer.width / 2 - this._inner.width / 2;

        this._inner.x = this._centerX;
        this._inner.y = this._centerY;

        this._outer.on(Laya.Event.MOUSE_DOWN, this, this.onTouchDown);
        Laya.stage.on(Laya.Event.MOUSE_MOVE, this, this.onTouchMove);
        Laya.stage.on(Laya.Event.MOUSE_UP, this, this.onTouchUp);
    }

    private onTouchDown(e: Laya.Event) {
        if (this._touchId === -1) {
            this._touchId = e.touchId;
            this.updateJoystickPosition(e.stageX, e.stageY);
        }
    }

    private onTouchMove(e: Laya.Event) {
        if (this._touchId === e.touchId) {
            this.updateJoystickPosition(e.stageX, e.stageY);
        }
    }

    private onTouchUp(e: Laya.Event) {
        if (this._touchId === e.touchId) {
            this._touchId = -1;
            this._inner.x = this._centerX;
            this._inner.y = this._centerY;
            this._moveX = 0;
            this._moveY = 0;
        }
    }

    private updateJoystickPosition(x: number, y: number) {
        // 将全局坐标转换为摇杆的本地坐标
        let point = this._outer.globalToLocal(new Laya.Point(x, y));
        let dx = point.x - this._centerX;
        let dy = point.y - this._centerY;

        let distance = Math.sqrt(dx * dx + dy * dy);

        if (distance > this._radius) {
            dx = dx * this._radius / distance;
            dy = dy * this._radius / distance;
        }

        this._inner.x = this._centerX + dx;
        this._inner.y = this._centerY + dy;

        // 计算移动方向和强度
        this._moveX = dx / this._radius;
        this._moveY = -dy / this._radius; // 注意这里使用负值

        // 确保移动值在 -1 到 1 之间
        this._moveX = Math.max(-1, Math.min(1, this._moveX));
        this._moveY = Math.max(-1, Math.min(1, this._moveY));
    }

    public getMoveX(): number {
        return this._moveX;
    }

    public getMoveY(): number {
        return this._moveY;
    }
}
