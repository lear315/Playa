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
      "scriptPath": "../src/Main.ts",
      "button": {
        "_$ref": "at0eo4o5"
      },
      "box": {
        "_$ref": "h99fsarv"
      },
      "scene3d": {
        "_$ref": "zi2e9msv"
      },
      "joystickSprite": {
        "_$ref": "iayl6jox"
      },
      "camera": {
        "_$ref": "s6fv3w2d"
      }
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
      "enableFog": true,
      "fogStart": 5,
      "fogEnd": 300,
      "fogDensity": 0.01,
      "fogColor": {
        "_$type": "Color",
        "r": 0.38255945405925124,
        "g": 0.09569737395589205,
        "b": 0.9496124031007753
      },
      "lightmaps": [],
      "componentElementDatasMap": {
        "_$type": "Record"
      },
      "_$child": [
        {
          "_$id": "s6fv3w2d",
          "_$type": "Camera",
          "name": "Main Camera",
          "transform": {
            "localPosition": {
              "_$type": "Vector3",
              "y": 18
            },
            "localRotation": {
              "_$type": "Quaternion",
              "x": -3.3046447095372276e-17,
              "y": 0.841864188144733,
              "z": 0.5396894372872325,
              "w": 5.154931416641162e-17
            }
          },
          "orthographicVerticalSize": 10,
          "fieldOfView": 60,
          "nearPlane": 0.3,
          "farPlane": 1000,
          "clearFlag": 1,
          "clearColor": {
            "_$type": "Color",
            "r": 0.3921,
            "g": 0.5843,
            "b": 0.9294
          },
          "cullingMask": 2147483647,
          "normalizedViewport": {
            "_$type": "Viewport",
            "width": 1,
            "height": 1
          },
          "depthTextureFormat": 35
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
              },
              "intensity": 1,
              "shadowStrength": 1,
              "shadowDistance": 50,
              "shadowDepthBias": 1,
              "shadowNormalBias": 1,
              "shadowNearPlane": 0.1,
              "strength": null,
              "angle": null,
              "maxBounces": null
            }
          ]
        },
        {
          "_$id": "bwxuazrn",
          "_$type": "Sprite3D",
          "name": "Plane",
          "transform": {
            "localScale": {
              "_$type": "Vector3",
              "x": 500,
              "y": 1,
              "z": 500
            }
          },
          "_$comp": [
            {
              "_$type": "MeshFilter",
              "sharedMesh": {
                "_$uuid": "4a4afb22-ef83-40a2-a6a8-212a2d20c52f",
                "_$type": "Mesh"
              }
            },
            {
              "_$type": "MeshRenderer",
              "lightmapScaleOffset": {
                "_$type": "Vector4"
              },
              "sharedMaterials": [
                {
                  "_$uuid": "ee8c0bcb-5c09-4362-b324-4fdad9373527",
                  "_$type": "Material"
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "_$id": "6kk34ed9",
      "_$type": "Box",
      "name": "UI",
      "width": 720,
      "height": 1280,
      "_mouseState": 2,
      "top": 0,
      "bottom": 0,
      "centerX": 0,
      "_$child": [
        {
          "_$id": "iayl6jox",
          "_$type": "Sprite",
          "name": "play_postion_bg",
          "x": 222,
          "y": 887,
          "width": 277,
          "height": 277,
          "alpha": 0.103,
          "texture": {
            "_$uuid": "21e8007e-e18c-4ff1-93ee-83df142cd032",
            "_$type": "Texture"
          },
          "_$child": [
            {
              "_$id": "71es19m2",
              "_$type": "Sprite",
              "name": "inner",
              "x": 139,
              "y": 139,
              "width": 172,
              "height": 172,
              "anchorX": 0.5,
              "anchorY": 0.5,
              "texture": {
                "_$uuid": "e22f1ac8-33dd-459c-893f-7e820d33ae81",
                "_$type": "Texture"
              }
            }
          ]
        }
      ]
    },
    {
      "_$id": "h99fsarv",
      "_$type": "Box",
      "name": "Box",
      "width": 720,
      "height": 1280,
      "_mouseState": 2,
      "top": 0,
      "bottom": 0,
      "centerX": 0,
      "_$child": [
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
          "y": 1164,
          "width": 179,
          "height": 86,
          "_mouseState": 2,
          "bottom": 30,
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
    },
    {
      "_$id": "fx54ztm5",
      "_$type": "Panel",
      "name": "Panel",
      "x": 56,
      "y": 67,
      "width": 200,
      "height": 200,
      "_mouseState": 2,
      "_$child": [
        {
          "_$id": "12hkvmhg",
          "_$type": "Label",
          "name": "Label",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "viwi3lus",
          "_$type": "Label",
          "name": "Label(1)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "n4yf41g9",
          "_$type": "Label",
          "name": "Label(2)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "7v0vgmcj",
          "_$type": "Label",
          "name": "Label(3)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "dht1gkyo",
          "_$type": "Label",
          "name": "Label(4)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "fh4fhhqj",
          "_$type": "Label",
          "name": "Label(5)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "a0exrzos",
          "_$type": "Label",
          "name": "Label(6)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "3726wwir",
          "_$type": "Label",
          "name": "Label(7)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "rxksumdn",
          "_$type": "Label",
          "name": "Label(8)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "no8h5f9e",
          "_$type": "Label",
          "name": "Label(9)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "cqppinwx",
          "_$type": "Label",
          "name": "Label(10)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "k1rqf7d3",
          "_$type": "Label",
          "name": "Label(11)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "4ans44xc",
          "_$type": "Label",
          "name": "Label(12)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "w85mcx8i",
          "_$type": "Label",
          "name": "Label(13)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "7iapr0gf",
          "_$type": "Label",
          "name": "Label(14)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "mzhnptsy",
          "_$type": "Label",
          "name": "Label(15)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "j2dev1x7",
          "_$type": "Label",
          "name": "Label(16)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "m4qo7eq2",
          "_$type": "Label",
          "name": "Label(17)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "ali7qzej",
          "_$type": "Label",
          "name": "Label(18)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "3b1pztc9",
          "_$type": "Label",
          "name": "Label(19)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "8zndmfrx",
          "_$type": "Label",
          "name": "Label(20)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "y9vw3o7h",
          "_$type": "Label",
          "name": "Label(21)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "hmlzyb08",
          "_$type": "Label",
          "name": "Label(22)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "bu98xi1r",
          "_$type": "Label",
          "name": "Label(23)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "ms10v2gv",
          "_$type": "Label",
          "name": "Label(24)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "47li04lv",
          "_$type": "Label",
          "name": "Label(25)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "cd916vqw",
          "_$type": "Label",
          "name": "Label(26)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "7kuj99ml",
          "_$type": "Label",
          "name": "Label(27)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "y91z4uqi",
          "_$type": "Label",
          "name": "Label(28)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "96hp1wiy",
          "_$type": "Label",
          "name": "Label(29)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "tjssnnkb",
          "_$type": "Label",
          "name": "Label(30)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "ow8zgrxw",
          "_$type": "Label",
          "name": "Label(31)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "l4ssdhju",
          "_$type": "Label",
          "name": "Label(32)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "7hz6o8sw",
          "_$type": "Label",
          "name": "Label(33)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "6h8ir7hk",
          "_$type": "Label",
          "name": "Label(34)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "rucxfxpr",
          "_$type": "Label",
          "name": "Label(35)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "8zhsrc3q",
          "_$type": "Label",
          "name": "Label(36)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "o2amcj57",
          "_$type": "Label",
          "name": "Label(37)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "8utnwqcx",
          "_$type": "Label",
          "name": "Label(38)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        },
        {
          "_$id": "38kkgh51",
          "_$type": "Label",
          "name": "Label(39)",
          "width": 120,
          "height": 28,
          "text": "Label",
          "fontSize": 20,
          "color": "#FFFFFF",
          "valign": "top",
          "padding": "0,0,0,0"
        }
      ]
    }
  ]
}