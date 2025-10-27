return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851536988011639809",
      startPort = "StoryStart",
      endStory = "171851536988011639811",
      endPort = "In"
    },
    {
      startStory = "171851536988011639811",
      startPort = "Success",
      endStory = "171851536988011639810",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["171851536988011639809"] = {
      isStoryNode = true,
      key = "171851536988011639809",
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
    ["171851536988011639810"] = {
      isStoryNode = true,
      key = "171851536988011639810",
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
    ["171851536988011639811"] = {
      isStoryNode = true,
      key = "171851536988011639811",
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
            startQuest = "171851536988011639812",
            startPort = "QuestStart",
            endQuest = "171851536988011639815",
            endPort = "In"
          },
          {
            startQuest = "171851536988011639815",
            startPort = "Out",
            endQuest = "171851536988011639813",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171851536988011639812"] = {
            key = "171851536988011639812",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["171851536988011639813"] = {
            key = "171851536988011639813",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1309.4405594405596, y = 332.83216783216784},
            propsData = {ModeType = 0}
          },
          ["171851536988011639814"] = {
            key = "171851536988011639814",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["171851536988011639815"] = {
            key = "171851536988011639815",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 949.4179841897237, y = 311.0262917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100201,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1754641943386893556"] = {
            key = "1754641943386893556",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 953.5333333333333, y = 570.121052631579},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100201,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6100209",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6100210",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
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
