return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17407355325341221159",
      startPort = "StoryStart",
      endStory = "17407355325341221161",
      endPort = "In"
    },
    {
      startStory = "17407355325341221161",
      startPort = "Success",
      endStory = "17407355325341221160",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17407355325341221159"] = {
      isStoryNode = true,
      key = "17407355325341221159",
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
    ["17407355325341221160"] = {
      isStoryNode = true,
      key = "17407355325341221160",
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
    ["17407355325341221161"] = {
      isStoryNode = true,
      key = "17407355325341221161",
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
            startQuest = "17407355325341221162",
            startPort = "QuestStart",
            endQuest = "17407355325341221165",
            endPort = "In"
          },
          {
            startQuest = "17407355325341221165",
            startPort = "Out",
            endQuest = "17407355325341221163",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17407355325341221162"] = {
            key = "17407355325341221162",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["17407355325341221163"] = {
            key = "17407355325341221163",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1679.4779220779221, y = 358.39480519480526},
            propsData = {ModeType = 0}
          },
          ["17407355325341221164"] = {
            key = "17407355325341221164",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 713.3441558441558},
            propsData = {}
          },
          ["17407355325341221165"] = {
            key = "17407355325341221165",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1128.8006705251273, y = 335.238248245002},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6201401,
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
