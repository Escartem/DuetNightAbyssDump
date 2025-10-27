return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1739608900308689573",
      startPort = "StoryStart",
      endStory = "1739608900308689575",
      endPort = "In"
    },
    {
      startStory = "1739608900308689575",
      startPort = "Success",
      endStory = "1739608900308689574",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1739608900308689573"] = {
      isStoryNode = true,
      key = "1739608900308689573",
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
    ["1739608900308689574"] = {
      isStoryNode = true,
      key = "1739608900308689574",
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
    ["1739608900308689575"] = {
      isStoryNode = true,
      key = "1739608900308689575",
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
            startQuest = "1739608900308689576",
            startPort = "QuestStart",
            endQuest = "1739608900308689579",
            endPort = "In"
          },
          {
            startQuest = "175464406765810410923",
            startPort = "Option_1",
            endQuest = "175464406765810410924",
            endPort = "In"
          },
          {
            startQuest = "175464406765810410923",
            startPort = "Option_2",
            endQuest = "175464406765810410925",
            endPort = "In"
          },
          {
            startQuest = "175464406765810410923",
            startPort = "Option_3",
            endQuest = "175464406765810410926",
            endPort = "In"
          },
          {
            startQuest = "1739608900308689579",
            startPort = "Out",
            endQuest = "1739608900308689577",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1739608900308689576"] = {
            key = "1739608900308689576",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1739608900308689577"] = {
            key = "1739608900308689577",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1739608900308689578"] = {
            key = "1739608900308689578",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1739608900308689579"] = {
            key = "1739608900308689579",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1176.6679841897237, y = 348.5262917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101701,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464406765810410923"] = {
            key = "175464406765810410923",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1008.994706380576, y = 854.1170419655275},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101701,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6101704",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6101707",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6101710",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["175464406765810410924"] = {
            key = "175464406765810410924",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1343.903797289667, y = 810.480678329164},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101705,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464406765810410925"] = {
            key = "175464406765810410925",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1341.5056781674095, y = 980.6060701786936},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101708,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464406765810410926"] = {
            key = "175464406765810410926",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1345.0052936194238, y = 1136.5193216708362},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101711,
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
