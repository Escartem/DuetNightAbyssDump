return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17389270495692528831",
      startPort = "StoryStart",
      endStory = "17389270513462528885",
      endPort = "In"
    },
    {
      startStory = "17389270513462528885",
      startPort = "Success",
      endStory = "17389270495692528834",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17389270495692528831"] = {
      isStoryNode = true,
      key = "17389270495692528831",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1350, y = 488},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17389270495692528834"] = {
      isStoryNode = true,
      key = "17389270495692528834",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2142, y = 496},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17389270513462528885"] = {
      isStoryNode = true,
      key = "17389270513462528885",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1814, y = 498},
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
            startQuest = "17389270513462528886",
            startPort = "QuestStart",
            endQuest = "17389270605062529332",
            endPort = "In"
          },
          {
            startQuest = "17389270605062529332",
            startPort = "Out",
            endQuest = "17389270513472528889",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17389270513462528886"] = {
            key = "17389270513462528886",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1388, y = 502},
            propsData = {ModeType = 0}
          },
          ["17389270513472528889"] = {
            key = "17389270513472528889",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2214, y = 530},
            propsData = {ModeType = 0}
          },
          ["17389270513472528892"] = {
            key = "17389270513472528892",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17389270605062529332"] = {
            key = "17389270605062529332",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1738, y = 492},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007758,
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
