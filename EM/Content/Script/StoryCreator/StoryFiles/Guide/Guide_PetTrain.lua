return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17466068176411",
      startPort = "StoryStart",
      endStory = "1746607112447378",
      endPort = "In"
    },
    {
      startStory = "1746607112447378",
      startPort = "Success",
      endStory = "17466068176425",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17466068176411"] = {
      isStoryNode = true,
      key = "17466068176411",
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
    ["17466068176425"] = {
      isStoryNode = true,
      key = "17466068176425",
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
    ["1746607112447378"] = {
      isStoryNode = true,
      key = "1746607112447378",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1678.4705882352941, y = 288.00000000000034},
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
            startQuest = "1746608261424560005",
            startPort = "Out",
            endQuest = "1746608332791560729",
            endPort = "In"
          },
          {
            startQuest = "17466224271751046",
            startPort = "Mobile",
            endQuest = "17466224271751048",
            endPort = "In"
          },
          {
            startQuest = "17466100841231119993",
            startPort = "Out",
            endQuest = "17466224271751045",
            endPort = "In"
          },
          {
            startQuest = "17466224271751044",
            startPort = "Out",
            endQuest = "17466227560905548",
            endPort = "In"
          },
          {
            startQuest = "17466224271751048",
            startPort = "Out",
            endQuest = "17466227560905548",
            endPort = "In"
          },
          {
            startQuest = "17466224271751046",
            startPort = "PC",
            endQuest = "17466224271751044",
            endPort = "In"
          },
          {
            startQuest = "17483566992451637",
            startPort = "Out",
            endQuest = "1746607112448386",
            endPort = "Success"
          },
          {
            startQuest = "17466224271751045",
            startPort = "Out",
            endQuest = "17466224271751046",
            endPort = "Input"
          },
          {
            startQuest = "17466227560905548",
            startPort = "Out",
            endQuest = "1748357135436790",
            endPort = "In"
          },
          {
            startQuest = "1748357135436790",
            startPort = "Out",
            endQuest = "17483566992451637",
            endPort = "In"
          },
          {
            startQuest = "17562623907986981193",
            startPort = "MouseAndKeyboard",
            endQuest = "17562623907976981192",
            endPort = "In"
          },
          {
            startQuest = "17562623907986981193",
            startPort = "Gamepad",
            endQuest = "17562623907986981194",
            endPort = "In"
          },
          {
            startQuest = "17562623907986981194",
            startPort = "Out",
            endQuest = "17562623907986981195",
            endPort = "In"
          },
          {
            startQuest = "17562623907986981193",
            startPort = "Touch",
            endQuest = "17562623907976981191",
            endPort = "In"
          },
          {
            startQuest = "17562623907976981192",
            startPort = "Out",
            endQuest = "17466100841231119993",
            endPort = "In"
          },
          {
            startQuest = "17562623907986981195",
            startPort = "Out",
            endQuest = "17466100841231119993",
            endPort = "In"
          },
          {
            startQuest = "17562623907976981191",
            startPort = "Out",
            endQuest = "17466100841231119993",
            endPort = "In"
          },
          {
            startQuest = "1746607112447379",
            startPort = "QuestStart",
            endQuest = "17562623907986981193",
            endPort = "Input"
          }
        },
        nodeData = {
          ["1746607112447379"] = {
            key = "1746607112447379",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 300.0000103099924, y = 112.16216603537555},
            propsData = {ModeType = 0}
          },
          ["1746607112448386"] = {
            key = "1746607112448386",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3966.25, y = 293.75},
            propsData = {ModeType = 0}
          },
          ["1746607112448393"] = {
            key = "1746607112448393",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1746608261424560005"] = {
            key = "1746608261424560005",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2004.4928013163305, y = 298.82102701220373},
            propsData = {
              ShowEnable = true,
              MessageId = 302603,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.EMListView_SubTab:2",
              UICompName = "TextBlock_Name",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 60, Y = 20},
              UICompLocOffset = {X = -20, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1746608332791560729"] = {
            key = "1746608332791560729",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 2402.13986013986, y = 297.05632112985074},
            propsData = {GuideId = 78}
          },
          ["17466100841231119993"] = {
            key = "17466100841231119993",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1603.2795660222127, y = 296.3945564239685},
            propsData = {
              ShowEnable = true,
              MessageId = 302602,
              MessageNote = "\232\191\155\229\133\165\229\174\160\231\137\169\231\149\140\233\157\162",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Tab_Arm.EMScrollBox_TabItem:-2",
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
              MessageLoc = "DownRight",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17466224271751044"] = {
            key = "17466224271751044",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1922.8945832322186, y = 473.70950454773987},
            propsData = {
              ShowEnable = true,
              MessageId = 203010,
              MessageNote = "\229\174\160\231\137\169\229\135\186\230\136\152",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:2.Btn_Replace",
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
              MessageLoc = "UpLeft",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17466224271751045"] = {
            key = "17466224271751045",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 989.8442113442115, y = 533.052641802642},
            propsData = {
              ShowEnable = true,
              MessageId = 203008,
              MessageNote = "\230\159\165\231\156\139\229\174\160\231\137\169\230\138\128\232\131\189",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:2.List_Skill",
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
              MessageLoc = "Left",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17466224271751046"] = {
            key = "17466224271751046",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 1385.3442113442113, y = 521.8026418026419},
            propsData = {}
          },
          ["17466224271751048"] = {
            key = "17466224271751048",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1918.8526147055559, y = 646.2577484606895},
            propsData = {
              ShowEnable = true,
              MessageId = 203010,
              MessageNote = "\229\174\160\231\137\169\229\135\186\230\136\152",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:2.Btn_Replace",
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
              MessageLoc = "UpLeft",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17466227560905548"] = {
            key = "17466227560905548",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2586.7608780108776, y = 476.80264180264226},
            propsData = {
              ShowEnable = true,
              MessageId = 203009,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:2.Btn_Intensify",
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
          ["17483566992451637"] = {
            key = "17483566992451637",
            type = "ShowGuideToastNode",
            name = "Toast\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 3254.228369669546, y = 293.9913746384338},
            propsData = {
              ShowEnable = true,
              MessageId = 203011,
              MessageNote = "",
              LastTime = 5,
              Style = "Normal"
            }
          },
          ["17483566992451638"] = {
            key = "17483566992451638",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 3378.418414918415, y = 705.8688256188259},
            propsData = {
              MessageId = 203011,
              MessageNote = "\229\174\160\231\137\169\230\138\128\232\131\189\233\135\138\230\148\190",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "Upleft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["1748357135436790"] = {
            key = "1748357135436790",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2826.6355996944235, y = 293.5233002291825},
            propsData = {WaitTime = 0.1}
          },
          ["17562623907976981191"] = {
            key = "17562623907976981191",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 917.5154604729305, y = 354.7542379873571},
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
          ["17562623907976981192"] = {
            key = "17562623907976981192",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1038.1729207205, y = -18.511968838097644},
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
          ["17562623907986981193"] = {
            key = "17562623907986981193",
            type = "InputDeviceBranchNode",
            name = "\232\190\147\229\133\165\232\174\190\229\164\135\229\136\134\230\148\175",
            pos = {x = 612.8714940340383, y = 98.83594240608727},
            propsData = {}
          },
          ["17562623907986981194"] = {
            key = "17562623907986981194",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 967.1482228019174, y = 130.0678720122049},
            propsData = {
              MessageId = 301611,
              SkillNameList = {"OpenMenu"},
              LastTime = -1,
              bIsForceTouch = true,
              bIsTimeDilation = true,
              HighLightUIPath = "BattleMain.Btn_Esc",
              UICompName = "Btn_top",
              UIShape = "Square",
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              ForbidSuccessAnim = false,
              IsNotForceRelease = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Left",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17562623907986981195"] = {
            key = "17562623907986981195",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1200.2916709786268, y = 164.8663202663214},
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
