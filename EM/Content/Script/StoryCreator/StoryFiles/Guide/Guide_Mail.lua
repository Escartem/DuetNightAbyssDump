return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1756032377236372512",
      startPort = "StoryStart",
      endStory = "1756032377236372514",
      endPort = "In"
    },
    {
      startStory = "1756032377236372514",
      startPort = "Success",
      endStory = "1756032377236372513",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1756032377236372512"] = {
      isStoryNode = true,
      key = "1756032377236372512",
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
    ["1756032377236372513"] = {
      isStoryNode = true,
      key = "1756032377236372513",
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
    ["1756032377236372514"] = {
      isStoryNode = true,
      key = "1756032377236372514",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1274, y = 268},
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
            startQuest = "1756032377236372519",
            startPort = "Out",
            endQuest = "1756032377236372521",
            endPort = "In"
          },
          {
            startQuest = "1756032377236372528",
            startPort = "Out",
            endQuest = "1756032377236372521",
            endPort = "In"
          },
          {
            startQuest = "1756032377236372529",
            startPort = "PC",
            endQuest = "1756032377236372524",
            endPort = "In"
          },
          {
            startQuest = "1756032377236372529",
            startPort = "Mobile",
            endQuest = "1756032377236372527",
            endPort = "In"
          },
          {
            startQuest = "1756032377236372524",
            startPort = "Out",
            endQuest = "1756032377236372526",
            endPort = "In"
          },
          {
            startQuest = "1756032377236372527",
            startPort = "Out",
            endQuest = "1756032377236372526",
            endPort = "In"
          },
          {
            startQuest = "1756032377236372531",
            startPort = "Out",
            endQuest = "1756032377236372532",
            endPort = "In"
          },
          {
            startQuest = "1756032377236372515",
            startPort = "QuestStart",
            endQuest = "1756032377236372518",
            endPort = "In"
          },
          {
            startQuest = "1756032377236372521",
            startPort = "Out",
            endQuest = "1756032377236372522",
            endPort = "In"
          },
          {
            startQuest = "1756032377236372525",
            startPort = "Out",
            endQuest = "1756032377236372529",
            endPort = "Input"
          },
          {
            startQuest = "17561101592131847",
            startPort = "MouseAndKeyboard",
            endQuest = "1756032377236372519",
            endPort = "In"
          },
          {
            startQuest = "17561101592131847",
            startPort = "Touch",
            endQuest = "1756032377236372528",
            endPort = "In"
          },
          {
            startQuest = "1756032377236372518",
            startPort = "Out",
            endQuest = "17561101592131847",
            endPort = "Input"
          },
          {
            startQuest = "17561101592131847",
            startPort = "Gamepad",
            endQuest = "17561101941382547",
            endPort = "In"
          },
          {
            startQuest = "17561101941382547",
            startPort = "Out",
            endQuest = "1756032377236372521",
            endPort = "In"
          },
          {
            startQuest = "1756032377236372526",
            startPort = "Out",
            endQuest = "1756032377236372533",
            endPort = "In"
          },
          {
            startQuest = "1756032377236372522",
            startPort = "Out",
            endQuest = "1756032377236372516",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1756032377236372515"] = {
            key = "1756032377236372515",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 684, y = 524},
            propsData = {ModeType = 0}
          },
          ["1756032377236372516"] = {
            key = "1756032377236372516",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2813.0403954560707, y = 568.0905595488423},
            propsData = {ModeType = 0}
          },
          ["1756032377236372517"] = {
            key = "1756032377236372517",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2890, y = 956},
            propsData = {}
          },
          ["1756032377236372518"] = {
            key = "1756032377236372518",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1028.275862084085, y = 498.06896584987453},
            propsData = {
              MessageId = 302801,
              MessageNote = "\230\150\176\233\130\174\228\187\182\230\143\144\231\164\186",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              GuideManPosEnum = "Upleft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["1756032377236372519"] = {
            key = "1756032377236372519",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1672.343880900811, y = 280.13995556795544},
            propsData = {
              ShowEnable = true,
              MessageId = 302802,
              MessageNote = "\230\137\147\229\188\128\232\143\156\229\141\149",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = false,
              HighLightUIPath = "BattleMain.Btn_Esc",
              UICompName = "Btn_top",
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
          ["1756032377236372521"] = {
            key = "1756032377236372521",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2110.0856791311794, y = 501.71995841304573},
            propsData = {
              ShowEnable = true,
              MessageId = 302803,
              MessageNote = "\231\130\185\229\135\187\233\130\174\228\187\182",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "MenuWorld.WB_Entrance:2",
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
              MessageLoc = "UpRight",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1756032377236372522"] = {
            key = "1756032377236372522",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2488.441407382622, y = 565.3435727915403},
            propsData = {
              ShowEnable = true,
              MessageId = 302805,
              MessageNote = "\233\162\134\229\143\150\229\133\168\233\131\168\229\165\150\229\138\177",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "MailMain.WBP_Mail_Root.Button_Receive_All",
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
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1756032377236372523"] = {
            key = "1756032377236372523",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2370.927431226131, y = 242.30581958761724},
            propsData = {
              ShowEnable = true,
              MessageId = 302804,
              MessageNote = "\229\156\136\228\184\128\229\176\129\233\130\174\228\187\182",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "MailMain.WBP_Mail_Root.WS_MailList:2:2:3:1:1.Common_List_Subcell_PC",
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
              MessageLoc = "Down",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1756032377236372524"] = {
            key = "1756032377236372524",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1593.0531391666373, y = 787.4363954532284},
            propsData = {
              ShowEnable = true,
              MessageId = 302807,
              MessageNote = "\232\191\148\229\155\158",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "MailMain.Common_Tab.Panel_Back:1",
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
          ["1756032377236372525"] = {
            key = "1756032377236372525",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 998.0384978341551, y = 843.221341453414},
            propsData = {
              MessageId = 302806,
              MessageNote = "\229\144\136\230\136\144\230\143\144\231\164\186",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "Upleft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["1756032377236372526"] = {
            key = "1756032377236372526",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1906.756844030274, y = 855.5104696494009},
            propsData = {
              ShowEnable = true,
              MessageId = 302808,
              MessageNote = "\231\130\185\229\135\187\230\149\180\229\164\135",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "MenuWorld.Panel_Function:1",
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
          ["1756032377236372527"] = {
            key = "1756032377236372527",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1586.641904582128, y = 971.0481429299334},
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
          ["1756032377236372528"] = {
            key = "1756032377236372528",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1587.1696292314225, y = 609.2251258540724},
            propsData = {
              ShowEnable = true,
              MessageId = 302802,
              MessageNote = "\230\137\147\229\188\128\232\143\156\229\141\149",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = false,
              HighLightUIPath = "BattleMain.Btn_Esc",
              UICompName = "Btn_top",
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
          ["1756032377236372529"] = {
            key = "1756032377236372529",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 1284.9177672670812, y = 834.3942513648569},
            propsData = {}
          },
          ["1756032377236372530"] = {
            key = "1756032377236372530",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 676.1828630099483, y = 1812.5955716285314},
            propsData = {
              ShowEnable = true,
              MessageId = 302809,
              MessageNote = "\229\133\179\233\151\173\232\142\183\229\190\151\231\137\169\229\147\129\231\149\140\233\157\162",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "GetItemPage",
              UICompName = "Button_Close",
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
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 150}
            }
          },
          ["1756032377236372531"] = {
            key = "1756032377236372531",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 948.2672974409656, y = 1284.5112051940234},
            propsData = {
              ShowEnable = true,
              MessageId = 302810,
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
          ["1756032377236372532"] = {
            key = "1756032377236372532",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1282.128640449419, y = 1254.4479892767722},
            propsData = {
              ShowEnable = true,
              MessageId = 302811,
              MessageNote = "\231\130\185\229\135\187\233\187\145\230\161\131",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Selective_Listing.TileView_Select_Role:1",
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
          ["1756032377236372533"] = {
            key = "1756032377236372533",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2180.9341088454657, y = 882.477314898538},
            propsData = {
              ShowEnable = true,
              MessageId = 302812,
              MessageNote = "\231\130\185\229\135\187\229\144\136\230\136\144",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:1.Btn_Unlock",
              UICompName = "Btn_Area",
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
          ["1756032377236372534"] = {
            key = "1756032377236372534",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1233.8799725754009, y = 1800.772292012126},
            propsData = {
              ShowEnable = true,
              MessageId = 302808,
              MessageNote = "\229\177\149\229\188\128\232\167\146\232\137\178\229\136\151\232\161\168",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain",
              UICompName = "Key_GamePad",
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
          ["1756106078344634575"] = {
            key = "1756106078344634575",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 3551.463850565692, y = 787.9272843900114},
            propsData = {
              MessageType = "GameMode",
              MessageContent = -1,
              UnitId = -1
            }
          },
          ["17561101592131847"] = {
            key = "17561101592131847",
            type = "InputDeviceBranchNode",
            name = "\232\190\147\229\133\165\232\174\190\229\164\135\229\136\134\230\148\175",
            pos = {x = 1278.707734064924, y = 457.9139766153891},
            propsData = {}
          },
          ["17561101941382547"] = {
            key = "17561101941382547",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 1561.163253874991, y = 471.78103433782775},
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
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
