return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175533314100413759851",
      startPort = "StoryStart",
      endStory = "175533314100413759853",
      endPort = "In"
    },
    {
      startStory = "175533314100413759853",
      startPort = "Success",
      endStory = "175533314100413759852",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["175533314100413759851"] = {
      isStoryNode = true,
      key = "175533314100413759851",
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
    ["175533314100413759852"] = {
      isStoryNode = true,
      key = "175533314100413759852",
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
    ["175533314100413759853"] = {
      isStoryNode = true,
      key = "175533314100413759853",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1175.25, y = 294.19565217391306},
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
            startQuest = "175533314100413759857",
            startPort = "Out",
            endQuest = "175533314100413759858",
            endPort = "In"
          },
          {
            startQuest = "175533314100413759865",
            startPort = "Out",
            endQuest = "175533314100413759863",
            endPort = "In"
          },
          {
            startQuest = "175533314100413759864",
            startPort = "Out",
            endQuest = "175533314100413759865",
            endPort = "In"
          },
          {
            startQuest = "175533314100413759869",
            startPort = "PC",
            endQuest = "175533314100413759870",
            endPort = "In"
          },
          {
            startQuest = "175533314100413759869",
            startPort = "Mobile",
            endQuest = "175533314100413759871",
            endPort = "In"
          },
          {
            startQuest = "175533314100413759861",
            startPort = "Out",
            endQuest = "175533314100413759862",
            endPort = "In"
          },
          {
            startQuest = "175533314100413759870",
            startPort = "Out",
            endQuest = "175533314100413759864",
            endPort = "In"
          },
          {
            startQuest = "175533314100413759871",
            startPort = "Out",
            endQuest = "175533314100413759864",
            endPort = "In"
          },
          {
            startQuest = "175533314100413759862",
            startPort = "Out",
            endQuest = "175533314100413759873",
            endPort = "In"
          },
          {
            startQuest = "175533217316111574976",
            startPort = "MouseAndKeyboard",
            endQuest = "175533314100413759868",
            endPort = "Input"
          },
          {
            startQuest = "175533314100413759859",
            startPort = "Out",
            endQuest = "175533314100413759855",
            endPort = "Success"
          },
          {
            startQuest = "175533314100413759854",
            startPort = "QuestStart",
            endQuest = "175533314100413759859",
            endPort = "In"
          }
        },
        nodeData = {
          ["175533217316111574976"] = {
            key = "175533217316111574976",
            type = "InputDeviceBranchNode",
            name = "\232\190\147\229\133\165\232\174\190\229\164\135\229\136\134\230\148\175",
            pos = {x = 1064.4719705399004, y = 143.49075719991947},
            propsData = {}
          },
          ["175533314100413759854"] = {
            key = "175533314100413759854",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 799.0389016018307, y = 307.07093821510296},
            propsData = {ModeType = 0}
          },
          ["175533314100413759855"] = {
            key = "175533314100413759855",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2029.3842253855983, y = 223.67388035305657},
            propsData = {ModeType = 0}
          },
          ["175533314100413759856"] = {
            key = "175533314100413759856",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3026.5, y = 943},
            propsData = {}
          },
          ["175533314100413759857"] = {
            key = "175533314100413759857",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1914.569872061577, y = -72.93706241597963},
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
              UICompName = "Text_2",
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
          ["175533314100413759858"] = {
            key = "175533314100413759858",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2245.645386935719, y = -59.76936055262564},
            propsData = {
              ShowEnable = true,
              MessageId = 300005,
              MessageNote = "\231\130\185\229\135\187\226\128\156\230\155\191\230\141\162\226\128\157\239\188\140\232\191\155\232\161\140\232\191\145\230\136\152\230\173\166\229\153\168\231\154\132\230\155\191\230\141\162\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMainNew..Panel_Tab:1",
              UICompName = "Btn_Confirm_1",
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
          ["175533314100413759859"] = {
            key = "175533314100413759859",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1581.9789155479302, y = 302.2619465649158},
            propsData = {
              ShowEnable = true,
              MessageId = 303301,
              MessageNote = "\231\130\185\229\135\187\226\128\156\232\191\145\230\136\152\230\173\166\229\153\168\226\128\157\233\161\181\231\173\190\239\188\140\232\191\155\232\161\140\232\191\145\230\136\152\230\173\166\229\153\168\233\133\141\231\189\174\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:1.Btn_Unlock",
              UICompName = "Btn_Area",
              GamePadWidgetName = "Key_Unlock",
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
          ["175533314100413759860"] = {
            key = "175533314100413759860",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1415.4563543724848, y = -18.793112333461494},
            propsData = {
              ShowEnable = true,
              MessageId = 300005,
              MessageNote = "\231\130\185\229\135\187\226\128\156\230\155\191\230\141\162\226\128\157\239\188\140\232\191\155\232\161\140\232\191\145\230\136\152\230\173\166\229\153\168\231\154\132\230\155\191\230\141\162\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Btn_Confirm_1",
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
          ["175533314100413759861"] = {
            key = "175533314100413759861",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1344.7737727216238, y = 1080.0770978668165},
            propsData = {
              MessageId = 300008,
              MessageNote = "\227\128\144\229\190\133\229\140\133\232\163\133\227\128\145\230\150\176\230\155\191\230\141\162\231\154\132\230\173\166\229\153\168\231\173\137\231\186\167\232\190\131\228\189\142\239\188\140\230\143\144\233\171\152\230\173\166\229\153\168\231\154\132\231\173\137\231\186\167\229\143\175\228\187\165\230\143\144\229\141\135\230\173\166\229\153\168\231\154\132\232\190\147\229\135\186\232\131\189\229\138\155\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["175533314100413759862"] = {
            key = "175533314100413759862",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1645.5803753743658, y = 1086.3019638079231},
            propsData = {
              MessageId = 300011,
              MessageNote = "\230\173\166\229\153\168\229\141\135\231\186\167\233\156\128\230\182\136\232\128\151\228\184\128\229\174\154\231\154\132\233\147\182\229\184\129\228\187\165\229\143\138\230\173\166\229\153\168\232\175\180\230\152\142\228\185\166\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = false,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["175533314100413759863"] = {
            key = "175533314100413759863",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 4179.520320567244, y = 210.289195562742},
            propsData = {
              MessageId = 300016,
              MessageNote = "\231\137\169\231\144\134\230\148\187\229\135\187",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["175533314100413759864"] = {
            key = "175533314100413759864",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 3601.562486652005, y = 198.54156732585227},
            propsData = {
              ShowEnable = true,
              MessageId = 300014,
              MessageNote = "\232\167\166\229\143\145\230\149\136\230\158\156",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:1.Btn_Info",
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
              MessageLoc = "Left",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["175533314100413759865"] = {
            key = "175533314100413759865",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 3893.760288849807, y = 206.4031793979908},
            propsData = {
              MessageId = 300015,
              MessageNote = "\229\133\131\231\180\160\230\148\187\229\135\187",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["175533314100413759866"] = {
            key = "175533314100413759866",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 2519.1882155818475, y = -43.124393378939686},
            propsData = {
              MessageId = 300013,
              MessageNote = "\232\167\166\229\143\145\230\166\130\231\142\135",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["175533314100413759867"] = {
            key = "175533314100413759867",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1702.2862686683043, y = 846.8522872884774},
            propsData = {
              ShowEnable = true,
              MessageId = 300017,
              MessageNote = "\229\156\168\232\191\153\233\135\140\229\143\175\228\187\165\230\137\147\229\188\128\230\173\166\229\153\168\229\136\151\232\161\168\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
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
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["175533314100413759868"] = {
            key = "175533314100413759868",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 1347.7105263157894, y = 121.83834586466168},
            propsData = {}
          },
          ["175533314100413759869"] = {
            key = "175533314100413759869",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 2912.0247678018577, y = 203.37151702786366},
            propsData = {}
          },
          ["175533314100413759870"] = {
            key = "175533314100413759870",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 3233.3869969040243, y = 117.73684210526307},
            propsData = {
              ShowEnable = true,
              MessageId = 300013,
              MessageNote = "\232\167\166\229\143\145\230\166\130\231\142\135",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:1.List_Attr:6",
              UICompName = "WidgetSwitcher_Bg",
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
          ["175533314100413759871"] = {
            key = "175533314100413759871",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 3251.405572755417, y = 247.67492260061914},
            propsData = {
              MessageId = 300013,
              MessageNote = "\232\167\166\229\143\145\230\166\130\231\142\135",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["175533314100413759872"] = {
            key = "175533314100413759872",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1995.6982714138287, y = 914.9856811145513},
            propsData = {
              ShowEnable = true,
              MessageId = 300010,
              MessageNote = "\231\130\185\229\135\187\226\128\156+\226\128\157\229\143\183\239\188\140\229\143\175\228\187\165\230\143\144\229\141\135\229\141\135\231\186\167\231\154\132\231\155\174\230\160\135\231\173\137\231\186\167",
              DelayTime = 0,
              IsForceClick = true,
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
          ["175533314100413759873"] = {
            key = "175533314100413759873",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1964, y = 1094},
            propsData = {
              ShowEnable = true,
              MessageId = 300009,
              MessageNote = "\231\130\185\229\135\187\226\128\156+\226\128\157\229\143\183\239\188\140\230\137\147\229\188\128\229\141\135\231\186\167\229\188\185\231\170\151\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:1.Btn_Intensify",
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
