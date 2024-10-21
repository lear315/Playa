/**
 * Author: CUESOR
 * Date: 2024-07-25
 */
import { PlayerEntity } from "./entities/PlayerEntity";
import { Joystick } from "./ui/Joystick";
import { MonsterEntity } from "./entities/MonsterEntity";
import { OutlineMaterial } from "./shader/OutlineMaterial";
import { ShadowMaterial } from "./shader/ShadowMaterial";
import { ThroughMaterial } from "./shader/ThroughMaterial";

const { regClass, property } = Laya;

@regClass()
export class Main extends Laya.Script {

    @property({ type: Laya.Button })
    private button: Laya.Button;

    @property({ type: Laya.Box })
    private box: Laya.Box;

    @property({ type: Laya.Scene3D })
    private scene3d: Laya.Scene3D;

    @property({ type: Laya.Sprite })
    private joystickSprite: Laya.Sprite;

    @property({ type: Laya.Camera })
    private camera: Laya.Camera;


    public playerRes: string = "resources/3d/AngelMale01.lh";
    public player: PlayerEntity;
    private joystick: Joystick;

    public monsterRes: string[] = [
        "resources/3d/Adventurer Male 01.lh",
        "resources/3d/Angel Female 01.lh",
        "resources/3d/Archer Female 01.lh",
        "resources/3d/Archer Female 02.lh",
        "resources/3d/Archer Male 01.lh",
        "resources/3d/Barbarian Male 02.lh",
        "resources/3d/Barbarian Male 05.lh"
    ];

    private monsters: MonsterEntity[] = [];

    private commandBuffer: Laya.CommandBuffer;
	private cameraEventFlag:Laya.CameraEventFlags = Laya.CameraEventFlags.BeforeImageEffect;

    onAwake() {
        console.log("游戏初始化");
        
        // 开启性能统计
        Laya.Stat.show();
        
        // 设置微信环境下的CDN basepath
        if (Laya.Browser.onWeiXin) {
            Laya.URL.basePath = "http://192.168.3.101:8989/";
        }
    }

    onStart() {
        console.log("游戏开始");
        // 获取设备宽高
        const stageWidth = Laya.stage.width;
        const stageHeight = Laya.stage.height;

        // 根据宽高比例进行适配
        if (stageWidth / stageHeight > 9 / 16) {
            // 宽大于高，使用高适配
            Laya.stage.scaleMode = Laya.Stage.SCALE_SHOWALL;
            Laya.stage.width = stageHeight / 16 * 9;
        }

        OutlineMaterial.initShader();
        ShadowMaterial.initShader();
        ThroughMaterial.initShader();

       // this.onStartGame();
        this.button.on(Laya.Event.CLICK, this, this.onStartGame);
    }

    async onStartGame() {
        console.log("开始游戏");
        // 初始化摇杆
        this.joystick = this.joystickSprite.addComponent(Joystick);

        // 创建怪物
        this.createMonsters();

        // 添加帧循环
        Laya.timer.frameLoop(1, this, this.onUpdate);


        // 初始化玩家实体
        this.player = new PlayerEntity();
        this.box.visible = false;

        // 加载玩家模型
        await this.player.load(this.playerRes);

        // 将玩家添加到场景
        this.player.addToScene(this.scene3d);

        // 播放一个动画 (假设有一个名为 "idle" 的动画)
        this.player.playAnimation("Idle");
    }

    async createMonsters() {
        for (let i = 0; i < 100; i++) {
            const monster = new MonsterEntity();
            const randomModelIndex = Math.floor(Math.random() * this.monsterRes.length);
            await monster.load(this.monsterRes[randomModelIndex]);
            
            // 随机位置
            const x = (Math.random() - 0.5) * 100; // 假设场景范围是 -50 到 50
            const z = (Math.random() - 0.5) * 100;
            monster.model.transform.position = new Laya.Vector3(x, 0, z);
            
            monster.addToScene(this.scene3d);
            this.monsters.push(monster);
        }
        this.addRender();
    }

    public addRender() {
        let renders:Laya.BaseRender[] = [];
		let materials:Laya.Material[] = [];

        for (let monster of this.monsters) {
            renders.push(monster.model.getChildByName("Base").getComponent(Laya.BaseRender));
        }
        renders.push(this.player.model.getChildByName("Base").getComponent(Laya.BaseRender));

        materials.push(new OutlineMaterial());
        materials.push(new ShadowMaterial());
        // materials.push(new ThroughMaterial());
        //创建commandBuffer
		this.commandBuffer = this.createDrawMeshCommandBuffer(renders, materials);
		//将commandBuffer加入渲染流程
		this.camera.addCommandBuffer(this.cameraEventFlag,this.commandBuffer);
    }

    // 后处理
    public createDrawMeshCommandBuffer(renders:Laya.BaseRender[],materials:Laya.Material[]):Laya.CommandBuffer{
		var buf:Laya.CommandBuffer = new Laya.CommandBuffer();
        for(var i = 0,n = renders.length;i<n;i++){
            for (let j = 0; j < materials.length; j++) {
                buf.drawRender(renders[i], materials[j], 0);
            }
		}
        return buf;
    }

    onUpdate() {
        if (this.player && this.player.model) {
            // 获取摇杆输入
            const moveX = this.joystick.getMoveX();
            const moveY = this.joystick.getMoveY();

            // 移动玩家
            const speed = 0.05; // 调整速度
            const movement = new Laya.Vector3(-moveX * speed, 0, moveY * speed); // 注意这里Z轴使用了负的moveY
            this.player.model.transform.translate(movement, false);

            // 如果有移动,播放移动动画,否则播放待机动画
            if (Math.abs(moveX) > 0.1 || Math.abs(moveY) > 0.1) {
                this.player.playAnimation("Run");
            } else {
                this.player.playAnimation("Idle");
            }

            // 设置玩家朝向
            if (moveX !== 0 || moveY !== 0) {
                const rotation = Math.atan2(-moveX, moveY); // 注意这里使用了负的moveY
                this.player.model.transform.rotationEuler = new Laya.Vector3(0, rotation * 180 / Math.PI, 0);
            }

            // 更新摄像机位置
            this.updateCameraPosition();

            // 更新怪物
            const deltaTime = Laya.timer.delta;
            const playerPosition = this.player.model.transform.position;
            this.monsters.forEach(monster => monster.update(deltaTime, playerPosition, this.monsters));
        }
    }

    updateCameraPosition() {
        if (this.camera && this.player.model) {
            const playerPosition = this.player.model.transform.position;
            const cameraPosition = new Laya.Vector3(
                playerPosition.x,
                playerPosition.y + 20,
                playerPosition.z - 10 // 增加了与玩家的距离
            );
            this.camera.transform.position = cameraPosition;
            this.camera.transform.lookAt(playerPosition, new Laya.Vector3(0, 1, 0));
        }
    }
}
