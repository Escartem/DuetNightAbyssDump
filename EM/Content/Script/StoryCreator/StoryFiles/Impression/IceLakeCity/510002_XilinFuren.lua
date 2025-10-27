return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "16967532979550",
      startPort = "StoryStart",
      endStory = "1696753473313944",
      endPort = "In"
    },
    {
      startStory = "1696753473313944",
      startPort = "Success",
      endStory = "16967532979554",
      endPort = "StoryEnd"
    },
    {
      startStory = "1696753473313944",
      startPort = "Fail",
      endStory = "16967532979554",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["16967532979550"] = {
      isStoryNode = true,
      key = "16967532979550",
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
    ["16967532979554"] = {
      isStoryNode = true,
      key = "16967532979554",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1531.5384615384614, y = 303.3333333333333},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1696753473313944"] = {
      isStoryNode = true,
      key = "1696753473313944",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1138, y = 279.4825174825175},
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
            startQuest = "1696753473313945",
            startPort = "QuestStart",
            endQuest = "16967534841591973",
            endPort = "In"
          },
          {
            startQuest = "16967534841591973",
            startPort = "Out",
            endQuest = "1696753473313947",
            endPort = "Success"
          },
          {
            startQuest = "16967534841591973",
            startPort = "Fail",
            endQuest = "1696753473313949",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1696753473313945"] = {
            key = "1696753473313945",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 797.5, y = 320},
            propsData = {ModeType = 0}
          },
          ["1696753473313947"] = {
            key = "1696753473313947",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1516.3684372902637, y = 185.13483188637983},
            propsData = {ModeType = 0}
          },
          ["1696753473313949"] = {
            key = "1696753473313949",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1514.650980392157, y = 437.0941176470588},
            propsData = {}
          },
          ["16967534841591973"] = {
            key = "16967534841591973",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1130.176368459127, y = 311.98947786493426},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51000301,
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
