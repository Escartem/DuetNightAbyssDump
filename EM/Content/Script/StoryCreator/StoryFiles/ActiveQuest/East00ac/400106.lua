return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17440155447403860917",
      startPort = "StoryStart",
      endStory = "17440155447403860919",
      endPort = "In"
    },
    {
      startStory = "17440155447403860919",
      startPort = "Success",
      endStory = "17440155447403860918",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17440155447403860917"] = {
      isStoryNode = true,
      key = "17440155447403860917",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 305.0344827586207},
      propsData = {QuestChainId = 400106},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17440155447403860918"] = {
      isStoryNode = true,
      key = "17440155447403860918",
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
    ["17440155447403860919"] = {
      isStoryNode = true,
      key = "17440155447403860919",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1209.4010695187167, y = 320.5882352941176},
      propsData = {
        QuestId = 4001061,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_400106",
        QuestDeatil = "QuestDesc_400106",
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
        StoryGuidePointName = "Mechanism_Eastac6_1240741",
        QuestUIId = 0
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17440155447403860923",
            startPort = "Out",
            endQuest = "17440155447403860924",
            endPort = "In"
          },
          {
            startQuest = "17440155447403860924",
            startPort = "Out",
            endQuest = "17440155447403860921",
            endPort = "Success"
          },
          {
            startQuest = "17440155447403860920",
            startPort = "QuestStart",
            endQuest = "17440155447403860925",
            endPort = "In"
          },
          {
            startQuest = "17440155447403860925",
            startPort = "Out",
            endQuest = "17440155447403860923",
            endPort = "In"
          }
        },
        nodeData = {
          ["17440155447403860920"] = {
            key = "17440155447403860920",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17440155447403860921"] = {
            key = "17440155447403860921",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1666.888888888889, y = 311.77777777777777},
            propsData = {ModeType = 0}
          },
          ["17440155447403860922"] = {
            key = "17440155447403860922",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17440155447403860923"] = {
            key = "17440155447403860923",
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
                1240742,
                1240859,
                1240860,
                1240861,
                1240862,
                1240863
              }
            }
          },
          ["17440155447403860924"] = {
            key = "17440155447403860924",
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
                1240742,
                1240859,
                1240860,
                1240861,
                1240862,
                1240863
              }
            }
          },
          ["17440155447403860925"] = {
            key = "17440155447403860925",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1130.451855171814, y = 186.41868280093897},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240741,
              GuideType = "M",
              GuidePointName = "Mechanism_Eastac6_1240741"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
