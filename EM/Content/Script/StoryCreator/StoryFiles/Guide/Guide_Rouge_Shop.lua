return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1732783210535471079",
      startPort = "StoryStart",
      endStory = "1732783210535471081",
      endPort = "In"
    },
    {
      startStory = "1732783210535471081",
      startPort = "Success",
      endStory = "1732783210535471080",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1732783210535471079"] = {
      isStoryNode = true,
      key = "1732783210535471079",
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
    ["1732783210535471080"] = {
      isStoryNode = true,
      key = "1732783210535471080",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1836, y = 334},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783210535471081"] = {
      isStoryNode = true,
      key = "1732783210535471081",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1298, y = 320},
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
            startQuest = "1732783210535471082",
            startPort = "QuestStart",
            endQuest = "17228405652113912",
            endPort = "In"
          },
          {
            startQuest = "17228405849334319",
            startPort = "Out",
            endQuest = "1732783210535471083",
            endPort = "Success"
          },
          {
            startQuest = "17228405652113912",
            startPort = "Out",
            endQuest = "172899607811415006",
            endPort = "Input"
          },
          {
            startQuest = "172899607811415006",
            startPort = "PC",
            endQuest = "17228405849334319",
            endPort = "In"
          },
          {
            startQuest = "172899607811415006",
            startPort = "Mobile",
            endQuest = "172899607222814805",
            endPort = "In"
          },
          {
            startQuest = "172899607222814805",
            startPort = "Out",
            endQuest = "1732783210535471083",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17228405652113912"] = {
            key = "17228405652113912",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1120.941176470588, y = 300.0294117647058},
            propsData = {
              MessageId = 301901,
              MessageNote = "\229\156\168\231\165\158\231\167\152\232\161\140\229\149\134\229\164\132\239\188\140\229\143\175\228\187\165\232\138\177\232\180\185\228\184\128\229\174\154\230\149\176\233\135\143\231\154\132\228\189\153\231\131\172\239\188\140\232\180\173\228\185\176\231\131\155\232\138\175\229\146\140\233\129\151\231\137\169\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["17228405849334319"] = {
            key = "17228405849334319",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1509.1764705882351, y = 296.4999999999999},
            propsData = {
              ShowEnable = true,
              MessageId = 301902,
              MessageNote = "\231\130\185\229\135\187\229\143\175\228\187\165\233\128\137\230\139\169\230\131\179\232\166\129\232\142\183\229\143\150\231\154\132\231\131\155\232\138\175",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "RougeShop.Common_Tab.EMScrollBox_TabItem:2",
              UICompName = "Btn",
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
              MessageLoc = "Down",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["172899607222814805"] = {
            key = "172899607222814805",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1540.361344537815, y = 479.6168713639299},
            propsData = {
              ShowEnable = true,
              MessageId = 301902,
              MessageNote = "\231\130\185\229\135\187\229\143\175\228\187\165\233\128\137\230\139\169\230\131\179\232\166\129\232\142\183\229\143\150\231\154\132\231\131\155\232\138\175",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "RougeShop.Common_Tab.EMScrollBox_TabItem:2",
              UICompName = "Btn",
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
          ["172899607811415006"] = {
            key = "172899607811415006",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 1174.4789915966385, y = 498.322753716871},
            propsData = {}
          },
          ["1732783210535471082"] = {
            key = "1732783210535471082",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1732783210535471083"] = {
            key = "1732783210535471083",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1995.2941176470588, y = 317.6470588235294},
            propsData = {ModeType = 0}
          },
          ["1732783210535471084"] = {
            key = "1732783210535471084",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2658.823529411765, y = 707.0588235294117},
            propsData = {}
          },
          ["1732783210535471085"] = {
            key = "1732783210535471085",
            type = "ShowGuideButtonNode",
            name = "\231\137\169\229\147\129\229\136\151\232\161\168",
            pos = {x = 1063.0499283597928, y = 93.15693382010045},
            propsData = {
              ShowEnable = true,
              MessageId = 300006,
              MessageNote = "\231\130\185\229\135\187\229\136\154\230\137\141\232\142\183\229\190\151\231\154\132\230\150\176\230\173\166\229\153\168\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
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
          ["1732783210535471086"] = {
            key = "1732783210535471086",
            type = "ShowGuideButtonNode",
            name = "\229\138\168\230\128\129\231\149\140\233\157\162\230\140\137\233\146\174",
            pos = {x = 1629.2461983566627, y = 109.37610445456357},
            propsData = {
              ShowEnable = true,
              MessageId = 300009,
              MessageNote = "\231\130\185\229\135\187\226\128\156+\226\128\157\229\143\183\239\188\140\230\137\147\229\188\128\229\141\135\231\186\167\229\188\185\231\170\151\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
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
          ["1732783210535471087"] = {
            key = "1732783210535471087",
            type = "ShowGuideButtonNode",
            name = "\231\149\140\233\157\162\229\134\133\229\188\185\231\170\151",
            pos = {x = 1906.1615244099194, y = 106.88811268621237},
            propsData = {
              ShowEnable = true,
              MessageId = 300010,
              MessageNote = "\231\130\185\229\135\187\226\128\156+\226\128\157\229\143\183\239\188\140\229\143\175\228\187\165\230\143\144\229\141\135\229\141\135\231\186\167\231\154\132\231\155\174\230\160\135\231\173\137\231\186\167",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
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
          ["1732783210535471088"] = {
            key = "1732783210535471088",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1041.8384755900806, y = -71.83764291610203},
            propsData = {
              MessageId = 300004,
              MessageNote = "\229\156\168\232\191\145\230\136\152\230\173\166\229\153\168\233\133\141\231\189\174\231\149\140\233\157\162\228\184\173\239\188\140\229\143\175\228\187\165\230\159\165\231\156\139\232\191\145\230\136\152\230\173\166\229\153\168\231\154\132\229\177\158\230\128\167\227\128\129\228\184\186\232\191\145\230\136\152\230\173\166\229\153\168\229\141\135\231\186\167\227\128\129\230\155\191\230\141\162\229\133\182\228\187\150\232\191\145\230\136\152\230\173\166\229\153\168\231\173\137\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["1732783210535471089"] = {
            key = "1732783210535471089",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 1316.197449949055, y = -73.37610445456352},
            propsData = {
              ShowEnable = true,
              MessageId = 300002,
              MessageNote = "\231\130\185\229\135\187<H>\226\128\156\230\149\180\229\164\135\226\128\157</>\232\191\155\229\133\165\230\149\180\229\164\135\231\179\187\231\187\159\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
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
          ["1732783210535471090"] = {
            key = "1732783210535471090",
            type = "ShowGuideButtonNode",
            name = "UI\229\134\133ListView",
            pos = {x = 1619.7871935387986, y = -60.940207018666456},
            propsData = {
              ShowEnable = true,
              MessageId = 300003,
              MessageNote = "\231\130\185\229\135\187\226\128\156\232\191\145\230\136\152\230\173\166\229\153\168\226\128\157\233\161\181\231\173\190\239\188\140\232\191\155\232\161\140\232\191\145\230\136\152\230\173\166\229\153\168\233\133\141\231\189\174\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
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
          ["1732783210535471091"] = {
            key = "1732783210535471091",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1357.8994835476399, y = 98.31708741104171},
            propsData = {
              ShowEnable = true,
              MessageId = 300005,
              MessageNote = "\231\130\185\229\135\187\226\128\156\230\155\191\230\141\162\226\128\157\239\188\140\232\191\155\232\161\140\232\191\145\230\136\152\230\173\166\229\153\168\231\154\132\230\155\191\230\141\162\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
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
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
