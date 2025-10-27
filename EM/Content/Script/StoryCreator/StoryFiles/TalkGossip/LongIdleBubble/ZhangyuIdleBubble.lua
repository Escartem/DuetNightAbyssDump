return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "173770517510210453924",
      startPort = "StoryStart",
      endStory = "173770517510210453926",
      endPort = "In"
    },
    {
      startStory = "173770517510210453926",
      startPort = "Success",
      endStory = "173770517510210453925",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["173770517510210453924"] = {
      isStoryNode = true,
      key = "173770517510210453924",
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
    ["173770517510210453925"] = {
      isStoryNode = true,
      key = "173770517510210453925",
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
    ["173770517510210453926"] = {
      isStoryNode = true,
      key = "173770517510210453926",
      type = "StoryNode",
      name = "\231\171\160\233\177\188\230\148\190\231\189\174",
      pos = {x = 1759.0434782608693, y = 309.5652173913043},
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
            startQuest = "173770517510210453927",
            startPort = "QuestStart",
            endQuest = "173770517510210453930",
            endPort = "In"
          },
          {
            startQuest = "173770517510210453930",
            startPort = "Out",
            endQuest = "173770517510210453928",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173770517510210453927"] = {
            key = "173770517510210453927",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173770517510210453928"] = {
            key = "173770517510210453928",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1431.1818181818182, y = 295.45454545454544},
            propsData = {ModeType = 0}
          },
          ["173770517510210453929"] = {
            key = "173770517510210453929",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173770517510210453930"] = {
            key = "173770517510210453930",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1105.6363636363635, y = 287.909090909091},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90050000,
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
