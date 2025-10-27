return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "16982325837040",
      startPort = "StoryStart",
      endStory = "1698232687991246",
      endPort = "In"
    },
    {
      startStory = "1698232687991246",
      startPort = "Success",
      endStory = "16982325837054",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["16982325837040"] = {
      isStoryNode = true,
      key = "16982325837040",
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
    ["16982325837054"] = {
      isStoryNode = true,
      key = "16982325837054",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1661.764705882353, y = 294.70588235294116},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1698232687991246"] = {
      isStoryNode = true,
      key = "1698232687991246",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1166, y = 284},
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
            startQuest = "1698232687991247",
            startPort = "QuestStart",
            endQuest = "1698232692101552",
            endPort = "In"
          },
          {
            startQuest = "1698232692101552",
            startPort = "Out",
            endQuest = "1698232687991249",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1698232687991247"] = {
            key = "1698232687991247",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1698232687991249"] = {
            key = "1698232687991249",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1489.7142857142856, y = 324.6857142857143},
            propsData = {ModeType = 0}
          },
          ["1698232687991251"] = {
            key = "1698232687991251",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1430.3428571428567, y = 866.4571428571429},
            propsData = {}
          },
          ["1698232692101552"] = {
            key = "1698232692101552",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1172, y = 318},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51001201,
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
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              PlusOptions = {},
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
