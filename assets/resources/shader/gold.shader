Shader3D Start
{
    type:Shader3D,
    name:GoldShader,
    enableInstancing:false,
    supportReflectionProbe: false,
    renderQueue: 2100,
    uniformMap: {
        u_DiffuseColor: {type: Color, default: [1.0, 0.84, 0.0, 1.0]}
        u_LightColor: {type: Color, default: [1.0, 1.0, 0.8, 1.0]}
    },
    defines: {
        NOISE: {alias: "磨砂", type: bool, default: true, private: false}
    },
    shaderPass:[
        {
            pipeline: Forward,
            VS: GoldVS,
            FS: GoldFS
        }
    ]

}
Shader3D End

GLSL Start

#defineGLSL GoldVS
    #define SHADERNAME GoldVS

    #include "Math.glsl";

    #include "Scene.glsl";
    #include "SceneFogInput.glsl";

    #include "Camera.glsl";
    #include "Sprite3DVertex.glsl";

    #include "VertexCommon.glsl";

    #include "BlinnPhongVertex.glsl";


    varying float vEdgeFactor; // 传递给片段着色器的边缘因子

    void main()
    {
        Vertex vertex;
        getVertexParams(vertex);

        PixelParams pixel;
        initPixelParams(pixel, vertex);

        v_PositionWS = pixel.positionWS;
        v_NormalWS = pixel.normalWS;

        vec3 viewDirection = normalize(v_PositionWS);
        vEdgeFactor = pow(1.0 - abs(dot(viewDirection, v_NormalWS)), 2.5); // 边缘检测

        gl_Position = getPositionCS(pixel.positionWS);

        gl_Position = remapPositionZ(gl_Position);
    }

#endGLSL

#defineGLSL GoldFS
    #define SHADERNAME GoldFS

    #include "Color.glsl";

    #include "Scene.glsl";
    #include "SceneFog.glsl";
    #include "Camera.glsl";
    #include "Sprite3DFrag.glsl";
    #include "BlinnPhongFrag.glsl";

    varying float vEdgeFactor; // 接收顶点着色器传递的边缘因子

    // 用于生成磨砂颗粒效果的噪声函数
    float rand(vec2 co) {
        return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
    }

    void main()
    {
        PixelParams pixel;
        getPixelParams(pixel);
        vec3 lightColor = u_LightColor.rgb; // 光源颜色 (白色光)
        vec3 objectColor = u_DiffuseColor.rgb; // 黄金颜色
        // 环境光
        float ambientStrength = 0.3;
        vec3 ambient = ambientStrength * lightColor;
        // 漫反射光
        vec3 norm = normalize(v_NormalWS);
        vec3 lightDir = normalize(vec3(8.0, 5.0, -8.0) - v_PositionWS);
        float diff = max(dot(norm, lightDir), 0.0);
        vec3 diffuse = diff * lightColor;
        // 镜面反射光 (弱化镜面反射，模拟哑光效果)
        float specularStrength = 1.1;
        vec3 viewDir = normalize(u_CameraPos - v_PositionWS);
        vec3 reflectDir = reflect(-lightDir, norm);
        float spec = pow(max(dot(viewDir, reflectDir), 0.0), 32.0);
        vec3 specular = specularStrength * spec * lightColor;
        // 边缘闪光
        vec3 edgeColor = vec3(1.0, 0.84, 0.0); // 白色闪光
        float edgeStrength = 1.0; // 闪光强度
        vec3 edgeHighlight = edgeStrength * vEdgeFactor * edgeColor;
        vec3 matteColor;
        #ifdef NOISE
            // 添加随机噪声
            float noise = rand(v_Texcoord0);
            matteColor = objectColor * (0.85 + 0.45 * noise);
        #else
            matteColor = objectColor;
        #endif
        // 组合结果
        vec3 result = (ambient + diffuse + specular) * matteColor + edgeHighlight;
        gl_FragColor = vec4(result, 1.0);


    }
#endGLSL


GLSL End