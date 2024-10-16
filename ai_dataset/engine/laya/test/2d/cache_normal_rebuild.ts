import "laya/ModuleDef";
import "laya/ani/ModuleDef";
import "laya/ui/ModuleDef";

import { Laya } from "../../../Laya";
import { Shader3D } from "../../RenderEngine/RenderShader/Shader3D";
import { Sprite } from "../../display/Sprite";
import { Stage } from "../../display/Stage";

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
    sp.graphics.drawTexture(tex,100,100,null,null,null);
    //sp.graphics.drawTexture(tex,100,300,null,null,null);
    Laya.stage.addChild(sp);

    //建立一个sprite，每张贴图的字都用一个，然后想法gc，应该渲染正确
    let sp1 = new Sprite();
    //sp1.graphics.fillText('天日寒',0,0,'32px Arial','red',"left");
    sp1.graphics.drawTexture(tex,0,0,null,null,null);
    sp1.pos(100,420);
    sp1.cacheAs='normal'
    Laya.stage.addChild(sp1);

    setTimeout(()=>{
        sp1._cacheStyle.cacheInfo.reset();
    },3000);
}


test();