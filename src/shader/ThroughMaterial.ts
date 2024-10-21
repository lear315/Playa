export class ThroughMaterial extends Laya.Material
{
    static initShader() {
        var uniformMap = {
           
        };
        var vs = `
        #define SHADER_NAME ThroughShaderFS
        #include "Sprite3DVertex.glsl"
        #include "VertexCommon.glsl"
        #include "Camera.glsl"
        #include "BlinnPhongVertex.glsl"
        #include "Scene.glsl"
        #include "Color.glsl"


        
        void main() 
        {
            Vertex vertex;
            getVertexParams(vertex);

            mat4 worldMatrix = getWorldMatrix();
            vec4 posWS = (worldMatrix * vec4(vertex.positionOS, 1.0));
            posWS.xyz /= posWS.w;

            v_PositionWS = posWS.xyz;

            gl_Position = getPositionCS(v_PositionWS);
            gl_Position = remapPositionZ(gl_Position);

        }`;
        var ps = `
  
        #define SHADER_NAME ThroughShaderFS
        void main() {
            gl_FragColor = vec4(0.2, 0.6, 1.0, 0.5);
        }
        `
        
        let customShader = Laya.Shader3D.add("ThroughShader");
        customShader._enableInstancing = true;
        customShader._supportReflectionProbe = false;
        let subShader = new Laya.SubShader(Laya.SubShader.DefaultAttributeMap, uniformMap);
        customShader.addSubShader(subShader);

        let shaderPass = subShader.addShaderPass(vs, ps);
        shaderPass.statefirst = true;

        shaderPass.renderState.cull = undefined;
        shaderPass.renderState.blend = 1;
        shaderPass.renderState.srcBlend = 6;
        shaderPass.renderState.dstBlend = 7;
        shaderPass.renderState.srcBlendRGB = null;
		shaderPass.renderState.dstBlendRGB =  null;

        shaderPass.renderState.srcBlendAlpha =  null;
        shaderPass.renderState.dstBlendAlpha =  null;
        shaderPass.renderState.blendEquation =  null;
        shaderPass.renderState.blendEquationRGB =null;
        shaderPass.renderState.blendEquationAlpha = null;

        shaderPass.renderState.depthTest = 4;
        shaderPass.renderState.depthWrite = false;

        shaderPass.renderState.stencilRef = 127;
        shaderPass.renderState.stencilTest = 1;
        shaderPass.renderState.stencilWrite = true;
        shaderPass.renderState.stencilOp = new Laya.Vector3(Laya.RenderState.STENCILOP_KEEP, Laya.RenderState.STENCILOP_KEEP, Laya.RenderState.STENCILOP_REPLACE);

        // shaderPass.renderState.cull = Laya.RenderState.CULL_BACK;
        // shaderPass.renderState.blend = 1;
        // shaderPass.renderState.srcBlend = 6;
        // shaderPass.renderState.dstBlend = 7;
        // shaderPass.renderState.srcBlendRGB = Laya.RenderState.BLENDPARAM_ONE;
		// shaderPass.renderState.dstBlendRGB = Laya.RenderState.BLENDPARAM_ZERO;

        // shaderPass.renderState.srcBlendAlpha = Laya.RenderState.BLENDPARAM_ONE;
        // shaderPass.renderState.dstBlendAlpha = Laya.RenderState.BLENDPARAM_ZERO;
        // shaderPass.renderState.blendEquation =  Laya.RenderState.BLENDEQUATION_ADD;
        // shaderPass.renderState.blendEquationRGB = Laya.RenderState.BLENDEQUATION_ADD;
        // shaderPass.renderState.blendEquationAlpha = Laya.RenderState.BLENDEQUATION_ADD;

        // shaderPass.renderState.depthTest = 4;
        // shaderPass.renderState.depthWrite = false;

        // shaderPass.renderState.stencilRef = 127;
        // shaderPass.renderState.stencilTest = 1;
        // shaderPass.renderState.stencilWrite = true;
        // shaderPass.renderState.stencilOp = new Laya.Vector3(Laya.RenderState.STENCILOP_KEEP, Laya.RenderState.STENCILOP_KEEP, Laya.RenderState.STENCILOP_REPLACE);
        
    }

    constructor() {
        super();
        this.setShaderName("ThroughShader");
    }
}