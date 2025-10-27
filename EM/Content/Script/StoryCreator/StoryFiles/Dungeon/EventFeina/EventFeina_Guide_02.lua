return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175716211847831394272",
      startPort = "StoryStart",
      endStory = "175716211847931394274",
      endPort = "In"
    },
    {
      startStory = "175716211847931394274",
      startPort = "Success",
      endStory = "175716211847931394273",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["175716211847831394272"] = {
      isStoryNode = true,
      key = "175716211847831394272",
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
    ["175716211847931394273"] = {
      isStoryNode = true,
      key = "175716211847931394273",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1652, y = 334},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["175716211847931394274"] = {
      isStoryNode = true,
      key = "175716211847931394274",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1220, y = 288},
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
            startQuest = "175716211847931394275",
            startPort = "QuestStart",
            endQuest = "175716211847931394279",
            endPort = "In"
          },
          {
            startQuest = "175716211847931394279",
            startPort = "Out",
            endQuest = "175716211847931394276",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175716211847931394275"] = {
            key = "175716211847931394275",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175716211847931394276"] = {
            key = "175716211847931394276",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1720, y = 312},
            propsData = {ModeType = 0}
          },
          ["175716211847931394277"] = {
            key = "175716211847931394277",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["175716211847931394279"] = {
            key = "175716211847931394279",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1284, y = 320},
            propsData = {GuideId = 2002}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
