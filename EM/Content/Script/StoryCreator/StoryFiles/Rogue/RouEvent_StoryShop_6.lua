return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17548953265534681322",
      startPort = "StoryStart",
      endStory = "17548953265534681324",
      endPort = "In"
    },
    {
      startStory = "17548953265534681324",
      startPort = "Success",
      endStory = "17548953265534681323",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17548953265534681322"] = {
      isStoryNode = true,
      key = "17548953265534681322",
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
    ["17548953265534681323"] = {
      isStoryNode = true,
      key = "17548953265534681323",
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
    ["17548953265534681324"] = {
      isStoryNode = true,
      key = "17548953265534681324",
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
            startQuest = "17548953265534681325",
            startPort = "QuestStart",
            endQuest = "17548953265534681328",
            endPort = "In"
          },
          {
            startQuest = "17548953265534681328",
            startPort = "Out",
            endQuest = "17548953265534681326",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17548953265534681325"] = {
            key = "17548953265534681325",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 663.2213438735179, y = 356.39877031181385},
            propsData = {ModeType = 0}
          },
          ["17548953265534681326"] = {
            key = "17548953265534681326",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1737.3636363636365, y = 357.85026737967917},
            propsData = {ModeType = 0}
          },
          ["17548953265534681327"] = {
            key = "17548953265534681327",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1662.070707070707, y = 647.7886002886003},
            propsData = {}
          },
          ["17548953265534681328"] = {
            key = "17548953265534681328",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1147.1775345808533, y = 336.63900666569924},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 6201201,
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
