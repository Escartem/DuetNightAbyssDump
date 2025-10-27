return {
  storyName = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
  storyDescription = "",
  lineData = {
    {
      startStory = "story_16926026652060",
      startPort = "StoryStart",
      endStory = "story_16926026720634",
      endPort = "In"
    },
    {
      startStory = "story_16926026720634",
      startPort = "Success",
      endStory = "story_16926026652082",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    story_16926026652060 = {
      isStoryNode = true,
      key = "story_16926026652060",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 100, y = 140},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_16926026652082 = {
      isStoryNode = true,
      key = "story_16926026652082",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 755, y = 178},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_16926026720634 = {
      isStoryNode = true,
      key = "story_16926026720634",
      type = "StoryNode",
      name = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
      pos = {x = 433.81302176067584, y = 225.78185872078848},
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
        bIsNotifyGameMode = false,
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
            startQuest = "quest_16926026720648",
            startPort = "QuestStart",
            endQuest = "16953739854361011",
            endPort = "In"
          },
          {
            startQuest = "16953739854361011",
            startPort = "Out",
            endQuest = "quest_169260267206410",
            endPort = "Success"
          }
        },
        nodeData = {
          quest_16926026720648 = {
            key = "quest_16926026720648",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100, y = 140},
            propsData = {ModeType = 0}
          },
          quest_169260267206410 = {
            key = "quest_169260267206410",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1500, y = 140},
            propsData = {ModeType = 0}
          },
          quest_169260267206412 = {
            key = "quest_169260267206412",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["16953739854361011"] = {
            key = "16953739854361011",
            type = "ShowGuideButtonNode",
            name = "Button\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 730.4832360621837, y = 584.2610722610724},
            propsData = {
              ShowEnable = true,
              MessageId = 200008,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = true,
              HighLightUIPath = "HomeBaseMain.Battle_Map_PC",
              UICompName = "Btn_Open",
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
