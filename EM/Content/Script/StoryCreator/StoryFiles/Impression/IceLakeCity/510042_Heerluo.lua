return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1716548641072614216",
      startPort = "StoryStart",
      endStory = "1716548641072614218",
      endPort = "In"
    },
    {
      startStory = "1716548641072614218",
      startPort = "Success",
      endStory = "1716548641072614217",
      endPort = "StoryEnd"
    },
    {
      startStory = "1716548641072614218",
      startPort = "Fail",
      endStory = "1716548641072614217",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1716548641072614216"] = {
      isStoryNode = true,
      key = "1716548641072614216",
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
    ["1716548641072614217"] = {
      isStoryNode = true,
      key = "1716548641072614217",
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
    ["1716548641072614218"] = {
      isStoryNode = true,
      key = "1716548641072614218",
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
            startQuest = "1716548641072614219",
            startPort = "QuestStart",
            endQuest = "1715943530904118637",
            endPort = "In"
          },
          {
            startQuest = "1715943530904118637",
            startPort = "Out",
            endQuest = "1716548641072614220",
            endPort = "Success"
          },
          {
            startQuest = "1715943530904118637",
            startPort = "Fail",
            endQuest = "1716548641072614221",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1715943530904118637"] = {
            key = "1715943530904118637",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 937.6497457836006, y = -236.64425039958718},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51004201,
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
          },
          ["1716548641072614219"] = {
            key = "1716548641072614219",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 696.3160419790105, y = -186.3652173913045},
            propsData = {ModeType = 0}
          },
          ["1716548641072614220"] = {
            key = "1716548641072614220",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2483.3890756302517, y = -249.75126050420175},
            propsData = {ModeType = 0}
          },
          ["1716548641072614221"] = {
            key = "1716548641072614221",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2277.6470588235293, y = -32.42352941176483},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
