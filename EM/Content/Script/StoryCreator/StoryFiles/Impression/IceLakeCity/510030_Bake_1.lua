return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17141991229853191546",
      startPort = "StoryStart",
      endStory = "17141991229853191548",
      endPort = "In"
    },
    {
      startStory = "17141991229853191548",
      startPort = "Success",
      endStory = "17141991229853191547",
      endPort = "StoryEnd"
    },
    {
      startStory = "17141991229853191548",
      startPort = "Fail",
      endStory = "17141991229853191547",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17141991229853191546"] = {
      isStoryNode = true,
      key = "17141991229853191546",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1737.828947368421, y = 348.42105263157896},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991229853191547"] = {
      isStoryNode = true,
      key = "17141991229853191547",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2212.960526315789, y = 351.1842105263158},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991229853191548"] = {
      isStoryNode = true,
      key = "17141991229853191548",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1977.0973068469243, y = 343.85383076675834},
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
            startQuest = "17141991229853191549",
            startPort = "QuestStart",
            endQuest = "17141991229853191552",
            endPort = "In"
          },
          {
            startQuest = "17141991229853191552",
            startPort = "Fail",
            endQuest = "17141991229853191551",
            endPort = "Fail"
          },
          {
            startQuest = "17141991229853191552",
            startPort = "Out",
            endQuest = "17141991229853191550",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17141991229853191549"] = {
            key = "17141991229853191549",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1071.7593984962405, y = 132.1127819548873},
            propsData = {ModeType = 0}
          },
          ["17141991229853191550"] = {
            key = "17141991229853191550",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1637.0760932431422, y = 27.644236008080362},
            propsData = {ModeType = 0}
          },
          ["17141991229853191551"] = {
            key = "17141991229853191551",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1642.5848064978495, y = 244.7105640355067},
            propsData = {}
          },
          ["17141991229853191552"] = {
            key = "17141991229853191552",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1359.1597059276319, y = 132.48190292343472},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 51003001,
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
