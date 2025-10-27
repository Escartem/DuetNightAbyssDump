return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17591301428472508746",
      startPort = "StoryStart",
      endStory = "17591301459512508852",
      endPort = "In"
    },
    {
      startStory = "17591301459512508852",
      startPort = "Success",
      endStory = "17591301428472508749",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17591301428472508746"] = {
      isStoryNode = true,
      key = "17591301428472508746",
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
    ["17591301428472508749"] = {
      isStoryNode = true,
      key = "17591301428472508749",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2084, y = 438},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17591301459512508852"] = {
      isStoryNode = true,
      key = "17591301459512508852",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1404, y = 418},
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
            startQuest = "17591301459522508853",
            startPort = "QuestStart",
            endQuest = "17591301576042509251",
            endPort = "In"
          },
          {
            startQuest = "17591301576042509251",
            startPort = "Out",
            endQuest = "17591301459522508856",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17591301459522508853"] = {
            key = "17591301459522508853",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17591301459522508856"] = {
            key = "17591301459522508856",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1554, y = 338},
            propsData = {ModeType = 0}
          },
          ["17591301459522508859"] = {
            key = "17591301459522508859",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17591301576042509251"] = {
            key = "17591301576042509251",
            type = "TalkNode",
            name = "\230\129\169\233\135\140\229\133\139\233\151\178\231\189\174",
            pos = {x = 1205.9759537274251, y = 295.99999999999994},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10114401,
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
