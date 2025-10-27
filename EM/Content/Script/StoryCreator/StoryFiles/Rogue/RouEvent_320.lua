return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1748589441225503720",
      startPort = "StoryStart",
      endStory = "1748589441225503722",
      endPort = "In"
    },
    {
      startStory = "1748589441225503722",
      startPort = "Success",
      endStory = "1748589441225503721",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1748589441225503720"] = {
      isStoryNode = true,
      key = "1748589441225503720",
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
    ["1748589441225503721"] = {
      isStoryNode = true,
      key = "1748589441225503721",
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
    ["1748589441225503722"] = {
      isStoryNode = true,
      key = "1748589441225503722",
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
            startQuest = "1748589441225503723",
            startPort = "QuestStart",
            endQuest = "1748589441225503726",
            endPort = "In"
          },
          {
            startQuest = "1748589441225503726",
            startPort = "Out",
            endQuest = "1748589441225503724",
            endPort = "Success"
          },
          {
            startQuest = "1754553556671337987",
            startPort = "Option_1",
            endQuest = "1748589441225503727",
            endPort = "In"
          },
          {
            startQuest = "1754553556671337987",
            startPort = "Option_2",
            endQuest = "1748589441225503727",
            endPort = "In"
          }
        },
        nodeData = {
          ["1748589441225503723"] = {
            key = "1748589441225503723",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1748589441225503724"] = {
            key = "1748589441225503724",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1748589441225503725"] = {
            key = "1748589441225503725",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1748589441225503726"] = {
            key = "1748589441225503726",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1110.4179841897237, y = 334.7762917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102101,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1748589441225503727"] = {
            key = "1748589441225503727",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1339.5334243051639, y = 637.8780233249945},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102112,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1754553556671337987"] = {
            key = "1754553556671337987",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 952.2434210526314, y = 602.1578947368421},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102101,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6102110",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6102111",
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
