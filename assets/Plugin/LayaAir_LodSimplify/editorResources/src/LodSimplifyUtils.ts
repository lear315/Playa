import { MeshSimplifyToolUtil } from "./MeshSimplifyToolUtil";
import Sprite3D = Laya.Sprite3D;
import Matrix4x4 = Laya.Matrix4x4;
import LODGroup = Laya.LODGroup;
import LODInfo = Laya.LODInfo;
import MeshRenderer = Laya.MeshRenderer;
import MeshFilter = Laya.MeshFilter;
import Mesh = Laya.Mesh;
import * as fpath from 'path';

@IEditorEnv.regClass()
export class LodSimplifyUtils {

    private static getMeshSprite(target: Sprite3D, list: Sprite3D[]) {
        let meshRender: MeshRenderer = target.getComponent(MeshRenderer);
        let meshFilter: MeshFilter = target.getComponent(MeshFilter);
        if (meshRender != undefined && meshFilter != undefined) {
            list.push(target);
        }
        const numChildren: number = target.numChildren;
        for (let i = 0; i < numChildren; i++) {
            this.getMeshSprite(target.getChildAt(i) as Sprite3D, list);
        }
    }
    static async loopGetData(renderLists: Sprite3D[], target: Sprite3D, meshRate: number, lockBorder: boolean, outPath: string, needCreate: boolean) {
        if (target == null) {
            return;
        }
        let meshRender: MeshRenderer = target.getComponent(MeshRenderer);
        let meshFilter: MeshFilter = target.getComponent(MeshFilter);
        if (meshRender != undefined && meshFilter != undefined) {
            if (needCreate) {
                let oldMesh: Mesh = meshFilter.sharedMesh;
                let meshAsset: IEditor.IAssetInfo = await EditorEnv.assetMgr.getAsset(oldMesh.uuid);
                let newMesh: Mesh = new MeshSimplifyToolUtil().simplyfyMesh(oldMesh, meshRate, lockBorder);
                meshFilter.sharedMesh = newMesh;
                await IEditorEnv.CreateAssetUtil.createMesh(newMesh, fpath.join(outPath, meshAsset.fileName))
            }
            renderLists.push(target)
        }
        const numChildren: number = target.numChildren;
        for (let i = 0; i < numChildren; i++) {
            await this.loopGetData(renderLists, target.getChildAt(i) as Sprite3D, meshRate, lockBorder, outPath, needCreate);
        }
    }
    static async createLod(hlod: LODInfo, target: Sprite3D, index: number, meshRate: number, lockBorder: boolean, outPath: string): Promise<Sprite3D> {
        let newSprite = target;
        let needCreate: boolean = false
        if (index != 0) {
            newSprite = Sprite3D.instantiate(target);
            needCreate = true;
        }
        newSprite.name = index.toString();
        let renderLists: Sprite3D[] = []
        await this.loopGetData(renderLists, newSprite, meshRate, lockBorder, outPath, needCreate)
        hlod.renders = renderLists;
        return newSprite;
    }

    static async lodMeshSimplify(data: any) {
        const assetId = data.target;
        const assetData: Mesh = await Laya.loader.load("res://" + assetId);
        if (assetData == undefined) {
            throw Error("未找到资源：" + assetId)
        }
        const assetInfo: IEditor.IAssetInfo = EditorEnv.assetMgr.getAsset(assetId);
        let LodConfig: any[] = data.LodConfig;
        let savePath: string = data.savePath;
        if (!data.overrideassetPath) {
            savePath = "Lod_" + assetInfo.name;
        } else {
            let absolutePath = fpath.join(EditorEnv.projectPath, savePath);
            savePath = fpath.relative(EditorEnv.assetsPath, absolutePath);
        }
        let lockBorder = data.lockBorder
        for (var i = 0; i < LodConfig.length; i++) {
            const meshRate: number = LodConfig[i].meshRate;
            if (meshRate >= 1) {
                continue;
            }
            let newMesh: Mesh = new MeshSimplifyToolUtil().simplyfyMesh(assetData, meshRate, lockBorder);
            await IEditorEnv.CreateAssetUtil.createMesh(newMesh, fpath.join(savePath, assetInfo.name + "_" + i.toString() + ".lm"))
        }

    }
    static async lodSimplify(this: IEditorEnv.IGameScene, data: any) {

        const nodeId = data.target;
        const nodeSprite: Sprite3D = <Sprite3D>this.getNodeById(nodeId);
        if (nodeSprite == undefined) {
            throw Error("未找到节点");
        }
        let list: Sprite3D[] = []
        LodSimplifyUtils.getMeshSprite(nodeSprite, list);
        if (list.length <= 0) {
            throw Error("未找到渲染节点");
        }
        const lodRoot: Sprite3D = new Sprite3D()
        lodRoot.name = nodeSprite.name + "lod";
        nodeSprite.parent.addChild(lodRoot);
        let matrix: Matrix4x4 = nodeSprite.transform.worldMatrix;
        lodRoot.transform.worldMatrix = matrix;
        let lodGroup: LODGroup = lodRoot.addComponent(LODGroup);
        let LodConfig: any[] = data.LodConfig;
        let lods: LODInfo[] = []
        let savePath: string = data.savePath;
        if (!data.overrideassetPath) {
            savePath = lodRoot.name;
        } else {
            let absolutePath = fpath.join(EditorEnv.projectPath, savePath);
            savePath = fpath.relative(EditorEnv.assetsPath, absolutePath);
        }
        for (var i = 0; i < LodConfig.length; i++) {
            const lod: LODInfo = lods[i] = new LODInfo(LodConfig[i].mincullRate);
            const outPath: string = fpath.join(savePath, "lod" + i);
            const newSprite: Sprite3D = await LodSimplifyUtils.createLod(lod, nodeSprite, i, LodConfig[i].meshRate, data.lockBorder, outPath);
            lodRoot.addChild(newSprite);
            newSprite.transform.localMatrix = Matrix4x4.DEFAULT;
        }
        lodGroup.lods = lods;
    }

    static async lodPrefabSimplify(data: any) {
        const assetId = data.target;
        const assetData: any = await Laya.loader.load("res://" + assetId);
        if (assetData == undefined) {
            throw Error("未找到资源：" + assetId)
        }
        const assetInfo: IEditor.IAssetInfo = EditorEnv.assetMgr.getAsset(assetId);
        let nodeSprite: Sprite3D = assetData.create();
        const lodRoot: Sprite3D = new Sprite3D()
        lodRoot.name = nodeSprite.name + "lod";
        let matrix: Matrix4x4 = nodeSprite.transform.worldMatrix;
        lodRoot.transform.worldMatrix = matrix;
        let lodGroup: LODGroup = lodRoot.addComponent(LODGroup);
        let LodConfig: any[] = data.LodConfig;
        let lods: LODInfo[] = []
        let savePath: string = data.savePath;
        if (!data.overrideassetPath) {
            savePath = lodRoot.name;
        } else {
            let absolutePath = fpath.join(EditorEnv.projectPath, savePath);
            savePath = fpath.relative(EditorEnv.assetsPath, absolutePath);
        }
        for (var i = 0; i < LodConfig.length; i++) {
            const lod: LODInfo = lods[i] = new LODInfo(LodConfig[i].mincullRate);
            const outPath: string = fpath.join(savePath, "lod" + i);
            const newSprite: Sprite3D = await LodSimplifyUtils.createLod(lod, nodeSprite, i, LodConfig[i].meshRate, data.lockBorder, outPath);
            lodRoot.addChild(newSprite);
            newSprite.transform.localMatrix = Matrix4x4.DEFAULT;
        }
        lodGroup.lods = lods;
        let dirPath;
        if (!data.overrideassetPath) {
            dirPath = fpath.dirname(assetInfo.fileName)
        } else {
            dirPath = savePath;
        }
        const assetName = assetInfo.name + "lod." + assetInfo.ext;
        await IEditorEnv.CreateAssetUtil.createPrefab(lodRoot, fpath.join(dirPath, assetName), 0)
    }
}