return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1732783210485457564",
      startPort = "StoryStart",
      endStory = "1732783210485457566",
      endPort = "In"
    },
    {
      startStory = "1732783210485457566",
      startPort = "Success",
      endStory = "1732783210485457565",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1732783210485457564"] = {
      isStoryNode = true,
      key = "1732783210485457564",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 954, y = 315.15384615384613},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783210485457565"] = {
      isStoryNode = true,
      key = "1732783210485457565",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1872, y = 326},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783210485457566"] = {
      isStoryNode = true,
      key = "1732783210485457566",
      type = "StoryNode",
      name = "\230\137\147\229\138\171\231\154\142\231\154\142",
      pos = {x = 1450, y = 322},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_DaJie_Des",
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
        bIsDynamicEvent = true,
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
            startQuest = "1732783210485457567",
            startPort = "QuestStart",
            endQuest = "1732783210485457572",
            endPort = "In"
          },
          {
            startQuest = "1732783210485457572",
            startPort = "Out",
            endQuest = "1732783210485457571",
            endPort = "In"
          },
          {
            startQuest = "1732783210485457570",
            startPort = "Out",
            endQuest = "1732783210485457574",
            endPort = "In"
          },
          {
            startQuest = "1732783210485457571",
            startPort = "Out",
            endQuest = "1732783210485457573",
            endPort = "In"
          },
          {
            startQuest = "1732783210485457572",
            startPort = "Out",
            endQuest = "1732783210485457570",
            endPort = "In"
          },
          {
            startQuest = "1732783210485457573",
            startPort = "Out",
            endQuest = "1732783210485457568",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1732783210485457567"] = {
            key = "1732783210485457567",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1732783210485457568"] = {
            key = "1732783210485457568",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2815, y = 463.84615384615387},
            propsData = {ModeType = 0}
          },
          ["1732783210485457569"] = {
            key = "1732783210485457569",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1732783210485457570"] = {
            key = "1732783210485457570",
            type = "ListenActorDestroyNode",
            name = "\231\155\145\229\144\172Actor\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1672.5705037996056, y = 274.3357725865465},
            propsData = {
              StaticCreatorId = 1270066,
              DestroyReason = "MonsterInitiate"
            }
          },
          ["1732783210485457571"] = {
            key = "1732783210485457571",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1672.0681114551082, y = 487.7089783281733},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 1,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {1270066}
            }
          },
          ["1732783210485457572"] = {
            key = "1732783210485457572",
            type = "ChangeStaticCreatorNode",
            name = "\230\137\147\229\138\171\231\154\142\231\154\142\229\135\186\231\142\176",
            pos = {x = 1217.11595834506, y = 296.65634674922603},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1270066}
            }
          },
          ["1732783210485457573"] = {
            key = "1732783210485457573",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2148.910216718266, y = 479.8142414860681},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1732783210485457574"] = {
            key = "1732783210485457574",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 2147.7563705644197, y = 275.7049297451773},
            propsData = {UseTalkFadeOut = false, TalkFadeOutTime = 0}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
