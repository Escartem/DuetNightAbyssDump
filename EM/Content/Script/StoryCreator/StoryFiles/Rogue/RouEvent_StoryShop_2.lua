return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17455729853492415461",
      startPort = "StoryStart",
      endStory = "17455729853492415463",
      endPort = "In"
    },
    {
      startStory = "17455729853492415463",
      startPort = "Success",
      endStory = "17455729853492415462",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17455729853492415461"] = {
      isStoryNode = true,
      key = "17455729853492415461",
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
    ["17455729853492415462"] = {
      isStoryNode = true,
      key = "17455729853492415462",
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
    ["17455729853492415463"] = {
      isStoryNode = true,
      key = "17455729853492415463",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1168.2136363636364, y = 291.53103480626663},
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
            startQuest = "17455729853492415464",
            startPort = "QuestStart",
            endQuest = "17455729853492415467",
            endPort = "In"
          },
          {
            startQuest = "17545537264813693538",
            startPort = "Option_1",
            endQuest = "17545537264813693539",
            endPort = "In"
          },
          {
            startQuest = "17455729853492415467",
            startPort = "Out",
            endQuest = "17455729853492415465",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17455729853492415464"] = {
            key = "17455729853492415464",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 663.2213438735179, y = 356.39877031181385},
            propsData = {ModeType = 0}
          },
          ["17455729853492415465"] = {
            key = "17455729853492415465",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1737.3636363636365, y = 357.85026737967917},
            propsData = {ModeType = 0}
          },
          ["17455729853492415466"] = {
            key = "17455729853492415466",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1662.070707070707, y = 647.7886002886003},
            propsData = {}
          },
          ["17455729853492415467"] = {
            key = "17455729853492415467",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1147.9143766861164, y = 328.744269823594},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200801,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17545537264813693538"] = {
            key = "17545537264813693538",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 854.5011443870142, y = 585.4215854612476},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200801,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6200807",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17545537264813693539"] = {
            key = "17545537264813693539",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1137.4988556129856, y = 626.5784145387524},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200808,
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
