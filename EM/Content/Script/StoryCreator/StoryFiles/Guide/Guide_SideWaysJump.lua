return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17448934153641967579",
      startPort = "StoryStart",
      endStory = "17448934153641967581",
      endPort = "In"
    },
    {
      startStory = "17448934153641967581",
      startPort = "Success",
      endStory = "17448934153641967580",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17448934153641967579"] = {
      isStoryNode = true,
      key = "17448934153641967579",
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
    ["17448934153641967580"] = {
      isStoryNode = true,
      key = "17448934153641967580",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1611.25, y = 301.875},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17448934153641967581"] = {
      isStoryNode = true,
      key = "17448934153641967581",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1194, y = 312},
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
            startQuest = "17448934153641967585",
            startPort = "Out",
            endQuest = "17448934153641967586",
            endPort = "In"
          },
          {
            startQuest = "1744890217797545821",
            startPort = "Out",
            endQuest = "17448934153641967583",
            endPort = "Success"
          },
          {
            startQuest = "17448934153641967582",
            startPort = "QuestStart",
            endQuest = "1744890217797545821",
            endPort = "In"
          }
        },
        nodeData = {
          ["1744890217797545821"] = {
            key = "1744890217797545821",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 1367.3001307942436, y = 173.67423127181476},
            propsData = {GuideId = 70}
          },
          ["17448934153641967582"] = {
            key = "17448934153641967582",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17448934153641967583"] = {
            key = "17448934153641967583",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1799.3808857808858, y = 290.68717948717944},
            propsData = {ModeType = 0}
          },
          ["17448934153641967584"] = {
            key = "17448934153641967584",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17448934153641967585"] = {
            key = "17448934153641967585",
            type = "ShowGuideButtonNode",
            name = "\231\130\185\229\135\187\230\159\165\233\152\133\232\175\141\230\157\161",
            pos = {x = 1187.3807476836887, y = 449.5690045248869},
            propsData = {
              ShowEnable = true,
              MessageId = 300402,
              MessageNote = "",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = false,
              HighLightUIPath = "BattleMain.ListView:9",
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
              MessageLoc = "DownLeft",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17448934153641967586"] = {
            key = "17448934153641967586",
            type = "ShowGuideTextNode",
            name = "\229\145\138\231\159\165\231\142\169\229\174\182\229\143\175\228\187\165\230\159\165\233\152\133\232\175\141\230\157\161Tips",
            pos = {x = 1502.3750849455653, y = 418.4499490705376},
            propsData = {
              MessageId = 300403,
              MessageNote = "\229\156\168\232\191\153\233\135\140\229\143\175\228\187\165\230\159\165\233\152\133\229\136\176\230\149\133\228\186\139\229\143\176\232\175\141\228\184\173\231\154\132\228\184\128\228\186\155\231\165\158\231\167\152\231\154\132\232\175\141\232\175\173\232\167\163\233\135\138\227\128\130\227\128\144\229\190\133\229\140\133\232\163\133\227\128\145",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = true,
              IsForbidOutAnim = true,
              GuideManPosEnum = "Middle",
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
