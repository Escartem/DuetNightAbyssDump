return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "170184623498519535",
      startPort = "StoryStart",
      endStory = "170184623553519583",
      endPort = "In"
    },
    {
      startStory = "170184623553519583",
      startPort = "Success",
      endStory = "170184623498519538",
      endPort = "StoryEnd"
    },
    {
      startStory = "170184623553519583",
      startPort = "Fail",
      endStory = "170184623498519538",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["170184623498519535"] = {
      isStoryNode = true,
      key = "170184623498519535",
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
    ["170184623498519538"] = {
      isStoryNode = true,
      key = "170184623498519538",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2085.4545454545455, y = 305.45454545454544},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["170184623553519583"] = {
      isStoryNode = true,
      key = "170184623553519583",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1195.6715169841593, y = 293.1579833210266},
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
            startQuest = "1704175978911179168",
            startPort = "QuestStart",
            endQuest = "170184624359320325",
            endPort = "In"
          },
          {
            startQuest = "170184624359320325",
            startPort = "Option_1",
            endQuest = "170184643851822187",
            endPort = "In"
          },
          {
            startQuest = "170184624359320325",
            startPort = "Option_2",
            endQuest = "170184657069624514",
            endPort = "In"
          },
          {
            startQuest = "170184624359320325",
            startPort = "Option_3",
            endQuest = "170184657666824951",
            endPort = "In"
          },
          {
            startQuest = "170184643851822187",
            startPort = "Fail",
            endQuest = "170184660129326251",
            endPort = "In"
          },
          {
            startQuest = "170184657069624514",
            startPort = "Fail",
            endQuest = "170184660129326251",
            endPort = "In"
          },
          {
            startQuest = "170184657666824951",
            startPort = "Fail",
            endQuest = "170184660129326251",
            endPort = "In"
          },
          {
            startQuest = "170184660129326251",
            startPort = "Out",
            endQuest = "1704175978911179170",
            endPort = "Fail"
          },
          {
            startQuest = "170184643851822187",
            startPort = "Option_1",
            endQuest = "170184669484330097",
            endPort = "In"
          },
          {
            startQuest = "170184657069624514",
            startPort = "Option_1",
            endQuest = "170184669484330097",
            endPort = "In"
          },
          {
            startQuest = "170184657666824951",
            startPort = "Option_1",
            endQuest = "170184669484330097",
            endPort = "In"
          },
          {
            startQuest = "170184669484330097",
            startPort = "Out",
            endQuest = "172191091811914057",
            endPort = "Input"
          },
          {
            startQuest = "172191091811914057",
            startPort = "ApproveOut",
            endQuest = "1704175978911179169",
            endPort = "Success"
          },
          {
            startQuest = "172191091811914057",
            startPort = "CancelOut",
            endQuest = "1704175978911179170",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["170184624359320325"] = {
            key = "170184624359320325",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1089.7171935298363, y = 281.85900452204794},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002001,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = -1,
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
              PlusOptions = {
                {
                  OptionText = "510020031",
                  PlusId = 1003,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "510020032",
                  PlusId = 1001,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "510020033",
                  PlusId = 1002,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["170184643851822187"] = {
            key = "170184643851822187",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1456.6402704529132, y = 119.1666968297401},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002004,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = -1,
              BlendOutTime = -1,
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
              CheckOptions = {
                {
                  OptionText = "510020131",
                  CheckId = 1018,
                  NotCheck = false,
                  OverrideBlend = false,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = 0.5
                }
              },
              OverrideFailBlend = false
            }
          },
          ["170184657069624514"] = {
            key = "170184657069624514",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1460.6402704529132, y = 307.2436199066633},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002006,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = -1,
              BlendOutTime = -1,
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
              CheckOptions = {
                {
                  OptionText = "510020131",
                  CheckId = 1018,
                  NotCheck = false,
                  OverrideBlend = false,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = 0.5
                }
              },
              OverrideFailBlend = false
            }
          },
          ["170184657666824951"] = {
            key = "170184657666824951",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1460.1018089144518, y = 498.78208144512473},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002008,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = -1,
              BlendOutTime = -1,
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
              CheckOptions = {
                {
                  OptionText = "510020131",
                  CheckId = 1018,
                  NotCheck = false,
                  OverrideBlend = false,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = 0.5
                }
              },
              OverrideFailBlend = false
            }
          },
          ["170184660129326251"] = {
            key = "170184660129326251",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1944.409501222144, y = 532.5513122143556},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002014,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = -1,
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
          },
          ["170184669484330097"] = {
            key = "170184669484330097",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1935.2116990243421, y = 219.5513122143556},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002016,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = -1,
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
          },
          ["1704175978911179168"] = {
            key = "1704175978911179168",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1704175978911179169"] = {
            key = "1704175978911179169",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2481.281512605042, y = 225.00000000000006},
            propsData = {ModeType = 0}
          },
          ["1704175978911179170"] = {
            key = "1704175978911179170",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2317.0135746606334, y = 568.393665158371},
            propsData = {}
          },
          ["172191091811914057"] = {
            key = "172191091811914057",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 2212.270572565674, y = 267.7186939756075},
            propsData = {
              SideQuestChainId = 200205,
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
