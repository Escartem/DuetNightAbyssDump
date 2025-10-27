return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630102179388637",
      startPort = "StoryStart",
      endStory = "1721630102179388639",
      endPort = "In"
    },
    {
      startStory = "1721630102179388639",
      startPort = "Success",
      endStory = "1721630102179388638",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630102179388637"] = {
      isStoryNode = true,
      key = "1721630102179388637",
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
    ["1721630102179388638"] = {
      isStoryNode = true,
      key = "1721630102179388638",
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
    ["1721630102179388639"] = {
      isStoryNode = true,
      key = "1721630102179388639",
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
            startQuest = "1721630102179388640",
            startPort = "QuestStart",
            endQuest = "1721630102179388643",
            endPort = "In"
          },
          {
            startQuest = "17546424206174462234",
            startPort = "Option_1",
            endQuest = "17546424206174462235",
            endPort = "In"
          },
          {
            startQuest = "17546424206174462234",
            startPort = "Option_2",
            endQuest = "17546424206174462236",
            endPort = "In"
          },
          {
            startQuest = "1721630102179388643",
            startPort = "Out",
            endQuest = "1721630102179388641",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1721630102179388640"] = {
            key = "1721630102179388640",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1721630102179388641"] = {
            key = "1721630102179388641",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1721630102179388642"] = {
            key = "1721630102179388642",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1721630102179388643"] = {
            key = "1721630102179388643",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1108.1102918820313, y = 353.71859941557057},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100801,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546424206174462234"] = {
            key = "17546424206174462234",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 898.716093117409, y = 754.8613011308112},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100801,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6100805",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6100808",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17546424206174462235"] = {
            key = "17546424206174462235",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1233.6251840265, y = 710.2249374944477},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100806,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546424206174462236"] = {
            key = "17546424206174462236",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1231.2270649042425, y = 881.3503293439773},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100809,
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
