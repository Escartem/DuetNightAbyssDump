return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630102364393677",
      startPort = "StoryStart",
      endStory = "1721630102364393679",
      endPort = "In"
    },
    {
      startStory = "1721630102364393679",
      startPort = "Success",
      endStory = "1721630102364393678",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630102364393677"] = {
      isStoryNode = true,
      key = "1721630102364393677",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 307.1428571428571, y = 298.57142857142856},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721630102364393678"] = {
      isStoryNode = true,
      key = "1721630102364393678",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1396.0389610389611, y = 324.54545454545456},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721630102364393679"] = {
      isStoryNode = true,
      key = "1721630102364393679",
      type = "StoryNode",
      name = "\229\164\132\229\134\179boss",
      pos = {x = 812.8129121874314, y = 288.1021406583454},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "\229\164\132\229\134\179boss",
        QuestDescription = "Description_110110_7",
        QuestDeatil = "Content_110110_7",
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
            startQuest = "1721630102364393686",
            startPort = "Out",
            endQuest = "1721630102364393684",
            endPort = "In"
          },
          {
            startQuest = "1721630102364393689",
            startPort = "Out",
            endQuest = "17229275564031212450",
            endPort = "In"
          },
          {
            startQuest = "17229275564031212450",
            startPort = "Out",
            endQuest = "1721630102364393683",
            endPort = "Fail"
          },
          {
            startQuest = "1721630102364393681",
            startPort = "QuestStart",
            endQuest = "17229280300911386819",
            endPort = "In"
          },
          {
            startQuest = "1721630102364393681",
            startPort = "QuestStart",
            endQuest = "1721630102364393689",
            endPort = "In"
          },
          {
            startQuest = "1721630102364393684",
            startPort = "Out",
            endQuest = "172595615489616008116",
            endPort = "In"
          },
          {
            startQuest = "172595615489616008116",
            startPort = "Out",
            endQuest = "1721630102364393688",
            endPort = "In"
          },
          {
            startQuest = "173165930994325794710",
            startPort = "Out",
            endQuest = "17283942605365339857",
            endPort = "In"
          },
          {
            startQuest = "17229280300911386819",
            startPort = "Out",
            endQuest = "173165930994325794710",
            endPort = "In"
          },
          {
            startQuest = "17283942605365339857",
            startPort = "Out",
            endQuest = "17229280300911386820",
            endPort = "In"
          },
          {
            startQuest = "17283942605365339857",
            startPort = "Out",
            endQuest = "1721630102364393686",
            endPort = "In"
          }
        },
        nodeData = {
          ["1721630102364393681"] = {
            key = "1721630102364393681",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1261.1644546029397, y = 312.5831778259342},
            propsData = {ModeType = 0}
          },
          ["1721630102364393682"] = {
            key = "1721630102364393682",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 494.8685387299547, y = 536.9093498977936},
            propsData = {ModeType = 0}
          },
          ["1721630102364393683"] = {
            key = "1721630102364393683",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 180.97450022268123, y = 769.979889770924},
            propsData = {}
          },
          ["1721630102364393684"] = {
            key = "1721630102364393684",
            type = "BossBattleFinishNode",
            name = "BOSS\230\136\152\230\136\144\229\138\159",
            pos = {x = -264.1183100314179, y = 514.5194348762483},
            propsData = {
              SendMessage = "",
              FinishCondition = "Lizhan_2_End"
            }
          },
          ["1721630102364393686"] = {
            key = "1721630102364393686",
            type = "BossBattleFinishNode",
            name = "BOSS\230\136\152\229\188\128\229\167\139",
            pos = {x = 227.81511304247263, y = 308.5822151139753},
            propsData = {
              SendMessage = "EX01CreateLizhan_2",
              FinishCondition = "BossLizhan_2_Created"
            }
          },
          ["1721630102364393688"] = {
            key = "1721630102364393688",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 233.14334894927887, y = 528.8210954163995},
            propsData = {}
          },
          ["1721630102364393689"] = {
            key = "1721630102364393689",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = -998.8993157489565, y = 764.707578245509},
            propsData = {}
          },
          ["17229275564031212450"] = {
            key = "17229275564031212450",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -401.64151055005306, y = 767.6102605559189},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "BossLizhan_2_Fail",
              UnitId = -1
            }
          },
          ["17229280300911386819"] = {
            key = "17229280300911386819",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-SC007-\231\167\189\229\133\189\229\134\141\228\184\180",
            pos = {x = -986.2626107550565, y = 311.19192101509725},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0102/OBT0102_SC007/SQ_OBT0102_SC007",
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["17229280300911386820"] = {
            key = "17229280300911386820",
            type = "TalkNode",
            name = "\233\152\191\231\147\166\229\176\148\232\175\180\229\176\143\229\191\131\231\130\185",
            pos = {x = 153.8642967338152, y = 81.10358462494798},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11012901,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["172595615489616008116"] = {
            key = "172595615489616008116",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -15.289277977648974, y = 523.2354973324186},
            propsData = {WaitTime = 5}
          },
          ["17283942605365339857"] = {
            key = "17283942605365339857",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = -273.93288080036467, y = 301.5351872203788},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt02/0060_boss_ex01_lizhanzhe_loop.0060_boss_ex01_lizhanzhe_loop'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {102102},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["173165930994325794710"] = {
            key = "173165930994325794710",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = -511.95995812486007, y = 306.5463628358364},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "BP_EX01BOSS02Start",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
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
