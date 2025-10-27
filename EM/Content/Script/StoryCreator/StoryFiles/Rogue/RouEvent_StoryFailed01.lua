return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1749707917144524443",
      startPort = "StoryStart",
      endStory = "1749707917144524445",
      endPort = "In"
    },
    {
      startStory = "1749707917144524445",
      startPort = "Success",
      endStory = "1749707917144524444",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1749707917144524443"] = {
      isStoryNode = true,
      key = "1749707917144524443",
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
    ["1749707917144524444"] = {
      isStoryNode = true,
      key = "1749707917144524444",
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
    ["1749707917144524445"] = {
      isStoryNode = true,
      key = "1749707917144524445",
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
            startQuest = "1749707917144524446",
            startPort = "QuestStart",
            endQuest = "1749707917144524449",
            endPort = "In"
          },
          {
            startQuest = "17545536787612351632",
            startPort = "Option_1",
            endQuest = "17545536787612351633",
            endPort = "In"
          },
          {
            startQuest = "1749707917144524449",
            startPort = "Out",
            endQuest = "1749707917144524447",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1749707917144524446"] = {
            key = "1749707917144524446",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1749707917144524447"] = {
            key = "1749707917144524447",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1679.4779220779221, y = 358.39480519480526},
            propsData = {ModeType = 0}
          },
          ["1749707917144524448"] = {
            key = "1749707917144524448",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 713.3441558441558},
            propsData = {}
          },
          ["1749707917144524449"] = {
            key = "1749707917144524449",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1055.4139428363403, y = 358.09866014431555},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200501,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17545536787612351632"] = {
            key = "17545536787612351632",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 958.0377984858392, y = 644.9816608992255},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200501,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6200510",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17545536787612351633"] = {
            key = "17545536787612351633",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1327.435885724687, y = 673.5446548902484},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200511,
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
