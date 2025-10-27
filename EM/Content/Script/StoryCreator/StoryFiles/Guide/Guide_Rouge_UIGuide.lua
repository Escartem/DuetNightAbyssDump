return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17455193002252199151",
      startPort = "StoryStart",
      endStory = "17455193042492199333",
      endPort = "In"
    },
    {
      startStory = "17455193042492199333",
      startPort = "Success",
      endStory = "17455193002252199154",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17455193002252199151"] = {
      isStoryNode = true,
      key = "17455193002252199151",
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
    ["17455193002252199154"] = {
      isStoryNode = true,
      key = "17455193002252199154",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2084, y = 338},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17455193042492199333"] = {
      isStoryNode = true,
      key = "17455193042492199333",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1224, y = 300},
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
            startQuest = "17455193042492199334",
            startPort = "QuestStart",
            endQuest = "17455193111252199576",
            endPort = "In"
          },
          {
            startQuest = "17455193111252199576",
            startPort = "Out",
            endQuest = "17455193042492199337",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17455193042492199334"] = {
            key = "17455193042492199334",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17455193042492199337"] = {
            key = "17455193042492199337",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2172, y = 334},
            propsData = {ModeType = 0}
          },
          ["17455193042492199340"] = {
            key = "17455193042492199340",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17455193111252199576"] = {
            key = "17455193111252199576",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1250, y = 380},
            propsData = {GuideId = 77}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
