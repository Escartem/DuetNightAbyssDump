return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17440155447393860820",
      startPort = "StoryStart",
      endStory = "17440155447393860822",
      endPort = "In"
    },
    {
      startStory = "17440155447393860822",
      startPort = "Success",
      endStory = "17440155447393860821",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17440155447393860820"] = {
      isStoryNode = true,
      key = "17440155447393860820",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 301.0344827586207},
      propsData = {QuestChainId = 400105},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17440155447393860821"] = {
      isStoryNode = true,
      key = "17440155447393860821",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1544.0000000000005, y = 318},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17440155447393860822"] = {
      isStoryNode = true,
      key = "17440155447393860822",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1209.4010695187167, y = 320.5882352941176},
      propsData = {
        QuestId = 4001051,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_400105",
        QuestDeatil = "QuestDesc_400105",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
        bIsEndQuest = true,
        bIsNotifyGameMode = true,
        bIsStartChapter = true,
        bIsEndChapter = true,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = false,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101103,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_Eastac5_1240739",
        QuestUIId = 0
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17440155447393860826",
            startPort = "Out",
            endQuest = "17440155447393860827",
            endPort = "In"
          },
          {
            startQuest = "17440155447393860827",
            startPort = "Out",
            endQuest = "17440155447393860824",
            endPort = "Success"
          },
          {
            startQuest = "17440155447393860823",
            startPort = "QuestStart",
            endQuest = "17440155447393860828",
            endPort = "In"
          },
          {
            startQuest = "17440155447393860828",
            startPort = "Out",
            endQuest = "17440155447393860826",
            endPort = "In"
          }
        },
        nodeData = {
          ["17440155447393860823"] = {
            key = "17440155447393860823",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17440155447393860824"] = {
            key = "17440155447393860824",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1666.888888888889, y = 311.77777777777777},
            propsData = {ModeType = 0}
          },
          ["17440155447393860825"] = {
            key = "17440155447393860825",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17440155447393860826"] = {
            key = "17440155447393860826",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\128\170\231\137\169",
            pos = {x = 1143.3635764657529, y = 447.083995224142},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240740,
                1240854,
                1240855,
                1240856,
                1240857,
                1240858
              }
            }
          },
          ["17440155447393860827"] = {
            key = "17440155447393860827",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1420.147202196747, y = 358.90706063961875},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 6,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1240740,
                1240854,
                1240855,
                1240856,
                1240857,
                1240858
              }
            }
          },
          ["17440155447393860828"] = {
            key = "17440155447393860828",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1130.451855171814, y = 186.41868280093897},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240739,
              GuideType = "M",
              GuidePointName = "Mechanism_Eastac5_1240739"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
