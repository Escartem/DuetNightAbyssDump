return {
  storyName = "\231\187\147\230\157\159\229\137\167\230\131\133",
  storyDescription = "",
  lineData = {
    {
      startStory = "1704175978725174814",
      startPort = "Success",
      endStory = "1704175978725174813",
      endPort = "StoryEnd"
    },
    {
      startStory = "1704175978725174812",
      startPort = "StoryStart",
      endStory = "1704175978725174815",
      endPort = "In"
    },
    {
      startStory = "1704175978725174815",
      startPort = "Success",
      endStory = "1704175978725174813",
      endPort = "StoryEnd"
    },
    {
      startStory = "1704175978725174812",
      startPort = "StoryStart",
      endStory = "1704175978725174814",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1704175978725174812"] = {
      isStoryNode = true,
      key = "1704175978725174812",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 103, y = 138},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175978725174813"] = {
      isStoryNode = true,
      key = "1704175978725174813",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 721, y = 176},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175978725174814"] = {
      isStoryNode = true,
      key = "1704175978725174814",
      type = "StoryNode",
      name = "\229\188\128\229\156\186\229\137\167\230\131\133",
      pos = {x = 378, y = 130},
      propsData = {
        QuestId = 10100,
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
            startQuest = "1704175978725174816",
            startPort = "QuestStart",
            endQuest = "1704175978725174819",
            endPort = "In"
          },
          {
            startQuest = "1704175978725174819",
            startPort = "Out",
            endQuest = "1704175978725174817",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1704175978725174816"] = {
            key = "1704175978725174816",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100, y = 140},
            propsData = {ModeType = 0}
          },
          ["1704175978725174817"] = {
            key = "1704175978725174817",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1500, y = 140},
            propsData = {ModeType = 0}
          },
          ["1704175978725174818"] = {
            key = "1704175978725174818",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["1704175978725174819"] = {
            key = "1704175978725174819",
            type = "BossBattleOpenNode",
            name = "BOSS\230\136\152\229\188\128\229\156\186\230\146\173\231\137\135",
            pos = {x = 399, y = 129},
            propsData = {
              SequencePath = "LevelSequence'/Game/Asset/Cinematics/SystemShow/HardBoss/HardBoss_Xibi/HardBoss_Xibi_Start.HardBoss_Xibi_Start'",
              EnableFadeIn = true,
              EnableFadeOut = true,
              EnableSkip = false,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true
            }
          }
        },
        commentData = {}
      }
    },
    ["1704175978725174815"] = {
      isStoryNode = true,
      key = "1704175978725174815",
      type = "StoryNode",
      name = "\231\187\147\230\157\159\229\137\167\230\131\133",
      pos = {x = 385, y = 292},
      propsData = {
        QuestId = 10199,
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
            startQuest = "1704175978725174820",
            startPort = "QuestStart",
            endQuest = "1704175978725174821",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1704175978725174820"] = {
            key = "1704175978725174820",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100, y = 140},
            propsData = {ModeType = 0}
          },
          ["1704175978725174821"] = {
            key = "1704175978725174821",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1500, y = 140},
            propsData = {ModeType = 0}
          },
          ["1704175978725174822"] = {
            key = "1704175978725174822",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
