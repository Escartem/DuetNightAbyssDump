return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17370336555793086232",
      startPort = "StoryStart",
      endStory = "17370336555793086234",
      endPort = "In"
    },
    {
      startStory = "17370336555793086234",
      startPort = "Success",
      endStory = "17370336555793086233",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17370336555793086232"] = {
      isStoryNode = true,
      key = "17370336555793086232",
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
    ["17370336555793086233"] = {
      isStoryNode = true,
      key = "17370336555793086233",
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
    ["17370336555793086234"] = {
      isStoryNode = true,
      key = "17370336555793086234",
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
            startQuest = "17370336555793086235",
            startPort = "QuestStart",
            endQuest = "17370336555793086238",
            endPort = "In"
          },
          {
            startQuest = "175464525547018146980",
            startPort = "Option_1",
            endQuest = "175464525547018146981",
            endPort = "In"
          },
          {
            startQuest = "17370336555793086238",
            startPort = "Out",
            endQuest = "17370336555793086236",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17370336555793086235"] = {
            key = "17370336555793086235",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["17370336555793086236"] = {
            key = "17370336555793086236",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["17370336555793086237"] = {
            key = "17370336555793086237",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 713.3441558441558},
            propsData = {}
          },
          ["17370336555793086238"] = {
            key = "17370336555793086238",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1071.701263410503, y = 357.69674626871745},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200201,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464525547018146980"] = {
            key = "175464525547018146980",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 988.145003999624, y = 546.314282225268},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200201,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6200218",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["175464525547018146981"] = {
            key = "175464525547018146981",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1345.271662667043, y = 593.9357177747322},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200219,
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
