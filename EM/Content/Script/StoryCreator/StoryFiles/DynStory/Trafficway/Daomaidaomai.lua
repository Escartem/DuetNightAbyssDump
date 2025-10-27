return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17216306425401",
      startPort = "StoryStart",
      endStory = "17217269355792905",
      endPort = "In"
    },
    {
      startStory = "17217269355792905",
      startPort = "Success",
      endStory = "17216306425405",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17216306425401"] = {
      isStoryNode = true,
      key = "17216306425401",
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
    ["17216306425405"] = {
      isStoryNode = true,
      key = "17216306425405",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1656.6071114240447, y = 260.4919908466819},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17217269355792905"] = {
      isStoryNode = true,
      key = "17217269355792905",
      type = "StoryNode",
      name = "\230\156\172\229\156\176\229\149\134\228\186\186\229\188\128\229\144\175\229\175\185\232\175\157",
      pos = {x = 1178.8838616189303, y = 275.64358010410626},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_TrafficwayDaomaidaomai_Des",
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
        bIsDynamicEvent = true,
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
            startQuest = "17388976599751100",
            startPort = "Out",
            endQuest = "17388976599761101",
            endPort = "In"
          },
          {
            startQuest = "17388976599771107",
            startPort = "Out",
            endQuest = "17388976599761103",
            endPort = "In"
          },
          {
            startQuest = "17388976599771108",
            startPort = "Out",
            endQuest = "17388976599771105",
            endPort = "In"
          },
          {
            startQuest = "17388976599751098",
            startPort = "Out",
            endQuest = "17388976599751100",
            endPort = "In"
          },
          {
            startQuest = "17388976599751098",
            startPort = "Out",
            endQuest = "17388976599771111",
            endPort = "In"
          },
          {
            startQuest = "17388976599771111",
            startPort = "Out",
            endQuest = "17388976599761102",
            endPort = "In"
          },
          {
            startQuest = "17388976599761101",
            startPort = "Out",
            endQuest = "17388976599761103",
            endPort = "In"
          },
          {
            startQuest = "17388976599761101",
            startPort = "Out",
            endQuest = "17388976599771105",
            endPort = "In"
          },
          {
            startQuest = "17388976599771104",
            startPort = "Out",
            endQuest = "17217269355792909",
            endPort = "Success"
          },
          {
            startQuest = "17388976599771106",
            startPort = "Out",
            endQuest = "17217269355792909",
            endPort = "Success"
          },
          {
            startQuest = "17217269355792906",
            startPort = "QuestStart",
            endQuest = "17388976599751098",
            endPort = "In"
          },
          {
            startQuest = "17217269355792906",
            startPort = "QuestStart",
            endQuest = "17388976599751099",
            endPort = "In"
          },
          {
            startQuest = "17388976599761103",
            startPort = "Option_2",
            endQuest = "17388976599771107",
            endPort = "In"
          },
          {
            startQuest = "17388976599761103",
            startPort = "Option_1",
            endQuest = "17388976599771104",
            endPort = "In"
          },
          {
            startQuest = "17388976599771105",
            startPort = "Option_1",
            endQuest = "17388976599771106",
            endPort = "In"
          },
          {
            startQuest = "17388976599771105",
            startPort = "Option_2",
            endQuest = "17388976599771108",
            endPort = "In"
          }
        },
        nodeData = {
          ["17217269355792906"] = {
            key = "17217269355792906",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 801.7647058823529, y = 188.8235294117647},
            propsData = {ModeType = 0}
          },
          ["17217269355792909"] = {
            key = "17217269355792909",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3934.5607287449393, y = 18.827935222672068},
            propsData = {ModeType = 0}
          },
          ["17217269355792912"] = {
            key = "17217269355792912",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2787, y = 1386.5},
            propsData = {}
          },
          ["17388976599751098"] = {
            key = "17388976599751098",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\149\134\228\186\186",
            pos = {x = 1292.8370277404479, y = 194.106554754155},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180416, 1180413}
            }
          },
          ["17388976599751099"] = {
            key = "17388976599751099",
            type = "TalkNode",
            name = "\230\151\129\231\153\189\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1287.5636628203433, y = 14.822366719966794},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001401,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17388976599751100"] = {
            key = "17388976599751100",
            type = "PickUpNode",
            name = "\233\135\135\233\155\134\228\186\164\228\186\146",
            pos = {x = 1680.246205132581, y = 339.4234774629206},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {
                1180417,
                1180418,
                1180419
              },
              QuestPickupId = -1,
              UnitId = 80013,
              UnitCount = 3,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["17388976599761101"] = {
            key = "17388976599761101",
            type = "TalkNode",
            name = "\233\135\135\233\155\134\229\174\140\230\136\144\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 2046.067275366695, y = 318.60835297388303},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001403,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17388976599761102"] = {
            key = "17388976599761102",
            type = "TalkNode",
            name = "\233\135\135\233\155\134\229\175\185\232\175\157",
            pos = {x = 2045.0320207027212, y = 125.31326931993237},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71001402,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17388976599761103"] = {
            key = "17388976599761103",
            type = "TalkNode",
            name = "\229\146\140\230\156\172\229\156\176\229\149\134\228\186\186\229\175\185\232\175\157",
            pos = {x = 2647.544985305854, y = 33.41582448816985},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818002,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1180416",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71001404,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = false,
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
              OptionType = "branch",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              BranchOptions = {"", ""},
              OverrideFailBlend = false
            }
          },
          ["17388976599771104"] = {
            key = "17388976599771104",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3399.659634644395, y = 23.435881610649403},
            propsData = {
              DialogueId = 71001406,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17388976599771105"] = {
            key = "17388976599771105",
            type = "TalkNode",
            name = "\229\146\140\229\164\150\229\156\176\229\149\134\228\186\186\228\186\164\230\181\129",
            pos = {x = 2664.313436649311, y = 349.03542434070437},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818003,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1180413",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71001405,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = false,
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
              OptionType = "branch",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              BranchOptions = {"", ""},
              OverrideFailBlend = false
            }
          },
          ["17388976599771106"] = {
            key = "17388976599771106",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3401.4363371796567, y = 350.3152250099449},
            propsData = {
              DialogueId = 71001407,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17388976599771107"] = {
            key = "17388976599771107",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2649.058864293314, y = 228.48214285714266},
            propsData = {WaitTime = 0.5}
          },
          ["17388976599771108"] = {
            key = "17388976599771108",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2678.969578579028, y = 549.375},
            propsData = {WaitTime = 0.5}
          },
          ["17388976599771111"] = {
            key = "17388976599771111",
            type = "PickUpNode",
            name = "\228\184\142\231\137\169\229\147\1291\232\191\155\232\161\140\228\186\164\228\186\146",
            pos = {x = 1697.1603933713914, y = 150.365325077399},
            propsData = {
              bActiveEnable = false,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 80013,
              UnitCount = 1,
              bGuideUIEnable = false,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
