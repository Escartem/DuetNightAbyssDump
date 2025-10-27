return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1753236758600955675",
      startPort = "Success",
      endStory = "1753236758600955674",
      endPort = "StoryEnd"
    },
    {
      startStory = "1753236758600955673",
      startPort = "StoryStart",
      endStory = "1753236758600955675",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1753236758600955673"] = {
      isStoryNode = true,
      key = "1753236758600955673",
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
    ["1753236758600955674"] = {
      isStoryNode = true,
      key = "1753236758600955674",
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
    ["1753236758600955675"] = {
      isStoryNode = true,
      key = "1753236758600955675",
      type = "StoryNode",
      name = "\233\187\145\230\161\131\232\190\190\232\138\153\230\182\133\228\186\146\229\138\168",
      pos = {x = 1128.8571428052421, y = 308},
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
            startQuest = "1753236758600955676",
            startPort = "QuestStart",
            endQuest = "1753236758600955679",
            endPort = "In"
          },
          {
            startQuest = "1753236758600955679",
            startPort = "Out",
            endQuest = "1753236758600955677",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1753236758600955676"] = {
            key = "1753236758600955676",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1753236758600955677"] = {
            key = "1753236758600955677",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["1753236758600955678"] = {
            key = "1753236758600955678",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["1753236758600955679"] = {
            key = "1753236758600955679",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1232, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90030901,
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
