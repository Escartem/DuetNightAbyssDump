return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17370338708858923220",
      startPort = "StoryStart",
      endStory = "17370338708858923222",
      endPort = "In"
    },
    {
      startStory = "17370338708858923222",
      startPort = "Success",
      endStory = "17370338708858923221",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17370338708858923220"] = {
      isStoryNode = true,
      key = "17370338708858923220",
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
    ["17370338708858923221"] = {
      isStoryNode = true,
      key = "17370338708858923221",
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
    ["17370338708858923222"] = {
      isStoryNode = true,
      key = "17370338708858923222",
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
            startQuest = "17370338708858923223",
            startPort = "QuestStart",
            endQuest = "17370338708858923226",
            endPort = "In"
          },
          {
            startQuest = "175464533338619336968",
            startPort = "Option_1",
            endQuest = "175464533338619336969",
            endPort = "In"
          },
          {
            startQuest = "17370338708858923226",
            startPort = "Out",
            endQuest = "17370338708858923224",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17370338708858923223"] = {
            key = "17370338708858923223",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["17370338708858923224"] = {
            key = "17370338708858923224",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["17370338708858923225"] = {
            key = "17370338708858923225",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 713.3441558441558},
            propsData = {}
          },
          ["17370338708858923226"] = {
            key = "17370338708858923226",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1046.0876270468666, y = 321.1512917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200401,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464533338619336968"] = {
            key = "175464533338619336968",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 961.1851178712593, y = 596.4263323604873},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200401,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6200427",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["175464533338619336969"] = {
            key = "175464533338619336969",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1253.5974908243927, y = 631.7750406372243},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200428,
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
