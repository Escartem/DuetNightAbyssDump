return {
  storyName = "\230\156\170\229\145\189\229\144\141\230\149\133\228\186\139",
  storyDescription = "",
  lineData = {
    {
      startStory = "story_16842233096333656",
      startPort = "StoryStart",
      endStory = "story_16842233096333660",
      endPort = "In"
    },
    {
      startStory = "story_16842233096333660",
      startPort = "Success",
      endStory = "story_16842233096333658",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    story_16842233096333656 = {
      isStoryNode = true,
      key = "story_16842233096333656",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 100, y = 140},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_16842233096333658 = {
      isStoryNode = true,
      key = "story_16842233096333658",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 400, y = 140},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_16842233096333660 = {
      isStoryNode = true,
      key = "story_16842233096333660",
      type = "StoryNode",
      name = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
      pos = {x = 300, y = 140},
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
            startQuest = "quest_16842233096343664",
            startPort = "QuestStart",
            endQuest = "quest_16842233096343672",
            endPort = "In"
          },
          {
            startQuest = "quest_16842233096343672",
            startPort = "Out",
            endQuest = "quest_16842233096343666",
            endPort = "Success"
          }
        },
        nodeData = {
          quest_16842233096343664 = {
            key = "quest_16842233096343664",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100, y = 140},
            propsData = {ModeType = 0}
          },
          quest_16842233096343666 = {
            key = "quest_16842233096343666",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1500, y = 140},
            propsData = {ModeType = 0}
          },
          quest_16842233096343668 = {
            key = "quest_16842233096343668",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          quest_16842233096343672 = {
            key = "quest_16842233096343672",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 300, y = 140},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10401,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = true,
              GuideTalkStyle = "Normal",
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
