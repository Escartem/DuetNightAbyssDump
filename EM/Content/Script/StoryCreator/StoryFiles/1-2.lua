return {
  storyName = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
  storyDescription = "",
  lineData = {
    {
      startStory = "story_16759276611290",
      startPort = "StoryStart",
      endStory = "story_16759276668144",
      endPort = "In"
    },
    {
      startStory = "story_16759276668144",
      startPort = "Success",
      endStory = "story_16759276611292",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    story_16759276611290 = {
      isStoryNode = true,
      key = "story_16759276611290",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 153, y = 170},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_16759276611292 = {
      isStoryNode = true,
      key = "story_16759276611292",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1145, y = 162},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_16759276668144 = {
      isStoryNode = true,
      key = "story_16759276668144",
      type = "StoryNode",
      name = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
      pos = {x = 491, y = 108.59615384615384},
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
            startQuest = "quest_16759276668148",
            startPort = "QuestStart",
            endQuest = "1715916489140364",
            endPort = "In"
          },
          {
            startQuest = "17159165288731749",
            startPort = "Out",
            endQuest = "quest_167592766681410",
            endPort = "Success"
          },
          {
            startQuest = "1715916489140364",
            startPort = "Out",
            endQuest = "17159165288731749",
            endPort = "In"
          }
        },
        nodeData = {
          quest_16759276668148 = {
            key = "quest_16759276668148",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -156.1538461538462, y = 140},
            propsData = {ModeType = 0}
          },
          quest_167592766681410 = {
            key = "quest_167592766681410",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1066.7692307692307, y = 123.15384615384616},
            propsData = {ModeType = 0}
          },
          quest_167592766681412 = {
            key = "quest_167592766681412",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1103.2307692307693, y = 277.9230769230769},
            propsData = {}
          },
          ["1715596373966146387"] = {
            key = "1715596373966146387",
            type = "SetPlayerStatusNode",
            name = "\232\174\190\231\189\174\231\142\169\229\174\182\231\138\182\230\128\129",
            pos = {x = 442.07789003159917, y = -248.36298550284107},
            propsData = {
              HPPercent = -1,
              ESPercent = -1,
              SPPercent = -1,
              BuffList = {
                {
                  Id = 11,
                  LastTime = -1,
                  Value = -1
                }
              },
              RecoverPlayer = false
            }
          },
          ["1715916489140364"] = {
            key = "1715916489140364",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 133.39504048583007, y = 144.29757085020236},
            propsData = {WaitTime = 2}
          },
          ["17159165288731749"] = {
            key = "17159165288731749",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 688.7796558704455, y = 156.98987854251013},
            propsData = {
              ShowEnable = true,
              MessageId = 300302,
              MessageNote = "\231\130\185\229\135\187<H>\226\128\156\230\149\180\229\164\135\226\128\157</>\232\191\155\229\133\165\230\149\180\229\164\135\231\179\187\231\187\159\227\128\130",
              DelayTime = 0.5,
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
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
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
