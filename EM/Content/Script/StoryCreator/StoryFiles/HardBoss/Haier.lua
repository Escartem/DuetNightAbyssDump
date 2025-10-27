return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1736148733987948253",
      startPort = "StoryStart",
      endStory = "1736148734646948274",
      endPort = "In"
    },
    {
      startStory = "1736148733987948253",
      startPort = "StoryStart",
      endStory = "1736148734646948275",
      endPort = "In"
    },
    {
      startStory = "1736148734646948274",
      startPort = "Success",
      endStory = "1736148733988948256",
      endPort = "StoryEnd"
    },
    {
      startStory = "1736148734646948275",
      startPort = "Success",
      endStory = "1736148733988948256",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1736148733987948253"] = {
      isStoryNode = true,
      key = "1736148733987948253",
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
    ["1736148733988948256"] = {
      isStoryNode = true,
      key = "1736148733988948256",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1918.9473684210525, y = 331.57894736842104},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1736148734646948274"] = {
      isStoryNode = true,
      key = "1736148734646948274",
      type = "StoryNode",
      name = "\229\188\128\229\156\186\229\137\167\230\131\133",
      pos = {x = 1298.5, y = 307},
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
            startQuest = "1736148734646948284",
            startPort = "QuestStart",
            endQuest = "1736148734646948287",
            endPort = "In"
          },
          {
            startQuest = "1736148734646948287",
            startPort = "Out",
            endQuest = "1736148734646948285",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1736148734646948284"] = {
            key = "1736148734646948284",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100, y = 140},
            propsData = {ModeType = 0}
          },
          ["1736148734646948285"] = {
            key = "1736148734646948285",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1500, y = 140},
            propsData = {ModeType = 0}
          },
          ["1736148734646948286"] = {
            key = "1736148734646948286",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["1736148734646948287"] = {
            key = "1736148734646948287",
            type = "BossBattleOpenNode",
            name = "BOSS\230\136\152\229\188\128\229\156\186\230\146\173\231\137\135",
            pos = {x = 399, y = 127},
            propsData = {
              SequencePath = "LevelSequence'/Game/Asset/Cinematics/SystemShow/HardBoss/HardBoss_Haier/HardBoss_Haier_Start.HardBoss_Haier_Start'",
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
    ["1736148734646948275"] = {
      isStoryNode = true,
      key = "1736148734646948275",
      type = "StoryNode",
      name = "\231\187\147\230\157\159\229\137\167\230\131\133",
      pos = {x = 1305.5, y = 469},
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
            startQuest = "1736148734646948296",
            startPort = "QuestStart",
            endQuest = "1736148734646948297",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1736148734646948296"] = {
            key = "1736148734646948296",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100, y = 140},
            propsData = {ModeType = 0}
          },
          ["1736148734646948297"] = {
            key = "1736148734646948297",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1500, y = 140},
            propsData = {ModeType = 0}
          },
          ["1736148734646948298"] = {
            key = "1736148734646948298",
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
