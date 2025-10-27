return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1708496878126214380",
      startPort = "StoryStart",
      endStory = "1708496878126214382",
      endPort = "In"
    },
    {
      startStory = "1708496878126214382",
      startPort = "Success",
      endStory = "1708496878126214381",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1708496878126214380"] = {
      isStoryNode = true,
      key = "1708496878126214380",
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
    ["1708496878126214381"] = {
      isStoryNode = true,
      key = "1708496878126214381",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1778, y = 312},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1708496878126214382"] = {
      isStoryNode = true,
      key = "1708496878126214382",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1218, y = 316},
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
        bIsNotifyGameMode = false,
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
            startQuest = "1708496878126214386",
            startPort = "Out",
            endQuest = "1708496878126214384",
            endPort = "Success"
          },
          {
            startQuest = "1708496878126214383",
            startPort = "QuestStart",
            endQuest = "1708496878126214386",
            endPort = "In"
          }
        },
        nodeData = {
          ["1708496878126214383"] = {
            key = "1708496878126214383",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1708496878126214384"] = {
            key = "1708496878126214384",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1644, y = 328},
            propsData = {ModeType = 0}
          },
          ["1708496878126214385"] = {
            key = "1708496878126214385",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1536, y = 518},
            propsData = {}
          },
          ["1708496878126214386"] = {
            key = "1708496878126214386",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1193.388888888889, y = 306.7836257309942},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 11011841,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
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
              SwitchToMaster = "EXPlayer",
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
