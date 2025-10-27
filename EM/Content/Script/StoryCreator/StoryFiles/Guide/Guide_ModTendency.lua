return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1701326022210115412",
      startPort = "StoryStart",
      endStory = "1701326022805115472",
      endPort = "In"
    },
    {
      startStory = "1701326022805115472",
      startPort = "Success",
      endStory = "1701326022210115415",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1701326022210115412"] = {
      isStoryNode = true,
      key = "1701326022210115412",
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
    ["1701326022210115415"] = {
      isStoryNode = true,
      key = "1701326022210115415",
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
    ["1701326022805115472"] = {
      isStoryNode = true,
      key = "1701326022805115472",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1216.599198255417, y = 298.7817792947994},
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
            startQuest = "170556363715695277",
            startPort = "Out",
            endQuest = "170556367605395955",
            endPort = "In"
          },
          {
            startQuest = "170556367605395955",
            startPort = "Out",
            endQuest = "170556369582996239",
            endPort = "In"
          },
          {
            startQuest = "170556369582996239",
            startPort = "Out",
            endQuest = "170556371570296903",
            endPort = "In"
          },
          {
            startQuest = "170556371570296903",
            startPort = "Out",
            endQuest = "170556373703597392",
            endPort = "In"
          },
          {
            startQuest = "170556373703597392",
            startPort = "Out",
            endQuest = "1701326201315116238",
            endPort = "In"
          },
          {
            startQuest = "1701328391212123872",
            startPort = "Out",
            endQuest = "170556377059098262",
            endPort = "In"
          },
          {
            startQuest = "170556377059098262",
            startPort = "Out",
            endQuest = "1704175978684174220",
            endPort = "Success"
          },
          {
            startQuest = "17516097601673148054",
            startPort = "Out",
            endQuest = "17516097732323148174",
            endPort = "In"
          },
          {
            startQuest = "1701326201315116238",
            startPort = "Out",
            endQuest = "1701328336305123060",
            endPort = "In"
          },
          {
            startQuest = "1701326737530121630",
            startPort = "Out",
            endQuest = "1701328391212123872",
            endPort = "In"
          },
          {
            startQuest = "1704175978684174219",
            startPort = "QuestStart",
            endQuest = "170556363715695277",
            endPort = "In"
          },
          {
            startQuest = "1701328336305123060",
            startPort = "Out",
            endQuest = "175715933668013946853",
            endPort = "In"
          },
          {
            startQuest = "175715933668013946853",
            startPort = "Out",
            endQuest = "1701326737530121630",
            endPort = "In"
          }
        },
        nodeData = {
          ["1701326201315116238"] = {
            key = "1701326201315116238",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 68.39648626152845, y = 524.7442503701857},
            propsData = {
              MessageId = 300901,
              MessageNote = "<H>\231\167\187\232\189\172\230\168\161\229\157\151</>\229\143\175\228\187\165\229\175\185\232\167\146\232\137\178\229\133\136\229\164\169\231\154\132\230\167\189\228\189\141\232\182\139\229\144\145\232\191\155\232\161\140\232\176\131\230\149\180\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["1701326737530121630"] = {
            key = "1701326737530121630",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1038.357311008744, y = 561.1449663425702},
            propsData = {
              ShowEnable = true,
              MessageId = 300904,
              MessageNote = "\231\130\185\229\135\187\233\173\148\228\185\139\230\165\148\230\143\146\230\167\189\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMod.Mod_1",
              UICompName = "ItemDetails_MenuAnchor",
              GamePadWidgetName = "",
              IsAutoClick = true,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 80, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1701328336305123060"] = {
            key = "1701328336305123060",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 357.9941489838408, y = 545.0529577083349},
            propsData = {
              ShowEnable = true,
              MessageId = 300905,
              MessageNote = "\231\130\185\229\135\187\226\128\156\232\176\131\230\149\180\230\167\189\228\189\141\230\158\129\230\128\167\226\128\157\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMod.Btn_EditPolarity",
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
          ["1701328391212123872"] = {
            key = "1701328391212123872",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1420.6999020901023, y = 539.7117124051672},
            propsData = {
              MessageId = 300906,
              MessageNote = "\233\128\154\232\191\135\230\182\136\232\128\151\231\167\187\232\189\172\230\168\161\229\157\151\239\188\140\229\143\175\228\187\165\231\187\153\232\175\165\230\143\146\230\167\189\229\162\158\229\138\160\227\128\129\228\191\174\230\148\185\230\136\150\229\136\160\233\153\164\232\182\139\229\144\145\227\128\130\233\131\168\229\136\134\233\173\148\228\185\139\230\165\148\230\156\137\232\182\139\229\144\145\239\188\140\229\189\147\233\173\148\228\185\139\230\165\148\231\154\132\232\182\139\229\144\145\229\146\140\230\143\146\230\167\189\232\182\139\229\144\145\231\155\184\229\144\140\230\151\182\239\188\140\229\143\175\233\153\141\228\189\142\232\163\133\233\133\141\230\137\128\233\156\128\231\154\132\232\128\144\229\143\151\229\128\188\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["1704175978684174219"] = {
            key = "1704175978684174219",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -229.4865424430642, y = 343.3074534161491},
            propsData = {ModeType = 0}
          },
          ["1704175978684174220"] = {
            key = "1704175978684174220",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2039.4088482074749, y = 522.2402745995424},
            propsData = {ModeType = 0}
          },
          ["1704175978684174221"] = {
            key = "1704175978684174221",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1704175978684174222"] = {
            key = "1704175978684174222",
            type = "ShowGuideButtonNode",
            name = "\231\137\169\229\147\129\229\136\151\232\161\168",
            pos = {x = 264.9071967189161, y = -166.77681343926892},
            propsData = {
              ShowEnable = true,
              MessageId = 300006,
              MessageNote = "\231\130\185\229\135\187\229\136\154\230\137\141\232\142\183\229\190\151\231\154\132\230\150\176\230\173\166\229\153\168\227\128\130",
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
          ["1704175978684174223"] = {
            key = "1704175978684174223",
            type = "ShowGuideButtonNode",
            name = "\229\138\168\230\128\129\231\149\140\233\157\162\230\140\137\233\146\174",
            pos = {x = 832.407814541873, y = -151.86199063089282},
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
          ["1704175978684174224"] = {
            key = "1704175978684174224",
            type = "ShowGuideButtonNode",
            name = "\231\149\140\233\157\162\229\134\133\229\188\185\231\170\151",
            pos = {x = 1109.3231405951296, y = -153.04563457315703},
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
          ["1704175978684174225"] = {
            key = "1704175978684174225",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 245.0000917752909, y = -334.7424046682251},
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
          ["1704175978684174226"] = {
            key = "1704175978684174226",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 519.3590661342653, y = -334.6141995400199},
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
          ["1704175978684174227"] = {
            key = "1704175978684174227",
            type = "ShowGuideButtonNode",
            name = "UI\229\134\133ListView",
            pos = {x = 822.9488097240089, y = -322.17830210412285},
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
          ["1704175978684174228"] = {
            key = "1704175978684174228",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 561.0610997328502, y = -162.9210076744147},
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
          ["170556363715695277"] = {
            key = "170556363715695277",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 57.79087895581759, y = 348.1881177124343},
            propsData = {
              MessageId = 300907,
              MessageNote = "\228\189\160\228\188\154\228\184\141\228\188\154\228\184\186\232\128\144\229\143\151\229\128\188\230\156\137\233\153\144\239\188\140\230\151\160\230\179\149\232\163\133\233\133\141\230\155\180\229\164\154\233\173\148\228\185\139\230\165\148\232\128\140\231\131\166\230\129\188\229\145\128\239\188\159\233\130\163\229\176\177\231\149\153\230\132\143\228\184\128\228\184\139<H>\232\182\139\229\144\145</>\229\144\167\239\188\129",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["170556367605395955"] = {
            key = "170556367605395955",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 319.31503354518964, y = 342.51420466895627},
            propsData = {
              MessageId = 300909,
              MessageNote = "\228\184\186\228\186\134\230\155\180\233\171\152\230\149\136\229\156\176\229\143\145\230\140\165\233\173\148\228\185\139\230\165\148\231\154\132\230\149\136\230\158\156\239\188\140\233\131\168\229\136\134<H>\233\173\148\228\185\139\230\165\148</>\229\156\168\231\160\148\229\136\182\230\151\182\232\162\171\232\181\139\228\186\136\228\186\134\233\128\130\233\133\141\228\186\142\228\184\141\229\144\140\228\184\170\228\189\147\231\154\132<H>\232\182\139\229\144\145</>\227\128\130",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["170556369582996239"] = {
            key = "170556369582996239",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 620.4894032930888, y = 351.60243996307395},
            propsData = {
              MessageId = 300908,
              MessageNote = "\230\175\143\228\184\170\232\167\146\232\137\178\229\146\140\230\175\143\230\138\138\230\173\166\229\153\168\229\133\136\229\164\169\231\137\185\230\128\167\228\184\141\229\176\189\231\155\184\229\144\140\239\188\140\228\187\142\232\128\140\229\133\182<H>\233\173\148\228\185\139\230\165\148\230\167\189\228\189\141</>\229\145\136\231\142\176\229\135\186\228\184\141\229\144\140\231\154\132<H>\232\182\139\229\144\145</>\227\128\130",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["170556371570296903"] = {
            key = "170556371570296903",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 894.7856217804836, y = 351.25878671229987},
            propsData = {GuideId = 12}
          },
          ["170556373703597392"] = {
            key = "170556373703597392",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1209.8642441385177, y = 358.1702148991353},
            propsData = {
              MessageId = 300910,
              MessageNote = "\229\166\130\230\158\156\228\189\160\229\190\151\229\136\176\228\186\134\229\188\186\229\164\167\231\154\132\233\173\148\228\185\139\230\165\148\239\188\140\229\141\180\228\184\186<H>\232\182\139\229\144\145\228\184\141\229\144\136</>\232\128\140\229\164\180\231\151\155\239\188\140\232\166\129\228\184\141\232\166\129\232\175\149\228\184\128\228\184\139<H>\232\176\131\230\149\180\230\167\189\228\189\141\232\182\139\229\144\145</>\229\145\162\239\188\159",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["170556377059098262"] = {
            key = "170556377059098262",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1731.563203074319, y = 537.2096885833457},
            propsData = {
              MessageId = 300911,
              MessageNote = "\229\189\147\232\167\146\232\137\178\230\167\189\228\189\141\228\184\142\233\173\148\228\185\139\230\165\148<H>\232\182\139\229\144\145\228\184\128\232\135\180</>\230\151\182\239\188\140\229\143\175<H>\233\153\141\228\189\142</>\232\175\165\232\163\133\233\133\141\232\175\165\233\173\148\228\185\139\230\165\148\230\137\128\233\156\128\231\154\132<H>\232\128\144\229\143\151\229\128\188</>\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = false,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["17516097601673148054"] = {
            key = "17516097601673148054",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 54.24279864143239, y = 142.1619746687062},
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
          ["17516097732323148174"] = {
            key = "17516097732323148174",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 350.396638036167, y = 126.77735963521339},
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
          ["17571588271119510867"] = {
            key = "17571588271119510867",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 610, y = 988},
            propsData = {WaitTime = 0.1}
          },
          ["175715933668013946853"] = {
            key = "175715933668013946853",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 678.0000000000001, y = 576},
            propsData = {
              ShowEnable = true,
              MessageId = 300904,
              MessageNote = "\231\130\185\229\135\187\233\173\148\228\185\139\230\165\148\230\143\146\230\167\189\227\128\130",
              DelayTime = 0.1,
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
              UICompSizeOffset = {X = 80, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
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
