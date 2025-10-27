return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17370337590115274589",
      startPort = "StoryStart",
      endStory = "17370337590115274591",
      endPort = "In"
    },
    {
      startStory = "17370337590115274591",
      startPort = "Success",
      endStory = "17370337590115274590",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17370337590115274589"] = {
      isStoryNode = true,
      key = "17370337590115274589",
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
    ["17370337590115274590"] = {
      isStoryNode = true,
      key = "17370337590115274590",
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
    ["17370337590115274591"] = {
      isStoryNode = true,
      key = "17370337590115274591",
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
            startQuest = "17370337590115274592",
            startPort = "QuestStart",
            endQuest = "17370337590115274595",
            endPort = "In"
          },
          {
            startQuest = "17370337590115274595",
            startPort = "Out",
            endQuest = "17370337590115274593",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17370337590115274592"] = {
            key = "17370337590115274592",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 654.0909090909091, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["17370337590115274593"] = {
            key = "17370337590115274593",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1661.3636363636365, y = 370.90909090909093},
            propsData = {ModeType = 0}
          },
          ["17370337590115274594"] = {
            key = "17370337590115274594",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1833.181818181818, y = 713.3441558441558},
            propsData = {}
          },
          ["17370337590115274595"] = {
            key = "17370337590115274595",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1123.0876270468666, y = 336.6512917232629},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6200301,
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
