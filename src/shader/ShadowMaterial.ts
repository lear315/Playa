export class ShadowMaterial extends Laya.Material
{
    static initShader() {
        var uniformMap = {
           
        };
        var vs = `
        #include "Color.glsl"
        #include "Scene.glsl"
        #include "Camera.glsl"
        #include "Sprite3DVertex.glsl"
        #include "VertexCommon.glsl"
        #include "BlinnPhongVertex.glsl"
   

        
        void main() 
        {
            Vertex vertex;
            getVertexParams(vertex);

            mat4 worldMatrix = getWorldMatrix();
            vec4 positionWS = (worldMatrix * vec4(vertex.positionOS, 1.0));
            positionWS.xyz /= positionWS.w;

            float shadowHeight = 0.01;
            vec3 lightDir = vec3(-0.6, 0.8, 0.0);
            vec3 shadowPos = vec3(0.0, shadowHeight, 0.0);
            shadowPos.xz = positionWS.xz - lightDir.xz * (positionWS.y - shadowHeight)  / lightDir.y;

            gl_Position = getPositionCS(shadowPos);
            gl_Position = remapPositionZ(gl_Position);

        }`;
        var ps = `
  

        void main() {
            gl_FragColor = vec4(0.01, 0.01, 0.01, 0.99);
        }
        `
        
        let customShader = Laya.Shader3D.add("ShadowShader");
        let subShader = new Laya.SubShader(Laya.SubShader.DefaultAttributeMap, uniformMap);
        customShader.addSubShader(subShader);

        let shaderPass = subShader.addShaderPass(vs, ps);
        shaderPass.statefirst = true;

        shaderPass.renderState.cull = 0;
        shaderPass.renderState.blend = 1;
        shaderPass.renderState.srcBlend = 6;
        shaderPass.renderState.dstBlend = 7;
        shaderPass.renderState.srcBlendRGB = Laya.RenderState.BLENDPARAM_ONE;
		shaderPass.renderState.dstBlendRGB = Laya.RenderState.BLENDPARAM_ZERO;


        shaderPass.renderState.srcBlendAlpha = Laya.RenderState.BLENDPARAM_ONE;
        shaderPass.renderState.dstBlendAlpha = Laya.RenderState.BLENDPARAM_ZERO;
        shaderPass.renderState.blendEquation =  Laya.RenderState.BLENDEQUATION_ADD;
        shaderPass.renderState.blendEquationRGB = Laya.RenderState.BLENDEQUATION_ADD;
        shaderPass.renderState.blendEquationAlpha = Laya.RenderState.BLENDEQUATION_ADD;

        shaderPass.renderState.depthTest = 3;
        shaderPass.renderState.depthWrite = false;

        shaderPass.renderState.stencilTest = 5;
        shaderPass.renderState.stencilRef = 88;
        shaderPass.renderState.stencilWrite = true;
        shaderPass.renderState.stencilOp = new Laya.Vector3(Laya.RenderState.STENCILOP_KEEP, Laya.RenderState.STENCILOP_KEEP, Laya.RenderState.STENCILOP_REPLACE);

    }

    constructor() {
        super();
        this.setShaderName("ShadowShader");
    }
}