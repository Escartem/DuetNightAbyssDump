return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175323995805313227431",
      startPort = "Success",
      endStory = "175323995805313227430",
      endPort = "StoryEnd"
    },
    {
      startStory = "175323995805313227429",
      startPort = "StoryStart",
      endStory = "175323995805313227431",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["175323995805313227429"] = {
      isStoryNode = true,
      key = "175323995805313227429",
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
    ["175323995805313227430"] = {
      isStoryNode = true,
      key = "175323995805313227430",
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
    ["175323995805313227431"] = {
      isStoryNode = true,
      key = "175323995805313227431",
      type = "StoryNode",
      name = "\230\181\183\229\176\148\230\179\149\230\176\180\230\175\141\228\186\146\229\138\168",
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
            startQuest = "175323995805313227432",
            startPort = "QuestStart",
            endQuest = "175323995805313227435",
            endPort = "In"
          },
          {
            startQuest = "175323995805313227435",
            startPort = "Out",
            endQuest = "175323995805313227433",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175323995805313227432"] = {
            key = "175323995805313227432",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["175323995805313227433"] = {
            key = "175323995805313227433",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646, y = 314},
            propsData = {ModeType = 0}
          },
          ["175323995805313227434"] = {
            key = "175323995805313227434",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1610, y = 554},
            propsData = {}
          },
          ["175323995805313227435"] = {
            key = "175323995805313227435",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1232, y = 292},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 90060701,
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
