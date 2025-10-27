return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1739608900308689375",
      startPort = "StoryStart",
      endStory = "1739608900308689377",
      endPort = "In"
    },
    {
      startStory = "1739608900308689377",
      startPort = "Success",
      endStory = "1739608900308689376",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1739608900308689375"] = {
      isStoryNode = true,
      key = "1739608900308689375",
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
    ["1739608900308689376"] = {
      isStoryNode = true,
      key = "1739608900308689376",
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
    ["1739608900308689377"] = {
      isStoryNode = true,
      key = "1739608900308689377",
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
            startQuest = "1739608900308689378",
            startPort = "QuestStart",
            endQuest = "1739608900308689381",
            endPort = "In"
          },
          {
            startQuest = "17546439243509220615",
            startPort = "Option_1",
            endQuest = "17546439243509220616",
            endPort = "In"
          },
          {
            startQuest = "17546439243509220615",
            startPort = "Option_2",
            endQuest = "17546439243509220617",
            endPort = "In"
          },
          {
            startQuest = "17546439243509220615",
            startPort = "Option_3",
            endQuest = "17546439243509220618",
            endPort = "In"
          },
          {
            startQuest = "1739608900308689381",
            startPort = "Out",
            endQuest = "1739608900308689379",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1739608900308689378"] = {
            key = "1739608900308689378",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1739608900308689379"] = {
            key = "1739608900308689379",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1739608900308689380"] = {
            key = "1739608900308689380",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1739608900308689381"] = {
            key = "1739608900308689381",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1094.1136363636367, y = 339.72194389717595},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101501,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546439243509220615"] = {
            key = "17546439243509220615",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1046.4947843918096, y = 807.9460710600031},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101501,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6101502",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6101505",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6101509",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17546439243509220616"] = {
            key = "17546439243509220616",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1382.832446729472, y = 761.881135995068},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101503,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546439243509220617"] = {
            key = "17546439243509220617",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1379.0057561786432, y = 934.435099273169},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101506,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546439243509220618"] = {
            key = "17546439243509220618",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1381.9339430592288, y = 1100.9197793367402},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101510,
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
