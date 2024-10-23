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
        "resources/role/bake/RootNode.lh"
        // "resources/3d/Adventurer Male 01.lh",
        // "resources/3d/Angel Female 01.lh",
        // "resources/3d/Archer Female 01.lh",
        // "resources/3d/Archer Female 02.lh",
        // "resources/3d/Archer Male 01.lh",
        // "resources/3d/Barbarian Male 02.lh",
        // "resources/3d/Barbarian Male 05.lh"
    ];

    private monsters: MonsterEntity[] = [];
    private monsterCountText: Laya.Text;

    private commandBuffer: Laya.CommandBuffer;
	private cameraEventFlag:Laya.CameraEventFlags = Laya.CameraEventFlags.BeforeImageEffect;

    onAwake() {
        console.log("游戏初始化");
        
        // 开启性能统计
        Laya.Stat.show();
        
        // // 设置微信环境下的CDN basepath
        // if (Laya.Browser.onWeiXin) {
        //     Laya.URL.basePath = "http://192.168.3.101:8989/";
        // }

        // Laya.URL.basePath = "http://192.168.3.101:8989/resources";
        // Laya.URL.basePath = "https://seaclear-1255444941.cos.ap-nanjing.myqcloud.com/laya32test/resources/";
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
        // ThroughMaterial.initShader();

       // this.onStartGame();
        this.button.on(Laya.Event.CLICK, this, this.onStartGame);
        this.createUI();
        this.createMonsterCountDisplay();
    }

    private createUI(): void {
        // 创建"增加10个monster"按钮
        const addMonstersBtn = new Laya.Button("common/common_btn_blue.png", "增加10个");
        addMonstersBtn.stateNum =1;
        addMonstersBtn.size(200, 80);
        addMonstersBtn.labelSize = 33;
        addMonstersBtn.labelColors = "#ffffff";
        addMonstersBtn.pos(10, Laya.stage.height - 100);
        addMonstersBtn.on(Laya.Event.CLICK, this, this.addMonsters);
        Laya.stage.getChildByName("root").getChildByName("Scene2D").getChildByName("UI").addChild(addMonstersBtn);

        // 创建"清除monster"按钮
        const clearMonstersBtn = new Laya.Button("common/common_btn_blue.png", "清除monster");
        clearMonstersBtn.stateNum =1;
        clearMonstersBtn.size(200, 80);
        clearMonstersBtn.labelSize = 33;
        clearMonstersBtn.labelColors = "#ffffff";
        clearMonstersBtn.pos(10, Laya.stage.height - 200);
        clearMonstersBtn.on(Laya.Event.CLICK, this, this.clearMonsters);
        Laya.stage.getChildByName("root").getChildByName("Scene2D").getChildByName("UI").addChild(clearMonstersBtn);
        
        // 创建"重置相机"按钮
        this.resetCameraBtn = new Laya.Button("common/common_btn_blue.png", "重置相机");
        this.resetCameraBtn.stateNum = 1;
        this.resetCameraBtn.size(200, 80);
        this.resetCameraBtn.labelSize = 33;
        this.resetCameraBtn.labelColors = "#ffffff";
        this.resetCameraBtn.pos(Laya.stage.width - 210, Laya.stage.height - 90);
        this.resetCameraBtn.on(Laya.Event.CLICK, this, this.resetCamera);
        Laya.stage.getChildByName("root").getChildByName("Scene2D").getChildByName("UI").addChild(this.resetCameraBtn);
    }

    private createMonsterCountDisplay(): void {
        this.monsterCountText = new Laya.Text();
        this.monsterCountText.fontSize = 30;
        this.monsterCountText.color = "#ffffff";
        this.monsterCountText.pos(Laya.stage.width - 200, 10);
        Laya.stage.getChildByName("root").getChildByName("Scene2D").getChildByName("UI").addChild(this.monsterCountText);
        this.updateMonsterCountDisplay();
    }

    private async addMonsters() {
        for (let i = 0; i < 10; i++) {
            await this.createMonster();
        }
        this.addRender(); // 在添加新怪物后重新创建渲染资源
        this.updateMonsterCountDisplay();
    }

    private clearMonsters(): void {
        // 先清理渲染资源
        this.clearRender();

        // 然后清理每个怪物实体
        for (const monster of this.monsters) {
            monster.destroy();
            if (monster.model && monster.model.parent) {
                monster.model.parent.removeChild(monster.model);
            }
        }

        // 清空怪物数组
        this.monsters = [];

        // 更新显示
        this.updateMonsterCountDisplay();

        // 重置相关状态（如果有的话）
        // 例如：this.lastRenderTime = 0;

        console.log("Monsters cleared, count:", this.monsters.length);
    }

    private updateMonsterCountDisplay(): void {
        this.monsterCountText.text = `怪物数量: ${this.monsters.length}`;
    }

    private async createMonster(): Promise<void> {
        const monster = new MonsterEntity();
        const randomModelIndex = Math.floor(Math.random() * this.monsterRes.length);
        await monster.load(this.monsterRes[randomModelIndex]);
        
        // 随机位置
        const x = (Math.random() - 0.5) * 100;
        const z = (Math.random() - 0.5) * 100;
        monster.model.transform.position = new Laya.Vector3(x, 0, z);
        
        monster.addToScene(this.scene3d);
        this.monsters.push(monster);
        this.updateMonsterCountDisplay();
    }

    async createMonsters() {
        for (let i = 0; i < 10; i++) {
            await this.createMonster();
        }
        this.addRender();
    }

    public addRender() {
        this.clearRender();
        let renders:Laya.BaseRender[] = [];
		let materials:Laya.Material[] = [];

        for (let monster of this.monsters) {
            // renders.push(monster.model.getChildByName("Base").getComponent(Laya.BaseRender));
            renders.push(monster.model.getChildByName("Mihuwang").getChildByName("Mihuwang").getChildByName("Mihuwang_0").getComponent(Laya.BaseRender));
        }

        materials.push(new OutlineMaterial());
        materials.push(new ShadowMaterial());
        //  materials.push(new ThroughMaterial());
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
        // 增加人为的耗时操作5ms
        // const startTime = performance.now();
        // while (performance.now() - startTime < 8) {
        //     // 空循环,消耗时间
        // }
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
            this.monsters.forEach(monster => {
                monster.update(deltaTime, playerPosition, this.monsters);
                monster.updateHealthBarPosition(this.camera);
            });
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

        // 初始化相机
        this.initializeCamera();
    }

    private clearRender(): void {
        if (this.commandBuffer) {
            // 从相机中移除 CommandBuffer
            this.camera.removeCommandBuffer(this.cameraEventFlag, this.commandBuffer);
            
            // 清除 CommandBuffer
            this.commandBuffer.clear();
            this.commandBuffer = null;
        }

        // 如果有其他需要清理的渲染资源，可以在这里添加
        // 例如，如果您有存储材质的数组，可以清空它
        // this.materials = [];
    }

    private resetCamera(): void {
        console.log("Resetting camera");
        
        // 保存当前相机的属性
        const oldPosition = this.camera.transform.position.clone();
        const oldRotation = this.camera.transform.rotation.clone();
        const oldFov = this.camera.fieldOfView;
        const oldNear = this.camera.nearPlane;
        const oldFar = this.camera.farPlane;

        // 从场景中移除旧相机
        this.scene3d.removeChild(this.camera);

        // 创建新相机
        this.camera = new Laya.Camera();
        this.scene3d.addChild(this.camera);

        // 设置新相机的属性
        this.camera.transform.position = oldPosition;
        this.camera.transform.rotation = oldRotation;
        this.camera.fieldOfView = oldFov;
        this.camera.nearPlane = oldNear;
        this.camera.farPlane = oldFar;

        // 重新添加 CommandBuffer
        if (this.commandBuffer) {
            this.camera.addCommandBuffer(this.cameraEventFlag, this.commandBuffer);
        }

        console.log("Camera reset complete");
    }

    private initializeCamera(): void {
        // 设置相机的初始位置和属性
        this.camera.transform.position = new Laya.Vector3(0, 18, 0);
        this.camera.transform.rotationEuler = new Laya.Vector3(-63, 180, 0);
        this.camera.fieldOfView = 60;
        this.camera.nearPlane = 0.1;
        this.camera.farPlane = 1000;
    }
}
