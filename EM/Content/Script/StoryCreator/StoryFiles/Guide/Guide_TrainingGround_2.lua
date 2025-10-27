return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851536830111576305",
      startPort = "StoryStart",
      endStory = "171851536830111576307",
      endPort = "In"
    },
    {
      startStory = "171851536830111576307",
      startPort = "Success",
      endStory = "171851536830111576306",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["171851536830111576305"] = {
      isStoryNode = true,
      key = "171851536830111576305",
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
    ["171851536830111576306"] = {
      isStoryNode = true,
      key = "171851536830111576306",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1508.235294117647, y = 312.35294117647055},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["171851536830111576307"] = {
      isStoryNode = true,
      key = "171851536830111576307",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1133.140730225936, y = 297.6286915119693},
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
            startQuest = "1717657751774264930",
            startPort = "Out",
            endQuest = "1717658634841267181",
            endPort = "In"
          },
          {
            startQuest = "1717659001920267758",
            startPort = "Out",
            endQuest = "1717659148974268395",
            endPort = "In"
          },
          {
            startQuest = "1717659148974268395",
            startPort = "Out",
            endQuest = "1717659224853268828",
            endPort = "In"
          },
          {
            startQuest = "1717659224853268828",
            startPort = "Out",
            endQuest = "1717659421329269714",
            endPort = "In"
          },
          {
            startQuest = "1717659421329269714",
            startPort = "Out",
            endQuest = "1717659509411270787",
            endPort = "In"
          },
          {
            startQuest = "1717659509411270787",
            startPort = "Out",
            endQuest = "1717659674690272156",
            endPort = "In"
          },
          {
            startQuest = "1717657719626264455",
            startPort = "Out",
            endQuest = "1717657751774264930",
            endPort = "In"
          },
          {
            startQuest = "171851536830111576308",
            startPort = "QuestStart",
            endQuest = "1717657719626264455",
            endPort = "In"
          },
          {
            startQuest = "1717659674690272156",
            startPort = "Out",
            endQuest = "171851536830111576309",
            endPort = "Success"
          },
          {
            startQuest = "17490106110711172157",
            startPort = "MouseAndKeyboard",
            endQuest = "1717659001920267758",
            endPort = "In"
          },
          {
            startQuest = "17490106110711172157",
            startPort = "Gamepad",
            endQuest = "17490106210051172419",
            endPort = "In"
          },
          {
            startQuest = "17490106210051172419",
            startPort = "Out",
            endQuest = "17490117101836398655",
            endPort = "In"
          },
          {
            startQuest = "17490117101836398655",
            startPort = "Out",
            endQuest = "1717659224853268828",
            endPort = "In"
          },
          {
            startQuest = "1717658634841267181",
            startPort = "Out",
            endQuest = "17490453197469307563",
            endPort = "Input"
          },
          {
            startQuest = "17490453197469307563",
            startPort = "PC",
            endQuest = "17490106110711172157",
            endPort = "Input"
          },
          {
            startQuest = "17490453197469307563",
            startPort = "Mobile",
            endQuest = "1717659001920267758",
            endPort = "In"
          }
        },
        nodeData = {
          ["1717657719626264455"] = {
            key = "1717657719626264455",
            type = "ShowGuideToastNode",
            name = "Toast\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 465.36579416455515, y = 277.9100214352432},
            propsData = {
              ShowEnable = false,
              MessageId = 301401,
              MessageNote = "\230\137\147\229\188\128\232\174\173\231\187\131\232\143\156\229\141\149",
              LastTime = -1,
              Style = "Normal"
            }
          },
          ["1717657751774264930"] = {
            key = "1717657751774264930",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 733.0128529880844, y = 288.4982567293608},
            propsData = {
              MessageId = 301501,
              MessageNote = "\229\156\168\230\178\153\230\181\183\229\134\165\230\131\179\228\184\173\239\188\140\230\136\145\228\187\172\229\143\175\228\187\165\229\155\158\229\191\134\230\155\190\231\187\143\232\167\129\232\191\135\231\154\132\230\149\140\228\186\186\239\188\140\229\185\182\228\184\142\229\174\131\228\187\172\232\191\155\232\161\140\232\135\170\228\184\187\231\154\132\230\136\152\230\150\151\227\128\130\229\143\175\228\187\165\228\187\165\230\173\164\231\134\159\230\130\137\229\174\131\228\187\172\231\154\132\230\139\155\229\188\143\227\128\129\230\181\139\232\175\149\232\135\170\229\183\177\231\154\132\230\138\128\232\131\189\227\128\130",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["1717658634841267181"] = {
            key = "1717658634841267181",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 990.8133644970356, y = 265.4803539160616},
            propsData = {
              ShowEnable = true,
              MessageId = 301502,
              MessageNote = "\231\130\185\229\135\187\226\128\156\231\150\190\229\134\178\231\167\189\229\133\189\226\128\157",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "TrainingGroundSetup.WBP_Training_Root.List_Item:1",
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
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1717659001920267758"] = {
            key = "1717659001920267758",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1909.860679075041, y = 27.24122348127902},
            propsData = {
              ShowEnable = true,
              MessageId = 301503,
              MessageNote = "\231\130\185\229\135\187\226\128\156+\226\128\157\239\188\140\229\143\175\228\187\165\229\162\158\229\138\160\231\148\159\230\136\144\231\154\132\230\149\140\228\186\186\230\149\176\233\135\143",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "TrainingGroundSetup.WBP_Training_Root.Com_Slider.Btn_Add",
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
          ["1717659148974268395"] = {
            key = "1717659148974268395",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2195.709783934376, y = 27.310277189718903},
            propsData = {
              ShowEnable = true,
              MessageId = 301504,
              MessageNote = "\232\139\165\233\128\137\230\139\169\228\186\134\229\164\154\228\184\170\230\149\140\228\186\186\239\188\140\229\143\175\228\187\165\229\156\168\232\191\153\233\135\140\229\136\134\229\136\171\232\176\131\230\149\180\229\133\182\231\148\159\230\136\144\230\149\176\233\135\143\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "TrainingGroundSetup.WBP_Training_Root.Btn_Show",
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
          ["1717659224853268828"] = {
            key = "1717659224853268828",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1093.3760243435834, y = 472.3345738649108},
            propsData = {
              ShowEnable = true,
              MessageId = 301505,
              MessageNote = "\231\130\185\229\135\187\226\128\156+\226\128\157\239\188\140\229\143\175\228\187\165\229\162\158\229\138\160\230\149\140\228\186\186\231\154\132\231\173\137\231\186\167\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "TrainingGroundSetup.WBP_Training_Root.Com_NumInput.Btn_Add",
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
          ["1717659421329269714"] = {
            key = "1717659421329269714",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1365.1407302259363, y = 474.0992797472638},
            propsData = {
              ShowEnable = true,
              MessageId = 301506,
              MessageNote = "\232\191\153\233\135\140\229\143\175\228\187\165\233\128\137\230\139\169\230\152\175\229\144\166\229\188\128\229\144\175\231\142\169\229\174\182\231\154\132\230\151\160\230\149\140\231\138\182\230\128\129\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "TrainingGroundSetup.WBP_Training_Root.InvincibleSetting.Btn_Setting",
              UICompName = "ButtonArea",
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
          ["1717659509411270787"] = {
            key = "1717659509411270787",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1636.6701419906424, y = 481.15810327667543},
            propsData = {
              ShowEnable = true,
              MessageId = 301507,
              MessageNote = "\232\191\153\233\135\140\229\143\175\228\187\165\233\128\137\230\139\169\230\152\175\229\144\166\229\188\128\229\144\175\230\149\140\228\186\186\231\154\132AI\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "TrainingGroundSetup.WBP_Training_Root.AISetting.Btn_Setting",
              UICompName = "ButtonArea",
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
          ["1717659674690272156"] = {
            key = "1717659674690272156",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1943.728965520054, y = 472.33457386491074},
            propsData = {
              ShowEnable = true,
              MessageId = 301508,
              MessageNote = "\229\156\168\233\133\141\231\189\174\229\174\140\230\175\149\229\144\142\239\188\140\231\130\185\229\135\187\226\128\156\231\148\159\230\136\144\230\149\140\228\186\186\226\128\157\239\188\140\229\141\179\229\143\175\229\188\128\229\167\139\230\136\152\230\150\151\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "TrainingGroundSetup.WBP_Training_Root.Btn_Confirm",
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
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["171851536830111576308"] = {
            key = "171851536830111576308",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 198.695652173913, y = 273.2225063938619},
            propsData = {ModeType = 0}
          },
          ["171851536830111576309"] = {
            key = "171851536830111576309",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2212.1848739495795, y = 469.2436974789915},
            propsData = {ModeType = 0}
          },
          ["171851536830111576310"] = {
            key = "171851536830111576310",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17490106110711172157"] = {
            key = "17490106110711172157",
            type = "InputDeviceBranchNode",
            name = "\232\190\147\229\133\165\232\174\190\229\164\135\229\136\134\230\148\175",
            pos = {x = 1582.3695652173915, y = 3.3260869565217206},
            propsData = {}
          },
          ["17490106210051172419"] = {
            key = "17490106210051172419",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1916.7753623188407, y = 212.35304774083556},
            propsData = {
              ShowEnable = true,
              MessageId = 301503,
              MessageNote = "\231\130\185\229\135\187\226\128\156+\226\128\157\239\188\140\229\143\175\228\187\165\229\162\158\229\138\160\231\148\159\230\136\144\231\154\132\230\149\140\228\186\186\230\149\176\233\135\143",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "TrainingGroundSetup.WBP_Training_Root.Com_Slider.Key_Add",
              UICompName = "Button_Key",
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
          ["17490106719231172677"] = {
            key = "17490106719231172677",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2632.666666666667, y = 263.0269607843138},
            propsData = {
              ShowEnable = true,
              MessageId = 301504,
              MessageNote = "\232\139\165\233\128\137\230\139\169\228\186\134\229\164\154\228\184\170\230\149\140\228\186\186\239\188\140\229\143\175\228\187\165\229\156\168\232\191\153\233\135\140\229\136\134\229\136\171\232\176\131\230\149\180\229\133\182\231\148\159\230\136\144\230\149\176\233\135\143\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "TrainingGroundSetup.WBP_Training_Root.Key_BottomNum",
              UICompName = "Button_Key",
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
          ["17490117101836398655"] = {
            key = "17490117101836398655",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2207.9057971014495, y = 213.13565643648772},
            propsData = {
              ShowEnable = true,
              MessageId = 301504,
              MessageNote = "\232\139\165\233\128\137\230\139\169\228\186\134\229\164\154\228\184\170\230\149\140\228\186\186\239\188\140\229\143\175\228\187\165\229\156\168\232\191\153\233\135\140\229\136\134\229\136\171\232\176\131\230\149\180\229\133\182\231\148\159\230\136\144\230\149\176\233\135\143\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "TrainingGroundSetup.WBP_Training_Root.Btn_Show",
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
          ["17490453197469307563"] = {
            key = "17490453197469307563",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 1307.1304347826085, y = 235.91304347826085},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
