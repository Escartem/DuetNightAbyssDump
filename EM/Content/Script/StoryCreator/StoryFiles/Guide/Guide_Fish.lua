return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17435798805061",
      startPort = "StoryStart",
      endStory = "1743579959386507",
      endPort = "In"
    },
    {
      startStory = "1743579959386507",
      startPort = "Success",
      endStory = "17435798805065",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17435798805061"] = {
      isStoryNode = true,
      key = "17435798805061",
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
    ["17435798805065"] = {
      isStoryNode = true,
      key = "17435798805065",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2800, y = 300},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1743579959386507"] = {
      isStoryNode = true,
      key = "1743579959386507",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1670.7499999999998, y = 301.5},
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
            startQuest = "17435823210815859",
            startPort = "Out",
            endQuest = "17435800020091913",
            endPort = "In"
          },
          {
            startQuest = "17435800020091913",
            startPort = "Out",
            endQuest = "17435820797115088",
            endPort = "In"
          },
          {
            startQuest = "17435820797115088",
            startPort = "Out",
            endQuest = "1743582510780526835",
            endPort = "In"
          },
          {
            startQuest = "1743582510780526835",
            startPort = "Out",
            endQuest = "1743579959387515",
            endPort = "Success"
          },
          {
            startQuest = "1743579959386508",
            startPort = "QuestStart",
            endQuest = "1754447494200425",
            endPort = "In"
          },
          {
            startQuest = "1754447494200425",
            startPort = "Out",
            endQuest = "17435823210815859",
            endPort = "In"
          }
        },
        nodeData = {
          ["1743579959386508"] = {
            key = "1743579959386508",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1743579959387515"] = {
            key = "1743579959387515",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1743579959387522"] = {
            key = "1743579959387522",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17435800020091913"] = {
            key = "17435800020091913",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1446.6027306027304, y = 292.66666666666674},
            propsData = {
              ShowEnable = true,
              MessageId = 310002,
              MessageNote = "",
              DelayTime = 0.2,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "AnglingMain.Angling_Main.Item01.Item",
              UICompName = "ItemDetails_MenuAnchor",
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
              MessageLoc = "UpLeft",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17435820797115088"] = {
            key = "17435820797115088",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1777.2693972693971, y = 291.33333333333337},
            propsData = {
              ShowEnable = true,
              MessageId = 310003,
              MessageNote = "",
              DelayTime = 0.2,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "AnglingMain.Angling_Main.BtnText",
              UICompName = "Button_Area",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "UpLeft",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17435823210815859"] = {
            key = "17435823210815859",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1129.2693972693971, y = 293.33333333333337},
            propsData = {
              ShowEnable = true,
              MessageId = 310001,
              MessageNote = "",
              DelayTime = 0.2,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "AnglingMain.Angling_Main.Item02.Item",
              UICompName = "ItemDetails_MenuAnchor",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "UpLeft",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17435824044197788"] = {
            key = "17435824044197788",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2158.60273060273, y = 486.66666666666674},
            propsData = {
              ShowEnable = true,
              MessageId = 310005,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "",
              UICompName = "",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1743582510780526835"] = {
            key = "1743582510780526835",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 2261.269397269397, y = 306.66666666666674},
            propsData = {GuideId = 72}
          },
          ["1754447494200425"] = {
            key = "1754447494200425",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1149.7034302985362, y = 72.54155390709911},
            propsData = {WaitTime = 0.2}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
