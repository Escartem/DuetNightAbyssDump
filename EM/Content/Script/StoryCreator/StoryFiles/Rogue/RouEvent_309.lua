return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630102187388739",
      startPort = "StoryStart",
      endStory = "1721630102187388741",
      endPort = "In"
    },
    {
      startStory = "1721630102187388741",
      startPort = "Success",
      endStory = "1721630102187388740",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630102187388739"] = {
      isStoryNode = true,
      key = "1721630102187388739",
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
    ["1721630102187388740"] = {
      isStoryNode = true,
      key = "1721630102187388740",
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
    ["1721630102187388741"] = {
      isStoryNode = true,
      key = "1721630102187388741",
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
            startQuest = "1721630102187388742",
            startPort = "QuestStart",
            endQuest = "1721630102187388745",
            endPort = "In"
          },
          {
            startQuest = "17546424732555057041",
            startPort = "Option_1",
            endQuest = "17546424732555057042",
            endPort = "In"
          },
          {
            startQuest = "17546424732555057041",
            startPort = "Option_2",
            endQuest = "17546424732555057043",
            endPort = "In"
          },
          {
            startQuest = "1721630102187388745",
            startPort = "Out",
            endQuest = "1721630102187388743",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1721630102187388742"] = {
            key = "1721630102187388742",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1721630102187388743"] = {
            key = "1721630102187388743",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1721630102187388744"] = {
            key = "1721630102187388744",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1721630102187388745"] = {
            key = "1721630102187388745",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1091.6679841897237, y = 361.0262917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100901,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546424732555057041"] = {
            key = "17546424732555057041",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 928.4204545454545, y = 759.157001044932},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100901,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6100909",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6100911",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17546424732555057042"] = {
            key = "17546424732555057042",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1263.3295454545455, y = 714.5206374085685},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100910,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546424732555057043"] = {
            key = "17546424732555057043",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1260.931426332288, y = 885.6460292580981},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100912,
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
