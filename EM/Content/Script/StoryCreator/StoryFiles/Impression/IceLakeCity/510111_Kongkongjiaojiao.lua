return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17506614399812427599",
      startPort = "StoryStart",
      endStory = "17506614399812427601",
      endPort = "In"
    },
    {
      startStory = "17506614399812427601",
      startPort = "Success",
      endStory = "17506614399812427600",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17506614399812427599"] = {
      isStoryNode = true,
      key = "17506614399812427599",
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
    ["17506614399812427600"] = {
      isStoryNode = true,
      key = "17506614399812427600",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1646.9565217391303, y = 306.5217391304348},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17506614399812427601"] = {
      isStoryNode = true,
      key = "17506614399812427601",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1223.4935064935066, y = 309.55194805194805},
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
            startQuest = "17506614399812427602",
            startPort = "QuestStart",
            endQuest = "17506614399812427605",
            endPort = "In"
          },
          {
            startQuest = "17506614399812427605",
            startPort = "Out",
            endQuest = "17506614399812427603",
            endPort = "Success"
          },
          {
            startQuest = "17506614399812427605",
            startPort = "Fail",
            endQuest = "17506614399812427604",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17506614399812427602"] = {
            key = "17506614399812427602",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1092.8, y = 297.6},
            propsData = {ModeType = 0}
          },
          ["17506614399812427603"] = {
            key = "17506614399812427603",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2035.8823529411766, y = 275.29411764705884},
            propsData = {ModeType = 0}
          },
          ["17506614399812427604"] = {
            key = "17506614399812427604",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17506614399812427605"] = {
            key = "17506614399812427605",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1590.1411764705883, y = 386.0470588235295},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51011101,
              FlowAssetPath = "",
              TalkType = "Impression",
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
