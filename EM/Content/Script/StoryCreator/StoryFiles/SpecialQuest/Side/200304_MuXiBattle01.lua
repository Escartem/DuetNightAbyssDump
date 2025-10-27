return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17533575536791",
      startPort = "StoryStart",
      endStory = "1753358093343571",
      endPort = "In"
    },
    {
      startStory = "1753358093343571",
      startPort = "Success",
      endStory = "17533575536795",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17533575536791"] = {
      isStoryNode = true,
      key = "17533575536791",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1670.7857142857142, y = 326.15714285714284},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17533575536795"] = {
      isStoryNode = true,
      key = "17533575536795",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2353.4285714285716, y = 306.3},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1753358093343571"] = {
      isStoryNode = true,
      key = "1753358093343571",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 2015.0964285714285, y = 312.43571428571425},
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
        StoryGuidePointName = "Mechanism_2090230"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1753358093343572",
            startPort = "QuestStart",
            endQuest = "1755484441751581",
            endPort = "In"
          },
          {
            startQuest = "1755484441751581",
            startPort = "Out",
            endQuest = "17534266294761698",
            endPort = "In"
          },
          {
            startQuest = "17534266294761698",
            startPort = "Out",
            endQuest = "17534266581982124",
            endPort = "In"
          },
          {
            startQuest = "1753358093343572",
            startPort = "QuestStart",
            endQuest = "1753528225971667270",
            endPort = "In"
          },
          {
            startQuest = "17534266581982124",
            startPort = "Out",
            endQuest = "17554851012431765",
            endPort = "In"
          },
          {
            startQuest = "17554851012431765",
            startPort = "Out",
            endQuest = "1753527037161752",
            endPort = "In"
          }
        },
        nodeData = {
          ["1753358093343572"] = {
            key = "1753358093343572",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 985.7054698457223, y = 294.8499298737728},
            propsData = {ModeType = 0}
          },
          ["1753358093344579"] = {
            key = "1753358093344579",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1824.496496711322, y = -68.89189981622104},
            propsData = {ModeType = 0}
          },
          ["1753358093344586"] = {
            key = "1753358093344586",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17534266294761698"] = {
            key = "17534266294761698",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1485.016577060932, y = 294.30997183819767},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Monster_BiAn_2090161",
              StaticCreatorIdList = {2090161, 2090162}
            }
          },
          ["17534266581982124"] = {
            key = "17534266581982124",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1737.274641577061, y = 290.37448796722987},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 2,
              IsShow = true,
              GuideType = "N",
              GuideName = "Monster_BiAn_2090161",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {2090161, 2090162}
            }
          },
          ["1753527037161752"] = {
            key = "1753527037161752",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 2302.1188725490197, y = 292.8296568627452},
            propsData = {}
          },
          ["1753528225971667270"] = {
            key = "1753528225971667270",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1241.3444009138695, y = 132.03467632881865},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51104064,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1755484441751581"] = {
            key = "1755484441751581",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 1242.1850649350654, y = 296.85026085026095},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {2090342}
            }
          },
          ["17554851012431765"] = {
            key = "17554851012431765",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 2030.1850649350654, y = 294.85026085026095},
            propsData = {
              IsCreate = false,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {2090342}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
