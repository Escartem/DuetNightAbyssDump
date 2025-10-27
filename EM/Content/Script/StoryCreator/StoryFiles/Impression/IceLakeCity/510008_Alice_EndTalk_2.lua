return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1732783210552476912",
      startPort = "StoryStart",
      endStory = "1732783210552476915",
      endPort = "In"
    },
    {
      startStory = "1732783210552476915",
      startPort = "Success",
      endStory = "1732783210552476913",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1732783210552476912"] = {
      isStoryNode = true,
      key = "1732783210552476912",
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
    ["1732783210552476913"] = {
      isStoryNode = true,
      key = "1732783210552476913",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1466.1904761904764, y = 299.2857142857143},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783210552476914"] = {
      isStoryNode = true,
      key = "1732783210552476914",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1128.952380952381, y = 102.59243697479006},
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
            startQuest = "1732783210552476916",
            startPort = "QuestStart",
            endQuest = "1732783210552476919",
            endPort = "In"
          },
          {
            startQuest = "1732783210552476919",
            startPort = "Out",
            endQuest = "1732783210552476917",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1732783210552476916"] = {
            key = "1732783210552476916",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1732783210552476917"] = {
            key = "1732783210552476917",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1702.3529411764707, y = 292.94117647058823},
            propsData = {ModeType = 0}
          },
          ["1732783210552476918"] = {
            key = "1732783210552476918",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1949.4117647058822, y = 798.8235294117646},
            propsData = {}
          },
          ["1732783210552476919"] = {
            key = "1732783210552476919",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1146.7647058823532, y = 279.7058823529411},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51000812,
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
    },
    ["1732783210552476915"] = {
      isStoryNode = true,
      key = "1732783210552476915",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1123.352150475239, y = 304.7462979240304},
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
            startQuest = "1732783210552476920",
            startPort = "QuestStart",
            endQuest = "1732783210552476923",
            endPort = "In"
          },
          {
            startQuest = "1732783210552476923",
            startPort = "Out",
            endQuest = "1732783210552476921",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1732783210552476920"] = {
            key = "1732783210552476920",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1732783210552476921"] = {
            key = "1732783210552476921",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1377.142857142858, y = 302.14285714285717},
            propsData = {ModeType = 0}
          },
          ["1732783210552476922"] = {
            key = "1732783210552476922",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1732783210552476923"] = {
            key = "1732783210552476923",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1085.495007618096, y = 287.60344078117316},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51000815,
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
