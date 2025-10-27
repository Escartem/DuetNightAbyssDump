return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17413419832772414667",
      startPort = "StoryStart",
      endStory = "17413419832772414669",
      endPort = "In"
    },
    {
      startStory = "17413419832772414669",
      startPort = "Success",
      endStory = "17413419832772414668",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17413419832772414667"] = {
      isStoryNode = true,
      key = "17413419832772414667",
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
    ["17413419832772414668"] = {
      isStoryNode = true,
      key = "17413419832772414668",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2800, y = 300},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17413419832772414669"] = {
      isStoryNode = true,
      key = "17413419832772414669",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147\230\189\152\231\165\158\229\175\185\232\175\157",
      pos = {x = 1522, y = 318},
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
            startQuest = "17413419832772414674",
            startPort = "Branch_1",
            endQuest = "17413419832772414673",
            endPort = "In"
          },
          {
            startQuest = "17413419832772414673",
            startPort = "Out",
            endQuest = "17413419832772414671",
            endPort = "Success"
          },
          {
            startQuest = "17550711522722428179",
            startPort = "Out",
            endQuest = "17413419832772414671",
            endPort = "Success"
          },
          {
            startQuest = "17550711787122428405",
            startPort = "Out",
            endQuest = "17413419832772414671",
            endPort = "Success"
          },
          {
            startQuest = "17550711815902428463",
            startPort = "Out",
            endQuest = "17413419832772414671",
            endPort = "Success"
          },
          {
            startQuest = "17550711874512428607",
            startPort = "Out",
            endQuest = "17413419832772414671",
            endPort = "Success"
          },
          {
            startQuest = "17550711911362428716",
            startPort = "Out",
            endQuest = "17413419832772414671",
            endPort = "Success"
          },
          {
            startQuest = "17413419832772414674",
            startPort = "Branch_7",
            endQuest = "17556742538611171",
            endPort = "In"
          },
          {
            startQuest = "17556742538611171",
            startPort = "Out",
            endQuest = "17413419832772414671",
            endPort = "Success"
          },
          {
            startQuest = "17413419832772414674",
            startPort = "Branch_2",
            endQuest = "17556089157051841029",
            endPort = "In"
          },
          {
            startQuest = "17556089157051841029",
            startPort = "Out",
            endQuest = "17550711522722428179",
            endPort = "In"
          },
          {
            startQuest = "17413419832772414670",
            startPort = "QuestStart",
            endQuest = "17413419832772414674",
            endPort = "In"
          },
          {
            startQuest = "17557779232111351",
            startPort = "Out",
            endQuest = "17550711911362428716",
            endPort = "In"
          },
          {
            startQuest = "17413419832772414674",
            startPort = "Branch_6",
            endQuest = "17557779232111351",
            endPort = "In"
          },
          {
            startQuest = "17413419832772414674",
            startPort = "Branch_4",
            endQuest = "17550711815902428463",
            endPort = "In"
          },
          {
            startQuest = "17413419832772414674",
            startPort = "Branch_3",
            endQuest = "17576722682701881",
            endPort = "In"
          },
          {
            startQuest = "17576722682701881",
            startPort = "Out",
            endQuest = "17550711787122428405",
            endPort = "In"
          },
          {
            startQuest = "17413419832772414674",
            startPort = "Branch_5",
            endQuest = "17550711874512428607",
            endPort = "In"
          }
        },
        nodeData = {
          ["17413419832772414670"] = {
            key = "17413419832772414670",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 489.5959595959596, y = 416.12121212121224},
            propsData = {ModeType = 0}
          },
          ["17413419832772414671"] = {
            key = "17413419832772414671",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3126.138785699426, y = 648.8755931330301},
            propsData = {ModeType = 0}
          },
          ["17413419832772414672"] = {
            key = "17413419832772414672",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3138.909090909091, y = 145.63636363636363},
            propsData = {}
          },
          ["17413419832772414673"] = {
            key = "17413419832772414673",
            type = "TalkNode",
            name = "\228\190\139\229\173\144\239\188\140\228\189\160\228\184\141\232\175\165\229\156\168\230\184\184\230\136\143\229\134\133\231\156\139\229\136\176\232\191\153\228\184\170\231\154\132",
            pos = {x = 1647.3923444976078, y = -546.5765550239234},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72000001,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_72000001",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 820000,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17413419832772414674"] = {
            key = "17413419832772414674",
            type = "BranchTriggerNode",
            name = "\232\167\166\229\143\145\229\136\134\230\148\175\232\138\130\231\130\185",
            pos = {x = 1076, y = 318},
            propsData = {
              Branches = {
                720000,
                720030,
                720043,
                720044,
                720045,
                720046,
                720029
              }
            }
          },
          ["17550711522722428179"] = {
            key = "17550711522722428179",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1839.5, y = -93},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72003001,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720030",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 820000,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 820000},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17550711787122428405"] = {
            key = "17550711787122428405",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1978, y = 169.5},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72004301,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720043",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 820000,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 820000},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17550711815902428463"] = {
            key = "17550711815902428463",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1995, y = 382.5},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72004401,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720044",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 820000,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 820000},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17550711874512428607"] = {
            key = "17550711874512428607",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2001, y = 621},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72004501,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720045",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 820000,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 820000},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17550711911362428716"] = {
            key = "17550711911362428716",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1935, y = 934},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72004601,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720046",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 820000,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 820000},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17556089157051841029"] = {
            key = "17556089157051841029",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1532.5, y = -105},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 72999999,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = false,
              ShowSkipButton = false,
              ShowAutoPlayButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
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
          },
          ["17556742538611171"] = {
            key = "17556742538611171",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1742.3529411764707, y = -258.3021390374331},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72002901,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720030",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 820000,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 820000},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17557779232111351"] = {
            key = "17557779232111351",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1585, y = 921},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 72999999,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = false,
              ShowSkipButton = false,
              ShowAutoPlayButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
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
          },
          ["17576722682701881"] = {
            key = "17576722682701881",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1631, y = 184.5},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 72999999,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = false,
              ShowSkipButton = false,
              ShowAutoPlayButton = false,
              ShowReviewButton = false,
              ShowWikiButton = false,
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
