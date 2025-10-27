return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17407356128702263298",
      startPort = "StoryStart",
      endStory = "17407356128702263300",
      endPort = "In"
    },
    {
      startStory = "17407356128702263300",
      startPort = "Success",
      endStory = "17407356128702263299",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17407356128702263298"] = {
      isStoryNode = true,
      key = "17407356128702263298",
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
    ["17407356128702263299"] = {
      isStoryNode = true,
      key = "17407356128702263299",
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
    ["17407356128702263300"] = {
      isStoryNode = true,
      key = "17407356128702263300",
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
            startQuest = "17407356128702263301",
            startPort = "QuestStart",
            endQuest = "17407356128702263304",
            endPort = "In"
          },
          {
            startQuest = "17407356128702263304",
            startPort = "Option_1",
            endQuest = "17407414320203392370",
            endPort = "In"
          },
          {
            startQuest = "17407414320203392370",
            startPort = "Out",
            endQuest = "17407356128702263302",
            endPort = "Success"
          },
          {
            startQuest = "17407356128702263304",
            startPort = "Option_2",
            endQuest = "17407414958573392957",
            endPort = "In"
          },
          {
            startQuest = "17407414958573392957",
            startPort = "Out",
            endQuest = "17407356128702263302",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17407356128702263301"] = {
            key = "17407356128702263301",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["17407356128702263302"] = {
            key = "17407356128702263302",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["17407356128702263303"] = {
            key = "17407356128702263303",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 713.3441558441558},
            propsData = {}
          },
          ["17407356128702263304"] = {
            key = "17407356128702263304",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1008.0876270468666, y = 331.1512917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200601,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "6200606",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "6200615",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17407414320203392370"] = {
            key = "17407414320203392370",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1305.4285714285713, y = 298.8571428571428},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200607,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17407414958573392957"] = {
            key = "17407414958573392957",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1321.5535714285713, y = 453.7142857142857},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200616,
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
