return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17008104628832179",
      startPort = "StoryStart",
      endStory = "17008104656692378",
      endPort = "In"
    },
    {
      startStory = "17008104656692378",
      startPort = "Success",
      endStory = "17008104628842182",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17008104628832179"] = {
      isStoryNode = true,
      key = "17008104628832179",
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
    ["17008104628842182"] = {
      isStoryNode = true,
      key = "17008104628842182",
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
    ["17008104656692378"] = {
      isStoryNode = true,
      key = "17008104656692378",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1194, y = 312},
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
            startQuest = "17008104656692379",
            startPort = "QuestStart",
            endQuest = "17008104706082854",
            endPort = "In"
          },
          {
            startQuest = "17008104706082855",
            startPort = "Out",
            endQuest = "170082303881916603",
            endPort = "In"
          },
          {
            startQuest = "170082303881916603",
            startPort = "Out",
            endQuest = "17022863467898260",
            endPort = "In"
          },
          {
            startQuest = "17022863467898260",
            startPort = "Out",
            endQuest = "17022869462559245",
            endPort = "In"
          },
          {
            startQuest = "17022869462559245",
            startPort = "Out",
            endQuest = "1746603170528559462",
            endPort = "In"
          },
          {
            startQuest = "1746603170528559462",
            startPort = "Out",
            endQuest = "17008104656692381",
            endPort = "Success"
          },
          {
            startQuest = "1755524148250622",
            startPort = "Gamepad",
            endQuest = "1755524148250623",
            endPort = "In"
          },
          {
            startQuest = "1755524148250622",
            startPort = "Touch",
            endQuest = "17555241889261525",
            endPort = "In"
          },
          {
            startQuest = "17555241889261525",
            startPort = "Out",
            endQuest = "170082303881916603",
            endPort = "In"
          },
          {
            startQuest = "1755524148250622",
            startPort = "MouseAndKeyboard",
            endQuest = "17008104706082855",
            endPort = "In"
          },
          {
            startQuest = "1755524148250623",
            startPort = "Out",
            endQuest = "17555242332952124",
            endPort = "In"
          },
          {
            startQuest = "17555242332952124",
            startPort = "Out",
            endQuest = "170082303881916603",
            endPort = "In"
          },
          {
            startQuest = "17008104706082854",
            startPort = "Out",
            endQuest = "1755524148250622",
            endPort = "Input"
          }
        },
        nodeData = {
          ["17008104656692379"] = {
            key = "17008104656692379",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 92.85713429353666, y = 295.2380951804279},
            propsData = {ModeType = 0}
          },
          ["17008104656692381"] = {
            key = "17008104656692381",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2694.509090909091, y = 316.2},
            propsData = {ModeType = 0}
          },
          ["17008104656692383"] = {
            key = "17008104656692383",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17008104706082854"] = {
            key = "17008104706082854",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 421.2776471140495, y = 290.8073259496586},
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
          ["17008104706082855"] = {
            key = "17008104706082855",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 1427.5179495957552, y = 21.50117149951143},
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
          ["170082303881916603"] = {
            key = "170082303881916603",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1803.087159248971, y = 287.4695569136749},
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
          ["17022863467898260"] = {
            key = "17022863467898260",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2132.2727272727275, y = 277.7272727272727},
            propsData = {
              ShowEnable = true,
              MessageId = 300404,
              MessageNote = "\231\130\185\229\135\187\230\181\129\230\181\170\231\154\132\231\154\142\231\154\142\228\187\187\229\138\161",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "TaskPanel.WBP_Task_Root.List_Task:2.Task_SubItem.Common_List_Subcell_PC",
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
          ["17022869462559245"] = {
            key = "17022869462559245",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2444.832046401874, y = 290.35852173951463},
            propsData = {
              ShowEnable = true,
              MessageId = 300405,
              MessageNote = "\231\130\185\229\135\187\232\191\189\232\184\170\228\187\187\229\138\161",
              DelayTime = 0,
              IsForceClick = false,
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
          },
          ["1746603170528559462"] = {
            key = "1746603170528559462",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 2555.112076648841, y = 484.6116138763198},
            propsData = {GuideId = 73}
          },
          ["1755524148250622"] = {
            key = "1755524148250622",
            type = "InputDeviceBranchNode",
            name = "\232\190\147\229\133\165\232\174\190\229\164\135\229\136\134\230\148\175",
            pos = {x = 691.0131409589566, y = 250.76405571352115},
            propsData = {}
          },
          ["1755524148250623"] = {
            key = "1755524148250623",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 1035.8304104624303, y = 269.83382340826023},
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
          ["17555241889261525"] = {
            key = "17555241889261525",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 1134.1205785717439, y = 484.143843693618},
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
          ["17555242332952124"] = {
            key = "17555242332952124",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1349.5051890406417, y = 293.11820702775026},
            propsData = {
              ShowEnable = true,
              MessageId = 300402,
              MessageNote = "\231\130\185\229\135\187<H>\226\128\156\228\187\187\229\138\161\226\128\157</>\232\191\155\229\133\165\230\149\180\229\164\135\231\179\187\231\187\159\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = false,
              HighLightUIPath = "MenuWorld.Panel_Function:4",
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
