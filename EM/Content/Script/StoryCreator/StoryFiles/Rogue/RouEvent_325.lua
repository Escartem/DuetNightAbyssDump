return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1754303988208560413",
      startPort = "StoryStart",
      endStory = "1754303988208560415",
      endPort = "In"
    },
    {
      startStory = "1754303988208560415",
      startPort = "Success",
      endStory = "1754303988208560414",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1754303988208560413"] = {
      isStoryNode = true,
      key = "1754303988208560413",
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
    ["1754303988208560414"] = {
      isStoryNode = true,
      key = "1754303988208560414",
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
    ["1754303988208560415"] = {
      isStoryNode = true,
      key = "1754303988208560415",
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
            startQuest = "1754303988208560416",
            startPort = "QuestStart",
            endQuest = "1754303988208560419",
            endPort = "In"
          },
          {
            startQuest = "17545536098551009319",
            startPort = "Option_1",
            endQuest = "17545536098551009320",
            endPort = "In"
          },
          {
            startQuest = "17545536098551009319",
            startPort = "Option_2",
            endQuest = "17545536098551009321",
            endPort = "In"
          },
          {
            startQuest = "1754303988208560419",
            startPort = "Out",
            endQuest = "1754303988208560417",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1754303988208560416"] = {
            key = "1754303988208560416",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1754303988208560417"] = {
            key = "1754303988208560417",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1754303988208560418"] = {
            key = "1754303988208560418",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1754303988208560419"] = {
            key = "1754303988208560419",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1072.9179841897237, y = 327.5262917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102601,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17545536098551009319"] = {
            key = "17545536098551009319",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 926.6316074276601, y = 726.2879534258846},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102601,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6102604",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6102608",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17545536098551009320"] = {
            key = "17545536098551009320",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1262.9692697653225, y = 680.2230183609495},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102605,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17545536098551009321"] = {
            key = "17545536098551009321",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1259.1425792144937, y = 852.7769816390505},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102609,
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
