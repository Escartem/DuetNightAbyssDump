return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "174577470576023495854",
      startPort = "StoryStart",
      endStory = "174577470576023495856",
      endPort = "In"
    },
    {
      startStory = "174577470576023495856",
      startPort = "Success",
      endStory = "174577470576023495855",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["174577470576023495854"] = {
      isStoryNode = true,
      key = "174577470576023495854",
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
    ["174577470576023495855"] = {
      isStoryNode = true,
      key = "174577470576023495855",
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
    ["174577470576023495856"] = {
      isStoryNode = true,
      key = "174577470576023495856",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1514, y = 292.42105263157896},
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
            startQuest = "174577470576023495862",
            startPort = "Out",
            endQuest = "174577470576023495863",
            endPort = "In"
          },
          {
            startQuest = "174577470576023495864",
            startPort = "Out",
            endQuest = "174577470576023495858",
            endPort = "Success"
          },
          {
            startQuest = "174577470576023495860",
            startPort = "Out",
            endQuest = "174577470576023495861",
            endPort = "In"
          },
          {
            startQuest = "174577470576023495863",
            startPort = "Out",
            endQuest = "174577470576023495866",
            endPort = "Input"
          },
          {
            startQuest = "174577470576023495866",
            startPort = "PC",
            endQuest = "174577470576023495864",
            endPort = "In"
          },
          {
            startQuest = "174577470576023495866",
            startPort = "Mobile",
            endQuest = "174577470576023495865",
            endPort = "In"
          },
          {
            startQuest = "174577470576023495865",
            startPort = "Out",
            endQuest = "174577470576023495858",
            endPort = "Success"
          },
          {
            startQuest = "174577470576023495867",
            startPort = "Out",
            endQuest = "174577470576023495868",
            endPort = "In"
          },
          {
            startQuest = "174577470576023495868",
            startPort = "Out",
            endQuest = "174577470576023495860",
            endPort = "In"
          },
          {
            startQuest = "174577470576023495870",
            startPort = "Out",
            endQuest = "174577470576023495871",
            endPort = "In"
          },
          {
            startQuest = "174577470576023495871",
            startPort = "Out",
            endQuest = "174577470576023495862",
            endPort = "In"
          },
          {
            startQuest = "174577470576023495857",
            startPort = "QuestStart",
            endQuest = "174577470576023495867",
            endPort = "In"
          },
          {
            startQuest = "174577470576023495861",
            startPort = "Out",
            endQuest = "17579426045504330405",
            endPort = "Input"
          },
          {
            startQuest = "17579426045504330405",
            startPort = "PC",
            endQuest = "174577470576023495869",
            endPort = "In"
          },
          {
            startQuest = "174577470576023495869",
            startPort = "Out",
            endQuest = "174577470576023495870",
            endPort = "In"
          },
          {
            startQuest = "17579426045504330405",
            startPort = "Mobile",
            endQuest = "17579426118704330677",
            endPort = "In"
          },
          {
            startQuest = "17579426118704330677",
            startPort = "Out",
            endQuest = "174577470576023495870",
            endPort = "In"
          }
        },
        nodeData = {
          ["174577470576023495857"] = {
            key = "174577470576023495857",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["174577470576023495858"] = {
            key = "174577470576023495858",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2212.777777777778, y = 507.2222222222223},
            propsData = {ModeType = 0}
          },
          ["174577470576023495859"] = {
            key = "174577470576023495859",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2221.6666666666665, y = 781.6666666666666},
            propsData = {}
          },
          ["174577470576023495860"] = {
            key = "174577470576023495860",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1183.2619557601265, y = 302.40023252285044},
            propsData = {
              MessageId = 301701,
              MessageNote = "\228\191\174\229\164\141\230\143\144\231\129\175\239\188\140\229\143\175\228\187\165\229\162\158\229\188\186\229\156\168\232\191\183\230\180\165\228\184\173\230\136\152\230\150\151\232\131\189\229\138\155\227\128\130",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["174577470576023495861"] = {
            key = "174577470576023495861",
            type = "ShowGuideButtonNode",
            name = "\230\143\144\231\129\175\229\133\165\229\143\163",
            pos = {x = 1468.5655572534724, y = 302.02478253630983},
            propsData = {
              ShowEnable = true,
              MessageId = 301702,
              MessageNote = "\231\130\185\229\135\187\226\128\156\230\163\128\232\167\134\230\143\144\231\129\175\226\128\157",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.Group_Root:Rouge.Entrance_TalentTree",
              UICompName = "Btn_ForClick",
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
          ["174577470576023495862"] = {
            key = "174577470576023495862",
            type = "ShowGuideButtonNode",
            name = "\230\143\144\231\129\175\232\138\130\231\130\185",
            pos = {x = 866.7760559357794, y = 513.5097486298768},
            propsData = {
              ShowEnable = true,
              MessageId = 301703,
              MessageNote = "\231\130\185\229\135\187\230\143\144\231\129\175\228\184\173\231\154\132\232\138\130\231\130\185\239\188\140\229\143\175\228\187\165\230\159\165\231\156\139\232\138\130\231\130\185\229\184\166\230\157\165\231\154\132\229\177\158\230\128\167\229\162\158\229\188\186\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.Group_Root:TalentMenu.RetainerBox:1:EMScrollBox:TalentTree.Main:24",
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
          ["174577470576023495863"] = {
            key = "174577470576023495863",
            type = "ShowGuideButtonNode",
            name = "\231\130\185\228\186\174\230\143\144\231\129\175",
            pos = {x = 1201.8286875147273, y = 516.3159687255707},
            propsData = {
              ShowEnable = true,
              MessageId = 301704,
              MessageNote = "\230\182\136\232\128\151\228\184\128\229\174\154\230\149\176\233\135\143\231\154\132\231\144\137\231\146\131\239\188\140\229\141\179\229\143\175\231\130\185\228\186\174\232\175\165\230\143\144\231\129\175\232\138\130\231\130\185\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.Group_Root:TalentMenu.Btn_Active",
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
          ["174577470576023495864"] = {
            key = "174577470576023495864",
            type = "ShowGuideButtonNode",
            name = "\229\136\135\230\141\162\233\161\181\231\173\190",
            pos = {x = 1627.481907016244, y = 510.50310322849464},
            propsData = {
              ShowEnable = true,
              MessageId = 301705,
              MessageNote = "\232\191\153\233\135\140\229\143\175\228\187\165\229\136\135\230\141\162\228\184\141\229\144\140\231\154\132\230\143\144\231\129\175\232\181\144\231\166\143\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.ComTab.EMScrollBox_TabItem:2",
              UICompName = "Btn",
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
              MessageLoc = "Down",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["174577470576023495865"] = {
            key = "174577470576023495865",
            type = "ShowGuideButtonNode",
            name = "\229\136\135\230\141\162\233\161\181\231\173\190",
            pos = {x = 1637.7731092436975, y = 752.0874595992241},
            propsData = {
              ShowEnable = true,
              MessageId = 301705,
              MessageNote = "\232\191\153\233\135\140\229\143\175\228\187\165\229\136\135\230\141\162\228\184\141\229\144\140\231\154\132\230\143\144\231\129\175\232\181\144\231\166\143\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.ComTab.EMScrollBox_TabItem:2",
              UICompName = "Btn",
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
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["174577470576023495866"] = {
            key = "174577470576023495866",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 1347.9495798319326, y = 682.9109890109888},
            propsData = {}
          },
          ["174577470576023495867"] = {
            key = "174577470576023495867",
            type = "ShowGuideButtonNode",
            name = "\229\165\150\229\138\177",
            pos = {x = 1193.909090909091, y = 126.00000000000011},
            propsData = {
              ShowEnable = true,
              MessageId = 301606,
              MessageNote = "\232\191\153\233\135\140\229\143\175\228\187\165\230\159\165\231\156\139\229\185\182\233\162\134\229\143\150\232\191\183\230\180\165\229\165\150\229\138\177\239\188\140\229\165\150\229\138\177\230\175\143\229\145\168\229\136\183\230\150\176\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.Group_Root:Rouge.RewardInfo",
              UICompName = "Btn_Reward",
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
          ["174577470576023495868"] = {
            key = "174577470576023495868",
            type = "ShowGuideButtonNode",
            name = "\230\143\144\231\129\175\229\133\165\229\143\163",
            pos = {x = 1505.9886363636363, y = 130.41626794258372},
            propsData = {
              ShowEnable = true,
              MessageId = 301706,
              MessageNote = "\230\173\164\229\164\132\229\143\175\230\159\165\231\156\139\232\167\163\233\148\129\231\154\132\229\155\190\233\137\180\230\137\139\232\174\176\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.Group_Root:Rouge.Entrance_Illustration",
              UICompName = "Btn_ForClick",
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
          ["174577470576023495869"] = {
            key = "174577470576023495869",
            type = "ShowGuideButtonNode",
            name = "\231\144\137\231\146\131\230\149\176\233\135\143",
            pos = {x = 2043.9583293166334, y = 59.03748373020211},
            propsData = {
              ShowEnable = true,
              MessageId = 301707,
              MessageNote = "\230\152\190\231\164\186\231\144\137\231\146\131\230\149\176\233\135\143",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.Panel_ResourceBar:1",
              UICompName = "Btn_Item",
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
          ["174577470576023495870"] = {
            key = "174577470576023495870",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 2321.7007536057636, y = 304.5980860543432},
            propsData = {
              MessageId = 301708,
              MessageNote = "\230\182\136\232\128\151\231\144\137\231\146\131\228\191\174\229\164\141\231\129\175\231\154\132\228\184\141\229\144\140\233\131\168\228\189\141\239\188\140\229\176\134\232\142\183\229\190\151\228\184\141\229\144\140\231\154\132\232\181\144\231\166\143\239\188\140\229\190\151\229\136\176\229\164\154\231\187\180\231\154\132\229\188\186\229\140\150\227\128\130",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["174577470576023495871"] = {
            key = "174577470576023495871",
            type = "ShowGuideButtonNode",
            name = "\230\138\128\232\131\189\229\188\186\229\140\150",
            pos = {x = 2587.2007536057636, y = 310.5980860543433},
            propsData = {
              ShowEnable = true,
              MessageId = 301709,
              MessageNote = "\231\130\185\229\135\187\226\128\156\230\138\128\232\131\189\229\188\186\229\140\150\226\128\157\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.Group_Root:TalentPage.Entrance_01",
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
          ["17471431495562286293"] = {
            key = "17471431495562286293",
            type = "ShowGuideButtonNode",
            name = "\229\165\150\229\138\177",
            pos = {x = 1469.8953349282297, y = -252.39065578384492},
            propsData = {
              ShowEnable = true,
              MessageId = 301606,
              MessageNote = "\232\191\153\233\135\140\229\143\175\228\187\165\230\159\165\231\156\139\229\185\182\233\162\134\229\143\150\232\191\183\230\180\165\229\165\150\229\138\177\239\188\140\229\165\150\229\138\177\230\175\143\229\145\168\229\136\183\230\150\176\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "GetItemPage",
              UICompName = "Button_Close",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["174722338964611217"] = {
            key = "174722338964611217",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 1185.6153846153845, y = -47.3076923076923},
            propsData = {
              SendMessage = "",
              FinishCondition = "FirstTimeRougeLikeRewardClose"
            }
          },
          ["17579426045504330405"] = {
            key = "17579426045504330405",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 1777.2457883179568, y = 265.4278431434677},
            propsData = {}
          },
          ["17579426118704330677"] = {
            key = "17579426118704330677",
            type = "ShowGuideButtonNode",
            name = "\231\144\137\231\146\131\230\149\176\233\135\143",
            pos = {x = 2056.0336612676087, y = 285.12481022491187},
            propsData = {
              ShowEnable = true,
              MessageId = 301707,
              MessageNote = "\230\152\190\231\164\186\231\144\137\231\146\131\230\149\176\233\135\143",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "StyleOfPlay.ComTab.Panel_ResourceBar:1",
              UICompName = "Btn_Item",
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
