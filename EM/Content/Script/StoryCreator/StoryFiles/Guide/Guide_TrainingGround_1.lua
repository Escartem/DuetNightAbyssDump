return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1754536555434432006",
      startPort = "StoryStart",
      endStory = "1754536555434432008",
      endPort = "In"
    },
    {
      startStory = "1754536555434432008",
      startPort = "Success",
      endStory = "1754536555434432007",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1754536555434432006"] = {
      isStoryNode = true,
      key = "1754536555434432006",
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
    ["1754536555434432007"] = {
      isStoryNode = true,
      key = "1754536555434432007",
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
    ["1754536555434432008"] = {
      isStoryNode = true,
      key = "1754536555434432008",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1133.140730225936, y = 297.6286915119693},
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
            startQuest = "1754536555434432009",
            startPort = "QuestStart",
            endQuest = "1754536555434432012",
            endPort = "In"
          },
          {
            startQuest = "1754536555434432012",
            startPort = "Out",
            endQuest = "1717656653600263568",
            endPort = "In"
          },
          {
            startQuest = "1754536555434432012",
            startPort = "Out",
            endQuest = "17177557558351669267",
            endPort = "In"
          },
          {
            startQuest = "17177557558351669267",
            startPort = "Out",
            endQuest = "1754536555434432010",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1717656653600263568"] = {
            key = "1717656653600263568",
            type = "ShowGuideToastNode",
            name = "Toast\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1142.1563604196385, y = 189.7236075083378},
            propsData = {
              ShowEnable = true,
              MessageId = 301401,
              MessageNote = "\230\137\147\229\188\128\232\174\173\231\187\131\232\143\156\229\141\149",
              LastTime = 10,
              Style = "Normal"
            }
          },
          ["17177557558351669267"] = {
            key = "17177557558351669267",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1157.3652706326875, y = 358.9626559355197},
            propsData = {WaitTime = 0.5}
          },
          ["1754536555434432009"] = {
            key = "1754536555434432009",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 456.66666666666663, y = 314.44444444444446},
            propsData = {ModeType = 0}
          },
          ["1754536555434432010"] = {
            key = "1754536555434432010",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1827.2560386473428, y = 307.1111111111111},
            propsData = {ModeType = 0}
          },
          ["1754536555434432011"] = {
            key = "1754536555434432011",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1754536555434432012"] = {
            key = "1754536555434432012",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 821.9942392922145, y = 301.9213400709162},
            propsData = {GuideId = 33}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
