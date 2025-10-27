return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1716548642237680344",
      startPort = "StoryStart",
      endStory = "1716548642237680346",
      endPort = "In"
    },
    {
      startStory = "1716548642237680346",
      startPort = "Success",
      endStory = "1716548642237680345",
      endPort = "StoryEnd"
    },
    {
      startStory = "1716548642237680346",
      startPort = "Fail",
      endStory = "1716548642237680345",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1716548642237680344"] = {
      isStoryNode = true,
      key = "1716548642237680344",
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
    ["1716548642237680345"] = {
      isStoryNode = true,
      key = "1716548642237680345",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1707.246376811594, y = 292.536231884058},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1716548642237680346"] = {
      isStoryNode = true,
      key = "1716548642237680346",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1217.4763906779417, y = 289.0876656393516},
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
            startQuest = "1716548642237680347",
            startPort = "QuestStart",
            endQuest = "1719487578290134124",
            endPort = "Input"
          },
          {
            startQuest = "1719487578290134124",
            startPort = "True",
            endQuest = "1719488907735134907",
            endPort = "Input"
          },
          {
            startQuest = "1719487578290134124",
            startPort = "False",
            endQuest = "1719488910210135041",
            endPort = "Input"
          },
          {
            startQuest = "1719488907735134907",
            startPort = "Out",
            endQuest = "1716548642237680348",
            endPort = "Success"
          },
          {
            startQuest = "1719488910210135041",
            startPort = "Out",
            endQuest = "1716548642237680348",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1716548642237680347"] = {
            key = "1716548642237680347",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 764.4318181818182, y = 354.25},
            propsData = {ModeType = 0}
          },
          ["1716548642237680348"] = {
            key = "1716548642237680348",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1931.1912386308, y = 269.704005488835},
            propsData = {ModeType = 0}
          },
          ["1716548642237680349"] = {
            key = "1716548642237680349",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2322.6417549337193, y = 704.9584541854701},
            propsData = {}
          },
          ["1719487578290134124"] = {
            key = "1719487578290134124",
            type = "ShowPopupUINode",
            name = "\230\152\190\231\164\186\229\188\185\231\170\151",
            pos = {x = 1042.5952380952383, y = 342.5},
            propsData = {PopupId = 100001}
          },
          ["1719488907735134907"] = {
            key = "1719488907735134907",
            type = "TestPrintNode",
            name = "\230\181\139\232\175\149\230\137\147\229\141\176",
            pos = {x = 1521.61038961039, y = 268.939393939394},
            propsData = {
              Text = "\229\188\185\231\170\151\232\191\148\229\155\158True"
            }
          },
          ["1719488910210135041"] = {
            key = "1719488910210135041",
            type = "TestPrintNode",
            name = "\230\181\139\232\175\149\230\137\147\229\141\176",
            pos = {x = 1521.61038961039, y = 471.5151515151514},
            propsData = {
              Text = "\229\188\185\231\170\151\232\191\148\229\155\158False"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
