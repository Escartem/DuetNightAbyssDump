return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1742196066378954309",
      startPort = "StoryStart",
      endStory = "1742196066378954311",
      endPort = "In"
    },
    {
      startStory = "1742196066378954311",
      startPort = "Success",
      endStory = "1742196066378954310",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1742196066378954309"] = {
      isStoryNode = true,
      key = "1742196066378954309",
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
    ["1742196066378954310"] = {
      isStoryNode = true,
      key = "1742196066378954310",
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
    ["1742196066378954311"] = {
      isStoryNode = true,
      key = "1742196066378954311",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1170.2136363636364, y = 291.53103480626663},
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
            startQuest = "1742196066378954312",
            startPort = "QuestStart",
            endQuest = "1742196066378954315",
            endPort = "In"
          },
          {
            startQuest = "175464476860616361836",
            startPort = "Option_2",
            endQuest = "175464476860616361837",
            endPort = "In"
          },
          {
            startQuest = "1742196066378954315",
            startPort = "Out",
            endQuest = "1742196066378954313",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742196066378954312"] = {
            key = "1742196066378954312",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 663.2213438735179, y = 356.39877031181385},
            propsData = {ModeType = 0}
          },
          ["1742196066378954313"] = {
            key = "1742196066378954313",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1987.3636363636365, y = 345.85026737967917},
            propsData = {ModeType = 0}
          },
          ["1742196066378954314"] = {
            key = "1742196066378954314",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2075.40404040404, y = 754.4552669552669},
            propsData = {}
          },
          ["1742196066378954315"] = {
            key = "1742196066378954315",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1254.7715195432593, y = 318.9585555378797},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101801,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464476860616361836"] = {
            key = "175464476860616361836",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1086.0132107520221, y = 688.3747026055412},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101801,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6101807",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6101808",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["175464476860616361837"] = {
            key = "175464476860616361837",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1440.653455914645, y = 819.1808529500145},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101809,
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
