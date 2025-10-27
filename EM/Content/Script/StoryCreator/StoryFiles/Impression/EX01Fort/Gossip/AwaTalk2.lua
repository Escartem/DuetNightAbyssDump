return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "172665002100715643063",
      startPort = "StoryStart",
      endStory = "172665002605915643275",
      endPort = "In"
    },
    {
      startStory = "172665002605915643275",
      startPort = "Success",
      endStory = "172665002100715643066",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["172665002100715643063"] = {
      isStoryNode = true,
      key = "172665002100715643063",
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
    ["172665002100715643066"] = {
      isStoryNode = true,
      key = "172665002100715643066",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1465, y = 304.5},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["172665002605915643275"] = {
      isStoryNode = true,
      key = "172665002605915643275",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1165.8961944204777, y = 284.44739278874454},
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
            startQuest = "172665002605915643276",
            startPort = "QuestStart",
            endQuest = "172665039118616194625",
            endPort = "In"
          },
          {
            startQuest = "172665039118616194625",
            startPort = "Out",
            endQuest = "172665002606015643279",
            endPort = "Success"
          }
        },
        nodeData = {
          ["172665002605915643276"] = {
            key = "172665002605915643276",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["172665002606015643279"] = {
            key = "172665002606015643279",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1990, y = 303.75},
            propsData = {ModeType = 0}
          },
          ["172665002606015643282"] = {
            key = "172665002606015643282",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["172665039118616194625"] = {
            key = "172665039118616194625",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1301.3923835095393, y = 314.6975351007275},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 11017901,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0,
              BlendOutTime = 0,
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
