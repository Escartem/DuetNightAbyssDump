return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1717656634131263045",
      startPort = "StoryStart",
      endStory = "1717656637162263131",
      endPort = "In"
    },
    {
      startStory = "1717656637162263131",
      startPort = "Success",
      endStory = "1717656634132263048",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1717656634131263045"] = {
      isStoryNode = true,
      key = "1717656634131263045",
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
    ["1717656634132263048"] = {
      isStoryNode = true,
      key = "1717656634132263048",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1508.235294117647, y = 312.35294117647055},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1717656637162263131"] = {
      isStoryNode = true,
      key = "1717656637162263131",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1131.140730225936, y = 297.6286915119693},
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
            startQuest = "1717656637163263132",
            startPort = "QuestStart",
            endQuest = "1717747712890896994",
            endPort = "In"
          },
          {
            startQuest = "1717747712890896994",
            startPort = "Out",
            endQuest = "1717656637163263135",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1717656637163263132"] = {
            key = "1717656637163263132",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 456.66666666666663, y = 314.44444444444446},
            propsData = {ModeType = 0}
          },
          ["1717656637163263135"] = {
            key = "1717656637163263135",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1601.2560386473428, y = 311.1111111111111},
            propsData = {ModeType = 0}
          },
          ["1717656637163263138"] = {
            key = "1717656637163263138",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1717747712890896994"] = {
            key = "1717747712890896994",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1025.7442392922144, y = 326.9213400709162},
            propsData = {GuideId = 80}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
