return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1754303988209560653",
      startPort = "StoryStart",
      endStory = "1754303988209560655",
      endPort = "In"
    },
    {
      startStory = "1754303988209560655",
      startPort = "Success",
      endStory = "1754303988209560654",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1754303988209560653"] = {
      isStoryNode = true,
      key = "1754303988209560653",
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
    ["1754303988209560654"] = {
      isStoryNode = true,
      key = "1754303988209560654",
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
    ["1754303988209560655"] = {
      isStoryNode = true,
      key = "1754303988209560655",
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
            startQuest = "1754303988209560656",
            startPort = "QuestStart",
            endQuest = "1754303988209560659",
            endPort = "In"
          },
          {
            startQuest = "175464454451915171646",
            startPort = "Option_1",
            endQuest = "175464454451915171647",
            endPort = "In"
          },
          {
            startQuest = "175464454451915171646",
            startPort = "Option_2",
            endQuest = "175464454451915171648",
            endPort = "In"
          },
          {
            startQuest = "1754303988209560659",
            startPort = "Out",
            endQuest = "1754303988209560657",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1754303988209560656"] = {
            key = "1754303988209560656",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1754303988209560657"] = {
            key = "1754303988209560657",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1754303988209560658"] = {
            key = "1754303988209560658",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1754303988209560659"] = {
            key = "1754303988209560659",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1066.6679841897237, y = 356.0262917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102801,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464454451915171646"] = {
            key = "175464454451915171646",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 907.6272214627479, y = 676.2879534258846},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102801,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6102808",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6102811",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["175464454451915171647"] = {
            key = "175464454451915171647",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1243.9648838004102, y = 630.2230183609495},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102809,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464454451915171648"] = {
            key = "175464454451915171648",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1240.1381932495815, y = 802.7769816390506},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102812,
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
