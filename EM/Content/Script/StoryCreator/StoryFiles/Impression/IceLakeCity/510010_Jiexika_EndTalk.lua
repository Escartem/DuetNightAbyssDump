return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1704175978816176793",
      startPort = "StoryStart",
      endStory = "171418246675716761",
      endPort = "In"
    },
    {
      startStory = "171418246675716761",
      startPort = "Success",
      endStory = "1704175978816176794",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1704175978816176793"] = {
      isStoryNode = true,
      key = "1704175978816176793",
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
    ["1704175978816176794"] = {
      isStoryNode = true,
      key = "1704175978816176794",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1411.7948717948718, y = 305.38461538461536},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175978816176795"] = {
      isStoryNode = true,
      key = "1704175978816176795",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1103.3544494720968, y = 508.03846153846143},
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
            startQuest = "1704175978816176796",
            startPort = "QuestStart",
            endQuest = "1704175978816176799",
            endPort = "In"
          },
          {
            startQuest = "1704175978816176799",
            startPort = "Out",
            endQuest = "1704175978816176797",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1704175978816176796"] = {
            key = "1704175978816176796",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1704175978816176797"] = {
            key = "1704175978816176797",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1654.7058823529414, y = 317.6470588235294},
            propsData = {ModeType = 0}
          },
          ["1704175978816176798"] = {
            key = "1704175978816176798",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2314.705882352941, y = 756.4705882352941},
            propsData = {}
          },
          ["1704175978816176799"] = {
            key = "1704175978816176799",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1148.43137254902, y = 286.66666666666663},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51001027,
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
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["171418246675716761"] = {
      isStoryNode = true,
      key = "171418246675716761",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1100.8242982564648, y = 284.0728888167978},
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
            startQuest = "171418246675816762",
            startPort = "QuestStart",
            endQuest = "171418248257617290",
            endPort = "In"
          },
          {
            startQuest = "171418248257617290",
            startPort = "Out",
            endQuest = "171418246675816764",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171418246675816762"] = {
            key = "171418246675816762",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["171418246675816764"] = {
            key = "171418246675816764",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1376.1538461538469, y = 305.76923076923083},
            propsData = {ModeType = 0}
          },
          ["171418246675816766"] = {
            key = "171418246675816766",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["171418248257617290"] = {
            key = "171418248257617290",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1072.362759794926, y = 282.9190426629515},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51001027,
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
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
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
