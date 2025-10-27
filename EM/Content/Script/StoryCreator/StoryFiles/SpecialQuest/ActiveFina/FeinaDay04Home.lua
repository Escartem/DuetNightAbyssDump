return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17544673213651",
      startPort = "StoryStart",
      endStory = "1754467334136130",
      endPort = "In"
    },
    {
      startStory = "1754467334136130",
      startPort = "Success",
      endStory = "17544673213665",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17544673213651"] = {
      isStoryNode = true,
      key = "17544673213651",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 300},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17544673213665"] = {
      isStoryNode = true,
      key = "17544673213665",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1884, y = 314},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1754467334136130"] = {
      isStoryNode = true,
      key = "1754467334136130",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1362, y = 320},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120114_1",
        QuestDeatil = "Content_120114_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = false,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1754467334136131",
            startPort = "QuestStart",
            endQuest = "17544674453322337",
            endPort = "In"
          },
          {
            startQuest = "1754467401528851",
            startPort = "Out",
            endQuest = "17555979217101232",
            endPort = "In"
          },
          {
            startQuest = "1754467334136131",
            startPort = "QuestStart",
            endQuest = "1754467401528851",
            endPort = "In"
          },
          {
            startQuest = "1754467334136131",
            startPort = "QuestStart",
            endQuest = "1754467401528850",
            endPort = "In"
          },
          {
            startQuest = "175758134336537142366",
            startPort = "Out",
            endQuest = "175758134336537142367",
            endPort = "In"
          },
          {
            startQuest = "175758134336437142364",
            startPort = "Out",
            endQuest = "175758134336537142368",
            endPort = "In"
          },
          {
            startQuest = "1754467334136131",
            startPort = "QuestStart",
            endQuest = "175758134336537142366",
            endPort = "In"
          },
          {
            startQuest = "1754467334136131",
            startPort = "QuestStart",
            endQuest = "175758134336437142364",
            endPort = "In"
          },
          {
            startQuest = "1754467334136131",
            startPort = "QuestStart",
            endQuest = "175758134336537142365",
            endPort = "In"
          },
          {
            startQuest = "175758135657837142801",
            startPort = "Out",
            endQuest = "175758135657837142802",
            endPort = "In"
          },
          {
            startQuest = "175758135657837142803",
            startPort = "Out",
            endQuest = "175758135657837142804",
            endPort = "In"
          },
          {
            startQuest = "175758135657837142802",
            startPort = "Out",
            endQuest = "175758135657837142805",
            endPort = "In"
          },
          {
            startQuest = "175758135657837142805",
            startPort = "Out",
            endQuest = "175758135657837142803",
            endPort = "In"
          },
          {
            startQuest = "17544674453322337",
            startPort = "Out",
            endQuest = "175758135657837142801",
            endPort = "In"
          },
          {
            startQuest = "175758135657837142804",
            startPort = "Out",
            endQuest = "1754467334137145",
            endPort = "Fail"
          },
          {
            startQuest = "175758137483537143416",
            startPort = "Out",
            endQuest = "175758137483537143417",
            endPort = "In"
          },
          {
            startQuest = "175758137483537143418",
            startPort = "Out",
            endQuest = "175758137483537143414",
            endPort = "Input_2"
          },
          {
            startQuest = "175758137483537143415",
            startPort = "Out",
            endQuest = "175758137483537143414",
            endPort = "Input_3"
          },
          {
            startQuest = "175758137483537143417",
            startPort = "Out",
            endQuest = "175758137483537143414",
            endPort = "Input_1"
          },
          {
            startQuest = "17555979217101232",
            startPort = "Out",
            endQuest = "175758137483537143416",
            endPort = "In"
          },
          {
            startQuest = "17555979217101232",
            startPort = "Out",
            endQuest = "175758137483537143418",
            endPort = "In"
          },
          {
            startQuest = "175758137483537143414",
            startPort = "Out",
            endQuest = "175448426033216703384",
            endPort = "In"
          },
          {
            startQuest = "17555979217101232",
            startPort = "Out",
            endQuest = "175758137483537143415",
            endPort = "In"
          }
        },
        nodeData = {
          ["1754467334136131"] = {
            key = "1754467334136131",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 902, y = 382},
            propsData = {ModeType = 0}
          },
          ["1754467334136138"] = {
            key = "1754467334136138",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3202, y = 556},
            propsData = {ModeType = 0}
          },
          ["1754467334137145"] = {
            key = "1754467334137145",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2307.9019607843134, y = 1657.5686274509803},
            propsData = {}
          },
          ["1754467401528850"] = {
            key = "1754467401528850",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1483.899952300234, y = 175.86842105263148},
            propsData = {
              NewDescription = "Description_120114_1",
              NewDetail = "Content_120114_1",
              SubTaskTargetIndex = 0
            }
          },
          ["1754467401528851"] = {
            key = "1754467401528851",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1491.7847845732244, y = 378.01724262579506},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230068}
            }
          },
          ["17544674453322337"] = {
            key = "17544674453322337",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1361.9408070644524, y = 838.7808815816945},
            propsData = {}
          },
          ["175448426033216703384"] = {
            key = "175448426033216703384",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 3010.5966386554624, y = 388.1680672268908},
            propsData = {}
          },
          ["17555979217101232"] = {
            key = "17555979217101232",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1760.7142857142858, y = 366.2857142857143},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11033,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_Feina01BackHome",
              IsUseCount = false
            }
          },
          ["175758134336437142364"] = {
            key = "175758134336437142364",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = 1377.055679894319, y = -285.7696628445675},
            propsData = {QuestRoleId = 10301002, IsPlayFX = false}
          },
          ["175758134336537142365"] = {
            key = "175758134336537142365",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 1393.8240588010617, y = -123.42848535348125},
            propsData = {
              PlayerId = 0,
              bActiveEnable = false,
              ActiveType = "Lock",
              SkillNameList = {
                "Skill1",
                "Fire",
                "Skill2",
                "Skill3"
              }
            }
          },
          ["175758134336537142366"] = {
            key = "175758134336537142366",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1372.251588646155, y = -452.5715146465187},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["175758134336537142367"] = {
            key = "175758134336537142367",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1648.3840032235441, y = -448.4492024091129},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["175758134336537142368"] = {
            key = "175758134336537142368",
            type = "CameraControlNode",
            name = "\233\149\156\229\164\180\230\142\167\229\136\182\232\138\130\231\130\185",
            pos = {x = 1671.748411353845, y = -294.649881270366},
            propsData = {
              Duration = 4,
              CameraName = "StoryEast01Nai01",
              LockRotate = false,
              FocalLength = 0,
              LensAperture = 0,
              FOV = 80,
              PPMaterialPath = ""
            }
          },
          ["175758135657837142801"] = {
            key = "175758135657837142801",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 1690.333668901992, y = 1101.7373053328756},
            propsData = {}
          },
          ["175758135657837142802"] = {
            key = "175758135657837142802",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 1930.3064920025245, y = 1162.3699112460547},
            propsData = {Duration = 3}
          },
          ["175758135657837142803"] = {
            key = "175758135657837142803",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1697.0910848424935, y = 1415.0560941689598},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["175758135657837142804"] = {
            key = "175758135657837142804",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1941.6663310980084, y = 1487.5960280004576},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["175758135657837142805"] = {
            key = "175758135657837142805",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 1827, y = 1283.1666666666667},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Lock",
              SkillNameList = {
                "Skill1",
                "Fire",
                "Skill2",
                "Skill3"
              }
            }
          },
          ["175758137483537143414"] = {
            key = "175758137483537143414",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2665.5256190679684, y = 347.1231606380091},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          },
          ["175758137483537143415"] = {
            key = "175758137483537143415",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 2183.348330189625, y = 528.0262485096484},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Lock",
              SkillNameList = {
                "Skill1",
                "Fire",
                "Skill2",
                "Skill3"
              }
            }
          },
          ["175758137483537143416"] = {
            key = "175758137483537143416",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 2081.5836246295103, y = 226.91122952661098},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["175758137483537143417"] = {
            key = "175758137483537143417",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 2371.594770769454, y = 226.2594657760658},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["175758137483537143418"] = {
            key = "175758137483537143418",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 2187.816334118612, y = 392.67639196718625},
            propsData = {Duration = 3}
          }
        },
        commentData = {
          ["175758135042637142680"] = {
            key = "175758135042637142680",
            name = "Input Commment...",
            position = {x = 1320, y = -534},
            size = {width = 628, height = 596}
          },
          ["175758136416237143102"] = {
            key = "175758136416237143102",
            name = "Input Commment...",
            position = {x = 1622.3333333333333, y = 1013.6666666666666},
            size = {width = 591.6666666666667, height = 616.6666666666667}
          },
          ["175758138003437143627"] = {
            key = "175758138003437143627",
            name = "Input Commment...",
            position = {x = 2032.5546218487393, y = 134.14285714285705},
            size = {width = 874, height = 542}
          }
        }
      }
    }
  },
  commentData = {}
}
