return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17206900773601",
      startPort = "StoryStart",
      endStory = "1720690096389133794",
      endPort = "In"
    },
    {
      startStory = "1720690096389133794",
      startPort = "Success",
      endStory = "17206900773615",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17206900773601"] = {
      isStoryNode = true,
      key = "17206900773601",
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
    ["17206900773615"] = {
      isStoryNode = true,
      key = "17206900773615",
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
    ["1720690096389133794"] = {
      isStoryNode = true,
      key = "1720690096389133794",
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
            startQuest = "1720690096389133795",
            startPort = "QuestStart",
            endQuest = "1720690185226134646",
            endPort = "In"
          },
          {
            startQuest = "1720690185226134646",
            startPort = "Out",
            endQuest = "1720690139359134466",
            endPort = "In"
          },
          {
            startQuest = "1720690137647134432",
            startPort = "Out",
            endQuest = "1720690212162135137",
            endPort = "In"
          },
          {
            startQuest = "1720690139359134466",
            startPort = "Out",
            endQuest = "1720690210275135108",
            endPort = "In"
          },
          {
            startQuest = "1720690185226134646",
            startPort = "Out",
            endQuest = "1720690137647134432",
            endPort = "In"
          },
          {
            startQuest = "1720690210275135108",
            startPort = "Out",
            endQuest = "1720690096390133798",
            endPort = "Success"
          },
          {
            startQuest = "1720690212162135137",
            startPort = "Out",
            endQuest = "1720690096390133798",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1720690096389133795"] = {
            key = "1720690096389133795",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1720690096390133798"] = {
            key = "1720690096390133798",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2815, y = 463.84615384615387},
            propsData = {ModeType = 0}
          },
          ["1720690096390133801"] = {
            key = "1720690096390133801",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1720690137647134432"] = {
            key = "1720690137647134432",
            type = "ListenActorDestroyNode",
            name = "\231\155\145\229\144\172Actor\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1672.5705037996056, y = 274.3357725865465},
            propsData = {
              StaticCreatorId = 1240321,
              DestroyReason = "MonsterInitiate"
            }
          },
          ["1720690139359134466"] = {
            key = "1720690139359134466",
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
              StaticCreatorIdList = {1240321}
            }
          },
          ["1720690185226134646"] = {
            key = "1720690185226134646",
            type = "ChangeStaticCreatorNode",
            name = "\230\137\147\229\138\171\231\154\142\231\154\142\229\135\186\231\142\176",
            pos = {x = 1217.11595834506, y = 296.65634674922603},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240321}
            }
          },
          ["1720690210275135108"] = {
            key = "1720690210275135108",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2148.910216718266, y = 479.8142414860681},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1720690212162135137"] = {
            key = "1720690212162135137",
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
