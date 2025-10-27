return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175325342380448338302",
      startPort = "Success",
      endStory = "175325342380448338301",
      endPort = "StoryEnd"
    },
    {
      startStory = "175325342380448338300",
      startPort = "StoryStart",
      endStory = "175325342380448338302",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175325342380448338300"] = {
      isStoryNode = true,
      key = "175325342380448338300",
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
    ["175325342380448338301"] = {
      isStoryNode = true,
      key = "175325342380448338301",
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
    ["175325342380448338302"] = {
      isStoryNode = true,
      key = "175325342380448338302",
      type = "StoryNode",
      name = "\233\187\142\231\145\159\229\184\140\229\176\148\229\166\178\228\186\146\229\138\168",
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
            startQuest = "175325342380448338303",
            startPort = "QuestStart",
            endQuest = "175325342380448338306",
            endPort = "In"
          },
          {
            startQuest = "175325342380448338306",
            startPort = "Out",
            endQuest = "175325342380448338304",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175325342380448338303"] = {
            key = "175325342380448338303",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175325342380448338304"] = {
            key = "175325342380448338304",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175325342380448338305"] = {
            key = "175325342380448338305",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175325342380448338306"] = {
            key = "175325342380448338306",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90210801,
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
