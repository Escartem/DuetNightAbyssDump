return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17580263067283540825",
      startPort = "StoryStart",
      endStory = "17580263087413540879",
      endPort = "In"
    },
    {
      startStory = "17580263087413540879",
      startPort = "Success",
      endStory = "17580263067283540828",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17580263067283540825"] = {
      isStoryNode = true,
      key = "17580263067283540825",
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
    ["17580263067283540828"] = {
      isStoryNode = true,
      key = "17580263067283540828",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1638, y = 350},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17580263087413540879"] = {
      isStoryNode = true,
      key = "17580263087413540879",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1230, y = 316},
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
            startQuest = "17580263087413540880",
            startPort = "QuestStart",
            endQuest = "17580263676614183109",
            endPort = "In"
          },
          {
            startQuest = "17580263676614183109",
            startPort = "Branch_1",
            endQuest = "17580263775324183365",
            endPort = "In"
          },
          {
            startQuest = "17580263775324183365",
            startPort = "Out",
            endQuest = "17580263087413540883",
            endPort = "Success"
          },
          {
            startQuest = "17580263676614183109",
            startPort = "Branch_2",
            endQuest = "17585093576309445",
            endPort = "In"
          },
          {
            startQuest = "17585093576309445",
            startPort = "Out",
            endQuest = "17580263087413540883",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17580263087413540880"] = {
            key = "17580263087413540880",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17580263087413540883"] = {
            key = "17580263087413540883",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2072.5, y = 428.75},
            propsData = {ModeType = 0}
          },
          ["17580263087413540886"] = {
            key = "17580263087413540886",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17580263676614183109"] = {
            key = "17580263676614183109",
            type = "BranchTriggerNode",
            name = "\232\167\166\229\143\145\229\136\134\230\148\175\232\138\130\231\130\185",
            pos = {x = 1169.5454545454545, y = 352.02272727272725},
            propsData = {
              Branches = {700181, 700182}
            }
          },
          ["17580263775324183365"] = {
            key = "17580263775324183365",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1593.25, y = 426.75},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20007107,
              FlowAssetPath = "",
              TalkType = "NoIntFixSimple",
              TalkStageName = "",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
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
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17585093576309445"] = {
            key = "17585093576309445",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1588, y = 714},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20007108,
              FlowAssetPath = "",
              TalkType = "NoIntFixSimple",
              TalkStageName = "",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
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
              SwitchToMaster = "None",
              NormalOptions = {},
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
