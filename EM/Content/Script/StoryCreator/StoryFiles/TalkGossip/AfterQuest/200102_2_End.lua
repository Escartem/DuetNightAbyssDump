return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17141991237433236283",
      startPort = "StoryStart",
      endStory = "17141991237433236285",
      endPort = "In"
    },
    {
      startStory = "17141991237433236285",
      startPort = "Success",
      endStory = "17141991237433236284",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["171135581567449003"] = {
      isStoryNode = true,
      key = "171135581567449003",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1065.7668473678389, y = 518.7268861075117},
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
            startQuest = "171135581567449004",
            startPort = "QuestStart",
            endQuest = "171135583059149493",
            endPort = "In"
          },
          {
            startQuest = "171135583059149493",
            startPort = "Out",
            endQuest = "171135581567449006",
            endPort = "Success"
          }
        },
        nodeData = {
          ["171135581567449004"] = {
            key = "171135581567449004",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["171135581567449006"] = {
            key = "171135581567449006",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1309, y = 298.5},
            propsData = {ModeType = 0}
          },
          ["171135581567449008"] = {
            key = "171135581567449008",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["171135583059149493"] = {
            key = "171135583059149493",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1053.6461577126663, y = 290.96372821277515},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 20001401,
              FlowAssetPath = "",
              TalkType = "Impression",
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
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17141991237433236283"] = {
      isStoryNode = true,
      key = "17141991237433236283",
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
    ["17141991237433236284"] = {
      isStoryNode = true,
      key = "17141991237433236284",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1386.4535005224664, y = 300.5526197939991},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991237433236285"] = {
      isStoryNode = true,
      key = "17141991237433236285",
      type = "StoryNode",
      name = "\232\181\155\231\144\170EndTalk1",
      pos = {x = 1068.6539887950769, y = 289.64081117335996},
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
            startQuest = "17141991237433236286",
            startPort = "QuestStart",
            endQuest = "17141991237433236289",
            endPort = "In"
          },
          {
            startQuest = "17141991237433236289",
            startPort = "Out",
            endQuest = "17141991237433236287",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17141991237433236286"] = {
            key = "17141991237433236286",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17141991237433236287"] = {
            key = "17141991237433236287",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1456.5217391304348, y = 307.82608695652175},
            propsData = {ModeType = 0}
          },
          ["17141991237433236288"] = {
            key = "17141991237433236288",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17141991237433236289"] = {
            key = "17141991237433236289",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1120.0869565217401, y = 296.43478260869523},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 20001401,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
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
