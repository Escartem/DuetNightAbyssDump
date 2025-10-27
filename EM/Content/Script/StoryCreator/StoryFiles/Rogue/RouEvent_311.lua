return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1739608900306688979",
      startPort = "StoryStart",
      endStory = "1739608900306688981",
      endPort = "In"
    },
    {
      startStory = "1739608900306688981",
      startPort = "Success",
      endStory = "1739608900306688980",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1739608900306688979"] = {
      isStoryNode = true,
      key = "1739608900306688979",
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
    ["1739608900306688980"] = {
      isStoryNode = true,
      key = "1739608900306688980",
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
    ["1739608900306688981"] = {
      isStoryNode = true,
      key = "1739608900306688981",
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
            startQuest = "1739608900306688982",
            startPort = "QuestStart",
            endQuest = "1739608900306688985",
            endPort = "In"
          },
          {
            startQuest = "17546436327416840900",
            startPort = "Option_1",
            endQuest = "17546436327416840901",
            endPort = "In"
          },
          {
            startQuest = "17546436327416840900",
            startPort = "Option_2",
            endQuest = "17546436327416840902",
            endPort = "In"
          },
          {
            startQuest = "1739608900306688985",
            startPort = "Out",
            endQuest = "1739608900306688983",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1739608900306688982"] = {
            key = "1739608900306688982",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1739608900306688983"] = {
            key = "1739608900306688983",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1739608900306688984"] = {
            key = "1739608900306688984",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1739608900306688985"] = {
            key = "1739608900306688985",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1116.2179841897237, y = 360.2262917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101101,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546436327416840900"] = {
            key = "17546436327416840900",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 950.8204545454547, y = 700.8320010449322},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101101,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6101108",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6101112",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17546436327416840901"] = {
            key = "17546436327416840901",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1281.7295454545456, y = 657.1956374085685},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101109,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546436327416840902"] = {
            key = "17546436327416840902",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1279.3314263322882, y = 827.3210292580982},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101113,
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
