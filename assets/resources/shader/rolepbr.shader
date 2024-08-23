Shader3D Start
{
    type:Shader3D,
    name:RolePBRShader,
    enableInstancing:false,
    supportReflectionProbe: false,
    renderQueue: 2100,
    uniformMap: {
        u_DiffuseColor: {type: Color, default: [1.0, 1.0, 1.0, 1.0]}
        u_DiffusTexture: {type: Texture2D, default: "white"}
        u_TillingOffset: {type: Vector4, default: [1.0, 1.0, 0.0, 0.0]}
        u_EnvironmentColor: {type: Color, default: [1.0, 1.0, 0.0, 0.0]}
        u_LightingParam: {alias: 光照参数, type: Vector4, default: [1.0, 1.0, 0.0, 0.0]}
        u_HitEffectColor: {alias: 受击颜色, type: Color, default: [1.0, 1.0, 1.0, 1.0]}
        u_HitEffectParams: {alias: 受击参数 （X 强度， Y 大小， Z 时间）, type: Vector4, default: [1.0, 1.0, 0.0, 0.0]}

    },
    defines: {
    },
    shaderPass:[
        {
            pipeline: Forward,
            VS: RolePBRVS,
            FS: RolePBRFS
        }
    ]
}
Shader3D End

GLSL Start

#defineGLSL RolePBRVS
    #define SHADERNAME RolePBRShader

    #include "Color.glsl";
    #include "Math.glsl";
    #include "Scene.glsl";
    #include "SceneFogInput.glsl";
    #include "Camera.glsl";
    #include "Sprite3DVertex.glsl";
    #include "VertexCommon.glsl";
    #include "BlinnPhongVertex.glsl";

    void main()
    {
        Vertex vertex;
        getVertexParams(vertex);

        PixelParams pixel;
        initPixelParams(pixel, vertex);

        v_PositionWS = pixel.positionWS;
        mat4 worldMat = getWorldMatrix();
        vec3 privotWS = (worldMat * vec4(0.0, 0.0, 0.0, 1.0)).xyz;
       
        gl_Position = getPositionCS(v_PositionWS);
        gl_Position = remapPositionZ(gl_Position);

        #ifdef FOG
        FogHandle(gl_Position.z);
        #endif
    }
#endGLSL


#defineGLSL RolePBRFS
    #define SHADERNAME RolePBRShader

    #include "Color.glsl";
    #include "Scene.glsl";
    #include "SceneFog.glsl";
    #include "Camera.glsl";
    #include "Sprite3DFrag.glsl";
    #include "BlinnPhongFrag.glsl";

    void getBlinnPhongSurfaceParams(inout Surface surface, inout PixelParams pixel)
    {
        vec4 diffuseSampler = texture2D(u_DiffusTexture, pixel.uv0);
        surface.diffuseColor = u_DiffuseColor.rgb * u_DiffuseColor.rgb * diffuseSampler.rgb;
        surface.alpha = u_DiffuseColor.a * diffuseSampler.a;
    }

    void main()
    {
        PixelParams pixel;
        getPixelParams(pixel);

        Surface surface;
        getBlinnPhongSurfaceParams(surface, pixel);

        DirectionLight directionLight = getDirectionLight(0, pixel.positionWS);
        Light light = getLight(directionLight);

        vec4 lightingParam = max(vec4(0.01), u_LightingParam);

        float NdotL = dot(pixel.normalWS, -light.dir);
        float radiance = smoothstep(-lightingParam.z, lightingParam.z, NdotL);

        vec3 giColor = u_EnvironmentColor.rgb * surface.diffuseColor * lightingParam.y;

        vec3 color = mix(giColor, surface.diffuseColor * lightingParam.x, radiance) * light.color;

        float hitEffectStrength = max(u_HitEffectParams.z - u_Time, 0.0);
        if (hitEffectStrength > 0.0) 
        {
            vec3 normalWS = normalize(v_NormalWS);
            vec3 viewWS = normalize(u_CameraPos - v_PositionWS);
            float rim1 = 1.0 - dot(normalWS, viewWS);
            float rim4 = rim1 * rim1 * rim1 * rim1;

            float hitEffectMix = saturate(1.0 - u_HitEffectParams.y);
            float hitEffectVal = mix(rim1, rim4, hitEffectMix) * u_HitEffectParams.x;
            vec3 hitEffectColor = hitEffectVal * u_HitEffectColor.xyz * u_HitEffectColor.w;
            color += hitEffectColor * hitEffectStrength;
        } 

        #ifdef FOG
        color = sceneLitFog(color);
        #endif

        gl_FragColor = vec4(color, surface.alpha);
    }
#endGLSL

GLSL End