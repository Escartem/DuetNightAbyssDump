return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17512707957415992373",
      startPort = "StoryStart",
      endStory = "17512707957415992375",
      endPort = "In"
    },
    {
      startStory = "17512707957415992375",
      startPort = "Success",
      endStory = "17512707957415992374",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17512707957415992373"] = {
      isStoryNode = true,
      key = "17512707957415992373",
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
    ["17512707957415992374"] = {
      isStoryNode = true,
      key = "17512707957415992374",
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
    ["17512707957415992375"] = {
      isStoryNode = true,
      key = "17512707957415992375",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1826, y = 552},
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
            startQuest = "17512707957415992376",
            startPort = "QuestStart",
            endQuest = "17512707957415992379",
            endPort = "In"
          },
          {
            startQuest = "17512707957415992379",
            startPort = "Out",
            endQuest = "17512707957415992377",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17512707957415992376"] = {
            key = "17512707957415992376",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17512707957415992377"] = {
            key = "17512707957415992377",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17512707957415992378"] = {
            key = "17512707957415992378",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17512707957415992379"] = {
            key = "17512707957415992379",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1826, y = 616},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51012001,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = true,
              BubblePlayCD = 15,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700340,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700340}
              },
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
