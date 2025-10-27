return {
  storyName = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
  storyDescription = "",
  lineData = {
    {
      startStory = "story_16944216509910",
      startPort = "StoryStart",
      endStory = "story_16944216528124",
      endPort = "In"
    },
    {
      startStory = "story_16944216528124",
      startPort = "Success",
      endStory = "story_16944216509922",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    story_16944216509910 = {
      isStoryNode = true,
      key = "story_16944216509910",
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
    story_16944216509922 = {
      isStoryNode = true,
      key = "story_16944216509922",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 703, y = 154},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_16944216528124 = {
      isStoryNode = true,
      key = "story_16944216528124",
      type = "StoryNode",
      name = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
      pos = {x = 402, y = 143},
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
            startQuest = "quest_169442166313216",
            startPort = "Out",
            endQuest = "quest_169442165281310",
            endPort = "Success"
          },
          {
            startQuest = "quest_16944216528138",
            startPort = "QuestStart",
            endQuest = "quest_169442221398021",
            endPort = "In"
          },
          {
            startQuest = "quest_169442221398021",
            startPort = "Out",
            endQuest = "quest_169442166313216",
            endPort = "In"
          }
        },
        nodeData = {
          quest_16944216528138 = {
            key = "quest_16944216528138",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100, y = 140},
            propsData = {ModeType = 0}
          },
          quest_169442165281310 = {
            key = "quest_169442165281310",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1500, y = 140},
            propsData = {ModeType = 0}
          },
          quest_169442165281312 = {
            key = "quest_169442165281312",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          quest_169442166313216 = {
            key = "quest_169442166313216",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 796, y = 207},
            propsData = {GuideId = 6}
          },
          quest_169442221398021 = {
            key = "quest_169442221398021",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 418, y = 191},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
