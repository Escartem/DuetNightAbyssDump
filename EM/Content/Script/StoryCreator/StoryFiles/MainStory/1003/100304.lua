return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1730710173050846385",
      startPort = "Success",
      endStory = "1727249405479342576",
      endPort = "In"
    },
    {
      startStory = "1727249405479342576",
      startPort = "Success",
      endStory = "173319497547913036",
      endPort = "In"
    },
    {
      startStory = "173319497547913036",
      startPort = "Success",
      endStory = "173158551784613731",
      endPort = "In"
    },
    {
      startStory = "173158551784613731",
      startPort = "Success",
      endStory = "17410579739793610",
      endPort = "In"
    },
    {
      startStory = "17410579739793610",
      startPort = "Success",
      endStory = "171851536956411623312",
      endPort = "StoryEnd"
    },
    {
      startStory = "1750248151252947485",
      startPort = "Success",
      endStory = "1730710173050846385",
      endPort = "In"
    },
    {
      startStory = "171851536956411623311",
      startPort = "StoryStart",
      endStory = "1750315473786961225",
      endPort = "In"
    },
    {
      startStory = "1750315473786961225",
      startPort = "Success",
      endStory = "1750248151252947485",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["171851536956411623311"] = {
      isStoryNode = true,
      key = "171851536956411623311",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 219.37777777777774, y = 300.2666666666667},
      propsData = {QuestChainId = 100304},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["171851536956411623312"] = {
      isStoryNode = true,
      key = "171851536956411623312",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2419.8059386434, y = 322.1683084717141},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1727249405479342576"] = {
      isStoryNode = true,
      key = "1727249405479342576",
      type = "StoryNode",
      name = "\231\167\152\229\175\134\229\159\186\229\156\176",
      pos = {x = 1436.952910866224, y = 293.3086633696545},
      propsData = {
        QuestId = 10030402,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030402",
        QuestDeatil = "QuestDesc_10030402",
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
            startQuest = "1727249405479342580",
            startPort = "QuestStart",
            endQuest = "17307112499751268727",
            endPort = "In"
          },
          {
            startQuest = "17307112499751268727",
            startPort = "Out",
            endQuest = "1727249405479342581",
            endPort = "Success"
          },
          {
            startQuest = "17555909821422647",
            startPort = "Out",
            endQuest = "17555909902892851",
            endPort = "In"
          },
          {
            startQuest = "1727249405479342580",
            startPort = "QuestStart",
            endQuest = "17555909821422647",
            endPort = "In"
          }
        },
        nodeData = {
          ["1727249405479342580"] = {
            key = "1727249405479342580",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -527.8378270845429, y = 535.1213279593293},
            propsData = {ModeType = 0}
          },
          ["1727249405479342581"] = {
            key = "1727249405479342581",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1363.1308871064405, y = 895.4698141643122},
            propsData = {ModeType = 0}
          },
          ["1727249405480342582"] = {
            key = "1727249405480342582",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1295.1853979592763, y = 220.57689462365633},
            propsData = {}
          },
          ["17307112499751268727"] = {
            key = "17307112499751268727",
            type = "GoToRegionNode",
            name = "\229\137\141\229\190\128\231\167\152\229\175\134\229\159\186\229\156\176",
            pos = {x = 87.14358484652598, y = 637.1101910988884},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101108,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_SecrEnter"
            }
          },
          ["17307112499751268729"] = {
            key = "17307112499751268729",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\159\186\229\156\176\229\134\133",
            pos = {x = 603.529122528658, y = 349.60635839908144},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1940010,
              GuideType = "M",
              GuidePointName = "Mechanism_1940010"
            }
          },
          ["17555909821422647"] = {
            key = "17555909821422647",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = -158, y = 1062},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1241075,
              GuideType = "M",
              GuidePointName = "Mechanism_1241075"
            }
          },
          ["17555909902892851"] = {
            key = "17555909902892851",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 240, y = 1066},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035255,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Communicator",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1730710173050846385"] = {
      isStoryNode = true,
      key = "1730710173050846385",
      type = "StoryNode",
      name = "\229\134\176\230\185\150\229\159\142",
      pos = {x = 1131.3480652474454, y = 300.2861827542924},
      propsData = {
        QuestId = 10030401,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030401",
        QuestDeatil = "QuestDesc_10030401",
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
        SubRegionId = 101101,
        StoryGuideType = "Point",
        StoryGuidePointName = "cp2icelcspawn"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1730710636693850189",
            startPort = "Out",
            endQuest = "1730710192727847482",
            endPort = "In"
          },
          {
            startQuest = "1730710636693850189",
            startPort = "Out",
            endQuest = "17373629948482376",
            endPort = "In"
          },
          {
            startQuest = "17406419898133140105",
            startPort = "Out",
            endQuest = "17406419970133140366",
            endPort = "Input"
          },
          {
            startQuest = "17406419970133140366",
            startPort = "Out",
            endQuest = "17406420112903140707",
            endPort = "In"
          },
          {
            startQuest = "1730711035653854643",
            startPort = "Out",
            endQuest = "17453956925974678266",
            endPort = "In"
          },
          {
            startQuest = "1730710192727847482",
            startPort = "Out",
            endQuest = "17454941550092196372",
            endPort = "In"
          },
          {
            startQuest = "17453956925974678266",
            startPort = "Out",
            endQuest = "17406419898133140105",
            endPort = "Input"
          },
          {
            startQuest = "17454941550092196372",
            startPort = "Out",
            endQuest = "174851681160119474896",
            endPort = "In"
          },
          {
            startQuest = "174851681160119474896",
            startPort = "Out",
            endQuest = "1730710205494847970",
            endPort = "In"
          },
          {
            startQuest = "1730710205494847970",
            startPort = "Out",
            endQuest = "174851681160119474897",
            endPort = "In"
          },
          {
            startQuest = "174851681160119474897",
            startPort = "Out",
            endQuest = "1730711035653854643",
            endPort = "In"
          },
          {
            startQuest = "17406420112903140707",
            startPort = "Out",
            endQuest = "174851693411720345331",
            endPort = "In"
          },
          {
            startQuest = "174851693411720345331",
            startPort = "Out",
            endQuest = "17320110260813252",
            endPort = "In"
          },
          {
            startQuest = "17320110260813252",
            startPort = "Out",
            endQuest = "174851695047520346032",
            endPort = "In"
          },
          {
            startQuest = "174851695047520346032",
            startPort = "Out",
            endQuest = "1730710173051846389",
            endPort = "Success"
          },
          {
            startQuest = "1730710173051846386",
            startPort = "QuestStart",
            endQuest = "1759060906425934451",
            endPort = "In"
          },
          {
            startQuest = "1759060906425934451",
            startPort = "Out",
            endQuest = "1730710636693850189",
            endPort = "In"
          }
        },
        nodeData = {
          ["1730710173051846386"] = {
            key = "1730710173051846386",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 708.5, y = 294},
            propsData = {ModeType = 0}
          },
          ["1730710173051846389"] = {
            key = "1730710173051846389",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3243.75, y = 300},
            propsData = {ModeType = 0}
          },
          ["1730710173051846392"] = {
            key = "1730710173051846392",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1730710192727847482"] = {
            key = "1730710192727847482",
            type = "TalkNode",
            name = "\233\187\145\229\177\143",
            pos = {x = 1601.0661103602272, y = 279.17782362116543},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035101,
              FlowAssetPath = "",
              TalkType = "Black",
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
          ["1730710205494847970"] = {
            key = "1730710205494847970",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 1862.399443693561, y = 281.844490287832},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035201,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "cp2fixsimple47-48",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100335,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304},
                {TalkActorType = "Npc", TalkActorId = 100335}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1730710636693850189"] = {
            key = "1730710636693850189",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1227.1053260465017, y = 308.2758628368516},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "cp2icelcspawn",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["1730711035653854643"] = {
            key = "1730711035653854643",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2157.066110360228, y = 273.17782362116543},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035244,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17320110260813252"] = {
            key = "17320110260813252",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 2770.3682934712347, y = 275.0532677848466},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035246,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple47-48",
              BlendInTime = 0,
              BlendOutTime = 0,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17373629948482376"] = {
            key = "17373629948482376",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1642.7727272727275, y = 483.2954545454545},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityDay",
              UnitId = -1
            }
          },
          ["17406419898133140105"] = {
            key = "17406419898133140105",
            type = "UnlockDetectiveQuestionNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\233\151\174\233\162\152",
            pos = {x = 1913.333333333334, y = 614.1333333333329},
            propsData = {
              QuestionIds = {1005},
              OpenToast = true
            }
          },
          ["17406419970133140366"] = {
            key = "17406419970133140366",
            type = "UnlockDetectiveAnswerNode",
            name = "\229\188\128\229\144\175\230\142\168\231\144\134\231\186\191\231\180\162",
            pos = {x = 2181.3333333333335, y = 617.4666666666662},
            propsData = {
              AnswerIds = {100501, 100502}
            }
          },
          ["17406420112903140707"] = {
            key = "17406420112903140707",
            type = "HasDetectiveResultNode",
            name = "\230\163\128\230\181\139\230\152\175\229\144\166\232\142\183\229\143\150\232\191\135\230\142\168\231\144\134\231\187\147\230\158\156",
            pos = {x = 2470.0000000000005, y = 616.1333333333329},
            propsData = {
              ResultIds = {10050101}
            }
          },
          ["17453956925974678266"] = {
            key = "17453956925974678266",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 2163.0837789661314, y = 446.9411764705884},
            propsData = {
              NewDescription = "QuestName_1003plus19",
              NewDetail = "QuestDesc_1003plus19",
              SubTaskTargetIndex = 0
            }
          },
          ["17454941550092196372"] = {
            key = "17454941550092196372",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1556.9264705882354, y = 55.49431450902036},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/Chapter02/icelakecity/cp2fixsimple47",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = false,
              ShowWikiButton = false,
              PauseGameGlobal = true,
              HideNpcs = true,
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
          },
          ["174851681160119474896"] = {
            key = "174851681160119474896",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1828.948412698412, y = 75.6251803751807},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101101},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["174851681160119474897"] = {
            key = "174851681160119474897",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2184.5039682539673, y = 70.06962481962505},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["174851693411720345331"] = {
            key = "174851693411720345331",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2474.22619047619, y = 282.84740259740283},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0072_story_reasoning",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101101},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["174851695047520346032"] = {
            key = "174851695047520346032",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 3000.47619047619, y = 97.84740259740283},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["1759060906425934451"] = {
            key = "1759060906425934451",
            type = "AuConditionNode",
            name = "\233\159\179\233\162\145\230\157\161\228\187\182\232\138\130\231\130\185",
            pos = {x = 962, y = 293.5},
            propsData = {ActionType = 1, Condition = "cp2_jieyan"}
          }
        },
        commentData = {}
      }
    },
    ["173158551784613731"] = {
      isStoryNode = true,
      key = "173158551784613731",
      type = "StoryNode",
      name = "\231\167\152\229\175\134\229\159\186\229\156\176\229\164\150",
      pos = {x = 2053.0000368568485, y = 288.4476337903581},
      propsData = {
        QuestId = 10030404,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030404",
        QuestDeatil = "QuestDesc_10030404",
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
            startQuest = "173158551784613732",
            startPort = "QuestStart",
            endQuest = "173158551908113860",
            endPort = "In"
          },
          {
            startQuest = "173158551908113860",
            startPort = "Out",
            endQuest = "173158551908113861",
            endPort = "In"
          },
          {
            startQuest = "173158551908113862",
            startPort = "Out",
            endQuest = "17479146601691738042",
            endPort = "In"
          },
          {
            startQuest = "17479146601691738042",
            startPort = "Out",
            endQuest = "173158551784613735",
            endPort = "Success"
          },
          {
            startQuest = "173158551908113861",
            startPort = "Out",
            endQuest = "174851705879321216510",
            endPort = "In"
          },
          {
            startQuest = "174851705879321216510",
            startPort = "Out",
            endQuest = "173158551908113858",
            endPort = "In"
          },
          {
            startQuest = "173158551908113858",
            startPort = "Out",
            endQuest = "174851709076421217544",
            endPort = "In"
          },
          {
            startQuest = "174851709076421217544",
            startPort = "Out",
            endQuest = "173158551908113862",
            endPort = "In"
          }
        },
        nodeData = {
          ["173158551784613732"] = {
            key = "173158551784613732",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173158551784613735"] = {
            key = "173158551784613735",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2948, y = 288.00000000000006},
            propsData = {ModeType = 0}
          },
          ["173158551784613738"] = {
            key = "173158551784613738",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173158551908113858"] = {
            key = "173158551908113858",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 1871.2952300537443, y = 285.7821157529615},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 100304,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1180521",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10035310,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple50-51",
              BlendInTime = 0,
              BlendOutTime = 0,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100327,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304},
                {TalkActorType = "Npc", TalkActorId = 100327}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173158551908113859"] = {
            key = "173158551908113859",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\159\186\229\156\176\229\164\150",
            pos = {x = 1316.9624060150377, y = -77.48872180451133},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1180517,
              GuideType = "M",
              GuidePointName = "Mechanism_1180517"
            }
          },
          ["173158551908113860"] = {
            key = "173158551908113860",
            type = "GoToRegionNode",
            name = "\229\137\141\229\190\128\231\167\152\229\175\134\229\159\186\229\156\176\229\164\150",
            pos = {x = 1066.9473684210525, y = 275.36842105263156},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_SecLeave"
            }
          },
          ["173158551908113861"] = {
            key = "173158551908113861",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1332.5263157894735, y = 291.44360902255664},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180521}
            }
          },
          ["173158551908113862"] = {
            key = "173158551908113862",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2326.290726817043, y = 292.34586466165456},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180521}
            }
          },
          ["17479146601691738042"] = {
            key = "17479146601691738042",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2651.5238095238096, y = 290.28571428571445},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180581}
            }
          },
          ["174851705879321216510"] = {
            key = "174851705879321216510",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1600, y = 298.6666666666667},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101103},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["174851709076421217544"] = {
            key = "174851709076421217544",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2100, y = 458.00000000000006},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["173319497547913036"] = {
      isStoryNode = true,
      key = "173319497547913036",
      type = "StoryNode",
      name = "\231\167\152\229\175\134\229\159\186\229\156\176",
      pos = {x = 1740.2285819443712, y = 287.89068825910925},
      propsData = {
        QuestId = 10030403,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030402",
        QuestDeatil = "QuestDesc_10030402",
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
            startQuest = "173319499091814141",
            startPort = "Out",
            endQuest = "173319499091814139",
            endPort = "In"
          },
          {
            startQuest = "173319497547913037",
            startPort = "QuestStart",
            endQuest = "173319499091814141",
            endPort = "In"
          },
          {
            startQuest = "173319499091814140",
            startPort = "Out",
            endQuest = "173319497547913040",
            endPort = "Success"
          },
          {
            startQuest = "17367650013894778918",
            startPort = "Out",
            endQuest = "17367650043144779080",
            endPort = "In"
          },
          {
            startQuest = "173319499091814141",
            startPort = "Out",
            endQuest = "17453958127524680668",
            endPort = "In"
          },
          {
            startQuest = "17471455806992734",
            startPort = "Out",
            endQuest = "17471456632855169",
            endPort = "In"
          },
          {
            startQuest = "173319499091814141",
            startPort = "Out",
            endQuest = "17471455806992734",
            endPort = "In"
          },
          {
            startQuest = "17471455806992734",
            startPort = "Out",
            endQuest = "17471456239003598",
            endPort = "In"
          },
          {
            startQuest = "17471456239003598",
            startPort = "Out",
            endQuest = "17471456856276074",
            endPort = "In"
          },
          {
            startQuest = "17367606070361918123",
            startPort = "Out",
            endQuest = "17471455947533029",
            endPort = "In"
          },
          {
            startQuest = "17471455947533029",
            startPort = "Out",
            endQuest = "17471457039817170",
            endPort = "In"
          },
          {
            startQuest = "17406417410512353775",
            startPort = "Out",
            endQuest = "17471455984413180",
            endPort = "In"
          },
          {
            startQuest = "17406417461232353972",
            startPort = "Out",
            endQuest = "173319499091814140",
            endPort = "In"
          },
          {
            startQuest = "17471455984413180",
            startPort = "Out",
            endQuest = "17471457153767848",
            endPort = "In"
          },
          {
            startQuest = "17471455947533029",
            startPort = "Out",
            endQuest = "17471457341348912",
            endPort = "In"
          },
          {
            startQuest = "17471457039817170",
            startPort = "Out",
            endQuest = "17471457408109251",
            endPort = "In"
          },
          {
            startQuest = "17471455984413180",
            startPort = "Out",
            endQuest = "174714576663210687",
            endPort = "In"
          },
          {
            startQuest = "17471457153767848",
            startPort = "Out",
            endQuest = "174714576663210688",
            endPort = "In"
          },
          {
            startQuest = "17471456239003598",
            startPort = "Out",
            endQuest = "17482426816602665",
            endPort = "In"
          },
          {
            startQuest = "17471457039817170",
            startPort = "Out",
            endQuest = "17482427161512948",
            endPort = "In"
          },
          {
            startQuest = "17471457153767848",
            startPort = "Out",
            endQuest = "17482427196483163",
            endPort = "In"
          },
          {
            startQuest = "17482427161512948",
            startPort = "Out",
            endQuest = "17482472478431732544",
            endPort = "In"
          },
          {
            startQuest = "17482426816602665",
            startPort = "Out",
            endQuest = "17482472558081732894",
            endPort = "In"
          },
          {
            startQuest = "17482427196483163",
            startPort = "Out",
            endQuest = "17482472578171732990",
            endPort = "In"
          },
          {
            startQuest = "17482472558081732894",
            startPort = "Out",
            endQuest = "17483345362732797",
            endPort = "In"
          },
          {
            startQuest = "17482472478431732544",
            startPort = "Out",
            endQuest = "17483345512773303",
            endPort = "In"
          },
          {
            startQuest = "17482472578171732990",
            startPort = "Out",
            endQuest = "17483345575433665",
            endPort = "In"
          },
          {
            startQuest = "17483345362732797",
            startPort = "Out",
            endQuest = "17367606070361918123",
            endPort = "In"
          },
          {
            startQuest = "17483345512773303",
            startPort = "Out",
            endQuest = "17406417410512353775",
            endPort = "In"
          },
          {
            startQuest = "17483345575433665",
            startPort = "Out",
            endQuest = "17406417461232353972",
            endPort = "In"
          }
        },
        nodeData = {
          ["173319497547913037"] = {
            key = "173319497547913037",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173319497547913040"] = {
            key = "173319497547913040",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["173319497547913043"] = {
            key = "173319497547913043",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173319499091814139"] = {
            key = "173319499091814139",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 1135.0816478928718, y = 34.35371984322116},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035301,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["173319499091814140"] = {
            key = "173319499091814140",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 2794.287459728093, y = 1208.60216250972},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035306,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple33_49",
              BlendInTime = 0,
              BlendOutTime = 0,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173319499091814141"] = {
            key = "173319499091814141",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\159\186\229\156\176\229\134\133",
            pos = {x = 1155.4477638718336, y = 288.3783329494105},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1940011,
              GuideType = "M",
              GuidePointName = "Mechanism_1940011"
            }
          },
          ["17367606070361918123"] = {
            key = "17367606070361918123",
            type = "TalkNode",
            name = "\232\176\131\233\162\145\229\144\142\229\188\128\232\189\166",
            pos = {x = 2094.908745008301, y = 275.9209584062457},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035303,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17367650013894778918"] = {
            key = "17367650013894778918",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 710.0852155965364, y = -346.6966886525776},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "cp2sec02tiaopin",
              UnitId = -1
            }
          },
          ["17367650043144779080"] = {
            key = "17367650043144779080",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 1018.5852155965364, y = -387.6966886525776},
            propsData = {
              SendMessage = "",
              FinishCondition = "cp2sec02tiaopinfinish"
            }
          },
          ["17406417410512353775"] = {
            key = "17406417410512353775",
            type = "TalkNode",
            name = "\232\176\131\233\162\145\229\144\142\229\188\128\232\189\166",
            pos = {x = 2098.588235294118, y = 743.6470588235294},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035304,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17406417461232353972"] = {
            key = "17406417461232353972",
            type = "TalkNode",
            name = "\232\176\131\233\162\145\229\144\142\229\188\128\232\189\166",
            pos = {x = 2102.117647058824, y = 1219.4117647058824},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035305,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17453958127524680668"] = {
            key = "17453958127524680668",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1152.4705882352941, y = 469.764705882353},
            propsData = {
              NewDescription = "QuestName_10030403",
              NewDetail = "QuestDesc_10030403",
              SubTaskTargetIndex = 0
            }
          },
          ["17471455806992734"] = {
            key = "17471455806992734",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1436.3144257703086, y = 298.95187165775394},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1940023}
            }
          },
          ["17471455947533029"] = {
            key = "17471455947533029",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1456.3144257703086, y = 767.7754010695186},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1940024}
            }
          },
          ["17471455984413180"] = {
            key = "17471455984413180",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1445.726190476191, y = 1261.893048128342},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1940025}
            }
          },
          ["17471456239003598"] = {
            key = "17471456239003598",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1782.1967787114845, y = 275.4224598930481},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1940023,
              StateId = 572,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17471456632855169"] = {
            key = "17471456632855169",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1448.0791316526615, y = 50.71657754010702},
            propsData = {
              IsShow = true,
              GuideType = "M",
              GuideName = "Mechanism_TiaoPin_1940023"
            }
          },
          ["17471456856276074"] = {
            key = "17471456856276074",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1753.961484593838, y = 45.42245989304815},
            propsData = {
              IsShow = false,
              GuideType = "M",
              GuideName = "Mechanism_TiaoPin_1940023"
            }
          },
          ["17471457039817170"] = {
            key = "17471457039817170",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1777.4908963585438, y = 750.1283422459893},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1940024,
              StateId = 572,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17471457153767848"] = {
            key = "17471457153767848",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1773.9614845938381, y = 1239.5401069518716},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1940025,
              StateId = 572,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17471457341348912"] = {
            key = "17471457341348912",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1438.6673669467789, y = 479.5401069518717},
            propsData = {
              IsShow = true,
              GuideType = "M",
              GuideName = "Mechanism_TiaoPin_1940024"
            }
          },
          ["17471457408109251"] = {
            key = "17471457408109251",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1772.7850140056025, y = 480.7165775401071},
            propsData = {
              IsShow = false,
              GuideType = "M",
              GuideName = "Mechanism_TiaoPin_1940024"
            }
          },
          ["174714576663210687"] = {
            key = "174714576663210687",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1450.4320728291318, y = 975.422459893048},
            propsData = {
              IsShow = true,
              GuideType = "M",
              GuideName = "Mechanism_TiaoPin_1940025"
            }
          },
          ["174714576663210688"] = {
            key = "174714576663210688",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1784.5497198879555, y = 977.7754010695187},
            propsData = {
              IsShow = false,
              GuideType = "M",
              GuideName = "Mechanism_TiaoPin_1940025"
            }
          },
          ["17482426816602665"] = {
            key = "17482426816602665",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2123.6470588235293, y = 41.48529411764709},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 1,
              SoundPath = "event:/sfx/common/story/02/clue_cd1",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101108},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["17482427161512948"] = {
            key = "17482427161512948",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2090.7058823529414, y = 487.9558823529412},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 1,
              SoundPath = "event:/sfx/common/story/02/clue_cd2",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101108},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["17482427196483163"] = {
            key = "17482427196483163",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2102.3970588235293, y = 978.5441176470588},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 1,
              SoundPath = "event:/sfx/common/story/02/clue_cd3",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101108},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["17482472478431732544"] = {
            key = "17482472478431732544",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2423.6470588235297, y = 487.36764705882365},
            propsData = {WaitTime = 5}
          },
          ["17482472558081732894"] = {
            key = "17482472558081732894",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2424.823529411765, y = 36.191176470588374},
            propsData = {WaitTime = 5}
          },
          ["17482472578171732990"] = {
            key = "17482472578171732990",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2436.5882352941176, y = 973.8382352941177},
            propsData = {WaitTime = 5}
          },
          ["17483345362732797"] = {
            key = "17483345362732797",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2421.3970588235297, y = 162.88235294117658},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 1
            }
          },
          ["17483345512773303"] = {
            key = "17483345512773303",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2422.5, y = 610.9705882352939},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 1
            }
          },
          ["17483345575433665"] = {
            key = "17483345575433665",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2436.838235294118, y = 1100.6029411764703},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 1
            }
          }
        },
        commentData = {}
      }
    },
    ["17410579739793610"] = {
      isStoryNode = true,
      key = "17410579739793610",
      type = "StoryNode",
      name = "\231\167\152\229\175\134\229\159\186\229\156\176\229\164\150",
      pos = {x = 2066.4929971988795, y = 493.8162931839403},
      propsData = {
        QuestId = 10030405,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_1003plus20",
        QuestDeatil = "QuestDesc_1003plus20",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
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
            startQuest = "17410579739793615",
            startPort = "QuestStart",
            endQuest = "17410579739793625",
            endPort = "In"
          },
          {
            startQuest = "17410579739793627",
            startPort = "Fail",
            endQuest = "17455676803549291",
            endPort = "In"
          },
          {
            startQuest = "17410579739793627",
            startPort = "PassiveFail",
            endQuest = "17455676841859385",
            endPort = "In"
          },
          {
            startQuest = "17455676803549291",
            startPort = "Out",
            endQuest = "17410579739793617",
            endPort = "Fail"
          },
          {
            startQuest = "17455676841859385",
            startPort = "Out",
            endQuest = "17410579739793617",
            endPort = "Fail"
          },
          {
            startQuest = "17410579739793627",
            startPort = "Success",
            endQuest = "174851716764521218491",
            endPort = "In"
          },
          {
            startQuest = "174851716764521218491",
            startPort = "Out",
            endQuest = "17410579739793624",
            endPort = "In"
          },
          {
            startQuest = "17410579739793624",
            startPort = "Out",
            endQuest = "174851722915221219869",
            endPort = "In"
          },
          {
            startQuest = "174851722915221219869",
            startPort = "Out",
            endQuest = "17410579739793616",
            endPort = "Success"
          },
          {
            startQuest = "17410579739793625",
            startPort = "Out",
            endQuest = "17491996595122580",
            endPort = "In"
          },
          {
            startQuest = "17491996595122580",
            startPort = "Out",
            endQuest = "17410579739793621",
            endPort = "In"
          },
          {
            startQuest = "17410579739793621",
            startPort = "Out",
            endQuest = "17491996942103113",
            endPort = "In"
          },
          {
            startQuest = "17491996942103113",
            startPort = "Out",
            endQuest = "17410579739793627",
            endPort = "In"
          }
        },
        nodeData = {
          ["17410579739793615"] = {
            key = "17410579739793615",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 233.68421052631595, y = 307.36842105263156},
            propsData = {ModeType = 0}
          },
          ["17410579739793616"] = {
            key = "17410579739793616",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2948, y = 288.00000000000006},
            propsData = {
              ModeType = 1,
              Id = 103201,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17410579739793617"] = {
            key = "17410579739793617",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3002.5, y = 646.25},
            propsData = {}
          },
          ["17410579739793621"] = {
            key = "17410579739793621",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1176.140350877193, y = 297.2982456140355},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180581}
            }
          },
          ["17410579739793622"] = {
            key = "17410579739793622",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1819.3026315789475, y = 1151.3815789473688},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180521}
            }
          },
          ["17410579739793624"] = {
            key = "17410579739793624",
            type = "TalkNode",
            name = "\231\171\153\230\161\169",
            pos = {x = 2358.2941176470586, y = 276.19117647058823},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035407,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple52_56-57",
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100327,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304},
                {TalkActorType = "Npc", TalkActorId = 100327}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17410579739793625"] = {
            key = "17410579739793625",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 647.6891124871003, y = 302.1527347781218},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1180565,
              GuideType = "M",
              GuidePointName = "Mechanism_1180565"
            }
          },
          ["17410579739793626"] = {
            key = "17410579739793626",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 660.1424148606814, y = 34.179566563467496},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10035401,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17410579739793627"] = {
            key = "17410579739793627",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1719.909663865546, y = 267.26050420168036},
            propsData = {SpecialConfigId = 1045, BlackScreenImmediately = false}
          },
          ["17455676803549291"] = {
            key = "17455676803549291",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2357.25, y = 474.681818181818},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17455676841859385"] = {
            key = "17455676841859385",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2363.5, y = 672.181818181818},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "lise_50_ditou",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["174851716764521218491"] = {
            key = "174851716764521218491",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2068.4848484848485, y = 214.18181818181813},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0071_lise_secret",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101103},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["174851722915221219869"] = {
            key = "174851722915221219869",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2643.151515151515, y = 174.84848484848484},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17491996595122580"] = {
            key = "17491996595122580",
            type = "CommonBlackFadeInOutNode",
            name = "\233\128\154\231\148\168\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = 906, y = 292},
            propsData = {FadeTime = 0, FadeType = "FadeIn"}
          },
          ["17491996942103113"] = {
            key = "17491996942103113",
            type = "CommonBlackFadeInOutNode",
            name = "\233\128\154\231\148\168\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = 1444, y = 280},
            propsData = {FadeTime = 0, FadeType = "FadeOut"}
          }
        },
        commentData = {}
      }
    },
    ["1750248151252947485"] = {
      isStoryNode = true,
      key = "1750248151252947485",
      type = "StoryNode",
      name = "\228\186\140\230\172\161\228\184\139\230\176\180\233\129\147",
      pos = {x = 832.3809523809524, y = 294.95238095238096},
      propsData = {
        QuestId = 10030499,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030303",
        QuestDeatil = "QuestDesc_10030303",
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
            startQuest = "1750248151252947490",
            startPort = "QuestStart",
            endQuest = "1750248151252947494",
            endPort = "In"
          },
          {
            startQuest = "1750248151252947493",
            startPort = "Fail",
            endQuest = "1750248151252947495",
            endPort = "In"
          },
          {
            startQuest = "1750248151252947493",
            startPort = "PassiveFail",
            endQuest = "1750248151253947496",
            endPort = "In"
          },
          {
            startQuest = "1750248151252947495",
            startPort = "Out",
            endQuest = "1750248151252947492",
            endPort = "Fail"
          },
          {
            startQuest = "1750248151253947496",
            startPort = "Out",
            endQuest = "1750248151252947492",
            endPort = "Fail"
          },
          {
            startQuest = "1750248151252947490",
            startPort = "QuestStart",
            endQuest = "1750248151253947497",
            endPort = "In"
          },
          {
            startQuest = "1750248151252947493",
            startPort = "Success",
            endQuest = "1750248151252947491",
            endPort = "Success"
          },
          {
            startQuest = "1750248151252947494",
            startPort = "Out",
            endQuest = "1750248151252947493",
            endPort = "In"
          }
        },
        nodeData = {
          ["1750248151252947490"] = {
            key = "1750248151252947490",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1750248151252947491"] = {
            key = "1750248151252947491",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2600, y = 309.6},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1750248151252947492"] = {
            key = "1750248151252947492",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1750248151252947493"] = {
            key = "1750248151252947493",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1688, y = 314},
            propsData = {SpecialConfigId = 1044, BlackScreenImmediately = false}
          },
          ["1750248151252947494"] = {
            key = "1750248151252947494",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1170, y = 312},
            propsData = {
              RegionType = 2,
              IsEnter = "Enter",
              RegionId = 1017,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_Sew1_2_IcelakeCity"
            }
          },
          ["1750248151252947495"] = {
            key = "1750248151252947495",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2108, y = 418},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1750248151253947496"] = {
            key = "1750248151253947496",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2100, y = 606},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "TargetPoint_Sew1_2_IcelakeCity",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["1750248151253947497"] = {
            key = "1750248151253947497",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 1244, y = 600},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["1750315473786961225"] = {
      isStoryNode = true,
      key = "1750315473786961225",
      type = "StoryNode",
      name = "\229\146\140\233\152\159\233\149\191\230\142\165\229\164\180+\233\146\147\233\177\188",
      pos = {x = 524.2222222222222, y = 294.8888888888889},
      propsData = {
        QuestId = 10030498,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030302",
        QuestDeatil = "QuestDesc_10030302",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
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
            startQuest = "1750315473786961233",
            startPort = "Success",
            endQuest = "1750315473787961237",
            endPort = "In"
          },
          {
            startQuest = "1750315473787961237",
            startPort = "Out",
            endQuest = "1750315473786961231",
            endPort = "Success"
          },
          {
            startQuest = "1750315473786961234",
            startPort = "Out",
            endQuest = "1750315473787961238",
            endPort = "Stop"
          },
          {
            startQuest = "1750315473787961238",
            startPort = "Out",
            endQuest = "1750315473786961234",
            endPort = "Stop"
          },
          {
            startQuest = "1750315473786961235",
            startPort = "Out",
            endQuest = "1750315473786961232",
            endPort = "Fail"
          },
          {
            startQuest = "1750315473786961233",
            startPort = "Fail",
            endQuest = "1750315473786961235",
            endPort = "In"
          },
          {
            startQuest = "1750315473787961238",
            startPort = "Out",
            endQuest = "1750315473787961239",
            endPort = "In"
          },
          {
            startQuest = "1750315473786961234",
            startPort = "Out",
            endQuest = "1750315473787961240",
            endPort = "In"
          },
          {
            startQuest = "1750315473786961230",
            startPort = "QuestStart",
            endQuest = "1750315473787961241",
            endPort = "In"
          },
          {
            startQuest = "1750315473786961230",
            startPort = "QuestStart",
            endQuest = "1750315473787961242",
            endPort = "In"
          },
          {
            startQuest = "1750315473787961243",
            startPort = "Out",
            endQuest = "1750315473787961245",
            endPort = "In"
          },
          {
            startQuest = "1750315473787961245",
            startPort = "true",
            endQuest = "1750315473787961244",
            endPort = "In"
          },
          {
            startQuest = "1750315473787961244",
            startPort = "Out",
            endQuest = "1750315473787961246",
            endPort = "In"
          },
          {
            startQuest = "1750315473787961246",
            startPort = "Out",
            endQuest = "1750315473787961247",
            endPort = "In"
          },
          {
            startQuest = "1750315473787961241",
            startPort = "Out",
            endQuest = "1750315473787961248",
            endPort = "In"
          },
          {
            startQuest = "1750315473787961242",
            startPort = "Out",
            endQuest = "1750315473787961249",
            endPort = "In"
          },
          {
            startQuest = "1750734178602989027",
            startPort = "Out",
            endQuest = "1750315473787961243",
            endPort = "In"
          },
          {
            startQuest = "1750315473787961242",
            startPort = "Out",
            endQuest = "17524825660696498",
            endPort = "In"
          },
          {
            startQuest = "17524825660696498",
            startPort = "Out",
            endQuest = "1750315473786961233",
            endPort = "In"
          },
          {
            startQuest = "1750315473787961242",
            startPort = "Out",
            endQuest = "17568184944636245",
            endPort = "In"
          },
          {
            startQuest = "1750315473786961233",
            startPort = "PassiveFail",
            endQuest = "175706667653916153",
            endPort = "In"
          },
          {
            startQuest = "175706667653916153",
            startPort = "Out",
            endQuest = "1750315473786961232",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1750315473786961230"] = {
            key = "1750315473786961230",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -5.238095238095099, y = 166.66666666666663},
            propsData = {ModeType = 0}
          },
          ["1750315473786961231"] = {
            key = "1750315473786961231",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2809, y = 237.10000000000002},
            propsData = {ModeType = 0}
          },
          ["1750315473786961232"] = {
            key = "1750315473786961232",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2794.375, y = 493.75},
            propsData = {}
          },
          ["1750315473786961233"] = {
            key = "1750315473786961233",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1395.7554474510994, y = 168.6113886113886},
            propsData = {SpecialConfigId = 1043, BlackScreenImmediately = false}
          },
          ["1750315473786961234"] = {
            key = "1750315473786961234",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1421.6210229455114, y = 726.4153940688466},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "M",
              GuideName = "Mechanism_1180515"
            }
          },
          ["1750315473786961235"] = {
            key = "1750315473786961235",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2143.265120844068, y = 229.71825542878173},
            propsData = {
              ModeType = 1,
              Id = 101110,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1750315473787961237"] = {
            key = "1750315473787961237",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2151.3935460824005, y = 95.39658522591958},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191375}
            }
          },
          ["1750315473787961238"] = {
            key = "1750315473787961238",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1409.5761627657575, y = 918.0272698148085},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = true,
              GuideType = "M",
              GuideName = "Mechanism_1180515"
            }
          },
          ["1750315473787961239"] = {
            key = "1750315473787961239",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1715.2974650825909, y = 928.8120098818035},
            propsData = {WaitTime = 0.1}
          },
          ["1750315473787961240"] = {
            key = "1750315473787961240",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1716.8359266210527, y = 764.9658560356498},
            propsData = {WaitTime = 0.1}
          },
          ["1750315473787961241"] = {
            key = "1750315473787961241",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 261.7142857142859, y = 531.2380952380953},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          },
          ["1750315473787961242"] = {
            key = "1750315473787961242",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 715.3813241935972, y = 164.332461916533},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "N",
              GuideName = "Npc_1191375"
            }
          },
          ["1750315473787961243"] = {
            key = "1750315473787961243",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1054.8124284798982, y = -335.9263004713012},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200022,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_1191375",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10034401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "cp2fixsimple35_new",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "BlendOut",
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100304,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200022,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100304},
                {TalkActorType = "Npc", TalkActorId = 200022}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1750315473787961244"] = {
            key = "1750315473787961244",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1083.4290908815228, y = -597.0281583769347},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/Chapter02/cp2UIopen04",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
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
          },
          ["1750315473787961245"] = {
            key = "1750315473787961245",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = 1361.024255156608, y = -339.58594346829614},
            propsData = {
              FunctionName = "Equal",
              VarName = "icl100303bf",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["1750315473787961246"] = {
            key = "1750315473787961246",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 1331.690921823275, y = -574.6335625159151},
            propsData = {
              VarName = "icl100303bf",
              VarValue = 1
            }
          },
          ["1750315473787961247"] = {
            key = "1750315473787961247",
            type = "PrintVarNode",
            name = "\230\137\147\229\141\176\229\143\152\233\135\143\229\128\188",
            pos = {x = 1572.6433027756557, y = -576.538324420677},
            propsData = {
              VarName = "icl100303bf"
            }
          },
          ["1750315473787961248"] = {
            key = "1750315473787961248",
            type = "AuConditionNode",
            name = "\233\159\179\233\162\145\230\157\161\228\187\182\232\138\130\231\130\185",
            pos = {x = 590, y = 532},
            propsData = {
              ActionType = 0,
              Condition = "cp2_jieyan",
              SaveToServer = true
            }
          },
          ["1750315473787961249"] = {
            key = "1750315473787961249",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 695.3333333333333, y = -60},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["1750734178602989027"] = {
            key = "1750734178602989027",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 799.3333333333334, y = -337.3333333333332},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191375}
            }
          },
          ["17524825660696498"] = {
            key = "17524825660696498",
            type = "AtmosphereNpcHideNode",
            name = "\230\176\155\229\155\180NPC\230\152\190\231\164\186/\233\154\144\232\151\143\232\138\130\231\130\185",
            pos = {x = 1059.6470588235293, y = 77.7058823529411},
            propsData = {
              IsHide = true,
              AtmosphereTagList = {
                "cp2iclsphide"
              }
            }
          },
          ["17568184944636245"] = {
            key = "17568184944636245",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1052.1634704253627, y = 235.83937228781676},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191375}
            }
          },
          ["175706667653916153"] = {
            key = "175706667653916153",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2155.1515567765573, y = 396.00137362637383},
            propsData = {
              ModeType = 1,
              Id = 101110,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
