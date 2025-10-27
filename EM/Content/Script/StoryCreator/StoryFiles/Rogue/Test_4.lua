return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851536994311640743",
      startPort = "StoryStart",
      endStory = "171851536994311640745",
      endPort = "In"
    },
    {
      startStory = "171851536994311640745",
      startPort = "Success",
      endStory = "171851536994311640744",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["171851536994311640743"] = {
      isStoryNode = true,
      key = "171851536994311640743",
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
    ["171851536994311640744"] = {
      isStoryNode = true,
      key = "171851536994311640744",
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
    ["171851536994311640745"] = {
      isStoryNode = true,
      key = "171851536994311640745",
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
            startQuest = "171851536994311640746",
            startPort = "QuestStart",
            endQuest = "171851536994311640749",
            endPort = "In"
          },
          {
            startQuest = "171851536994311640749",
            startPort = "Option_1",
            endQuest = "171851536994311640750",
            endPort = "In"
          },
          {
            startQuest = "171851536994311640749",
            startPort = "Option_2",
            endQuest = "171851536994311640751",
            endPort = "In"
          },
          {
            startQuest = "171851536994311640750",
            startPort = "Out",
            endQuest = "171851536994311640747",
            endPort = "Success"
          },
          {
            startQuest = "171851536994311640751",
            startPort = "Out",
            endQuest = "171851536994311640747",
            endPort = "Success"
          },
          {
            startQuest = "171851536994311640749",
            startPort = "Option_3",
            endQuest = "171851536994311640752",
            endPort = "In"
          },
          {
            startQuest = "171851536994311640752",
            startPort = "Out",
            endQuest = "171851536994311640747",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171851536994311640746"] = {
            key = "171851536994311640746",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["171851536994311640747"] = {
            key = "171851536994311640747",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["171851536994311640748"] = {
            key = "171851536994311640748",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 712.2727272727273},
            propsData = {}
          },
          ["171851536994311640749"] = {
            key = "171851536994311640749",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 949.4179841897237, y = 311.0262917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 69991101,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {
                {
                  OptionText = "699911041",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "699911051",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "699911061",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["171851536994311640750"] = {
            key = "171851536994311640750",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1280.3270750988147, y = 267.38992808689926},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 699911042,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["171851536994311640751"] = {
            key = "171851536994311640751",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1278.963438735178, y = 436.4808371778082},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 699911052,
              FlowAssetPath = "",
              TalkType = "RougeLike",
              OptionType = "rougeLike",
              RougeLikeOptions = {},
              OverrideFailBlend = false
            }
          },
          ["171851536994311640752"] = {
            key = "171851536994311640752",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1283.4185814185814, y = 610.3436563436563},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 699911062,
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
