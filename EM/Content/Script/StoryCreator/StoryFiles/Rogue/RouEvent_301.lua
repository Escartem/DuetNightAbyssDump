return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1715072959561413508",
      startPort = "StoryStart",
      endStory = "1715072964430413634",
      endPort = "In"
    },
    {
      startStory = "1715072964430413634",
      startPort = "Success",
      endStory = "1715072959561413511",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1715072959561413508"] = {
      isStoryNode = true,
      key = "1715072959561413508",
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
    ["1715072959561413511"] = {
      isStoryNode = true,
      key = "1715072959561413511",
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
    ["1715072964430413634"] = {
      isStoryNode = true,
      key = "1715072964430413634",
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
            startQuest = "1715072964430413635",
            startPort = "QuestStart",
            endQuest = "1715072973679414138",
            endPort = "In"
          },
          {
            startQuest = "1754641399573298960",
            startPort = "Option_1",
            endQuest = "1754641399573298961",
            endPort = "In"
          },
          {
            startQuest = "1715072973679414138",
            startPort = "Out",
            endQuest = "1715072964431413638",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1715072964430413635"] = {
            key = "1715072964430413635",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1715072964431413638"] = {
            key = "1715072964431413638",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1715072964431413641"] = {
            key = "1715072964431413641",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1715072973679414138"] = {
            key = "1715072973679414138",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1108.1679841897237, y = 363.5262917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100101,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1754641399573298960"] = {
            key = "1754641399573298960",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 966.7954545454545, y = 689.568181818182},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100101,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6100104",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6100106",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["1754641399573298961"] = {
            key = "1754641399573298961",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1297.7045454545455, y = 645.9318181818182},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100105,
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
