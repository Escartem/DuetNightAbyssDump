return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17540181440782579795",
      startPort = "StoryStart",
      endStory = "17540181440782579797",
      endPort = "In"
    },
    {
      startStory = "17540181440782579797",
      startPort = "Success",
      endStory = "17540181440782579796",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17540181440782579795"] = {
      isStoryNode = true,
      key = "17540181440782579795",
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
    ["17540181440782579796"] = {
      isStoryNode = true,
      key = "17540181440782579796",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1561.578947368421, y = 314.63157894736844},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17540181440782579797"] = {
      isStoryNode = true,
      key = "17540181440782579797",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1162.3157894736842, y = 295.6842105263157},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120111_2",
        QuestDeatil = "Content_120111_2",
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
            startQuest = "17540181440782579798",
            startPort = "QuestStart",
            endQuest = "17540181440782579808",
            endPort = "In"
          },
          {
            startQuest = "17540181440782579798",
            startPort = "QuestStart",
            endQuest = "17540181440782579811",
            endPort = "In"
          },
          {
            startQuest = "17540181440782579798",
            startPort = "QuestStart",
            endQuest = "17540181440782579810",
            endPort = "In"
          },
          {
            startQuest = "1757571519045459",
            startPort = "Out",
            endQuest = "1757571519045460",
            endPort = "In"
          },
          {
            startQuest = "1757571519045456",
            startPort = "Out",
            endQuest = "1757571519045461",
            endPort = "In"
          },
          {
            startQuest = "17540181440782579798",
            startPort = "QuestStart",
            endQuest = "1757571519045456",
            endPort = "In"
          },
          {
            startQuest = "17540181440782579798",
            startPort = "QuestStart",
            endQuest = "1757571519045459",
            endPort = "In"
          },
          {
            startQuest = "17575715990043026",
            startPort = "Out",
            endQuest = "17575715990043027",
            endPort = "In"
          },
          {
            startQuest = "17575715990043029",
            startPort = "Out",
            endQuest = "17575715990043026",
            endPort = "In"
          },
          {
            startQuest = "17575715990043027",
            startPort = "Out",
            endQuest = "17540181440782579800",
            endPort = "Fail"
          },
          {
            startQuest = "17540181440782579808",
            startPort = "Out",
            endQuest = "17575715990043024",
            endPort = "In"
          },
          {
            startQuest = "17575715990043024",
            startPort = "Out",
            endQuest = "17575715990043025",
            endPort = "In"
          },
          {
            startQuest = "17540181440782579798",
            startPort = "QuestStart",
            endQuest = "1757571519045458",
            endPort = "In"
          },
          {
            startQuest = "17575715990043025",
            startPort = "Out",
            endQuest = "17575715990043029",
            endPort = "In"
          },
          {
            startQuest = "1757577041365405",
            startPort = "Out",
            endQuest = "1757577041365406",
            endPort = "In"
          },
          {
            startQuest = "1757577041365407",
            startPort = "Out",
            endQuest = "1757577041365403",
            endPort = "Input_2"
          },
          {
            startQuest = "1757577041365404",
            startPort = "Out",
            endQuest = "1757577041365403",
            endPort = "Input_3"
          },
          {
            startQuest = "1757577041365406",
            startPort = "Out",
            endQuest = "1757577041365403",
            endPort = "Input_1"
          },
          {
            startQuest = "17540181440782579810",
            startPort = "Out",
            endQuest = "1757577041365405",
            endPort = "In"
          },
          {
            startQuest = "17540181440782579810",
            startPort = "Out",
            endQuest = "1757577041365407",
            endPort = "In"
          },
          {
            startQuest = "17540181440782579810",
            startPort = "Out",
            endQuest = "1757577041365404",
            endPort = "In"
          },
          {
            startQuest = "1757577041365403",
            startPort = "Out",
            endQuest = "17540181440782579806",
            endPort = "In"
          }
        },
        nodeData = {
          ["17540181440782579798"] = {
            key = "17540181440782579798",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 448.5874125874126, y = 94.23776223776224},
            propsData = {ModeType = 0}
          },
          ["17540181440782579799"] = {
            key = "17540181440782579799",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3797.0262632104736, y = 602.1078658183922},
            propsData = {ModeType = 0}
          },
          ["17540181440782579800"] = {
            key = "17540181440782579800",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1877.2074420677366, y = 958.7543608352436},
            propsData = {}
          },
          ["17540181440782579806"] = {
            key = "17540181440782579806",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 2641.4900589606473, y = 26.616540322422846},
            propsData = {}
          },
          ["17540181440782579808"] = {
            key = "17540181440782579808",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 922.4313603063606, y = 277.4488428238427},
            propsData = {}
          },
          ["17540181440782579810"] = {
            key = "17540181440782579810",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 930.3094009447726, y = 84.79450883560251},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191726,
              GuideType = "P",
              GuidePointName = "QuestPoint_Feina01Catch01"
            }
          },
          ["17540181440782579811"] = {
            key = "17540181440782579811",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\143\230\156\139\229\143\139",
            pos = {x = 928.7264049933561, y = -60.82392536177896},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1191497,
                1191495,
                1191494
              }
            }
          },
          ["1757571519045456"] = {
            key = "1757571519045456",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = 906.1396292846503, y = -635.5937526010388},
            propsData = {QuestRoleId = 10301002, IsPlayFX = false}
          },
          ["1757571519045458"] = {
            key = "1757571519045458",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 965.6144561551935, y = -291.2648569457639},
            propsData = {
              PlayerId = 0,
              bActiveEnable = false,
              ActiveType = "Lock",
              SkillNameList = {
                "Avoid",
                "Skill1",
                "BulletJump",
                "Fire",
                "Slide",
                "Skill2",
                "Skill3"
              }
            }
          },
          ["1757571519045459"] = {
            key = "1757571519045459",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 905.8733531625365, y = -950.504848100469},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["1757571519045460"] = {
            key = "1757571519045460",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1184.893468274685, y = -959.8584716919406},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["1757571519045461"] = {
            key = "1757571519045461",
            type = "CameraControlNode",
            name = "\233\149\156\229\164\180\230\142\167\229\136\182\232\138\130\231\130\185",
            pos = {x = 1172.3292094836718, y = -627.4571643041484},
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
          ["17575715990043024"] = {
            key = "17575715990043024",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 1250.3786940613575, y = 474.9706611153796},
            propsData = {}
          },
          ["17575715990043025"] = {
            key = "17575715990043025",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 1493.5538981142709, y = 506.8889813142729},
            propsData = {Duration = 3}
          },
          ["17575715990043026"] = {
            key = "17575715990043026",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1256.154508270257, y = 770.355467267481},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575715990043027"] = {
            key = "17575715990043027",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1513.105295651313, y = 859.9314655247493},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17575715990043029"] = {
            key = "17575715990043029",
            type = "ActivePlayerSkillsNode",
            name = "\232\191\152\229\142\159\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 1272.7762937353864, y = 616.0383947721332},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Lock",
              SkillNameList = {
                "Avoid",
                "Skill1",
                "BulletJump",
                "Fire",
                "Slide",
                "Skill2",
                "Skill3"
              }
            }
          },
          ["1757577041365403"] = {
            key = "1757577041365403",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2289.292425790658, y = -20.847458079368657},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          },
          ["1757577041365404"] = {
            key = "1757577041365404",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136\232\191\144\229\138\168\232\131\189\229\138\155/\229\176\143\230\138\128\232\131\189/\230\148\187\229\135\187",
            pos = {x = 1744.615136912314, y = 193.84510347648114},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Lock",
              SkillNameList = {
                "Avoid",
                "Skill1",
                "BulletJump",
                "Fire",
                "Slide",
                "Skill2",
                "Skill3"
              }
            }
          },
          ["1757577041365405"] = {
            key = "1757577041365405",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1742.2790027807707, y = -122.27367490505246},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["1757577041365406"] = {
            key = "1757577041365406",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 2022.3615774921432, y = -120.49686722702619},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["1757577041365407"] = {
            key = "1757577041365407",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 1744.82374234506, y = 40.34863039266564},
            propsData = {Duration = 3}
          }
        },
        commentData = {
          ["1757571524378705"] = {
            key = "1757571524378705",
            name = "\233\148\129\233\151\173UI",
            position = {x = 859.7450980392157, y = -1076.5662686127087},
            size = {width = 568.823529411765, height = 305.16071428571433}
          },
          ["1757571526507799"] = {
            key = "1757571526507799",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178/\233\149\156\229\164\180",
            position = {x = 849.6610644257705, y = -744.0452602093471},
            size = {width = 598.3193277310925, height = 300.87499999999983}
          },
          ["1757571528084872"] = {
            key = "1757571528084872",
            name = "\232\167\146\232\137\178\232\131\189\229\138\155\233\148\129\233\151\173",
            position = {x = 859.2408963585433, y = -432.9528232345573},
            size = {width = 613.4453781512609, height = 310.95903361344523}
          },
          ["17575716110203572"] = {
            key = "17575716110203572",
            name = "Input Commment...",
            position = {x = 1177.129901960785, y = 392.2782692024174},
            size = {width = 624.375, height = 641.25}
          },
          ["17575770729071539"] = {
            key = "17575770729071539",
            name = "Input Commment...",
            position = {x = 1682.2447110423116, y = -196.38898717381676},
            size = {width = 889.2857142857142, height = 548.5714285714286}
          }
        }
      }
    }
  },
  commentData = {}
}
