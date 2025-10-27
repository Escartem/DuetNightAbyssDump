return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17454761535502276685",
      startPort = "StoryStart",
      endStory = "17454761535502276687",
      endPort = "In"
    },
    {
      startStory = "17454761535502276687",
      startPort = "Success",
      endStory = "17454761535502276686",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17454761535502276685"] = {
      isStoryNode = true,
      key = "17454761535502276685",
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
    ["17454761535502276686"] = {
      isStoryNode = true,
      key = "17454761535502276686",
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
    ["17454761535502276687"] = {
      isStoryNode = true,
      key = "17454761535502276687",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1304.3923958252599, y = 310.2048988918085},
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
            startQuest = "17455019297665493546",
            startPort = "Out",
            endQuest = "17455019297665493550",
            endPort = "In"
          },
          {
            startQuest = "17455019297665493549",
            startPort = "Out",
            endQuest = "17455019297665493551",
            endPort = "In"
          },
          {
            startQuest = "17454761535502276705",
            startPort = "Out",
            endQuest = "17454761535502276694",
            endPort = "Success"
          },
          {
            startQuest = "17455019297665493550",
            startPort = "Out",
            endQuest = "17454761535502276706",
            endPort = "In"
          },
          {
            startQuest = "17455019297665493551",
            startPort = "Out",
            endQuest = "17454761535502276706",
            endPort = "In"
          },
          {
            startQuest = "17454761535502276693",
            startPort = "QuestStart",
            endQuest = "17455019297665493547",
            endPort = "In"
          },
          {
            startQuest = "17454761535502276706",
            startPort = "Out",
            endQuest = "17454761535502276705",
            endPort = "In"
          },
          {
            startQuest = "17562197359871905934",
            startPort = "Gamepad",
            endQuest = "17562197359871905935",
            endPort = "In"
          },
          {
            startQuest = "17562197359871905934",
            startPort = "MouseAndKeyboard",
            endQuest = "17455019297665493546",
            endPort = "In"
          },
          {
            startQuest = "17562197359871905934",
            startPort = "Touch",
            endQuest = "17455019297665493549",
            endPort = "In"
          },
          {
            startQuest = "17455019297665493547",
            startPort = "Out",
            endQuest = "17562197359871905934",
            endPort = "Input"
          },
          {
            startQuest = "17562197359871905935",
            startPort = "Out",
            endQuest = "17562204198582541118",
            endPort = "In"
          },
          {
            startQuest = "17562204198582541118",
            startPort = "Out",
            endQuest = "17455019297665493550",
            endPort = "In"
          }
        },
        nodeData = {
          ["17454761535502276688"] = {
            key = "17454761535502276688",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 832.919626346642, y = 1142.1146225512123},
            propsData = {
              MessageId = 300608,
              MessageNote = "\227\128\144\229\190\133\229\140\133\232\163\133\227\128\145\233\128\154\232\191\135\233\133\141\231\189\174\230\136\152\230\150\151\232\131\140\229\140\133\239\188\140\229\143\175\228\187\165\229\156\168\230\136\152\230\150\151\228\184\173\228\189\191\231\148\168\229\144\132\231\167\141\233\129\147\229\133\183\232\190\133\229\138\169\230\136\152\230\150\151\239\188\140\228\185\159\229\143\175\228\187\165\229\143\172\229\148\164\229\141\143\230\136\152\228\188\153\228\188\180\228\184\128\232\181\183\229\143\130\228\184\142\230\136\152\230\150\151\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              GuideManPosEnum = "Left",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["17454761535502276690"] = {
            key = "17454761535502276690",
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
          ["17454761535502276693"] = {
            key = "17454761535502276693",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 764.1341614906833, y = 61.8211180124224},
            propsData = {ModeType = 0}
          },
          ["17454761535502276694"] = {
            key = "17454761535502276694",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2414.8932330827065, y = 665.6951127819549},
            propsData = {ModeType = 0}
          },
          ["17454761535502276695"] = {
            key = "17454761535502276695",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17454761535502276705"] = {
            key = "17454761535502276705",
            type = "ShowGuideButtonNode",
            name = "\229\156\136\229\156\136\229\165\150\229\138\177",
            pos = {x = 1826.4330840843686, y = 666.8263081842701},
            propsData = {
              ShowEnable = true,
              MessageId = 302505,
              MessageNote = "\231\130\185\229\135\187\233\133\141\231\189\174\230\173\166\229\153\168\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.Group_Task:1.PanelRoot:1.Progress",
              UICompName = "",
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
          ["17454761535502276706"] = {
            key = "17454761535502276706",
            type = "ShowGuideButtonNode",
            name = "\229\156\136\229\156\136\228\184\128\228\184\170\228\187\187\229\138\161",
            pos = {x = 1946.9194366715228, y = 443.778042173647},
            propsData = {
              ShowEnable = true,
              MessageId = 302504,
              MessageNote = "\231\130\185\229\135\187\229\141\143\230\136\152\229\141\176\232\174\176\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.Group_Task:1.PanelRoot:1.List_Task:1",
              UICompName = "",
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
          ["17454761535502276707"] = {
            key = "17454761535502276707",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 2233.412061390808, y = 498.1648828090441},
            propsData = {GuideId = 32}
          },
          ["17455019297665493546"] = {
            key = "17455019297665493546",
            type = "ShowGuideButtonNode",
            name = "\230\140\137\229\142\134\231\187\131",
            pos = {x = 1310.688074455552, y = 267.49607854499413},
            propsData = {
              ShowEnable = true,
              MessageId = 302502,
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
          ["17455019297665493547"] = {
            key = "17455019297665493547",
            type = "ShowGuideTextNode",
            name = "\230\175\143\230\151\165\232\167\163\233\148\129\229\149\166",
            pos = {x = 1089.892695121876, y = 51.383541280466375},
            propsData = {
              MessageId = 302501,
              MessageNote = "\230\173\167\232\183\175\232\191\183\230\180\165\232\167\163\233\148\129\228\186\134\239\188\140\229\156\168\230\173\167\232\183\175\232\191\183\230\180\165\228\184\173\239\188\140\230\136\145\228\187\172\229\176\134\230\142\162\231\180\162\230\156\170\231\159\165\231\154\132\230\183\177\230\184\138\239\188\140\232\142\183\229\143\150\228\184\141\229\144\140\231\187\132\229\144\136\231\154\132\231\131\155\232\138\175\229\146\140\233\129\151\231\137\169\239\188\140\230\140\145\230\136\152\229\188\186\230\149\140\239\188\129\228\184\128\232\181\183\229\142\187\231\156\139\231\156\139\229\144\167\239\188\129",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["17455019297665493548"] = {
            key = "17455019297665493548",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 1209.4214359200028, y = 1002.3351239902302},
            propsData = {}
          },
          ["17455019297665493549"] = {
            key = "17455019297665493549",
            type = "ShowGuideButtonNode",
            name = "\230\140\137\229\142\134\231\187\131",
            pos = {x = 1342.593723310032, y = 599.0156052736526},
            propsData = {
              ShowEnable = true,
              MessageId = 302502,
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
          ["17455019297665493550"] = {
            key = "17455019297665493550",
            type = "ShowGuideButtonNode",
            name = "\230\140\137\230\175\143\230\151\165",
            pos = {x = 1674.1397298514935, y = 402.8160023371309},
            propsData = {
              ShowEnable = true,
              MessageId = 302503,
              MessageNote = "\231\130\185\229\135\187<H>\226\128\156\232\191\183\230\180\165\226\128\157</>\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.Group_Task:1.Tab.List_Tab:2",
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
              MessageLoc = "Down",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17455019297665493551"] = {
            key = "17455019297665493551",
            type = "ShowGuideButtonNode",
            name = "\230\140\137\230\175\143\230\151\165",
            pos = {x = 1671.2590501467575, y = 541.3317440889357},
            propsData = {
              ShowEnable = true,
              MessageId = 302503,
              MessageNote = "\231\130\185\229\135\187<H>\226\128\156\232\191\183\230\180\165\226\128\157</>\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.Group_Task:1.Tab.List_Tab:2",
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
              MessageLoc = "Left",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17562197359871905934"] = {
            key = "17562197359871905934",
            type = "InputDeviceBranchNode",
            name = "\232\190\147\229\133\165\232\174\190\229\164\135\229\136\134\230\148\175",
            pos = {x = 637.0196411599085, y = 442.20129408109284},
            propsData = {}
          },
          ["17562197359871905935"] = {
            key = "17562197359871905935",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 981.8369106633821, y = 461.2710617758319},
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
          ["17562197487621906255"] = {
            key = "17562197487621906255",
            type = "ShowGuideButtonNode",
            name = "\230\140\137\229\142\134\231\187\131",
            pos = {x = 1806, y = -240},
            propsData = {
              ShowEnable = true,
              MessageId = 302502,
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
          ["17562204198582541118"] = {
            key = "17562204198582541118",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1318, y = 442},
            propsData = {
              ShowEnable = true,
              MessageId = 302502,
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
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
