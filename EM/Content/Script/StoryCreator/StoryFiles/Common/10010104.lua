return {
  storyName = "\230\156\170\229\145\189\229\144\141\230\149\133\228\186\139",
  storyDescription = "",
  lineData = {
    {
      startStory = "1745392492872278999",
      startPort = "StoryStart",
      endStory = "1745392492872279001",
      endPort = "In"
    },
    {
      startStory = "1745392492872279001",
      startPort = "Success",
      endStory = "1745392492872279000",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1745392492872278999"] = {
      isStoryNode = true,
      key = "1745392492872278999",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 100, y = 140},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1745392492872279000"] = {
      isStoryNode = true,
      key = "1745392492872279000",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 840.4545454545455, y = 144.0909090909091},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1745392492872279001"] = {
      isStoryNode = true,
      key = "1745392492872279001",
      type = "StoryNode",
      name = "\230\156\170\229\145\189\229\144\141\228\187\187\229\138\161",
      pos = {x = 425.4545454545455, y = 118.18181818181819},
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
        bIsNotifyGameMode = false,
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
            startQuest = "1745392492872279006",
            startPort = "Out",
            endQuest = "1745392492872279007",
            endPort = "In"
          },
          {
            startQuest = "1745392492872279009",
            startPort = "Out",
            endQuest = "1745392492872279012",
            endPort = "In"
          },
          {
            startQuest = "1745392492872279002",
            startPort = "QuestStart",
            endQuest = "1745392492872279013",
            endPort = "In"
          },
          {
            startQuest = "1745392492872279013",
            startPort = "Out",
            endQuest = "1745392492872279003",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1745392492872279002"] = {
            key = "1745392492872279002",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -6.500000000000014, y = 966.35},
            propsData = {ModeType = 0}
          },
          ["1745392492872279003"] = {
            key = "1745392492872279003",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 712.5000000000003, y = 1066.2499999999993},
            propsData = {ModeType = 0}
          },
          ["1745392492872279004"] = {
            key = "1745392492872279004",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 809.3499999999999, y = 974.3857142857144},
            propsData = {}
          },
          ["1745392492872279005"] = {
            key = "1745392492872279005",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 453.76363636363635, y = 242},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10010116,
              FlowAssetPath = "",
              TalkType = "HintGuide",
              OverrideFailBlend = false
            }
          },
          ["1745392492872279006"] = {
            key = "1745392492872279006",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 529.1561073852763, y = -130.27268778149386},
            propsData = {WaitTime = 0.5}
          },
          ["1745392492872279007"] = {
            key = "1745392492872279007",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 855.1662083953772, y = -125.92925343805948},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10010116,
              FlowAssetPath = "",
              TalkType = "HintGuide",
              OverrideFailBlend = false
            }
          },
          ["1745392492872279008"] = {
            key = "1745392492872279008",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 852.5123949641911, y = 1114.5304153099025},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010303,
              GuideType = "M",
              GuidePointName = "QuestTrigger0303"
            }
          },
          ["1745392492872279009"] = {
            key = "1745392492872279009",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 222.77940539231543, y = 758.2243769885861},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111010201,
              GuideType = "M",
              GuidePointName = "QuestTrigger0304"
            }
          },
          ["1745392492872279010"] = {
            key = "1745392492872279010",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 903.5604818419372, y = 522.9188219177707},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010302,
              GuideType = "M",
              GuidePointName = "QuestTrigger0302"
            }
          },
          ["1745392492872279011"] = {
            key = "1745392492872279011",
            type = "TalkNode",
            name = "\229\155\160\233\178\156\232\161\128\232\128\140\233\156\135\233\162\164",
            pos = {x = 523.7568821456825, y = 443.55425824064355},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11010207,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_02",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110022,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 110022}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1745392492872279012"] = {
            key = "1745392492872279012",
            type = "TalkNode",
            name = "\229\155\160\233\178\156\232\161\128\232\128\140\233\156\135\233\162\164",
            pos = {x = 538.9198490344177, y = 751.3007064451126},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11010207,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_02",
              BlendInTime = 0,
              BlendOutTime = 1,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110022,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 110022}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1745392492872279013"] = {
            key = "1745392492872279013",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\1851000031",
            pos = {x = 410.30020313321575, y = 988.5480515412064},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10029401,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0,
              BlendOutTime = 0,
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
    }
  },
  commentData = {}
}
