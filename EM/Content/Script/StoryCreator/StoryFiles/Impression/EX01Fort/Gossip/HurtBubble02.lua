return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1731481145813580546",
      startPort = "StoryStart",
      endStory = "1731481150394580688",
      endPort = "In"
    },
    {
      startStory = "1731481150394580688",
      startPort = "Success",
      endStory = "1731481145813580549",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1731481145813580546"] = {
      isStoryNode = true,
      key = "1731481145813580546",
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
    ["1731481145813580549"] = {
      isStoryNode = true,
      key = "1731481145813580549",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1647.3684210526317, y = 276.3157894736842},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1731481150394580688"] = {
      isStoryNode = true,
      key = "1731481150394580688",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1223.9293659055968, y = 275.13659236849287},
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
            startQuest = "1731481150394580689",
            startPort = "QuestStart",
            endQuest = "1731481215108771311",
            endPort = "In"
          },
          {
            startQuest = "1731481215108771311",
            startPort = "Out",
            endQuest = "1731481150394580692",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1731481150394580689"] = {
            key = "1731481150394580689",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1731481150394580692"] = {
            key = "1731481150394580692",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1614.2105263157896, y = 287.36842105263156},
            propsData = {ModeType = 0}
          },
          ["1731481150394580695"] = {
            key = "1731481150394580695",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1555.7894736842104, y = 551.578947368421},
            propsData = {}
          },
          ["1731481215108771311"] = {
            key = "1731481215108771311",
            type = "TalkNode",
            name = "Free - \229\143\151\228\188\1642",
            pos = {x = 1251.403050116123, y = 243.0325275334833},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11011022,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = true,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
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
