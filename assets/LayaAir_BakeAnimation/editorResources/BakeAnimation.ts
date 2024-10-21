import { BackAnimatorData } from "./BackAnimatorData";
import Sprite3D = Laya.Sprite3D;
import * as fpath from 'path';

@IEditorEnv.regClass()
export class BakeAnimation {
    static async bakeAnimation(this: IEditorEnv.IGameScene, data: any) {
        let animSprite = <Sprite3D>this.getNodeById(data.nodeId);
        if (animSprite == undefined) {
            throw Error("未找到节点")
        }
        let path = data.savePath;
        if (!data.overrideassetPath) {
            path = fpath.join("assets", animSprite.name);
        }
        let error: string[] = []
        let bake: BackAnimatorData = new BackAnimatorData(data.fps, data.ignoreSkeleton, animSprite, path, error);
        if (!bake.canBake) {
            throw Error(error[0]);
        }
        await bake.saveFiles()
    }
}