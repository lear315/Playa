{
  "_$ver": 1,
  "_$id": "ec3rzzdq",
  "_$type": "Scene",
  "left": 0,
  "right": 0,
  "top": 0,
  "bottom": 0,
  "name": "Scene2D",
  "_$comp": [
    {
      "_$type": "7bad1742-6eed-4d8d-81c0-501dc5bf03d6",
      "scriptPath": "../src/Main.ts"
    }
  ],
  "_$child": [
    {
      "_$id": "zi2e9msv",
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
          "_$id": "s6fv3w2d",
          "_$type": "Camera",
          "name": "Main Camera",
          "transform": {
            "localPosition": {
              "_$type": "Vector3",
              "y": 1,
              "z": 5
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
          }
        },
        {
          "_$id": "sul9ib8y",
          "_$type": "Sprite3D",
          "name": "Direction Light",
          "transform": {
            "localPosition": {
              "_$type": "Vector3",
              "x": 5,
              "y": 5,
              "z": 5
            },
            "localRotation": {
              "_$type": "Quaternion",
              "x": -0.40821789367673483,
              "y": 0.23456971600980447,
              "z": 0.109381654946615,
              "w": 0.875426098065593
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
              }
            }
          ]
        }
      ]
    },
    {
      "_$id": "rftuabag",
      "_$type": "Image",
      "name": "Image",
      "width": 720,
      "height": 1280,
      "alpha": 0.568,
      "_mouseState": 2,
      "material": {
        "_$uuid": "ae3e59a0-fc74-40e3-a65d-bfa333ca56b8",
        "_$type": "Material"
      },
      "top": 0,
      "bottom": 0,
      "centerX": 0,
      "gray": true,
      "skin": "res://00000000-0000-0000-0001-000000000000",
      "color": "#ffffff"
    },
    {
      "_$id": "at0eo4o5",
      "_$type": "Button",
      "name": "Button",
      "x": 271,
      "y": 1124,
      "width": 179,
      "height": 86,
      "visible": false,
      "_mouseState": 2,
      "bottom": 70,
      "centerX": 0,
      "toggle": true,
      "stateNum": 1,
      "skin": "res://2fe28f37-8926-47f9-a5c5-73ec70260fdc",
      "sizeGrid": "50,78,51,66,0",
      "label": "开始游戏",
      "labelSize": 33,
      "labelBold": true,
      "labelColors": "#e0e0e0,#ffffff,#d0d0d0",
      "labelAlign": "center",
      "labelVAlign": "middle",
      "labelPadding": "0,0,8,0"
    }
  ]
}