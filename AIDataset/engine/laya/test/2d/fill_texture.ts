import "../../d3/core/scene/Scene3D";
import "../../ModuleDef";
import "../../d3/ModuleDef";
import "../../d3/physics/ModuleDef";
import "../../ui/ModuleDef";
import "../../ani/ModuleDef";
import "../../spine/ModuleDef";
import "../../gltf/glTFLoader";

import { Laya } from "../../../Laya";
import { Shader3D } from "../../RenderEngine/RenderShader/Shader3D";
import { Stage } from "../../display/Stage";
import { Sprite } from "../../display/Sprite";

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
    sp.graphics.fillText('Abc文字',100,100,'36px Arial','red',"left");
    sp.graphics.fillText('文字',100,150,'36px Arial','red',"left");
    sp.graphics.fillTexture(tex,100,200,800,100);
    Laya.stage.addChild(sp);

    function renderloop(){
        requestAnimationFrame(renderloop);
    }
    requestAnimationFrame(renderloop)
}


test();