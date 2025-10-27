return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17471182813131",
      startPort = "StoryStart",
      endStory = "1747118303985672",
      endPort = "In"
    },
    {
      startStory = "1747118303985672",
      startPort = "Success",
      endStory = "17471182813145",
      endPort = "StoryEnd"
    },
    {
      startStory = "1747118303985672",
      startPort = "Fail",
      endStory = "17471182813145",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17471182813131"] = {
      isStoryNode = true,
      key = "17471182813131",
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
    ["17471182813145"] = {
      isStoryNode = true,
      key = "17471182813145",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1886, y = 318},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1747118303985672"] = {
      isStoryNode = true,
      key = "1747118303985672",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1251.7505657453326, y = 328.2468544938259},
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
            startQuest = "1747118303986673",
            startPort = "QuestStart",
            endQuest = "17471183338781300",
            endPort = "In"
          },
          {
            startQuest = "1748255519787502",
            startPort = "ApproveOut",
            endQuest = "1747118303986676",
            endPort = "Success"
          },
          {
            startQuest = "1748255519787502",
            startPort = "CancelOut",
            endQuest = "1747118303986679",
            endPort = "Fail"
          },
          {
            startQuest = "17471183338781300",
            startPort = "Out",
            endQuest = "1748255519787502",
            endPort = "Input"
          },
          {
            startQuest = "17471183338781300",
            startPort = "Fail",
            endQuest = "1747118303986679",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1747118303986673"] = {
            key = "1747118303986673",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1747118303986676"] = {
            key = "1747118303986676",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1773.3715220949261, y = 266.34369885433716},
            propsData = {ModeType = 0}
          },
          ["1747118303986679"] = {
            key = "1747118303986679",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1468.2727272727273, y = 433.1818181818182},
            propsData = {}
          },
          ["17471183338781300"] = {
            key = "17471183338781300",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1083.5388984013696, y = 287.5665847402762},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002901,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              SkipToOption = false,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              PauseNpcBT = true,
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "check",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              CheckOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1748255519787502"] = {
            key = "1748255519787502",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 1468.0899046268596, y = 184.82944017674032},
            propsData = {
              SideQuestChainId = 200206,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
