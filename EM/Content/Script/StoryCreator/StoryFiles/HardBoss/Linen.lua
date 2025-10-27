return {
  storyName = "\231\187\147\230\157\159\229\137\167\230\131\133",
  storyDescription = "",
  lineData = {
    {
      startStory = "1704175978719174741",
      startPort = "Success",
      endStory = "1704175978719174740",
      endPort = "StoryEnd"
    },
    {
      startStory = "1704175978719174739",
      startPort = "StoryStart",
      endStory = "1704175978719174742",
      endPort = "In"
    },
    {
      startStory = "1704175978719174742",
      startPort = "Success",
      endStory = "1704175978719174740",
      endPort = "StoryEnd"
    },
    {
      startStory = "1704175978719174739",
      startPort = "StoryStart",
      endStory = "1704175978719174741",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1704175978719174739"] = {
      isStoryNode = true,
      key = "1704175978719174739",
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
    ["1704175978719174740"] = {
      isStoryNode = true,
      key = "1704175978719174740",
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
    ["1704175978719174741"] = {
      isStoryNode = true,
      key = "1704175978719174741",
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
            startQuest = "1704175978719174743",
            startPort = "QuestStart",
            endQuest = "1704175978719174746",
            endPort = "In"
          },
          {
            startQuest = "1704175978719174746",
            startPort = "Out",
            endQuest = "1704175978719174744",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1704175978719174743"] = {
            key = "1704175978719174743",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100, y = 140},
            propsData = {ModeType = 0}
          },
          ["1704175978719174744"] = {
            key = "1704175978719174744",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1500, y = 140},
            propsData = {ModeType = 0}
          },
          ["1704175978719174745"] = {
            key = "1704175978719174745",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["1704175978719174746"] = {
            key = "1704175978719174746",
            type = "BossBattleOpenNode",
            name = "BOSS\230\136\152\229\188\128\229\156\186\230\146\173\231\137\135",
            pos = {x = 582.2307692307692, y = 145.26923076923077},
            propsData = {
              SequencePath = "LevelSequence'/Game/Asset/Cinematics/SystemShow/HardBoss/HardBoss_Linen/HardBoss_Linen_Start.HardBoss_Linen_Start'",
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
    ["1704175978719174742"] = {
      isStoryNode = true,
      key = "1704175978719174742",
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
            startQuest = "1704175978719174747",
            startPort = "QuestStart",
            endQuest = "1704175978719174748",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1704175978719174747"] = {
            key = "1704175978719174747",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100, y = 140},
            propsData = {ModeType = 0}
          },
          ["1704175978719174748"] = {
            key = "1704175978719174748",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1500, y = 140},
            propsData = {ModeType = 0}
          },
          ["1704175978719174749"] = {
            key = "1704175978719174749",
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
