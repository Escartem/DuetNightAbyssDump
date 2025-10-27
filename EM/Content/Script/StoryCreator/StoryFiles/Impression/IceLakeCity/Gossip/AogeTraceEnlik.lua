return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1756910377386646405",
      startPort = "StoryStart",
      endStory = "1756910385291646708",
      endPort = "In"
    },
    {
      startStory = "1756910385291646708",
      startPort = "Success",
      endStory = "1756910377386646408",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1756910377386646405"] = {
      isStoryNode = true,
      key = "1756910377386646405",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 298},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1756910377386646408"] = {
      isStoryNode = true,
      key = "1756910377386646408",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1910, y = 332},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1756910385291646708"] = {
      isStoryNode = true,
      key = "1756910385291646708",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1320, y = 324},
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
            startQuest = "1756910385291646709",
            startPort = "QuestStart",
            endQuest = "1756910389460646982",
            endPort = "In"
          },
          {
            startQuest = "1756910389460646982",
            startPort = "Out",
            endQuest = "1756910385291646712",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1756910385291646709"] = {
            key = "1756910385291646709",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1756910385291646712"] = {
            key = "1756910385291646712",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1518, y = 308},
            propsData = {ModeType = 0}
          },
          ["1756910385291646715"] = {
            key = "1756910385291646715",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1756910389460646982"] = {
            key = "1756910389460646982",
            type = "TalkNode",
            name = "\229\165\165\229\147\165\231\154\132\229\190\133\230\156\186\229\175\185\232\175\157",
            pos = {x = 1119.2605733141186, y = 294},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10114001,
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
