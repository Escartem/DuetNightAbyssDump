return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1734513595619755",
      startPort = "StoryStart",
      endStory = "1734513597546823",
      endPort = "In"
    },
    {
      startStory = "1734513597546823",
      startPort = "Success",
      endStory = "1734513595619758",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1734513595619755"] = {
      isStoryNode = true,
      key = "1734513595619755",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1090, y = 172},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1734513595619758"] = {
      isStoryNode = true,
      key = "1734513595619758",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1797.3333333333333, y = 181.55555555555554},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1734513597546823"] = {
      isStoryNode = true,
      key = "1734513597546823",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1422.888888888889, y = 172.00000000000006},
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
            startQuest = "1734513597546827",
            startPort = "QuestStart",
            endQuest = "1734513597546830",
            endPort = "In"
          },
          {
            startQuest = "1734513597546830",
            startPort = "Out",
            endQuest = "1734513597546828",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1734513597546827"] = {
            key = "1734513597546827",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1734513597546828"] = {
            key = "1734513597546828",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1566.842105263158, y = 302.82894736842104},
            propsData = {ModeType = 0}
          },
          ["1734513597546829"] = {
            key = "1734513597546829",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1734513597546830"] = {
            key = "1734513597546830",
            type = "TalkNode",
            name = "Free - \229\143\151\228\188\1643",
            pos = {x = 1254.5609448529651, y = 268.15314156857113},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11010623,
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
