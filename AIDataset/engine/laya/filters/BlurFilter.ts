import { RenderTargetFormat } from "../RenderEngine/RenderEnum/RenderTargetFormat";
import { Color } from "../maths/Color";
import { Vector2 } from "../maths/Vector2";
import { Vector4 } from "../maths/Vector4";
import { RenderTexture2D } from "../resource/RenderTexture2D";
import { ShaderDefines2D } from "../webgl/shader/d2/ShaderDefines2D";
import { TextureSV } from "../webgl/shader/d2/value/TextureSV";
import { Filter } from "./Filter";

/**
 * @en Integral result cache
 * @zh 积分结果缓存
 */
var _definiteIntegralMap: { [key: number]: number } = {};
/**
 * @en Blur filter
 * @zh 模糊滤镜
 */
export class BlurFilter extends Filter {
    /**@internal */
    shaderData = new TextureSV();
    /**
     * @en The intensity of the blur filter. The higher the value, the more indistinct the image becomes.
     * @zh 模糊滤镜的强度。值越大，图像越不清晰。
     */
    private _strength: number;

    private _shaderV1 = new Vector4();

    /**
     * @en Constructs a new BlurFilter instance with the specified strength.
     * The strength of the blur filter, with a default value of 4. Higher values result in a more indistinct image.
     * @param strength The strength of the blur filter. The default value is 4.
     * @zh 创建一个新的模糊滤镜实例，并设置指定的强度值。
     * 模糊滤镜的强度，默认值为4。值越大，图像越不清晰。
     * @param strength 模糊滤镜的强度。默认值为4。
     */
    constructor(strength = 4) {
        super();
        this.strength = strength;
        //this._glRender = new BlurFilterGLRender();
    }

    /**
     * @en The strength of the blur filter.
     * @zh 模糊滤镜的强度。
     */
    get strength() {
        return this._strength;
    }

    set strength(v: number) {
        this._strength = Math.max(Math.abs(v), 2);//<2的话，函数太细太高不适合下面的方法
        var sigma = this._strength / 3.0;//3σ以外影响很小。即当σ=1的时候，半径为3;
        var sigma2 = sigma * sigma;
        let v1 = this._shaderV1 = new Vector4(this.strength, sigma2,
            2.0 * sigma2,
            1.0 / (2.0 * Math.PI * sigma2))

        //由于目前shader中写死了blur宽度是9，相当于希望3σ是4，可是实际使用的时候经常会strength超过4，
        //这时候blur范围内的积分<1会导致变暗变透明，所以需要计算实际积分值进行放大
        //使用公式计算误差较大，直接累加把
        let s = 0;
        let key = Math.floor(this.strength * 10);
        if (_definiteIntegralMap[key] != undefined) {
            s = _definiteIntegralMap[key];
        } else {
            for (let y = -4; y <= 4; ++y) {
                for (let x = -4; x <= 4; ++x) {
                    s += v1.w * Math.exp(-(x * x + y * y) / v1.z);
                }
            }
            _definiteIntegralMap[key] = s;
        }
        v1.w /= s;
        this.onChange();
    }

    /**
     * @en Renders the blur filter effect on the given source texture.
     * @param srctexture The source texture to apply the blur filter to.
     * @param width The width of the rendering area.
     * @param height The height of the rendering area.
     * @zh 将模糊滤镜效果渲染到给定的源纹理上。
     * @param srctexture 要应用模糊滤镜的源纹理。
     * @param width 渲染区域的宽度。
     * @param height 渲染区域的高度。
     */
    render(srctexture: RenderTexture2D, width: number, height: number): void {
        let marginLeft = 50;
        let marginTop = 50;
        this.left = -marginLeft;
        this.top = -marginTop;
        let texwidth = width + 2 * marginLeft;
        let texheight = height + 2 * marginTop;
        this.width = texwidth;
        this.height = texheight;
        if (!this.texture || this.texture.destroyed || this.texture.width != texwidth || this.texture.height != texheight) {
            if (this.texture)
                this.texture.destroy();
            this.texture = new RenderTexture2D(texwidth, texheight, RenderTargetFormat.R8G8B8A8);
        }

        let render2d = this._render2D.clone(this.texture);
        //render2d.out = this.texture;
        render2d.renderStart(true, new Color(0, 0, 0, 0));
        //修改mesh
        let rectVB = this._rectMeshVB;
        let stridef32 = this._rectMesh.vertexDeclarition.vertexStride / 4;
        rectVB[0] = marginLeft; rectVB[1] = marginTop;  //v0.xy
        rectVB[stridef32] = marginLeft + width; rectVB[stridef32 + 1] = marginTop; //v1.xy
        rectVB[stridef32 * 2] = marginLeft + width; rectVB[stridef32 * 2 + 1] = marginTop + height; //v2.xy
        rectVB[stridef32 * 3] = marginTop; rectVB[stridef32 * 3 + 1] = marginTop + height;   //v3.xy
        //shaderdata
        let shadersv = this.shaderData;
        shadersv.shaderData.addDefine(ShaderDefines2D.FILTERBLUR);
        shadersv.size = new Vector2(texwidth, texheight);
        shadersv.textureHost = srctexture;
        shadersv.blurInfo = new Vector2(texwidth, texheight);

        shadersv.strength_sig2_2sig2_gauss1 = this._shaderV1;
        render2d.draw(
            this._rectMesh,
            0, 4 * this._rectMesh.vertexDeclarition.vertexStride,
            0, 12,
            shadersv, null);
        render2d.renderEnd();
    }
}

