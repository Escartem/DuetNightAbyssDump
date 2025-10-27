return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17141991230113191984",
      startPort = "StoryStart",
      endStory = "17141817528153490",
      endPort = "In"
    },
    {
      startStory = "17141817528153490",
      startPort = "Success",
      endStory = "17141991230113191985",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17141817459123289"] = {
      isStoryNode = true,
      key = "17141817459123289",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1069.6864811937407, y = 498.4997789566754},
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
            startQuest = "17141817459123293",
            startPort = "QuestStart",
            endQuest = "17141817459123296",
            endPort = "In"
          },
          {
            startQuest = "17141817459123296",
            startPort = "Out",
            endQuest = "17141817459123294",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17141817459123293"] = {
            key = "17141817459123293",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 847.3684210526316, y = 292.10526315789474},
            propsData = {ModeType = 0}
          },
          ["17141817459123294"] = {
            key = "17141817459123294",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1420.921052631579, y = 277.89473684210526},
            propsData = {ModeType = 0}
          },
          ["17141817459123295"] = {
            key = "17141817459123295",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1503.6842105263158, y = 413.42105263157896},
            propsData = {}
          },
          ["17141817459123296"] = {
            key = "17141817459123296",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1113.1383325611587, y = 281.8461538461538},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 510034141,
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
    ["17141817528153490"] = {
      isStoryNode = true,
      key = "17141817528153490",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1056.6095581168177, y = 291.96131741821387},
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
            startQuest = "17141817528153491",
            startPort = "QuestStart",
            endQuest = "17141817671773903",
            endPort = "In"
          },
          {
            startQuest = "17141817671773903",
            startPort = "Out",
            endQuest = "17141817528153493",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17141817528153491"] = {
            key = "17141817528153491",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17141817528153493"] = {
            key = "17141817528153493",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1358.1720430107525, y = 295.3225806451613},
            propsData = {ModeType = 0}
          },
          ["17141817528153495"] = {
            key = "17141817528153495",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17141817671773903"] = {
            key = "17141817671773903",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1067.676555635428, y = 286.9365035224322},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 510034141,
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
    ["17141991230113191984"] = {
      isStoryNode = true,
      key = "17141991230113191984",
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
    ["17141991230113191985"] = {
      isStoryNode = true,
      key = "17141991230113191985",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1330.0000000000002, y = 301.84615384615387},
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
