@IEditor.panel("BakeAnimationPanel", {
    title: "动作烘焙"
})
export class BakeAnimationDialog extends IEditor.EditorPanel {
    private _data: any;

    public async create() {
        this._panel = IEditor.GUIUtils.createInspectorPanel();

        this._data = IEditor.DataWatcher.watch({});
        this._data.fps = 30;
        this._data.ignoreSkeleton = true;
        (<IEditor.InspectorPanel>this._panel).inspect(this._data, {
            name: "BakeAnimationPanel",
            catalogBarStyle: "hidden",
            properties: [
                {
                    name: "info",
                    type: "Info",
                    tips: i18n.t("dragInAnimator"),
                },

                {
                    name: "target",
                    caption: i18n.t("targetNode"),
                    type: "Animator",
                },

                {
                    name: "ignoreSkeleton",
                    caption: "忽略骨架",
                    type: "boolean",
                },
                {
                    name: "fps",
                    caption: "帧数/秒",
                    type: "number",
                    step: 1,
                },
                {
                    name: "overrideassetPath",
                    caption: "Override Save Assets Path",
                    localizedCaption: "指定存储路径",
                    localizedTips: "勾选该功能，会出现存储路径的输入框，可以自定义某个目录作为减面后生成的模型目录。否则会生成压缩模型到assets下的根目录",
                    tip: "By checking this feature, an input box for the storage path will appear, allowing you to customize a specific directory as the destination for the reduced models. Otherwise, the compressed models will be generated in the root directory under \"assets.\"",
                    type: "boolean",
                },
                {
                    name: "savePath",
                    caption: "Save Assets Path",
                    localizedCaption: "存储路径",
                    localizedTips: "拖拽或选择资源目录作为模型减面后生成的存储路径",
                    tip: "Drag and drop or select a resource directory as the storage path for the reduced models after the reduction process.",
                    type: "string",
                    inspector: "File",
                    options: {
                        absolutePath: false,
                        properties: ["openDirectory"]
                    },
                    hidden: "!data.overrideassetPath"
                },
                {
                    name: "bake",
                    inspector: "Buttons",
                    options: {
                        buttons: [{ caption: "烘焙动作", event: "bake" }],
                    }
                }
            ]
        });

        this._panel.on("bake", this.bake, this);
    }

    private async bake() {
        let data = {
            nodeId: this._data.target._$ref,
            fps: this._data.fps,
            ignoreSkeleton: this._data.ignoreSkeleton != null ? this._data.ignoreSkeleton : true,
            overrideassetPath: this._data.overrideassetPath ? this._data.overrideassetPath : false,
            savePath: this._data.savePath ? this._data.savePath : "",
        }
        Editor.scene.runScript("BakeAnimation.bakeAnimation", data);
    }

}