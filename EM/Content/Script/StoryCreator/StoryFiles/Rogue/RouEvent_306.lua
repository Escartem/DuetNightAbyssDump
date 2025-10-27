return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851536991211640202",
      startPort = "StoryStart",
      endStory = "171851536991211640204",
      endPort = "In"
    },
    {
      startStory = "171851536991211640204",
      startPort = "Success",
      endStory = "171851536991211640203",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["171851536991211640202"] = {
      isStoryNode = true,
      key = "171851536991211640202",
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
    ["171851536991211640203"] = {
      isStoryNode = true,
      key = "171851536991211640203",
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
    ["171851536991211640204"] = {
      isStoryNode = true,
      key = "171851536991211640204",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1167.8500000000001, y = 294.894671169903},
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
            startQuest = "171851536991211640205",
            startPort = "QuestStart",
            endQuest = "171851536991211640208",
            endPort = "In"
          },
          {
            startQuest = "17546422968173272691",
            startPort = "Option_1",
            endQuest = "17546422968173272692",
            endPort = "In"
          },
          {
            startQuest = "17546422968173272691",
            startPort = "Option_2",
            endQuest = "17546422968173272693",
            endPort = "In"
          },
          {
            startQuest = "171851536991211640208",
            startPort = "Out",
            endQuest = "171851536991211640206",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171851536991211640205"] = {
            key = "171851536991211640205",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["171851536991211640206"] = {
            key = "171851536991211640206",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["171851536991211640207"] = {
            key = "171851536991211640207",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["171851536991211640208"] = {
            key = "171851536991211640208",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1061.591897233202, y = 356.6784656363064},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100601,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546422968173272691"] = {
            key = "17546422968173272691",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 928.175889328063, y = 759.4214937985555},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100601,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6100604",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6100613",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17546422968173272692"] = {
            key = "17546422968173272692",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1259.084980237154, y = 715.7851301621918},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100605,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546422968173272693"] = {
            key = "17546422968173272693",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1256.6868611148966, y = 885.9105220117215},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100614,
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
