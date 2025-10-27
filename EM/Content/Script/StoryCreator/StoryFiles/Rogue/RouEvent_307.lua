return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630102172388552",
      startPort = "StoryStart",
      endStory = "1721630102172388554",
      endPort = "In"
    },
    {
      startStory = "1721630102172388554",
      startPort = "Success",
      endStory = "1721630102172388553",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630102172388552"] = {
      isStoryNode = true,
      key = "1721630102172388552",
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
    ["1721630102172388553"] = {
      isStoryNode = true,
      key = "1721630102172388553",
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
    ["1721630102172388554"] = {
      isStoryNode = true,
      key = "1721630102172388554",
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
            startQuest = "1721630102172388555",
            startPort = "QuestStart",
            endQuest = "1721630102172388558",
            endPort = "In"
          },
          {
            startQuest = "17546423596513867470",
            startPort = "Option_1",
            endQuest = "17546423596513867471",
            endPort = "In"
          },
          {
            startQuest = "17546423596513867470",
            startPort = "Option_2",
            endQuest = "17546423596513867472",
            endPort = "In"
          },
          {
            startQuest = "1721630102172388558",
            startPort = "Out",
            endQuest = "1721630102172388556",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1721630102172388555"] = {
            key = "1721630102172388555",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1721630102172388556"] = {
            key = "1721630102172388556",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1721630102172388557"] = {
            key = "1721630102172388557",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1721630102172388558"] = {
            key = "1721630102172388558",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1149.8624286341683, y = 347.6929583899296},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100701,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546423596513867470"] = {
            key = "17546423596513867470",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 928.1594896331737, y = 730.1588444214894},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100701,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6100704",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6100711",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17546423596513867471"] = {
            key = "17546423596513867471",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1263.0685805422647, y = 685.5224807851259},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100705,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546423596513867472"] = {
            key = "17546423596513867472",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1260.6704614200073, y = 856.6478726346555},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6100712,
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
