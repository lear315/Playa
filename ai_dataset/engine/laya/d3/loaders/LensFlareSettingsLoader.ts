import { IResourceLoader, ILoadTask, Loader } from "../../net/Loader";
import { LensFlareData, LensFlareElement } from "../core/render/PostEffect/LensFlares/LensFlareEffect";
import { URL } from "../../net/URL";
import { Color } from "../../maths/Color";
import { Vector2 } from "../../maths/Vector2";

/**
 * @ignore
 * @en Usedfor loading lens flare.
 * @zh 用于加载镜头光晕数据资源。
 */
export class LensFlareSettingsLoader implements IResourceLoader {
    /**
     * @en Load lens flare from a specified URL.
     * @param task The load task that contains the URL and other loading options.
     * @returns A Promise, when loaded successfully, it is resolves with the loaded `LensFlareData` object or null if loading fails.
     * @zh 加载指定的镜头光晕数据资源。
     * @param task 包含 URL 和其他加载选项的加载任务。
     * @returns 一个Promise，加载成功时解析为加载的 `LensFlareData` 对象，加载失败时为 null。
     */
    load(task: ILoadTask) {
        return task.loader.fetch(task.url, "json", task.progress.createCallback(), task.options).then(data => {
            if (!data)
                return null;
            let ret = new LensFlareData();
            let basePath = URL.getPath(task.url);
            let promises: Array<any> = [];

            let elements = data.elements;
            if (elements)
                for (let i = elements.length - 1; i >= 0; i--) {
                    let e = elements[i];
                    if (e.texture && (e.texture as any)._$uuid && '' != (e.texture as any)._$uuid) {
                        let url = URL.getResURLByUUID((e.texture as any)._$uuid);
                        if (!url.startsWith("res://"))
                            url = URL.join(basePath, url);
                        promises.push(task.loader.load(url).then((t) => {
                            e.texture = t;
                        }))
                    }
                    if (e.tint) {
                        e.tint = new Color(e.tint.r, e.tint.g, e.tint.b, e.tint.a);
                    }
                    if (e.positionOffset) {
                        e.positionOffset = new Vector2(e.positionOffset.x, e.positionOffset.y);
                    }
                    if (e.scale) {
                        e.scale = new Vector2(e.scale.x, e.scale.y);
                    }
                }

            return Promise.all(promises).then(() => {
                ret.elements = elements;
                return ret;
            });
        });
    }
}

Loader.registerLoader(["lensflare"], LensFlareSettingsLoader);