return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17370335783171628449",
      startPort = "StoryStart",
      endStory = "17370335783171628451",
      endPort = "In"
    },
    {
      startStory = "17370335783171628451",
      startPort = "Success",
      endStory = "17370335783171628450",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17370335783171628449"] = {
      isStoryNode = true,
      key = "17370335783171628449",
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
    ["17370335783171628450"] = {
      isStoryNode = true,
      key = "17370335783171628450",
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
    ["17370335783171628451"] = {
      isStoryNode = true,
      key = "17370335783171628451",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1166.8500000000001, y = 292.894671169903},
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
            startQuest = "17370335783171628452",
            startPort = "QuestStart",
            endQuest = "17370335783171628455",
            endPort = "In"
          },
          {
            startQuest = "175464511636817551965",
            startPort = "Option_1",
            endQuest = "175464511636817551966",
            endPort = "In"
          },
          {
            startQuest = "17370335783171628455",
            startPort = "Out",
            endQuest = "17370335783171628453",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17370335783171628452"] = {
            key = "17370335783171628452",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["17370335783171628453"] = {
            key = "17370335783171628453",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["17370335783171628454"] = {
            key = "17370335783171628454",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 713.3441558441558},
            propsData = {}
          },
          ["17370335783171628455"] = {
            key = "17370335783171628455",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1039.3019127611522, y = 330.57986315183433},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200101,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464511636817551965"] = {
            key = "175464511636817551965",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 976.5843979390177, y = 622.4331327840061},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200101,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6200127",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["175464511636817551966"] = {
            key = "175464511636817551966",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1299.6656020609826, y = 658.0668672159941},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200128,
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
