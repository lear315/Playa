import "laya/ModuleDef";

import { Laya } from "../../../Laya";
import { Shader3D } from "../../RenderEngine/RenderShader/Shader3D";
import { Stage } from "../../display/Stage";
import { Sprite } from "../../display/Sprite";
import { GlowFilter } from "../../filters/GlowFilter";
import { ColorFilter } from "../../filters/ColorFilter";

//HierarchyLoader和MaterialLoader等是通过前面的import完成的

let packurl = 'sample-resource/2d'
async function test(){
    //初始化引擎
    await Laya.init(0,0);
    Laya.stage.scaleMode = Stage.SCALE_FULL;
    Laya.stage.screenMode = Stage.SCREEN_NONE;
    Shader3D.debugMode = true;

    await Laya.loader.loadPackage(packurl, null, null);
    let tex = await Laya.loader.load('atlas/comp/image.png')
    let sp = new Sprite();
    sp.graphics.drawTexture(tex,0,0,null,null,null);
    var redMat: any[] =
    [1, 0, 0, 0, 0, //R
        0, 0, 0, 0, 0, //G
        0, 0, 0, 0, 0, //B
        0, 0, 0, 1, 0];

    sp.filters=[new ColorFilter(redMat)];
    Laya.stage.addChild(sp);

}


test();