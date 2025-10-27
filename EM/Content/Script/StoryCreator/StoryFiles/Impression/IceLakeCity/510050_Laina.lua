return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851536885511587921",
      startPort = "StoryStart",
      endStory = "171851536885511587923",
      endPort = "In"
    },
    {
      startStory = "171851536885511587923",
      startPort = "Success",
      endStory = "171851536885511587922",
      endPort = "StoryEnd"
    },
    {
      startStory = "171851536885511587923",
      startPort = "Fail",
      endStory = "171851536885511587922",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["171851536885511587921"] = {
      isStoryNode = true,
      key = "171851536885511587921",
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
    ["171851536885511587922"] = {
      isStoryNode = true,
      key = "171851536885511587922",
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
    ["171851536885511587923"] = {
      isStoryNode = true,
      key = "171851536885511587923",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1875.380447854526, y = 287.3722810426456},
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
            startQuest = "171851536885511587924",
            startPort = "QuestStart",
            endQuest = "1715481528886312979",
            endPort = "In"
          },
          {
            startQuest = "1715481528886312979",
            startPort = "Out",
            endQuest = "171851536885511587925",
            endPort = "Success"
          },
          {
            startQuest = "1715481528886312979",
            startPort = "Fail",
            endQuest = "171851536885511587926",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1715481528886312979"] = {
            key = "1715481528886312979",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 968.106763285024, y = -206.00000000000009},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51005001,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
              OptionType = "check",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              CheckOptions = {},
              OverrideFailBlend = true,
              FailOutType = "BlendOut",
              FailOutTime = 0.5
            }
          },
          ["171851536885511587924"] = {
            key = "171851536885511587924",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 677.5160419790105, y = -192.05410628019342},
            propsData = {ModeType = 0}
          },
          ["171851536885511587925"] = {
            key = "171851536885511587925",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1290.2190963341855, y = -321.08783745382226},
            propsData = {ModeType = 0}
          },
          ["171851536885511587926"] = {
            key = "171851536885511587926",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1281.95816993464, y = -52.734640522875864},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
