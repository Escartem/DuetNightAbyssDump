return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17459127918652954",
      startPort = "StoryStart",
      endStory = "17459127978003251",
      endPort = "In"
    },
    {
      startStory = "17459127978003251",
      startPort = "Success",
      endStory = "17459127918652957",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17459127918652954"] = {
      isStoryNode = true,
      key = "17459127918652954",
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
    ["17459127918652957"] = {
      isStoryNode = true,
      key = "17459127918652957",
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
    ["17459127978003251"] = {
      isStoryNode = true,
      key = "17459127978003251",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1768.607843137255, y = 311.66666666666674},
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
            startQuest = "17459127978013252",
            startPort = "QuestStart",
            endQuest = "17459128166114049",
            endPort = "In"
          },
          {
            startQuest = "17459128166114049",
            startPort = "Out",
            endQuest = "17459127978013255",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17459127978013252"] = {
            key = "17459127978013252",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17459127978013255"] = {
            key = "17459127978013255",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17459127978013258"] = {
            key = "17459127978013258",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17459128166114049"] = {
            key = "17459128166114049",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1764, y = 308.8235294117647},
            propsData = {
              ShowEnable = true,
              MessageId = 310101,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = false,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "BattleMain.Pos_TaskBar:1",
              UICompName = "Button_Area",
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
              MessageLoc = "DownLeft",
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
