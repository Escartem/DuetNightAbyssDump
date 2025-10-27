return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1754303988206559933",
      startPort = "StoryStart",
      endStory = "1754303988206559935",
      endPort = "In"
    },
    {
      startStory = "1754303988206559935",
      startPort = "Success",
      endStory = "1754303988206559934",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1754303988206559933"] = {
      isStoryNode = true,
      key = "1754303988206559933",
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
    ["1754303988206559934"] = {
      isStoryNode = true,
      key = "1754303988206559934",
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
    ["1754303988206559935"] = {
      isStoryNode = true,
      key = "1754303988206559935",
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
            startQuest = "1754303988206559936",
            startPort = "QuestStart",
            endQuest = "1754303988206559939",
            endPort = "In"
          },
          {
            startQuest = "175464428012612195995",
            startPort = "Option_1",
            endQuest = "175464428012612195996",
            endPort = "In"
          },
          {
            startQuest = "175464428012612195995",
            startPort = "Option_2",
            endQuest = "175464428012612195997",
            endPort = "In"
          },
          {
            startQuest = "1754303988206559939",
            startPort = "Out",
            endQuest = "1754303988206559937",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1754303988206559936"] = {
            key = "1754303988206559936",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1754303988206559937"] = {
            key = "1754303988206559937",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1754303988206559938"] = {
            key = "1754303988206559938",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1754303988206559939"] = {
            key = "1754303988206559939",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1119.4179841897237, y = 350.0262917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102201,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464428012612195995"] = {
            key = "175464428012612195995",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1056.502221462748, y = 736.5379534258846},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102201,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6102204",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6102208",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["175464428012612195996"] = {
            key = "175464428012612195996",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1392.8398838004102, y = 690.4730183609495},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102205,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464428012612195997"] = {
            key = "175464428012612195997",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1389.0131932495815, y = 863.0269816390505},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102209,
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
