return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17225824868381",
      startPort = "StoryStart",
      endStory = "1722582502754774",
      endPort = "In"
    },
    {
      startStory = "1722582502754774",
      startPort = "Success",
      endStory = "17225824868385",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17225824868381"] = {
      isStoryNode = true,
      key = "17225824868381",
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
    ["17225824868385"] = {
      isStoryNode = true,
      key = "17225824868385",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1707.076923076923, y = 294.46153846153845},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1722582502754774"] = {
      isStoryNode = true,
      key = "1722582502754774",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1224.923076923077, y = 296.72296124927686},
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
            startQuest = "17225825300743005",
            startPort = "Out",
            endQuest = "17225825306893058",
            endPort = "In"
          },
          {
            startQuest = "1722582502754775",
            startPort = "QuestStart",
            endQuest = "17225825300743005",
            endPort = "In"
          },
          {
            startQuest = "17225825306893058",
            startPort = "Out",
            endQuest = "17228505044121250",
            endPort = "In"
          },
          {
            startQuest = "17228505044121250",
            startPort = "Out",
            endQuest = "172355488017910909",
            endPort = "In"
          },
          {
            startQuest = "172355488017910909",
            startPort = "Out",
            endQuest = "1722582502755781",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1722582502754775"] = {
            key = "1722582502754775",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 904.8421052631579, y = 288.63157894736844},
            propsData = {ModeType = 0}
          },
          ["1722582502755781"] = {
            key = "1722582502755781",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2462.210526315789, y = 319.5526315789474},
            propsData = {ModeType = 0}
          },
          ["1722582502755787"] = {
            key = "1722582502755787",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2361.684210526316, y = -247.3684210526319},
            propsData = {}
          },
          ["17225825300743005"] = {
            key = "17225825300743005",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1152.5224985540776, y = 436.74994216309983},
            propsData = {
              ShowEnable = true,
              MessageId = 203002,
              MessageNote = "\233\128\137\230\139\169\231\189\144\231\189\144",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "PetCapture.Snack_Blue",
              UICompName = "Item_Snacks",
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
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17225825306893058"] = {
            key = "17225825306893058",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1353.364603817235, y = 171.4604684788893},
            propsData = {
              ShowEnable = true,
              MessageId = 203003,
              MessageNote = "\230\141\149\232\142\183\230\157\161",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "PetCapture",
              UICompName = "Color_Bar",
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
          ["17228505044121250"] = {
            key = "17228505044121250",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1583.5, y = 462},
            propsData = {
              ShowEnable = true,
              MessageId = 203004,
              MessageNote = "\231\130\185\229\135\187\230\141\149\232\142\183",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "PetCapture.Btn_Confirm",
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
          ["172355488017910909"] = {
            key = "172355488017910909",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1826.9999999999995, y = 163.99999999999983},
            propsData = {
              ShowEnable = true,
              MessageId = 203005,
              MessageNote = "\230\138\149\229\135\186\231\189\144\231\189\144",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "PetCapture",
              UICompName = "Panel_Tip",
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
