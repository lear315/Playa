/**
 * Author: CUESOR
 * Date: 2024-07-25
 */

import { error } from "./Logger";


export default class ResLoader {

    private static _resLoader: ResLoader;

    /**
     * 获取ResLoader的单例
     * @returns ResLoader实例
     */
    public static get Ins(): ResLoader {
        if (!ResLoader._resLoader) {
            ResLoader._resLoader = new ResLoader()
        }
        return ResLoader._resLoader
    }

    /**
     * 清除指定URL的资源
     * @param urls 要清除的资源URL数组
     */
    public static clearRes(urls: string[]): void {
        for (const url of urls) {
            const res = Laya.loader.getRes(url);
            if (res) {
                if (res instanceof Laya.Sprite3D) {
                    res.destroy(true);
                } else if (res instanceof Laya.Texture2D) {
                    res.destroy();
                } else if (typeof res.dispose === 'function') {
                    res.dispose();
                }
            }
            Laya.loader.clearRes(url);
        }
    }

    /**
     * 同步获取资源
     * @param url 资源URL
     * @param noClone 是否不克隆资源
     * @returns Promise<any>
     */
    public static async getResSync(url: string, clone: boolean = true): Promise<any> {
        await ResLoader.loadResSync(url);
        let getRes = ResLoader.getRes(url)
        if (getRes == null) {
            error("资源尚未加载", url);
            return null;
        }
        if (clone == false) {
            return getRes;
        } else {
            return getRes.create();
        }
    }

    /**
     * 异步加载资源
     * @param urls 单个URL或URL数组
     * @param onProgress 加载进度回调
     * @returns Promise<any>
     */
    public static async loadResSync(urls: string | string[], onProgress: Laya.Handler = null): Promise<any> {
        return new Promise(function (resolve, reject) {
            let flag = true;
            if (urls instanceof Array) {
                // 判断是否需要加载
                for (let i = 0; i < urls.length; i++) {
                    const url = urls[i];
                    if (Laya.loader.getRes(url) == undefined) {
                        flag = false;
                        break;
                    }
                }
            } else {
                flag = Laya.loader.getRes(urls);
            }

            if (flag) {
                // 已存在
                resolve(true);
            } else {
                // 异步加载
                Laya.loader.load(urls, Laya.Handler.create(null, () => {
                    resolve(true);
                }), onProgress);

            }
        });
    }

    /**
     * 获取资源
     * @param url 资源URL
     * @returns 资源对象或null
     */
    public static getRes(url: string) {
        
        let res = Laya.loader.getRes(url);
        if (res) {
            return res;
        } else {
            error("getRes fails: " + url);
            return null;
        }
    }

    /**
     * 安全获取资源，如果资源不存在则先加载
     * @param url 资源URL
     * @param context 回调上下文
     * @param complete 完成回调
     */
    public static getResSafe(url: string, context: Object = null, complete: Function = null) {
        let res = Laya.loader.getRes(url);
        if (res) {
            complete.apply(context, [res]);
        } else {
            ResLoader.load([url], this, () => {
                let res = Laya.loader.getRes(url);
                complete.apply(context, [res]);
            });
        }
    }

    /**
     * 加载单个资源
     * @param url 资源URL
     * @param context 回调上下文
     * @param complete 完成回调
     */
    public static loadRes(url: string, context: Object = null, complete: Function = null){
        ResLoader.load([url], context, complete)
    }

    /**
     * 异步加载资源
     * @param urls 资源URL数组
     * @returns Promise<boolean>
     */
    public static async loadAsync(urls: string[]): Promise<boolean> {
        return new Promise((resolve) => {
            ResLoader.load(urls, this, () => {
                resolve(true);
            });
        });
    }

    /**
     * 根据URL获取资源类型
     * @param url 资源URL
     * @returns 资源类型字符串
     */
    public static getTypeFromUrl(url: string): string {
        let type;
        if (!type) {
            let ext = Laya.Utils.getFileExtension(url);
            switch (ext) {
                case "lh":
                case "ls":
                    type = Laya.Loader.HIERARCHY;
                    break;
                case "lm":
                    type = Laya.Loader.MESH;
                    break;
                case "lmat":
                    type = Laya.Loader.MATERIAL;
                    break;
                case "jpg":
                case "jpeg":
                case "bmp":
                case "gif":
                case "png":
                case "dds":
                case "ktx":
                case "pvr":
                    type = Laya.Loader.TEXTURE2D;
                    break;
                case "lani":
                case "lav":
                    type = Laya.Loader.ANIMATIONCLIP;
                    break;
                case "ltc":
                case "ltcb":
                case "ltcb.ls":
                    type = Laya.Loader.TEXTURECUBE;
                    break;
                case "thdata":
                    type = Laya.Loader.TERRAINHEIGHTDATA;
                    break;
                case "zip":
                    type = "ZIP";
                    break;
                case "lanit.ls":
                    type = Laya.Loader.TEXTURE2D;
                    break;
                case "json":
                    type = Laya.Loader.JSON;
                    break;
                case "fui":
                    type = "FUI";
                    break;
                default:
                    type = Laya.Loader.BUFFER;
                    break;
            }
        }
        return type;
    }

    /**
     * 加载资源
     * @param urls 资源URL数组
     * @param context 回调上下文
     * @param complete 完成回调
     * @param progress 进度回调
     */
    public static load(urls: string[], context: Object = null, complete: Function = null, progress: Function = null): void {
        const infoUrls: { url: string; type: string }[] = [];
        const extUrls: string[] = [];

        for (let i = 0; i < urls.length; i++) {
            const url = urls[i];
            if (this.isExtRes(url)) {
                extUrls.push(url);
            } else {
                infoUrls.push({ url, type: this.getTypeFromUrl(url) });
            }
        }

        if (infoUrls.length === 0 && extUrls.length === 0) {
            complete?.call(context);
            return;
        }

        const completeHandler = complete ? Laya.Handler.create(context, complete) : null;
        const progressHandler = progress ? Laya.Handler.create(context, progress) : null;

        if (extUrls.length > 0) {
            this.loadExtResources(extUrls, () => {
                if (infoUrls.length === 0) {
                    complete?.call(context);
                } else {
                    Laya.loader.load(infoUrls, completeHandler, progressHandler);
                }
            });
        } else {
            Laya.loader.load(infoUrls, completeHandler, progressHandler);
        }
    }

    /**
     * 加载特殊资源
     * @param extUrls 特殊资源URL数组
     * @returns Promise数组
     */
    public static extLoad(extUrls: string[]): Promise<boolean>[] {
        return extUrls.map(url => {
            const ext = Laya.Utils.getFileExtension(url);
            if (ext === "zip") {
                const infoUrls = [{ url, type: ResLoader.getTypeFromUrl(url) }];
                return new Promise<boolean>((resolve) => {
                    Laya.loader.load(infoUrls, Laya.Handler.create(this, () => {
                        resolve(true);
                    }));
                });
            }
            return Promise.resolve(false);
        });
    }

    /**
     * 判断是否为特殊资源
     * @param url 资源URL
     * @returns 是否为特殊资源
     */
    public static isExtRes(url: string): boolean {
        let ext = Laya.Utils.getFileExtension(url);
        if (ext == "fui") {
            return true;
        } else if (ext == "zip") {
            return true;
        }
        return false;
    }

    /**
     * 加载特殊资源
     * @param extUrls 特殊资源URL数组
     * @param callback 完成回调
     */
    private static loadExtResources(extUrls: string[], callback: Function): void {
        let loadedCount = 0;
        const totalCount = extUrls.length;

        const onResourceLoaded = () => {
            loadedCount++;
            if (loadedCount === totalCount) {
                callback();
            }
        };

        for (let i = 0; i < totalCount; i++) {
            const url = extUrls[i];
            const ext = Laya.Utils.getFileExtension(url);
            if (ext === "zip") {
                const infoUrls = [{ url, type: this.getTypeFromUrl(url) }];
                Laya.loader.load(infoUrls, Laya.Handler.create(this, onResourceLoaded));
            } else {
                onResourceLoaded();
            }
        }
    }
}
