return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17513586009841",
      startPort = "StoryStart",
      endStory = "1751359489764263",
      endPort = "In"
    },
    {
      startStory = "1751359489764263",
      startPort = "Success",
      endStory = "17513586009855",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17513586009841"] = {
      isStoryNode = true,
      key = "17513586009841",
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
    ["17513586009855"] = {
      isStoryNode = true,
      key = "17513586009855",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1798, y = 286},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1751359489764263"] = {
      isStoryNode = true,
      key = "1751359489764263",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1274, y = 270},
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
            startQuest = "17561037823261899012",
            startPort = "MouseAndKeyboard",
            endQuest = "17561037823251899009",
            endPort = "In"
          },
          {
            startQuest = "17561037823261899012",
            startPort = "Gamepad",
            endQuest = "17561037823251899010",
            endPort = "In"
          },
          {
            startQuest = "17561037823251899010",
            startPort = "Out",
            endQuest = "17561037823261899011",
            endPort = "In"
          },
          {
            startQuest = "17561037823261899012",
            startPort = "Touch",
            endQuest = "17561037823251899008",
            endPort = "In"
          },
          {
            startQuest = "17561043879952531208",
            startPort = "Out",
            endQuest = "17561046589002532477",
            endPort = "In"
          },
          {
            startQuest = "1751364936812634897",
            startPort = "Out",
            endQuest = "17561037823261899012",
            endPort = "Input"
          },
          {
            startQuest = "17561047308622533181",
            startPort = "Out",
            endQuest = "17561051737804426909",
            endPort = "In"
          },
          {
            startQuest = "1756175723407952120",
            startPort = "PC",
            endQuest = "1756175714132951893",
            endPort = "In"
          },
          {
            startQuest = "1756175723407952120",
            startPort = "Mobile",
            endQuest = "1756175714132951894",
            endPort = "In"
          },
          {
            startQuest = "17561046589002532477",
            startPort = "Out",
            endQuest = "1756175723407952120",
            endPort = "Input"
          },
          {
            startQuest = "17561037823251899009",
            startPort = "Out",
            endQuest = "17561047308622533181",
            endPort = "In"
          },
          {
            startQuest = "17561037823261899011",
            startPort = "Out",
            endQuest = "17561047308622533181",
            endPort = "In"
          },
          {
            startQuest = "17561037823251899008",
            startPort = "Out",
            endQuest = "17561047308622533181",
            endPort = "In"
          },
          {
            startQuest = "17561051737804426909",
            startPort = "Out",
            endQuest = "175611390619111989531",
            endPort = "In"
          },
          {
            startQuest = "1751359489765264",
            startPort = "QuestStart",
            endQuest = "1751359489766271",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1751359489765264"] = {
            key = "1751359489765264",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 338, y = 204},
            propsData = {ModeType = 0}
          },
          ["1751359489766271"] = {
            key = "1751359489766271",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 852.2249762254951, y = 225.15297178548144},
            propsData = {ModeType = 0}
          },
          ["1751359489766278"] = {
            key = "1751359489766278",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3662.356993640227, y = 658.9244853600707},
            propsData = {}
          },
          ["1751364936812634897"] = {
            key = "1751364936812634897",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1028.275862084085, y = 498.06896584987453},
            propsData = {
              MessageId = 303401,
              MessageNote = "\230\186\175\230\186\144\228\187\139\231\187\141",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              GuideManPosEnum = "Upleft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["17561037823251899008"] = {
            key = "17561037823251899008",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1707.8964288382467, y = 748.0261511538386},
            propsData = {
              ShowEnable = true,
              MessageId = 300002,
              MessageNote = "\231\130\185\229\135\187<H>\226\128\156\230\149\180\229\164\135\226\128\157</>\232\191\155\229\133\165\230\149\180\229\164\135\231\179\187\231\187\159\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = false,
              HighLightUIPath = "BattleMain.ListView:1",
              UICompName = "Btn_top",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = true,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Left",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17561037823251899009"] = {
            key = "17561037823251899009",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1827.20253776233, y = 378.8139982988433},
            propsData = {
              ShowEnable = true,
              MessageId = 300002,
              MessageNote = "\231\130\185\229\135\187<H>\226\128\156\230\149\180\229\164\135\226\128\157</>\232\191\155\229\133\165\230\149\180\229\164\135\231\179\187\231\187\159\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = false,
              HighLightUIPath = "BattleMain.ListView:1",
              UICompName = "Btn_top",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = true,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Left",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17561037823251899010"] = {
            key = "17561037823251899010",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 1757.5291911672339, y = 524.6911365021729},
            propsData = {
              MessageId = 301611,
              SkillNameList = {"OpenMenu"},
              LastTime = -1,
              bIsForceTouch = true,
              bIsTimeDilation = true,
              HighLightUIPath = "BattleMain.Btn_Esc",
              UICompName = "Btn_top",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              ForbidSuccessAnim = false,
              IsNotForceRelease = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Left",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17561037823261899011"] = {
            key = "17561037823261899011",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2038.8207872653375, y = 522.9530484133222},
            propsData = {
              ShowEnable = true,
              MessageId = 300002,
              MessageNote = "\231\130\185\229\135\187<H>\226\128\156\230\149\180\229\164\135\226\128\157</>\232\191\155\229\133\165\230\149\180\229\164\135\231\179\187\231\187\159\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = false,
              HighLightUIPath = "MenuWorld.Panel_Function:1",
              UICompName = "Button_Area",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = true,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17561037823261899012"] = {
            key = "17561037823261899012",
            type = "InputDeviceBranchNode",
            name = "\232\190\147\229\133\165\232\174\190\229\164\135\229\136\134\230\148\175",
            pos = {x = 1412.7119216637602, y = 505.62136880743384},
            propsData = {}
          },
          ["17561043879952531208"] = {
            key = "17561043879952531208",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2128.1290218484687, y = -11.731595599958318},
            propsData = {
              ShowEnable = true,
              MessageId = 303403,
              MessageNote = "\229\177\149\229\188\128\232\167\146\232\137\178\229\136\151\232\161\168",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Btn_Selective",
              UICompName = "Button_Area",
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
              MessageLoc = "DownRight",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17561046589002532477"] = {
            key = "17561046589002532477",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2455.399032888631, y = 0.1591734865984975},
            propsData = {
              ShowEnable = true,
              MessageId = 303404,
              MessageNote = "\231\130\185\229\135\187\230\157\190\233\156\178",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Selective_Listing.TileView_Select_Role:9",
              UICompName = "Node_Widget",
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
              MessageLoc = "DownRight",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17561047308622533181"] = {
            key = "17561047308622533181",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2418.933355737897, y = 538.7987290890127},
            propsData = {
              ShowEnable = true,
              MessageId = 303405,
              MessageNote = "\231\130\185\229\135\187\230\186\175\230\186\144",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.EMListView_SubTab:3",
              UICompName = "TextBlock_Name",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 75, Y = 30},
              UICompLocOffset = {X = -15, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17561051737804426909"] = {
            key = "17561051737804426909",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1546.1423537968585, y = 1139.499987151398},
            propsData = {
              ShowEnable = true,
              MessageId = 303406,
              MessageNote = "\230\159\165\231\156\139\231\172\172\228\184\128\230\186\175\230\186\144",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:2.InronItem_1",
              UICompName = "Btn_Area",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 325, Y = 425},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Left",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["175611390619111989531"] = {
            key = "175611390619111989531",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2102.275862084085, y = 1142.2068966726815},
            propsData = {
              ShowEnable = true,
              MessageId = 303407,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryTraceDetails.Btn_Unlock",
              UICompName = "Button_Area",
              GamePadWidgetName = "Key_GamePad",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1756175714132951893"] = {
            key = "1756175714132951893",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 3102.5422493119013, y = -60.130862109427994},
            propsData = {
              ShowEnable = true,
              MessageId = 302807,
              MessageNote = "\232\191\148\229\155\158",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Tab_Arm.Panel_Back:1",
              UICompName = "Btn_Back",
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
              MessageLoc = "DownRight",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1756175714132951894"] = {
            key = "1756175714132951894",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 3096.131014727392, y = 123.48088536727698},
            propsData = {
              ShowEnable = true,
              MessageId = 302807,
              MessageNote = "\232\191\148\229\155\158",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "MailMain.Common_Tab.Btn_Back",
              UICompName = "Btn_Back",
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
              MessageLoc = "DownRight",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1756175723407952120"] = {
            key = "1756175723407952120",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 2723.2496728658384, y = 25.153271633151924},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
