return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17345137775732046922",
      startPort = "StoryStart",
      endStory = "17345137783432046956",
      endPort = "In"
    },
    {
      startStory = "17345137783432046956",
      startPort = "Success",
      endStory = "17345137775732046925",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17345137775732046922"] = {
      isStoryNode = true,
      key = "17345137775732046922",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1248, y = 210},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17345137775732046925"] = {
      isStoryNode = true,
      key = "17345137775732046925",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1902.6666666666667, y = 198.66666666666666},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17345137783432046956"] = {
      isStoryNode = true,
      key = "17345137783432046956",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1570, y = 203.99999999999997},
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
            startQuest = "17345137783432046960",
            startPort = "QuestStart",
            endQuest = "17345137783432046963",
            endPort = "In"
          },
          {
            startQuest = "17345137783432046963",
            startPort = "Out",
            endQuest = "17345137783432046961",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17345137783432046960"] = {
            key = "17345137783432046960",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 950, y = 290},
            propsData = {ModeType = 0}
          },
          ["17345137783432046961"] = {
            key = "17345137783432046961",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1566.842105263158, y = 302.82894736842104},
            propsData = {ModeType = 0}
          },
          ["17345137783432046962"] = {
            key = "17345137783432046962",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17345137783432046963"] = {
            key = "17345137783432046963",
            type = "TalkNode",
            name = "Free - \229\143\151\228\188\1643",
            pos = {x = 1254.5609448529651, y = 268.15314156857113},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11010627,
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
