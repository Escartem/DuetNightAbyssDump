return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17141991237353236179",
      startPort = "StoryStart",
      endStory = "17104042038226308",
      endPort = "In"
    },
    {
      startStory = "17104042038226308",
      startPort = "Success",
      endStory = "17141991237353236180",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17104042038226308"] = {
      isStoryNode = true,
      key = "17104042038226308",
      type = "StoryNode",
      name = "\232\181\155\231\144\170EndTalk1",
      pos = {x = 1079.6521739130442, y = 289.91304347826036},
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
            startQuest = "17104042038226309",
            startPort = "QuestStart",
            endQuest = "17104042794567651",
            endPort = "In"
          },
          {
            startQuest = "17104042794567651",
            startPort = "Out",
            endQuest = "17104042038226311",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17104042038226309"] = {
            key = "17104042038226309",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17104042038226311"] = {
            key = "17104042038226311",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1456.5217391304348, y = 307.82608695652175},
            propsData = {ModeType = 0}
          },
          ["17104042038226313"] = {
            key = "17104042038226313",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17104042794567651"] = {
            key = "17104042794567651",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1120.0869565217401, y = 296.43478260869523},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 20001301,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
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
          }
        },
        commentData = {}
      }
    },
    ["17141991237353236179"] = {
      isStoryNode = true,
      key = "17141991237353236179",
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
    ["17141991237353236180"] = {
      isStoryNode = true,
      key = "17141991237353236180",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1364.666666666667, y = 276.57142857142856},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    }
  },
  commentData = {}
}
