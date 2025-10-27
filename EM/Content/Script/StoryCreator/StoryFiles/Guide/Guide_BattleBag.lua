return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "170082313312318709",
      startPort = "StoryStart",
      endStory = "170082313649918940",
      endPort = "In"
    },
    {
      startStory = "170082313649918940",
      startPort = "Success",
      endStory = "170082313312318712",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["170082313312318709"] = {
      isStoryNode = true,
      key = "170082313312318709",
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
    ["170082313312318712"] = {
      isStoryNode = true,
      key = "170082313312318712",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1697.1999999999998, y = 409.2},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["170082313649918940"] = {
      isStoryNode = true,
      key = "170082313649918940",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1281.4429012260587, y = 392.997827133857},
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
            startQuest = "170082350446224297",
            startPort = "Out",
            endQuest = "170082372350425451",
            endPort = "In"
          },
          {
            startQuest = "170082372350425451",
            startPort = "Out",
            endQuest = "170082414445927627",
            endPort = "In"
          },
          {
            startQuest = "1720336471275432115",
            startPort = "PC",
            endQuest = "170082314376019740",
            endPort = "In"
          },
          {
            startQuest = "1720336471275432115",
            startPort = "Mobile",
            endQuest = "1720336477214432375",
            endPort = "In"
          },
          {
            startQuest = "17535243973102539",
            startPort = "Out",
            endQuest = "17535243973102544",
            endPort = "In"
          },
          {
            startQuest = "17535243973102540",
            startPort = "Out",
            endQuest = "17535243973102538",
            endPort = "In"
          },
          {
            startQuest = "17535243973102538",
            startPort = "Out",
            endQuest = "17535243973102539",
            endPort = "In"
          },
          {
            startQuest = "17535243973102544",
            startPort = "Out",
            endQuest = "170082313649918943",
            endPort = "Success"
          },
          {
            startQuest = "170082331304522835",
            startPort = "Out",
            endQuest = "1753525008657669251",
            endPort = "In"
          },
          {
            startQuest = "1753525008657669251",
            startPort = "Out",
            endQuest = "17535243973102541",
            endPort = "In"
          },
          {
            startQuest = "17562137050872499",
            startPort = "MouseAndKeyboard",
            endQuest = "17562137050872498",
            endPort = "In"
          },
          {
            startQuest = "17562137050872499",
            startPort = "Gamepad",
            endQuest = "17562137050872500",
            endPort = "In"
          },
          {
            startQuest = "17562137050872500",
            startPort = "Out",
            endQuest = "17562137050882501",
            endPort = "In"
          },
          {
            startQuest = "17562137050872499",
            startPort = "Touch",
            endQuest = "17562137050872497",
            endPort = "In"
          },
          {
            startQuest = "170082314376019739",
            startPort = "Out",
            endQuest = "17562137050872499",
            endPort = "Input"
          },
          {
            startQuest = "17535243973102541",
            startPort = "Out",
            endQuest = "17571582890326339609",
            endPort = "In"
          },
          {
            startQuest = "17571582890326339609",
            startPort = "Out",
            endQuest = "17535243973102540",
            endPort = "In"
          },
          {
            startQuest = "170082313649918941",
            startPort = "QuestStart",
            endQuest = "17580144283445566087",
            endPort = "In"
          },
          {
            startQuest = "17580144283445566087",
            startPort = "Out",
            endQuest = "170082314376019739",
            endPort = "In"
          },
          {
            startQuest = "1758713303302622337",
            startPort = "Mobile",
            endQuest = "170082323378221797",
            endPort = "In"
          },
          {
            startQuest = "1758713303302622337",
            startPort = "PC",
            endQuest = "1758713317246622834",
            endPort = "In"
          },
          {
            startQuest = "17562137050872498",
            startPort = "Out",
            endQuest = "17587154962743103468",
            endPort = "In"
          },
          {
            startQuest = "17562137050882501",
            startPort = "Out",
            endQuest = "17587154962743103468",
            endPort = "In"
          },
          {
            startQuest = "17562137050872497",
            startPort = "Out",
            endQuest = "17587154962743103468",
            endPort = "In"
          },
          {
            startQuest = "17587154962743103468",
            startPort = "Out",
            endQuest = "170082331304522835",
            endPort = "In"
          }
        },
        nodeData = {
          ["170082313649918941"] = {
            key = "170082313649918941",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -69.44611192916142, y = 289.08669292371616},
            propsData = {ModeType = 0}
          },
          ["170082313649918943"] = {
            key = "170082313649918943",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2589.9870974093146, y = 577.9645129534258},
            propsData = {ModeType = 0}
          },
          ["170082313649918945"] = {
            key = "170082313649918945",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["170082314376019736"] = {
            key = "170082314376019736",
            type = "ShowGuideButtonNode",
            name = "\231\137\169\229\147\129\229\136\151\232\161\168",
            pos = {x = 1136.7157541367433, y = -232.74376098247205},
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
          ["170082314376019737"] = {
            key = "170082314376019737",
            type = "ShowGuideButtonNode",
            name = "\229\138\168\230\128\129\231\149\140\233\157\162\230\140\137\233\146\174",
            pos = {x = 1692.2163719597002, y = -239.82893817409598},
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
          ["170082314376019738"] = {
            key = "170082314376019738",
            type = "ShowGuideButtonNode",
            name = "\231\149\140\233\157\162\229\134\133\229\188\185\231\170\151",
            pos = {x = 1981.1316980129568, y = -219.0125821163602},
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
          ["170082314376019739"] = {
            key = "170082314376019739",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 556.1924875769564, y = 316.1438757200606},
            propsData = {
              MessageId = 300601,
              MessageNote = "\227\128\144\229\190\133\229\140\133\232\163\133\227\128\145\233\128\154\232\191\135\233\133\141\231\189\174\230\136\152\230\150\151\232\131\140\229\140\133\239\188\140\229\143\175\228\187\165\229\156\168\230\136\152\230\150\151\228\184\173\228\189\191\231\148\168\229\144\132\231\167\141\233\129\147\229\133\183\232\190\133\229\138\169\230\136\152\230\150\151\239\188\140\228\185\159\229\143\175\228\187\165\229\143\172\229\148\164\229\141\143\230\136\152\228\188\153\228\188\180\228\184\128\232\181\183\229\143\130\228\184\142\230\136\152\230\150\151\227\128\130",
              IsTimePause = true,
              IsResetPlayer = true,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["170082314376019740"] = {
            key = "170082314376019740",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 700.4934976779664, y = -363.0634148154907},
            propsData = {
              ShowEnable = true,
              MessageId = 300602,
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
          ["170082314376019741"] = {
            key = "170082314376019741",
            type = "ShowGuideButtonNode",
            name = "UI\229\134\133ListView",
            pos = {x = 1694.757367141836, y = -388.145249647326},
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
          ["170082314376019742"] = {
            key = "170082314376019742",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1432.8696571506773, y = -228.88795521761784},
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
          ["170082323378221797"] = {
            key = "170082323378221797",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 3002.942507439384, y = -283.13130290358384},
            propsData = {
              ShowEnable = true,
              MessageId = 300603,
              MessageNote = "\231\130\185\229\135\187\226\128\156\230\155\191\230\141\162\226\128\157\239\188\140\232\191\155\232\161\140\232\191\145\230\136\152\230\173\166\229\153\168\231\154\132\230\155\191\230\141\162\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Tab_Arm.EMScrollBox_TabItem:-1",
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
              MessageLoc = "Down",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["170082331304522835"] = {
            key = "170082331304522835",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 2386.2045010735087, y = 291.6696115904403},
            propsData = {
              MessageId = 300604,
              MessageNote = "\227\128\144\229\190\133\229\140\133\232\163\133\227\128\145\233\128\154\232\191\135\233\133\141\231\189\174\230\136\152\230\150\151\232\131\140\229\140\133\239\188\140\229\143\175\228\187\165\229\156\168\230\136\152\230\150\151\228\184\173\228\189\191\231\148\168\229\144\132\231\167\141\233\129\147\229\133\183\232\190\133\229\138\169\230\136\152\230\150\151\239\188\140\228\185\159\229\143\175\228\187\165\229\143\172\229\148\164\229\141\143\230\136\152\228\188\153\228\188\180\228\184\128\232\181\183\229\143\130\228\184\142\230\136\152\230\150\151\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["170082350446224297"] = {
            key = "170082350446224297",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 811.0844593173231, y = 1179.8949573713403},
            propsData = {
              ShowEnable = true,
              MessageId = 300605,
              MessageNote = "\232\191\153\230\152\175\229\141\143\230\136\152\229\141\176\232\174\176\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryBattleMenu.List:1",
              UICompName = "Bg_Hover_B",
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
          ["170082372350425451"] = {
            key = "170082372350425451",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1100.2987450316089, y = 1179.8521002284833},
            propsData = {
              MessageId = 300606,
              MessageNote = "\229\141\143\230\136\152\229\141\176\232\174\176\230\152\175\228\184\128\231\167\141\231\137\185\230\174\138\231\154\132\233\129\147\229\133\183\239\188\140\229\174\131\229\143\175\228\187\165\229\143\172\229\148\164\229\141\143\229\138\169\228\188\153\228\188\180\229\143\130\228\184\142\230\136\152\230\150\151\227\128\130\229\156\168\229\176\134\229\141\143\230\136\152\229\141\176\232\174\176\230\148\190\229\133\165\232\131\140\229\140\133\229\137\141\239\188\140\233\156\128\229\133\136\228\184\186\229\133\182\233\133\141\231\189\174\230\173\166\229\153\168\227\128\130",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["170082374557926403"] = {
            key = "170082374557926403",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1679.4987450316091, y = 1208.2878145141976},
            propsData = {
              ShowEnable = true,
              MessageId = 300608,
              MessageNote = "\231\130\185\229\135\187\233\133\141\231\189\174\230\173\166\229\153\168\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryBattleMenu.List:1.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:1",
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
          ["170082414445927627"] = {
            key = "170082414445927627",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1377.2416021744664, y = 1187.4378145141973},
            propsData = {
              ShowEnable = true,
              MessageId = 300607,
              MessageNote = "\231\130\185\229\135\187\229\141\143\230\136\152\229\141\176\232\174\176\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryBattleMenu.List:1",
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
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1720336471275432115"] = {
            key = "1720336471275432115",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 379.1780975982524, y = -351.28756473854844},
            propsData = {}
          },
          ["1720336477214432375"] = {
            key = "1720336477214432375",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 695.0871885073436, y = -229.28756473854838},
            propsData = {
              ShowEnable = true,
              MessageId = 300602,
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
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17535243973102538"] = {
            key = "17535243973102538",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1631.7302885393276, y = 599.3159118907522},
            propsData = {
              MessageId = 300615,
              MessageNote = "\230\173\166\229\153\168\233\133\141\231\189\174\231\149\140\233\157\162\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "Left",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["17535243973102539"] = {
            key = "17535243973102539",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1962.7174680265075, y = 577.7924076172478},
            propsData = {
              MessageId = 300612,
              MessageNote = "\227\128\144\229\190\133\229\140\133\232\163\133\227\128\145\229\183\178\233\133\141\231\189\174\230\173\166\229\153\168\231\154\132\229\141\143\230\136\152\229\141\176\232\174\176\229\143\175\228\187\165\233\128\154\232\191\135\230\139\150\230\139\189\230\148\190\229\133\165\230\136\152\230\150\151\232\131\140\229\140\133\229\134\133\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = false,
              GuideManPosEnum = "Left",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["17535243973102540"] = {
            key = "17535243973102540",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1250.2272291141903, y = 625.1656456754478},
            propsData = {
              MessageId = 300609,
              MessageNote = "\227\128\144\229\190\133\229\140\133\232\163\133\227\128\145\233\128\154\232\191\135\233\133\141\231\189\174\230\136\152\230\150\151\232\131\140\229\140\133\239\188\140\229\143\175\228\187\165\229\156\168\230\136\152\230\150\151\228\184\173\228\189\191\231\148\168\229\144\132\231\167\141\233\129\147\229\133\183\232\190\133\229\138\169\230\136\152\230\150\151\239\188\140\228\185\159\229\143\175\228\187\165\229\143\172\229\148\164\229\141\143\230\136\152\228\188\153\228\188\180\228\184\128\232\181\183\229\143\130\228\184\142\230\136\152\230\150\151\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "Left",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["17535243973102541"] = {
            key = "17535243973102541",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 355.45568317057086, y = 625.2006937258537},
            propsData = {
              MessageId = 300606,
              MessageNote = "\227\128\144\229\190\133\229\140\133\232\163\133\227\128\145\233\128\154\232\191\135\233\133\141\231\189\174\230\136\152\230\150\151\232\131\140\229\140\133\239\188\140\229\143\175\228\187\165\229\156\168\230\136\152\230\150\151\228\184\173\228\189\191\231\148\168\229\144\132\231\167\141\233\129\147\229\133\183\232\190\133\229\138\169\230\136\152\230\150\151\239\188\140\228\185\159\229\143\175\228\187\165\229\143\172\229\148\164\229\141\143\230\136\152\228\188\153\228\188\180\228\184\128\232\181\183\229\143\130\228\184\142\230\136\152\230\150\151\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["17535243973102542"] = {
            key = "17535243973102542",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1229.9354756003631, y = 932.292635117795},
            propsData = {
              ShowEnable = true,
              MessageId = 300608,
              MessageNote = "\231\130\185\229\135\187\233\133\141\231\189\174\230\173\166\229\153\168\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:2.Tips_Item.Btn01_Mod",
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
          ["17535243973102544"] = {
            key = "17535243973102544",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 2234.544316829429, y = 593.2843738572099},
            propsData = {GuideId = 32}
          },
          ["1753525008657669251"] = {
            key = "1753525008657669251",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 2618.193545013015, y = 326.1935480893837},
            propsData = {
              MessageId = 300616,
              MessageNote = "\229\141\143\230\136\152\229\141\176\232\174\176",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["17562137050872497"] = {
            key = "17562137050872497",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1110.204148334395, y = 456.6060764274976},
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
          ["17562137050872498"] = {
            key = "17562137050872498",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1229.5102572584783, y = 87.39392357250239},
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
          ["17562137050872499"] = {
            key = "17562137050872499",
            type = "InputDeviceBranchNode",
            name = "\232\190\147\229\133\165\232\174\190\229\164\135\229\136\134\230\148\175",
            pos = {x = 815.0196411599085, y = 214.20129408109284},
            propsData = {}
          },
          ["17562137050872500"] = {
            key = "17562137050872500",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 1159.8369106633822, y = 233.27106177583192},
            propsData = {
              MessageId = 301611,
              SkillNameList = {"OpenMenu"},
              LastTime = -1,
              bIsForceTouch = true,
              bIsTimeDilation = false,
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
          ["17562137050882501"] = {
            key = "17562137050882501",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1392.9803588400914, y = 266.7181587064619},
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
          ["17571582890326339609"] = {
            key = "17571582890326339609",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 774, y = 628},
            propsData = {
              ShowEnable = true,
              MessageId = 300608,
              MessageNote = "\231\130\185\229\135\187\233\133\141\231\189\174\230\173\166\229\153\168\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:2.Btn_Config",
              UICompName = "Button_Area",
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
          ["17571584601697607075"] = {
            key = "17571584601697607075",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 909.7715615141271, y = 922.0419547605638},
            propsData = {
              ShowEnable = true,
              MessageId = 300607,
              MessageNote = "\231\130\185\229\135\187\229\141\143\230\136\152\229\141\176\232\174\176\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:2.List_Item:1",
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
              MessageLoc = "UpRight",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17580144283445566087"] = {
            key = "17580144283445566087",
            type = "MSDKUploadNode",
            name = "\230\181\183\229\164\150\229\184\130\229\156\186SDK\229\159\139\231\130\185\228\184\138\230\138\165",
            pos = {x = 224, y = 304},
            propsData = {
              EventName = "combat_partner"
            }
          },
          ["1758713303302622337"] = {
            key = "1758713303302622337",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 2661.72280809334, y = -358.0382205043595},
            propsData = {}
          },
          ["1758713317246622834"] = {
            key = "1758713317246622834",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 3006.884092938, y = -422.5543505885372},
            propsData = {
              ShowEnable = true,
              MessageId = 300603,
              MessageNote = "\231\130\185\229\135\187\226\128\156\230\155\191\230\141\162\226\128\157\239\188\140\232\191\155\232\161\140\232\191\145\230\136\152\230\173\166\229\153\168\231\154\132\230\155\191\230\141\162\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Tab_Arm.EMScrollBox_TabItem:-1",
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
              MessageLoc = "Down",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17587154962743103468"] = {
            key = "17587154962743103468",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1887.5292680025152, y = 298.4265290072662},
            propsData = {
              ShowEnable = true,
              MessageId = 300603,
              MessageNote = "\231\130\185\229\135\187\226\128\156\230\155\191\230\141\162\226\128\157\239\188\140\232\191\155\232\161\140\232\191\145\230\136\152\230\173\166\229\153\168\231\154\132\230\155\191\230\141\162\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Tab_Arm.EMScrollBox_TabItem:4",
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
              MessageLoc = "Down",
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
