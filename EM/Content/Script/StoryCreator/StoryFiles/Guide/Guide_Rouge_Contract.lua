return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1722052100800867",
      startPort = "StoryStart",
      endStory = "1722052102897914",
      endPort = "In"
    },
    {
      startStory = "1722052102897914",
      startPort = "Success",
      endStory = "1722052100800870",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1722052100800867"] = {
      isStoryNode = true,
      key = "1722052100800867",
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
    ["1722052100800870"] = {
      isStoryNode = true,
      key = "1722052100800870",
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
    ["1722052102897914"] = {
      isStoryNode = true,
      key = "1722052102897914",
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
            startQuest = "1722052102897915",
            startPort = "QuestStart",
            endQuest = "1745766695822609",
            endPort = "In"
          },
          {
            startQuest = "1745766695822609",
            startPort = "Out",
            endQuest = "174577526471023698322",
            endPort = "In"
          },
          {
            startQuest = "174577526471023698322",
            startPort = "Out",
            endQuest = "174577538009223699275",
            endPort = "In"
          },
          {
            startQuest = "174577538009223699275",
            startPort = "Out",
            endQuest = "174577542364723699981",
            endPort = "In"
          },
          {
            startQuest = "174577547609223700784",
            startPort = "Out",
            endQuest = "1722052102897918",
            endPort = "Success"
          },
          {
            startQuest = "174577542364723699981",
            startPort = "Out",
            endQuest = "174577546700823700522",
            endPort = "In"
          },
          {
            startQuest = "174577546700823700522",
            startPort = "Out",
            endQuest = "174577547609223700784",
            endPort = "In"
          }
        },
        nodeData = {
          ["1722052102897915"] = {
            key = "1722052102897915",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1722052102897918"] = {
            key = "1722052102897918",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2212.777777777778, y = 507.2222222222223},
            propsData = {ModeType = 0}
          },
          ["1722052102897921"] = {
            key = "1722052102897921",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2221.6666666666665, y = 781.6666666666666},
            propsData = {}
          },
          ["1745766695822609"] = {
            key = "1745766695822609",
            type = "ShowGuideButtonNode",
            name = "\230\183\177\229\186\166",
            pos = {x = 1160, y = 208.0000000000001},
            propsData = {
              ShowEnable = true,
              MessageId = 302201,
              MessageNote = "\230\175\143\228\184\170\229\165\145\231\186\166\232\175\141\230\157\161\230\175\143\228\184\170\231\173\137\231\186\167\228\188\154\230\143\144\228\190\155\228\184\128\229\174\154\231\154\132\230\183\177\229\186\166\229\128\188\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "RougeLikeContractPanel.List_Heat:1",
              UICompName = "Text_HeatNum",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 40, Y = 0},
              UICompLocOffset = {X = -10, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Right",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["174577526471023698322"] = {
            key = "174577526471023698322",
            type = "ShowGuideButtonNode",
            name = "\231\173\137\231\186\167",
            pos = {x = 1508, y = 207.99999999999994},
            propsData = {
              ShowEnable = true,
              MessageId = 302202,
              MessageNote = "\233\131\168\229\136\134\229\165\145\231\186\166\232\175\141\230\157\161\230\156\137\228\184\141\229\144\140\231\154\132\231\173\137\231\186\167\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "RougeLikeContractPanel.List_Heat:1",
              UICompName = "Text_Level",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 150, Y = 0},
              UICompLocOffset = {X = -16, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Left",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["174577538009223699275"] = {
            key = "174577538009223699275",
            type = "ShowGuideButtonNode",
            name = "\230\128\187\230\183\177\229\186\166",
            pos = {x = 1837.8181818181815, y = 205.63636363636363},
            propsData = {
              ShowEnable = true,
              MessageId = 302203,
              MessageNote = "\230\128\187\230\183\177\229\186\166\229\128\188\228\188\154\229\189\177\229\147\141\230\156\128\231\187\136\231\187\147\231\174\151\231\154\132\232\161\140\232\191\185\229\138\160\230\136\144\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "RougeLikeContractPanel",
              UICompName = "Text_Heat",
              GamePadWidgetName = "",
              IsAutoClick = false,
              IsAutoClickByGamepad = false,
              UIShape = "Square",
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              UICompSizeOffset = {X = 30, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Left",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["174577542364723699981"] = {
            key = "174577542364723699981",
            type = "ShowGuideButtonNode",
            name = "\231\161\174\229\174\154",
            pos = {x = 1161.5, y = 398.0454545454544},
            propsData = {
              ShowEnable = true,
              MessageId = 302204,
              MessageNote = "\231\130\185\229\135\187\226\128\156\231\161\174\229\174\154\226\128\157\229\144\142\229\143\175\228\191\157\229\173\152\229\165\145\231\186\166\233\133\141\231\189\174\227\128\130",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "RougeLikeContractPanel",
              UICompName = "Btn_Confirm",
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
          ["174577546700823700522"] = {
            key = "174577546700823700522",
            type = "ShowGuideButtonNode",
            name = "\233\135\141\231\189\174",
            pos = {x = 1461.5, y = 403.49999999999994},
            propsData = {
              ShowEnable = true,
              MessageId = 302205,
              MessageNote = "\233\135\141\231\189\174",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "RougeLikeContractPanel",
              UICompName = "Btn_Reset",
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
          ["174577547609223700784"] = {
            key = "174577547609223700784",
            type = "ShowGuideButtonNode",
            name = "\229\184\174\229\138\169",
            pos = {x = 1795.5909090909088, y = 406.22727272727263},
            propsData = {
              ShowEnable = true,
              MessageId = 302206,
              MessageNote = "\229\184\174\229\138\169",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "RougeLikeContractPanel.Btn_Qa",
              UICompName = "Btn_Click",
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
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
