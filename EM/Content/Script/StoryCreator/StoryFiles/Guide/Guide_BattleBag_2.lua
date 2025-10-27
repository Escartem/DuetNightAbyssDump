return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "170383325404992495",
      startPort = "StoryStart",
      endStory = "170383325692792549",
      endPort = "In"
    },
    {
      startStory = "170383325692792549",
      startPort = "Success",
      endStory = "170383325404992498",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["170383325404992495"] = {
      isStoryNode = true,
      key = "170383325404992495",
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
    ["170383325404992498"] = {
      isStoryNode = true,
      key = "170383325404992498",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1831.1764705882351, y = 312.3529411764706},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["170383325692792549"] = {
      isStoryNode = true,
      key = "170383325692792549",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1302.7320551772905, y = 327.5347996935087},
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
            startQuest = "170383325692792550",
            startPort = "QuestStart",
            endQuest = "17096410470221061",
            endPort = "In"
          },
          {
            startQuest = "17096410470221061",
            startPort = "Out",
            endQuest = "170383325692792552",
            endPort = "Success"
          },
          {
            startQuest = "170383325692792550",
            startPort = "QuestStart",
            endQuest = "170383327627592844",
            endPort = "In"
          }
        },
        nodeData = {
          ["170383325692792550"] = {
            key = "170383325692792550",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["170383325692792552"] = {
            key = "170383325692792552",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1892.9411764705883, y = 347.6470588235294},
            propsData = {ModeType = 0}
          },
          ["170383325692792554"] = {
            key = "170383325692792554",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1887.6470588235293, y = 881.7647058823529},
            propsData = {}
          },
          ["170383327627592844"] = {
            key = "170383327627592844",
            type = "ShowGuideToastButtonNode",
            name = "ToastButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1335.8938198831725, y = 462.067605123373},
            propsData = {
              ShowEnable = true,
              MessageId = 300613,
              MessageNote = "\230\137\147\229\188\128\230\136\152\230\150\151\232\131\140\229\140\133",
              LastTime = 5,
              DelayTime = 0.5,
              HighLightUIPath = "BattleMain.Char_Skill.Battle_Menu",
              UICompName = "Bg",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "UpLeft",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17096410470221061"] = {
            key = "17096410470221061",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1351.5380844645551, y = 304.3453996983409},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
