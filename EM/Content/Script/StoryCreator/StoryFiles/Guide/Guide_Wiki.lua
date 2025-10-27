return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1745049350247897534",
      startPort = "StoryStart",
      endStory = "1745049350248897536",
      endPort = "In"
    },
    {
      startStory = "1745049350248897536",
      startPort = "Success",
      endStory = "1745049350248897535",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1745049350247897534"] = {
      isStoryNode = true,
      key = "1745049350247897534",
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
    ["1745049350248897535"] = {
      isStoryNode = true,
      key = "1745049350248897535",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1611.25, y = 301.875},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1745049350248897536"] = {
      isStoryNode = true,
      key = "1745049350248897536",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1194, y = 312},
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
            startQuest = "1745049350248897542",
            startPort = "Out",
            endQuest = "1745049350248897543",
            endPort = "In"
          },
          {
            startQuest = "1745049350248897537",
            startPort = "Out",
            endQuest = "1745049350248897538",
            endPort = "In"
          },
          {
            startQuest = "1745049350248897539",
            startPort = "QuestStart",
            endQuest = "1745049350248897537",
            endPort = "In"
          },
          {
            startQuest = "1745049350248897538",
            startPort = "Out",
            endQuest = "1745049350248897540",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1745049350248897537"] = {
            key = "1745049350248897537",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1040.8001307942438, y = 153.1325646051481},
            propsData = {WaitTime = 1.5}
          },
          ["1745049350248897538"] = {
            key = "1745049350248897538",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1367.3001307942436, y = 173.67423127181476},
            propsData = {GuideId = 69}
          },
          ["1745049350248897539"] = {
            key = "1745049350248897539",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1745049350248897540"] = {
            key = "1745049350248897540",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1799.3808857808858, y = 290.68717948717944},
            propsData = {ModeType = 0}
          },
          ["1745049350248897541"] = {
            key = "1745049350248897541",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1745049350248897542"] = {
            key = "1745049350248897542",
            type = "ShowGuideButtonNode",
            name = "\231\130\185\229\135\187\230\159\165\233\152\133\232\175\141\230\157\161",
            pos = {x = 1167.08663003663, y = 303.9807692307693},
            propsData = {
              ShowEnable = true,
              MessageId = 300402,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = false,
              HighLightUIPath = "BattleMain.ListView:9",
              UICompName = "Button_Key",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "DownLeft",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1745049350248897543"] = {
            key = "1745049350248897543",
            type = "ShowGuideTextNode",
            name = "\229\145\138\231\159\165\231\142\169\229\174\182\229\143\175\228\187\165\230\159\165\233\152\133\232\175\141\230\157\161Tips",
            pos = {x = 1489.1397908279182, y = 295.80289024700824},
            propsData = {
              MessageId = 300403,
              MessageNote = "\229\156\168\232\191\153\233\135\140\229\143\175\228\187\165\230\159\165\233\152\133\229\136\176\230\149\133\228\186\139\229\143\176\232\175\141\228\184\173\231\154\132\228\184\128\228\186\155\231\165\158\231\167\152\231\154\132\232\175\141\232\175\173\232\167\163\233\135\138\227\128\130\227\128\144\229\190\133\229\140\133\232\163\133\227\128\145",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "Middle",
              GuidemanHead = "Bai_Idle"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
