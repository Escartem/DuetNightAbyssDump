return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1743648136693331941",
      startPort = "StoryStart",
      endStory = "1743648136693331943",
      endPort = "In"
    },
    {
      startStory = "1743648136693331943",
      startPort = "Success",
      endStory = "1743648136693331942",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1743648136693331941"] = {
      isStoryNode = true,
      key = "1743648136693331941",
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
    ["1743648136693331942"] = {
      isStoryNode = true,
      key = "1743648136693331942",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1396.3947368421052, y = 299.57894736842104},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1743648136693331943"] = {
      isStoryNode = true,
      key = "1743648136693331943",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1083.2857142857142, y = 287.57142857142856},
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
            startQuest = "1743648136693331944",
            startPort = "QuestStart",
            endQuest = "1743648136693331947",
            endPort = "In"
          },
          {
            startQuest = "1743648136693331947",
            startPort = "Out",
            endQuest = "1743648136693331945",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1743648136693331944"] = {
            key = "1743648136693331944",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1743648136693331945"] = {
            key = "1743648136693331945",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1345.1176470588234, y = 304.94117647058823},
            propsData = {ModeType = 0}
          },
          ["1743648136693331946"] = {
            key = "1743648136693331946",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1357, y = 433.05882352941177},
            propsData = {}
          },
          ["1743648136693331947"] = {
            key = "1743648136693331947",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1060.986384204031, y = 304.3452005510829},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
