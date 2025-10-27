return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1754303988207560173",
      startPort = "StoryStart",
      endStory = "1754303988207560175",
      endPort = "In"
    },
    {
      startStory = "1754303988207560175",
      startPort = "Success",
      endStory = "1754303988207560174",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1754303988207560173"] = {
      isStoryNode = true,
      key = "1754303988207560173",
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
    ["1754303988207560174"] = {
      isStoryNode = true,
      key = "1754303988207560174",
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
    ["1754303988207560175"] = {
      isStoryNode = true,
      key = "1754303988207560175",
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
            startQuest = "1754303988207560176",
            startPort = "QuestStart",
            endQuest = "1754303988207560179",
            endPort = "In"
          },
          {
            startQuest = "175464439280513386358",
            startPort = "Option_1",
            endQuest = "175464439280513386359",
            endPort = "In"
          },
          {
            startQuest = "175464439280513386358",
            startPort = "Option_2",
            endQuest = "175464439280513386360",
            endPort = "In"
          },
          {
            startQuest = "1754303988207560179",
            startPort = "Out",
            endQuest = "1754303988207560177",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1754303988207560176"] = {
            key = "1754303988207560176",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["1754303988207560177"] = {
            key = "1754303988207560177",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["1754303988207560178"] = {
            key = "1754303988207560178",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["1754303988207560179"] = {
            key = "1754303988207560179",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1181.1322699040095, y = 372.09772029469144},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102401,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464439280513386358"] = {
            key = "175464439280513386358",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 978.7990259740261, y = 667.6093819973132},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102401,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6102404",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6102408",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["175464439280513386359"] = {
            key = "175464439280513386359",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1315.1366883116884, y = 621.5444469323782},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102405,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175464439280513386360"] = {
            key = "175464439280513386360",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1311.3099977608597, y = 794.0984102104792},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102409,
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
