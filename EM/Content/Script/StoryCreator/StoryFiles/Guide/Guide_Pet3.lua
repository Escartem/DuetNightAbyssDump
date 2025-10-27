return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17228506744874308",
      startPort = "StoryStart",
      endStory = "17228506801924729",
      endPort = "In"
    },
    {
      startStory = "17228506801924729",
      startPort = "Success",
      endStory = "17228506744874311",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17228506744874308"] = {
      isStoryNode = true,
      key = "17228506744874308",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 900, y = 388},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17228506744874311"] = {
      isStoryNode = true,
      key = "17228506744874311",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1798, y = 410},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17228506801924729"] = {
      isStoryNode = true,
      key = "17228506801924729",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1302, y = 378},
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
            startQuest = "17228506801924730",
            startPort = "QuestStart",
            endQuest = "17229436909251233",
            endPort = "In"
          },
          {
            startQuest = "17229436909251233",
            startPort = "Out",
            endQuest = "17229437048412077",
            endPort = "In"
          },
          {
            startQuest = "17229437048412077",
            startPort = "Out",
            endQuest = "17228507290646758",
            endPort = "In"
          },
          {
            startQuest = "17229460055061341",
            startPort = "Out",
            endQuest = "17229459999921014",
            endPort = "In"
          },
          {
            startQuest = "17229459999921014",
            startPort = "Out",
            endQuest = "17228506801934733",
            endPort = "Success"
          },
          {
            startQuest = "17228507290646758",
            startPort = "Out",
            endQuest = "17243182778481940",
            endPort = "In"
          },
          {
            startQuest = "17243182778481940",
            startPort = "Out",
            endQuest = "17268132087711736",
            endPort = "Input"
          },
          {
            startQuest = "17268132087711736",
            startPort = "PC",
            endQuest = "17268132147632199",
            endPort = "In"
          },
          {
            startQuest = "17268132147632199",
            startPort = "Out",
            endQuest = "17229460055061341",
            endPort = "In"
          },
          {
            startQuest = "17268132087711736",
            startPort = "Mobile",
            endQuest = "17289957539447118",
            endPort = "In"
          },
          {
            startQuest = "17289957539447118",
            startPort = "Out",
            endQuest = "17229459999921014",
            endPort = "In"
          }
        },
        nodeData = {
          ["17228506801924730"] = {
            key = "17228506801924730",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17228506801934733"] = {
            key = "17228506801934733",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17228506801934736"] = {
            key = "17228506801934736",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17228507290646758"] = {
            key = "17228507290646758",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1568, y = 318},
            propsData = {
              ShowEnable = true,
              MessageId = 203007,
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
          ["17229436909251233"] = {
            key = "17229436909251233",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1142, y = 588},
            propsData = {WaitTime = 4}
          },
          ["17229437048412077"] = {
            key = "17229437048412077",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 1214, y = 216},
            propsData = {
              ShowEnable = true,
              MessageId = 203006,
              MessageNote = "\232\191\155\229\133\165\230\149\180\229\164\135",
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
              IsResetPlayer = true,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "DownLeft",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17229459999921014"] = {
            key = "17229459999921014",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 2440, y = 290},
            propsData = {
              MessageId = 203009,
              MessageNote = "\229\174\160\231\137\169\231\149\140\233\157\162\232\167\163\233\135\138",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = false,
              GuideManPosEnum = "Left",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["17229460055061341"] = {
            key = "17229460055061341",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2130.274509803922, y = 308.156862745098},
            propsData = {
              ShowEnable = true,
              MessageId = 203010,
              MessageNote = "\229\174\160\231\137\169\229\135\186\230\136\152",
              DelayTime = 0,
              IsForceClick = true,
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
          ["17243182778481940"] = {
            key = "17243182778481940",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1738, y = 650},
            propsData = {
              ShowEnable = true,
              MessageId = 203008,
              MessageNote = "\230\159\165\231\156\139\229\174\160\231\137\169\230\138\128\232\131\189",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:2.List_Skill:1",
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
              MessageLoc = "Left",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17268132087711736"] = {
            key = "17268132087711736",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 1876, y = 420},
            propsData = {}
          },
          ["17268132147632199"] = {
            key = "17268132147632199",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 2000.6666666666667, y = 116.66666666666674},
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
          ["17289957539447118"] = {
            key = "17289957539447118",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2170.0084033613443, y = 598.2051066580476},
            propsData = {
              ShowEnable = true,
              MessageId = 203010,
              MessageNote = "\229\174\160\231\137\169\229\135\186\230\136\152",
              DelayTime = 0,
              IsForceClick = true,
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
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
