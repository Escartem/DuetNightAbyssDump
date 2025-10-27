return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1749707917146524722",
      startPort = "StoryStart",
      endStory = "1749707917146524724",
      endPort = "In"
    },
    {
      startStory = "1749707917146524724",
      startPort = "Success",
      endStory = "1749707917146524723",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1749707917146524722"] = {
      isStoryNode = true,
      key = "1749707917146524722",
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
    ["1749707917146524723"] = {
      isStoryNode = true,
      key = "1749707917146524723",
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
    ["1749707917146524724"] = {
      isStoryNode = true,
      key = "1749707917146524724",
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
            startQuest = "1749707917146524725",
            startPort = "QuestStart",
            endQuest = "1749707917146524728",
            endPort = "In"
          },
          {
            startQuest = "17545536531151680610",
            startPort = "Option_1",
            endQuest = "17545536531151680611",
            endPort = "In"
          },
          {
            startQuest = "17545536531151680610",
            startPort = "Option_2",
            endQuest = "17545536531151680612",
            endPort = "In"
          },
          {
            startQuest = "1749707917146524728",
            startPort = "Out",
            endQuest = "1749707917146524726",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1749707917146524725"] = {
            key = "1749707917146524725",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1749707917146524726"] = {
            key = "1749707917146524726",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1749707917146524727"] = {
            key = "1749707917146524727",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 713.3441558441558},
            propsData = {}
          },
          ["1749707917146524728"] = {
            key = "1749707917146524728",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1008.0876270468666, y = 331.1512917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200601,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17545536531151680610"] = {
            key = "17545536531151680610",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 957.6880804407267, y = 725.7866300691276},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200601,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6200606",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6200615",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17545536531151680611"] = {
            key = "17545536531151680611",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1255.0290248224314, y = 693.4924812030075},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200607,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17545536531151680612"] = {
            key = "17545536531151680612",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1271.1540248224314, y = 848.3496240601505},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200616,
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
