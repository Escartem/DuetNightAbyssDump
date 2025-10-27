return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "173770571186022469317",
      startPort = "StoryStart",
      endStory = "173770571186022469319",
      endPort = "In"
    },
    {
      startStory = "173770571186022469319",
      startPort = "Success",
      endStory = "173770571186022469318",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["173770571186022469317"] = {
      isStoryNode = true,
      key = "173770571186022469317",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1458, y = 322},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["173770571186022469318"] = {
      isStoryNode = true,
      key = "173770571186022469318",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2076.086956521739, y = 314.3478260869565},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["173770571186022469319"] = {
      isStoryNode = true,
      key = "173770571186022469319",
      type = "StoryNode",
      name = "Lise\230\148\190\231\189\174",
      pos = {x = 1758.0112201963532, y = 308.5974754558205},
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
            startQuest = "173770571186022469320",
            startPort = "QuestStart",
            endQuest = "173770571186022469323",
            endPort = "In"
          },
          {
            startQuest = "173770571186022469323",
            startPort = "Out",
            endQuest = "173770571186022469321",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173770571186022469320"] = {
            key = "173770571186022469320",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173770571186022469321"] = {
            key = "173770571186022469321",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1431.1818181818182, y = 295.45454545454544},
            propsData = {ModeType = 0}
          },
          ["173770571186022469322"] = {
            key = "173770571186022469322",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173770571186022469323"] = {
            key = "173770571186022469323",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1105.6363636363635, y = 287.909090909091},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90210000,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
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
