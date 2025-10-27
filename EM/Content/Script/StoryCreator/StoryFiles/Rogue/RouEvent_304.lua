return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851536989511639997",
      startPort = "StoryStart",
      endStory = "171851536989511639999",
      endPort = "In"
    },
    {
      startStory = "171851536989511639999",
      startPort = "Success",
      endStory = "171851536989511639998",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["171851536989511639997"] = {
      isStoryNode = true,
      key = "171851536989511639997",
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
    ["171851536989511639998"] = {
      isStoryNode = true,
      key = "171851536989511639998",
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
    ["171851536989511639999"] = {
      isStoryNode = true,
      key = "171851536989511639999",
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
            startQuest = "171851536989511640000",
            startPort = "QuestStart",
            endQuest = "171851536989511640003",
            endPort = "In"
          },
          {
            startQuest = "17546421126202083008",
            startPort = "Option_1",
            endQuest = "17546421126212083009",
            endPort = "In"
          },
          {
            startQuest = "17546421126202083008",
            startPort = "Option_2",
            endQuest = "17546421126212083010",
            endPort = "In"
          },
          {
            startQuest = "17546421126202083008",
            startPort = "Option_3",
            endQuest = "17546421126212083011",
            endPort = "In"
          },
          {
            startQuest = "171851536989511640003",
            startPort = "Out",
            endQuest = "171851536989511640001",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171851536989511640000"] = {
            key = "171851536989511640000",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["171851536989511640001"] = {
            key = "171851536989511640001",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["171851536989511640002"] = {
            key = "171851536989511640002",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["171851536989511640003"] = {
            key = "171851536989511640003",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1083.1679841897237, y = 352.2762917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100401,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546421126202083008"] = {
            key = "17546421126202083008",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 873.5439065578382, y = 796.652756251242},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100401,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6100404",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6100406",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6100408",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17546421126212083009"] = {
            key = "17546421126212083009",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1204.4529974669292, y = 753.0163926148782},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100405,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546421126212083010"] = {
            key = "17546421126212083010",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1202.0548783446718, y = 923.1417844644079},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100407,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546421126212083011"] = {
            key = "17546421126212083011",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1195.8640360346337, y = 1068.4836073851216},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100409,
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
