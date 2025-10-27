return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851536879811585758",
      startPort = "StoryStart",
      endStory = "17167925266191253103",
      endPort = "In"
    },
    {
      startStory = "17167925266191253103",
      startPort = "Success",
      endStory = "171851536879811585759",
      endPort = "StoryEnd"
    },
    {
      startStory = "17167925266191253103",
      startPort = "Fail",
      endStory = "171851536879811585759",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17167925266191253103"] = {
      isStoryNode = true,
      key = "17167925266191253103",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1874.1003460048132, y = 551.9752554587893},
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
            startQuest = "17167925266191253104",
            startPort = "QuestStart",
            endQuest = "17167926144881255170",
            endPort = "In"
          },
          {
            startQuest = "17167926144881255170",
            startPort = "Fail",
            endQuest = "17167925266201253108",
            endPort = "Fail"
          },
          {
            startQuest = "17167926144881255170",
            startPort = "Out",
            endQuest = "17167925266201253106",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17167925266191253104"] = {
            key = "17167925266191253104",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1136.3157894736842, y = 528.9473684210526},
            propsData = {ModeType = 0}
          },
          ["17167925266201253106"] = {
            key = "17167925266201253106",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1711.2986270022884, y = 440.8695652173913},
            propsData = {ModeType = 0}
          },
          ["17167925266201253108"] = {
            key = "17167925266201253108",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1709.5999823974657, y = 613.0890248195739},
            propsData = {}
          },
          ["17167926144881255170"] = {
            key = "17167926144881255170",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1412.6803243788413, y = 510.8220065338015},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51003901,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 1,
              BlendOutTime = 1,
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
              OverrideFailBlend = true,
              FailOutType = "BlendOut",
              FailOutTime = 0.5
            }
          }
        },
        commentData = {}
      }
    },
    ["171851536879811585758"] = {
      isStoryNode = true,
      key = "171851536879811585758",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1597.563025210084, y = 570.0840336134454},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["171851536879811585759"] = {
      isStoryNode = true,
      key = "171851536879811585759",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2174.0336134453783, y = 566.890756302521},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    }
  },
  commentData = {}
}
