export class OutlineMaterial extends Laya.Material
{
    static initShader() {
        var uniformMap = {
            'u_MvpMatrix': Laya.Shader3D.PERIOD_SPRITE
        };
        var vs = `
        #include "Sprite3DVertex.glsl"
        #include "VertexCommon.glsl"
        #include "Camera.glsl"
        
        void main() 
        {
          Vertex vertex;
          getVertexParams(vertex);
          mat4 worldMatrix = getWorldMatrix();
          vec3 positionWS = (worldMatrix * vec4(vertex.positionOS, 1.0)).xyz;
          mat4 normalMat = transpose(inverse(worldMatrix));
          vec3 normalWS = normalize((normalMat * vec4(vertex.normalOS, 0.0)).xyz);
          positionWS += normalWS * 0.1;
          gl_Position = getPositionCS(positionWS);
          gl_Position = remapPositionZ(gl_Position);
        }`;
        var ps = `
        #if defined(GL_FRAGMENT_PRECISION_HIGH)
        precision highp float;
        #else
        precision mediump float;
        #endif
        void main() {
        gl_FragColor = vec4(0.9, 0.2, 0.1, 1.0);
        }
        `
        
        let customShader = Laya.Shader3D.add("outlineShader");
        let subShader = new Laya.SubShader(Laya.SubShader.DefaultAttributeMap, uniformMap);
        customShader.addSubShader(subShader);
        let shaderPass = subShader.addShaderPass(vs, ps);
        shaderPass.statefirst = true;


        shaderPass.renderState.cull = Laya.RenderState.CULL_FRONT;
        shaderPass.renderState.blend = Laya.RenderState.BLEND_DISABLE;;
        shaderPass.renderState.srcBlend = Laya.RenderState.BLENDPARAM_ONE;
        shaderPass.renderState.dstBlend = Laya.RenderState.BLENDPARAM_ZERO;
        shaderPass.renderState.srcBlendRGB = Laya.RenderState.BLENDPARAM_ONE;
		shaderPass.renderState.dstBlendRGB = Laya.RenderState.BLENDPARAM_ZERO;

        shaderPass.renderState.srcBlendAlpha = Laya.RenderState.BLENDPARAM_ONE;
        shaderPass.renderState.dstBlendAlpha = Laya.RenderState.BLENDPARAM_ZERO;
        shaderPass.renderState.blendEquation =  Laya.RenderState.BLENDEQUATION_ADD;
        shaderPass.renderState.blendEquationRGB = Laya.RenderState.BLENDEQUATION_ADD;
        shaderPass.renderState.blendEquationAlpha = Laya.RenderState.BLENDEQUATION_ADD;

        shaderPass.renderState.depthTest = Laya.RenderState.DEPTHTEST_LEQUAL;
        shaderPass.renderState.depthWrite = true;

        shaderPass.renderState.stencilRef = 1;
        shaderPass.renderState.stencilTest = Laya.RenderState.STENCILTEST_OFF;
        shaderPass.renderState.stencilWrite = false;
        shaderPass.renderState.stencilOp = new Laya.Vector3(Laya.RenderState.STENCILOP_KEEP, Laya.RenderState.STENCILOP_KEEP, Laya.RenderState.STENCILOP_REPLACE);



    }

    constructor() {
        super();
        this.setShaderName("outlineShader");
    }
}