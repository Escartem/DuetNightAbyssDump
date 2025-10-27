return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1739608900307689194",
      startPort = "StoryStart",
      endStory = "1739608900307689196",
      endPort = "In"
    },
    {
      startStory = "1739608900307689196",
      startPort = "Success",
      endStory = "1739608900307689195",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1739608900307689194"] = {
      isStoryNode = true,
      key = "1739608900307689194",
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
    ["1739608900307689195"] = {
      isStoryNode = true,
      key = "1739608900307689195",
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
    ["1739608900307689196"] = {
      isStoryNode = true,
      key = "1739608900307689196",
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
            startQuest = "1739608900307689197",
            startPort = "QuestStart",
            endQuest = "1739608900307689200",
            endPort = "In"
          },
          {
            startQuest = "17546437856038030685",
            startPort = "Option_1",
            endQuest = "17546437856038030686",
            endPort = "In"
          },
          {
            startQuest = "17546437856038030685",
            startPort = "Option_2",
            endQuest = "17546437856038030687",
            endPort = "In"
          },
          {
            startQuest = "1739608900307689200",
            startPort = "Out",
            endQuest = "1739608900307689198",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1739608900307689197"] = {
            key = "1739608900307689197",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1739608900307689198"] = {
            key = "1739608900307689198",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1739608900307689199"] = {
            key = "1739608900307689199",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1739608900307689200"] = {
            key = "1739608900307689200",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1136.9179841897237, y = 368.5262917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101301,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546437856038030685"] = {
            key = "17546437856038030685",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 998.0322966507179, y = 722.9026150800198},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101301,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6101303",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6101305",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17546437856038030686"] = {
            key = "17546437856038030686",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1328.9413875598088, y = 679.2662514436563},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101304,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17546437856038030687"] = {
            key = "17546437856038030687",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1326.5432684375514, y = 849.3916432931859},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6101306,
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
