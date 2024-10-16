import "laya/ModuleDef";

import { Laya } from "../../../Laya";
import { Stage } from "../../display/Stage";
import { Sprite } from "../../display/Sprite";
import { RenderSprite } from "../../renders/RenderSprite";

/**
clip的测试
外面的clip

cache1：
cache内部有个clip切换
并且挂点有个clip

cache2：
节点有个clip
内部有clip切换


移动的时候clip正确
外部clip变大的时候，clip正确

*/

//RenderSprite.cacheNormalEnable = false;
async function test(){
    //初始化引擎
    await Laya.init(0,0);
    Laya.stage.scaleMode = Stage.SCALE_FULL;
    Laya.stage.screenMode = Stage.SCREEN_NONE;

    let sp = new Sprite();
    sp.graphics.clipRect(0,0,200,200);
    sp.graphics.drawRect(0,0,200,200,'gray','yellow',2)
    sp.pos(100,100)

    let sp1 = new Sprite();
    sp1.graphics.drawRect(0,0,100,100,'green');
    sp1.pos(10,10);
    //这时候的clip是[110,110,100,100]
    sp1.name='parent normal'
    sp1.cacheAs='normal';
    //sp1.alpha=0.5;

    let sp2 = new Sprite();
    sp2.graphics.clipRect(0,0,80,80);
    sp2.graphics.drawRect(0,0,100,100,'red','black',3);
    sp2.pos(10,10);
    //这时候的clip是 [120,120,80,80]
    //sp2.scale(0.5,0.5)

    let sp3 = new Sprite();
    sp3.pos(10,10);
    //此时，contex结合parent得到的clip是 [130,130,80,80]
    sp3.graphics.clipRect(10,0,60,60)
    sp3.graphics.drawRect(0,0,100,100,'blue','red');
    //这时候的clip是 [140,130,60,60]
    sp3.name='child normal'
    sp3.cacheAs='normal'

    let sp4 = new Sprite();
    sp3.graphics.clipRect(20,0,60,60)
    sp4.graphics.drawRect(0,0,50,50,'black','white');
    sp4.pos(10,10);
    //这时候的clip是[150,130,50,60],因为位置是x=130,clipx=20, clipMax=210,超过200了，减去10，就是50

    Laya.stage.addChild(sp).addChild(sp1).addChild(sp2).addChild(sp3).addChild(sp4);
}


async function test1(){
    //初始化引擎
    await Laya.init(0,0);
    Laya.stage.scaleMode = Stage.SCALE_FULL;
    Laya.stage.screenMode = Stage.SCREEN_NONE;

    let sp = new Sprite();
    sp.graphics.clipRect(0,0,20,20);
    sp.graphics.drawRect(0,0,200,200,'gray','yellow',2)
    sp.pos(100,100)

    let sp1 = new Sprite();
    sp1.graphics.drawRect(0,0,100,100,'green');
    sp1.pos(10,10);
    sp1.name='parent normal'
    sp1.cacheAs='normal';
    //sp1.alpha=0.5;

    let sp2 = new Sprite();
    sp2.graphics.clipRect(0,0,80,80);
    sp2.graphics.drawRect(0,0,100,100,'red','black',3);
    sp2.pos(10,10);
    //sp2.scale(0.5,0.5)

    Laya.stage.addChild(sp).addChild(sp1).addChild(sp2);
}

async function test2(){
    //初始化引擎
    await Laya.init(0,0);
    Laya.stage.scaleMode = Stage.SCALE_FULL;
    Laya.stage.screenMode = Stage.SCREEN_NONE;

    let sp = new Sprite();
    sp.graphics.clipRect(0,0,20,20);
    sp.graphics.drawRect(0,0,200,200,'gray','yellow',2)
    sp.pos(100,100)

    let sp1 = new Sprite();
    sp1.graphics.drawRect(0,0,100,100,'green');
    sp1.pos(10,10);
    sp1.name='parent normal'
    sp1.cacheAs='normal';
    //sp1.alpha=0.5;

    let sp2 = new Sprite();
    sp2.graphics.clipRect(0,0,80,80);
    sp2.graphics.drawRect(0,0,100,100,'red','black',3);
    sp2.pos(10,10);
    //sp2.scale(0.5,0.5)

    Laya.stage.addChild(sp).addChild(sp1).addChild(sp2);

    setTimeout(() => {
        sp.graphics.clear();
        sp.graphics.clipRect(0,0,200,200);
        sp.graphics.drawRect(0,0,200,200,'gray','yellow',2)
    }, 3000);
}


test();