return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17492108076601885999",
      startPort = "StoryStart",
      endStory = "17492108076601886001",
      endPort = "In"
    },
    {
      startStory = "17492108076601886001",
      startPort = "Success",
      endStory = "17492108076601886000",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17492108076601885999"] = {
      isStoryNode = true,
      key = "17492108076601885999",
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
    ["17492108076601886000"] = {
      isStoryNode = true,
      key = "17492108076601886000",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1304.5276292335113, y = 304.468211527035},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17492108076601886001"] = {
      isStoryNode = true,
      key = "17492108076601886001",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1056.0830161896256, y = 318.11705968012336},
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
            startQuest = "17492108076601886002",
            startPort = "QuestStart",
            endQuest = "17236262492862390042",
            endPort = "In"
          },
          {
            startQuest = "17236262492862390042",
            startPort = "Out",
            endQuest = "17492108076601886003",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17236262492862390042"] = {
            key = "17236262492862390042",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1007.8911814706037, y = 276.03495279029505},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10104301,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = false,
              ShowAutoPlayButton = false,
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
          ["17492108076601886002"] = {
            key = "17492108076601886002",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 719.8369565217391, y = 327.7173913043478},
            propsData = {ModeType = 0}
          },
          ["17492108076601886003"] = {
            key = "17492108076601886003",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1486.133540372671, y = 313.69565217391306},
            propsData = {ModeType = 0}
          },
          ["17492108076601886004"] = {
            key = "17492108076601886004",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
