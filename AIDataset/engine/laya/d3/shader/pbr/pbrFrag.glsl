//兼容WGSL
#if !defined(pbrFrag_lib)
    #define pbrFrag_lib

    #include "PBRLighting.glsl";

    #ifdef THICKNESS
// xyz: world scale, w: length(xyz)
varying vec4 v_WorldScale;
    #endif // THICKNESS

void getPixelInfo(inout PixelInfo info, const in PixelParams pixel, const in Surface surface)
{
    info.positionWS = pixel.positionWS;
    info.vertexNormalWS = pixel.normalWS;

    #ifdef TANGENT
    info.normalWS = normalize(pixel.TBN * surface.normalTS);
    #else // TANGENT
    info.normalWS = pixel.normalWS;
    #endif // TANGENT

    info.tangentWS = pixel.tangentWS;
    info.biNormalWS = pixel.biNormalWS;

    info.viewDir = normalize(u_CameraPos - info.positionWS);
    info.NoV = min(max(dot(info.normalWS, info.viewDir), MIN_N_DOT_V), 1.0);

    info.dfg = prefilteredDFG_LUT(surface.perceptualRoughness, info.NoV);

    #ifdef SHEEN
    info.energyCompensation = vec3(1.0);
    #else // SHEEN
    info.energyCompensation = (1.0 + surface.f0 * (1.0 / info.dfg.y - 1.0));
    #endif // SHEEN

    #ifdef IRIDESCENCE
    info.iridescenceFresnel = evalIridescence(1.0, surface.iridescenceIor, info.NoV, surface.iridescenceThickness, surface.f0);
    #endif // IRIDESCENCE

    #ifdef SHEEN
    info.sheenDfg = prefilteredDFG_LUT(surface.sheenPerceptualRoughness, info.NoV).z;
    info.sheenScaling = 1.0 - vecmax(surface.sheenColor) * info.sheenDfg;
    #endif // SHEEN

    #ifdef CLEARCOAT
	#ifdef CLEARCOAT_NORMAL
    info.clearCoatNormal = normalize(pixel.TBN * surface.clearCoatNormalTS);
	#else // CLEARCOAT_NORMAL
    info.clearCoatNormal = info.vertexNormalWS;
	#endif // CLEARCOAT_NORMAL
    info.clearCoatNoV = min(max(dot(info.clearCoatNormal, info.viewDir), MIN_N_DOT_V), 1.0);
    #endif // CLEARCOAT

    #ifdef ANISOTROPIC
    mat3 anisotropyTBN = mat3(info.tangentWS, info.biNormalWS * -1.0, info.normalWS);
    info.anisotropicT = anisotropyTBN * normalize(vec3(surface.anisotropyDirection, 0.0));
    info.anisotropicB = cross(info.vertexNormalWS, info.anisotropicT);
    info.ToV = dot(info.anisotropicT, info.viewDir);
    info.BoV = dot(info.anisotropicB, info.viewDir);
    info.at = mix(surface.roughness, 1.0, pow2(surface.anisotropy));
    info.ab = surface.roughness;
    #endif // ANISOTROPIC

    #ifdef THICKNESS
    info.worldScale = v_WorldScale;
    #endif // THICKNESS

    #ifdef LIGHTMAP
	#ifdef UV1
    info.lightmapUV = pixel.uv1;
	#endif // UV1
    #endif // LIGHTMAP
}

vec3 PBRLighting(const in Surface surface, const in PixelInfo info)
{
    vec3 lightColor = vec3(0.0);
    #ifdef DIRECTIONLIGHT
    for (int i = 0; i < CalculateLightCount; i++)
	{
	    if (i >= DirectionCount) break;
	    DirectionLight directionLight = getDirectionLight(i, info.positionWS);
	    // if (directionLight.lightMode == LightMode_Mix)
		// {
		//     continue;
		// }
        if (directionLight.lightMode != LightMode_Mix) {
	        Light light = getLight(directionLight);
	        lightColor += PBRLighting(surface, info, light) * light.attenuation;
        }
	}
    #endif // DIRECTIONLIGHT

    #if defined(POINTLIGHT) || defined(SPOTLIGHT)
    ivec4 clusterInfo = getClusterInfo(u_View, u_Viewport, info.positionWS, gl_FragCoord, u_ProjectionParams);
    #endif // POINTLIGHT || SPOTLIGHT

    #ifdef POINTLIGHT
    for (int i = 0; i < CalculateLightCount; i++)
	{
        #ifdef BREAK_TEXTURE_SAMPLE
	    if (i >= clusterInfo.x) break; //兼容WGSL
        #endif
	    PointLight pointLight = getPointLight(i, clusterInfo, info.positionWS);
	    // if (pointLight.lightMode == LightMode_Mix)
		// {
		//     continue;
		// }
        if (pointLight.lightMode != LightMode_Mix) {
	        Light light = getLight(pointLight, info.normalWS, info.positionWS);
            #ifndef BREAK_TEXTURE_SAMPLE
            if (i < clusterInfo.x)
            #endif
	            lightColor += PBRLighting(surface, info, light) * light.attenuation;
        }
	}
    #endif // POINTLIGHT

    #ifdef SPOTLIGHT
    for (int i = 0; i < CalculateLightCount; i++)
	{
        #ifdef BREAK_TEXTURE_SAMPLE
	    if (i >= clusterInfo.y) break; //兼容WGSL
        #endif
	    SpotLight spotLight = getSpotLight(i, clusterInfo, info.positionWS);
	    // if (spotLight.lightMode == LightMode_Mix)
		// {
		//     continue;
		// }
        if (spotLight.lightMode != LightMode_Mix) {
	        Light light = getLight(spotLight, info.normalWS, info.positionWS);
            #ifndef BREAK_TEXTURE_SAMPLE
            if (i < clusterInfo.y)
            #endif
	            lightColor += PBRLighting(surface, info, light) * light.attenuation;
        }
	}
    #endif // SPOTLIGHT

    vec3 giColor = PBRGI(surface, info);

    vec3 color = lightColor + giColor;

    #ifdef EMISSION
    color += surface.emissionColor;
    #endif //  EMISSION
    return color;
}

#endif // pbrFrag_lib