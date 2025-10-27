return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1700795644731361",
      startPort = "StoryStart",
      endStory = "1700795646572464",
      endPort = "In"
    },
    {
      startStory = "1700795646572464",
      startPort = "Success",
      endStory = "1700795644731364",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1700795644731361"] = {
      isStoryNode = true,
      key = "1700795644731361",
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
    ["1700795644731364"] = {
      isStoryNode = true,
      key = "1700795644731364",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2396, y = 298},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1700795646572464"] = {
      isStoryNode = true,
      key = "1700795646572464",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1222, y = 278},
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
            startQuest = "175403008514012527",
            startPort = "Out",
            endQuest = "175403052664113487",
            endPort = "In"
          },
          {
            startQuest = "175403064237113932",
            startPort = "Out",
            endQuest = "175403083064215001",
            endPort = "In"
          },
          {
            startQuest = "1700795646572465",
            startPort = "QuestStart",
            endQuest = "175402904789811750",
            endPort = "In"
          },
          {
            startQuest = "175403052664113487",
            startPort = "Out",
            endQuest = "175403064237113932",
            endPort = "In"
          },
          {
            startQuest = "17542136334512621902",
            startPort = "Out",
            endQuest = "1700795646572467",
            endPort = "Success"
          },
          {
            startQuest = "175403083064215001",
            startPort = "Out",
            endQuest = "17542136334512621902",
            endPort = "In"
          },
          {
            startQuest = "175402904789811750",
            startPort = "Out",
            endQuest = "17566306433572547962",
            endPort = "Input"
          },
          {
            startQuest = "17566306433572547962",
            startPort = "MouseAndKeyboard",
            endQuest = "175403008514012527",
            endPort = "In"
          },
          {
            startQuest = "17566306433572547962",
            startPort = "Touch",
            endQuest = "175403008514012529",
            endPort = "In"
          },
          {
            startQuest = "175403008514012529",
            startPort = "Out",
            endQuest = "175403052664113487",
            endPort = "In"
          },
          {
            startQuest = "17566306433572547962",
            startPort = "Gamepad",
            endQuest = "17566306789562549051",
            endPort = "In"
          },
          {
            startQuest = "17566307024822549330",
            startPort = "Out",
            endQuest = "175403052664113487",
            endPort = "In"
          },
          {
            startQuest = "17566306789562549051",
            startPort = "Out",
            endQuest = "17566307024822549330",
            endPort = "In"
          }
        },
        nodeData = {
          ["1700795646572465"] = {
            key = "1700795646572465",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1700795646572467"] = {
            key = "1700795646572467",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3641.1862031673745, y = 325.4548538432345},
            propsData = {ModeType = 0}
          },
          ["1700795646572469"] = {
            key = "1700795646572469",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17007956518031009"] = {
            key = "17007956518031009",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 2810, y = 1026},
            propsData = {GuideId = 11}
          },
          ["175402904789811750"] = {
            key = "175402904789811750",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1122, y = 296},
            propsData = {
              MessageId = 303001,
              MessageNote = "\230\162\166\233\173\135\230\174\139\229\163\176\228\184\173\232\174\176\229\189\149\231\157\128\228\184\142\228\189\160\228\186\164\230\137\139\232\191\135\231\154\132\229\188\186\229\164\167\230\149\140\228\186\186",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["175403008514012527"] = {
            key = "175403008514012527",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 1734.111342831805, y = 114.34145450868931},
            propsData = {
              ShowEnable = true,
              MessageId = 300801,
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
          ["175403008514012528"] = {
            key = "175403008514012528",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 1410.9296193240593, y = -197.33264923327488},
            propsData = {}
          },
          ["175403008514012529"] = {
            key = "175403008514012529",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 1754.3607037329266, y = 599.2069320522012},
            propsData = {
              ShowEnable = true,
              MessageId = 300801,
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
          ["175403052664113487"] = {
            key = "175403052664113487",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2125.354837856233, y = 325.2258064119178},
            propsData = {
              ShowEnable = true,
              MessageId = 303002,
              MessageNote = "\231\130\185\229\135\187\230\162\166\233\173\135\230\174\139\229\163\176",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.ComTab.EMScrollBox_TabItem:3",
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
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["175403064237113932"] = {
            key = "175403064237113932",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 2429.9999840028827, y = 305.0322613989029},
            propsData = {
              MessageId = 303003,
              MessageNote = "\230\162\166\233\173\135\230\174\139\229\163\176\230\140\145\230\136\152\228\184\173\231\154\132\233\166\150\233\162\134\230\149\140\228\186\186\230\139\165\230\156\137\230\155\180\229\188\186\229\164\167\231\154\132\230\136\152\230\150\151\229\138\155",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["175403083064215001"] = {
            key = "175403083064215001",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2740.064501263225, y = 316.32258384061527},
            propsData = {
              ShowEnable = true,
              MessageId = 303004,
              MessageNote = "\230\175\143\229\145\168\229\133\177\229\143\175\228\187\142\230\162\166\233\173\135\230\174\139\229\163\176\230\140\145\230\136\152\228\184\173\232\142\183\229\190\1513\230\172\161\229\165\150\229\138\177",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.Group_HardBoss:1.ListView_Rewards",
              UICompName = "",
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
          ["1754212992230961"] = {
            key = "1754212992230961",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1889.1539539772548, y = -146.14814200413207},
            propsData = {
              ShowEnable = true,
              MessageId = 303002,
              MessageNote = "\231\130\185\229\135\187\230\162\166\233\173\135\230\174\139\229\163\176",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.ComTab.EMScrollBox_TabItem:3",
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
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17542136334512621902"] = {
            key = "17542136334512621902",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 3223.399270181391, y = 304.0182515418913},
            propsData = {
              ShowEnable = true,
              MessageId = 303005,
              MessageNote = "\231\130\185\229\135\187\229\137\141\229\190\128\230\140\145\230\136\152",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.Group_HardBoss:1.Btn_Enter",
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
          ["17566306433572547962"] = {
            key = "17566306433572547962",
            type = "InputDeviceBranchNode",
            name = "\232\190\147\229\133\165\232\174\190\229\164\135\229\136\134\230\148\175",
            pos = {x = 1398.7741954339037, y = 263.16129284321835},
            propsData = {}
          },
          ["17566306789562549051"] = {
            key = "17566306789562549051",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 1634.2580635039046, y = 305.09677619815005},
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
          ["17566307024822549330"] = {
            key = "17566307024822549330",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1874.5806411917824, y = 306.70967940410895},
            propsData = {
              ShowEnable = true,
              MessageId = 300801,
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
