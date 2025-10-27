return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175324080417019053255",
      startPort = "Success",
      endStory = "175324080417019053254",
      endPort = "StoryEnd"
    },
    {
      startStory = "175324080417019053253",
      startPort = "StoryStart",
      endStory = "175324080417019053255",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175324080417019053253"] = {
      isStoryNode = true,
      key = "175324080417019053253",
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
    ["175324080417019053254"] = {
      isStoryNode = true,
      key = "175324080417019053254",
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
    ["175324080417019053255"] = {
      isStoryNode = true,
      key = "175324080417019053255",
      type = "StoryNode",
      name = "\232\165\191\230\175\148\229\176\148\229\165\165\231\137\185\228\186\146\229\138\168",
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
            startQuest = "175324080417019053256",
            startPort = "QuestStart",
            endQuest = "175324080417019053259",
            endPort = "In"
          },
          {
            startQuest = "175324080417019053259",
            startPort = "Out",
            endQuest = "175324080417019053257",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175324080417019053256"] = {
            key = "175324080417019053256",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175324080417019053257"] = {
            key = "175324080417019053257",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175324080417019053258"] = {
            key = "175324080417019053258",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175324080417019053259"] = {
            key = "175324080417019053259",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1232, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90090801,
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
