import { IBatchProgress } from "../../net/BatchProgress";
import { Texture2D } from "../../resource/Texture2D";
import { glTFResource } from "../glTFResource";
import { glTFExtension } from "./glTFExtension";

import { Material } from "../../resource/Material";
import { PBRMaterial } from "../../d3/core/material/PBRMaterial";
import * as glTF from "../glTFInterface";
import { PBRShaderLib } from "../../d3/shader/pbr/PBRShaderLib";
import { glTFShader } from "../shader/glTFShader";

const ExtensionName = "KHR_materials_anisotropy";

/** @internal */
export class KHR_materials_anisotropy implements glTFExtension {
    readonly name: string = ExtensionName;

    private _resource: glTFResource;

    constructor(resource: glTFResource) {
        this._resource = resource;
    }

    loadAdditionTextures(basePath: string, progress?: IBatchProgress): Promise<any> {
        let materials = this._resource.data.materials;
        let textures = this._resource.data.textures;

        if (materials && textures) {
            let promises: Array<Promise<Texture2D>> = [];
            materials.forEach(material => {
                let extension: glTF.glTFMaterialAnisotropy = material.extensions?.KHR_materials_anisotropy;
                if (extension) {
                    if (extension.anisotropyTexture) {
                        let promise = this._resource.loadTextureFromInfo(extension.anisotropyTexture, false, basePath, progress);
                        promises.push(promise);
                    }
                }
            });
            return Promise.all(promises);
        }
        else {
            return Promise.resolve();
        }
    }

    additionMaterialProperties(glTFMaterial: glTF.glTFMaterial, material: Material): void {
        let extension: glTF.glTFMaterialAnisotropy = glTFMaterial.extensions.KHR_materials_anisotropy;

        let anisotropy = extension.anisotropyStrength ?? 0.0;
        let rotation = extension.anisotropyRotation ?? 0.0;

        material.setDefine(PBRShaderLib.DEFINE_ANISOTROPY, true);
        material.setFloat("u_AnisotropyStrength", anisotropy);
        material.setFloat("u_AnisotropyRotation", rotation);

        if (extension.anisotropyTexture) {
            let tex = this._resource.getTextureWithInfo(extension.anisotropyTexture);
            material.setTexture("u_AnisotropyTexture", tex);
            material.setDefine(glTFShader.Define_AnisotropyMap, true);
        }
    }
}

glTFResource.registerExtension(ExtensionName, (resource) => new KHR_materials_anisotropy(resource));