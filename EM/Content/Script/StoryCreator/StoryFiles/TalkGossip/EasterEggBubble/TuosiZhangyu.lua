return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175325308837045072143",
      startPort = "Success",
      endStory = "175325308837045072142",
      endPort = "StoryEnd"
    },
    {
      startStory = "175325308837045072141",
      startPort = "StoryStart",
      endStory = "175325308837045072143",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175325308837045072141"] = {
      isStoryNode = true,
      key = "175325308837045072141",
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
    ["175325308837045072142"] = {
      isStoryNode = true,
      key = "175325308837045072142",
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
    ["175325308837045072143"] = {
      isStoryNode = true,
      key = "175325308837045072143",
      type = "StoryNode",
      name = "\229\185\187\230\153\175\231\171\160\233\177\188\228\186\146\229\138\168",
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
            startQuest = "175325308837045072144",
            startPort = "QuestStart",
            endQuest = "175325308837045072147",
            endPort = "In"
          },
          {
            startQuest = "175325308837045072147",
            startPort = "Out",
            endQuest = "175325308837045072145",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175325308837045072144"] = {
            key = "175325308837045072144",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175325308837045072145"] = {
            key = "175325308837045072145",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175325308837045072146"] = {
            key = "175325308837045072146",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175325308837045072147"] = {
            key = "175325308837045072147",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1230, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90200901,
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
