
/**
 * @internal
 */
export const enum glTFAccessorComponentType {
    /** Byte */
    BYTE = 5120,
    /** Unsigned Byte */
    UNSIGNED_BYTE = 5121,
    /** Short */
    SHORT = 5122,
    /** Unsigned Short */
    UNSIGNED_SHORT = 5123,
    /** Unsigned Int */
    UNSIGNED_INT = 5125,
    /** Float */
    FLOAT = 5126
}

/**
 * @internal
 */
export const enum glTFAccessorType {
    /** Scalar */
    SCALAR = "SCALAR",
    /** Vector2 */
    VEC2 = "VEC2",
    /** Vector3 */
    VEC3 = "VEC3",
    /** Vector4 */
    VEC4 = "VEC4",
    /** Matrix2x2 */
    MAT2 = "MAT2",
    /** Matrix3x3 */
    MAT3 = "MAT3",
    /** Matrix4x4 */
    MAT4 = "MAT4"
}

/**
 * @internal
 */
export const enum glTFAnimationChannelTargetPath {
    /** Translation */
    TRANSLATION = "translation",
    /** Rotation */
    ROTATION = "rotation",
    /** Scale */
    SCALE = "scale",
    /** Weights */
    WEIGHTS = "weights"
}

/**
 * @internal
 */
export const enum glTFAnimationSamplerInterpolation {
    /** The animated values are linearly interpolated between keyframes */
    LINEAR = "LINEAR",
    /** The animated values remain constant to the output of the first keyframe, until the next keyframe */
    STEP = "STEP",
    /** The animation's interpolation is computed using a cubic spline with specified tangents */
    CUBICSPLINE = "CUBICSPLINE"
}

/**
 * @internal
 */
export const enum glTFCameraType {
    /** A perspective camera containing properties to create a perspective projection matrix  */
    PERSPECTIVE = "perspective",
    /**  An orthographic camera containing properties to create an orthographic projection matrix */
    ORTHOGRAPHIC = "orthographic"
}

/**
 * @internal
 */
export const enum glTFImageMimeType {
    /**  JPEG Mime-type */
    JPEG = "image/jpeg",
    /** PNG Mime-type */
    PNG = "image/png"
}

/**
 * @internal
 */
export const enum glTFMaterialAlphaMode {
    /**  The alpha value is ignored and the rendered output is fully opaque */
    OPAQUE = "OPAQUE",
    /** The rendered output is either fully opaque or fully transparent depending on the alpha value and the specified alpha cutoff value */
    MASK = "MASK",
    /** The alpha value is used to composite the source and destination areas. The rendered output is combined with the background using the normal painting operation (i.e. the Porter and Duff over operator) */
    BLEND = "BLEND"
}

/**
 * @internal
 * The type of the primitives to render
 */
export const enum glTFMeshPrimitiveMode {
    /** Points */
    POINTS = 0,
    /** Lines */
    LINES = 1,
    /** Line Loop */
    LINE_LOOP = 2,
    /** Line Strip */
    LINE_STRIP = 3,
    /** Triangles */
    TRIANGLES = 4,
    /** Triangle Strip */
    TRIANGLE_STRIP = 5,
    /** Triangle Fan */
    TRIANGLE_FAN = 6,
}

/**
 * @internal
 * Magnification filter.  Valid values correspond to WebGL enums: 9728 (NEAREST) and 9729 (LINEAR)
 */
export const enum glTFTextureMagFilter {
    /** Nearest */
    NEAREST = 9728,
    /**  Linear */
    LINEAR = 9729,
}

/**
 * @internal
 * Minification filter.  All valid values correspond to WebGL enums
 */
export const enum glTFTextureMinFilter {
    /**  Nearest */
    NEAREST = 9728,
    /** Linear */
    LINEAR = 9729,
    /** Nearest Mip-Map Nearest */
    NEAREST_MIPMAP_NEAREST = 9984,
    /** Linear Mipmap Nearest */
    LINEAR_MIPMAP_NEAREST = 9985,
    /** Nearest Mipmap Linear */
    NEAREST_MIPMAP_LINEAR = 9986,
    /** Linear Mipmap Linear */
    LINEAR_MIPMAP_LINEAR = 9987,
}

/**
 * @internal
 * S (U) wrapping mode.  All valid values correspond to WebGL enums
 */
export const enum glTFTextureWrapMode {
    /** Clamp to Edge */
    CLAMP_TO_EDGE = 33071,
    /** Mirrored Repeat */
    MIRRORED_REPEAT = 33648,
    /** Repeat */
    REPEAT = 10497
}

/**
 * @internal
 * glTF Node Property
 */
export interface glTFNodeProperty {
    /** Dictionary object with extension-specific objects. */
    extensions?: {
        [key: string]: any;
    };
    /** Application-specific data. */
    extras?: any;
}

/**
 * @internal
 */
export interface glTFChildNodeProperty {
    /** The user-defined name of this object. */
    name?: string;
}

/**
 * @internal
 */
export interface glTFAccessorSparseIndeces extends glTFNodeProperty {
    /** The index of the bufferView with sparse indices. Referenced bufferView can't have ARRAY_BUFFER or ELEMENT_ARRAY_BUFFER target */
    bufferView: number;
    /** The offset relative to the start of the bufferView in bytes. Must be aligned */
    byteOffset?: number;
    /** The indices data type.  Valid values correspond to WebGL enums: 5121 (UNSIGNED_BYTE), 5123 (UNSIGNED_SHORT), 5125 (UNSIGNED_INT)*/
    componentType: glTFAccessorComponentType;
}

/**
 * @internal
 */
export interface glTFAccessorSparseValues extends glTFNodeProperty {
    /**  The index of the bufferView with sparse values. Referenced bufferView can't have ARRAY_BUFFER or ELEMENT_ARRAY_BUFFER target */
    bufferView: number;
    /**  The offset relative to the start of the bufferView in bytes. Must be aligned */
    byteOffset?: number;
}

/**
 * @internal
 */
export interface glTFAccessorSparse extends glTFNodeProperty {
    /** Number of entries stored in the sparse array. */
    count: number;
    /** Index array of size count that points to those accessor attributes that deviate from their initialization value. Indices must strictly increase */
    indices: glTFAccessorSparseIndeces;
    /** Array of size count times number of components, storing the displaced accessor attributes pointed by indices. Substituted values must have the same componentType and number of components as the base accessor */
    values: glTFAccessorSparseValues;
}

/**
 * @internal
 * Indices of those attributes that deviate from their initialization value
 */
export interface glTFAccessor extends glTFNodeProperty {
    /** The index of the bufferView. */
    bufferView?: number;
    /** The offset relative to the start of the bufferView in bytes. */
    byteOffset?: number;
    /** The datatype of components in the attribute. */
    componentType: glTFAccessorComponentType;
    /** Specifies whether integer data values should be normalized. */
    normalized?: boolean;
    /** The number of attributes referenced by this accessor. */
    count: number;
    /** Specifies if the attribute is a scalar, vector, or matrix. */
    type: glTFAccessorType;
    /** Maximum value of each component in this attribute. */
    max?: number[];
    /** Minimum value of each component in this attribute. */
    min?: number[];
    /** Sparse storage of attributes that deviate from their initialization value. */
    sparse?: glTFAccessorSparse;
}

/**
 * @internal
 * The index of the node and TRS property that an animation channel targets
 */
export interface glTFAnimationChannelTarget extends glTFNodeProperty {
    /** The index of the node to target */
    node: number;
    /** The name of the node's TRS property to modify, or the weights of the Morph Targets it instantiates */
    path: glTFAnimationChannelTargetPath;
}

/**
 * @internal
 * Targets an animation's sampler at a node's property
 */
export interface glTFAnimationChannel extends glTFNodeProperty {
    /** * The index of a sampler in this animation used to compute the value for the target */
    sampler: number;
    /** * The index of the node and TRS property to target */
    target: glTFAnimationChannelTarget;
}

/**
 * @internal
 * Combines input and output accessors with an interpolation algorithm to define a keyframe graph (but not its target)
 */
export interface glTFAnimationSampler extends glTFNodeProperty {
    /** The index of an accessor containing keyframe input values, e.g., time */
    input: number;
    /** Interpolation algorithm */
    interpolation?: glTFAnimationSamplerInterpolation;
    /** The index of an accessor, containing keyframe output values */
    output: number;
}

/**
 * @internal
 * A keyframe animation.
 */
export interface glTFAnimation extends glTFNodeProperty, glTFChildNodeProperty {
    /** An array of channels, each of which targets an animation's sampler at a node's property */
    channels: glTFAnimationChannel[];
    /** An array of samplers that combines input and output accessors with an interpolation algorithm to define a keyframe graph (but not its target) */
    samplers: glTFAnimationSampler[];
}

/**
 * @internal
 * Metadata about the glTF asset
 */
export interface glTFAsset extends glTFChildNodeProperty {
    /** A copyright message suitable for display to credit the content creator. */
    copyright?: string;
    /** Tool that generated this glTF model. Useful for debugging. */
    generator?: string;
    /** The glTF version that this asset targets. */
    version: string;
    /** The minimum glTF version that this asset targets. */
    minVersion?: string;
}

/**
 * @internal
 * A buffer points to binary geometry, animation, or skins
 */
export interface glTFBuffer extends glTFChildNodeProperty, glTFNodeProperty {
    /**  The uri of the buffer.  Relative paths are relative to the .gltf file.  Instead of referencing an external file, the uri can also be a data-uri */
    uri?: string;
    /**  The length of the buffer in bytes */
    byteLength: number;
}

/**
 * @internal
 * A view into a buffer generally representing a subset of the buffer
 */
export interface glTFBufferView extends glTFChildNodeProperty, glTFNodeProperty {
    /** The index of the buffer */
    buffer: number;
    /** The offset into the buffer in bytes */
    byteOffset?: number;
    /** The lenth of the bufferView in bytes */
    byteLength: number;
    /** The stride, in bytes */
    byteStride?: number;
}

/**
 * @internal
 * An orthographic camera containing properties to create an orthographic projection matrix
 */
export interface glTFCameraOrthographic extends glTFNodeProperty {
    /** The floating-point horizontal magnification of the view. Must not be zero */
    xmag: number;
    /** The floating-point vertical magnification of the view. Must not be zero */
    ymag: number;
    /** The floating-point distance to the far clipping plane. zfar must be greater than znear */
    zfar: number;
    /** The floating-point distance to the near clipping plane */
    znear: number;
}

/**
 * @internal
 * A perspective camera containing properties to create a perspective projection matrix
 */
export interface glTFCameraPerspective extends glTFNodeProperty {
    /** The floating-point aspect ratio of the field of view */
    aspectRatio?: number;
    /** The floating-point vertical field of view in radians */
    yfov: number;
    /** The floating-point distance to the far clipping plane */
    zfar?: number;
    /** The floating-point distance to the near clipping plane */
    znear: number;
}

/**
 * @internal
 * A camera's projection.  A node can reference a camera to apply a transform to place the camera in the scene
 */
export interface glTFCamera extends glTFChildNodeProperty, glTFNodeProperty {
    /** An orthographic camera containing properties to create an orthographic projection matrix */
    orthographic?: glTFCameraOrthographic;
    /** A perspective camera containing properties to create a perspective projection matrix */
    perspective?: glTFCameraPerspective;
    /** Specifies if the camera uses a perspective or orthographic projection */
    type: glTFCameraType;
}

/**
 * @internal
 * Image data used to create a texture. Image can be referenced by URI or bufferView index. mimeType is required in the latter case
 */
export interface glTFImage extends glTFChildNodeProperty, glTFNodeProperty {
    /**
     * The uri of the image.  Relative paths are relative to the .gltf file.  Instead of referencing an external file, the uri can also be a data-uri.  The image format must be jpg or png
     */
    uri?: string;
    /**
     * The image's MIME type
     */
    mimeType?: glTFImageMimeType;
    /**
     * The index of the bufferView that contains the image. Use this instead of the image's uri property
     */
    bufferView?: number;
}

/**
 * @internal
 * Reference to a texture
 */
export interface glTFTextureInfo extends glTFNodeProperty {
    /**  The index of the texture */
    index: number;
    /** The set index of texture's TEXCOORD attribute used for texture coordinate mapping */
    texCoord?: number;
}

/**
 * @internal
 * A set of parameter values that are used to define the metallic-roughness material model from Physically-Based Rendering (PBR) methodology
 */
export interface glTFMaterialPbrMetallicRoughness extends glTFNodeProperty {
    /** The material's base color factor */
    baseColorFactor?: number[];
    /** The base color texture */
    baseColorTexture?: glTFTextureInfo;
    /** The metalness of the material */
    metallicFactor?: number;
    /** The roughness of the material */
    roughnessFactor?: number;
    /** The metallic-roughness texture */
    metallicRoughnessTexture?: glTFTextureInfo;
}

/**
 * @internal
 * Material Normal Texture Info
 */
export interface glTFMaterialNormalTextureInfo extends glTFTextureInfo {
    /** The scalar multiplier applied to each normal vector of the normal texture. default: 1*/
    scale?: number;
}

/**
 * @internal
 * Material Occlusion Texture Info
 */
export interface glTFMaterialOcclusionTextureInfo extends glTFTextureInfo {
    /**
     * A scalar multiplier controlling the amount of occlusion applied
     */
    strength?: number;
}

/**
 * @internal
 * The material appearance of a primitive
 */
export interface glTFMaterial extends glTFChildNodeProperty, glTFNodeProperty {
    /** A set of parameter values that are used to define the metallic-roughness material model from Physically-Based Rendering (PBR) methodology. When not specified, all the default values of pbrMetallicRoughness apply */
    pbrMetallicRoughness?: glTFMaterialPbrMetallicRoughness;
    /** The normal map texture */
    normalTexture?: glTFMaterialNormalTextureInfo;
    /** The occlusion map texture */
    occlusionTexture?: glTFMaterialOcclusionTextureInfo;
    /** The emissive map texture */
    emissiveTexture?: glTFTextureInfo;
    /** The RGB components of the emissive color of the material. These values are linear. If an emissiveTexture is specified, this value is multiplied with the texel values */
    emissiveFactor?: number[];
    /** The alpha rendering mode of the material */
    alphaMode?: glTFMaterialAlphaMode;
    /** The alpha cutoff value of the material */
    alphaCutoff?: number;
    /** Specifies whether the material is double sided */
    doubleSided?: boolean;
}

/**
 * @internal
 * Geometry to be rendered with the given material
 */
export interface glTFMeshPrimitive extends glTFNodeProperty {
    /**
     * A dictionary object, where each key corresponds to mesh attribute semantic and each value is the index of the accessor containing attribute's data
     */
    attributes: {
        [name: string]: number;
    };
    /**
     * The index of the accessor that contains the indices
     */
    indices?: number;
    /**
     * The index of the material to apply to this primitive when rendering
     */
    material?: number;
    /**
     * The type of primitives to render. All valid values correspond to WebGL enums
     */
    mode?: glTFMeshPrimitiveMode;
    /**
     * An array of Morph Targets, each  Morph Target is a dictionary mapping attributes (only POSITION, NORMAL, and TANGENT supported) to their deviations in the Morph Target
     */
    targets?: {
        [name: string]: number;
    }[];
}

/**
 * @internal
 * A set of primitives to be rendered.  A node can contain one mesh.  A node's transform places the mesh in the scene
 */
export interface glTFMesh extends glTFChildNodeProperty, glTFNodeProperty {
    /**  An array of primitives, each defining geometry to be rendered with a material */
    primitives: glTFMeshPrimitive[];
    /**  Array of weights to be applied to the Morph Targets */
    weights?: number[];
}

/**
 * @internal
 * A node in the node hierarchy
 */
export interface glTFNode extends glTFChildNodeProperty, glTFNodeProperty {
    /** The index of the camera referenced by this node */
    camera?: number;
    /** The indices of this node's children */
    children?: number[];
    /** The index of the skin referenced by this node */
    skin?: number;
    /** A floating-point 4x4 transformation matrix stored in column-major order */
    matrix?: number[];
    /** The index of the mesh in this node */
    mesh?: number;
    /** The node's unit quaternion rotation in the order (x, y, z, w), where w is the scalar */
    rotation?: number[];
    /** The node's non-uniform scale, given as the scaling factors along the x, y, and z axes */
    scale?: number[];
    /** The node's translation along the x, y, and z axes */
    translation?: number[];
    /** The weights of the instantiated Morph Target. Number of elements must match number of Morph Targets of used mesh */
    weights?: number[];
}

/**
 * @internal
 * Texture sampler properties for filtering and wrapping modes
 */
export interface glTFSampler extends glTFChildNodeProperty, glTFNodeProperty {
    /** Magnification filter.  Valid values correspond to WebGL enums: 9728 (NEAREST) and 9729 (LINEAR) */
    magFilter?: glTFTextureMagFilter;
    /** Minification filter.  All valid values correspond to WebGL enums */
    minFilter?: glTFTextureMinFilter;
    /** S (U) wrapping mode.  All valid values correspond to WebGL enums */
    wrapS?: glTFTextureWrapMode;
    /** T (V) wrapping mode.  All valid values correspond to WebGL enums */
    wrapT?: glTFTextureWrapMode;
}

/**
 * @internal
 * The root nodes of a scene
 */
export interface glTFScene extends glTFChildNodeProperty, glTFNodeProperty {
    /**  The indices of each root node */
    nodes: number[];
}

/**
 * @internal
 * Joints and matrices defining a skin
 */
export interface glTFSkin extends glTFChildNodeProperty, glTFNodeProperty {
    /** The index of the accessor containing the floating-point 4x4 inverse-bind matrices.  The default is that each matrix is a 4x4 identity matrix, which implies that inverse-bind matrices were pre-applied */
    inverseBindMatrices?: number;
    /** The index of the node used as a skeleton root. When undefined, joints transforms resolve to scene root */
    skeleton?: number;
    /** Indices of skeleton nodes, used as joints in this skin.  The array length must be the same as the count property of the inverseBindMatrices accessor (when defined) */
    joints: number[];
}

/**
 * @internal
 * A texture and its sampler
 */
export interface glTFTexture extends glTFChildNodeProperty, glTFNodeProperty {
    /** The index of the sampler used by this texture. When undefined, a sampler with repeat wrapping and auto filtering should be used */
    sampler?: number;
    /** The index of the image used by this texture */
    source: number;
}

/**
 * @internal
 */
export interface glTF extends glTFNodeProperty {
    /** An array of accessors. An accessor is a typed view into a bufferView */
    accessors?: glTFAccessor[];
    /** An array of keyframe animations */
    animations?: glTFAnimation[];
    /** Metadata about the glTF asset */
    asset: glTFAsset;
    /** An array of buffers.  A buffer points to binary geometry, animation, or skins */
    buffers?: glTFBuffer[];
    /** An array of bufferViews.  A bufferView is a view into a buffer generally representing a subset of the buffer */
    bufferViews?: glTFBufferView[];
    /** An array of cameras */
    cameras?: glTFCamera[];
    /** Names of glTF extensions used somewhere in this asset */
    extensionsUsed?: string[];
    /** Names of glTF extensions required to properly load this asset */
    extensionsRequired?: string[];
    /** An array of images.  An image defines data used to create a texture */
    images?: glTFImage[];
    /** An array of materials.  A material defines the appearance of a primitive */
    materials?: glTFMaterial[];
    /** An array of meshes.  A mesh is a set of primitives to be rendered */
    meshes?: glTFMesh[];
    /** An array of nodes */
    nodes?: glTFNode[];
    /** An array of samplers.  A sampler contains properties for texture filtering and wrapping modes */
    samplers?: glTFSampler[];
    /** The index of the default scene */
    scene?: number;
    /** An array of scenes */
    scenes?: glTFScene[];
    /** An array of skins.  A skin is defined by joints and matrices */
    skins?: glTFSkin[];
    /** An array of textures */
    textures?: glTFTexture[];
}

/**
 * @internal
 */
export interface glTFMaterialAnisotropy {
    /** The anisotropy strength. When anisotropyTexture is present, this value is multiplied by the blue channel. default: 0.0 */
    anisotropyStrength: number;
    /** The rotation of the anisotropy in tangent, bitangent space, measured in radians counter-clockwise from the tangent. When anisotropyTexture is present, anisotropyRotation provides additional rotation to the vectors in the texture. default: 0.0 */
    anisotropyRotation: number;
    /** The anisotropy texture. Red and green channels represent the anisotropy direction in [-1, 1] tangent, bitangent space, to be rotated by anisotropyRotation. The blue channel contains strength as [0, 1] to be multiplied by anisotropyStrength. */
    anisotropyTexture: glTFTextureInfo;
}

/**
 * @internal
 */
export interface glTFMaterialClearCoat {
    /** The clearcoat layer intensity. default: 0.0*/
    clearcoatFactor?: number;
    /** The base color texture */
    clearcoatTexture?: glTFTextureInfo;
    /** The clearcoat layer roughness.  default: 0.0*/
    clearcoatRoughnessFactor?: number;
    /** The clearcoat layer roughness texture.*/
    clearcoatRoughnessTexture?: glTFTextureInfo;
    /** The clearcoat normal map texture. */
    clearcoatNormalTexture?: glTFMaterialNormalTextureInfo;
}

/**
 * @internal
 */
export interface glTFMaterialEmissionStrength {
    /** The strength adjustment to be multiplied with the material's emissive value. default: 1.0 */
    emissiveStrength: number;
}

/**
 * @internal
 */
export interface glTFMaterialIOR {
    /** The index of refraction. default: 1.5 */
    ior: number;
}

/**
 * @internal
 */
export interface glTFMaterialIridescence {
    /** The iridescence intensity factor. default: 0.0 */
    iridescenceFactor: number;
    /** The iridescence intensity texture. */
    iridescenceTexture: glTFTextureInfo;
    /** The index of refraction of the dielectric thin-film layer. default: 1.3 */
    iridescenceIor: number;
    /** The minimum thickness of the thin-film layer given in nanometers. default: 100.0 */
    iridescenceThicknessMinimum: number;
    /** The maximum thickness of the thin-film layer given in nanometers. default: 400.0 */
    iridescenceThicknessMaximum: number;
    /** The thickness texture of the thin-film layer. */
    iridescenceThicknessTexture: glTFTextureInfo;
}

/**
 * @internal
 */
export interface glTFMaterialSheen {
    /** The sheen color in linear space. default: [0, 0, 0] */
    sheenColorFactor: number[];
    /** The sheen color (RGB) in sRGB transfer function. */
    sheenColorTexture: glTFTextureInfo;
    /** The sheen roughness. default: 0.0 */
    sheenRoughnessFactor: number;
    /** The sheen roughness (Alpha) texture. */
    sheenRoughnessTexture: glTFTextureInfo;
}

/**
 * @internal
 */
export interface glTFMaterialSpecular {
    /** The strength of the specular reflection. default: 1.0 */
    specularFactor: number;
    /** A texture that defines the strength of the specular reflection, stored in the alpha (A) channel. This will be multiplied by specularFactor. */
    specularTexture: glTFTextureInfo;
    /** The F0 color of the specular reflection (linear RGB). default: [1.0, 1.0, 1.0] */
    specularColorFactor: number[];
    /** A texture that defines the F0 color of the specular reflection, stored in the RGB channels and encoded in sRGB. This texture will be multiplied by specularColorFactor. */
    specularColorTexture: glTFTextureInfo;
}

/**
 * @internal
 */
export interface glTFMaterialTransmission {
    /** The base percentage of light that is transmitted through the surface. default: 0 */
    transmissionFactor: number;
    /** A texture that defines the transmission percentage of the surface, stored in the R channel. */
    transmissionTexture: glTFTextureInfo;
}

/**
 * @internal
 */
export interface glTFMaterialVolume {
    /** The thickness of the volume beneath the surface. default: 0.0 */
    thicknessFactor: number;
    /** A texture that defines the thickness, stored in the G channel. */
    thicknessTexture: glTFTextureInfo;
    /** Density of the medium given as the average distance that light travels in the medium before interacting with a particle. default: +Infinity */
    attenuationDistance: number;
    /** The color that white light turns into due to absorption when reaching the attenuation distance. default: [1, 1, 1] */
    attenuationColor: number[];
}

/**
 * @internal
 */
export interface glTFTextureTransform {
    /** The offset of the UV coordinate origin as a factor of the texture dimensions. default: [0, 0] */
    offset: number[];
    /** Rotate the UVs by this many radians counter-clockwise around the origin. This is equivalent to a similar rotation of the image clockwise. default: 0.0 */
    rotation: number;
    /** The scale factor applied to the components of the UV coordinates. default: [1, 1] */
    scale: number[];
    /** Overrides the textureInfo texCoord value if supplied, and if this extension is supported. */
    texCoord: number;
}