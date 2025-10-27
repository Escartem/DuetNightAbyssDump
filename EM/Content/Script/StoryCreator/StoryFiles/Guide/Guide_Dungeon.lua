return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "170117529340427514",
      startPort = "StoryStart",
      endStory = "170117529939627953",
      endPort = "In"
    },
    {
      startStory = "170117529939627953",
      startPort = "Success",
      endStory = "170117529340427517",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["170117529340427514"] = {
      isStoryNode = true,
      key = "170117529340427514",
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
    ["170117529340427517"] = {
      isStoryNode = true,
      key = "170117529340427517",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1980.4, y = 346.8},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["170117529939627953"] = {
      isStoryNode = true,
      key = "170117529939627953",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1233.6371691775712, y = 337.2263967800347},
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
            startQuest = "1720334861033429232",
            startPort = "PC",
            endQuest = "1701334172778142340",
            endPort = "In"
          },
          {
            startQuest = "1720334861033429232",
            startPort = "Mobile",
            endQuest = "1720334873236429679",
            endPort = "In"
          },
          {
            startQuest = "170117530804028775",
            startPort = "Out",
            endQuest = "17466882291168181",
            endPort = "In"
          },
          {
            startQuest = "1701334172778142340",
            startPort = "Out",
            endQuest = "17507664087241972109",
            endPort = "In"
          },
          {
            startQuest = "1720334873236429679",
            startPort = "Out",
            endQuest = "17507664087241972109",
            endPort = "In"
          },
          {
            startQuest = "17563692069152543631",
            startPort = "Gamepad",
            endQuest = "17563692069152543632",
            endPort = "In"
          },
          {
            startQuest = "17563692069152543632",
            startPort = "Out",
            endQuest = "17563692216522543943",
            endPort = "In"
          },
          {
            startQuest = "17466882291168181",
            startPort = "Out",
            endQuest = "170117530804028774",
            endPort = "In"
          },
          {
            startQuest = "1715589607749139244",
            startPort = "Out",
            endQuest = "17563692069152543631",
            endPort = "Input"
          },
          {
            startQuest = "17563692069152543631",
            startPort = "MouseAndKeyboard",
            endQuest = "170117530804028775",
            endPort = "In"
          },
          {
            startQuest = "17563692216522543943",
            startPort = "Out",
            endQuest = "17466882291168181",
            endPort = "In"
          },
          {
            startQuest = "17563692069152543631",
            startPort = "Touch",
            endQuest = "1720336421379431050",
            endPort = "In"
          },
          {
            startQuest = "1720336421379431050",
            startPort = "Out",
            endQuest = "17466882291168181",
            endPort = "In"
          },
          {
            startQuest = "17507664087241972109",
            startPort = "Out",
            endQuest = "17563696431933180660",
            endPort = "In"
          },
          {
            startQuest = "17563696431933180660",
            startPort = "Out",
            endQuest = "170117529939627956",
            endPort = "Success"
          },
          {
            startQuest = "170117530804028774",
            startPort = "Out",
            endQuest = "1720334861033429232",
            endPort = "Input"
          },
          {
            startQuest = "170117529939627954",
            startPort = "QuestStart",
            endQuest = "17581026465841858526",
            endPort = "In"
          },
          {
            startQuest = "17581026465841858526",
            startPort = "Out",
            endQuest = "1715589607749139244",
            endPort = "In"
          }
        },
        nodeData = {
          ["170117529939627954"] = {
            key = "170117529939627954",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -110.45785975389595, y = 278.6809114876295},
            propsData = {ModeType = 0}
          },
          ["170117529939627956"] = {
            key = "170117529939627956",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3396.9105639267127, y = 329.6614193024719},
            propsData = {ModeType = 0}
          },
          ["170117529939627958"] = {
            key = "170117529939627958",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4072.674656321704, y = 664.6895151417775},
            propsData = {}
          },
          ["170117530804028774"] = {
            key = "170117530804028774",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1736.4065696983466, y = 389.17452330005676},
            propsData = {
              MessageId = 300802,
              MessageNote = "\233\128\154\232\191\135\230\140\145\230\136\152\229\174\140\230\136\144\228\184\141\229\144\140\231\154\132\229\167\148\230\137\152\239\188\140\229\143\175\228\187\165\232\142\183\229\190\151\231\170\129\231\160\180\230\157\144\230\150\153\227\128\129\233\147\182\229\184\129\227\128\129\233\173\148\228\185\139\230\165\148\227\128\129\233\147\184\233\128\160\230\157\144\230\150\153\227\128\129\233\147\184\233\128\160\229\155\190\231\186\184\231\173\137\230\157\144\230\150\153\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["170117530804028775"] = {
            key = "170117530804028775",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 1136.5860329329566, y = 75.94332515593968},
            propsData = {
              ShowEnable = true,
              MessageId = 300801,
              MessageNote = "\231\130\185\229\135\187\226\128\156\231\142\169\230\179\149\226\128\157\232\191\155\229\133\165\229\167\148\230\137\152\231\179\187\231\187\159\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = false,
              HighLightUIPath = "BattleMain.ListView:8",
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
              MessageLoc = "Left",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1701334172778142340"] = {
            key = "1701334172778142340",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 2306.6756407671533, y = 271.7459015846183},
            propsData = {
              ShowEnable = true,
              MessageId = 300819,
              MessageNote = "\231\130\185\229\135\187<H>\226\128\156\232\191\189\231\188\137\226\128\157</>\239\188\140\232\191\155\229\133\165\232\191\189\231\188\137\229\167\148\230\137\152\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.Group_Depute:1.PanelRoot:1.List_Depute:2",
              UICompName = "Btn_Click",
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
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1715589607749139244"] = {
            key = "1715589607749139244",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 423.7784896141537, y = 283.1219641520529},
            propsData = {
              MessageId = 300804,
              MessageNote = "\233\128\154\232\191\135\230\140\145\230\136\152\229\174\140\230\136\144\228\184\141\229\144\140\231\154\132\229\167\148\230\137\152\239\188\140\229\143\175\228\187\165\232\142\183\229\190\151\231\170\129\231\160\180\230\157\144\230\150\153\227\128\129\233\147\182\229\184\129\227\128\129\233\173\148\228\185\139\230\165\148\227\128\129\233\147\184\233\128\160\230\157\144\230\150\153\227\128\129\233\147\184\233\128\160\229\155\190\231\186\184\231\173\137\230\157\144\230\150\153\227\128\130",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["1720334861033429232"] = {
            key = "1720334861033429232",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 2011.071145726595, y = 302.316713336318},
            propsData = {}
          },
          ["1720334873236429679"] = {
            key = "1720334873236429679",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 2299.142192197301, y = 420.41831761439283},
            propsData = {
              ShowEnable = true,
              MessageId = 300819,
              MessageNote = "\231\130\185\229\135\187<H>\226\128\156\232\191\189\231\188\137\226\128\157</>\239\188\140\232\191\155\229\133\165\232\191\189\231\188\137\229\167\148\230\137\152\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.Group_Depute:1.PanelRoot:1.List_Depute:2",
              UICompName = "Btn_Click",
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
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1720336283671430413"] = {
            key = "1720336283671430413",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 1724.8614759509787, y = -430.05558343640996},
            propsData = {}
          },
          ["1720336421379431050"] = {
            key = "1720336421379431050",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 1111.5072519138937, y = 543.2359452504587},
            propsData = {
              ShowEnable = true,
              MessageId = 300801,
              MessageNote = "\231\130\185\229\135\187\226\128\156\231\142\169\230\179\149\226\128\157\232\191\155\229\133\165\229\167\148\230\137\152\231\179\187\231\187\159\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = false,
              HighLightUIPath = "BattleMain.ListView:8",
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
              MessageLoc = "Left",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17344022520466046"] = {
            key = "17344022520466046",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1727.6201559116982, y = -24.0040542096653},
            propsData = {
              MessageId = 300806,
              MessageNote = "",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["17466882291168181"] = {
            key = "17466882291168181",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1457.0644419777389, y = 397.1110945720997},
            propsData = {
              ShowEnable = true,
              MessageId = 300813,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.ComTab.EMScrollBox_TabItem:2",
              UICompName = "Btn",
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
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17474669401624610"] = {
            key = "17474669401624610",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 3465.288739639728, y = 706.0452400000295},
            propsData = {
              ShowEnable = true,
              MessageId = 300816,
              MessageNote = "\231\161\174\229\174\154\228\191\157\229\173\152",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "CommonDialog.Pos_Btn:1.Btn_Yes",
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
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["174775735717126177942"] = {
            key = "174775735717126177942",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 759.9273962788018, y = 1270.3865542301655},
            propsData = {
              ShowEnable = true,
              MessageId = 300808,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.Group_Root:Depute.DefaultList.List_Default:1",
              UICompName = "Range",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 400, Y = 540},
              UICompLocOffset = {X = 0, Y = -100},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Left",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17507663826161971741"] = {
            key = "17507663826161971741",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 3623.5095179185946, y = 1208.7340190099658},
            propsData = {
              ShowEnable = true,
              MessageId = 300818,
              MessageNote = "\230\148\182\232\181\183\233\162\132\232\174\190",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.Group_Root:Depute.DefaultList.Preview",
              UICompName = "Btn_Show",
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
              MessageLoc = "Left",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17507664087241972109"] = {
            key = "17507664087241972109",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2785.4686639557694, y = 330.10076840502063},
            propsData = {
              ShowEnable = true,
              MessageId = 300817,
              MessageNote = "\229\188\128\229\167\139\230\140\145\230\136\152",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.Group_Root:Depute.Button_Solo",
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
          ["175427467209589119"] = {
            key = "175427467209589119",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1597.9782032809314, y = 651.0714148894339},
            propsData = {
              ShowEnable = true,
              MessageId = 300813,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.ComTab.EMScrollBox_TabItem:2",
              UICompName = "Btn",
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
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17563692069152543631"] = {
            key = "17563692069152543631",
            type = "InputDeviceBranchNode",
            name = "\232\190\147\229\133\165\232\174\190\229\164\135\229\136\134\230\148\175",
            pos = {x = 677.7223429146059, y = 265.3251088274271},
            propsData = {}
          },
          ["17563692069152543632"] = {
            key = "17563692069152543632",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 922.5396132950215, y = 308.5328073449733},
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
          ["17563692216522543943"] = {
            key = "17563692216522543943",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1140.8534709620717, y = 317.30662607879503},
            propsData = {
              ShowEnable = true,
              MessageId = 300801,
              MessageNote = "\231\130\185\229\135\187<H>\226\128\156\230\149\180\229\164\135\226\128\157</>\232\191\155\229\133\165\230\149\180\229\164\135\231\179\187\231\187\159\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = false,
              HighLightUIPath = "MenuWorld.Panel_Function:5",
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
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17563696431933180660"] = {
            key = "17563696431933180660",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 3074.2294957125323, y = 347.25080318021594},
            propsData = {
              ShowEnable = true,
              MessageId = 300817,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "CommonDialog.Pos_Btn:1.Btn_Yes",
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
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17581026465841858526"] = {
            key = "17581026465841858526",
            type = "MSDKUploadNode",
            name = "\230\181\183\229\164\150\229\184\130\229\156\186SDK\229\159\139\231\130\185\228\184\138\230\138\165",
            pos = {x = 148, y = 268},
            propsData = {
              EventName = "task_training_end"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
