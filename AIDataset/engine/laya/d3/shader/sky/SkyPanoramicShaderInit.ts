import { Shader3D, ShaderFeatureType } from "../../../RenderEngine/RenderShader/Shader3D";
import SkyPanoramicVS from "./SkyPanoramic.vs";
import SkyPanoramicFS from "./SkyPanoramic.fs";
import { Texture2D } from "../../../resource/Texture2D";
import { Color } from "../../../maths/Color";
import { AttributeMapType, SubShader } from "../../../RenderEngine/RenderShader/SubShader";
import { VertexMesh } from "../../../RenderEngine/RenderShader/VertexMesh";
import { CullMode } from "../../../RenderEngine/RenderEnum/CullMode";
import { ShaderDataType } from "../../../RenderDriver/DriverDesign/RenderDevice/ShaderData";
import { RenderState } from "../../../RenderDriver/RenderModuleData/Design/RenderState";

export class SkyPanoramicShaderInit {
    static init() {
        let attributeMap: AttributeMapType = {
            "a_Position": [VertexMesh.MESH_POSITION0, ShaderDataType.Vector4]
        };

        let uniformMap = {
            'u_TintColor': ShaderDataType.Color,
            'u_Rotation': ShaderDataType.Float,
            'u_Texture': ShaderDataType.Texture2D,
            'u_Exposure':ShaderDataType.Float,
        };

        let defaultValue = {
            'u_TintColor': new Color(0.5,0.5,0.5,1.0),
            'u_Exposure': 1.3,
            'u_Rotation': 0,
            'u_Texture': Texture2D.grayTexture,
        };
        let shader = Shader3D.add("SkyPanoramic");
        shader.shaderType = ShaderFeatureType.Sky;
        let subShader = new SubShader(attributeMap, uniformMap, defaultValue);
        shader.addSubShader(subShader);
        let pass = subShader.addShaderPass(SkyPanoramicVS, SkyPanoramicFS);
        pass.renderState.depthTest = RenderState.DEPTHTEST_LEQUAL;
        pass.renderState.cull = CullMode.Back;
        pass.renderState.depthWrite = false;
        pass.renderState.stencilWrite = false;
        pass.statefirst = true;
    }
}