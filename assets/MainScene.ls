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
      "fogStart": 12,
      "fogEnd": 150,
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
        },
        {
          "_$id": "3dh2eyzo",
          "_$type": "Sprite3D",
          "name": "Sprite3D",
          "_$child": [
            {
              "_$id": "indbfp3x",
              "_$type": "Sprite3D",
              "name": "cactus_3",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 1,
                  "z": 1
                }
              },
              "_$child": [
                {
                  "_$id": "au36c6cv",
                  "_$type": "Sprite3D",
                  "name": "cactus_3",
                  "transform": {
                    "localPosition": {
                      "_$type": "Vector3",
                      "x": -3.7253374125821317,
                      "y": -1
                    },
                    "localRotation": {
                      "_$type": "Quaternion",
                      "w": -1
                    }
                  },
                  "_$comp": [
                    {
                      "_$type": "MeshFilter",
                      "sharedMesh": {
                        "_$uuid": "3a940176-fa85-45b9-934a-f591b96e4a90",
                        "_$type": "Mesh"
                      }
                    },
                    {
                      "_$type": "MeshRenderer",
                      "receiveShadow": true,
                      "castShadow": true,
                      "sharedMaterials": [
                        {
                          "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                          "_$type": "Material"
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "gwc2a3r4",
              "_$type": "Sprite3D",
              "name": "cactus_2",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 2,
                  "z": 2
                }
              },
              "_$child": [
                {
                  "_$id": "1vs4c7uz",
                  "_$type": "Sprite3D",
                  "name": "cactus_2",
                  "transform": {
                    "localPosition": {
                      "_$type": "Vector3",
                      "y": -1,
                      "z": 4.312310019090796
                    },
                    "localRotation": {
                      "_$type": "Quaternion",
                      "w": -1
                    }
                  },
                  "_$comp": [
                    {
                      "_$type": "MeshFilter",
                      "sharedMesh": {
                        "_$uuid": "132367cd-7639-4f2b-a57c-cb94ed0e4352",
                        "_$type": "Mesh"
                      }
                    },
                    {
                      "_$type": "MeshRenderer",
                      "receiveShadow": true,
                      "castShadow": true,
                      "sharedMaterials": [
                        {
                          "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                          "_$type": "Material"
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "lnsnz8ps",
              "_$type": "Sprite3D",
              "name": "cactus_1",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 3,
                  "z": 3
                }
              },
              "_$child": [
                {
                  "_$id": "hkfrfuol",
                  "_$type": "Sprite3D",
                  "name": "cactus_1",
                  "transform": {
                    "localPosition": {
                      "_$type": "Vector3",
                      "y": -1
                    },
                    "localRotation": {
                      "_$type": "Quaternion",
                      "w": -1
                    }
                  },
                  "_$comp": [
                    {
                      "_$type": "MeshFilter",
                      "sharedMesh": {
                        "_$uuid": "16be657e-43e7-4853-bf55-6969a6518122",
                        "_$type": "Mesh"
                      }
                    },
                    {
                      "_$type": "MeshRenderer",
                      "receiveShadow": true,
                      "castShadow": true,
                      "sharedMaterials": [
                        {
                          "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                          "_$type": "Material"
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "qj51d460",
              "_$type": "Sprite3D",
              "name": "cloud_small",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -11.280019760131836,
                  "y": 13.406152959815703
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "68049995-daeb-43a9-aaba-0b00f88ce9d2",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "upn86wf1",
              "_$type": "Sprite3D",
              "name": "cloud_quadrouple",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 13.628122734052065,
                  "y": 5,
                  "z": 11
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "28760d6d-04e6-453b-89b7-a77375994086",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "7x36zymu",
              "_$type": "Sprite3D",
              "name": "cloud_medium",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "y": 7.1819325122593,
                  "z": -15.393782816878062
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "86270537-e155-40f7-9ef8-73bc99236cd1",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "a3lh70is",
              "_$type": "Sprite3D",
              "name": "cloud_large",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "y": 9.82550556831658,
                  "z": 8.025571424522358
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "dfe97ecc-d23a-4cef-9b24-7b84109817c7",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "dbps6iww",
              "_$type": "Sprite3D",
              "name": "cloud_half",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "y": 3.670309543609619,
                  "z": 2.315290964372246
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "c035d830-979b-40e4-aeae-6b2ce57783ec",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "vuzkqj0b",
              "_$type": "Sprite3D",
              "name": "cloud_3_double",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 7.429730467676908,
                  "y": 8.489861881850816
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "aa099c07-9d02-439f-9c59-b35fcdb3a632",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "wtoajef0",
              "_$type": "Sprite3D",
              "name": "cloud_3",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "y": 3.670309543609619,
                  "z": 2.979501181691746
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "707b5413-4f59-4ed9-89bc-7bb6d50fabb1",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "itlo73q1",
              "_$type": "Sprite3D",
              "name": "cloud_2_double",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "y": 7.908720193892311,
                  "z": -10.854228591295435
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "52e1821f-ec12-4354-a156-e154df59c420",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "ma1z9538",
              "_$type": "Sprite3D",
              "name": "cloud_2",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "y": -3.157867115637522
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "2cc723a3-76be-43d5-b5a9-f957477cc093",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "09ihckzk",
              "_$type": "Sprite3D",
              "name": "cloud_1_double",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -13.793849253643954,
                  "y": 14.711364696080947
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "afa8042d-2703-4576-b3c2-6b4858e77801",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "dlggbdm8",
              "_$type": "Sprite3D",
              "name": "cloud_1",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -1.650082282212809,
                  "y": 3.670309543609619
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "87f15524-bff7-4e35-86b9-5730e8dacc23",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "ute0r32r",
              "_$type": "Sprite3D",
              "name": "Chick",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "y": 3.670309448875382
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "Animator",
                  "cullingMode": 0,
                  "controllerLayers": [
                    {
                      "_$type": "AnimatorControllerLayer",
                      "name": "Base Layer",
                      "states": [
                        {
                          "_$type": "AnimatorState",
                          "name": "Idle",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "3f7b2d23-4146-42e9-8d14-c6062ed57172",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "Jump Forward W Root",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "da70bd76-254e-477f-a9e2-0ba64e420787",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "Jump Forward In Place",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "4d4b16c1-607b-4e33-b220-9aa620c7830a",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "Jump Forward In Place 0",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "4d4b16c1-607b-4e33-b220-9aa620c7830a",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "Jump Forward In Place 1",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "4d4b16c1-607b-4e33-b220-9aa620c7830a",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "Idle 0",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "3f7b2d23-4146-42e9-8d14-c6062ed57172",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "Turn Left",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "f1dcf1bc-0ecf-457c-aff3-430dcfed8d46",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "Turn Right",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "eebf75c0-a876-4926-b67b-2854f8bd15c2",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "Attack",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "e38d7937-aecb-445b-9016-553651d0136a",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "Idle 1",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "3f7b2d23-4146-42e9-8d14-c6062ed57172",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "Idle 2",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "3f7b2d23-4146-42e9-8d14-c6062ed57172",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "Idle 3",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "3f7b2d23-4146-42e9-8d14-c6062ed57172",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "Idle 4",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "3f7b2d23-4146-42e9-8d14-c6062ed57172",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "Cast Spell",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "8967720d-88b0-4312-bfcc-04a89a5f5fa9",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "Die",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "f3a9449c-da3e-40a5-b547-52d4458590dd",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "TakeDamage",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "927c6931-c358-48d3-a12e-25fcf9e6acf8",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "Idle 5",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "3f7b2d23-4146-42e9-8d14-c6062ed57172",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "Jump Forward In Place 2",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "4d4b16c1-607b-4e33-b220-9aa620c7830a",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        }
                      ],
                      "defaultStateName": "Idle"
                    }
                  ]
                }
              ],
              "_$child": [
                {
                  "_$id": "tnaey3aq",
                  "_$type": "Sprite3D",
                  "name": "Chick",
                  "transform": {
                    "localPosition": {
                      "_$type": "Vector3",
                      "z": -1.562934904766064
                    },
                    "localRotation": {
                      "_$type": "Quaternion",
                      "x": 0.7071067811865476,
                      "w": -0.7071067811865476
                    }
                  },
                  "_$comp": [
                    {
                      "_$type": "MeshFilter",
                      "sharedMesh": {
                        "_$uuid": "bbdfa675-ec3a-4c79-a803-43443b5b2156",
                        "_$type": "Mesh"
                      }
                    },
                    {
                      "_$type": "SkinnedMeshRenderer",
                      "receiveShadow": true,
                      "castShadow": true,
                      "sharedMaterials": [
                        {
                          "_$uuid": "941deac1-1829-406d-a2c9-e98bf279fc8f",
                          "_$type": "Material"
                        }
                      ],
                      "_bones": [
                        {
                          "_$ref": "2squbjjy"
                        },
                        {
                          "_$ref": "jqe91fhe"
                        },
                        {
                          "_$ref": "7rjvp180"
                        },
                        {
                          "_$ref": "ie4todvf"
                        },
                        {
                          "_$ref": "ux0jz9d5"
                        },
                        {
                          "_$ref": "31po2lk4"
                        },
                        {
                          "_$ref": "46lgaskh"
                        },
                        {
                          "_$ref": "nrm93xa3"
                        },
                        {
                          "_$ref": "ete9e8z9"
                        },
                        {
                          "_$ref": "a076i7qk"
                        },
                        {
                          "_$ref": "fusc0l21"
                        },
                        {
                          "_$ref": "xttza9ow"
                        },
                        {
                          "_$ref": "na2yrho0"
                        },
                        {
                          "_$ref": "iiopz5cx"
                        },
                        {
                          "_$ref": "1qaa1qdh"
                        }
                      ],
                      "rootBone": {
                        "_$ref": "jqe91fhe"
                      },
                      "localBounds": {
                        "_$type": "Bounds",
                        "min": {
                          "_$type": "Vector3",
                          "x": -0.3395475,
                          "y": -0.3294792,
                          "z": -0.482244
                        },
                        "max": {
                          "_$type": "Vector3",
                          "x": 0.4591725,
                          "y": 0.3098322,
                          "z": 0.4822441
                        }
                      }
                    }
                  ]
                },
                {
                  "_$id": "u8a2mxx8",
                  "_$type": "Sprite3D",
                  "name": "Rig",
                  "transform": {
                    "localRotation": {
                      "_$type": "Quaternion",
                      "x": -0.5000000499999925,
                      "y": -0.5000000499999925,
                      "z": -0.4999999500000025,
                      "w": -0.4999999500000025
                    }
                  }
                },
                {
                  "_$id": "iiopz5cx",
                  "_$type": "Sprite3D",
                  "name": "RigLLegPlatform",
                  "transform": {
                    "localPosition": {
                      "_$type": "Vector3",
                      "x": -4.103538e-9,
                      "y": 2.30772e-9,
                      "z": 0.01416467
                    },
                    "localRotation": {
                      "_$type": "Quaternion",
                      "x": -0.5000000499999925,
                      "y": -0.5000000499999925,
                      "z": -0.4999999500000025,
                      "w": -0.4999999500000025
                    }
                  }
                },
                {
                  "_$id": "jqe91fhe",
                  "_$type": "Sprite3D",
                  "name": "RigPevis",
                  "transform": {
                    "localPosition": {
                      "_$type": "Vector3",
                      "x": -6.191762e-10,
                      "y": 0.1302308,
                      "z": 0.01416465
                    },
                    "localRotation": {
                      "_$type": "Quaternion",
                      "x": -0.5000000499999925,
                      "y": -0.5000000499999925,
                      "z": -0.4999999500000025,
                      "w": -0.4999999500000025
                    }
                  },
                  "_$child": [
                    {
                      "_$id": "fusc0l21",
                      "_$type": "Sprite3D",
                      "name": "RigLLeg1",
                      "transform": {
                        "localPosition": {
                          "_$type": "Vector3",
                          "x": -9.536743e-9,
                          "y": -5.960464e-9,
                          "z": 7.771733e-9
                        },
                        "localRotation": {
                          "_$type": "Quaternion",
                          "x": 0.12481638828075371,
                          "y": 0.9920883068509564,
                          "z": 0.01337284874439799,
                          "w": 0.0016815298421179895
                        },
                        "localScale": {
                          "_$type": "Vector3",
                          "x": 1,
                          "y": 0.9999999,
                          "z": 1
                        }
                      },
                      "_$child": [
                        {
                          "_$id": "xttza9ow",
                          "_$type": "Sprite3D",
                          "name": "RigLLeg2",
                          "transform": {
                            "localPosition": {
                              "_$type": "Vector3",
                              "x": 0.05960553,
                              "z": 1.490116e-10
                            },
                            "localRotation": {
                              "_$type": "Quaternion",
                              "x": -0.03378320098080413,
                              "y": 0.005865972170302681,
                              "z": 0.4932814143210955,
                              "w": -0.8691937252346956
                            }
                          },
                          "_$child": [
                            {
                              "_$id": "na2yrho0",
                              "_$type": "Sprite3D",
                              "name": "RigLLegAnkle",
                              "transform": {
                                "localPosition": {
                                  "_$type": "Vector3",
                                  "x": 0.04964467,
                                  "y": -2.384186e-9
                                },
                                "localRotation": {
                                  "_$type": "Quaternion",
                                  "x": 0.0203632995777118,
                                  "y": -0.015140519686020293,
                                  "z": -0.5963928876321772,
                                  "w": -0.8022914833623119
                                }
                              }
                            }
                          ]
                        }
                      ]
                    },
                    {
                      "_$id": "n7by2plu",
                      "_$type": "Sprite3D",
                      "name": "RigSpine",
                      "transform": {
                        "localRotation": {
                          "_$type": "Quaternion",
                          "x": -7.10543e-15,
                          "y": 2.557175e-14,
                          "z": 7.105427e-15,
                          "w": -1
                        }
                      },
                      "_$child": [
                        {
                          "_$id": "2squbjjy",
                          "_$type": "Sprite3D",
                          "name": "RigHead",
                          "transform": {
                            "localPosition": {
                              "_$type": "Vector3",
                              "x": 0.05746234,
                              "z": 1.705303e-15
                            },
                            "localRotation": {
                              "_$type": "Quaternion",
                              "x": 7.105427e-15,
                              "y": -1.327157e-14,
                              "z": -7.105427e-15,
                              "w": -1
                            }
                          },
                          "_$child": [
                            {
                              "_$id": "7rjvp180",
                              "_$type": "Sprite3D",
                              "name": "RigJaw",
                              "transform": {
                                "localPosition": {
                                  "_$type": "Vector3",
                                  "x": 0.04857367,
                                  "y": 0.2456775,
                                  "z": -4.783518e-8
                                },
                                "localRotation": {
                                  "_$type": "Quaternion",
                                  "x": 4.01943689305786e-14,
                                  "y": -1.376787963368836e-7,
                                  "z": -0.7071067811865408,
                                  "w": -0.7071067811865408
                                }
                              }
                            },
                            {
                              "_$id": "46lgaskh",
                              "_$type": "Sprite3D",
                              "name": "RigLArm1",
                              "transform": {
                                "localPosition": {
                                  "_$type": "Vector3",
                                  "x": 0.06164192,
                                  "y": -0.00002433419,
                                  "z": 0.248772
                                },
                                "localRotation": {
                                  "_$type": "Quaternion",
                                  "x": -0.48446495659426964,
                                  "y": 0.5087728544163989,
                                  "z": -0.4887102562139112,
                                  "w": -0.5173066536518115
                                }
                              },
                              "_$child": [
                                {
                                  "_$id": "nrm93xa3",
                                  "_$type": "Sprite3D",
                                  "name": "RigLArm2",
                                  "transform": {
                                    "localPosition": {
                                      "_$type": "Vector3",
                                      "x": 0.0957139,
                                      "z": -2.861023e-8
                                    },
                                    "localRotation": {
                                      "_$type": "Quaternion",
                                      "x": 0.6880828991198505,
                                      "y": 0.010671269986350027,
                                      "z": 0.007891353989905908,
                                      "w": -0.7255106990719753
                                    }
                                  },
                                  "_$child": [
                                    {
                                      "_$id": "ete9e8z9",
                                      "_$type": "Sprite3D",
                                      "name": "RigLArm3",
                                      "transform": {
                                        "localPosition": {
                                          "_$type": "Vector3",
                                          "x": 0.07017479,
                                          "y": -4.291534e-8
                                        },
                                        "localRotation": {
                                          "_$type": "Quaternion",
                                          "x": -0.0000011404709800175741,
                                          "y": -0.0000013474429763911755,
                                          "z": -0.014974059737636432,
                                          "w": -0.9998878824807595
                                        }
                                      }
                                    }
                                  ]
                                }
                              ]
                            },
                            {
                              "_$id": "1qaa1qdh",
                              "_$type": "Sprite3D",
                              "name": "RigLFeeler",
                              "transform": {
                                "localPosition": {
                                  "_$type": "Vector3",
                                  "x": 0.232224,
                                  "y": 5.00679e-8,
                                  "z": 0.01812605
                                },
                                "localRotation": {
                                  "_$type": "Quaternion",
                                  "x": 0.1308852962401092,
                                  "y": 0.31598549092280814,
                                  "z": 0.3596047896697736,
                                  "w": -0.8681627750606269
                                }
                              }
                            },
                            {
                              "_$id": "ie4todvf",
                              "_$type": "Sprite3D",
                              "name": "RigRArm1",
                              "transform": {
                                "localPosition": {
                                  "_$type": "Vector3",
                                  "x": 0.06164188,
                                  "y": -0.00002433538,
                                  "z": -0.248772
                                },
                                "localRotation": {
                                  "_$type": "Quaternion",
                                  "x": 0.4844649830413471,
                                  "y": -0.5087728821904514,
                                  "z": -0.4887103828927373,
                                  "w": -0.5173064818917334
                                }
                              },
                              "_$child": [
                                {
                                  "_$id": "ux0jz9d5",
                                  "_$type": "Sprite3D",
                                  "name": "RigRArm2",
                                  "transform": {
                                    "localPosition": {
                                      "_$type": "Vector3",
                                      "x": 0.09571392,
                                      "y": 1.907349e-8,
                                      "z": -2.622604e-8
                                    },
                                    "localRotation": {
                                      "_$type": "Quaternion",
                                      "x": -0.6880823378247934,
                                      "y": -0.010671139035754536,
                                      "z": 0.007891252286945451,
                                      "w": -0.7255112344427136
                                    }
                                  },
                                  "_$child": [
                                    {
                                      "_$id": "31po2lk4",
                                      "_$type": "Sprite3D",
                                      "name": "RigRArm3",
                                      "transform": {
                                        "localPosition": {
                                          "_$type": "Vector3",
                                          "x": 0.07017479,
                                          "y": 4.172325e-8,
                                          "z": 1.907349e-8
                                        },
                                        "localRotation": {
                                          "_$type": "Quaternion",
                                          "x": -4.375486971825031e-7,
                                          "y": 3.587457976899367e-7,
                                          "z": -0.014973319903582657,
                                          "w": -0.9998878935614457
                                        }
                                      }
                                    }
                                  ]
                                }
                              ]
                            },
                            {
                              "_$id": "a076i7qk",
                              "_$type": "Sprite3D",
                              "name": "RigRFeeler",
                              "transform": {
                                "localPosition": {
                                  "_$type": "Vector3",
                                  "x": 0.232224,
                                  "y": 5.00679e-8,
                                  "z": -0.01812605
                                },
                                "localRotation": {
                                  "_$type": "Quaternion",
                                  "x": -0.13088539452700837,
                                  "y": -0.31598548678702126,
                                  "z": 0.3596047849630741,
                                  "w": -0.8681627636976489
                                }
                              }
                            }
                          ]
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "ucv0tf61",
              "_$type": "Sprite3D",
              "name": "chest_wood",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "y": 3.670309448875382
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "Animator",
                  "cullingMode": 0,
                  "controllerLayers": [
                    {
                      "_$type": "AnimatorControllerLayer",
                      "name": "Base Layer",
                      "states": [
                        {
                          "_$type": "AnimatorState",
                          "name": "idle",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "f675eee0-bdd2-4d5e-b615-d103cb807d83",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "open",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "3ae70dd7-13b7-4d1d-8f8b-9334d0a9ef47",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        }
                      ],
                      "defaultStateName": "idle"
                    }
                  ]
                }
              ],
              "_$child": [
                {
                  "_$id": "7qn37ke8",
                  "_$type": "Sprite3D",
                  "name": "chest_wood_LOD1",
                  "transform": {
                    "localPosition": {
                      "_$type": "Vector3",
                      "y": -0.43
                    },
                    "localRotation": {
                      "_$type": "Quaternion",
                      "w": -1
                    },
                    "localScale": {
                      "_$type": "Vector3",
                      "x": 0.5,
                      "y": 0.5,
                      "z": 0.5
                    }
                  },
                  "_$comp": [
                    {
                      "_$type": "MeshFilter",
                      "sharedMesh": {
                        "_$uuid": "dfad19d3-ec01-41fe-9560-162ace82fb65",
                        "_$type": "Mesh"
                      }
                    },
                    {
                      "_$type": "MeshRenderer",
                      "receiveShadow": true,
                      "castShadow": true,
                      "sharedMaterials": [
                        {
                          "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                          "_$type": "Material"
                        }
                      ]
                    }
                  ],
                  "_$child": [
                    {
                      "_$id": "a9js4t0p",
                      "_$type": "Sprite3D",
                      "name": "chest_wood_lid_LOD1",
                      "transform": {
                        "localPosition": {
                          "_$type": "Vector3",
                          "x": 0.004500639,
                          "y": 0.5625784,
                          "z": -0.4754299
                        },
                        "localRotation": {
                          "_$type": "Quaternion",
                          "w": -1
                        }
                      },
                      "_$comp": [
                        {
                          "_$type": "MeshFilter",
                          "sharedMesh": {
                            "_$uuid": "8db39329-e504-4cca-86ad-ac09b9252ddd",
                            "_$type": "Mesh"
                          }
                        },
                        {
                          "_$type": "MeshRenderer",
                          "receiveShadow": true,
                          "castShadow": true,
                          "sharedMaterials": [
                            {
                              "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                              "_$type": "Material"
                            }
                          ]
                        },
                        {
                          "_$type": "Animator",
                          "cullingMode": 0,
                          "controllerLayers": []
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "scrve98v",
              "_$type": "Sprite3D",
              "name": "chest_silver",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "y": 3.670309448875382
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "Animator",
                  "cullingMode": 0,
                  "controllerLayers": [
                    {
                      "_$type": "AnimatorControllerLayer",
                      "name": "Base Layer",
                      "states": [
                        {
                          "_$type": "AnimatorState",
                          "name": "idle",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "f675eee0-bdd2-4d5e-b615-d103cb807d83",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "open",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "41562a0e-767a-46d1-b51a-d18d5b688e60",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        }
                      ],
                      "defaultStateName": "idle"
                    }
                  ]
                }
              ],
              "_$child": [
                {
                  "_$id": "h4rx52bd",
                  "_$type": "Sprite3D",
                  "name": "chest_silver_LOD1",
                  "transform": {
                    "localPosition": {
                      "_$type": "Vector3",
                      "y": -0.43
                    },
                    "localRotation": {
                      "_$type": "Quaternion",
                      "w": -1
                    },
                    "localScale": {
                      "_$type": "Vector3",
                      "x": 0.5,
                      "y": 0.5,
                      "z": 0.5
                    }
                  },
                  "_$comp": [
                    {
                      "_$type": "MeshFilter",
                      "sharedMesh": {
                        "_$uuid": "79660698-7c64-42b0-a07c-62f91cece9a0",
                        "_$type": "Mesh"
                      }
                    },
                    {
                      "_$type": "MeshRenderer",
                      "receiveShadow": true,
                      "castShadow": true,
                      "sharedMaterials": [
                        {
                          "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                          "_$type": "Material"
                        }
                      ]
                    }
                  ],
                  "_$child": [
                    {
                      "_$id": "7vxg2096",
                      "_$type": "Sprite3D",
                      "name": "chest_silver_lid_LOD1",
                      "transform": {
                        "localPosition": {
                          "_$type": "Vector3",
                          "x": 0.004500639159232378,
                          "y": 0.5625782012939453,
                          "z": -2.678377022024708
                        },
                        "localRotation": {
                          "_$type": "Quaternion",
                          "w": -1
                        }
                      },
                      "_$comp": [
                        {
                          "_$type": "MeshFilter",
                          "sharedMesh": {
                            "_$uuid": "ddbe993d-9a25-4f0f-9716-303aee2f1bc7",
                            "_$type": "Mesh"
                          }
                        },
                        {
                          "_$type": "MeshRenderer",
                          "receiveShadow": true,
                          "castShadow": true,
                          "sharedMaterials": [
                            {
                              "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                              "_$type": "Material"
                            }
                          ]
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "31nm2q6w",
              "_$type": "Sprite3D",
              "name": "chest_gold",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "y": 3.670309448875382
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "Animator",
                  "cullingMode": 0,
                  "controllerLayers": [
                    {
                      "_$type": "AnimatorControllerLayer",
                      "name": "Base Layer",
                      "states": [
                        {
                          "_$type": "AnimatorState",
                          "name": "idle",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "f675eee0-bdd2-4d5e-b615-d103cb807d83",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        },
                        {
                          "_$type": "AnimatorState",
                          "name": "open",
                          "clipStart": 0,
                          "clip": {
                            "_$uuid": "7b33629e-80ce-4521-81f3-3085805b2050",
                            "_$type": "AnimationClip"
                          },
                          "soloTransitions": []
                        }
                      ],
                      "defaultStateName": "idle"
                    }
                  ]
                }
              ],
              "_$child": [
                {
                  "_$id": "ae9j2bmz",
                  "_$type": "Sprite3D",
                  "name": "chest_gold_LOD1",
                  "transform": {
                    "localPosition": {
                      "_$type": "Vector3",
                      "x": 1.2229343305208797,
                      "y": -0.43000006675720215
                    },
                    "localRotation": {
                      "_$type": "Quaternion",
                      "w": -1
                    },
                    "localScale": {
                      "_$type": "Vector3",
                      "x": 0.5,
                      "y": 0.5,
                      "z": 0.5
                    }
                  },
                  "_$comp": [
                    {
                      "_$type": "MeshFilter",
                      "sharedMesh": {
                        "_$uuid": "b48db062-d3d5-46b9-bfc3-c0c764475009",
                        "_$type": "Mesh"
                      }
                    },
                    {
                      "_$type": "MeshRenderer",
                      "receiveShadow": true,
                      "castShadow": true,
                      "sharedMaterials": [
                        {
                          "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                          "_$type": "Material"
                        }
                      ]
                    }
                  ],
                  "_$child": [
                    {
                      "_$id": "b6mwv8f0",
                      "_$type": "Sprite3D",
                      "name": "chest_gold_lid_LOD1",
                      "transform": {
                        "localPosition": {
                          "_$type": "Vector3",
                          "x": 0.004500639,
                          "y": 0.5625784,
                          "z": -0.4754299
                        },
                        "localRotation": {
                          "_$type": "Quaternion",
                          "w": -1
                        }
                      },
                      "_$comp": [
                        {
                          "_$type": "MeshFilter",
                          "sharedMesh": {
                            "_$uuid": "2f4ea903-4d78-40f2-83aa-412ffd83cb55",
                            "_$type": "Mesh"
                          }
                        },
                        {
                          "_$type": "MeshRenderer",
                          "receiveShadow": true,
                          "castShadow": true,
                          "sharedMaterials": [
                            {
                              "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                              "_$type": "Material"
                            }
                          ]
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "yf1697xg",
              "_$type": "Sprite3D",
              "name": "chain",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 9.400685640981449,
                  "y": 3.670309543609619
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "5f324d30-c40a-481b-aba5-7abbc5932cf0",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "kc9ui4ox",
              "_$type": "Sprite3D",
              "name": "canopy_block_2_LOD_setup",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "y": 3.670309543609619,
                  "z": -4.2182603234499725
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "65417897-b6da-4a61-9368-f99b43d40aec",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "3gbyx5gu",
              "_$type": "Sprite3D",
              "name": "canopy_block_1_LOD_setup",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "y": 3.670309543609619,
                  "z": -11.167675495992528
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "e4da978c-dba5-4d41-9a0f-3796b8428abe",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "kcb2lsr9",
              "_$type": "Sprite3D",
              "name": "cannonball_stack",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 3.8581073207721497,
                  "y": 3.670309543609619
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "2835c311-0de2-48f3-8049-734fbe07356e",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "i4btmg6g",
              "_$type": "Sprite3D",
              "name": "cannonball",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "y": 3.670309448875382
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "d91d292c-4504-497c-a7b8-32ebf2742526",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "5pj298y9",
              "_$type": "Sprite3D",
              "name": "cannon (1)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 2.5158333251805116,
                  "y": 3.670309543609619
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "2019e7b5-2f06-4139-9ebb-a99895114edc",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                },
                {
                  "_$type": "PhysicsCollider",
                  "collisionGroup": 1,
                  "canCollideWith": -1
                }
              ],
              "_$child": [
                {
                  "_$id": "toawijk7",
                  "_$type": "Sprite3D",
                  "name": "cannon_barrel_LOD2",
                  "transform": {
                    "localPosition": {
                      "_$type": "Vector3",
                      "x": -1.583331197810647,
                      "y": 1.2355961799621582,
                      "z": -0.00002970350942632649
                    },
                    "localRotation": {
                      "_$type": "Quaternion",
                      "w": -1
                    }
                  },
                  "_$comp": [
                    {
                      "_$type": "MeshFilter",
                      "sharedMesh": {
                        "_$uuid": "07fca08b-54eb-47fd-a208-39314af194c0",
                        "_$type": "Mesh"
                      }
                    },
                    {
                      "_$type": "MeshRenderer",
                      "receiveShadow": true,
                      "castShadow": true,
                      "sharedMaterials": [
                        {
                          "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                          "_$type": "Material"
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "hvol054w",
              "_$type": "Sprite3D",
              "name": "cannon",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "y": 3.670309543609619,
                  "z": -1.5539530353969142
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "7cd07a7a-25ff-47a0-8a8b-5dc98f512bf3",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                },
                {
                  "_$type": "PhysicsCollider",
                  "collisionGroup": 1,
                  "canCollideWith": -1
                }
              ],
              "_$child": [
                {
                  "_$id": "8w5tm98b",
                  "_$type": "Sprite3D",
                  "name": "cannon_barrel_LOD1",
                  "transform": {
                    "localPosition": {
                      "_$type": "Vector3",
                      "y": 1.2355961799621582,
                      "z": -5.098798608567617
                    },
                    "localRotation": {
                      "_$type": "Quaternion",
                      "w": -1
                    }
                  },
                  "_$comp": [
                    {
                      "_$type": "MeshFilter",
                      "sharedMesh": {
                        "_$uuid": "b3a7a0ce-c757-430a-bb5c-33d530dd6771",
                        "_$type": "Mesh"
                      }
                    },
                    {
                      "_$type": "MeshRenderer",
                      "receiveShadow": true,
                      "castShadow": true,
                      "sharedMaterials": [
                        {
                          "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                          "_$type": "Material"
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "35ospaq7",
              "_$type": "Sprite3D",
              "name": "cactus_flower",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "y": 3.670309448875382
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$child": [
                {
                  "_$id": "95zm879o",
                  "_$type": "Sprite3D",
                  "name": "cactus_flower",
                  "transform": {
                    "localPosition": {
                      "_$type": "Vector3",
                      "y": -1
                    },
                    "localRotation": {
                      "_$type": "Quaternion",
                      "w": -1
                    }
                  },
                  "_$comp": [
                    {
                      "_$type": "MeshFilter",
                      "sharedMesh": {
                        "_$uuid": "e1cb1186-149b-44df-b754-f03690836a40",
                        "_$type": "Mesh"
                      }
                    },
                    {
                      "_$type": "MeshRenderer",
                      "receiveShadow": true,
                      "castShadow": true,
                      "sharedMaterials": [
                        {
                          "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                          "_$type": "Material"
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "bkh1d7um",
              "_$type": "Sprite3D",
              "name": "cactus_block_top",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 9.196857582921727,
                  "y": 3.670309543609619
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "c8d2c314-d81c-4744-9cd1-cfa613a41c2f",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                },
                {
                  "_$type": "PhysicsCollider",
                  "collisionGroup": 1,
                  "canCollideWith": -1
                }
              ]
            },
            {
              "_$id": "x8l2fiq1",
              "_$type": "Sprite3D",
              "name": "cactus_block",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "y": 3.670309543609619,
                  "z": 1.4108465355745161
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "798286a1-5ee4-4c73-9c52-81d9a949d593",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "ffuzmajy",
              "_$type": "Sprite3D",
              "name": "cloud_small(1)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -34.21595272565378,
                  "y": 13.406152725219727,
                  "z": 23.84413571940224
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "68049995-daeb-43a9-aaba-0b00f88ce9d2",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "xqijubmt",
              "_$type": "Sprite3D",
              "name": "cloud_quadrouple(1)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -9.307810635810021,
                  "y": 5,
                  "z": 34.84413571940224
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "28760d6d-04e6-453b-89b7-a77375994086",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "ne66f812",
              "_$type": "Sprite3D",
              "name": "cloud_medium(1)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -22.935932965521932,
                  "y": 7.18193244934082,
                  "z": 8.450353103740609
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "86270537-e155-40f7-9ef8-73bc99236cd1",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "pa9p8tpp",
              "_$type": "Sprite3D",
              "name": "cloud_large(1)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -22.935932965521932,
                  "y": 9.825505256652832,
                  "z": 31.86970754252236
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "dfe97ecc-d23a-4cef-9b24-7b84109817c7",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "cm7j8rza",
              "_$type": "Sprite3D",
              "name": "cloud_half(1)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -22.935932965521932,
                  "y": 3.670309543609619,
                  "z": 26.159426647289205
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "c035d830-979b-40e4-aeae-6b2ce57783ec",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "muu144j7",
              "_$type": "Sprite3D",
              "name": "cloud_3_double(1)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -15.506202550177697,
                  "y": 8.489861488342285,
                  "z": 23.84413571940224
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "aa099c07-9d02-439f-9c59-b35fcdb3a632",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "uvx82lax",
              "_$type": "Sprite3D",
              "name": "cloud_3(1)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -22.935932965521932,
                  "y": 3.670309543609619,
                  "z": 26.823636966808245
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "707b5413-4f59-4ed9-89bc-7bb6d50fabb1",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "vp98sbxo",
              "_$type": "Sprite3D",
              "name": "cloud_2_double(1)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -22.935932965521932,
                  "y": 7.908720016479492,
                  "z": 12.989906746013569
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "52e1821f-ec12-4354-a156-e154df59c420",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "8xg4fia9",
              "_$type": "Sprite3D",
              "name": "cloud_2(1)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -22.935932965521932,
                  "y": -3.157867193222046,
                  "z": 23.84413571940224
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "2cc723a3-76be-43d5-b5a9-f957477cc093",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "sw9hqld7",
              "_$type": "Sprite3D",
              "name": "cloud_1_double(1)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -36.729781956915986,
                  "y": 14.71136474609375,
                  "z": 23.84413571940224
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "afa8042d-2703-4576-b3c2-6b4858e77801",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "shuaaw1k",
              "_$type": "Sprite3D",
              "name": "cloud_1(1)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -24.58601519608987,
                  "y": 3.670309543609619,
                  "z": 23.84413571940224
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "87f15524-bff7-4e35-86b9-5730e8dacc23",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "50gti2kz",
              "_$type": "Sprite3D",
              "name": "cloud_small(2)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 36.37280221409622,
                  "y": 13.406152725219727,
                  "z": 23.844135284423828
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "68049995-daeb-43a9-aaba-0b00f88ce9d2",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "dkgpfd1q",
              "_$type": "Sprite3D",
              "name": "cloud_quadrouple(2)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 61.28094525761429,
                  "y": 5,
                  "z": 34.84413528442383
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "28760d6d-04e6-453b-89b7-a77375994086",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "0foedaho",
              "_$type": "Sprite3D",
              "name": "cloud_medium(2)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 47.652823881576694,
                  "y": 7.18193244934082,
                  "z": 8.450352668762207
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "86270537-e155-40f7-9ef8-73bc99236cd1",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "6snygjki",
              "_$type": "Sprite3D",
              "name": "cloud_large(2)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 47.652823881576694,
                  "y": 9.825505256652832,
                  "z": 31.869707107543945
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "dfe97ecc-d23a-4cef-9b24-7b84109817c7",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "nx6secbo",
              "_$type": "Sprite3D",
              "name": "cloud_half(2)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 47.652823881576694,
                  "y": 3.670309543609619,
                  "z": 26.159425735473633
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "c035d830-979b-40e4-aeae-6b2ce57783ec",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "1q7czkxa",
              "_$type": "Sprite3D",
              "name": "cloud_3_double(2)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 55.082553343246616,
                  "y": 8.489861488342285,
                  "z": 23.844135284423828
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "aa099c07-9d02-439f-9c59-b35fcdb3a632",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "ku3lk56g",
              "_$type": "Sprite3D",
              "name": "cloud_3(2)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 47.652823881576694,
                  "y": 3.670309543609619,
                  "z": 26.823637008666992
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "707b5413-4f59-4ed9-89bc-7bb6d50fabb1",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "xiddpbbf",
              "_$type": "Sprite3D",
              "name": "cloud_2_double(2)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 47.652823881576694,
                  "y": 7.908720016479492,
                  "z": 12.989906311035156
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "52e1821f-ec12-4354-a156-e154df59c420",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "gq2x6531",
              "_$type": "Sprite3D",
              "name": "cloud_2(2)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 47.652823881576694,
                  "y": -3.157867193222046,
                  "z": 23.844135284423828
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "2cc723a3-76be-43d5-b5a9-f957477cc093",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "sgiwvudq",
              "_$type": "Sprite3D",
              "name": "cloud_1_double(2)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 33.85897393650833,
                  "y": 14.71136474609375,
                  "z": 23.844135284423828
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "afa8042d-2703-4576-b3c2-6b4858e77801",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "l39j99do",
              "_$type": "Sprite3D",
              "name": "cloud_1(2)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 46.00274033970658,
                  "y": 3.670309543609619,
                  "z": 23.844135284423828
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "87f15524-bff7-4e35-86b9-5730e8dacc23",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "8rpv4yrd",
              "_$type": "Sprite3D",
              "name": "cloud_small(3)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 36.372802734375,
                  "y": 13.406152725219727,
                  "z": -46.346130439606476
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "68049995-daeb-43a9-aaba-0b00f88ce9d2",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "8zjuyd45",
              "_$type": "Sprite3D",
              "name": "cloud_quadrouple(3)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 61.28094482421875,
                  "y": 5,
                  "z": -35.34613043960648
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "28760d6d-04e6-453b-89b7-a77375994086",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "btsfbyzl",
              "_$type": "Sprite3D",
              "name": "cloud_medium(3)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 47.65282440185547,
                  "y": 7.18193244934082,
                  "z": -61.7399130552681
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "86270537-e155-40f7-9ef8-73bc99236cd1",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "2kox6q69",
              "_$type": "Sprite3D",
              "name": "cloud_large(3)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 47.65282440185547,
                  "y": 9.825505256652832,
                  "z": -38.320558616486366
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "dfe97ecc-d23a-4cef-9b24-7b84109817c7",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "fhhz1ckf",
              "_$type": "Sprite3D",
              "name": "cloud_half(3)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 47.65282440185547,
                  "y": 3.670309543609619,
                  "z": -44.03083998855667
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "c035d830-979b-40e4-aeae-6b2ce57783ec",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "k3a3x9cb",
              "_$type": "Sprite3D",
              "name": "cloud_3_double(3)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 55.08255386352539,
                  "y": 8.489861488342285,
                  "z": -46.346130439606476
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "aa099c07-9d02-439f-9c59-b35fcdb3a632",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "1lpjgkby",
              "_$type": "Sprite3D",
              "name": "cloud_3(3)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 47.65282440185547,
                  "y": 3.670309543609619,
                  "z": -43.36662871536331
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "707b5413-4f59-4ed9-89bc-7bb6d50fabb1",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "q0gjzhd9",
              "_$type": "Sprite3D",
              "name": "cloud_2_double(3)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 47.65282440185547,
                  "y": 7.908720016479492,
                  "z": -57.20035941299515
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "52e1821f-ec12-4354-a156-e154df59c420",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "7mf12bh6",
              "_$type": "Sprite3D",
              "name": "cloud_2(3)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 47.65282440185547,
                  "y": -3.157867193222046,
                  "z": -46.346130439606476
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "2cc723a3-76be-43d5-b5a9-f957477cc093",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "bcqeroz0",
              "_$type": "Sprite3D",
              "name": "cloud_1_double(3)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 33.85897445678711,
                  "y": 14.71136474609375,
                  "z": -46.346130439606476
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "afa8042d-2703-4576-b3c2-6b4858e77801",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "6p1fuerk",
              "_$type": "Sprite3D",
              "name": "cloud_1(3)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 46.00273895263672,
                  "y": 3.670309543609619,
                  "z": -46.346130439606476
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "87f15524-bff7-4e35-86b9-5730e8dacc23",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "6fddvyw8",
              "_$type": "Sprite3D",
              "name": "cloud_small(4)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -43.92788608250579,
                  "y": 13.406152725219727,
                  "z": -46.34613037109375
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "68049995-daeb-43a9-aaba-0b00f88ce9d2",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "21b0ehbg",
              "_$type": "Sprite3D",
              "name": "cloud_quadrouple(4)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -19.019743992662043,
                  "y": 5,
                  "z": -35.34613037109375
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "28760d6d-04e6-453b-89b7-a77375994086",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "o9gt8qk5",
              "_$type": "Sprite3D",
              "name": "cloud_medium(4)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -32.647864415025325,
                  "y": 7.18193244934082,
                  "z": -61.73991394042969
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "86270537-e155-40f7-9ef8-73bc99236cd1",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "48hlf5h6",
              "_$type": "Sprite3D",
              "name": "cloud_large(4)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -32.647864415025325,
                  "y": 9.825505256652832,
                  "z": -38.320560455322266
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "dfe97ecc-d23a-4cef-9b24-7b84109817c7",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "eapuuhyw",
              "_$type": "Sprite3D",
              "name": "cloud_half(4)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -32.647864415025325,
                  "y": 3.670309543609619,
                  "z": -44.03084182739258
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "c035d830-979b-40e4-aeae-6b2ce57783ec",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "fkjzko0h",
              "_$type": "Sprite3D",
              "name": "cloud_3_double(4)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -25.218134953355403,
                  "y": 8.489861488342285,
                  "z": -46.34613037109375
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "aa099c07-9d02-439f-9c59-b35fcdb3a632",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "skyak7un",
              "_$type": "Sprite3D",
              "name": "cloud_3(4)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -32.647864415025325,
                  "y": 3.670309543609619,
                  "z": -43.36663055419922
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "707b5413-4f59-4ed9-89bc-7bb6d50fabb1",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "fyo9enrj",
              "_$type": "Sprite3D",
              "name": "cloud_2_double(4)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -32.647864415025325,
                  "y": 7.908720016479492,
                  "z": -57.20035934448242
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "52e1821f-ec12-4354-a156-e154df59c420",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "sm9r1hbf",
              "_$type": "Sprite3D",
              "name": "cloud_2(4)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -32.647864415025325,
                  "y": -3.157867193222046,
                  "z": -46.34613037109375
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "2cc723a3-76be-43d5-b5a9-f957477cc093",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "8j8a8tiv",
              "_$type": "Sprite3D",
              "name": "cloud_1_double(4)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -46.441714360093684,
                  "y": 14.71136474609375,
                  "z": -46.34613037109375
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "afa8042d-2703-4576-b3c2-6b4858e77801",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "ld0sih1m",
              "_$type": "Sprite3D",
              "name": "cloud_1(4)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -34.297949864244075,
                  "y": 3.670309543609619,
                  "z": -46.34613037109375
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "87f15524-bff7-4e35-86b9-5730e8dacc23",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "3kx2s9no",
              "_$type": "Sprite3D",
              "name": "cloud_small(5)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -43.927886962890625,
                  "y": 13.406152725219727,
                  "z": 68.31783098462597
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "68049995-daeb-43a9-aaba-0b00f88ce9d2",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "d4xzcrss",
              "_$type": "Sprite3D",
              "name": "cloud_quadrouple(5)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -19.019744873046875,
                  "y": 5,
                  "z": 79.31783098462597
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "28760d6d-04e6-453b-89b7-a77375994086",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "d0came86",
              "_$type": "Sprite3D",
              "name": "cloud_medium(5)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -32.647865295410156,
                  "y": 7.18193244934082,
                  "z": 52.92404741529003
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "86270537-e155-40f7-9ef8-73bc99236cd1",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "u1t9gvrm",
              "_$type": "Sprite3D",
              "name": "cloud_large(5)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -32.647865295410156,
                  "y": 9.825505256652832,
                  "z": 76.34340090039746
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "dfe97ecc-d23a-4cef-9b24-7b84109817c7",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "zwk3s6wd",
              "_$type": "Sprite3D",
              "name": "cloud_half(5)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -32.647865295410156,
                  "y": 3.670309543609619,
                  "z": 70.63311952832714
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "c035d830-979b-40e4-aeae-6b2ce57783ec",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "z29vz7yc",
              "_$type": "Sprite3D",
              "name": "cloud_3_double(5)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -25.218135833740234,
                  "y": 8.489861488342285,
                  "z": 68.31783098462597
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "aa099c07-9d02-439f-9c59-b35fcdb3a632",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "s312nh55",
              "_$type": "Sprite3D",
              "name": "cloud_3(5)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -32.647865295410156,
                  "y": 3.670309543609619,
                  "z": 71.2973308015205
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "707b5413-4f59-4ed9-89bc-7bb6d50fabb1",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "46xvn48l",
              "_$type": "Sprite3D",
              "name": "cloud_2_double(5)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -32.647865295410156,
                  "y": 7.908720016479492,
                  "z": 57.4636020112373
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "52e1821f-ec12-4354-a156-e154df59c420",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "ijn5bxib",
              "_$type": "Sprite3D",
              "name": "cloud_2(5)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -32.647865295410156,
                  "y": -3.157867193222046,
                  "z": 68.31783098462597
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "2cc723a3-76be-43d5-b5a9-f957477cc093",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "4gycqnux",
              "_$type": "Sprite3D",
              "name": "cloud_1_double(5)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -46.441715240478516,
                  "y": 14.71136474609375,
                  "z": 68.31783098462597
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "afa8042d-2703-4576-b3c2-6b4858e77801",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "v31j1zrb",
              "_$type": "Sprite3D",
              "name": "cloud_1(5)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": -34.297950744628906,
                  "y": 3.670309543609619,
                  "z": 68.31783098462597
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "87f15524-bff7-4e35-86b9-5730e8dacc23",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "du5z9h3l",
              "_$type": "Sprite3D",
              "name": "cloud_small(6)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 6.3848336884498025,
                  "y": 13.406152725219727,
                  "z": 39.757426546770006
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "68049995-daeb-43a9-aaba-0b00f88ce9d2",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "jhvuwfmf",
              "_$type": "Sprite3D",
              "name": "cloud_quadrouple(6)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 31.292975778293552,
                  "y": 5,
                  "z": 50.757426546770006
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "28760d6d-04e6-453b-89b7-a77375994086",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "0s7zz07f",
              "_$type": "Sprite3D",
              "name": "cloud_medium(6)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 17.66485535593027,
                  "y": 7.18193244934082,
                  "z": 24.363639162736803
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "86270537-e155-40f7-9ef8-73bc99236cd1",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "mqik7gm9",
              "_$type": "Sprite3D",
              "name": "cloud_large(6)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 17.66485535593027,
                  "y": 9.825505256652832,
                  "z": 47.782992647844225
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "dfe97ecc-d23a-4cef-9b24-7b84109817c7",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "1wk2wi55",
              "_$type": "Sprite3D",
              "name": "cloud_half(6)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 17.66485535593027,
                  "y": 3.670309543609619,
                  "z": 42.07271127577391
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "c035d830-979b-40e4-aeae-6b2ce57783ec",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "3haxo9c5",
              "_$type": "Sprite3D",
              "name": "cloud_3_double(6)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 25.094584817600193,
                  "y": 8.489861488342285,
                  "z": 39.757426546770006
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "aa099c07-9d02-439f-9c59-b35fcdb3a632",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "4ygovjkr",
              "_$type": "Sprite3D",
              "name": "cloud_3(6)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 17.66485535593027,
                  "y": 3.670309543609619,
                  "z": 42.73692636366454
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "707b5413-4f59-4ed9-89bc-7bb6d50fabb1",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "n4c2uyfw",
              "_$type": "Sprite3D",
              "name": "cloud_2_double(6)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 17.66485535593027,
                  "y": 7.908720016479492,
                  "z": 28.90319375868407
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "52e1821f-ec12-4354-a156-e154df59c420",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "s0eww8vn",
              "_$type": "Sprite3D",
              "name": "cloud_2(6)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 17.66485535593027,
                  "y": -3.157867193222046,
                  "z": 39.757426546770006
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "2cc723a3-76be-43d5-b5a9-f957477cc093",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "vktx7vrn",
              "_$type": "Sprite3D",
              "name": "cloud_1_double(6)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 3.871005410861912,
                  "y": 14.71136474609375,
                  "z": 39.757426546770006
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "afa8042d-2703-4576-b3c2-6b4858e77801",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "980ov5ce",
              "_$type": "Sprite3D",
              "name": "cloud_1(6)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 16.01476990671152,
                  "y": 3.670309543609619,
                  "z": 39.757426546770006
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "87f15524-bff7-4e35-86b9-5730e8dacc23",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "xwrwvvtn",
              "_$type": "Sprite3D",
              "name": "cloud_small(7)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 6.384833812713623,
                  "y": 13.406152725219727,
                  "z": -61.36174573353607
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "68049995-daeb-43a9-aaba-0b00f88ce9d2",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "2t6bvfbj",
              "_$type": "Sprite3D",
              "name": "cloud_quadrouple(7)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 31.29297637939453,
                  "y": 5,
                  "z": -50.36174573353607
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "28760d6d-04e6-453b-89b7-a77375994086",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "wjd3qbun",
              "_$type": "Sprite3D",
              "name": "cloud_medium(7)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 17.66485595703125,
                  "y": 7.18193244934082,
                  "z": -76.75553311756926
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "86270537-e155-40f7-9ef8-73bc99236cd1",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "jopxoew1",
              "_$type": "Sprite3D",
              "name": "cloud_large(7)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 17.66485595703125,
                  "y": 9.825505256652832,
                  "z": -53.33617963246185
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "dfe97ecc-d23a-4cef-9b24-7b84109817c7",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "3ut8qz4o",
              "_$type": "Sprite3D",
              "name": "cloud_half(7)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 17.66485595703125,
                  "y": 3.670309543609619,
                  "z": -59.04646100453216
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "c035d830-979b-40e4-aeae-6b2ce57783ec",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "w3sp5u1o",
              "_$type": "Sprite3D",
              "name": "cloud_3_double(7)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 25.094585418701172,
                  "y": 8.489861488342285,
                  "z": -61.36174573353607
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "aa099c07-9d02-439f-9c59-b35fcdb3a632",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "jt2ukcul",
              "_$type": "Sprite3D",
              "name": "cloud_3(7)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 17.66485595703125,
                  "y": 3.670309543609619,
                  "z": -58.38224591664154
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "707b5413-4f59-4ed9-89bc-7bb6d50fabb1",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "3hqg8dcu",
              "_$type": "Sprite3D",
              "name": "cloud_2_double(7)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 17.66485595703125,
                  "y": 7.908720016479492,
                  "z": -72.21597852162199
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "52e1821f-ec12-4354-a156-e154df59c420",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "kolh6yew",
              "_$type": "Sprite3D",
              "name": "cloud_2(7)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 17.66485595703125,
                  "y": -3.157867193222046,
                  "z": -61.36174573353607
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "2cc723a3-76be-43d5-b5a9-f957477cc093",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "0tgsqm0s",
              "_$type": "Sprite3D",
              "name": "cloud_1_double(7)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 3.8710052967071533,
                  "y": 14.71136474609375,
                  "z": -61.36174573353607
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "afa8042d-2703-4576-b3c2-6b4858e77801",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
                }
              ]
            },
            {
              "_$id": "877csswn",
              "_$type": "Sprite3D",
              "name": "cloud_1(7)",
              "transform": {
                "localPosition": {
                  "_$type": "Vector3",
                  "x": 16.0147705078125,
                  "y": 3.670309543609619,
                  "z": -61.36174573353607
                },
                "localRotation": {
                  "_$type": "Quaternion",
                  "w": -1
                }
              },
              "_$comp": [
                {
                  "_$type": "MeshFilter",
                  "sharedMesh": {
                    "_$uuid": "87f15524-bff7-4e35-86b9-5730e8dacc23",
                    "_$type": "Mesh"
                  }
                },
                {
                  "_$type": "MeshRenderer",
                  "receiveShadow": true,
                  "castShadow": true,
                  "sharedMaterials": [
                    {
                      "_$uuid": "0b6a4877-48af-485d-a5f0-c0941ec892d6",
                      "_$type": "Material"
                    }
                  ]
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