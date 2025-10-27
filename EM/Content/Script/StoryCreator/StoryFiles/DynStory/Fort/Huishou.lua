return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17286289262831",
      startPort = "StoryStart",
      endStory = "1728628947589109",
      endPort = "In"
    },
    {
      startStory = "1728628947589109",
      startPort = "Success",
      endStory = "17286289262835",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17286289262831"] = {
      isStoryNode = true,
      key = "17286289262831",
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
    ["17286289262835"] = {
      isStoryNode = true,
      key = "17286289262835",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1418.8571428571427, y = 302.4571428571428},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1728628947589109"] = {
      isStoryNode = true,
      key = "1728628947589109",
      type = "StoryNode",
      name = "\230\184\133\230\137\171\231\167\189\229\133\189",
      pos = {x = 1093.0857142857144, y = 290.8},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_FortHuishou_Des",
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
        bIsDynamicEvent = true,
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
            startQuest = "1728628947589110",
            startPort = "QuestStart",
            endQuest = "1728628970815830",
            endPort = "In"
          },
          {
            startQuest = "1728628947589110",
            startPort = "QuestStart",
            endQuest = "17286297874323712",
            endPort = "In"
          },
          {
            startQuest = "17286297874323712",
            startPort = "Out",
            endQuest = "17286298367134968",
            endPort = "In"
          },
          {
            startQuest = "17286298367134968",
            startPort = "Out",
            endQuest = "17286298027114097",
            endPort = "In"
          },
          {
            startQuest = "17286298027114097",
            startPort = "Out",
            endQuest = "17286298481355324",
            endPort = "In"
          },
          {
            startQuest = "17286298138074383",
            startPort = "Out",
            endQuest = "17286298672156060",
            endPort = "In"
          },
          {
            startQuest = "17286299712407558",
            startPort = "Out",
            endQuest = "17286299712407559",
            endPort = "In"
          },
          {
            startQuest = "17286298481355324",
            startPort = "Out",
            endQuest = "17286299712407558",
            endPort = "In"
          },
          {
            startQuest = "17286298138074383",
            startPort = "Out",
            endQuest = "17286300497369245",
            endPort = "In"
          },
          {
            startQuest = "172863009082610097",
            startPort = "Out",
            endQuest = "1728628947590117",
            endPort = "Success"
          },
          {
            startQuest = "17286298367134968",
            startPort = "Out",
            endQuest = "1730168100749866",
            endPort = "In"
          },
          {
            startQuest = "17286299712407559",
            startPort = "Out",
            endQuest = "1730168100749866",
            endPort = "Stop"
          },
          {
            startQuest = "1730168100749866",
            startPort = "TimerRange_2",
            endQuest = "17286298138074383",
            endPort = "In"
          },
          {
            startQuest = "17301682153821991",
            startPort = "Out",
            endQuest = "17301682153821992",
            endPort = "In"
          },
          {
            startQuest = "1730168100749866",
            startPort = "TimerRange_1",
            endQuest = "17301682153821991",
            endPort = "In"
          },
          {
            startQuest = "17286298481355324",
            startPort = "Out",
            endQuest = "17286298285194759",
            endPort = "In"
          },
          {
            startQuest = "17301682153821992",
            startPort = "Out",
            endQuest = "1728628947590117",
            endPort = "Success"
          },
          {
            startQuest = "17286298672156060",
            startPort = "Out",
            endQuest = "17326187740119477",
            endPort = "In"
          },
          {
            startQuest = "17326187740119477",
            startPort = "Out",
            endQuest = "172863009082610097",
            endPort = "In"
          }
        },
        nodeData = {
          ["1728628947589110"] = {
            key = "1728628947589110",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1728628947590117"] = {
            key = "1728628947590117",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4271.200000000001, y = 253.20000000000005},
            propsData = {ModeType = 0}
          },
          ["1728628947590124"] = {
            key = "1728628947590124",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3100, y = 697.6},
            propsData = {}
          },
          ["1728628970815830"] = {
            key = "1728628970815830",
            type = "TalkNode",
            name = "\228\187\187\229\138\161\229\188\128\232\189\166",
            pos = {x = 1121.242857142857, y = 96.75714285714282},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003001,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17286297874323712"] = {
            key = "17286297874323712",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\172\172\228\184\128\230\179\162\230\184\184\232\141\161\231\167\189\229\133\189",
            pos = {x = 1145.2428571428566, y = 292.3571428571427},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1650307,
                1650303,
                1650304,
                1650305
              }
            }
          },
          ["17286298027114097"] = {
            key = "17286298027114097",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\172\172\228\186\140\230\179\162\231\167\189\229\133\189",
            pos = {x = 1717.2428571428568, y = 286.35714285714283},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1650296,
                1650297,
                1650298,
                1650299,
                1650300
              }
            }
          },
          ["17286298138074383"] = {
            key = "17286298138074383",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\142\134\230\136\152\232\128\133",
            pos = {x = 3008.442857142857, y = 287.5571428571428},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1650312}
            }
          },
          ["17286298285194759"] = {
            key = "17286298285194759",
            type = "TalkNode",
            name = "\229\135\187\230\157\128\231\172\172\228\184\128\230\179\162\229\188\128\232\189\166",
            pos = {x = 2358.042857142857, y = 85.65714285714273},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003002,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17286298367134968"] = {
            key = "17286298367134968",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\231\172\172\228\184\128\230\179\162\231\167\189\229\133\189",
            pos = {x = 1423.642857142857, y = 285.1571428571427},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1650307,
                1650303,
                1650304,
                1650305
              }
            }
          },
          ["17286298481355324"] = {
            key = "17286298481355324",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\231\172\172\228\186\140\230\179\162\231\167\189\229\133\189",
            pos = {x = 2019.6428571428569, y = 288.75714285714264},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 5,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1650296,
                1650297,
                1650298,
                1650299,
                1650300
              }
            }
          },
          ["17286298672156060"] = {
            key = "17286298672156060",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\229\142\134\230\136\152\232\128\133",
            pos = {x = 3356.442857142857, y = 289.9571428571425},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 1,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {1650312}
            }
          },
          ["17286299712407558"] = {
            key = "17286299712407558",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\172\172\228\184\137\230\179\162\231\167\189\229\133\189",
            pos = {x = 2333.4428571428575, y = 278.5571428571427},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1650308,
                1650309,
                1650310,
                1650311
              }
            }
          },
          ["17286299712407559"] = {
            key = "17286299712407559",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\231\172\172\228\184\137\230\179\162\231\167\189\229\133\189",
            pos = {x = 2635.8428571428576, y = 295.35714285714255},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1650308,
                1650309,
                1650310,
                1650311
              }
            }
          },
          ["17286300497369245"] = {
            key = "17286300497369245",
            type = "TalkNode",
            name = "\229\142\134\230\136\152\232\128\133\229\135\186\231\142\176\229\188\128\232\189\166",
            pos = {x = 3310.8428571428576, y = -34.0428571428575},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003003,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["172863009082610097"] = {
            key = "172863009082610097",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3912.0142857142855, y = 279.58571428571406},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1730168100749866"] = {
            key = "1730168100749866",
            type = "TimerBranchNode",
            name = "\232\174\161\230\151\182\229\153\168",
            pos = {x = 2804.495652173913, y = -93.40000000000009},
            propsData = {
              TimerRange = {
                {StartTime = 0, EndTime = 15},
                {StartTime = 15, EndTime = -1}
              }
            }
          },
          ["17301682153821991"] = {
            key = "17301682153821991",
            type = "TalkNode",
            name = "\229\174\140\230\136\144\228\187\187\229\138\161\229\188\128\232\189\166",
            pos = {x = 3101.4, y = -287.60000000000014},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71003004,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17301682153821992"] = {
            key = "17301682153821992",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3422.2, y = -284.20000000000005},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17326187740119477"] = {
            key = "17326187740119477",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 3646.4405004225387, y = 281.31994171605123},
            propsData = {WaitTime = 5}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
