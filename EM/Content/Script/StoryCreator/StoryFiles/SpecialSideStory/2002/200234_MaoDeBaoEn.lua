return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1751455504453318888",
      startPort = "Success",
      endStory = "1751456252406954148",
      endPort = "In"
    },
    {
      startStory = "1751456252406954148",
      startPort = "Success",
      endStory = "1751455499942318789",
      endPort = "StoryEnd"
    },
    {
      startStory = "1751455499942318786",
      startPort = "StoryStart",
      endStory = "1751455504453318888",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1751455499942318786"] = {
      isStoryNode = true,
      key = "1751455499942318786",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 300},
      propsData = {QuestChainId = 200234},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1751455499942318789"] = {
      isStoryNode = true,
      key = "1751455499942318789",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2152.0714285714284, y = 358.35714285714283},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1751455504453318888"] = {
      isStoryNode = true,
      key = "1751455504453318888",
      type = "StoryNode",
      name = "\228\184\142\233\135\142\231\140\171\229\175\185\232\175\157",
      pos = {x = 1278.820197044335, y = 276.2857142857143},
      propsData = {
        QuestId = 20023401,
        QuestDescriptionComment = "\228\184\142\233\135\142\231\140\171\229\175\185\232\175\157",
        QuestDescription = "Description_200234_1",
        QuestDeatil = "Content_200234_1",
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
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_gududeyemao1_1191718"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17514566109601907119",
            startPort = "Out",
            endQuest = "1751455504453318892",
            endPort = "Success"
          },
          {
            startQuest = "17514566109601907119",
            startPort = "Fail",
            endQuest = "1751455504453318895",
            endPort = "Fail"
          },
          {
            startQuest = "1751455504453318889",
            startPort = "QuestStart",
            endQuest = "1752838482204498",
            endPort = "In"
          },
          {
            startQuest = "1752838482204498",
            startPort = "Out",
            endQuest = "17514566109601907119",
            endPort = "In"
          }
        },
        nodeData = {
          ["1751455504453318889"] = {
            key = "1751455504453318889",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1131.578947368421, y = 494.2105263157895},
            propsData = {ModeType = 0}
          },
          ["1751455504453318892"] = {
            key = "1751455504453318892",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2004.1315789473683, y = 414.7105263157895},
            propsData = {ModeType = 0}
          },
          ["1751455504453318895"] = {
            key = "1751455504453318895",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1916.578947368421, y = 617.6578947368421},
            propsData = {}
          },
          ["17514566109601907119"] = {
            key = "17514566109601907119",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1484, y = 495.5},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700334,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_gududeyemao1_1191718",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51012101,
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
              HideMonsters = false,
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
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1752838482204498"] = {
            key = "1752838482204498",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1319.0714285714287, y = 623},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191718}
            }
          }
        },
        commentData = {}
      }
    },
    ["1751456252406954148"] = {
      isStoryNode = true,
      key = "1751456252406954148",
      type = "StoryNode",
      name = "\232\191\148\229\155\158\228\188\145\230\134\169\228\185\139\230\137\128\229\175\187\230\137\190\233\135\142\231\140\171",
      pos = {x = 1718.571428571429, y = 270.85714285714295},
      propsData = {
        QuestId = 20023402,
        QuestDescriptionComment = "\232\191\148\229\155\158\228\188\145\230\134\169\228\185\139\230\137\128\229\175\187\230\137\190\233\135\142\231\140\171",
        QuestDescription = "Description_200234_2",
        QuestDeatil = "Content_200234_2",
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
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_gududeyemao2_1191717"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1751538335109319775",
            startPort = "Out",
            endQuest = "1751538335109319772",
            endPort = "In"
          },
          {
            startQuest = "1751538335109319772",
            startPort = "Out",
            endQuest = "1751538335109319776",
            endPort = "In"
          },
          {
            startQuest = "1751538431768320807",
            startPort = "Out",
            endQuest = "1751538335109319775",
            endPort = "In"
          },
          {
            startQuest = "1751538335109319776",
            startPort = "Out",
            endQuest = "1751456252407954152",
            endPort = "Success"
          },
          {
            startQuest = "1751456252407954149",
            startPort = "QuestStart",
            endQuest = "1751538431768320807",
            endPort = "In"
          }
        },
        nodeData = {
          ["1751456252407954149"] = {
            key = "1751456252407954149",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1470.9565217391305, y = 792.9565217391305},
            propsData = {ModeType = 0}
          },
          ["1751456252407954152"] = {
            key = "1751456252407954152",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2702.6923076923076, y = 1007},
            propsData = {ModeType = 0}
          },
          ["1751456252407954155"] = {
            key = "1751456252407954155",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1751538335109319772"] = {
            key = "1751538335109319772",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2469.8565593981875, y = 708.9274475516295},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700335,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_gududeyemao2_1191717",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51012107,
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
              HideMonsters = false,
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
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1751538335109319775"] = {
            key = "1751538335109319775",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2214.775898549735, y = 735.1932241154134},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "\228\188\145\230\134\169\228\185\139\230\137\128\233\135\142\231\140\171",
              StaticCreatorIdList = {1191717}
            }
          },
          ["1751538335109319776"] = {
            key = "1751538335109319776",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2436.1626680832574, y = 1024.6110139868322},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "\228\188\145\230\134\169\228\185\139\230\137\128\233\135\142\231\140\171",
              StaticCreatorIdList = {1191717}
            }
          },
          ["1751538431768320807"] = {
            key = "1751538431768320807",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1865.2307692307693, y = 922.6923076923078},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "\233\135\142\231\140\1711",
              StaticCreatorIdList = {1191718}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
