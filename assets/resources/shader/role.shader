Shader3D Start
{
    type:Shader3D,
    name:RoleShader,
    enableInstancing:false,
    supportReflectionProbe: false,
    renderQueue: 2100,
    uniformMap: {
        u_AlbedoTexture: {type: Texture2D, default: "white"}
        u_outlineColor: {type: Color, default: [1.0, 1.0, 0.8, 1.0]}
        u_outlineRatio: {type: Float, default: 0.5}
        u_outlineLightness: {type: Float, default: 0.5}
        u_outlineScale: {type: Float, default: 1.0}
        u_outlineWidth: {type: Float, default: 0.05}
        u_outlineZOffset: {type: Float, default: 0.0}
    },
    defines: {
    },
    shaderPass:[
        {
            pipeline: Forward,
            VS: RoleVS,
            FS: RoleFS
        }
    ]
}
Shader3D End

GLSL Start

#defineGLSL RoleVS
    #define SHADERNAME RoleShader

    #include "Math.glsl";
    #include "Scene.glsl";
    #include "SceneFogInput.glsl";
    #include "Camera.glsl";
    #include "Sprite3DVertex.glsl";
    #include "VertexCommon.glsl";
    #include "BlinnPhongVertex.glsl";

    bool isPerspectiveProjection()
    {
        return u_Projection[2][3] != 0.0;
    }


    vec3 getVertexOutlineColor(vec3 positionVS, vec3 normalVS, float distance)
    {
        const float maxdis = 27.0;
        const float mindis = 5.0;
        float mappedDis = clamp((distance - mindis) / (maxdis - mindis), 0.0, 1.0);

        float modelScale = mix(1.0, u_outlineScale, mappedDis);
        float ourlineWidth = u_outlineWidth * modelScale;

        float fixScale = 1.0;
        if (isPerspectiveProjection()) {
            fixScale = 2.414 / u_Projection[1][1];
        } else {
            fixScale = 1.5996 / u_Projection[1][1];
        }

        fixScale *= positionVS.z / modelScale;
        ourlineWidth *= clamp(fixScale * 0.025, 0.04, 0.1);
        
        normalVS.z = -0.1;
        normalVS = normalize(normalVS);
        normalVS.y = -normalVS.y;
        positionVS += normalVS * ourlineWidth;
        positionVS.z += u_outlineZOffset * modelScale;
        return positionVS;
    }

    vec3 transformObjectToWorldNormal(vec3 dirOS, bool doNormalize)
    {
        mat3 worldMatrix = mat3(getWorldMatrix());
        mat3 normalMat = transpose(inverse(worldMatrix));
        vec3 dirWS = normalMat * dirOS;
        if (doNormalize) {
            dirWS = normalize(dirWS);
        }
        return dirWS;
    }

    void main()
    {
        Vertex vertex;
        getVertexParams(vertex);
        PixelParams pixel;
        shadingPixelParams(pixel, vertex);

        vec3 positionWS = pixel.positionWS;
        vec3 positionVS = (u_View * vec4(positionWS, 1.0)).xyz;
        vec4 vertexColor = vec4(1.0);
        #ifdef COLOR 
            vertexColor = pixel.vertexColor;
        #endif

        vec3 normalOS = vec3(1.0, 1.0, 1.0);
        vec3 normalWS = transformObjectToWorldNormal(normalOS, true);

        vec3 normalVS = transformObjectToWorldNormal(normalWS, true);
        float distance = length(u_CameraPos - positionWS);
        positionVS = getVertexOutlineColor(positionVS, normalVS, distance);

        sharePixelParams(pixel);

       
        gl_Position = u_Projection * vec4(positionVS, 1.0);

        gl_Position = remapPositionZ(gl_Position);
    }

#endGLSL


#defineGLSL RoleFS
    #define SHADERNAME RoleShader

    #include "Color.glsl";

    #include "Scene.glsl";
    #include "SceneFog.glsl";
    #include "Camera.glsl";
    #include "Sprite3DFrag.glsl";
    #include "BlinnPhongFrag.glsl";

    void main()
    {
        PixelParams pixel;
        getPixelParams(pixel);

        #ifdef UV
            vec2 uv = pixel.uv0;
        #else
            vec2 uv = vec2(0.0, 0.0);
        #endif

        vec4 diffuseSampler = texture2D(u_AlbedoTexture, uv);
        vec3 baseColor = mix(u_outlineColor.rgb, diffuseSampler.rgb, u_outlineRatio);
        gl_FragColor = vec4(baseColor, 1.0);
        gl_FragColor = outputTransform(gl_FragColor);

    }

#endGLSL

GLSL End