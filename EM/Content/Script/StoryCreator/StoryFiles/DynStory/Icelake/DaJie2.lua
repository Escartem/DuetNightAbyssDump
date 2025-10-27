return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1732783210456451483",
      startPort = "StoryStart",
      endStory = "1732783210456451485",
      endPort = "In"
    },
    {
      startStory = "1732783210456451485",
      startPort = "Success",
      endStory = "1732783210456451484",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1732783210456451483"] = {
      isStoryNode = true,
      key = "1732783210456451483",
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
    ["1732783210456451484"] = {
      isStoryNode = true,
      key = "1732783210456451484",
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
    ["1732783210456451485"] = {
      isStoryNode = true,
      key = "1732783210456451485",
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
            startQuest = "1732783210456451486",
            startPort = "QuestStart",
            endQuest = "1732783210456451491",
            endPort = "In"
          },
          {
            startQuest = "1732783210456451491",
            startPort = "Out",
            endQuest = "1732783210456451490",
            endPort = "In"
          },
          {
            startQuest = "1732783210456451489",
            startPort = "Out",
            endQuest = "1732783210456451493",
            endPort = "In"
          },
          {
            startQuest = "1732783210456451490",
            startPort = "Out",
            endQuest = "1732783210456451492",
            endPort = "In"
          },
          {
            startQuest = "1732783210456451491",
            startPort = "Out",
            endQuest = "1732783210456451489",
            endPort = "In"
          },
          {
            startQuest = "1732783210456451492",
            startPort = "Out",
            endQuest = "1732783210456451487",
            endPort = "Success"
          },
          {
            startQuest = "1732783210456451493",
            startPort = "Out",
            endQuest = "1732783210456451487",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1732783210456451486"] = {
            key = "1732783210456451486",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1732783210456451487"] = {
            key = "1732783210456451487",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2815, y = 463.84615384615387},
            propsData = {ModeType = 0}
          },
          ["1732783210456451488"] = {
            key = "1732783210456451488",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1732783210456451489"] = {
            key = "1732783210456451489",
            type = "ListenActorDestroyNode",
            name = "\231\155\145\229\144\172Actor\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1672.5705037996056, y = 274.3357725865465},
            propsData = {
              StaticCreatorId = 1240337,
              DestroyReason = "MonsterInitiate"
            }
          },
          ["1732783210456451490"] = {
            key = "1732783210456451490",
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
              StaticCreatorIdList = {1240337}
            }
          },
          ["1732783210456451491"] = {
            key = "1732783210456451491",
            type = "ChangeStaticCreatorNode",
            name = "\230\137\147\229\138\171\231\154\142\231\154\142\229\135\186\231\142\176",
            pos = {x = 1217.11595834506, y = 296.65634674922603},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240337}
            }
          },
          ["1732783210456451492"] = {
            key = "1732783210456451492",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2148.910216718266, y = 479.8142414860681},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1732783210456451493"] = {
            key = "1732783210456451493",
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
