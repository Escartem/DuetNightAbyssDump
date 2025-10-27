return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1744877992963544710",
      startPort = "StoryStart",
      endStory = "1744877993663544744",
      endPort = "In"
    },
    {
      startStory = "1744877993663544744",
      startPort = "Success",
      endStory = "1744877992963544713",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1744877992963544710"] = {
      isStoryNode = true,
      key = "1744877992963544710",
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
    ["1744877992963544713"] = {
      isStoryNode = true,
      key = "1744877992963544713",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2800, y = 300},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1744877993663544744"] = {
      isStoryNode = true,
      key = "1744877993663544744",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1294, y = 238},
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
            startQuest = "1744877993663544749",
            startPort = "QuestStart",
            endQuest = "1744877993663544752",
            endPort = "In"
          },
          {
            startQuest = "1744877993663544752",
            startPort = "Out",
            endQuest = "1744877993663544750",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1744877993663544749"] = {
            key = "1744877993663544749",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1744877993663544750"] = {
            key = "1744877993663544750",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1566.842105263158, y = 302.82894736842104},
            propsData = {ModeType = 0}
          },
          ["1744877993663544751"] = {
            key = "1744877993663544751",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1744877993663544752"] = {
            key = "1744877993663544752",
            type = "TalkNode",
            name = "Free - \229\143\151\228\188\1643",
            pos = {x = 1258.5609448529651, y = 266.15314156857113},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11010626,
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
