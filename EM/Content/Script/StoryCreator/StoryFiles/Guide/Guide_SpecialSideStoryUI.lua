return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17454761535772283724",
      startPort = "StoryStart",
      endStory = "17454761535772283726",
      endPort = "In"
    },
    {
      startStory = "17454761535772283726",
      startPort = "Success",
      endStory = "17454761535772283725",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17454761535772283724"] = {
      isStoryNode = true,
      key = "17454761535772283724",
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
    ["17454761535772283725"] = {
      isStoryNode = true,
      key = "17454761535772283725",
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
    ["17454761535772283726"] = {
      isStoryNode = true,
      key = "17454761535772283726",
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
            startQuest = "1745757086551552458",
            startPort = "Out",
            endQuest = "1745757086551552459",
            endPort = "In"
          },
          {
            startQuest = "1745757086551552459",
            startPort = "Out",
            endQuest = "1745757086551552460",
            endPort = "In"
          },
          {
            startQuest = "1745757086551552460",
            startPort = "Out",
            endQuest = "1745757086551552461",
            endPort = "In"
          },
          {
            startQuest = "17454761535772283732",
            startPort = "QuestStart",
            endQuest = "1745757086551552458",
            endPort = "In"
          },
          {
            startQuest = "1745757086551552461",
            startPort = "Out",
            endQuest = "17457624161901101319",
            endPort = "In"
          },
          {
            startQuest = "17457624161901101319",
            startPort = "Out",
            endQuest = "17454761535772283733",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17454761535772283732"] = {
            key = "17454761535772283732",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 680.9913043478261, y = 294.67826086956524},
            propsData = {ModeType = 0}
          },
          ["17454761535772283733"] = {
            key = "17454761535772283733",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2639.1, y = 457.15},
            propsData = {ModeType = 0}
          },
          ["17454761535772283734"] = {
            key = "17454761535772283734",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1745757086551552458"] = {
            key = "1745757086551552458",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1032.0738927738928, y = 304.9209790209791},
            propsData = {
              MessageId = 300401,
              MessageNote = "\229\189\147\228\184\141\231\159\165\233\129\147\229\129\154\228\187\128\228\185\136\231\154\132\230\151\182\229\128\153\239\188\140\229\176\177\230\137\147\229\188\128<H>\228\187\187\229\138\161\231\172\148\232\174\176</>\231\156\139\231\156\139\229\144\167\239\188\129",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["1745757086551552459"] = {
            key = "1745757086551552459",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 1369.632867132867, y = 293.6734265734267},
            propsData = {
              ShowEnable = true,
              MessageId = 300402,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = false,
              HighLightUIPath = "BattleMain.Btn_Task",
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
          ["1745757086551552460"] = {
            key = "1745757086551552460",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1706.7405392023509, y = 296.82130516542315},
            propsData = {
              MessageId = 300403,
              MessageNote = "\229\156\168\232\191\153\233\135\140\229\143\175\228\187\165\230\159\165\231\156\139\230\137\128\230\142\165\229\143\150\231\154\132\229\144\132\231\167\141\228\187\187\229\138\161\232\175\166\230\131\133\239\188\140\233\131\168\229\136\134\228\187\187\229\138\161\233\156\128\232\166\129\229\174\140\230\136\144\229\137\141\231\189\174\228\187\187\229\138\161\229\144\142\230\137\141\232\131\189\231\187\167\231\187\173\232\191\155\232\161\140\227\128\130\232\191\189\232\184\170\228\187\187\229\138\161\229\143\175\228\187\165\229\190\136\230\150\185\228\190\191\229\156\176\230\137\190\229\136\176\228\187\187\229\138\161\231\155\174\230\160\135\227\128\130",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["1745757086551552461"] = {
            key = "1745757086551552461",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2035.9261072261074, y = 287.0790209790209},
            propsData = {
              ShowEnable = true,
              MessageId = 300404,
              MessageNote = "\231\130\185\229\135\187\230\181\129\230\181\170\231\154\132\231\154\142\231\154\142\228\187\187\229\138\161",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "TaskPanel.WBP_Task_Root.List_Task:1.Task_SubItem.Common_List_Subcell_PC",
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
          ["17457624161901101319"] = {
            key = "17457624161901101319",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2333.3933731387287, y = 407.8000051279092},
            propsData = {
              ShowEnable = true,
              MessageId = 300405,
              MessageNote = "\231\130\185\229\135\187\232\191\189\232\184\170\228\187\187\229\138\161",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "TaskPanel.WBP_Task_Root.Common_Button_Text_PC",
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
