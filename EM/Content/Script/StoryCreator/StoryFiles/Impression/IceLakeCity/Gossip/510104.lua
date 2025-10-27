return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17512707957405991922",
      startPort = "StoryStart",
      endStory = "17512707957405991924",
      endPort = "In"
    },
    {
      startStory = "17512707957405991924",
      startPort = "Success",
      endStory = "17512707957405991923",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17512707957405991922"] = {
      isStoryNode = true,
      key = "17512707957405991922",
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
    ["17512707957405991923"] = {
      isStoryNode = true,
      key = "17512707957405991923",
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
    ["17512707957405991924"] = {
      isStoryNode = true,
      key = "17512707957405991924",
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
            startQuest = "17512707957405991925",
            startPort = "QuestStart",
            endQuest = "17512707957405991928",
            endPort = "In"
          },
          {
            startQuest = "17512707957405991928",
            startPort = "Out",
            endQuest = "17512707957405991926",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17512707957405991925"] = {
            key = "17512707957405991925",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17512707957405991926"] = {
            key = "17512707957405991926",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17512707957405991927"] = {
            key = "17512707957405991927",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17512707957405991928"] = {
            key = "17512707957405991928",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1826, y = 616},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51010401,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "StayOnLast",
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
                  TalkActorId = 700345,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700345}
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
