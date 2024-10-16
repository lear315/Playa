import "laya/ModuleDef";

import { Laya } from "../../../Laya";
import { Shader3D } from "../../RenderEngine/RenderShader/Shader3D";
import { Stage } from "../../display/Stage";
import { Sprite } from "../../display/Sprite";
import { BlurFilter } from "../../filters/BlurFilter";

//HierarchyLoader和MaterialLoader等是通过前面的import完成的

let packurl = 'sample-resource/2d'
async function test(){
    //初始化引擎
    await Laya.init(0,0);
    Laya.stage.scaleMode = Stage.SCALE_FULL;
    Laya.stage.screenMode = Stage.SCREEN_NONE;
    Shader3D.debugMode = true;

    await Laya.loader.loadPackage(packurl, null, null);
    let sp = new Sprite();
    sp.width=200;
    sp.pos(100,100);
    sp.graphics.drawRect(20,20,10,10,'white');
    sp.graphics.drawRect(40,40,100,100,'white');
    sp.filters=[new BlurFilter(10),new BlurFilter(10)];
    Laya.stage.addChild(sp);

    let ss = new Sprite();
    ss.pos(100,100);
    ss.graphics.drawRect(0,0,200,200,null,'red');
    Laya.stage.addChild(ss);

    function renderloop(){
        sp.repaint();
        requestAnimationFrame(renderloop);
    }
    requestAnimationFrame(renderloop)    
}


test();