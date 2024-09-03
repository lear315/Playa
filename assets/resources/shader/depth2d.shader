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
        u_stereoGain: {type: Float, default: 0.01876}
        u_focus: {type: Float, default: 0.5}
        u_amplitude: {type: Vector3, default: [0.1, 0.05, 0.4]}
        u_phase: {type: Vector3, default: [0.0, 0.25, 0.25]}
        u_amountOfMotion: {type: Float, default: 0.4}
        u_animateDuration: {type: Float, default: 8.0}
        u_dilation: {type: Float, default: 0.25}
        u_enlarge: {type: Float, default: 1.3, min: 1.0}
    },
    attributeMap: {
        a_posuv: Vector4,
        a_attribColor: Vector4,
        a_attribFlags: Vector4
    },
    defines: {
        GAIN: {alias: "色差滤镜", type: bool, default: true, private: false}
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

    const int MAX_RADIUS = 10;

    float dilate(vec2 uv, float aspect) {
        float dilation = u_dilation / 100.0;
        const float dilationScale = 1.26; 
        float dilationStep = abs(dilationScale * dilation) / float(MAX_RADIUS);
        vec2 px = aspect > 1.0 ? vec2(dilationStep / aspect, dilationStep) : vec2(dilationStep, dilationStep * aspect);

        float maxValue = 0.0;
        float minValue = 1.0;
        for (int x = -MAX_RADIUS; x <= +MAX_RADIUS; x++) {
            for (int y = -MAX_RADIUS; y <= +MAX_RADIUS; y++) {
            vec2 offset = vec2(float(x), float(y));
            if (length(offset) > float(MAX_RADIUS)) continue;
            offset *= px;
            vec2 uv2 = uv + offset;
            float val = texture2D(u_depthTexture, uv2).x;
            maxValue = max(val, maxValue);
            minValue = min(val, minValue);
            }
        }
        return dilation < 0.0 ? minValue: maxValue;
    }

    vec3 perspective(float aspect, vec2 uv, vec3 cameraShift, float convergence ) {
        vec3 ray_origin = vec3(uv - 0.5, 0) * (1.0 - convergence * cameraShift.z); 
        vec3 ray_direction = vec3(0, 0, 1); 

        ray_origin.xy -= cameraShift.xy * convergence;
        ray_direction.xy += (uv - 0.5) * cameraShift.z + cameraShift.xy;

        const int step_count = 45; 
        const float hit_threshold = 0.01;
        ray_direction /= float(step_count);
        
        vec3 color = vec3(0.0);

        for (int i = 0; i < step_count; i++) {
            ray_origin += ray_direction;
            float scene_z = 1.0 - dilate(ray_origin.xy + 0.5, aspect);
            if (ray_origin.z > scene_z) {
            if (ray_origin.z - scene_z < hit_threshold) {
                break;
            }
            ray_origin -= ray_direction; 
            ray_direction /= 2.0; 
            }
        }

        color = texture2D(u_albedoTexture, ray_origin.xy + 0.5).rgb;

        return color;
    }

    vec3 getOffset(vec3 e, vec3 n, float r, float i) {
        const float pi = 3.1415926535897; 
        return vec3(sin(2.0 * pi * (i + n.x)) * e.x * r, sin(2.0 * pi * (i + n.y)) * e.y * r, 0.5 * (1.0 + sin(2.0 * pi * (i + n.z))) * e.z * r);
    }

    void main()
    {
        clip();
        ivec2 textureSize = textureSize(u_albedoTexture, 0);
        float aspect = float(textureSize.x) / float(textureSize.y);

        #ifdef GAIN
            // 3d色差滤镜
            vec2 uv = v_texcoordAlpha.xy;
            vec4 left = vec4(perspective(aspect, uv, vec3(u_stereoGain, 0.0, 0.0), u_focus), 1.0);
            vec4 right = vec4(perspective(aspect, uv, vec3(-1.0 * u_stereoGain, 0.0, 0.0), u_focus), 1.0);
            const vec4 left_glass = vec4(1, 0, 0, 1);
            const vec4 right_glass = vec4(0, 1, 1, 1);
            vec4 color = left * left_glass + right * right_glass;
        #else


            vec2 uv = (v_texcoordAlpha.xy - vec2(0.5,0.5)) / u_enlarge + vec2(0.5,0.5);
            float time = u_Time / u_animateDuration; 
            vec3 offset = getOffset(u_amplitude, u_phase ,u_amountOfMotion,time);
            vec4 color = vec4(perspective(aspect, uv, vec3(offset.x, offset.y * aspect, offset.z), u_focus), 1.0);
        #endif


        color.xyz = linearToGamma(color.xyz);
        gl_FragColor = color;
    }
#endGLSL


GLSL End