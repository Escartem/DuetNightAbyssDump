return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17339028737161141367",
      startPort = "StoryStart",
      endStory = "17339028737161141369",
      endPort = "In"
    },
    {
      startStory = "17339028737161141369",
      startPort = "Success",
      endStory = "17339028737161141368",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17339028737161141367"] = {
      isStoryNode = true,
      key = "17339028737161141367",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 954, y = 314},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17339028737161141368"] = {
      isStoryNode = true,
      key = "17339028737161141368",
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
    ["17339028737161141369"] = {
      isStoryNode = true,
      key = "17339028737161141369",
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
            startQuest = "17339028737161141370",
            startPort = "QuestStart",
            endQuest = "17339028737161141375",
            endPort = "In"
          },
          {
            startQuest = "17339028737161141375",
            startPort = "Out",
            endQuest = "17339028737161141374",
            endPort = "In"
          },
          {
            startQuest = "17339028737161141373",
            startPort = "Out",
            endQuest = "17339028737161141377",
            endPort = "In"
          },
          {
            startQuest = "17339028737161141375",
            startPort = "Out",
            endQuest = "17339028737161141373",
            endPort = "In"
          },
          {
            startQuest = "17339028737161141376",
            startPort = "Out",
            endQuest = "17339028737161141371",
            endPort = "Success"
          },
          {
            startQuest = "17339028737161141374",
            startPort = "Out",
            endQuest = "17339028737161141378",
            endPort = "In"
          },
          {
            startQuest = "17339028737161141378",
            startPort = "Out",
            endQuest = "17339028737161141376",
            endPort = "In"
          }
        },
        nodeData = {
          ["17339028737161141370"] = {
            key = "17339028737161141370",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17339028737161141371"] = {
            key = "17339028737161141371",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17339028737161141372"] = {
            key = "17339028737161141372",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17339028737161141373"] = {
            key = "17339028737161141373",
            type = "ListenActorDestroyNode",
            name = "\231\155\145\229\144\172Actor\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1672.5705037996056, y = 274.3357725865465},
            propsData = {
              StaticCreatorId = 1590180,
              DestroyReason = "MonsterInitiate"
            }
          },
          ["17339028737161141374"] = {
            key = "17339028737161141374",
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
              StaticCreatorIdList = {1590180}
            }
          },
          ["17339028737161141375"] = {
            key = "17339028737161141375",
            type = "ChangeStaticCreatorNode",
            name = "\230\137\147\229\138\171\231\154\142\231\154\142\229\135\186\231\142\176",
            pos = {x = 1217.11595834506, y = 296.65634674922603},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1590180}
            }
          },
          ["17339028737161141376"] = {
            key = "17339028737161141376",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2326.910216718266, y = 483.8142414860681},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17339028737161141377"] = {
            key = "17339028737161141377",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 2148.910216718266, y = 274.5510835913312},
            propsData = {UseTalkFadeOut = false, TalkFadeOutTime = 0}
          },
          ["17339028737161141378"] = {
            key = "17339028737161141378",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1984, y = 494},
            propsData = {WaitTime = 3}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
