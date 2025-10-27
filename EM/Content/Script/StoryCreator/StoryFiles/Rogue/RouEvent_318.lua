return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1748589441224503609",
      startPort = "StoryStart",
      endStory = "1748589441224503611",
      endPort = "In"
    },
    {
      startStory = "1748589441224503611",
      startPort = "Success",
      endStory = "1748589441224503610",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1748589441224503609"] = {
      isStoryNode = true,
      key = "1748589441224503609",
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
    ["1748589441224503610"] = {
      isStoryNode = true,
      key = "1748589441224503610",
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
    ["1748589441224503611"] = {
      isStoryNode = true,
      key = "1748589441224503611",
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
            startQuest = "1748589441224503612",
            startPort = "QuestStart",
            endQuest = "1748589441224503615",
            endPort = "In"
          },
          {
            startQuest = "175464416363111005922",
            startPort = "Option_1",
            endQuest = "175464416363111005923",
            endPort = "In"
          },
          {
            startQuest = "175464416363111005922",
            startPort = "Option_2",
            endQuest = "175464416363111005923",
            endPort = "In"
          },
          {
            startQuest = "175464416363111005922",
            startPort = "Option_3",
            endQuest = "175464416363111005923",
            endPort = "In"
          },
          {
            startQuest = "1748589441224503615",
            startPort = "Out",
            endQuest = "1748589441224503613",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1748589441224503612"] = {
            key = "1748589441224503612",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1748589441224503613"] = {
            key = "1748589441224503613",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1748589441224503614"] = {
            key = "1748589441224503614",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1748589441224503615"] = {
            key = "1748589441224503615",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1119.8179841897238, y = 323.0262917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102001,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464416363111005922"] = {
            key = "175464416363111005922",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 911.4290071770336, y = 702.130681818182},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102001,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6102008",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6102009",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6102010",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["175464416363111005923"] = {
            key = "175464416363111005923",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1229.2130980861245, y = 742.8693181818182},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102011,
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
