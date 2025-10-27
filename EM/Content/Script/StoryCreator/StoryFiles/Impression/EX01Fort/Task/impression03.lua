return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1722492908417961699",
      startPort = "StoryStart",
      endStory = "1722493948987974899",
      endPort = "In"
    },
    {
      startStory = "1722493948987974899",
      startPort = "Success",
      endStory = "1722492908418961702",
      endPort = "StoryEnd"
    },
    {
      startStory = "1722493948987974899",
      startPort = "Fail",
      endStory = "1722492908418961702",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1722492908417961699"] = {
      isStoryNode = true,
      key = "1722492908417961699",
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
    ["1722492908418961702"] = {
      isStoryNode = true,
      key = "1722492908418961702",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1677.8947368421052, y = 286.140350877193},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1722493948987974899"] = {
      isStoryNode = true,
      key = "1722493948987974899",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1221.3230722026417, y = 311.12118658848465},
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
            startQuest = "1722493948988974900",
            startPort = "QuestStart",
            endQuest = "17361551876042262",
            endPort = "In"
          },
          {
            startQuest = "17361551876052268",
            startPort = "Out",
            endQuest = "1722493948988974902",
            endPort = "Success"
          },
          {
            startQuest = "1748490198478917",
            startPort = "Out",
            endQuest = "1748490198478918",
            endPort = "In"
          },
          {
            startQuest = "1748490198478918",
            startPort = "Out",
            endQuest = "1748490198478919",
            endPort = "In"
          },
          {
            startQuest = "1748490198478919",
            startPort = "Out",
            endQuest = "1748490198479920",
            endPort = "In"
          },
          {
            startQuest = "17361551876042262",
            startPort = "Out",
            endQuest = "17361551876052268",
            endPort = "In"
          },
          {
            startQuest = "17361551876042262",
            startPort = "Fail",
            endQuest = "175695620627210877",
            endPort = "In"
          },
          {
            startQuest = "175695620627210877",
            startPort = "Out",
            endQuest = "1748490198479921",
            endPort = "In"
          },
          {
            startQuest = "1748490198479921",
            startPort = "Out",
            endQuest = "17361551876052268",
            endPort = "In"
          }
        },
        nodeData = {
          ["1722493948988974900"] = {
            key = "1722493948988974900",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 962.7421126345271, y = -135.8072018281009},
            propsData = {ModeType = 0}
          },
          ["1722493948988974902"] = {
            key = "1722493948988974902",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2143.7321677066593, y = -153.42429140608704},
            propsData = {ModeType = 0}
          },
          ["1722493948988974904"] = {
            key = "1722493948988974904",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2422.1773095325725, y = 290.80354513907275},
            propsData = {}
          },
          ["17361551876042262"] = {
            key = "17361551876042262",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1327.9043053064847, y = -143.63444782554473},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11012401,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "EX01_FixSimple_14",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = true,
              ProceduralCameraId = 1,
              HideNpcs = true,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110022,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110009,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110015,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110024,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110016,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110020,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 110022},
                {TalkActorType = "Npc", TalkActorId = 110009},
                {TalkActorType = "Npc", TalkActorId = 110015},
                {TalkActorType = "Npc", TalkActorId = 110024},
                {TalkActorType = "Npc", TalkActorId = 110016},
                {TalkActorType = "Npc", TalkActorId = 110020}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = true,
              FailOutType = "BlendOut",
              FailOutTime = 0
            }
          },
          ["17361551876052268"] = {
            key = "17361551876052268",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1767.9173979524921, y = -146.55842795977344},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["1748490198478917"] = {
            key = "1748490198478917",
            type = "TalkNode",
            name = "\233\187\145\229\177\143\229\129\135\231\187\147\229\177\128",
            pos = {x = 1045.8829597686229, y = 592.9299970921642},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11012501,
              FlowAssetPath = "",
              TalkType = "BlackISS",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["1748490198478918"] = {
            key = "1748490198478918",
            type = "TalkNode",
            name = "\233\187\145\229\177\143\229\129\135\231\187\147\229\177\128",
            pos = {x = 1327.070782868397, y = 596.3379838351792},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11012505,
              FlowAssetPath = "",
              TalkType = "BlackISS",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["1748490198478919"] = {
            key = "1748490198478919",
            type = "TalkNode",
            name = "\233\187\145\229\177\143\229\129\135\231\187\147\229\177\128",
            pos = {x = 1577.138326728046, y = 607.5055927673278},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11012509,
              FlowAssetPath = "",
              TalkType = "BlackISS",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["1748490198479920"] = {
            key = "1748490198479920",
            type = "TalkNode",
            name = "\233\187\145\229\177\143\229\129\135\231\187\147\229\177\128",
            pos = {x = 1851.1999819574858, y = 604.0602348409142},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11012603,
              FlowAssetPath = "",
              TalkType = "BlackISS",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["1748490198479921"] = {
            key = "1748490198479921",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1815.5688003264452, y = 180.5526349595857},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11012607,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "EX01_FixSimple_14",
              BlendInTime = 0,
              BlendOutTime = 1,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110022,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110009,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110015,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110024,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110016,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110020,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 110015},
                {TalkActorType = "Npc", TalkActorId = 110022},
                {TalkActorType = "Npc", TalkActorId = 110009},
                {TalkActorType = "Npc", TalkActorId = 110024},
                {TalkActorType = "Npc", TalkActorId = 110016},
                {TalkActorType = "Npc", TalkActorId = 110020}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175695620627210877"] = {
            key = "175695620627210877",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1552.136645962733, y = 60.96894409937888},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0102/OBT0102_SC018/SQ_OBT0102_SC018",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
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
