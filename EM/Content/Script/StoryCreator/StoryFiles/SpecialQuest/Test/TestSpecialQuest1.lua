return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17546441434812692567",
      startPort = "StoryStart",
      endStory = "17546441475392692611",
      endPort = "In"
    },
    {
      startStory = "17546441475392692611",
      startPort = "Success",
      endStory = "17546441434812692570",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17546441434812692567"] = {
      isStoryNode = true,
      key = "17546441434812692567",
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
    ["17546441434812692570"] = {
      isStoryNode = true,
      key = "17546441434812692570",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1904, y = 276},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17546441475392692611"] = {
      isStoryNode = true,
      key = "17546441475392692611",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1270, y = 288},
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
            startQuest = "17546441548892692907",
            startPort = "Out",
            endQuest = "17547225062863888706",
            endPort = "In"
          },
          {
            startQuest = "17546441475402692612",
            startPort = "QuestStart",
            endQuest = "17547225167033889034",
            endPort = "In"
          },
          {
            startQuest = "17547225167033889034",
            startPort = "Out",
            endQuest = "17546441475402692618",
            endPort = "Fail"
          },
          {
            startQuest = "17546441475402692612",
            startPort = "QuestStart",
            endQuest = "17549969783351732",
            endPort = "In"
          },
          {
            startQuest = "17549969783351732",
            startPort = "Out",
            endQuest = "17546441548892692907",
            endPort = "In"
          }
        },
        nodeData = {
          ["17546441475402692612"] = {
            key = "17546441475402692612",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17546441475402692615"] = {
            key = "17546441475402692615",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2202.5, y = 308.75},
            propsData = {ModeType = 0}
          },
          ["17546441475402692618"] = {
            key = "17546441475402692618",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2212.5, y = 617.5},
            propsData = {}
          },
          ["17546441548892692907"] = {
            key = "17546441548892692907",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1403.6630434782608, y = 292.4021739130435},
            propsData = {WaitTime = 120}
          },
          ["17547225062863888706"] = {
            key = "17547225062863888706",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 1802.5986975401765, y = 292.83212463267},
            propsData = {}
          },
          ["17547225167033889034"] = {
            key = "17547225167033889034",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1436.3486975401765, y = 609.08212463267},
            propsData = {}
          },
          ["17549969783351732"] = {
            key = "17549969783351732",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1151.8260869565215, y = 288.26086956521726},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1210122,
              GuideType = "N",
              GuidePointName = "Npc_200229Ranse_1210123"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
