return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17557791041161826643",
      startPort = "Success",
      endStory = "17557791041161826642",
      endPort = "StoryEnd"
    },
    {
      startStory = "17557791041161826641",
      startPort = "StoryStart",
      endStory = "17557791041161826643",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17557791041161826641"] = {
      isStoryNode = true,
      key = "17557791041161826641",
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
    ["17557791041161826642"] = {
      isStoryNode = true,
      key = "17557791041161826642",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1492, y = 306},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17557791041161826643"] = {
      isStoryNode = true,
      key = "17557791041161826643",
      type = "StoryNode",
      name = "\232\142\137\229\133\185\232\180\157\229\176\148\231\144\179\230\129\169\228\186\146\229\138\168",
      pos = {x = 1126, y = 308},
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
            startQuest = "17557791041161826644",
            startPort = "QuestStart",
            endQuest = "17557791041161826647",
            endPort = "In"
          },
          {
            startQuest = "17557791041161826647",
            startPort = "Out",
            endQuest = "17557791041161826645",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17557791041161826644"] = {
            key = "17557791041161826644",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17557791041161826645"] = {
            key = "17557791041161826645",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["17557791041161826646"] = {
            key = "17557791041161826646",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["17557791041161826647"] = {
            key = "17557791041161826647",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90250701,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
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
