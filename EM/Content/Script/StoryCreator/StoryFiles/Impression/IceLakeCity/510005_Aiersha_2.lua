return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1704175978756175613",
      startPort = "StoryStart",
      endStory = "1704175978756175615",
      endPort = "In"
    },
    {
      startStory = "1704175978756175615",
      startPort = "Success",
      endStory = "1704175978756175614",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1704175978756175613"] = {
      isStoryNode = true,
      key = "1704175978756175613",
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
    ["1704175978756175614"] = {
      isStoryNode = true,
      key = "1704175978756175614",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2038.3333333333333, y = 295},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175978756175615"] = {
      isStoryNode = true,
      key = "1704175978756175615",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1212.6666666666667, y = 301.5},
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
            startQuest = "1704175978756175616",
            startPort = "QuestStart",
            endQuest = "1704175978756175619",
            endPort = "In"
          },
          {
            startQuest = "1704175978756175619",
            startPort = "Out",
            endQuest = "1704175978756175617",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1704175978756175616"] = {
            key = "1704175978756175616",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1704175978756175617"] = {
            key = "1704175978756175617",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1531.1764705882354, y = 296.47058823529414},
            propsData = {ModeType = 0}
          },
          ["1704175978756175618"] = {
            key = "1704175978756175618",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1589.4117647058822, y = 738.8235294117646},
            propsData = {}
          },
          ["1704175978756175619"] = {
            key = "1704175978756175619",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1146.7647058823532, y = 286.66666666666663},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51000501,
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
