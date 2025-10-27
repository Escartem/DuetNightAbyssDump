return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "171851536874211584611",
      startPort = "StoryStart",
      endStory = "17141991230173192296",
      endPort = "In"
    },
    {
      startStory = "17141991230173192296",
      startPort = "Success",
      endStory = "171851536874211584612",
      endPort = "StoryEnd"
    },
    {
      startStory = "17141991230173192296",
      startPort = "Fail",
      endStory = "171851536874211584612",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17141991230173192296"] = {
      isStoryNode = true,
      key = "17141991230173192296",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1868.6475285998677, y = 287.64214611011187},
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
            startQuest = "17141991230173192297",
            startPort = "QuestStart",
            endQuest = "17125608547351220599",
            endPort = "In"
          },
          {
            startQuest = "17125608547351220599",
            startPort = "Out",
            endQuest = "17141991230173192298",
            endPort = "Success"
          },
          {
            startQuest = "17125608547351220599",
            startPort = "Fail",
            endQuest = "17141991230173192299",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17125608547351220599"] = {
            key = "17125608547351220599",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1087.803248199961, y = 348.6530878317641},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51003505,
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
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              PlusOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17141991230173192297"] = {
            key = "17141991230173192297",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 818.2608695652174, y = 370.43478260869557},
            propsData = {ModeType = 0}
          },
          ["17141991230173192298"] = {
            key = "17141991230173192298",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1416.1468247776559, y = 268.62829614604465},
            propsData = {ModeType = 0}
          },
          ["17141991230173192299"] = {
            key = "17141991230173192299",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1413.4660243407707, y = 434.4523326572007},
            propsData = {}
          }
        },
        commentData = {}
      }
    },
    ["171851536874211584611"] = {
      isStoryNode = true,
      key = "171851536874211584611",
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
    ["171851536874211584612"] = {
      isStoryNode = true,
      key = "171851536874211584612",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2161.176470588235, y = 291.1764705882353},
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
