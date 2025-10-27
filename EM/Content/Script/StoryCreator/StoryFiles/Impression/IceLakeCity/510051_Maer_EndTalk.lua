return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851536888111588689",
      startPort = "StoryStart",
      endStory = "17180943102442078826",
      endPort = "In"
    },
    {
      startStory = "17180943102442078826",
      startPort = "Success",
      endStory = "171851536888111588690",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17180943102442078826"] = {
      isStoryNode = true,
      key = "17180943102442078826",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1067.2432263608512, y = 288.3799505916828},
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
            startQuest = "17180943102442078827",
            startPort = "QuestStart",
            endQuest = "17180943201102079237",
            endPort = "In"
          },
          {
            startQuest = "17180943201102079237",
            startPort = "Out",
            endQuest = "17180943102452078830",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17180943102442078827"] = {
            key = "17180943102442078827",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17180943102452078830"] = {
            key = "17180943102452078830",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1400.6764705882351, y = 303},
            propsData = {ModeType = 0}
          },
          ["17180943102452078833"] = {
            key = "17180943102452078833",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17180943201102079237"] = {
            key = "17180943201102079237",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1072.669189849695, y = 286.70652259979636},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 510051321,
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
    },
    ["171851536888111588689"] = {
      isStoryNode = true,
      key = "171851536888111588689",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 725.5172413793103, y = 300},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["171851536888111588690"] = {
      isStoryNode = true,
      key = "171851536888111588690",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1387.9310344827588, y = 300.81167108753317},
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
