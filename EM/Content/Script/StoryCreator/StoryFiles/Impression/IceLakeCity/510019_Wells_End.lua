return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1700816005311106208",
      startPort = "StoryStart",
      endStory = "1700816018770108582",
      endPort = "In"
    },
    {
      startStory = "1700816018770108582",
      startPort = "Success",
      endStory = "1700816005311106211",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1700816005311106208"] = {
      isStoryNode = true,
      key = "1700816005311106208",
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
    ["1700816005311106211"] = {
      isStoryNode = true,
      key = "1700816005311106211",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1420.5357142857167, y = 328.92857142857133},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1700816018770108582"] = {
      isStoryNode = true,
      key = "1700816018770108582",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1085.596657185977, y = 312.1399814910605},
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
            startQuest = "1700816018770108583",
            startPort = "QuestStart",
            endQuest = "1700816037784111812",
            endPort = "In"
          },
          {
            startQuest = "1700816037784111812",
            startPort = "Out",
            endQuest = "1700816018771108585",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1700816018770108583"] = {
            key = "1700816018770108583",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1700816018771108585"] = {
            key = "1700816018771108585",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1579.85507246377, y = 332.0289855072463},
            propsData = {ModeType = 0}
          },
          ["1700816018771108587"] = {
            key = "1700816018771108587",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1700816037784111812"] = {
            key = "1700816037784111812",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1155.8130086793383, y = 317.59176306114506},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51001933,
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
    }
  },
  commentData = {}
}
