return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "170131343011490503",
      startPort = "StoryStart",
      endStory = "170131343218090664",
      endPort = "In"
    },
    {
      startStory = "170131343218090664",
      startPort = "Success",
      endStory = "170131343011490506",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["170131343011490503"] = {
      isStoryNode = true,
      key = "170131343011490503",
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
    ["170131343011490506"] = {
      isStoryNode = true,
      key = "170131343011490506",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2045, y = 355},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["170131343218090664"] = {
      isStoryNode = true,
      key = "170131343218090664",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1427.7762390322023, y = 323.0944627593132},
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
            startQuest = "170131352756792747",
            startPort = "Out",
            endQuest = "170131395875497005",
            endPort = "In"
          },
          {
            startQuest = "170131397474897757",
            startPort = "Out",
            endQuest = "170131408826298899",
            endPort = "In"
          },
          {
            startQuest = "170131395875497005",
            startPort = "Out",
            endQuest = "170554757064688188",
            endPort = "In"
          },
          {
            startQuest = "170554757064688188",
            startPort = "Out",
            endQuest = "170131397474897757",
            endPort = "In"
          },
          {
            startQuest = "170131408826298899",
            startPort = "Out",
            endQuest = "170556300083890930",
            endPort = "In"
          },
          {
            startQuest = "170556300083890930",
            startPort = "Out",
            endQuest = "1701325083198109014",
            endPort = "In"
          },
          {
            startQuest = "1701325083198109014",
            startPort = "Out",
            endQuest = "1701314623119103146",
            endPort = "In"
          },
          {
            startQuest = "1701314623119103146",
            startPort = "Out",
            endQuest = "1701325049951107772",
            endPort = "In"
          },
          {
            startQuest = "170131343218090665",
            startPort = "QuestStart",
            endQuest = "170131356009993691",
            endPort = "In"
          },
          {
            startQuest = "1720320861754139951",
            startPort = "PC",
            endQuest = "17061685216765119",
            endPort = "In"
          },
          {
            startQuest = "1720320861754139951",
            startPort = "Mobile",
            endQuest = "1720320874835140417",
            endPort = "In"
          },
          {
            startQuest = "1701325696337111854",
            startPort = "Out",
            endQuest = "1701325729204113500",
            endPort = "In"
          },
          {
            startQuest = "1701325049951107772",
            startPort = "Out",
            endQuest = "17515421860753781026",
            endPort = "In"
          },
          {
            startQuest = "17515421860753781026",
            startPort = "Out",
            endQuest = "170131343218090667",
            endPort = "Success"
          },
          {
            startQuest = "17555215467702834",
            startPort = "MouseAndKeyboard",
            endQuest = "17555215467702833",
            endPort = "In"
          },
          {
            startQuest = "17555215467702834",
            startPort = "Gamepad",
            endQuest = "17555215467702835",
            endPort = "In"
          },
          {
            startQuest = "17555215467702835",
            startPort = "Out",
            endQuest = "17555215467702836",
            endPort = "In"
          },
          {
            startQuest = "17555215467702834",
            startPort = "Touch",
            endQuest = "17555215467702832",
            endPort = "In"
          },
          {
            startQuest = "170131356009993691",
            startPort = "Out",
            endQuest = "17555215467702834",
            endPort = "Input"
          },
          {
            startQuest = "17555215467702836",
            startPort = "Out",
            endQuest = "170131352756792747",
            endPort = "In"
          },
          {
            startQuest = "17555215467702833",
            startPort = "Out",
            endQuest = "170131352756792747",
            endPort = "In"
          },
          {
            startQuest = "17555215467702832",
            startPort = "Out",
            endQuest = "170131352756792747",
            endPort = "In"
          }
        },
        nodeData = {
          ["170131343218090665"] = {
            key = "170131343218090665",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -272.4164563291928, y = 252.50043197775477},
            propsData = {ModeType = 0}
          },
          ["170131343218090667"] = {
            key = "170131343218090667",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2256.241445974705, y = 794.2255881044799},
            propsData = {ModeType = 0}
          },
          ["170131343218090669"] = {
            key = "170131343218090669",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["170131351135591740"] = {
            key = "170131351135591740",
            type = "ShowGuideButtonNode",
            name = "\231\137\169\229\147\129\229\136\151\232\161\168",
            pos = {x = 935.9216171367581, y = -110.58221546072},
            propsData = {
              ShowEnable = true,
              MessageId = 300701,
              MessageNote = "\227\128\144\229\190\133\229\140\133\232\163\133\227\128\145\228\184\186\232\167\146\232\137\178\227\128\129\230\173\166\229\153\168\232\163\133\229\164\135<H>\233\173\148\228\185\139\230\165\148</>\239\188\140\229\143\175\228\187\165\229\164\167\229\185\133\230\143\144\229\141\135\231\148\159\229\173\152\229\143\138\232\190\147\229\135\186\232\131\189\229\138\155\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMainNew.TileView_Select_Role:2",
              UICompName = "Bg01",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["170131351135591741"] = {
            key = "170131351135591741",
            type = "ShowGuideButtonNode",
            name = "\229\138\168\230\128\129\231\149\140\233\157\162\230\140\137\233\146\174",
            pos = {x = 1491.8837734212534, y = -113.26354649849776},
            propsData = {
              ShowEnable = true,
              MessageId = 300009,
              MessageNote = "\231\130\185\229\135\187\226\128\156+\226\128\157\229\143\183\239\188\140\230\137\147\229\188\128\229\141\135\231\186\167\229\188\185\231\170\151\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMainNew.SubUI_Panel:2.Btn_Lvup",
              UICompName = "Button_Area",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Left",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["170131351135591742"] = {
            key = "170131351135591742",
            type = "ShowGuideButtonNode",
            name = "\231\149\140\233\157\162\229\134\133\229\188\185\231\170\151",
            pos = {x = 1768.79909947451, y = -114.44719044076197},
            propsData = {
              ShowEnable = true,
              MessageId = 300010,
              MessageNote = "\231\130\185\229\135\187\226\128\156+\226\128\157\229\143\183\239\188\140\229\143\175\228\187\165\230\143\144\229\141\135\229\141\135\231\186\167\231\154\132\231\155\174\230\160\135\231\173\137\231\186\167",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "CommonDialog.VB_Node:1.Btn_Add",
              UICompName = "Button_Area",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["170131351135591743"] = {
            key = "170131351135591743",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 911.9760506546713, y = -290.72729386916336},
            propsData = {
              MessageId = 300004,
              MessageNote = "\229\156\168\232\191\145\230\136\152\230\173\166\229\153\168\233\133\141\231\189\174\231\149\140\233\157\162\228\184\173\239\188\140\229\143\175\228\187\165\230\159\165\231\156\139\232\191\145\230\136\152\230\173\166\229\153\168\231\154\132\229\177\158\230\128\167\227\128\129\228\184\186\232\191\145\230\136\152\230\173\166\229\153\168\229\141\135\231\186\167\227\128\129\230\155\191\230\141\162\229\133\182\228\187\150\232\191\145\230\136\152\230\173\166\229\153\168\231\173\137\227\128\130",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["170131351135591744"] = {
            key = "170131351135591744",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 1178.8350250136457, y = -296.01575540762485},
            propsData = {
              ShowEnable = true,
              MessageId = 300002,
              MessageNote = "\231\130\185\229\135\187<H>\226\128\156\230\149\180\229\164\135\226\128\157</>\232\191\155\229\133\165\230\149\180\229\164\135\231\179\187\231\187\159\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "BattleMain.ListView:1",
              UICompName = "Btn_top",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Down",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["170131351135591745"] = {
            key = "170131351135591745",
            type = "ShowGuideButtonNode",
            name = "UI\229\134\133ListView",
            pos = {x = 1482.4247686033893, y = -283.57985797172785},
            propsData = {
              ShowEnable = true,
              MessageId = 300003,
              MessageNote = "\231\130\185\229\135\187\226\128\156\232\191\145\230\136\152\230\173\166\229\153\168\226\128\157\233\161\181\231\173\190\239\188\140\232\191\155\232\161\140\232\191\145\230\136\152\230\173\166\229\153\168\233\133\141\231\189\174\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMainNew.ListView_Tab:3",
              UICompName = "Text_1",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["170131351135591746"] = {
            key = "170131351135591746",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1205.5370586122306, y = -115.57256354201965},
            propsData = {
              ShowEnable = true,
              MessageId = 300005,
              MessageNote = "\231\130\185\229\135\187\226\128\156\230\155\191\230\141\162\226\128\157\239\188\140\232\191\155\232\161\140\232\191\145\230\136\152\230\173\166\229\153\168\231\154\132\230\155\191\230\141\162\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMainNew.Btn_Confirm_1",
              UICompName = "Button_Area",
              GamePadWidgetName = "",
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
          ["170131352756792747"] = {
            key = "170131352756792747",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1443.36834429536, y = 294.81547725206696},
            propsData = {
              ShowEnable = true,
              MessageId = 300702,
              MessageNote = "\231\130\185\229\135\187\226\128\156\233\173\148\228\185\139\230\165\148\226\128\157\239\188\140\232\191\155\232\161\140\233\173\148\228\185\139\230\165\148\233\133\141\231\189\174\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:1",
              UICompName = "Btn_Mod",
              GamePadWidgetName = "Key_GamePad",
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
          ["170131356009993691"] = {
            key = "170131356009993691",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 173.824024780686, y = 243.51597000871186},
            propsData = {
              MessageId = 300701,
              MessageNote = "\228\184\186\232\167\146\232\137\178\227\128\129\230\173\166\229\153\168\232\163\133\229\164\135<H>\233\173\148\228\185\139\230\165\148</>\239\188\140\229\143\175\228\187\165\229\164\167\229\185\133\230\143\144\229\141\135\231\148\159\229\173\152\229\143\138\232\190\147\229\135\186\232\131\189\229\138\155\227\128\130",
              IsTimePause = true,
              IsResetPlayer = true,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["170131395875497005"] = {
            key = "170131395875497005",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1723.422692121447, y = 296.5155153908923},
            propsData = {
              MessageId = 300703,
              MessageNote = "\233\173\148\228\185\139\230\165\148\229\136\134\228\184\186\228\187\133\228\190\155\232\167\146\232\137\178\228\189\191\231\148\168\231\154\132<H>\232\167\146\232\137\178\233\173\148\228\185\139\230\165\148</>\229\146\140\228\187\133\228\190\155\230\173\166\229\153\168\228\189\191\231\148\168\231\154\132<H>\230\173\166\229\153\168\233\173\148\228\185\139\230\165\148</>\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["170131397474897757"] = {
            key = "170131397474897757",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 2310.922692121447, y = 301.0835931940959},
            propsData = {
              ShowEnable = true,
              MessageId = 300704,
              MessageNote = "\232\191\153\230\152\175\231\169\186\230\143\146\230\167\189\239\188\140\229\143\175\231\148\168\228\186\142\232\163\133\233\133\141\233\173\148\228\185\139\230\165\148\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMod.Mod_1",
              UICompName = "ItemDetails_MenuAnchor",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 68, Y = -20},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Down",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["170131408826298899"] = {
            key = "170131408826298899",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1269.268881179156, y = 628.0562168716984},
            propsData = {
              ShowEnable = true,
              MessageId = 300705,
              MessageNote = "\232\175\165\230\143\146\230\167\189\229\183\178\233\148\129\229\174\154\239\188\140\233\128\154\232\191\135\232\167\146\232\137\178\231\170\129\231\160\180\229\143\175\228\187\165\232\167\163\233\148\129\230\155\180\229\164\154\230\143\146\230\167\189\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMod.Mod_9",
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
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1701314623119103146"] = {
            key = "1701314623119103146",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 2099.9771241185204, y = 605.8163236604095},
            propsData = {
              ShowEnable = true,
              MessageId = 300707,
              MessageNote = "\229\183\166\228\184\138\232\167\146\230\152\190\231\164\186\231\154\132\230\152\175\232\175\165\233\173\148\228\185\139\230\165\148\231\154\132\232\128\144\229\143\151\229\128\188\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMod.List_Select_Mod:1",
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
              MessageLoc = "UpRight",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1701325049951107772"] = {
            key = "1701325049951107772",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 2386.40911667839, y = 612.4560752132047},
            propsData = {
              MessageId = 300708,
              MessageNote = "\229\189\147\233\173\148\228\185\139\230\165\148\229\141\160\231\148\168\231\154\132\232\128\144\229\143\151\229\128\188\230\156\170\232\190\190\229\136\176\228\184\138\233\153\144\230\151\182\239\188\140\229\143\175\229\176\134\233\173\148\228\185\139\230\165\148\230\139\150\230\139\189\232\135\179\231\169\186\230\167\189\228\189\141\228\184\173\232\163\133\233\133\141\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["1701325083198109014"] = {
            key = "1701325083198109014",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1835.502040804562, y = 619.1952056479873},
            propsData = {
              ShowEnable = true,
              MessageId = 300709,
              MessageNote = "\232\167\146\232\137\178\229\146\140\230\173\166\229\153\168\230\137\191\229\143\151\233\173\148\228\185\139\230\165\148\231\154\132\232\131\189\229\138\155\229\141\179\228\184\186<H>\232\128\144\229\143\151\229\128\188</>\239\188\140\229\133\182\228\184\138\233\153\144\229\143\175\229\156\168\230\173\164\229\164\132\230\159\165\231\156\139\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMod",
              UICompName = "Text_Volume_Max",
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
          ["1701325696337111854"] = {
            key = "1701325696337111854",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1038.256093240419, y = 929.3610676374076},
            propsData = {
              MessageId = 300710,
              MessageNote = "\229\189\147\232\128\144\229\143\151\229\128\188\230\156\170\232\182\133\228\184\138\233\153\144\230\151\182\239\188\140\233\128\154\232\191\135\230\139\150\230\139\189\229\143\175\228\187\165\229\176\134\233\173\148\228\185\139\230\165\148\232\163\133\233\133\141\229\136\176\231\169\186\230\143\146\230\167\189\229\134\133\227\128\130\229\141\149\229\135\187\229\133\183\228\189\147\231\154\132\233\173\148\228\185\139\230\165\148\229\143\175\228\187\165\230\159\165\231\156\139\229\133\182\230\149\136\230\158\156\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["1701325712366112596"] = {
            key = "1701325712366112596",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 3177.449000626959, y = -67.52050103356805},
            propsData = {
              MessageId = 300711,
              MessageNote = "\231\130\185\229\135\187\233\173\148\228\185\139\230\165\148\229\143\175\228\187\165\232\191\155\232\161\140\229\141\135\231\186\167\239\188\140\229\141\135\231\186\167\233\173\148\228\185\139\230\165\148\233\156\128\232\166\129\230\182\136\232\128\151\233\147\182\229\184\129\229\146\140\230\183\177\231\186\162\229\135\157\231\143\160\239\188\140\229\143\175\228\187\165\230\158\129\229\164\167\230\143\144\229\141\135\233\173\148\228\185\139\230\165\148\231\154\132\232\131\189\229\138\155\227\128\130\233\156\128\232\166\129\230\179\168\230\132\143\231\154\132\230\152\175\239\188\140\229\141\135\231\186\167\233\173\148\228\185\139\230\165\148\228\188\154\229\144\140\230\151\182\229\162\158\229\138\160\229\133\182\232\128\144\229\143\151\229\128\188\239\188\140\229\143\175\232\131\189\228\188\154\229\175\188\232\135\180\232\163\133\233\133\141\232\128\144\229\143\151\229\128\188\230\128\187\229\146\140\232\182\133\232\191\135\228\184\138\233\153\144\232\128\140\230\151\160\230\179\149\232\163\133\233\133\141\231\154\132\230\131\133\229\134\181\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["1701325729204113500"] = {
            key = "1701325729204113500",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1379.9056476613282, y = 958.2816136077487},
            propsData = {
              ShowEnable = true,
              MessageId = 300712,
              MessageNote = "\232\191\153\233\135\140\229\143\175\228\187\165\229\191\171\233\128\159\229\136\135\230\141\162\232\167\146\232\137\178\229\146\140\230\173\166\229\153\168\239\188\140\232\176\131\230\149\180\229\133\182\232\163\133\233\133\141\231\154\132\233\173\148\228\185\139\230\165\148\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMod",
              UICompName = "List_Role",
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
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["170554757064688188"] = {
            key = "170554757064688188",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 2006.9591983049152, y = 282.77507423417364},
            propsData = {
              MessageId = 300713,
              MessageNote = "\229\144\140\228\184\128\230\158\154\232\167\146\232\137\178\233\173\148\228\185\139\230\165\148\229\143\175\228\190\155\229\164\154\228\189\141\232\167\146\232\137\178\232\163\133\233\133\141\239\188\155\229\144\140\230\160\183\231\154\132\239\188\140\229\144\140\228\184\128\230\158\154\230\173\166\229\153\168\233\173\148\228\185\139\230\165\148\228\185\159\229\143\175\228\190\155\229\164\154\230\138\138\230\173\166\229\153\168\232\163\133\233\133\141\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["170556299843990825"] = {
            key = "170556299843990825",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 2479.220830646639, y = -125.48579533104373},
            propsData = {
              ShowEnable = true,
              MessageId = 300706,
              MessageNote = "\232\191\153\230\152\175\230\137\128\230\139\165\230\156\137\231\154\132\233\173\148\228\185\139\230\165\148\239\188\140\229\143\175\228\187\165\233\128\154\232\191\135\229\144\132\231\177\187\231\142\169\230\179\149\229\146\140\229\165\150\229\138\177\232\142\183\229\190\151\227\128\130\230\175\143\228\184\170\233\173\148\228\185\139\230\165\148\233\131\189\228\188\154\230\156\137\232\135\170\229\183\177\231\154\132\229\138\160\230\136\144\230\149\136\230\158\156\228\187\165\229\143\138\232\128\144\229\143\151\229\128\188\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMod",
              UICompName = "List_Select_Mod",
              GamePadWidgetName = "",
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
          ["170556300083890930"] = {
            key = "170556300083890930",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1561.3713675304352, y = 626.3419008103269},
            propsData = {
              MessageId = 300706,
              MessageNote = "\233\173\148\228\185\139\230\165\148\232\149\180\232\151\143\231\157\128\229\188\186\229\164\167\231\154\132\229\138\155\233\135\143\239\188\140\230\149\133\232\128\140\228\188\154\229\175\185\232\167\146\232\137\178\229\146\140\230\173\166\229\153\168\229\184\166\230\157\165\228\184\128\229\174\154\232\180\159\230\139\133\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["170556340833993875"] = {
            key = "170556340833993875",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 2894.299882030038, y = -69.1023961215576},
            propsData = {
              MessageId = 300714,
              MessageNote = "<H>\229\141\135\231\186\167</>\232\167\146\232\137\178\229\146\140\230\173\166\229\153\168\229\143\175\230\143\144\233\171\152\232\128\144\229\143\151\229\128\188\228\184\138\233\153\144\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["17061685216765119"] = {
            key = "17061685216765119",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 1144.6022565508335, y = -845.1721458971311},
            propsData = {
              ShowEnable = true,
              MessageId = 300302,
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
          ["1720320861754139951"] = {
            key = "1720320861754139951",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 840.7737524115038, y = -648.6946403015918},
            propsData = {}
          },
          ["1720320874835140417"] = {
            key = "1720320874835140417",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 1151.8921734641353, y = -620.4709560910653},
            propsData = {
              ShowEnable = true,
              MessageId = 300302,
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
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = -20, Y = -20},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17515421860753781026"] = {
            key = "17515421860753781026",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1952.150536883796, y = 801.4074062862982},
            propsData = {
              ShowEnable = true,
              MessageId = 300715,
              MessageNote = "\232\191\153\233\135\140\229\143\175\228\187\165\232\135\170\229\138\168\232\163\133\233\133\141\233\173\148\228\185\139\230\165\148\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMod.Btn_Auto",
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
          ["17555215467702832"] = {
            key = "17555215467702832",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 833.135640170048, y = 459.4177319574577},
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
          ["17555215467702833"] = {
            key = "17555215467702833",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 952.441749094131, y = 90.20557910246248},
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
          ["17555215467702834"] = {
            key = "17555215467702834",
            type = "InputDeviceBranchNode",
            name = "\232\190\147\229\133\165\232\174\190\229\164\135\229\136\134\230\148\175",
            pos = {x = 537.9511329955612, y = 217.01294961105293},
            propsData = {}
          },
          ["17555215467702835"] = {
            key = "17555215467702835",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 882.7684024990349, y = 236.08271730579202},
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
          ["17555215467702836"] = {
            key = "17555215467702836",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1115.9118506757443, y = 269.529814236422},
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
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
