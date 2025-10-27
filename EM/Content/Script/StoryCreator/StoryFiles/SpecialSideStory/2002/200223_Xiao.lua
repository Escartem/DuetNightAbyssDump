return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "173763418225831432062",
      startPort = "Success",
      endStory = "17376214851328939303",
      endPort = "StoryEnd"
    },
    {
      startStory = "17376214851328939302",
      startPort = "StoryStart",
      endStory = "175127151538911440652",
      endPort = "In"
    },
    {
      startStory = "175127151538911440652",
      startPort = "Success",
      endStory = "173763418225831432062",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17376214851328939302"] = {
      isStoryNode = true,
      key = "17376214851328939302",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 300},
      propsData = {QuestChainId = 200223},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17376214851328939303"] = {
      isStoryNode = true,
      key = "17376214851328939303",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1566.75, y = 321.25},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["173763418225831432062"] = {
      isStoryNode = true,
      key = "173763418225831432062",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1196.9290617848967, y = 272.1464530892449},
      propsData = {
        QuestId = 20022301,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200223_1",
        QuestDeatil = "Content_200223_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
        bIsEndQuest = true,
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
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Xiao_1190087"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173763418225831432063",
            startPort = "QuestStart",
            endQuest = "1741921111103404",
            endPort = "In"
          },
          {
            startQuest = "1741921111103404",
            startPort = "Out",
            endQuest = "173763418225831432066",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173763418225831432063"] = {
            key = "173763418225831432063",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 786.8, y = 422.8},
            propsData = {ModeType = 0}
          },
          ["173763418225831432066"] = {
            key = "173763418225831432066",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1561.084210526316, y = 453.95789473684215},
            propsData = {ModeType = 0}
          },
          ["173763418225831432069"] = {
            key = "173763418225831432069",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1741921111103404"] = {
            key = "1741921111103404",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1141.373466755123, y = 459.6084107327141},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700011,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Xiao_1190087",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007543,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              SkipToOption = false,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              PauseNpcBT = true,
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["175127151538911440652"] = {
      isStoryNode = true,
      key = "175127151538911440652",
      type = "PreStoryNode",
      name = "\228\187\187\229\138\161\229\137\141\231\189\174\232\138\130\231\130\185",
      pos = {x = 969.916101942763, y = 131.33454238647366},
      propsData = {
        QuestId = 20022300,
        QuestDescriptionComment = "",
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Xiao_1190087"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175127151538911440662",
            startPort = "Out",
            endQuest = "175127151538911440660",
            endPort = "In"
          },
          {
            startQuest = "175127151538911440660",
            startPort = "Out",
            endQuest = "175127151538911440661",
            endPort = "Input"
          },
          {
            startQuest = "175127151538911440661",
            startPort = "ApproveOut",
            endQuest = "175127151538911440659",
            endPort = "In"
          },
          {
            startQuest = "175127151538911440659",
            startPort = "Out",
            endQuest = "175127151538911440657",
            endPort = "Success"
          },
          {
            startQuest = "175127151538911440661",
            startPort = "CancelOut",
            endQuest = "175127151538911440658",
            endPort = "Fail"
          },
          {
            startQuest = "175127151538911440656",
            startPort = "QuestStart",
            endQuest = "175127151538911440662",
            endPort = "In"
          }
        },
        nodeData = {
          ["175127151538911440656"] = {
            key = "175127151538911440656",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175127151538911440657"] = {
            key = "175127151538911440657",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175127151538911440658"] = {
            key = "175127151538911440658",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["175127151538911440659"] = {
            key = "175127151538911440659",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2134.7046843557737, y = 257.50100862033725},
            propsData = {VarName = "XiAoStage", VarValue = 1}
          },
          ["175127151538911440660"] = {
            key = "175127151538911440660",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1501.2953156442263, y = 278.49899137966275},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700011,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Xiao_1190087",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007501,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              SkipToOption = false,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              PauseNpcBT = true,
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175127151538911440661"] = {
            key = "175127151538911440661",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 1843.879973474801, y = 259.4432972546831},
            propsData = {
              SideQuestChainId = 200223,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          },
          ["175127151538911440662"] = {
            key = "175127151538911440662",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 1189.2953156442265, y = 273.44635980071547},
            propsData = {VarName = "XiAoStage", VarValue = 0}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
