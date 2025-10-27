return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17543036277311",
      startPort = "StoryStart",
      endStory = "1754303637453196",
      endPort = "In"
    },
    {
      startStory = "1754303637453196",
      startPort = "Success",
      endStory = "17543036277325",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17543036277311"] = {
      isStoryNode = true,
      key = "17543036277311",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1411.6666666666667, y = 426.6666666666667},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17543036277325"] = {
      isStoryNode = true,
      key = "17543036277325",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2386.6666666666665, y = 496.6666666666667},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1754303637453196"] = {
      isStoryNode = true,
      key = "1754303637453196",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1944, y = 543.3333333333334},
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
            startQuest = "1754303637454197",
            startPort = "QuestStart",
            endQuest = "1754303649237655",
            endPort = "In"
          },
          {
            startQuest = "1754303649237655",
            startPort = "Out",
            endQuest = "1754303637454204",
            endPort = "Success"
          },
          {
            startQuest = "1754303649237655",
            startPort = "Fail",
            endQuest = "1754303637454211",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1754303637454197"] = {
            key = "1754303637454197",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1162, y = 514},
            propsData = {ModeType = 0}
          },
          ["1754303637454204"] = {
            key = "1754303637454204",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1754303637454211"] = {
            key = "1754303637454211",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1754303649237655"] = {
            key = "1754303649237655",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1798, y = 556},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51012201,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/SpecialSideStory/2002/200234/510122.510122'",
              TalkType = "FixSimple",
              TalkStageName = "",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
              SwitchToMaster = "Player",
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
