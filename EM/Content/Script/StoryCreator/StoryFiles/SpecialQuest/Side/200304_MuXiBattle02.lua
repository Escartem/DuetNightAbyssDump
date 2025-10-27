return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17533583198601267431",
      startPort = "StoryStart",
      endStory = "17533583198611267433",
      endPort = "In"
    },
    {
      startStory = "17533583198611267433",
      startPort = "Success",
      endStory = "17533583198611267432",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17533583198601267431"] = {
      isStoryNode = true,
      key = "17533583198601267431",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1674.8, y = 310.40000000000003},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17533583198611267432"] = {
      isStoryNode = true,
      key = "17533583198611267432",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2330.8, y = 295.2},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17533583198611267433"] = {
      isStoryNode = true,
      key = "17533583198611267433",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 2015.2250000000001, y = 303.34999999999997},
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
        SubRegionId = 104108,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "2090245"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17533583198611267434",
            startPort = "QuestStart",
            endQuest = "1753691648347932",
            endPort = "In"
          },
          {
            startQuest = "17536916572561126",
            startPort = "Out",
            endQuest = "17536916621051230",
            endPort = "In"
          },
          {
            startQuest = "1753691648347932",
            startPort = "Out",
            endQuest = "17536916572561126",
            endPort = "In"
          }
        },
        nodeData = {
          ["17533583198611267434"] = {
            key = "17533583198611267434",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 841.9658385093169, y = 382.54347826086956},
            propsData = {ModeType = 0}
          },
          ["17533583198611267435"] = {
            key = "17533583198611267435",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2041.2422360248445, y = 387.5776397515528},
            propsData = {ModeType = 0}
          },
          ["17533583198611267436"] = {
            key = "17533583198611267436",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1753691648347932"] = {
            key = "1753691648347932",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1131.4107142857144, y = 384.4857142857142},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Monster_BiAn_2090246",
              StaticCreatorIdList = {2090246, 2090247}
            }
          },
          ["17536916572561126"] = {
            key = "17536916572561126",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1415.3392857142858, y = 373.7714285714285},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 2,
              IsShow = true,
              GuideType = "N",
              GuideName = "Monster_BiAn_2090161",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {2090246, 2090247}
            }
          },
          ["17536916621051230"] = {
            key = "17536916621051230",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 1746.4107142857144, y = 390.91428571428565},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
