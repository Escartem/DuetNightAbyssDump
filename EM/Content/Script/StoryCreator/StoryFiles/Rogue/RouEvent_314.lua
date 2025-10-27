return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1739608900307689285",
      startPort = "StoryStart",
      endStory = "1739608900307689287",
      endPort = "In"
    },
    {
      startStory = "1739608900307689287",
      startPort = "Success",
      endStory = "1739608900307689286",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1739608900307689285"] = {
      isStoryNode = true,
      key = "1739608900307689285",
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
    ["1739608900307689286"] = {
      isStoryNode = true,
      key = "1739608900307689286",
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
    ["1739608900307689287"] = {
      isStoryNode = true,
      key = "1739608900307689287",
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
            startQuest = "1739608900307689288",
            startPort = "QuestStart",
            endQuest = "1739608900307689291",
            endPort = "In"
          },
          {
            startQuest = "17546438510638625665",
            startPort = "Option_1",
            endQuest = "17546438510638625666",
            endPort = "In"
          },
          {
            startQuest = "17546438510638625665",
            startPort = "Option_2",
            endQuest = "17546438510638625667",
            endPort = "In"
          },
          {
            startQuest = "1739608900307689291",
            startPort = "Out",
            endQuest = "1739608900307689289",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1739608900307689288"] = {
            key = "1739608900307689288",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1739608900307689289"] = {
            key = "1739608900307689289",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1739608900307689290"] = {
            key = "1739608900307689290",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1739608900307689291"] = {
            key = "1739608900307689291",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1120.9735397452794, y = 367.6929583899296},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101401,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546438510638625665"] = {
            key = "17546438510638625665",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 931.0232323232324, y = 726.1625566004877},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101401,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6101403",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6101409",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17546438510638625666"] = {
            key = "17546438510638625666",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1265.9323232323234, y = 681.526192964124},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101404,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546438510638625667"] = {
            key = "17546438510638625667",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1263.534204110066, y = 852.6515848136537},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101410,
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
