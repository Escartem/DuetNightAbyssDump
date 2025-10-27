return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175490530825311863964",
      startPort = "StoryStart",
      endStory = "175490530825311863966",
      endPort = "In"
    },
    {
      startStory = "175490530825311863966",
      startPort = "Success",
      endStory = "175490530825311863965",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["175490530825311863964"] = {
      isStoryNode = true,
      key = "175490530825311863964",
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
    ["175490530825311863965"] = {
      isStoryNode = true,
      key = "175490530825311863965",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1624.5454545454545, y = 313.6363636363636},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["175490530825311863966"] = {
      isStoryNode = true,
      key = "175490530825311863966",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1168.8500000000001, y = 292.894671169903},
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
            startQuest = "175490530825311863967",
            startPort = "QuestStart",
            endQuest = "175490530825311863970",
            endPort = "In"
          },
          {
            startQuest = "175490530825311863970",
            startPort = "Out",
            endQuest = "175490530825311863968",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175490530825311863967"] = {
            key = "175490530825311863967",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["175490530825311863968"] = {
            key = "175490530825311863968",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["175490530825311863969"] = {
            key = "175490530825311863969",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 713.3441558441558},
            propsData = {}
          },
          ["175490530825311863970"] = {
            key = "175490530825311863970",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1046.0876270468666, y = 321.1512917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6201901,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
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
