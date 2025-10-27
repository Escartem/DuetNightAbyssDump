return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17510167355884930711",
      startPort = "StoryStart",
      endStory = "17510167381354930811",
      endPort = "In"
    },
    {
      startStory = "17510167381354930811",
      startPort = "Success",
      endStory = "17510167355884930714",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17510167355884930711"] = {
      isStoryNode = true,
      key = "17510167355884930711",
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
    ["17510167355884930714"] = {
      isStoryNode = true,
      key = "17510167355884930714",
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
    ["17510167381354930811"] = {
      isStoryNode = true,
      key = "17510167381354930811",
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
            startQuest = "17510167381354930812",
            startPort = "QuestStart",
            endQuest = "17510167454304931026",
            endPort = "In"
          },
          {
            startQuest = "17510167454304931026",
            startPort = "Out",
            endQuest = "17510167381354930815",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17510167381354930812"] = {
            key = "17510167381354930812",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17510167381354930815"] = {
            key = "17510167381354930815",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17510167381354930818"] = {
            key = "17510167381354930818",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17510167454304931026"] = {
            key = "17510167454304931026",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1828, y = 616},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51010201,
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
                  TalkActorId = 700342,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700342}
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
