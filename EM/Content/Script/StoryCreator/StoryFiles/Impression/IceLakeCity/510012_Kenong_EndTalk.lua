return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1704175978832177138",
      startPort = "StoryStart",
      endStory = "171418251555018254",
      endPort = "In"
    },
    {
      startStory = "171418251555018254",
      startPort = "Success",
      endStory = "1704175978832177139",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["169823303960011167"] = {
      isStoryNode = true,
      key = "169823303960011167",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1058.90279628838, y = 480.33828101722827},
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
            startQuest = "1704175978833177140",
            startPort = "QuestStart",
            endQuest = "169823303350010641",
            endPort = "In"
          },
          {
            startQuest = "169823303350010641",
            startPort = "Out",
            endQuest = "1704175978833177141",
            endPort = "Success"
          }
        },
        nodeData = {
          ["169823303350010641"] = {
            key = "169823303350010641",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1191.6111296217132, y = 277.42161435056164},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51001211,
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
          },
          ["1704175978833177140"] = {
            key = "1704175978833177140",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1704175978833177141"] = {
            key = "1704175978833177141",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1843.27731092437, y = 281.93277310924367},
            propsData = {ModeType = 0}
          },
          ["1704175978833177142"] = {
            key = "1704175978833177142",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2314.705882352941, y = 756.4705882352941},
            propsData = {}
          }
        },
        commentData = {}
      }
    },
    ["1704175978832177138"] = {
      isStoryNode = true,
      key = "1704175978832177138",
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
    ["1704175978832177139"] = {
      isStoryNode = true,
      key = "1704175978832177139",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1436.666666666667, y = 305},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["171418251555018254"] = {
      isStoryNode = true,
      key = "171418251555018254",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1099.3659649231315, y = 286.5568631757722},
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
            startQuest = "171418251555018255",
            startPort = "QuestStart",
            endQuest = "171418252444018574",
            endPort = "In"
          },
          {
            startQuest = "171418252444018574",
            startPort = "Out",
            endQuest = "171418251555118257",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171418251555018255"] = {
            key = "171418251555018255",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["171418251555118257"] = {
            key = "171418251555118257",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1330.0641025641048, y = 304.7435897435898},
            propsData = {ModeType = 0}
          },
          ["171418251555118259"] = {
            key = "171418251555118259",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["171418252444018574"] = {
            key = "171418252444018574",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1060.4076315897983, y = 290.20269650910546},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51001211,
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
