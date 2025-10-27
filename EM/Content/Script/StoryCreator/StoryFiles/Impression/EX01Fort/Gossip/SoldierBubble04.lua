return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17448776517344321",
      startPort = "StoryStart",
      endStory = "17448776524554356",
      endPort = "In"
    },
    {
      startStory = "17448776524554356",
      startPort = "Success",
      endStory = "17448776517344324",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17448776517344321"] = {
      isStoryNode = true,
      key = "17448776517344321",
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
    ["17448776517344324"] = {
      isStoryNode = true,
      key = "17448776517344324",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1696, y = 350},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17448776524554356"] = {
      isStoryNode = true,
      key = "17448776524554356",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1307.157894736842, y = 316},
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
            startQuest = "17448776524554361",
            startPort = "QuestStart",
            endQuest = "17448776524554364",
            endPort = "In"
          },
          {
            startQuest = "17448776524554364",
            startPort = "Out",
            endQuest = "17448776524554362",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17448776524554361"] = {
            key = "17448776524554361",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17448776524554362"] = {
            key = "17448776524554362",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1566.842105263158, y = 302.82894736842104},
            propsData = {ModeType = 0}
          },
          ["17448776524554363"] = {
            key = "17448776524554363",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17448776524554364"] = {
            key = "17448776524554364",
            type = "TalkNode",
            name = "Free - \229\143\151\228\188\1643",
            pos = {x = 1258.5609448529651, y = 266.15314156857113},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11010628,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = true,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
