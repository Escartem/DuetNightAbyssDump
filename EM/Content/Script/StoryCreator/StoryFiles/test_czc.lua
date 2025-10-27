return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17036583593371149",
      startPort = "StoryStart",
      endStory = "17036583665291592",
      endPort = "In"
    },
    {
      startStory = "17036583665291592",
      startPort = "Success",
      endStory = "17036583593371152",
      endPort = "StoryEnd"
    },
    {
      startStory = "17036583665291592",
      startPort = "Fail",
      endStory = "17036583593371152",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17036583593371149"] = {
      isStoryNode = true,
      key = "17036583593371149",
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
    ["17036583593371152"] = {
      isStoryNode = true,
      key = "17036583593371152",
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
    ["17036583665291592"] = {
      isStoryNode = true,
      key = "17036583665291592",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1219.4763906779417, y = 289.0876656393516},
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
            startQuest = "17036583823442614",
            startPort = "Out",
            endQuest = "17144594126721815",
            endPort = "In"
          },
          {
            startQuest = "1714460550257972",
            startPort = "Out",
            endQuest = "17036583665291597",
            endPort = "Fail"
          },
          {
            startQuest = "17036583665291593",
            startPort = "QuestStart",
            endQuest = "17144608981493663",
            endPort = "In"
          },
          {
            startQuest = "17144608981493663",
            startPort = "Out",
            endQuest = "17036583823442614",
            endPort = "Input"
          },
          {
            startQuest = "17144609372864193",
            startPort = "Out",
            endQuest = "17144610737464904",
            endPort = "In"
          },
          {
            startQuest = "17144610737464904",
            startPort = "Out",
            endQuest = "1714460550257972",
            endPort = "Input"
          },
          {
            startQuest = "17144612226825616",
            startPort = "Out",
            endQuest = "17144612200975404",
            endPort = "In"
          },
          {
            startQuest = "17144612200975404",
            startPort = "Out",
            endQuest = "17084099122935626",
            endPort = "In"
          },
          {
            startQuest = "17084099122935626",
            startPort = "Out",
            endQuest = "17144609372864193",
            endPort = "In"
          },
          {
            startQuest = "17144594126721815",
            startPort = "Out",
            endQuest = "17144612226825616",
            endPort = "In"
          }
        },
        nodeData = {
          ["17036583665291593"] = {
            key = "17036583665291593",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17036583665291595"] = {
            key = "17036583665291595",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2062.2606166212304, y = 296.87944408532627},
            propsData = {ModeType = 0}
          },
          ["17036583665291597"] = {
            key = "17036583665291597",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2055.0675922542932, y = 565.3651527500634},
            propsData = {}
          },
          ["17036583823442614"] = {
            key = "17036583823442614",
            type = "TestPrintNode",
            name = "\230\181\139\232\175\149\230\137\147\229\141\176",
            pos = {x = 1133.7705586851937, y = 312.26952268390903},
            propsData = {
              Text = "\230\181\139\232\175\149\230\137\147\229\141\176"
            }
          },
          ["17084099122935626"] = {
            key = "17084099122935626",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1507.8604161665942, y = 267.77627686323325},
            propsData = {WaitTime = 5}
          },
          ["17144594126721815"] = {
            key = "17144594126721815",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = 1194.040268197526, y = 537.8301588127106},
            propsData = {QuestRoleId = 0, IsPlayFX = false}
          },
          ["1714460550257972"] = {
            key = "1714460550257972",
            type = "TestPrintNode",
            name = "\230\181\139\232\175\149\230\137\147\229\141\176",
            pos = {x = 1777.2997658497557, y = 310.93991809330356},
            propsData = {
              Text = "\230\181\139\232\175\149\230\137\147\229\141\1762"
            }
          },
          ["17144608981493663"] = {
            key = "17144608981493663",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1086.0497658497557, y = 85.93991809330362},
            propsData = {WaitTime = 5}
          },
          ["17144609372864193"] = {
            key = "17144609372864193",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = 1743.5497658497557, y = 527.1899180933036},
            propsData = {QuestRoleId = 0, IsPlayFX = false}
          },
          ["17144610737464904"] = {
            key = "17144610737464904",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1643.5497658497557, y = 155.93991809330356},
            propsData = {WaitTime = 5}
          },
          ["17144612200975404"] = {
            key = "17144612200975404",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 1553.7616921430522, y = 775.8855702672167},
            propsData = {}
          },
          ["17144612226825616"] = {
            key = "17144612226825616",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1297.4640105990388, y = 691.0706557430547},
            propsData = {WaitTime = 5}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
