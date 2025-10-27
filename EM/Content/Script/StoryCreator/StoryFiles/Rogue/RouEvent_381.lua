return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1736847954553636371",
      startPort = "StoryStart",
      endStory = "1736847954553636373",
      endPort = "In"
    },
    {
      startStory = "1736847954553636373",
      startPort = "Success",
      endStory = "1736847954553636372",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1736847954553636371"] = {
      isStoryNode = true,
      key = "1736847954553636371",
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
    ["1736847954553636372"] = {
      isStoryNode = true,
      key = "1736847954553636372",
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
    ["1736847954553636373"] = {
      isStoryNode = true,
      key = "1736847954553636373",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1170.2136363636364, y = 291.53103480626663},
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
            startQuest = "1736847954553636374",
            startPort = "QuestStart",
            endQuest = "1736847954553636378",
            endPort = "In"
          },
          {
            startQuest = "1736847954553636378",
            startPort = "Out",
            endQuest = "1736847954553636375",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1736847954553636374"] = {
            key = "1736847954553636374",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 663.2213438735179, y = 356.39877031181385},
            propsData = {ModeType = 0}
          },
          ["1736847954553636375"] = {
            key = "1736847954553636375",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1737.3636363636365, y = 357.85026737967917},
            propsData = {ModeType = 0}
          },
          ["1736847954553636376"] = {
            key = "1736847954553636376",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1662.070707070707, y = 647.7886002886003},
            propsData = {}
          },
          ["1736847954553636378"] = {
            key = "1736847954553636378",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1198.3715195432592, y = 355.35855553787974},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6102901,
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
