return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17284620076091",
      startPort = "StoryStart",
      endStory = "1728462024673166",
      endPort = "In"
    },
    {
      startStory = "1728462024673166",
      startPort = "Success",
      endStory = "17284620076095",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17284620076091"] = {
      isStoryNode = true,
      key = "17284620076091",
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
    ["17284620076095"] = {
      isStoryNode = true,
      key = "17284620076095",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1536.842105263158, y = 293.6842105263158},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1728462024673166"] = {
      isStoryNode = true,
      key = "1728462024673166",
      type = "StoryNode",
      name = "\230\150\169\233\166\150\232\161\140\229\138\168",
      pos = {x = 1164.092307692308, y = 289.43076923076916},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_FortDecapitate_Des",
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
            startQuest = "1728462024673167",
            startPort = "QuestStart",
            endQuest = "17284621216741252",
            endPort = "In"
          },
          {
            startQuest = "1728462024673167",
            startPort = "QuestStart",
            endQuest = "17284621083081025",
            endPort = "In"
          },
          {
            startQuest = "17284621216741252",
            startPort = "Out",
            endQuest = "17284621901972129",
            endPort = "In"
          },
          {
            startQuest = "17284622778663330",
            startPort = "Out",
            endQuest = "1728462024673174",
            endPort = "Success"
          },
          {
            startQuest = "17284621216741252",
            startPort = "Out",
            endQuest = "1728551156046975",
            endPort = "In"
          },
          {
            startQuest = "17284621901972129",
            startPort = "Out",
            endQuest = "17285552073083289",
            endPort = "In"
          },
          {
            startQuest = "17286269756261154",
            startPort = "Out",
            endQuest = "17286270121832390",
            endPort = "In"
          },
          {
            startQuest = "17284621216741252",
            startPort = "Out",
            endQuest = "1731230506055627204",
            endPort = "In"
          },
          {
            startQuest = "17285552073083289",
            startPort = "Out",
            endQuest = "1731230506055627204",
            endPort = "Stop"
          },
          {
            startQuest = "1731230506055627204",
            startPort = "TimerRange_2",
            endQuest = "17286269756261154",
            endPort = "In"
          },
          {
            startQuest = "17286270121832390",
            startPort = "Out",
            endQuest = "17284622778663330",
            endPort = "In"
          },
          {
            startQuest = "1731230506055627204",
            startPort = "TimerRange_2",
            endQuest = "1731230657043629799",
            endPort = "In"
          },
          {
            startQuest = "1731230691020630354",
            startPort = "Out",
            endQuest = "1728462024673174",
            endPort = "Success"
          },
          {
            startQuest = "1731230506055627204",
            startPort = "TimerRange_1",
            endQuest = "1731230717892630959",
            endPort = "In"
          },
          {
            startQuest = "1731230717892630959",
            startPort = "Out",
            endQuest = "1731230691020630354",
            endPort = "In"
          }
        },
        nodeData = {
          ["1728462024673167"] = {
            key = "1728462024673167",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1728462024673174"] = {
            key = "1728462024673174",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3667.057603686636, y = 257.60599078341016},
            propsData = {ModeType = 0}
          },
          ["1728462024673181"] = {
            key = "1728462024673181",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17284621083081025"] = {
            key = "17284621083081025",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1120.0531207790855, y = 111.22679132731759},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71002901,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17284621216741252"] = {
            key = "17284621216741252",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\149\140\228\186\186\233\149\191\229\174\152",
            pos = {x = 1122.9563465855372, y = 300.339694553124},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1640313}
            }
          },
          ["17284621901972129"] = {
            key = "17284621901972129",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\233\149\191\229\174\152",
            pos = {x = 1542.6418304565054, y = 488.55743648860783},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 1,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {1640313}
            }
          },
          ["17284622778663330"] = {
            key = "17284622778663330",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3150.1429825302384, y = 329.54245953008257},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1728551156046975"] = {
            key = "1728551156046975",
            type = "SendMessageNode",
            name = "\229\136\183\229\135\186\229\163\171\229\133\181\230\149\140\228\186\186",
            pos = {x = 1545.0748438755572, y = 840.4458081963802},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "DynDecapitateStart",
              UnitId = -1
            }
          },
          ["17285552073083289"] = {
            key = "17285552073083289",
            type = "SendMessageNode",
            name = "\229\135\187\230\157\128\229\174\140\230\136\144\233\149\191\229\174\152",
            pos = {x = 1885.2534153041288, y = 497.2886653392372},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "DynDecapitateEnd",
              UnitId = -1
            }
          },
          ["17286269756261154"] = {
            key = "17286269756261154",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\174\139\228\189\153\229\163\171\229\133\181",
            pos = {x = 2449.9909663865556, y = 325.6182185777535},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1640315,
                1640316,
                1640317,
                1640318
              }
            }
          },
          ["17286270121832390"] = {
            key = "17286270121832390",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\174\139\228\189\153\229\163\171\229\133\181",
            pos = {x = 2785.419537815127, y = 328.61821857775345},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1640315,
                1640316,
                1640317,
                1640318
              }
            }
          },
          ["1731230506055627204"] = {
            key = "1731230506055627204",
            type = "TimerBranchNode",
            name = "\232\174\161\230\151\182\229\153\168",
            pos = {x = 2129.8881578947367, y = 294.27631578947376},
            propsData = {
              TimerRange = {
                {StartTime = 0, EndTime = 15},
                {StartTime = 15, EndTime = -1}
              }
            }
          },
          ["1731230657043629799"] = {
            key = "1731230657043629799",
            type = "TalkNode",
            name = "\230\136\152\229\177\128\229\131\181\230\140\129\229\188\149\230\157\165\228\186\134\230\155\180\229\164\154\231\154\132\229\163\171\229\133\181",
            pos = {x = 2451.554824561403, y = 503.60964912280707},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71002903,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1731230691020630354"] = {
            key = "1731230691020630354",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3155.97149122807, y = 125.94298245614033},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1731230717892630959"] = {
            key = "1731230717892630959",
            type = "TalkNode",
            name = "\231\178\190\229\135\134\231\154\132\230\150\169\233\166\150",
            pos = {x = 2634.6111971104233, y = 125.61210010319927},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71002902,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
