return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17357861108781894",
      startPort = "StoryStart",
      endStory = "17357861135661978",
      endPort = "In"
    },
    {
      startStory = "17357861135661978",
      startPort = "Success",
      endStory = "17357861108781897",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17357861108781894"] = {
      isStoryNode = true,
      key = "17357861108781894",
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
    ["17357861108781897"] = {
      isStoryNode = true,
      key = "17357861108781897",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1587.1657754010694, y = 288.93048128342247},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17357861135661978"] = {
      isStoryNode = true,
      key = "17357861135661978",
      type = "StoryNode",
      name = "\229\139\146\231\180\162",
      pos = {x = 1211.3103448275863, y = 294.4137931034483},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_IcelakeCityLesuo_Des",
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
            startQuest = "17357861135661979",
            startPort = "QuestStart",
            endQuest = "17357863000522757",
            endPort = "In"
          },
          {
            startQuest = "17357863000522757",
            startPort = "Out",
            endQuest = "17357863469293379",
            endPort = "In"
          },
          {
            startQuest = "17357863000522757",
            startPort = "Out",
            endQuest = "17357863822593739",
            endPort = "In"
          },
          {
            startQuest = "17357864629995156",
            startPort = "Out",
            endQuest = "17357865108865826",
            endPort = "In"
          },
          {
            startQuest = "17357865108865826",
            startPort = "Out",
            endQuest = "17357865234256246",
            endPort = "In"
          },
          {
            startQuest = "17357865932597840",
            startPort = "Option_1",
            endQuest = "17357866196488312",
            endPort = "In"
          },
          {
            startQuest = "17357866511148577",
            startPort = "Out",
            endQuest = "17357861135661982",
            endPort = "Success"
          },
          {
            startQuest = "17357867358169506",
            startPort = "Out",
            endQuest = "17357861135661982",
            endPort = "Success"
          },
          {
            startQuest = "17358005146902108936",
            startPort = "Out",
            endQuest = "17357867358169506",
            endPort = "In"
          },
          {
            startQuest = "17358006120342109499",
            startPort = "Out",
            endQuest = "17358006915522110827",
            endPort = "In"
          },
          {
            startQuest = "17357865755067535",
            startPort = "Out",
            endQuest = "17358006120342109499",
            endPort = "In"
          },
          {
            startQuest = "17357865108865826",
            startPort = "Out",
            endQuest = "17357865482286823",
            endPort = "In"
          },
          {
            startQuest = "17357865234256246",
            startPort = "Out",
            endQuest = "1735806087563924",
            endPort = "In"
          },
          {
            startQuest = "1735806087563924",
            startPort = "Out",
            endQuest = "17357865755067535",
            endPort = "In"
          },
          {
            startQuest = "17357866196488312",
            startPort = "Out",
            endQuest = "17357866511148577",
            endPort = "In"
          },
          {
            startQuest = "17358006120342109499",
            startPort = "Out",
            endQuest = "17357865932597840",
            endPort = "In"
          },
          {
            startQuest = "17357863469293379",
            startPort = "Out",
            endQuest = "17357864629995156",
            endPort = "In"
          },
          {
            startQuest = "17357865932597840",
            startPort = "Option_2",
            endQuest = "17358005146902108936",
            endPort = "In"
          }
        },
        nodeData = {
          ["17357861135661979"] = {
            key = "17357861135661979",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 884.5, y = 278.5},
            propsData = {ModeType = 0}
          },
          ["17357861135661982"] = {
            key = "17357861135661982",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4434.39393939394, y = 398.87626262626264},
            propsData = {ModeType = 0}
          },
          ["17357861135661985"] = {
            key = "17357861135661985",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3720.9375, y = 1174.6875},
            propsData = {}
          },
          ["17357863000522757"] = {
            key = "17357863000522757",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\128\146\229\156\176NPC",
            pos = {x = 1201.5, y = 280.1875},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190973}
            }
          },
          ["17357863469293379"] = {
            key = "17357863469293379",
            type = "TalkNode",
            name = "\232\175\183\230\177\130\230\139\191\229\155\158\233\146\177\232\180\162",
            pos = {x = 1563.5625, y = 243.3125},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818042,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190973",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71005302,
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
          },
          ["17357863822593739"] = {
            key = "17357863822593739",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1406.0625, y = 54.875},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71005301,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17357864629995156"] = {
            key = "17357864629995156",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\143\230\183\183\230\183\183NPC",
            pos = {x = 1891.0714285714287, y = 267.24756493506493},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190974}
            }
          },
          ["17357865108865826"] = {
            key = "17357865108865826",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2193.4375, y = 246.33035714285717},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818043,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190974",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71005304,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 2,
              InType = "BlendIn",
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
          ["17357865234256246"] = {
            key = "17357865234256246",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\143\230\183\183\230\183\183\230\149\140\228\186\186",
            pos = {x = 2459.6875, y = 197.3125},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1190975,
                1190976,
                1190977
              }
            }
          },
          ["17357865482286823"] = {
            key = "17357865482286823",
            type = "ChangeStaticCreatorNode",
            name = "\233\154\144\232\151\143\229\176\143\230\183\183\230\183\183NPC",
            pos = {x = 2472.276785714286, y = 376.01785714285717},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190974}
            }
          },
          ["17357865755067535"] = {
            key = "17357865755067535",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\143\230\183\183\230\183\183NPC",
            pos = {x = 2968.4927572427573, y = 253.55032467532465},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = true,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190974}
            }
          },
          ["17357865932597840"] = {
            key = "17357865932597840",
            type = "TalkNode",
            name = "\229\176\143\230\183\183\230\183\183\231\166\187\229\188\128\229\144\142\233\128\137\230\139\169",
            pos = {x = 3513.0152821316615, y = 231.3880758484394},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71005308,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {
                {
                  OptionText = "710053081",
                  OverrideBlend = true,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = 0.5
                },
                {
                  OptionText = "710053082",
                  OverrideBlend = true,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = 0.5
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17357866196488312"] = {
            key = "17357866196488312",
            type = "TalkNode",
            name = "\228\188\188\228\185\142\229\191\152\232\174\176\228\186\134\228\187\128\228\185\136",
            pos = {x = 3852.142966830467, y = 216.2851688198462},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71005309,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17357866511148577"] = {
            key = "17357866511148577",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 4112.394809582311, y = 243.89954652043087},
            propsData = {
              DialogueId = 71005309,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17357867358169506"] = {
            key = "17357867358169506",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 4153.429744810795, y = 561.8111164481297},
            propsData = {
              DialogueId = 71005310,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17358005146902108936"] = {
            key = "17358005146902108936",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3864.9476916042836, y = 542.543236108655},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818042,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190973",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71005310,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 2,
              InType = "BlendIn",
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
          ["17358006120342109499"] = {
            key = "17358006120342109499",
            type = "TalkNode",
            name = "\228\184\142\229\176\143\230\183\183\230\183\183\229\175\185\232\175\157",
            pos = {x = 3226.993146149739, y = 263.19258675800575},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818043,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190974",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71005307,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 2,
              InType = "BlendIn",
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
          ["17358006915522110827"] = {
            key = "17358006915522110827",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\176\143\230\183\183\230\183\183NPC",
            pos = {x = 3443.356782513375, y = -79.2749457095266},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190974}
            }
          },
          ["1735806087563924"] = {
            key = "1735806087563924",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\229\176\143\230\183\183\230\183\183",
            pos = {x = 2714.1890109890114, y = 280.14835164835176},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1190975,
                1190976,
                1190977
              }
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
