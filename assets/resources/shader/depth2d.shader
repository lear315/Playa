Shader3D Start
{
    type:Shader3D,
    name:Depth2D,
    enableInstancing:true,
    supportReflectionProbe: false,
    renderQueue: 2100,
    uniformMap: {
        u_albedoTexture: {type: Texture2D, default: "white"}
        u_depthTexture: {type: Texture2D, default: "white"}
        u_scale: {type: Float, default: 0.0215}
        u_focus: {type: Float, default: 0.5}
        u_dimensions: {type: Vector2, default: [1.0, 1.0]}
        u_animateDuration: {type: Float, default: 8.0}
        u_animateScale: {type: Vector3, default: [1.0, 0.95, 0.95]}
        u_animateScaleP: {type: Vector3, default: [0.9, 0.925, 0.925]}
    },
    attributeMap: {
        a_posuv: Vector4,
        a_attribColor: Vector4,
        a_attribFlags: Vector4
    },
    defines: {
    },
    shaderPass:[
        {
            pipeline: Forward,
            VS: Depth2DVS,
            FS: Depth2DFS
        }
    ]
ss
}
Shader3D End

GLSL Start

#defineGLSL Depth2DVS

    #define SHADERNAME Depth2DVS
    #include "./glsl/Sprite2DVertex.glsl";

    void main()
    {
        vec4 pos;
        //先计算位置，再做裁剪
        getPosition(pos);
        vertexInfo info;
        getVertexInfo(info);

        v_cliped = info.cliped;
        v_texcoordAlpha = info.texcoordAlpha;
        v_useTex = info.useTex;
        v_color = info.color;

        gl_Position = pos;
    }
    
#endGLSL

#defineGLSL Depth2DFS
    #define SHADERNAME Depth2DFS
    #include "./glsl/Sprite2DFrag.glsl";
    #include "Scene.glsl";

    #if defined(GL_FRAGMENT_PRECISION_HIGH)
    precision highp float;
    #else
    precision mediump float;
    #endif

    vec3 perspective(
    sampler2D u_albedoTexture,
    sampler2D u_depthTexture,
    vec2 uv,
    float horizontal_parallax, 
    float vertical_parallax,
    float perspective_factor,
    float h_convergence,
    float v_convergence
    ) {
        const float sensitivity = 15.0;
        horizontal_parallax *= sensitivity;
        vertical_parallax *= sensitivity;

        vec3 ray_origin = vec3(uv.x - 0.5, uv.y - 0.5, +1.0);
        vec3 ray_direction = vec3(uv.x - 0.5, uv.y - 0.5, -1.0);

        ray_direction.xy *= perspective_factor;
        ray_origin.xy /= 1.0 + perspective_factor;
        ray_direction.x += horizontal_parallax;
        ray_direction.y += vertical_parallax;

        ray_origin.x -= h_convergence * horizontal_parallax;
        ray_origin.y -= v_convergence * vertical_parallax;

        const int step_count = 45;
        const float hit_threshold = 0.01;
        ray_direction /= float(step_count);

        for (int i = 0; i < step_count; i++) {
            ray_origin += ray_direction;
            vec2 vFlipUV = (ray_origin.xy + 0.5);
            float scene_z = texture2D(u_depthTexture, vFlipUV).x;
            if (ray_origin.z < scene_z) {
                if (scene_z - ray_origin.z < hit_threshold) {
                    return texture2D(u_albedoTexture, ray_origin.xy + 0.5).rgb;
                }
                ray_origin -= ray_direction;
                ray_direction /= 2.0;
            }
        }
        return texture2D(u_albedoTexture, ray_origin.xy + 0.5).rgb;
    }

    void main()
    {
        clip();
        float gain = u_scale * 0.075;
        float time = u_Time / u_animateDuration;
        float x = sin(2.0 * 3.14 * (time + u_animateScaleP.x)) * u_animateScale.x;
        float y = sin(2.0 * 3.14 * (time + u_animateScaleP.y)) * u_animateScale.y;
        float z = 0.5 * (1.0 + sin(2.0 * 3.14 * (time + u_animateScaleP.z))) * u_animateScale.z;
        vec3 timeoffset = vec3(x, y, z);
        float persp_factor = u_scale * 3.0 * timeoffset.z;
        float aspect = u_dimensions.x / u_dimensions.y;
        vec4 color = vec4(perspective(u_albedoTexture, u_depthTexture, v_texcoordAlpha.xy, -gain * timeoffset.x, gain * timeoffset.y * aspect, persp_factor, 1.0 - u_focus, 1.0 - u_focus), 1.0);
        color.xyz = linearToGamma(color.xyz);
        gl_FragColor = color;
    }
#endGLSL


GLSL End