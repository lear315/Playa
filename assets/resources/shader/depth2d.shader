Shader3D Start
{
    type:Shader3D,
    name:Depth2D,
    enableInstancing:true,
    supportReflectionProbe: false,
    renderQueue: 2100,
    uniformMap: {
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

    //texture和fillrect使用的。
    #if defined(GL_FRAGMENT_PRECISION_HIGH) // 原来的写法会被我们自己的解析流程处理，而我们的解析是不认内置宏的，导致被删掉，所以改成 if defined 了
    precision highp float;
    #else
    precision mediump float;
    #endif


    void main()
    {
        clip();
        vec4 color = getSpriteTextureColor();
        setglColor(color);
    }

    
#endGLSL


GLSL End