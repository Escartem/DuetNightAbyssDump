return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630102194388824",
      startPort = "StoryStart",
      endStory = "1721630102194388826",
      endPort = "In"
    },
    {
      startStory = "1721630102194388826",
      startPort = "Success",
      endStory = "1721630102194388825",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630102194388824"] = {
      isStoryNode = true,
      key = "1721630102194388824",
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
    ["1721630102194388825"] = {
      isStoryNode = true,
      key = "1721630102194388825",
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
    ["1721630102194388826"] = {
      isStoryNode = true,
      key = "1721630102194388826",
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
            startQuest = "1721630102194388827",
            startPort = "QuestStart",
            endQuest = "1721630102194388830",
            endPort = "In"
          },
          {
            startQuest = "17546425318835651795",
            startPort = "Option_1",
            endQuest = "17546425318835651796",
            endPort = "In"
          },
          {
            startQuest = "17546425318835651795",
            startPort = "Option_2",
            endQuest = "17546425318835651797",
            endPort = "In"
          },
          {
            startQuest = "1721630102194388830",
            startPort = "Out",
            endQuest = "1721630102194388828",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1721630102194388827"] = {
            key = "1721630102194388827",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1721630102194388828"] = {
            key = "1721630102194388828",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1721630102194388829"] = {
            key = "1721630102194388829",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1721630102194388830"] = {
            key = "1721630102194388830",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1154.0543478260875, y = 357.38992808689926},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101001,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546425318835651795"] = {
            key = "17546425318835651795",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 968.5478468899521, y = 713.828053676511},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101001,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6101003",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6101005",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17546425318835651796"] = {
            key = "17546425318835651796",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1304.8205741626793, y = 670.1916900401475},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101004,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546425318835651797"] = {
            key = "17546425318835651797",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1301.0588186767857, y = 841.6807182533134},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101006,
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
