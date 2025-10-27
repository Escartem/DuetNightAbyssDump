return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1745484076014342721",
      startPort = "StoryStart",
      endStory = "1745484076014342723",
      endPort = "In"
    },
    {
      startStory = "1745484076014342723",
      startPort = "Success",
      endStory = "1745484076014342722",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1745484076014342721"] = {
      isStoryNode = true,
      key = "1745484076014342721",
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
    ["1745484076014342722"] = {
      isStoryNode = true,
      key = "1745484076014342722",
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
    ["1745484076014342723"] = {
      isStoryNode = true,
      key = "1745484076014342723",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1302.1701736030377, y = 311.3160100029196},
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
            startQuest = "1745484076014342739",
            startPort = "Out",
            endQuest = "1745484076014342740",
            endPort = "In"
          },
          {
            startQuest = "1745484076014342740",
            startPort = "Out",
            endQuest = "1745484076014342742",
            endPort = "In"
          },
          {
            startQuest = "1745484076014342736",
            startPort = "Out",
            endQuest = "1745484076014342739",
            endPort = "In"
          },
          {
            startQuest = "1745484076014342735",
            startPort = "Out",
            endQuest = "1745484076014342736",
            endPort = "In"
          },
          {
            startQuest = "1745484076014342727",
            startPort = "Out",
            endQuest = "1745484076014342743",
            endPort = "In"
          },
          {
            startQuest = "1745484076014342743",
            startPort = "Out",
            endQuest = "1745484076014342730",
            endPort = "Success"
          },
          {
            startQuest = "1745484076014342742",
            startPort = "Out",
            endQuest = "1745484076014342741",
            endPort = "In"
          },
          {
            startQuest = "1745484076014342741",
            startPort = "Out",
            endQuest = "1745484076014342728",
            endPort = "In"
          },
          {
            startQuest = "1745484076014342729",
            startPort = "QuestStart",
            endQuest = "174584053322528664014",
            endPort = "In"
          },
          {
            startQuest = "174584053322528664014",
            startPort = "Out",
            endQuest = "1745484076014342735",
            endPort = "In"
          },
          {
            startQuest = "1745484076014342728",
            startPort = "Out",
            endQuest = "1745484076014342724",
            endPort = "In"
          },
          {
            startQuest = "1745484076014342724",
            startPort = "Out",
            endQuest = "1745484076014342727",
            endPort = "In"
          }
        },
        nodeData = {
          ["1745484076014342724"] = {
            key = "1745484076014342724",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1744.1696263466417, y = 468.86462255121234},
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
          ["1745484076014342726"] = {
            key = "1745484076014342726",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 2304.646316323333, y = 873.0124469490364},
            propsData = {
              ShowEnable = true,
              MessageId = 300611,
              MessageNote = "\231\130\185\229\135\187\226\128\156X\226\128\157\231\166\187\229\188\128\230\173\166\229\153\168\233\133\141\231\189\174\231\149\140\233\157\162\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryBattleMenuDialog.Btn_Close",
              UICompName = "Btn_Close",
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
          ["1745484076014342727"] = {
            key = "1745484076014342727",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 2075.1568058338216, y = 447.34111827770784},
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
          ["1745484076014342728"] = {
            key = "1745484076014342728",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1442.15374459455, y = 480.61179255520625},
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
          ["1745484076014342729"] = {
            key = "1745484076014342729",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 469.3246376811595, y = 269.67826086956524},
            propsData = {ModeType = 0}
          },
          ["1745484076014342730"] = {
            key = "1745484076014342730",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2639.1, y = 457.15},
            propsData = {ModeType = 0}
          },
          ["1745484076014342731"] = {
            key = "1745484076014342731",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1745484076014342732"] = {
            key = "1745484076014342732",
            type = "ShowGuideButtonNode",
            name = "\231\137\169\229\147\129\229\136\151\232\161\168",
            pos = {x = 974.7157541367434, y = 85.25623901752793},
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
          ["1745484076014342733"] = {
            key = "1745484076014342733",
            type = "ShowGuideButtonNode",
            name = "\229\138\168\230\128\129\231\149\140\233\157\162\230\140\137\233\146\174",
            pos = {x = 1542.2163719597002, y = 100.17106182590403},
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
          ["1745484076014342734"] = {
            key = "1745484076014342734",
            type = "ShowGuideButtonNode",
            name = "\231\149\140\233\157\162\229\134\133\229\188\185\231\170\151",
            pos = {x = 1819.1316980129568, y = 98.98741788363982},
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
          ["1745484076014342735"] = {
            key = "1745484076014342735",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1290.9100984684806, y = 293.0288120397795},
            propsData = {
              MessageId = 300605,
              MessageNote = "\227\128\144\229\190\133\229\140\133\232\163\133\227\128\145\233\128\154\232\191\135\233\133\141\231\189\174\230\136\152\230\150\151\232\131\140\229\140\133\239\188\140\229\143\175\228\187\165\229\156\168\230\136\152\230\150\151\228\184\173\228\189\191\231\148\168\229\144\132\231\167\141\233\129\147\229\133\183\232\190\133\229\138\169\230\136\152\230\150\151\239\188\140\228\185\159\229\143\175\228\187\165\229\143\172\229\148\164\229\141\143\230\136\152\228\188\153\228\188\180\228\184\128\232\181\183\229\143\130\228\184\142\230\136\152\230\150\151\227\128\130",
              IsTimePause = true,
              IsResetPlayer = true,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["1745484076014342736"] = {
            key = "1745484076014342736",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 1576.5214697059384, y = 288.8818373008141},
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
          ["1745484076014342737"] = {
            key = "1745484076014342737",
            type = "ShowGuideButtonNode",
            name = "UI\229\134\133ListView",
            pos = {x = 1532.757367141836, y = -70.14524964732603},
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
          ["1745484076014342738"] = {
            key = "1745484076014342738",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1270.8696571506773, y = 89.11204478238214},
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
          ["1745484076014342739"] = {
            key = "1745484076014342739",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1853.4797584626222, y = 291.49318691956995},
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
          ["1745484076014342740"] = {
            key = "1745484076014342740",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 693.895020977885, y = 474.7494043863138},
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
          ["1745484076014342741"] = {
            key = "1745484076014342741",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1192.3748134076773, y = 481.8413457782551},
            propsData = {
              ShowEnable = true,
              MessageId = 300608,
              MessageNote = "\231\130\185\229\135\187\233\133\141\231\189\174\230\173\166\229\153\168\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:2.List_Item:1.Item.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:1.Btn01_Mod",
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
          ["1745484076014342742"] = {
            key = "1745484076014342742",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 945.8976975410883, y = 483.75630304321226},
            propsData = {
              ShowEnable = true,
              MessageId = 300607,
              MessageNote = "\231\130\185\229\135\187\229\141\143\230\136\152\229\141\176\232\174\176\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:2.List_Item:1.Item",
              UICompName = "ItemDetails_MenuAnchor",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 80},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "UpRight",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1745484076014342743"] = {
            key = "1745484076014342743",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 2346.9836546367433, y = 461.220181311711},
            propsData = {GuideId = 32}
          },
          ["174584053322528664014"] = {
            key = "174584053322528664014",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 764.3333333333333, y = 287.66666666666663},
            propsData = {WaitTime = 0.1}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
