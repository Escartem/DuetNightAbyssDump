return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175490527999910666446",
      startPort = "StoryStart",
      endStory = "175490527999910666448",
      endPort = "In"
    },
    {
      startStory = "175490527999910666448",
      startPort = "Success",
      endStory = "175490527999910666447",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["175490527999910666446"] = {
      isStoryNode = true,
      key = "175490527999910666446",
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
    ["175490527999910666447"] = {
      isStoryNode = true,
      key = "175490527999910666447",
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
    ["175490527999910666448"] = {
      isStoryNode = true,
      key = "175490527999910666448",
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
            startQuest = "175490527999910666449",
            startPort = "QuestStart",
            endQuest = "175490527999910666452",
            endPort = "In"
          },
          {
            startQuest = "175490527999910666452",
            startPort = "Out",
            endQuest = "175490527999910666450",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175490527999910666449"] = {
            key = "175490527999910666449",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["175490527999910666450"] = {
            key = "175490527999910666450",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["175490527999910666451"] = {
            key = "175490527999910666451",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 713.3441558441558},
            propsData = {}
          },
          ["175490527999910666452"] = {
            key = "175490527999910666452",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1046.0876270468666, y = 321.1512917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6201801,
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
