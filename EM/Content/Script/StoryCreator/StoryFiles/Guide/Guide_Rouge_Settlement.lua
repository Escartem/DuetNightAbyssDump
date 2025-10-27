return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17457541629453102336",
      startPort = "StoryStart",
      endStory = "17457541629463102338",
      endPort = "In"
    },
    {
      startStory = "17457541629463102338",
      startPort = "Success",
      endStory = "17457541629463102337",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17457541629453102336"] = {
      isStoryNode = true,
      key = "17457541629453102336",
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
    ["17457541629463102337"] = {
      isStoryNode = true,
      key = "17457541629463102337",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1777, y = 304.5},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17457541629463102338"] = {
      isStoryNode = true,
      key = "17457541629463102338",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1287.7559279858665, y = 301.582413034585},
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
            startQuest = "17457541629463102339",
            startPort = "QuestStart",
            endQuest = "17457541629463102356",
            endPort = "In"
          },
          {
            startQuest = "17457541629463102356",
            startPort = "Out",
            endQuest = "17457686895776066695",
            endPort = "In"
          },
          {
            startQuest = "17457686895776066695",
            startPort = "Out",
            endQuest = "17457541629463102340",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17457541629463102339"] = {
            key = "17457541629463102339",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17457541629463102340"] = {
            key = "17457541629463102340",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1925, y = 310},
            propsData = {ModeType = 0}
          },
          ["17457541629463102341"] = {
            key = "17457541629463102341",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1935.1666666666665, y = 594.8333333333333},
            propsData = {}
          },
          ["17457541629463102342"] = {
            key = "17457541629463102342",
            type = "ShowGuideButtonNode",
            name = "\231\137\169\229\147\129\229\136\151\232\161\168",
            pos = {x = 1142.8058563456593, y = -1.2606531453145067},
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
          ["17457541629463102343"] = {
            key = "17457541629463102343",
            type = "ShowGuideButtonNode",
            name = "\229\138\168\230\128\129\231\149\140\233\157\162\230\140\137\233\146\174",
            pos = {x = 1709.0021263425292, y = 14.958517489148562},
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
          ["17457541629463102344"] = {
            key = "17457541629463102344",
            type = "ShowGuideButtonNode",
            name = "\231\149\140\233\157\162\229\134\133\229\188\185\231\170\151",
            pos = {x = 1985.9174523957859, y = 12.470525720797355},
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
          ["17457541629463102345"] = {
            key = "17457541629463102345",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1121.5944035759471, y = -166.25522988151704},
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
          ["17457541629463102346"] = {
            key = "17457541629463102346",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 1395.9533779349215, y = -167.79369141997856},
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
          ["17457541629463102347"] = {
            key = "17457541629463102347",
            type = "ShowGuideButtonNode",
            name = "UI\229\134\133ListView",
            pos = {x = 1699.5431215246651, y = -155.3577939840815},
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
          ["17457541629463102348"] = {
            key = "17457541629463102348",
            type = "ShowGuideButtonNode",
            name = "\230\153\174\233\128\154\230\140\137\233\146\174",
            pos = {x = 1437.6554115335064, y = 3.8995004456266997},
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
          },
          ["17457541629463102356"] = {
            key = "17457541629463102356",
            type = "ShowGuideButtonNode",
            name = "\232\161\140\232\191\185",
            pos = {x = 1130.0707328882695, y = 294.17503463054425},
            propsData = {
              ShowEnable = true,
              MessageId = 302101,
              MessageNote = "\232\191\153\233\135\140\230\152\175\230\156\172\230\172\161\230\142\162\231\180\162\232\142\183\229\143\150\231\154\132\232\161\140\232\191\185\239\188\140\229\143\175\228\187\165\232\167\163\233\148\129\233\162\134\229\143\150\230\175\143\229\145\168\229\165\150\229\138\177\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "RougeSettlement",
              UICompName = "Text_EarnPoints",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 100, Y = 60},
              UICompLocOffset = {X = 0, Y = 30},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17457686895776066695"] = {
            key = "17457686895776066695",
            type = "ShowGuideButtonNode",
            name = "\231\144\137\231\146\131",
            pos = {x = 1426, y = 292},
            propsData = {
              ShowEnable = true,
              MessageId = 302102,
              MessageNote = "\232\191\153\233\135\140\230\152\175\230\156\172\230\172\161\230\142\162\231\180\162\232\142\183\229\143\150\231\154\132\231\144\137\231\146\131\239\188\140\231\148\168\228\186\142\228\191\174\229\164\141\230\143\144\231\129\175\229\188\186\229\140\150\230\136\152\230\150\151\232\131\189\229\138\155\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "RougeSettlement",
              UICompName = "Text_TP",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 100, Y = 60},
              UICompLocOffset = {X = -5, Y = 30},
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
