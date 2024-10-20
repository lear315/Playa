import ResLoader from "../core/ResLoader";

export class MonsterEntity {
    public model: Laya.Sprite3D;
    private animator: Laya.Animator;
    private moveSpeed: number = 0.003;
    private moveDuration: number = 0;
    private idleDuration: number = 0;
    private skillCooldown: number = 0;
    private targetPosition: Laya.Vector3 = new Laya.Vector3();
    private avoidanceRadius: number = 6; // 避障半径
    private _curAnimation: string = "";


    public skillRes: string[] = [
        "resources/LayaScene_Partical/2.lh",
        "resources/LayaScene_Partical/n14.lh",
        "resources/LayaScene_Partical/a1.lh",
        "resources/LayaScene_Partical/5.lh",
        "resources/LayaScene_Partical/1.lh",
        "resources/LayaScene_Partical/7.lh",
        "resources/LayaScene_Partical/a4.lh",
        "resources/LayaScene_Partical/a6.lh"
        // "resources/LayaScene_Partical/4.lh"

    ];

    constructor() {
        this.model = new Laya.Sprite3D();
    }

    async load(url: string): Promise<void> {
        this.model = await ResLoader.getResSync(url);
        this.animator = this.model.getComponent(Laya.Animator);
    }

    addToScene(scene: Laya.Scene3D): void {
        scene.addChild(this.model);
    }

    playAnimation(animName: string): void {
        if (this.animator) {
            if (this._curAnimation === animName) {
                return;
            }
            this._curAnimation = animName;
            this.animator.play(animName);
        }
    }

    update(deltaTime: number, playerPosition: Laya.Vector3, monsters: MonsterEntity[]): void {
        if (this.moveDuration > 0) {
            this.moveTowardsTarget(deltaTime, playerPosition, monsters);
            this.moveDuration -= deltaTime;
            this.playAnimation("Run");
        } else if (this.idleDuration > 0) {
            this.idleDuration -= deltaTime;
            this.playAnimation("Idle");
        } else {
            this.decideNextAction(playerPosition);
        }

        if (this.skillCooldown > 0) {
            this.skillCooldown -= deltaTime;
        } else if (Math.random() < 0.0005) {
            this.useSkill();
        }
    }

    private moveTowardsTarget(deltaTime: number, playerPosition: Laya.Vector3, monsters: MonsterEntity[]): void {
        const currentPosition = this.model.transform.position;
        const direction = new Laya.Vector3();
        Laya.Vector3.subtract(this.targetPosition, currentPosition, direction);
        
        // 应用RVO避障
        const avoidanceForce = this.calculateAvoidanceForce(monsters);
        Laya.Vector3.add(direction, avoidanceForce, direction);

        direction.normalize();
        Laya.Vector3.scale(direction, this.moveSpeed * deltaTime, direction);
        this.model.transform.translate(direction, false);

        // 更新朝向
        if (direction.x !== 0 || direction.z !== 0) {
            const rotation = Math.atan2(direction.x, direction.z);
            this.model.transform.rotationEuler = new Laya.Vector3(0, rotation * 180 / Math.PI, 0);
        }
    }

    private calculateAvoidanceForce(monsters: MonsterEntity[]): Laya.Vector3 {
        const avoidanceForce = new Laya.Vector3();
        const currentPosition = this.model.transform.position;

        monsters.forEach(otherMonster => {
            if (otherMonster !== this) {
                const otherPosition = otherMonster.model.transform.position;
                const distance = Laya.Vector3.distance(currentPosition, otherPosition);
                if (distance < this.avoidanceRadius) {
                    const avoidDirection = new Laya.Vector3();
                    Laya.Vector3.subtract(currentPosition, otherPosition, avoidDirection);
                    avoidDirection.normalize();
                    Laya.Vector3.scale(avoidDirection, this.avoidanceRadius - distance, avoidDirection);
                    Laya.Vector3.add(avoidanceForce, avoidDirection, avoidanceForce);
                }
            }
        });

        return avoidanceForce;
    }

    private decideNextAction(playerPosition: Laya.Vector3): void {
        if (Math.random() < 0.7) {
            this.moveDuration = Math.random() * 2000 + 1000;
            // 设置一个随机的目标位置,但偏向玩家方向
            const randomOffset = new Laya.Vector3(Math.random() - 0.5, 0, Math.random() - 0.5);
            Laya.Vector3.scale(randomOffset, 20, randomOffset); // 缩放随机偏移
            Laya.Vector3.add(playerPosition, randomOffset, this.targetPosition);
        } else {
            this.idleDuration = Math.random() * 1000 + 500;
        }
    }

    private async useSkill(): Promise<void> {
        console.log("Monster used a skill!");
        this.skillCooldown = Math.random() * 5000 + 3000;
        this.playAnimation("Cast Spell 02");

        // 随机选择一个技能特效
        const randomSkillIndex = Math.floor(Math.random() * this.skillRes.length);
        const skillEffectUrl = this.skillRes[randomSkillIndex];

        try {
            // 加载并播放特效
            const skillEffect = await ResLoader.getResSync(skillEffectUrl) as Laya.Sprite3D;
            if (skillEffect) {
                // 将特效直接添加到怪物模型上
                skillEffect.transform.position = new Laya.Vector3(0,0.5,0);
                this.model.addChild(skillEffect);

                // 设置特效持续时间（例如3秒）
                const effectDuration = 3000;

                // 设置一个定时器来移除特效
                Laya.timer.once(effectDuration, this, () => {
                    this.model.removeChild(skillEffect);
                    // skillEffect.destroy();
                });
            }
        } catch (error) {
            console.error("加载技能特效失败:", error);
        }
    }
}
