return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1748589441224503518",
      startPort = "StoryStart",
      endStory = "1748589441224503520",
      endPort = "In"
    },
    {
      startStory = "1748589441224503520",
      startPort = "Success",
      endStory = "1748589441224503519",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1748589441224503518"] = {
      isStoryNode = true,
      key = "1748589441224503518",
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
    ["1748589441224503519"] = {
      isStoryNode = true,
      key = "1748589441224503519",
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
    ["1748589441224503520"] = {
      isStoryNode = true,
      key = "1748589441224503520",
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
            startQuest = "1748589441224503521",
            startPort = "QuestStart",
            endQuest = "1748589441224503524",
            endPort = "In"
          },
          {
            startQuest = "175464421227111600819",
            startPort = "Option_1",
            endQuest = "175464421227111600820",
            endPort = "In"
          },
          {
            startQuest = "175464421227111600819",
            startPort = "Option_2",
            endQuest = "175464421227111600820",
            endPort = "In"
          },
          {
            startQuest = "1748589441224503524",
            startPort = "Out",
            endQuest = "1748589441224503522",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1748589441224503521"] = {
            key = "1748589441224503521",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1748589441224503522"] = {
            key = "1748589441224503522",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1567.4405594405596, y = 336.83216783216784},
            propsData = {ModeType = 0}
          },
          ["1748589441224503523"] = {
            key = "1748589441224503523",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1748589441224503524"] = {
            key = "1748589441224503524",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1071.6402064119459, y = 333.2485139454851},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101901,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464421227111600819"] = {
            key = "175464421227111600819",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 859.5913450360381, y = 641.8702430483322},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101901,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6101909",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6101910",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["175464421227111600820"] = {
            key = "175464421227111600820",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1155.1733608463144, y = 669.8439513250694},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101911,
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
