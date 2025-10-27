return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1751270516293762580",
      startPort = "StoryStart",
      endStory = "1751270516293762582",
      endPort = "In"
    },
    {
      startStory = "1751270516293762582",
      startPort = "Success",
      endStory = "1751270516293762581",
      endPort = "StoryEnd"
    },
    {
      startStory = "1751270516293762582",
      startPort = "Fail",
      endStory = "1751270516293762581",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1751270516293762580"] = {
      isStoryNode = true,
      key = "1751270516293762580",
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
    ["1751270516293762581"] = {
      isStoryNode = true,
      key = "1751270516293762581",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1646.9565217391303, y = 306.5217391304348},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1751270516293762582"] = {
      isStoryNode = true,
      key = "1751270516293762582",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1223.4935064935066, y = 309.55194805194805},
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
            startQuest = "1751270516293762583",
            startPort = "QuestStart",
            endQuest = "1751270516293762586",
            endPort = "In"
          },
          {
            startQuest = "1751270516293762586",
            startPort = "Out",
            endQuest = "1751270516293762584",
            endPort = "Success"
          },
          {
            startQuest = "1751270516293762586",
            startPort = "Fail",
            endQuest = "1751270516293762585",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1751270516293762583"] = {
            key = "1751270516293762583",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1092.8, y = 297.6},
            propsData = {ModeType = 0}
          },
          ["1751270516293762584"] = {
            key = "1751270516293762584",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2035.8823529411766, y = 275.29411764705884},
            propsData = {ModeType = 0}
          },
          ["1751270516293762585"] = {
            key = "1751270516293762585",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1751270516293762586"] = {
            key = "1751270516293762586",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1590.1411764705883, y = 386.0470588235295},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51010402,
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
              SwitchToMaster = "Player",
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
