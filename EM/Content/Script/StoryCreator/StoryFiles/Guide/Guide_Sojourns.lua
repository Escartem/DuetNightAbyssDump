return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1745407061340134",
      startPort = "StoryStart",
      endStory = "1745407069013431",
      endPort = "In"
    },
    {
      startStory = "1745407069013431",
      startPort = "Success",
      endStory = "1745407061340137",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1745407061340134"] = {
      isStoryNode = true,
      key = "1745407061340134",
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
    ["1745407061340137"] = {
      isStoryNode = true,
      key = "1745407061340137",
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
    ["1745407069013431"] = {
      isStoryNode = true,
      key = "1745407069013431",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1642, y = 322},
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
            startQuest = "1745407069013432",
            startPort = "QuestStart",
            endQuest = "1745407165451551512",
            endPort = "In"
          },
          {
            startQuest = "1745407165451551512",
            startPort = "Out",
            endQuest = "1745407168620551720",
            endPort = "In"
          },
          {
            startQuest = "1745407169472551775",
            startPort = "Out",
            endQuest = "1745407182420552055",
            endPort = "In"
          },
          {
            startQuest = "1745407182420552055",
            startPort = "Out",
            endQuest = "1745407186756552276",
            endPort = "In"
          },
          {
            startQuest = "1745407186756552276",
            startPort = "Out",
            endQuest = "1745407218236552599",
            endPort = "In"
          },
          {
            startQuest = "1745407218932552654",
            startPort = "Out",
            endQuest = "1745407069013439",
            endPort = "Success"
          },
          {
            startQuest = "1745407218236552599",
            startPort = "Out",
            endQuest = "17471212434073569",
            endPort = "In"
          },
          {
            startQuest = "17471212434073569",
            startPort = "Out",
            endQuest = "1745407218932552654",
            endPort = "In"
          },
          {
            startQuest = "1745407168620551720",
            startPort = "Out",
            endQuest = "17471431680571718421",
            endPort = "In"
          },
          {
            startQuest = "17471431680571718421",
            startPort = "Out",
            endQuest = "1745407169472551775",
            endPort = "In"
          }
        },
        nodeData = {
          ["1745407069013432"] = {
            key = "1745407069013432",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1745407069013439"] = {
            key = "1745407069013439",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1745407069013446"] = {
            key = "1745407069013446",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1745407165451551512"] = {
            key = "1745407165451551512",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1226.7058823529412, y = 292.00653594771245},
            propsData = {
              ShowEnable = true,
              MessageId = 330001,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "BattleMain.Pos_Entry:1.List_Entry:21",
              UICompName = "Btn_top",
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
              MessageLoc = "DownLeft",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["1745407168620551720"] = {
            key = "1745407168620551720",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1610.5882352941176, y = 293.35947712418306},
            propsData = {
              ShowEnable = true,
              MessageId = 330002,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "Entertainment.EMListView_Role:1",
              UICompName = "Img_Avatar",
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
          ["1745407169472551775"] = {
            key = "1745407169472551775",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2006.9346405228757, y = 291.47058823529414},
            propsData = {
              ShowEnable = true,
              MessageId = 330003,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "Entertainment.Btn02",
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
          ["1745407182420552055"] = {
            key = "1745407182420552055",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 2402.9411764705883, y = 292.7058823529412},
            propsData = {
              MessageId = 330004,
              MessageNote = "",
              IsTimePause = true,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["1745407186756552276"] = {
            key = "1745407186756552276",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1234.8235294117646, y = 497.1764705882353},
            propsData = {
              ShowEnable = true,
              MessageId = 330005,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "Entertainment.TopicDetail",
              UICompName = "List_Material",
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
          ["1745407218236552599"] = {
            key = "1745407218236552599",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1611.6470588235293, y = 498.2352941176471},
            propsData = {
              ShowEnable = true,
              MessageId = 330006,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "Entertainment.TopicDetail",
              UICompName = "Btn_Unlock",
              GamePadWidgetName = "Key_Controller_Unlock",
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
          ["1745407218932552654"] = {
            key = "1745407218932552654",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 2408.073529411765, y = 494.5147058823529},
            propsData = {
              ShowEnable = true,
              MessageId = 330007,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "Entertainment.TopicDetail",
              UICompName = "Btn_Unlock",
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
          ["17471212434073569"] = {
            key = "17471212434073569",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2001.25, y = 495.25},
            propsData = {WaitTime = 0.2}
          },
          ["17471431680571718421"] = {
            key = "17471431680571718421",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1812.692570501394, y = 92.98897834191945},
            propsData = {WaitTime = 0.2}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
