return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630103308423880",
      startPort = "StoryStart",
      endStory = "1721630103308423882",
      endPort = "In"
    },
    {
      startStory = "1721630103308423882",
      startPort = "Success",
      endStory = "1721630103308423881",
      endPort = "StoryEnd"
    },
    {
      startStory = "1721630103308423882",
      startPort = "Fail",
      endStory = "1721630103308423881",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630103308423880"] = {
      isStoryNode = true,
      key = "1721630103308423880",
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
    ["1721630103308423881"] = {
      isStoryNode = true,
      key = "1721630103308423881",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1583.3333333333333, y = 301.6666666666667},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721630103308423882"] = {
      isStoryNode = true,
      key = "1721630103308423882",
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
            startQuest = "1708496878982258033",
            startPort = "Out",
            endQuest = "1703755560963487",
            endPort = "Input"
          },
          {
            startQuest = "1703755560963487",
            startPort = "true",
            endQuest = "17036749106705714",
            endPort = "Input"
          },
          {
            startQuest = "1703755560963487",
            startPort = "false",
            endQuest = "17036749114855792",
            endPort = "Input"
          },
          {
            startQuest = "17036749106705714",
            startPort = "Out",
            endQuest = "1721630103308423884",
            endPort = "Success"
          },
          {
            startQuest = "17036749114855792",
            startPort = "Out",
            endQuest = "1721630103308423885",
            endPort = "Fail"
          },
          {
            startQuest = "1721630103308423883",
            startPort = "QuestStart",
            endQuest = "170834551796083282",
            endPort = "In"
          },
          {
            startQuest = "170834551796083282",
            startPort = "Out",
            endQuest = "1708496878982258033",
            endPort = "Input"
          }
        },
        nodeData = {
          ["17036749106705714"] = {
            key = "17036749106705714",
            type = "TestPrintNode",
            name = "\230\181\139\232\175\149\230\137\147\229\141\176",
            pos = {x = 1841.6025617205214, y = 267.58651302519615},
            propsData = {Text = "True"}
          },
          ["17036749114855792"] = {
            key = "17036749114855792",
            type = "TestPrintNode",
            name = "\230\181\139\232\175\149\230\137\147\229\141\176",
            pos = {x = 1841.6025617205216, y = 504.7293701680534},
            propsData = {Text = "False"}
          },
          ["1703755560963487"] = {
            key = "1703755560963487",
            type = "TestGreaterNode",
            name = "\230\181\139\232\175\149\229\187\182\232\191\159\229\164\167\228\186\142\232\138\130\231\130\185",
            pos = {x = 1457.424873737374, y = 305.8484848484848},
            propsData = {
              Delay = 1,
              A = 2,
              B = 1
            }
          },
          ["170834551796083282"] = {
            key = "170834551796083282",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 1073.8983354880413, y = 465.79753803315185},
            propsData = {}
          },
          ["1708496878982258033"] = {
            key = "1708496878982258033",
            type = "TestPrintNode",
            name = "\230\181\139\232\175\149\230\137\147\229\141\176",
            pos = {x = 1132.2522943408421, y = 293.93079619300863},
            propsData = {
              Text = "\230\181\139\232\175\149\230\137\147\229\141\176"
            }
          },
          ["1721630103308423883"] = {
            key = "1721630103308423883",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1721630103308423884"] = {
            key = "1721630103308423884",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2229.6638655462184, y = 299.1596638655462},
            propsData = {ModeType = 0}
          },
          ["1721630103308423885"] = {
            key = "1721630103308423885",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2233.949579831933, y = 494.4537815126051},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
