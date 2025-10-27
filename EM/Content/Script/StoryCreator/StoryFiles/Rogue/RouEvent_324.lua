return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1754303988208560293",
      startPort = "StoryStart",
      endStory = "1754303988208560295",
      endPort = "In"
    },
    {
      startStory = "1754303988208560295",
      startPort = "Success",
      endStory = "1754303988208560294",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1754303988208560293"] = {
      isStoryNode = true,
      key = "1754303988208560293",
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
    ["1754303988208560294"] = {
      isStoryNode = true,
      key = "1754303988208560294",
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
    ["1754303988208560295"] = {
      isStoryNode = true,
      key = "1754303988208560295",
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
            startQuest = "1754303988208560296",
            startPort = "QuestStart",
            endQuest = "1754303988208560299",
            endPort = "In"
          },
          {
            startQuest = "175464444853313981497",
            startPort = "Option_1",
            endQuest = "175464444853313981498",
            endPort = "In"
          },
          {
            startQuest = "175464444853313981497",
            startPort = "Option_2",
            endQuest = "175464444853313981499",
            endPort = "In"
          },
          {
            startQuest = "1754303988208560299",
            startPort = "Out",
            endQuest = "1754303988208560297",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1754303988208560296"] = {
            key = "1754303988208560296",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1754303988208560297"] = {
            key = "1754303988208560297",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1754303988208560298"] = {
            key = "1754303988208560298",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1754303988208560299"] = {
            key = "1754303988208560299",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1117.591897233202, y = 357.6462075717902},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102501,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464444853313981497"] = {
            key = "175464444853313981497",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 958.0233885108028, y = 662.9113017686909},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102501,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6102502",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6102506",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["175464444853313981498"] = {
            key = "175464444853313981498",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1294.361050848465, y = 615.878624768272},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102503,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464444853313981499"] = {
            key = "175464444853313981499",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1290.5343602976363, y = 788.4325880463731},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102507,
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
