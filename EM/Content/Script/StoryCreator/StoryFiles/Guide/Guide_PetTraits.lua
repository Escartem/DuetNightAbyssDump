return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17551804779181",
      startPort = "StoryStart",
      endStory = "1755180805726304944",
      endPort = "In"
    },
    {
      startStory = "1755180805726304944",
      startPort = "Success",
      endStory = "17551804779195",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17551804779181"] = {
      isStoryNode = true,
      key = "17551804779181",
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
    ["17551804779195"] = {
      isStoryNode = true,
      key = "17551804779195",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1576, y = 298},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1755180805726304944"] = {
      isStoryNode = true,
      key = "1755180805726304944",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1166, y = 282},
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
            startQuest = "17552235258982128321",
            startPort = "Out",
            endQuest = "17552258186203953581",
            endPort = "In"
          },
          {
            startQuest = "17552258186203953581",
            startPort = "Out",
            endQuest = "17552261836034562294",
            endPort = "In"
          },
          {
            startQuest = "17564439187971712",
            startPort = "Out",
            endQuest = "17564439187971714",
            endPort = "In"
          },
          {
            startQuest = "17564439187971710",
            startPort = "Out",
            endQuest = "1755181426320912509",
            endPort = "In"
          },
          {
            startQuest = "17564439187971714",
            startPort = "Out",
            endQuest = "1755181426320912509",
            endPort = "In"
          },
          {
            startQuest = "17564439187971713",
            startPort = "Out",
            endQuest = "1755181426320912509",
            endPort = "In"
          },
          {
            startQuest = "17552261836034562294",
            startPort = "Out",
            endQuest = "17552276337248820661",
            endPort = "In"
          },
          {
            startQuest = "175522830462711859662",
            startPort = "Out",
            endQuest = "175522871389113683334",
            endPort = "In"
          },
          {
            startQuest = "17564439187971711",
            startPort = "MouseAndKeyboard",
            endQuest = "17564439187971710",
            endPort = "In"
          },
          {
            startQuest = "17564439187971711",
            startPort = "Gamepad",
            endQuest = "17564439187971712",
            endPort = "In"
          },
          {
            startQuest = "17564439187971711",
            startPort = "Touch",
            endQuest = "17564439187971713",
            endPort = "In"
          },
          {
            startQuest = "17566322556686357122",
            startPort = "Out",
            endQuest = "1755180805727304948",
            endPort = "Success"
          },
          {
            startQuest = "1755180805727304945",
            startPort = "QuestStart",
            endQuest = "17566329058858262191",
            endPort = "In"
          },
          {
            startQuest = "17566329058858262191",
            startPort = "Out",
            endQuest = "17564439187971711",
            endPort = "Input"
          },
          {
            startQuest = "17566327586357626476",
            startPort = "PC",
            endQuest = "17566327056797625379",
            endPort = "In"
          },
          {
            startQuest = "17566327586357626476",
            startPort = "Mobile",
            endQuest = "17566327828917627355",
            endPort = "In"
          },
          {
            startQuest = "17552276337248820661",
            startPort = "Out",
            endQuest = "17552268860485781014",
            endPort = "In"
          },
          {
            startQuest = "17552268860485781014",
            startPort = "Out",
            endQuest = "17566322556686357122",
            endPort = "In"
          },
          {
            startQuest = "1755181426320912509",
            startPort = "Out",
            endQuest = "17552235258982128321",
            endPort = "In"
          }
        },
        nodeData = {
          ["1755180805727304945"] = {
            key = "1755180805727304945",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -58.820505681018204, y = 88.15384738277555},
            propsData = {ModeType = 0}
          },
          ["1755180805727304948"] = {
            key = "1755180805727304948",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2366, y = 824},
            propsData = {ModeType = 0}
          },
          ["1755180805727304951"] = {
            key = "1755180805727304951",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1755181426320912509"] = {
            key = "1755181426320912509",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1705.7279411764705, y = 283.9264705882353},
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
          ["17552235258982128321"] = {
            key = "17552235258982128321",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 690, y = 558},
            propsData = {
              ShowEnable = true,
              MessageId = 303202,
              MessageNote = "\231\130\185\229\135\187\229\164\177\230\180\187\233\173\148\231\129\181",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Tab_PetAlive",
              UICompName = "Btn_Switch",
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
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17552258186203953581"] = {
            key = "17552258186203953581",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1016, y = 568},
            propsData = {
              ShowEnable = true,
              MessageId = 303203,
              MessageNote = "\229\164\177\230\180\187\233\173\148\231\129\181\230\151\160\230\179\149\228\189\156\228\184\186\228\188\153\228\188\180\229\143\130\229\138\160\230\136\152\230\150\151\239\188\140\228\189\134\230\152\175\229\143\175\228\187\165\233\128\154\232\191\135\233\173\148\231\129\181\232\174\173\231\187\131\239\188\140\232\174\169\229\133\182\228\187\150\233\173\148\231\129\181\229\173\166\228\188\154\229\164\177\230\180\187\233\173\148\231\129\181\231\154\132\230\189\156\232\180\168",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:3.Pet_Entry",
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
          ["17552261836034562294"] = {
            key = "17552261836034562294",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1371.8181821684752, y = 569.5151514859605},
            propsData = {
              ShowEnable = true,
              MessageId = 303204,
              MessageNote = "\231\130\185\229\135\187\230\180\187\229\138\155\233\173\148\231\129\181",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Tab_PetAlive",
              UICompName = "Btn_Switch",
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
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17552268860485781014"] = {
            key = "17552268860485781014",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2005.1828664803468, y = 580.6938291641499},
            propsData = {
              ShowEnable = true,
              MessageId = 303205,
              MessageNote = "\230\180\187\229\138\155\233\173\148\231\129\181\230\156\137\231\157\128\230\189\156\232\180\168\230\167\189\228\189\141\239\188\140\230\189\156\232\180\168\230\167\189\228\189\141\228\188\154\233\154\143\231\157\128\233\173\148\231\129\181\230\152\159\231\186\167\231\170\129\231\160\180\233\128\144\230\173\165\232\167\163\233\148\129",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:3.WB_EntryItem",
              UICompName = "",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 50, Y = 50},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17552276337248820661"] = {
            key = "17552276337248820661",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1698.7565337077613, y = 576.0522464762795},
            propsData = {
              ShowEnable = true,
              MessageId = 302603,
              MessageNote = "\230\137\147\229\188\128\230\189\156\232\180\168",
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
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 60, Y = 20},
              UICompLocOffset = {X = -20, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Down",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["175522830462711859662"] = {
            key = "175522830462711859662",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 888, y = 988},
            propsData = {
              ShowEnable = true,
              MessageId = 303206,
              MessageNote = "\231\130\185\229\135\187\233\173\148\231\129\181\232\174\173\231\187\131",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:3.Btn_Mix",
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
          ["175522871389113683334"] = {
            key = "175522871389113683334",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1308, y = 1026},
            propsData = {
              ShowEnable = true,
              MessageId = 303207,
              MessageNote = "\230\183\187\229\138\160\229\164\177\230\180\187\233\173\148\231\129\181",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "PetMix",
              UICompName = "Btn_Add",
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
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17564439187971710"] = {
            key = "17564439187971710",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1339.5913382141675, y = -100.63310341272734},
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
          ["17564439187971711"] = {
            key = "17564439187971711",
            type = "InputDeviceBranchNode",
            name = "\232\190\147\229\133\165\232\174\190\229\164\135\229\136\134\230\148\175",
            pos = {x = 701.9193585208521, y = 88.54441912258933},
            propsData = {}
          },
          ["17564439187971712"] = {
            key = "17564439187971712",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 1130.5666402955849, y = 89.94673743757517},
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
          ["17564439187971713"] = {
            key = "17564439187971713",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1218.933877966598, y = 317.0433596766827},
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
          ["17564439187971714"] = {
            key = "17564439187971714",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1381.7100884722943, y = 102.74518569169169},
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
          ["17566314380364452809"] = {
            key = "17566314380364452809",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1899.6923086578952, y = 983.3333291491213},
            propsData = {
              ShowEnable = true,
              MessageId = 303207,
              MessageNote = "\231\130\185\229\135\187\233\173\148\231\129\181\232\174\173\231\187\131",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:3.Btn_Mix",
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
              MessageLoc = "UpLeft",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17566322556686357122"] = {
            key = "17566322556686357122",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1952.8817043984411, y = 803.9569694178663},
            propsData = {
              ShowEnable = true,
              MessageId = 303206,
              MessageNote = "\231\130\185\229\135\187\233\173\148\231\129\181\232\174\173\231\187\131",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ArmoryMain.Panel_SubUI:3.Btn_Mix",
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
              MessageLoc = "UpLeft",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17566327056797625379"] = {
            key = "17566327056797625379",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 691.4458411384853, y = -446.86352371051566},
            propsData = {
              ShowEnable = true,
              MessageId = 303201,
              MessageNote = "\233\173\148\231\129\181\229\136\134\228\184\186<H>\230\180\187\229\138\155\233\173\148\231\129\181</>\229\146\140<H>\229\164\177\230\180\187\233\173\148\231\129\181</>\239\188\140\232\174\169\230\136\145\228\187\172\230\157\165\231\156\139\231\156\139\228\187\150\228\187\172\231\154\132\229\140\186\229\136\171\229\144\167",
              DelayTime = 0,
              IsForceClick = false,
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
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Left",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17566327586357626476"] = {
            key = "17566327586357626476",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 446.36892543513864, y = -318.96608749121737},
            propsData = {}
          },
          ["17566327828917627355"] = {
            key = "17566327828917627355",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 742.3689174470974, y = -184.40199297367622},
            propsData = {
              ShowEnable = true,
              MessageId = 303201,
              MessageNote = "\233\173\148\231\129\181\229\136\134\228\184\186<H>\230\180\187\229\138\155\233\173\148\231\129\181</>\229\146\140<H>\229\164\177\230\180\187\233\173\148\231\129\181</>\239\188\140\232\174\169\230\136\145\228\187\172\230\157\165\231\156\139\231\156\139\228\187\150\228\187\172\231\154\132\229\140\186\229\136\171\229\144\167",
              DelayTime = 0,
              IsForceClick = false,
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
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "DownRight",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17566329058858262191"] = {
            key = "17566329058858262191",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 288.0099527732573, y = 96.21340682776452},
            propsData = {
              MessageId = 303201,
              MessageNote = "",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
