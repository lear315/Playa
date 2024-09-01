uniform vec4 u_clipMatDir;
uniform vec2 u_clipMatPos;// 这个是全局的，不用再应用矩阵了。
uniform vec2 u_size;
uniform float u_VertAlpha;
varying vec2 v_cliped;
#ifdef WORLDMAT
    uniform mat4 u_mmat;
    vec4 transedPos;
#endif
varying vec4 v_color;


//texture和fillrect使用的。
// attribute vec4 a_posuv;
// attribute vec4 a_attribColor;
// attribute vec4 a_attribFlags;
#ifdef MVP3D
    uniform mat4 u_MvpMatrix;
#endif

struct vertexInfo {
    vec4 color;
    vec2 cliped;
    vec4 texcoordAlpha;
    float useTex;
};

varying vec4 v_texcoordAlpha;
varying float v_useTex;

void getVertexInfo(inout vertexInfo info){
    //texcoordAlpha
    info.texcoordAlpha.xy = a_posuv.zw;
    //color
    info.color = a_attribColor;
    info.color.a*=u_VertAlpha;
    info.color.xyz*= info.color.w;//反正后面也要预乘
    //useTex
    info.useTex = a_attribFlags.r;

    //clip
    float clipw = length(u_clipMatDir.xy);
    float cliph = length(u_clipMatDir.zw);
    vec2 clpos = u_clipMatPos.xy;
    #ifdef WORLDMAT
        vec2 clippos = transedPos.xy - clpos;
    #else
    vec2 clippos = a_posuv.xy - clpos;	//pos已经应用矩阵了，为了减的有意义，clip的位置也要缩放
    #endif
    if(clipw>20000. && cliph>20000.)
        info.cliped = vec2(0.5,0.5);
    else {
        //转成0到1之间。/clipw/clipw 表示clippos与normalize之后的clip朝向点积之后，再除以clipw
        info.cliped = vec2( dot(clippos,u_clipMatDir.xy)/clipw/clipw, dot(clippos,u_clipMatDir.zw)/cliph/cliph);
    }
}

void getPosition(inout vec4 glPosition){
    vec4 pos = vec4(a_posuv.xy,0.,1.);
    #ifdef WORLDMAT
        pos= u_mmat * pos;
        transedPos=pos;//vec4(pos.x,pos.y,0.0,1.0);
    #endif
    vec4 pos1 = vec4((pos.x/u_size.x-0.5)*2.0,(0.5-pos.y/u_size.y)*2.0,0.,1.0);
    #ifdef MVP3D
        glPosition = u_MvpMatrix * pos1;
    #else
        glPosition = pos1;
    #endif
    
    #ifdef INVERTY
        glPosition.y = -glPosition.y;
    #endif
}
