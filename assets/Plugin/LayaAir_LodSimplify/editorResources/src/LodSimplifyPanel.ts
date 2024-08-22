@IEditor.panel("LodSimplifyPanel", {
    title: "细节层次减面工具"
})
export class LodSimplifyPanel extends IEditor.Dialog {
    private _data: any;

    async create(): Promise<void> {
        let panel = IEditor.GUIUtils.createInspectorPanel();
        this.contentPane = panel;
        this.setSize(700, 500);

        Editor.typeRegistry.addTypes([
            {
                name: "LodSimplifyData",
                properties: [
                    {
                        name: "meshRate",
                        localizedCaption: "模型压缩比例",
                        localizedTips: "根据设置的比例对模型网格进行压缩",
                        tips: "Compress the model mesh based on the set ratio.",
                        caption: "Mesh Rate",
                        type: "number",
                        default: 0.3,
                        range: [0, 1],
                        fractionDigits: 3,
                        percentage: true,
                        hidden: false,
                    },
                    {
                        name: "mincullRate",
                        localizedCaption: "最小剔除率",
                        caption: "Min Cull Rate",
                        localizedTips: "最小剔除率是指在某一级别的细节层次（LOD）下，对象被完全剔除（即不再绘制）的最小视角占比。这意味着当指定的模型物体在屏幕上的大小低于设定的比例时，该物体将不可见，从而帮助优化渲染性能和减少资源消耗。",
                        tips: "The minimum culling rate refers to the minimum percentage of the view angle at which objects are completely culled (i.e., no longer drawn) at a certain level of detail (LOD). This means that when the specified model object's size on the screen falls below the set ratio, the object becomes invisible, helping optimize rendering performance and reduce resource consumption.",
                        type: "number",
                        default: 0.3,
                        range: [0, 1],
                        fractionDigits: 3,
                        percentage: true,
                        hidden: "field.parent.parent.parent.target.data.targetType == 'Mesh'"
                    }
                ]
            },
            {
                name: "LodSimplify",
                localizedCaption: "细节层次减面工具",
                catalogBarStyle: "hidden",
                properties: [
                    {
                        name: "targetType",
                        localizedCaption: "目标类型",
                        localizedTips: "细节层次减面工具支持从节点、预制体、模型网格中对网格进行压缩，并根据设置的层次生成压缩后的模型",
                        tips: "The level-of-detail (LOD) reduction tool supports compressing meshes from nodes, prefabs, and model grids, generating compressed models based on the specified levels.",
                        enumSource: ["Node", "Prefab", "Mesh"],
                        default: "Node"
                    },
                    {
                        name: "nodeTarget",
                        caption: "target",
                        localizedCaption: "减面目标",
                        localizedTips: "节点类型的减面目标",
                        tips: "Reduction target of node type.",
                        type: "Node",
                        hidden: "data.targetType != 'Node'"
                    },
                    {
                        name: "prefabTarget",
                        caption: "target",
                        localizedCaption: "减面目标",
                        localizedTips: "预制体类型的减面目标",
                        tips: "Reduction target of prefab type.",
                        isAsset: true,
                        type: "Prefab",
                        hidden: "data.targetType != 'Prefab'"
                    },
                    {
                        name: "meshTarget",
                        caption: "target",
                        localizedCaption: "减面目标",
                        localizedTips: "网格类型的减面目标",
                        tips: "Reduction target of mesh type.",
                        isAsset: true,
                        type: "Mesh",
                        hidden: "data.targetType != 'Mesh'"
                    },
                    {
                        name: "lockBorder",
                        localizedCaption: "保留边界",
                        localizedTips: "勾选该功能，工具在生成LOD模型时，会保持这些位于边界的顶点不动，只移动和简化其他的顶点和元素，不会对模型的边缘进行过度简化。这样可以确保在模型被简化后，它的边界依然保持原样，防止边界形状的改变带来的视觉影响。",
                        tips: "By selecting this feature, the tool, when generating LOD (Level of Detail) models, will keep these vertices located on the boundaries stationary while only moving and simplifying other vertices and elements. It won't overly simplify the edges of the model. This ensures that after the model is simplified, its boundaries remain unchanged, preventing any visual impact from changes in the boundary shape.",
                        type: "boolean",
                    },
                    {
                        name: "overrideassetPath",
                        caption: "Override Save Assets Path",
                        localizedCaption: "指定存储路径",
                        localizedTips: "勾选该功能，会出现存储路径的输入框，可以自定义某个目录作为减面后生成的模型目录。否则会生成压缩模型到assets下的根目录",
                        tips: "By checking this feature, an input box for the storage path will appear, allowing you to customize a specific directory as the destination for the reduced models. Otherwise, the compressed models will be generated in the root directory under \"assets.\"",
                        type: "boolean",
                    },
                    {
                        name: "savePath",
                        caption: "Save Assets Path",
                        localizedCaption: "存储路径",
                        localizedTips: "拖拽或选择资源目录作为模型减面后生成的存储路径",
                        tips: "Drag and drop or select a resource directory as the storage path for the reduced models after the reduction process.",
                        type: "string",
                        inspector: "File",
                        options: {
                            absolutePath: false,
                            properties: ["openDirectory"]
                        },
                        hidden: "!data.overrideassetPath"
                    },
                    {
                        name: "LodConfig",
                        localizedCaption: "细节层次配置",
                        type: ["LodSimplifyData"],
                    },
                    {
                        name: "simplify",
                        inspector: "Buttons",
                        options: {
                            buttons: [{ caption: "减面", event: "simplify" }]
                        }
                    }
                ]
            }
        ])
        let configData: any = {}
        configData.targetType = "Node";
        configData.lockBorder = true;
        configData.LodConfig = [
            { meshRate: 1, mincullRate: 1 }, { meshRate: 0.5, mincullRate: 0.5 }, { meshRate: 0.2, mincullRate: 0.1 },
        ]
        let data = this._data = IEditor.DataWatcher.watch(configData);


        panel.inspect(data, "LodSimplify");

        this.contentPane.on("simplify", this.simplify, this);
    }

    private async simplify() {
        let data: any = {}
        data["lockBorder"] = this._data.lockBorder ? this._data.lockBorder : true;
        data["overrideassetPath"] = this._data.overrideassetPath ? this._data.overrideassetPath : false;
        data["savePath"] = this._data.savePath ? this._data.savePath : "";
        let lodConfig: any[] = data["LodConfig"] = [];
        let length = this._data.LodConfig.length;
        for (var i = 0; i < length; i++) {
            let config = this._data.LodConfig[i]
            lodConfig.push({ meshRate: config.meshRate, mincullRate: config.mincullRate })
        }
        if (this._data.targetType == "Node") {
            data["target"] = this._data.nodeTarget._$ref;
            Editor.scene.runScript("LodSimplifyUtils.lodSimplify", data);
        } else if (this._data.targetType == "Prefab") {
            data["target"] = this._data.prefabTarget._$uuid;
            Editor.scene.runScript("LodSimplifyUtils.lodPrefabSimplify", data);
        } else if (this._data.targetType == "Mesh") {
            data["target"] = this._data.meshTarget._$uuid;
            Editor.scene.runScript("LodSimplifyUtils.lodMeshSimplify", data);
        }
    }
}