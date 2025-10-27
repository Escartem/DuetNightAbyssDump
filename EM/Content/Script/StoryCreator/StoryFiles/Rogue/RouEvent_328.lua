return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17546503285961385783",
      startPort = "StoryStart",
      endStory = "17546503285961385785",
      endPort = "In"
    },
    {
      startStory = "17546503285961385785",
      startPort = "Success",
      endStory = "17546503285961385784",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17546503285961385783"] = {
      isStoryNode = true,
      key = "17546503285961385783",
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
    ["17546503285961385784"] = {
      isStoryNode = true,
      key = "17546503285961385784",
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
    ["17546503285961385785"] = {
      isStoryNode = true,
      key = "17546503285961385785",
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
            startQuest = "17546503285961385786",
            startPort = "QuestStart",
            endQuest = "17546503285961385789",
            endPort = "In"
          },
          {
            startQuest = "17546503285961385789",
            startPort = "Out",
            endQuest = "17546503285961385787",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17546503285961385786"] = {
            key = "17546503285961385786",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["17546503285961385787"] = {
            key = "17546503285961385787",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["17546503285961385788"] = {
            key = "17546503285961385788",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["17546503285961385789"] = {
            key = "17546503285961385789",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1066.6679841897237, y = 356.0262917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6103001,
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
