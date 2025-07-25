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
    private currentSkillEffect: Laya.Sprite3D | null = null;

    // 血条相关属性
    public healthBar: Laya.ProgressBar;
    private maxHealth: number = 100;
    private currentHealth: number = 100;

    public skillRes: string[] = [
        "resources/LayaScene_Partical/2.lh",
        "resources/LayaScene_Partical/n14.lh",
        "resources/LayaScene_Partical/a1.lh",
        "resources/LayaScene_Partical/5.lh",
        "resources/LayaScene_Partical/1.lh",
        "resources/LayaScene_Partical/7.lh",
        "resources/LayaScene_Partical/a4.lh",
        "resources/LayaScene_Partical/a6.lh",
        "resources/LayaScene_Partical/5.lh",
        "resources/LayaScene_Partical/6.lh",
        "resources/LayaScene_Partical/9.lh",
        //"resources/LayaScene_Partical/4.lh"

    ];

    // 建议在类的顶部添加以下属性
    private static readonly tempVector3 = new Laya.Vector3();
    private static readonly tempVector4 = new Laya.Vector4();

    private isSkillEnabled: boolean = true;

    constructor() {
        this.model = new Laya.Sprite3D();
        this.createHealthBar();
    }

    private createHealthBar() {
        this.healthBar = new Laya.ProgressBar("resources/ui/progress.png");
        this.healthBar.width = 100;
        this.healthBar.height = 10;
        this.healthBar.value = 1;
        Laya.stage.addChild(this.healthBar);
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

    update(deltaTime: number, playerPosition: Laya.Vector3, monsters: MonsterEntity[], isUsingSkill: boolean): void {
        if (this.moveDuration > 0) {
            this.moveTowardsTarget(deltaTime, playerPosition, monsters);
            this.moveDuration -= deltaTime;
            // this.playAnimation("Run");
            this.playAnimation("move");
        } else if (this.idleDuration > 0) {
            this.idleDuration -= deltaTime;
            // this.playAnimation("Idle");
            this.playAnimation("idle");
        } else {
            this.decideNextAction(playerPosition);
        }

        if (this.skillCooldown > 0) {
            this.skillCooldown -= deltaTime;
        } else if (isUsingSkill && this.isSkillEnabled && Math.random() < 0.055) {
            this.useSkill();
        }

        // 随机受到伤害（用于测试）
        if (Math.random() < 0.0001) { // 每帧有0.1%的概率受到伤害
            this.takeDamage(10);
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
        this.playAnimation("attack");

        // 清理当前的技能特效（如果有）
        this.clearCurrentSkillEffect();

        const randomSkillIndex = Math.floor(Math.random() * this.skillRes.length);
        const skillEffectUrl = this.skillRes[randomSkillIndex];

        try {
            const skillEffect = await ResLoader.getResSync(skillEffectUrl) as Laya.Sprite3D;
            if (skillEffect) {
                skillEffect.transform.position = new Laya.Vector3(0, 0.5, 0);
                this.model.addChild(skillEffect);
                this.currentSkillEffect = skillEffect;

                const effectDuration = 3000;

                Laya.timer.once(effectDuration, this, this.clearCurrentSkillEffect);
            }
        } catch (error) {
            console.error("加载技能特效失败:", error);
        }
    }

    private clearCurrentSkillEffect(): void {
        if (this.currentSkillEffect) {
            if (this.currentSkillEffect.parent) {
                this.currentSkillEffect.parent.removeChild(this.currentSkillEffect);
            }
            this.currentSkillEffect = null;
        }
    }

    public updateHealthBarPosition(camera: Laya.Camera) {
        if (this.model && this.healthBar) {
            const worldPosition = this.model.transform.position;
            const screenPosition = MonsterEntity.tempVector4;
            camera.viewport.project(worldPosition, camera.projectionViewMatrix, screenPosition);
            
            if (screenPosition.z < 1) { // 检查是否在相机前面
                this.healthBar.visible = true;
                this.healthBar.x = screenPosition.x / Laya.stage.clientScaleX - this.healthBar.width / 2;
                this.healthBar.y = screenPosition.y / Laya.stage.clientScaleY - 50; // 将血条放在怪物头顶上方
            } else {
                this.healthBar.visible = false;
            }
        }
    }

    public takeDamage(damage: number) {
        this.currentHealth = Math.max(0, this.currentHealth - damage);
        this.healthBar.value = this.currentHealth / this.maxHealth;
    }

    public destroy(): void {
        // 清理血条
        if (this.healthBar) {
            Laya.stage.removeChild(this.healthBar);
            this.healthBar.destroy();
            this.healthBar = null;
        }

        // 清理3D模型
        if (this.model) {
            if (this.model.parent) {
                this.model.parent.removeChild(this.model);
            }
            this.model = null;
        }

        // 清理动画器
        if (this.animator) {
            this.animator.destroy();
            this.animator = null;
        }

        // 清理当前的技能特效
        this.clearCurrentSkillEffect();

        // 清理定时器
        Laya.timer.clearAll(this);

        // 清理目标位置向量
        this.targetPosition = null;

        // 清理技能资源引用
        this.skillRes = null;

        console.log("Monster entity destroyed");
    }

    public setSkillEnabled(enabled: boolean): void {
        this.isSkillEnabled = enabled;
    }

    public setHealthBarVisible(visible: boolean): void {
        if (this.healthBar) {
            this.healthBar.visible = visible;
        }
    }
}
