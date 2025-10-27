return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17548953718965877796",
      startPort = "StoryStart",
      endStory = "17548953718965877798",
      endPort = "In"
    },
    {
      startStory = "17548953718965877798",
      startPort = "Success",
      endStory = "17548953718965877797",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17548953718965877796"] = {
      isStoryNode = true,
      key = "17548953718965877796",
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
    ["17548953718965877797"] = {
      isStoryNode = true,
      key = "17548953718965877797",
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
    ["17548953718965877798"] = {
      isStoryNode = true,
      key = "17548953718965877798",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1170.2136363636364, y = 289.53103480626663},
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
            startQuest = "17548953718965877799",
            startPort = "QuestStart",
            endQuest = "17548953718965877802",
            endPort = "In"
          },
          {
            startQuest = "17548953718965877802",
            startPort = "Out",
            endQuest = "17548953718965877800",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17548953718965877799"] = {
            key = "17548953718965877799",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 663.2213438735179, y = 356.39877031181385},
            propsData = {ModeType = 0}
          },
          ["17548953718965877800"] = {
            key = "17548953718965877800",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1737.3636363636365, y = 357.85026737967917},
            propsData = {ModeType = 0}
          },
          ["17548953718965877801"] = {
            key = "17548953718965877801",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1662.070707070707, y = 647.7886002886003},
            propsData = {}
          },
          ["17548953718965877802"] = {
            key = "17548953718965877802",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1147.1775345808533, y = 336.63900666569924},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6201301,
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
