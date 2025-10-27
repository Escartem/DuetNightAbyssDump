return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851536889711589024",
      startPort = "StoryStart",
      endStory = "17180948768072089407",
      endPort = "In"
    },
    {
      startStory = "17180948768072089407",
      startPort = "Success",
      endStory = "171851536889711589025",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17180948768072089407"] = {
      isStoryNode = true,
      key = "17180948768072089407",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1021.4265931339338, y = 286.6911717131868},
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
            startQuest = "17180948768072089411",
            startPort = "QuestStart",
            endQuest = "17180948768072089414",
            endPort = "In"
          },
          {
            startQuest = "17180948768072089414",
            startPort = "Out",
            endQuest = "17180948768072089412",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17180948768072089411"] = {
            key = "17180948768072089411",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17180948768072089412"] = {
            key = "17180948768072089412",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1400.6764705882351, y = 303},
            propsData = {ModeType = 0}
          },
          ["17180948768072089413"] = {
            key = "17180948768072089413",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17180948768072089414"] = {
            key = "17180948768072089414",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1072.669189849695, y = 286.70652259979636},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 510052131,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
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
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["171851536889711589024"] = {
      isStoryNode = true,
      key = "171851536889711589024",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 725.5172413793103, y = 300},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["171851536889711589025"] = {
      isStoryNode = true,
      key = "171851536889711589025",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1326.6266866566718, y = 296.8986276092723},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    }
  },
  commentData = {}
}
