return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175325308836745071927",
      startPort = "Success",
      endStory = "175325308836745071926",
      endPort = "StoryEnd"
    },
    {
      startStory = "175325308836745071925",
      startPort = "StoryStart",
      endStory = "175325308836745071927",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175325308836745071925"] = {
      isStoryNode = true,
      key = "175325308836745071925",
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
    ["175325308836745071926"] = {
      isStoryNode = true,
      key = "175325308836745071926",
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
    ["175325308836745071927"] = {
      isStoryNode = true,
      key = "175325308836745071927",
      type = "StoryNode",
      name = "\229\185\187\230\153\175\232\142\137\232\142\137\229\175\135\228\186\146\229\138\168",
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
            startQuest = "175325308836745071928",
            startPort = "QuestStart",
            endQuest = "175325308836845071931",
            endPort = "In"
          },
          {
            startQuest = "175325308836845071931",
            startPort = "Out",
            endQuest = "175325308836745071929",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175325308836745071928"] = {
            key = "175325308836745071928",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175325308836745071929"] = {
            key = "175325308836745071929",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175325308836845071930"] = {
            key = "175325308836845071930",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175325308836845071931"] = {
            key = "175325308836845071931",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90200801,
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
