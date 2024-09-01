{
  "_$ver": 1,
  "_$id": "ec3rzzdq",
  "_$type": "Scene",
  "left": 0,
  "right": 0,
  "top": 0,
  "bottom": 0,
  "name": "Scene2D",
  "_$child": [
    {
      "_$id": "n9gjxcltvl",
      "_$type": "Scene3D",
      "name": "Scene3D",
      "skyRenderer": {
        "meshType": "dome",
        "material": {
          "_$uuid": "793cffc6-730a-4756-a658-efe98c230292",
          "_$type": "Material"
        }
      },
      "ambientColor": {
        "_$type": "Color",
        "r": 0.424308,
        "g": 0.4578516,
        "b": 0.5294118
      },
      "_reflectionsIblSamples": 1024,
      "fogStart": 0,
      "fogEnd": 300,
      "fogColor": {
        "_$type": "Color",
        "r": 0.5,
        "g": 0.5,
        "b": 0.5
      },
      "_$child": [
        {
          "_$id": "6jx8h8bvc6",
          "_$type": "Camera",
          "name": "Main Camera",
          "transform": {
            "localPosition": {
              "_$type": "Vector3",
              "x": -0.51881,
              "y": 0.9576774295760675,
              "z": -1.47772
            },
            "localRotation": {
              "_$type": "Quaternion",
              "x": -0.049596004271814736,
              "y": -0.9614186658029155,
              "z": -0.1929695289349764,
              "w": 0.1896764252842873
            }
          },
          "nearPlane": 0.3,
          "farPlane": 1000,
          "clearFlag": 1,
          "clearColor": {
            "_$type": "Color",
            "r": 0.3921,
            "g": 0.5843,
            "b": 0.9294
          },
          "msaa": true,
          "fxaa": true
        },
        {
          "_$id": "6ni3p096l5",
          "_$type": "LightSprite",
          "name": "Direction Light",
          "transform": {
            "localPosition": {
              "_$type": "Vector3",
              "x": 5,
              "y": 4.18987,
              "z": 5
            },
            "localRotation": {
              "_$type": "Quaternion",
              "x": -0.4174594591011612,
              "y": -0.14117624573313015,
              "z": -0.06583156662040131,
              "w": 0.8952446997798805
            }
          },
          "_$comp": [
            {
              "_$type": "DirectionLightCom",
              "color": {
                "_$type": "Color",
                "r": 0.6,
                "g": 0.6,
                "b": 0.6
              },
              "strength": 1,
              "angle": 0.526,
              "maxBounces": 1024
            }
          ]
        }
      ]
    },
    {
      "_$id": "rftuabag",
      "_$type": "Image",
      "name": "Image",
      "x": 258,
      "y": 68,
      "width": 512,
      "height": 512,
      "material": {
        "_$uuid": "ae3e59a0-fc74-40e3-a65d-bfa333ca56b8",
        "_$type": "Material"
      },
      "skin": "res://f189185b-a903-4140-b493-25da94e1fc69",
      "useSourceSize": true,
      "color": "#ffffff"
    }
  ]
}