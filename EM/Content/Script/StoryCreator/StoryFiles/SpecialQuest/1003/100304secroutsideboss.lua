return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17370121184391397895",
      startPort = "StoryStart",
      endStory = "17370121184391397897",
      endPort = "In"
    },
    {
      startStory = "17370121184391397897",
      startPort = "Success",
      endStory = "17370121184391397896",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17370121184391397895"] = {
      isStoryNode = true,
      key = "17370121184391397895",
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
    ["17370121184391397896"] = {
      isStoryNode = true,
      key = "17370121184391397896",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1766.4999999999998, y = 303},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17370121184391397897"] = {
      isStoryNode = true,
      key = "17370121184391397897",
      type = "StoryNode",
      name = "\231\167\152\229\175\134\229\159\186\229\156\176\229\164\150\230\137\152\230\150\175\229\141\161boss",
      pos = {x = 1271.7133200133198, y = 283.8240426240422},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_1003plus20_1",
        QuestDeatil = "QuestDesc_1003plus20_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
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
            startQuest = "17370121184391397901",
            startPort = "QuestStart",
            endQuest = "17375367257172916",
            endPort = "In"
          },
          {
            startQuest = "17375367257172916",
            startPort = "Out",
            endQuest = "17370121184391397904",
            endPort = "In"
          },
          {
            startQuest = "17370121184391397901",
            startPort = "QuestStart",
            endQuest = "17370121184391397905",
            endPort = "In"
          },
          {
            startQuest = "17370121184391397905",
            startPort = "Out",
            endQuest = "1745567009920555658",
            endPort = "In"
          },
          {
            startQuest = "1745567009920555658",
            startPort = "Out",
            endQuest = "17370121184391397903",
            endPort = "Fail"
          },
          {
            startQuest = "17370121184391397901",
            startPort = "QuestStart",
            endQuest = "1750150983705388",
            endPort = "In"
          },
          {
            startQuest = "17370121184391397901",
            startPort = "QuestStart",
            endQuest = "1758013775481962685",
            endPort = "In"
          }
        },
        nodeData = {
          ["17370121184391397901"] = {
            key = "17370121184391397901",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -2944.4655843674846, y = 304.2587136722017},
            propsData = {ModeType = 0}
          },
          ["17370121184391397902"] = {
            key = "17370121184391397902",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -286.7442432249326, y = 272.00458799303175},
            propsData = {ModeType = 0}
          },
          ["17370121184391397903"] = {
            key = "17370121184391397903",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -844.318762345504, y = 637.7808922771897},
            propsData = {}
          },
          ["17370121184391397904"] = {
            key = "17370121184391397904",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = -1260.1635259401914, y = 279.67846059651504},
            propsData = {}
          },
          ["17370121184391397905"] = {
            key = "17370121184391397905",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = -2596.33393644539, y = 863.3936043316846},
            propsData = {}
          },
          ["17375367257172916"] = {
            key = "17375367257172916",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = -2129.4031377285637, y = 273.3047672863868},
            propsData = {
              SendMessage = "cp2secoutsidebossbegin",
              FinishCondition = "cp2secoutsidebossfinish"
            }
          },
          ["1745567009920555658"] = {
            key = "1745567009920555658",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -1780, y = 868},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "cp2secbossrecreate",
              UnitId = -1
            }
          },
          ["1750150983705388"] = {
            key = "1750150983705388",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -2106, y = -54.00000000000003},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035401,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1758013775481962685"] = {
            key = "1758013775481962685",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = -2607.7142857142862, y = -68.00000000000017},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt02/0061_scene_ex01_escape",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101103},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
