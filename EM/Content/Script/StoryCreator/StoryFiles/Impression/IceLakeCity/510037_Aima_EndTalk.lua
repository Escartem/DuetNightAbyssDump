return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17141991230343192546",
      startPort = "StoryStart",
      endStory = "17141991230343192548",
      endPort = "In"
    },
    {
      startStory = "17141991230343192548",
      startPort = "Success",
      endStory = "17141991230343192547",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17141991230343192546"] = {
      isStoryNode = true,
      key = "17141991230343192546",
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
    ["17141991230343192547"] = {
      isStoryNode = true,
      key = "17141991230343192547",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1330.0000000000002, y = 301.84615384615387},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991230343192548"] = {
      isStoryNode = true,
      key = "17141991230343192548",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1056.6095581168177, y = 291.96131741821387},
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
            startQuest = "17141991230343192549",
            startPort = "QuestStart",
            endQuest = "17141991230343192552",
            endPort = "In"
          },
          {
            startQuest = "17141991230343192552",
            startPort = "Out",
            endQuest = "17141991230343192550",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17141991230343192549"] = {
            key = "17141991230343192549",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17141991230343192550"] = {
            key = "17141991230343192550",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1358.1720430107525, y = 295.3225806451613},
            propsData = {ModeType = 0}
          },
          ["17141991230343192551"] = {
            key = "17141991230343192551",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17141991230343192552"] = {
            key = "17141991230343192552",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1067.676555635428, y = 286.9365035224322},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 510037042,
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
