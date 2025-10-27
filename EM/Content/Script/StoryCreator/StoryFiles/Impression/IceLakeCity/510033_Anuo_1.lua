return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17125607476311217399",
      startPort = "StoryStart",
      endStory = "17125607685511217678",
      endPort = "In"
    },
    {
      startStory = "17125607685511217678",
      startPort = "Success",
      endStory = "17125607476311217402",
      endPort = "StoryEnd"
    },
    {
      startStory = "17125607685511217678",
      startPort = "Fail",
      endStory = "17125607476311217402",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17125607476311217399"] = {
      isStoryNode = true,
      key = "17125607476311217399",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1574.7058823529412, y = 292.94117647058823},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17125607476311217402"] = {
      isStoryNode = true,
      key = "17125607476311217402",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2161.176470588235, y = 291.1764705882353},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17125607685511217678"] = {
      isStoryNode = true,
      key = "17125607685511217678",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1870.6475285998677, y = 288.67662886873256},
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
            startQuest = "17125607685511217679",
            startPort = "QuestStart",
            endQuest = "171264403137816826",
            endPort = "In"
          },
          {
            startQuest = "171264403137816826",
            startPort = "Out",
            endQuest = "17125607685511217681",
            endPort = "Success"
          },
          {
            startQuest = "171264403137816826",
            startPort = "Fail",
            endQuest = "17125607685511217683",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17125607685511217679"] = {
            key = "17125607685511217679",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 748.3719298245614, y = 566.459649122807},
            propsData = {ModeType = 0}
          },
          ["17125607685511217681"] = {
            key = "17125607685511217681",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1323.0299277605777, y = 475.81114551083584},
            propsData = {ModeType = 0}
          },
          ["17125607685511217683"] = {
            key = "17125607685511217683",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1338.1207430340555, y = 659.4571723426211},
            propsData = {}
          },
          ["171264403137816826"] = {
            key = "171264403137816826",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1037.0472407421614, y = 550.6538461284462},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51003301,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 1,
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
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              PlusOptions = {},
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
