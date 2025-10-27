return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17141991229993191821",
      startPort = "StoryStart",
      endStory = "17141818033274750",
      endPort = "In"
    },
    {
      startStory = "17141818033274750",
      startPort = "Success",
      endStory = "17141991229993191822",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17141818033274750"] = {
      isStoryNode = true,
      key = "17141818033274750",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1059.592195747547, y = 293.40962856040966},
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
            startQuest = "17141818033274751",
            startPort = "QuestStart",
            endQuest = "17141818191455220",
            endPort = "In"
          },
          {
            startQuest = "17141818191455220",
            startPort = "Out",
            endQuest = "17141818033274753",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17141818033274751"] = {
            key = "17141818033274751",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17141818033274753"] = {
            key = "17141818033274753",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1358.421052631579, y = 296.8421052631579},
            propsData = {ModeType = 0}
          },
          ["17141818033274755"] = {
            key = "17141818033274755",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17141818191455220"] = {
            key = "17141818191455220",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1071.2938633535089, y = 293.5368195397764},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 510034143,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
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
    ["17141991229993191821"] = {
      isStoryNode = true,
      key = "17141991229993191821",
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
    ["17141991229993191822"] = {
      isStoryNode = true,
      key = "17141991229993191822",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1339.130434782609, y = 304.95652173913044},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991229993191823"] = {
      isStoryNode = true,
      key = "17141991229993191823",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1066.6343609892524, y = 455.17495819397993},
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
            startQuest = "17141991229993191824",
            startPort = "QuestStart",
            endQuest = "17141991229993191827",
            endPort = "In"
          },
          {
            startQuest = "17141991229993191827",
            startPort = "Out",
            endQuest = "17141991229993191825",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17141991229993191824"] = {
            key = "17141991229993191824",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 847.3684210526316, y = 292.10526315789474},
            propsData = {ModeType = 0}
          },
          ["17141991229993191825"] = {
            key = "17141991229993191825",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1420.921052631579, y = 277.89473684210526},
            propsData = {ModeType = 0}
          },
          ["17141991229993191826"] = {
            key = "17141991229993191826",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1418.421052631579, y = 400.7894736842105},
            propsData = {}
          },
          ["17141991229993191827"] = {
            key = "17141991229993191827",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1113.1383325611587, y = 281.8461538461538},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 510034143,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
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
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
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
