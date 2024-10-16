
import { Laya } from "../../../Laya";
import { Sprite } from "../../display/Sprite";
import { Stage } from "../../display/Stage";
import { Text } from "../../display/Text";

//HierarchyLoader和MaterialLoader等是通过前面的import完成的
async function test(){
    //初始化引擎
    await Laya.init(0,0);
    Laya.stage.scaleMode = Stage.SCALE_FULL;
    Laya.stage.screenMode = Stage.SCREEN_NONE;

    //在x>0,y>0的位置画
    let sp = new Sprite();
    sp.graphics.drawRect(100,100,100,100,'red');
    sp.cacheAs='bitmap';
    Laya.stage.addChild(sp);

    //在x<0,y<0的位置画
    let sp1 = new Sprite();
    sp1.graphics.drawRect(-100,-100,100,100,'red');
    sp1.cacheAs='bitmap';
    sp1.pos(300,100);
    Laya.stage.addChild(sp1);

    let desc = new Text();
    desc.text=`关于得到的包围盒的偏移问题。
每隔两秒切换一次是否cache，效果不应该变化`
    desc.color='green'
    desc.fontSize=32;
    desc.pos(100,300);
    Laya.stage.addChild(desc);

    let frm=0;
    let isbmp=true;
    function renderloop(){
        frm++;
        if(frm%120==0){
            isbmp=!isbmp;
            sp.cacheAs = isbmp?'bitmap':'none';
            sp1.cacheAs = isbmp?'bitmap':'none';
            desc.color = isbmp?'red':'green';
        }
        requestAnimationFrame(renderloop);
    }
    requestAnimationFrame(renderloop)
}


test();