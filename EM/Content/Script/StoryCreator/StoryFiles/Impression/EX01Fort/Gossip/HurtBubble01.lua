return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1731480891894200073",
      startPort = "StoryStart",
      endStory = "1731480901627200576",
      endPort = "In"
    },
    {
      startStory = "1731480901627200576",
      startPort = "Success",
      endStory = "1731480891894200076",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1731480891894200073"] = {
      isStoryNode = true,
      key = "1731480891894200073",
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
    ["1731480891894200076"] = {
      isStoryNode = true,
      key = "1731480891894200076",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1490.7142857142858, y = 326.7857142857143},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1731480901627200576"] = {
      isStoryNode = true,
      key = "1731480901627200576",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1127.0434226472278, y = 300.5540490536842},
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
            startQuest = "1731480901627200577",
            startPort = "QuestStart",
            endQuest = "1731481086321580060",
            endPort = "In"
          },
          {
            startQuest = "1731481086321580060",
            startPort = "Out",
            endQuest = "1731480901627200580",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1731480901627200577"] = {
            key = "1731480901627200577",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1731480901627200580"] = {
            key = "1731480901627200580",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1566.842105263158, y = 302.82894736842104},
            propsData = {ModeType = 0}
          },
          ["1731480901627200583"] = {
            key = "1731480901627200583",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1731481086321580060"] = {
            key = "1731481086321580060",
            type = "TalkNode",
            name = "Free - \229\143\151\228\188\1643",
            pos = {x = 1254.5609448529651, y = 266.15314156857113},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11011024,
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
