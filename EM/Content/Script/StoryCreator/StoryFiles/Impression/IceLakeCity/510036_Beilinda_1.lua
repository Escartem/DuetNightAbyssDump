return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17141991230253192474",
      startPort = "StoryStart",
      endStory = "17141991230253192476",
      endPort = "In"
    },
    {
      startStory = "17141991230253192476",
      startPort = "Success",
      endStory = "17141991230253192475",
      endPort = "StoryEnd"
    },
    {
      startStory = "17141991230253192476",
      startPort = "Fail",
      endStory = "17141991230253192475",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17141991230253192474"] = {
      isStoryNode = true,
      key = "17141991230253192474",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1574.7058823529412, y = 292.94117647058823},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991230253192475"] = {
      isStoryNode = true,
      key = "17141991230253192475",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2161.176470588235, y = 291.1764705882353},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991230253192476"] = {
      isStoryNode = true,
      key = "17141991230253192476",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1871.380447854526, y = 288.67662886873256},
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
            startQuest = "17141991230253192477",
            startPort = "QuestStart",
            endQuest = "1714464198929108104",
            endPort = "In"
          },
          {
            startQuest = "1714464198929108104",
            startPort = "Out",
            endQuest = "17141991230253192478",
            endPort = "Success"
          },
          {
            startQuest = "1714464198929108104",
            startPort = "Fail",
            endQuest = "17141991230253192479",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17141991230253192477"] = {
            key = "17141991230253192477",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 547.5160419790105, y = 366.83478260869555},
            propsData = {ModeType = 0}
          },
          ["17141991230253192478"] = {
            key = "17141991230253192478",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1192.6176470588234, y = 254.80588235294113},
            propsData = {ModeType = 0}
          },
          ["17141991230253192479"] = {
            key = "17141991230253192479",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1189.8470588235293, y = 441.87647058823524},
            propsData = {}
          },
          ["1714464198929108104"] = {
            key = "1714464198929108104",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 803.9179510335106, y = 345.3677914739381},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51003604,
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
