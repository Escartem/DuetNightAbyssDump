return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1716548641100615407",
      startPort = "StoryStart",
      endStory = "1716548641100615410",
      endPort = "In"
    },
    {
      startStory = "1716548641100615410",
      startPort = "Success",
      endStory = "1716548641100615408",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1716548641100615407"] = {
      isStoryNode = true,
      key = "1716548641100615407",
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
    ["1716548641100615408"] = {
      isStoryNode = true,
      key = "1716548641100615408",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1330.0000000000002, y = 301.84615384615387},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1716548641100615409"] = {
      isStoryNode = true,
      key = "1716548641100615409",
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
            startQuest = "1716548641100615411",
            startPort = "QuestStart",
            endQuest = "1716548641100615414",
            endPort = "In"
          },
          {
            startQuest = "1716548641100615414",
            startPort = "Out",
            endQuest = "1716548641100615412",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1716548641100615411"] = {
            key = "1716548641100615411",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 847.3684210526316, y = 292.10526315789474},
            propsData = {ModeType = 0}
          },
          ["1716548641100615412"] = {
            key = "1716548641100615412",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1420.921052631579, y = 277.89473684210526},
            propsData = {ModeType = 0}
          },
          ["1716548641100615413"] = {
            key = "1716548641100615413",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1503.6842105263158, y = 413.42105263157896},
            propsData = {}
          },
          ["1716548641100615414"] = {
            key = "1716548641100615414",
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
    ["1716548641100615410"] = {
      isStoryNode = true,
      key = "1716548641100615410",
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
            startQuest = "1716548641100615415",
            startPort = "QuestStart",
            endQuest = "1716548641100615418",
            endPort = "In"
          },
          {
            startQuest = "1716548641100615418",
            startPort = "Out",
            endQuest = "1716548641100615416",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1716548641100615415"] = {
            key = "1716548641100615415",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1716548641100615416"] = {
            key = "1716548641100615416",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1358.1720430107525, y = 295.3225806451613},
            propsData = {ModeType = 0}
          },
          ["1716548641100615417"] = {
            key = "1716548641100615417",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1716548641100615418"] = {
            key = "1716548641100615418",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1067.676555635428, y = 286.9365035224322},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 510050411,
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
    }
  },
  commentData = {}
}
