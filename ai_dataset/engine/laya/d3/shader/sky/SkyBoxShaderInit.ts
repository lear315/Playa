import { Shader3D, ShaderFeatureType } from "../../../RenderEngine/RenderShader/Shader3D";
import SkyboxVS from "./SkyBox.vs";
import SkyboxFS from "./SkyBox.fs";
import { Color } from "../../../maths/Color";
import { AttributeMapType, SubShader } from "../../../RenderEngine/RenderShader/SubShader";
import { VertexMesh } from "../../../RenderEngine/RenderShader/VertexMesh";
import { CullMode } from "../../../RenderEngine/RenderEnum/CullMode";
import { ShaderDataType } from "../../../RenderDriver/DriverDesign/RenderDevice/ShaderData";
import { RenderState } from "../../../RenderDriver/RenderModuleData/Design/RenderState";

export class SkyBoxShaderInit {

    static init() {

        let attributeMap: AttributeMapType = {
            "a_Position": [VertexMesh.MESH_POSITION0, ShaderDataType.Vector4]
        };

        let uniformMap = {
            "u_TintColor": ShaderDataType.Color,
            "u_Exposure": ShaderDataType.Float,
            "u_Rotation": ShaderDataType.Float,
            "u_CubeTexture": ShaderDataType.TextureCube
        };

        let defaultValue = {
            "u_TintColor": new Color(0.5, 0.5, 0.5, 0.5),
            "u_Exposure": 1,
            "u_Rotation": 0
        };

        let shader = Shader3D.add("SkyBox");
        shader.shaderType = ShaderFeatureType.Sky;
        let subShader = new SubShader(attributeMap, uniformMap, defaultValue);
        shader.addSubShader(subShader);
        let pass = subShader.addShaderPass(SkyboxVS, SkyboxFS);
        pass.renderState.depthTest = RenderState.DEPTHTEST_LEQUAL;
        pass.renderState.cull = CullMode.Back;
        pass.renderState.depthWrite = false;
        pass.renderState.stencilWrite = false;
        pass.statefirst = true;


    }

}