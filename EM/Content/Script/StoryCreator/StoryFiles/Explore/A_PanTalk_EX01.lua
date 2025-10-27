return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17325246788481",
      startPort = "StoryStart",
      endStory = "1732524755155156",
      endPort = "In"
    },
    {
      startStory = "1732524755155156",
      startPort = "Success",
      endStory = "17325246788495",
      endPort = "StoryEnd"
    },
    {
      startStory = "1732524755155156",
      startPort = "Fail",
      endStory = "17325246788495",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17325246788481"] = {
      isStoryNode = true,
      key = "17325246788481",
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
    ["17325246788495"] = {
      isStoryNode = true,
      key = "17325246788495",
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
    ["1732524755155156"] = {
      isStoryNode = true,
      key = "1732524755155156",
      type = "StoryNode",
      name = "\232\166\129\229\161\158\230\189\152\231\165\158\229\175\185\232\175\157",
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
            startQuest = "17407137124021047635",
            startPort = "Branch_1",
            endQuest = "1739350160105591",
            endPort = "In"
          },
          {
            startQuest = "1739350160105591",
            startPort = "Out",
            endQuest = "1732524755156164",
            endPort = "Success"
          },
          {
            startQuest = "17413379313361555276",
            startPort = "Out",
            endQuest = "1732524755156164",
            endPort = "Success"
          },
          {
            startQuest = "17413379313361555277",
            startPort = "Out",
            endQuest = "1732524755156164",
            endPort = "Success"
          },
          {
            startQuest = "17413379313361555278",
            startPort = "Out",
            endQuest = "1732524755156164",
            endPort = "Success"
          },
          {
            startQuest = "17413379313361555279",
            startPort = "Out",
            endQuest = "1732524755156164",
            endPort = "Success"
          },
          {
            startQuest = "17407137124021047635",
            startPort = "Branch_5",
            endQuest = "17413379313361555279",
            endPort = "In"
          },
          {
            startQuest = "17422021309451242",
            startPort = "Out",
            endQuest = "1732524755156164",
            endPort = "Success"
          },
          {
            startQuest = "17422021374301453",
            startPort = "Out",
            endQuest = "1732524755156164",
            endPort = "Success"
          },
          {
            startQuest = "17422021423411608",
            startPort = "Out",
            endQuest = "1732524755156164",
            endPort = "Success"
          },
          {
            startQuest = "17422022351522758",
            startPort = "Out",
            endQuest = "1732524755156164",
            endPort = "Success"
          },
          {
            startQuest = "17422021398941521",
            startPort = "Option_1",
            endQuest = "17430442110234174",
            endPort = "In"
          },
          {
            startQuest = "17422021398941521",
            startPort = "Option_2",
            endQuest = "17430443426745334",
            endPort = "In"
          },
          {
            startQuest = "17430443426745334",
            startPort = "Out",
            endQuest = "1732524755156171",
            endPort = "Fail"
          },
          {
            startQuest = "17430442110234174",
            startPort = "Out",
            endQuest = "17430651825531569638",
            endPort = "In"
          },
          {
            startQuest = "17430651825531569638",
            startPort = "Out",
            endQuest = "17430651746171569415",
            endPort = "In"
          },
          {
            startQuest = "17430651746171569415",
            startPort = "Out",
            endQuest = "1732524755156164",
            endPort = "Success"
          },
          {
            startQuest = "17436638857261847",
            startPort = "Out",
            endQuest = "1732524755156164",
            endPort = "Success"
          },
          {
            startQuest = "17436638857261846",
            startPort = "Out",
            endQuest = "1732524755156171",
            endPort = "Fail"
          },
          {
            startQuest = "17422021398941521",
            startPort = "Option_3",
            endQuest = "17430443426745334",
            endPort = "In"
          },
          {
            startQuest = "17436638857261845",
            startPort = "Option_3",
            endQuest = "17436638857261846",
            endPort = "In"
          },
          {
            startQuest = "1732524755155157",
            startPort = "QuestStart",
            endQuest = "17407137124021047635",
            endPort = "In"
          },
          {
            startQuest = "1755679643512311333",
            startPort = "Out",
            endQuest = "17422021309451242",
            endPort = "In"
          },
          {
            startQuest = "17407137124021047635",
            startPort = "Branch_6",
            endQuest = "1755679643512311333",
            endPort = "In"
          },
          {
            startQuest = "17407137124021047635",
            startPort = "Branch_2",
            endQuest = "17413379313361555276",
            endPort = "In"
          },
          {
            startQuest = "17555932714172631",
            startPort = "Out",
            endQuest = "17413379313361555277",
            endPort = "In"
          },
          {
            startQuest = "17407137124021047635",
            startPort = "Branch_3",
            endQuest = "17555932714172631",
            endPort = "In"
          },
          {
            startQuest = "1755679820129314891",
            startPort = "Out",
            endQuest = "17422021374301453",
            endPort = "In"
          },
          {
            startQuest = "1755679865757315803",
            startPort = "Out",
            endQuest = "17422021423411608",
            endPort = "In"
          },
          {
            startQuest = "1755679872530316007",
            startPort = "Out",
            endQuest = "17422022351522758",
            endPort = "In"
          },
          {
            startQuest = "17407137124021047635",
            startPort = "Branch_7",
            endQuest = "1755679820129314891",
            endPort = "In"
          },
          {
            startQuest = "17407137124021047635",
            startPort = "Branch_8",
            endQuest = "17422021398941521",
            endPort = "In"
          },
          {
            startQuest = "17407137124021047635",
            startPort = "Branch_9",
            endQuest = "1755679865757315803",
            endPort = "In"
          },
          {
            startQuest = "17407137124021047635",
            startPort = "Branch_10",
            endQuest = "1755679872530316007",
            endPort = "In"
          },
          {
            startQuest = "17407137124021047635",
            startPort = "Branch_11",
            endQuest = "17436638857261845",
            endPort = "In"
          },
          {
            startQuest = "17436638857261845",
            startPort = "Option_1",
            endQuest = "17436638857261847",
            endPort = "In"
          },
          {
            startQuest = "17436638857261845",
            startPort = "Option_2",
            endQuest = "17436638857261846",
            endPort = "In"
          },
          {
            startQuest = "17407137124021047635",
            startPort = "Branch_4",
            endQuest = "17413379313361555278",
            endPort = "In"
          }
        },
        nodeData = {
          ["1732524755155157"] = {
            key = "1732524755155157",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 235.27453102453103, y = 462.1569264069266},
            propsData = {ModeType = 0}
          },
          ["1732524755156164"] = {
            key = "1732524755156164",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3126.138785699426, y = 648.8755931330301},
            propsData = {ModeType = 0}
          },
          ["1732524755156171"] = {
            key = "1732524755156171",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3118.909090909091, y = 815.6363636363636},
            propsData = {}
          },
          ["1739350160105591"] = {
            key = "1739350160105591",
            type = "TalkNode",
            name = "\228\190\139\229\173\144\239\188\140\228\189\160\228\184\141\232\175\165\229\156\168\230\184\184\230\136\143\229\134\133\231\156\139\229\136\176\232\191\153\228\184\170\231\154\132",
            pos = {x = 1455.4698564593302, y = -803.4971291866032},
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
          ["17407137124021047635"] = {
            key = "17407137124021047635",
            type = "BranchTriggerNode",
            name = "\232\167\166\229\143\145\229\136\134\230\148\175\232\138\130\231\130\185",
            pos = {x = 1077.2, y = 318},
            propsData = {
              Branches = {
                720000,
                720006,
                720007,
                720008,
                720009,
                720031,
                720033,
                720034,
                720035,
                720036,
                720037
              }
            }
          },
          ["17413379313361555276"] = {
            key = "17413379313361555276",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1460.1499320632317, y = -648.9430557746348},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72000601,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720006",
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
          ["17413379313361555277"] = {
            key = "17413379313361555277",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1743.0307933072509, y = -494.9674576885103},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72000701,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720007",
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
          ["17413379313361555278"] = {
            key = "17413379313361555278",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1745.8886414088067, y = -309.7441794412045},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72000801,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720008",
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
          ["17413379313361555279"] = {
            key = "17413379313361555279",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1443.0501640966445, y = -143.72704440233025},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72000901,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720009",
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
          ["17422021309451242"] = {
            key = "17422021309451242",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1789.8484673221521, y = 38.101792943898175},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72003101,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720031",
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
          ["17422021374301453"] = {
            key = "17422021374301453",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1807.2486986697513, y = 377.1012145748989},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72003301,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720033",
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
          ["17422021398941521"] = {
            key = "17422021398941521",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1467.8719555298503, y = 511.4891073838444},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72003401,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720034",
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
              NormalOptions = {
                {
                  OptionText = "72003404",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "72003405",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "72003406",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17422021423411608"] = {
            key = "17422021423411608",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1848.3263596657428, y = 837.3555972158513},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72003501,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720035",
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
          ["17422022351522758"] = {
            key = "17422022351522758",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1861.7400490616462, y = 1026.2940813572395},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72003601,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720036",
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
          ["17430442110234174"] = {
            key = "17430442110234174",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1849.7557354925773, y = 525.9352226720649},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72003407,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720034",
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
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 820000}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17430443426745334"] = {
            key = "17430443426745334",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1851.2469635627529, y = 672.7773279352226},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72003408,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720034",
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
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 820000}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17430651746171569415"] = {
            key = "17430651746171569415",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2529.647642679901, y = 531.0421836228288},
            propsData = {
              CreateType = "ManualItem",
              CreateId = 1641109,
              StateId = 104011,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17430651825531569638"] = {
            key = "17430651825531569638",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 2168.6153846153848, y = 532.4615384615385},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Fort01PanOpenDoor",
              UnitId = -1
            }
          },
          ["17436638857261845"] = {
            key = "17436638857261845",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1482.5565278137872, y = 1201.0257540402733},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72003701,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720037",
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
              NormalOptions = {
                {
                  OptionText = "72003703",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "72003704",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "72003705",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17436638857261846"] = {
            key = "17436638857261846",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2336.417011732229, y = 1195.4118993135012},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72003706,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720037",
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
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 820000}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17436638857261847"] = {
            key = "17436638857261847",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2337.9082398024048, y = 1342.254004576659},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 72003707,
              FlowAssetPath = "",
              TalkType = "PanFixSimple",
              TalkStageName = "Stage_720037",
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
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 820000}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17555932714172631"] = {
            key = "17555932714172631",
            type = "TalkNode",
            name = "\229\187\182\232\191\159\233\149\156\229\164\180",
            pos = {x = 1466.6002563226252, y = -496.2246069719756},
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
          ["1755679643512311333"] = {
            key = "1755679643512311333",
            type = "TalkNode",
            name = "\229\187\182\232\191\159\233\149\156\229\164\180",
            pos = {x = 1462.339002225845, y = 36.317506178032346},
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
          ["1755679820129314891"] = {
            key = "1755679820129314891",
            type = "TalkNode",
            name = "\229\187\182\232\191\159\233\149\156\229\164\180",
            pos = {x = 1465.4180371149153, y = 365.1463234213121},
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
          ["1755679865757315803"] = {
            key = "1755679865757315803",
            type = "TalkNode",
            name = "\229\187\182\232\191\159\233\149\156\229\164\180",
            pos = {x = 1450.418037114915, y = 813.992477267466},
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
          ["1755679872530316007"] = {
            key = "1755679872530316007",
            type = "TalkNode",
            name = "\229\187\182\232\191\159\233\149\156\229\164\180",
            pos = {x = 1461.9564986533767, y = 1010.1463234213122},
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
