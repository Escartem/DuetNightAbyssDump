return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "172378365239726217",
      startPort = "StoryStart",
      endStory = "172378365337726268",
      endPort = "In"
    },
    {
      startStory = "172378365337726268",
      startPort = "Success",
      endStory = "172378365239726220",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["172378365239726217"] = {
      isStoryNode = true,
      key = "172378365239726217",
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
    ["172378365239726220"] = {
      isStoryNode = true,
      key = "172378365239726220",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1699.0000000000014, y = 323.99999999999994},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["172378365337726268"] = {
      isStoryNode = true,
      key = "172378365337726268",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1229.9036763165018, y = 300.20199130757413},
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
            startQuest = "172378365337726275",
            startPort = "Out",
            endQuest = "172378365337726276",
            endPort = "In"
          },
          {
            startQuest = "172378365337726272",
            startPort = "QuestStart",
            endQuest = "172378365337726275",
            endPort = "In"
          },
          {
            startQuest = "172378365337726278",
            startPort = "Out",
            endQuest = "172378365337726273",
            endPort = "Success"
          },
          {
            startQuest = "172378365337726276",
            startPort = "Out",
            endQuest = "172378365337726278",
            endPort = "In"
          }
        },
        nodeData = {
          ["172378365337726272"] = {
            key = "172378365337726272",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["172378365337726273"] = {
            key = "172378365337726273",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2138.734615384616, y = 287.9769230769231},
            propsData = {ModeType = 0}
          },
          ["172378365337726274"] = {
            key = "172378365337726274",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["172378365337726275"] = {
            key = "172378365337726275",
            type = "ShowGuideTextNode",
            name = "Text\230\152\190\231\164\186\228\191\161\230\129\175",
            pos = {x = 1103.8795455189843, y = 285.5064979669668},
            propsData = {
              MessageId = 302001,
              MessageNote = "\230\180\187\229\138\168\229\183\178\232\167\163\233\148\129\239\188\140\229\143\130\228\184\142\229\144\132\231\167\141\229\144\132\230\160\183\231\154\132\230\180\187\229\138\168\239\188\140\229\143\175\228\187\165\232\142\183\229\190\151\228\184\176\229\175\140\231\154\132\229\165\150\229\138\177\229\147\166\239\188\129",
              IsTimePause = false,
              IsResetPlayer = false,
              IsForbidInAnim = false,
              IsForbidOutAnim = true,
              GuideManPosEnum = "DownLeft",
              GuidemanHead = "Bai_Idle"
            }
          },
          ["172378365337726276"] = {
            key = "172378365337726276",
            type = "ShowGuideButtonNode",
            name = "\229\140\186\229\159\159\229\143\179\228\184\138\232\167\146UI",
            pos = {x = 1395.1670913065298, y = 278.39660785707673},
            propsData = {
              ShowEnable = true,
              MessageId = 302002,
              MessageNote = "\231\130\185\229\135\187<Highlight>\226\128\156\230\180\187\229\138\168\226\128\157</>\232\191\155\229\133\165\230\180\187\229\138\168\231\149\140\233\157\162\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = true,
              IsShowCursor = false,
              HighLightUIPath = "BattleMain.ListView:18",
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
              MessageLoc = "Down",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["172378365337726278"] = {
            key = "172378365337726278",
            type = "ShowGuideButtonNode",
            name = "\233\162\134\229\143\150\230\140\137\233\146\174",
            pos = {x = 1739.5590326984716, y = 281.3835687222983},
            propsData = {
              ShowEnable = true,
              MessageId = 302003,
              MessageNote = "\231\130\185\229\135\187\226\128\156\229\133\168\233\131\168\233\162\134\229\143\150\226\128\157\239\188\140\233\162\134\229\143\150\230\180\187\229\138\168\229\165\150\229\138\177\227\128\130",
              DelayTime = 0,
              IsForceClick = true,
              IsControlPlayer = false,
              IsTimePause = false,
              IsShowCursor = true,
              HighLightUIPath = "ActivityMain.Group_Anchor:1.Btn_GetAllBtn",
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
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
