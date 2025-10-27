return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "172664997538515642073",
      startPort = "StoryStart",
      endStory = "172664998292815642378",
      endPort = "In"
    },
    {
      startStory = "172664998292815642378",
      startPort = "Success",
      endStory = "172664997538515642076",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["172664997538515642073"] = {
      isStoryNode = true,
      key = "172664997538515642073",
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
    ["172664997538515642076"] = {
      isStoryNode = true,
      key = "172664997538515642076",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1405, y = 280},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["172664998292815642378"] = {
      isStoryNode = true,
      key = "172664998292815642378",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1093.7013892256725, y = 283.02081936217115},
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
            startQuest = "172664998292815642379",
            startPort = "QuestStart",
            endQuest = "172665026206016009093",
            endPort = "In"
          },
          {
            startQuest = "172665026206016009093",
            startPort = "Out",
            endQuest = "172664998292815642382",
            endPort = "Success"
          }
        },
        nodeData = {
          ["172664998292815642379"] = {
            key = "172664998292815642379",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["172664998292815642382"] = {
            key = "172664998292815642382",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1580.5, y = 259.5},
            propsData = {ModeType = 0}
          },
          ["172664998292815642385"] = {
            key = "172664998292815642385",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1577.5, y = 439},
            propsData = {}
          },
          ["172665026206016009093"] = {
            key = "172665026206016009093",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1119.903968857334, y = 291.793624343567},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 11017901,
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
