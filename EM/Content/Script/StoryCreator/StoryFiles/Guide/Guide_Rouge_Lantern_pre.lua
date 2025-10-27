return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17220576913277569",
      startPort = "StoryStart",
      endStory = "17220576930467595",
      endPort = "In"
    },
    {
      startStory = "17220576930467595",
      startPort = "Success",
      endStory = "17220576913287572",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17220576913277569"] = {
      isStoryNode = true,
      key = "17220576913277569",
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
    ["17220576913287572"] = {
      isStoryNode = true,
      key = "17220576913287572",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1742.857142857143, y = 307.14285714285717},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17220576930467595"] = {
      isStoryNode = true,
      key = "17220576930467595",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1234.4933252039084, y = 281.6911060081542},
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
            startQuest = "17220576930467596",
            startPort = "QuestStart",
            endQuest = "17220577029167894",
            endPort = "In"
          },
          {
            startQuest = "17220577029167894",
            startPort = "Out",
            endQuest = "172205860903010231",
            endPort = "Input"
          },
          {
            startQuest = "172205860903010231",
            startPort = "Out",
            endQuest = "17220576930477599",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17220576930467596"] = {
            key = "17220576930467596",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17220576930477599"] = {
            key = "17220576930477599",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2291.4285714285716, y = 330},
            propsData = {ModeType = 0}
          },
          ["17220576930477602"] = {
            key = "17220576930477602",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17220577029167894"] = {
            key = "17220577029167894",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1382.4845532740837, y = 332.88659472995863},
            propsData = {WaitTime = 0.5}
          },
          ["172205860903010231"] = {
            key = "172205860903010231",
            type = "TestPrintNode",
            name = "\230\181\139\232\175\149\230\137\147\229\141\176",
            pos = {x = 1763.6498193805262, y = 336.67459414024904},
            propsData = {
              Text = "tyx2025\229\174\140\230\136\144"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
