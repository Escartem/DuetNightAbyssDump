return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17340809745284505318",
      startPort = "Success",
      endStory = "17340809745284505317",
      endPort = "StoryEnd"
    },
    {
      startStory = "17340809745284505318",
      startPort = "Fail",
      endStory = "17340809745284505317",
      endPort = "StoryEnd"
    },
    {
      startStory = "17413348588609039302",
      startPort = "Success",
      endStory = "17340809745284505318",
      endPort = "In"
    },
    {
      startStory = "17413348588609039302",
      startPort = "Fail",
      endStory = "17340809745284505318",
      endPort = "In"
    },
    {
      startStory = "17340809745284505316",
      startPort = "StoryStart",
      endStory = "17340809745284505318",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17340809745284505316"] = {
      isStoryNode = true,
      key = "17340809745284505316",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 785, y = 309.54545454545456},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17340809745284505317"] = {
      isStoryNode = true,
      key = "17340809745284505317",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2094.5454545454545, y = 307.27272727272725},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17340809745284505318"] = {
      isStoryNode = true,
      key = "17340809745284505318",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1245.2727272727277, y = 291.8301435406699},
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
            startQuest = "17355527514592119820",
            startPort = "Out",
            endQuest = "17340809745284505321",
            endPort = "Fail"
          },
          {
            startQuest = "17412481272716606430",
            startPort = "Out",
            endQuest = "17340809745284505320",
            endPort = "Success"
          },
          {
            startQuest = "1742023807813264828",
            startPort = "Out",
            endQuest = "17340809745284505320",
            endPort = "Success"
          },
          {
            startQuest = "174564548082817118926",
            startPort = "Option_1",
            endQuest = "17340809745284505320",
            endPort = "Success"
          },
          {
            startQuest = "174564548082817118926",
            startPort = "Fail",
            endQuest = "17340809745284505320",
            endPort = "Success"
          },
          {
            startQuest = "174564548082917118927",
            startPort = "Out",
            endQuest = "17340809745284505320",
            endPort = "Success"
          },
          {
            startQuest = "17505140367488958453",
            startPort = "Out",
            endQuest = "17505140367488958452",
            endPort = "In"
          },
          {
            startQuest = "17505140367488958451",
            startPort = "Out",
            endQuest = "17505140367488958453",
            endPort = "In"
          },
          {
            startQuest = "17340809745284505319",
            startPort = "QuestStart",
            endQuest = "17505140367488958451",
            endPort = "In"
          },
          {
            startQuest = "17505140367488958452",
            startPort = "Out",
            endQuest = "17340809745284505320",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17340809745284505319"] = {
            key = "17340809745284505319",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17340809745284505320"] = {
            key = "17340809745284505320",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1917.3355308365983, y = 294.5},
            propsData = {ModeType = 0}
          },
          ["17340809745284505321"] = {
            key = "17340809745284505321",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1912.861111111111, y = 440.49999999999994},
            propsData = {}
          },
          ["17340809745284505322"] = {
            key = "17340809745284505322",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1071.798125937032, y = 11.788729370987483},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 7411482114,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 0,
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
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              PlusOptions = {
                {
                  OptionText = "7411482291",
                  PlusId = 1006,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "7411482292",
                  PlusId = 1008,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17355527514592119820"] = {
            key = "17355527514592119820",
            type = "TestPrintNode",
            name = "\230\181\139\232\175\149\230\137\147\229\141\176",
            pos = {x = 1497.1030734632684, y = 491.23038480759624},
            propsData = {Text = "tyx11111"}
          },
          ["17412481272716606430"] = {
            key = "17412481272716606430",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1381.744784750482, y = 8.957042907117795},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 20000509,
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
          ["1742023807813264828"] = {
            key = "1742023807813264828",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100116-\229\163\171\229\133\181\230\137\190\228\186\186-SC07",
            pos = {x = 1724.631355200052, y = -16.8087276416737},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC007/SQ_OBT0100_SC007_F",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100003,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100003},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["17454105169841407363"] = {
            key = "17454105169841407363",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = 773.75, y = 513},
            propsData = {QuestRoleId = 53010101, IsPlayFX = false}
          },
          ["174564548082817118926"] = {
            key = "174564548082817118926",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1439.041938424665, y = 187.0342484961687},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20000820,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_700004",
              BlendInTime = 0.5,
              BlendOutTime = 0,
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
              PlusOptions = {
                {
                  OptionText = "7411482291",
                  PlusId = 1006,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["174564548082917118927"] = {
            key = "174564548082917118927",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1263.1426751476884, y = 368.19385334810585},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 741148230,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_700004",
              BlendInTime = 0,
              BlendOutTime = 0,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 74114741,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 76000002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790019,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 74114741},
                {TalkActorType = "Npc", TalkActorId = 76000002},
                {TalkActorType = "Npc", TalkActorId = 790019}
              },
              OptionType = "check",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              CheckOptions = {},
              OverrideFailBlend = true,
              FailOutType = "FadeOut",
              FailOutTime = 10
            }
          },
          ["17505140367488958451"] = {
            key = "17505140367488958451",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1108.6808520828788, y = 593.5983720292725},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51004962,
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
          ["17505140367488958452"] = {
            key = "17505140367488958452",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1654.371779496069, y = 633.183690451425},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51004964,
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
          ["17505140367488958453"] = {
            key = "17505140367488958453",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1388.1745670974835, y = 656.6057832327855},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51004963,
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
          }
        },
        commentData = {}
      }
    },
    ["17413348588609039302"] = {
      isStoryNode = true,
      key = "17413348588609039302",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1285.0316205533597, y = 49.090909090909065},
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
            startQuest = "17413348588619039312",
            startPort = "Out",
            endQuest = "17413348588619039308",
            endPort = "Success"
          },
          {
            startQuest = "17413348588619039307",
            startPort = "QuestStart",
            endQuest = "17413348588619039312",
            endPort = "In"
          }
        },
        nodeData = {
          ["17413348588619039307"] = {
            key = "17413348588619039307",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17413348588619039308"] = {
            key = "17413348588619039308",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1917.5510480779776, y = 294.5},
            propsData = {ModeType = 0}
          },
          ["17413348588619039309"] = {
            key = "17413348588619039309",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1911.75, y = 440.49999999999994},
            propsData = {}
          },
          ["17413348588619039312"] = {
            key = "17413348588619039312",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1599.9642857142856, y = 244.16666666666663},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 741148229,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              SkipToOption = true,
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
