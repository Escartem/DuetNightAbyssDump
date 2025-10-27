return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630101464340810",
      startPort = "StoryStart",
      endStory = "1721630101464340812",
      endPort = "In"
    },
    {
      startStory = "1721630101464340812",
      startPort = "Success",
      endStory = "1721630101464340811",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630101464340810"] = {
      isStoryNode = true,
      key = "1721630101464340810",
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
    ["1721630101464340811"] = {
      isStoryNode = true,
      key = "1721630101464340811",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1778, y = 312},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721630101464340812"] = {
      isStoryNode = true,
      key = "1721630101464340812",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1218, y = 316},
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
        bIsNotifyGameMode = false,
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
            startQuest = "1721630101464340816",
            startPort = "Out",
            endQuest = "1721630101464340814",
            endPort = "Success"
          },
          {
            startQuest = "1721630101464340813",
            startPort = "QuestStart",
            endQuest = "1721630101464340816",
            endPort = "In"
          }
        },
        nodeData = {
          ["1721630101464340813"] = {
            key = "1721630101464340813",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1721630101464340814"] = {
            key = "1721630101464340814",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1644, y = 328},
            propsData = {ModeType = 0}
          },
          ["1721630101464340815"] = {
            key = "1721630101464340815",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1536, y = 518},
            propsData = {}
          },
          ["1721630101464340816"] = {
            key = "1721630101464340816",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1163.388888888889, y = 298.8888888888889},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 50004801,
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
                  TalkActorId = 700048,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700048}
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
