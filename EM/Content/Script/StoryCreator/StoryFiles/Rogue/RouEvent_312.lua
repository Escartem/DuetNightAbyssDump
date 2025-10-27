return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1739608900307689086",
      startPort = "StoryStart",
      endStory = "1739608900307689088",
      endPort = "In"
    },
    {
      startStory = "1739608900307689088",
      startPort = "Success",
      endStory = "1739608900307689087",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1739608900307689086"] = {
      isStoryNode = true,
      key = "1739608900307689086",
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
    ["1739608900307689087"] = {
      isStoryNode = true,
      key = "1739608900307689087",
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
    ["1739608900307689088"] = {
      isStoryNode = true,
      key = "1739608900307689088",
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
            startQuest = "1739608900307689089",
            startPort = "QuestStart",
            endQuest = "1739608900307689092",
            endPort = "In"
          },
          {
            startQuest = "17546437409497436013",
            startPort = "Option_1",
            endQuest = "17546437409497436014",
            endPort = "In"
          },
          {
            startQuest = "17546437409497436013",
            startPort = "Option_2",
            endQuest = "17546437409497436015",
            endPort = "In"
          },
          {
            startQuest = "1739608900307689092",
            startPort = "Out",
            endQuest = "1739608900307689090",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1739608900307689089"] = {
            key = "1739608900307689089",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1739608900307689090"] = {
            key = "1739608900307689090",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1739608900307689091"] = {
            key = "1739608900307689091",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1739608900307689092"] = {
            key = "1739608900307689092",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1099.4179841897237, y = 342.2262917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101201,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546437409497436013"] = {
            key = "17546437409497436013",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 880.0204545454544, y = 743.623667711599},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101201,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6101205",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6101207",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17546437409497436014"] = {
            key = "17546437409497436014",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1210.9295454545454, y = 699.9873040752352},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101206,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546437409497436015"] = {
            key = "17546437409497436015",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1209.8950626959243, y = 870.1126959247649},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101208,
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
