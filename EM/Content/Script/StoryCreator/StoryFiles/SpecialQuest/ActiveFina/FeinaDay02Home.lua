return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17543838109141",
      startPort = "StoryStart",
      endStory = "1754383820859255",
      endPort = "In"
    },
    {
      startStory = "1754383820859255",
      startPort = "Success",
      endStory = "17543838109145",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17543838109141"] = {
      isStoryNode = true,
      key = "17543838109141",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1111.6666666666667, y = 428.33333333333337},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17543838109145"] = {
      isStoryNode = true,
      key = "17543838109145",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1778.6666666666665, y = 456.6666666666667},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1754383820859255"] = {
      isStoryNode = true,
      key = "1754383820859255",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1459, y = 443.33333333333337},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "",
        QuestDeatil = "",
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
            startQuest = "1754383820859256",
            startPort = "QuestStart",
            endQuest = "17543919578661000",
            endPort = "In"
          },
          {
            startQuest = "17545500582601343429",
            startPort = "Out",
            endQuest = "17545500533551343304",
            endPort = "In"
          },
          {
            startQuest = "1754383820859256",
            startPort = "QuestStart",
            endQuest = "17545500582601343429",
            endPort = "In"
          },
          {
            startQuest = "1754383820859256",
            startPort = "QuestStart",
            endQuest = "17554399778927014433",
            endPort = "In"
          },
          {
            startQuest = "17575782409231142",
            startPort = "Out",
            endQuest = "17575782409231143",
            endPort = "In"
          },
          {
            startQuest = "17575782409231140",
            startPort = "Out",
            endQuest = "17575782409231144",
            endPort = "In"
          },
          {
            startQuest = "1754383820859256",
            startPort = "QuestStart",
            endQuest = "17575782409231141",
            endPort = "In"
          },
          {
            startQuest = "1754383820859256",
            startPort = "QuestStart",
            endQuest = "17575782409231140",
            endPort = "In"
          },
          {
            startQuest = "1754383820859256",
            startPort = "QuestStart",
            endQuest = "17575782409231142",
            endPort = "In"
          },
          {
            startQuest = "17575782694742056",
            startPort = "Out",
            endQuest = "17575782694742057",
            endPort = "In"
          },
          {
            startQuest = "17575782694742058",
            startPort = "Out",
            endQuest = "17575782694742059",
            endPort = "In"
          },
          {
            startQuest = "17575782694742057",
            startPort = "Out",
            endQuest = "17575782694742060",
            endPort = "In"
          },
          {
            startQuest = "17575782694742060",
            startPort = "Out",
            endQuest = "17575782694742058",
            endPort = "In"
          },
          {
            startQuest = "17543919578661000",
            startPort = "Out",
            endQuest = "17575782694742056",
            endPort = "In"
          },
          {
            startQuest = "17575782694742059",
            startPort = "Out",
            endQuest = "1754383820859270",
            endPort = "Fail"
          },
          {
            startQuest = "17575782938662914",
            startPort = "Out",
            endQuest = "17575782938662915",
            endPort = "In"
          },
          {
            startQuest = "17575782938662916",
            startPort = "Out",
            endQuest = "17575782938662912",
            endPort = "Input_2"
          },
          {
            startQuest = "17575782938662913",
            startPort = "Out",
            endQuest = "17575782938662912",
            endPort = "Input_3"
          },
          {
            startQuest = "17575782938662915",
            startPort = "Out",
            endQuest = "17575782938662912",
            endPort = "Input_1"
          },
          {
            startQuest = "17575782938662912",
            startPort = "Out",
            endQuest = "17543920467772182",
            endPort = "In"
          },
          {
            startQuest = "17545500533551343304",
            startPort = "Out",
            endQuest = "17575782938662914",
            endPort = "In"
          },
          {
            startQuest = "17545500533551343304",
            startPort = "Out",
            endQuest = "17575782938662916",
            endPort = "In"
          },
          {
            startQuest = "17545500533551343304",
            startPort = "Out",
            endQuest = "17575782938662913",
            endPort = "In"
          }
        },
        nodeData = {
          ["1754383820859256"] = {
            key = "1754383820859256",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1754383820859263"] = {
            key = "1754383820859263",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3143.125, y = -41.25},
            propsData = {ModeType = 0}
          },
          ["1754383820859270"] = {
            key = "1754383820859270",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2515.326086956522, y = 1108.8478260869565},
            propsData = {}
          },
          ["17543919578661000"] = {
            key = "17543919578661000",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1326, y = 920},
            propsData = {}
          },
          ["17543920467772182"] = {
            key = "17543920467772182",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 3075.4860248447208, y = 267.65916149068323},
            propsData = {}
          },
          ["17545500533551343304"] = {
            key = "17545500533551343304",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1783.8140996673264, y = 298.9070558429321},
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
          ["17545500582601343429"] = {
            key = "17545500582601343429",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1454.9117685887943, y = 298.1979340319125},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230068}
            }
          },
          ["17554399778927014433"] = {
            key = "17554399778927014433",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1451.7593644745348, y = 133.53036437246965},
            propsData = {
              NewDescription = "Description_120112_1",
              NewDetail = "Content_120112_1",
              SubTaskTargetIndex = 0
            }
          },
          ["17575782409231140"] = {
            key = "17575782409231140",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = 1223.8801449029947, y = -247.70395842514785},
            propsData = {QuestRoleId = 10301002, IsPlayFX = false}
          },
          ["17575782409231141"] = {
            key = "17575782409231141",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 1218.247208020264, y = -90.09962303932474},
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
          ["17575782409231142"] = {
            key = "17575782409231142",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1219.0760536548307, y = -414.50581022709906},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["17575782409231143"] = {
            key = "17575782409231143",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1492.0505734953779, y = -421.4361295686406},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["17575782409231144"] = {
            key = "17575782409231144",
            type = "CameraControlNode",
            name = "\233\149\156\229\164\180\230\142\167\229\136\182\232\138\130\231\130\185",
            pos = {x = 1494.888665836205, y = -255.0052294825253},
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
          ["17575782694742056"] = {
            key = "17575782694742056",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 1636.2107654896151, y = 997.5573957172076},
            propsData = {}
          },
          ["17575782694742057"] = {
            key = "17575782694742057",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 1895.1309570112005, y = 1048.7163174198604},
            propsData = {Duration = 3}
          },
          ["17575782694742058"] = {
            key = "17575782694742058",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1657.1787077459062, y = 1326.6656582375022},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575782694742059"] = {
            key = "17575782694742059",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1919.1223750540523, y = 1381.8371710163685},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575782694742060"] = {
            key = "17575782694742060",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 1752.3507807981498, y = 1180.5657044194197},
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
          ["17575782938662912"] = {
            key = "17575782938662912",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2767.6901990700103, y = 230.16442896720315},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          },
          ["17575782938662913"] = {
            key = "17575782938662913",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 2285.512910191667, y = 409.06751683884244},
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
          ["17575782938662914"] = {
            key = "17575782938662914",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 2177.748204631552, y = 95.95249785580506},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575782938662915"] = {
            key = "17575782938662915",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 2457.759350771496, y = 93.30073410525989},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575782938662916"] = {
            key = "17575782938662916",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 2289.980914120654, y = 275.7176602963803},
            propsData = {Duration = 3}
          }
        },
        commentData = {
          ["17575782428741228"] = {
            key = "17575782428741228",
            name = "Input Commment...",
            position = {x = 1145.1402544823598, y = -518.3553482121592},
            size = {width = 631.5789473684213, height = 595.2631578947369}
          },
          ["17575782768732373"] = {
            key = "17575782768732373",
            name = "Input Commment...",
            position = {x = 1608.8244650086758, y = 893.0130728404722},
            size = {width = 554, height = 656}
          },
          ["17575783014303229"] = {
            key = "17575783014303229",
            name = "Input Commment...",
            position = {x = 2145.2192018507812, y = -7.565874527948836},
            size = {width = 853.125, height = 592.5}
          }
        }
      }
    }
  },
  commentData = {}
}
