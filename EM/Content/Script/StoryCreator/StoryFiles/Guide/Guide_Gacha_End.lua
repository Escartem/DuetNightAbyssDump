return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171343280817923364",
      startPort = "StoryStart",
      endStory = "171343281002623414",
      endPort = "In"
    },
    {
      startStory = "171343281002623414",
      startPort = "Success",
      endStory = "171343280817923367",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["171343280817923364"] = {
      isStoryNode = true,
      key = "171343280817923364",
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
    ["171343280817923367"] = {
      isStoryNode = true,
      key = "171343280817923367",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1502.5, y = 303},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["171343281002623414"] = {
      isStoryNode = true,
      key = "171343281002623414",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1120.7126452452374, y = 273.03391399003635},
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
            startQuest = "171343281002623415",
            startPort = "QuestStart",
            endQuest = "171343281793523804",
            endPort = "In"
          },
          {
            startQuest = "171343281793523804",
            startPort = "Out",
            endQuest = "171343281002623417",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171343281002623415"] = {
            key = "171343281002623415",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["171343281002623417"] = {
            key = "171343281002623417",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1605.2173913043478, y = 323.47826086956525},
            propsData = {ModeType = 0}
          },
          ["171343281002623419"] = {
            key = "171343281002623419",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["171343281793523804"] = {
            key = "171343281793523804",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1237.7863705283448, y = 314.5806780573953},
            propsData = {WaitTime = 0.01}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
