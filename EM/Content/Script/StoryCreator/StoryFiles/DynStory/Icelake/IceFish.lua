return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1750236994565369190",
      startPort = "StoryStart",
      endStory = "1750236994565369192",
      endPort = "In"
    },
    {
      startStory = "1750236994565369192",
      startPort = "Success",
      endStory = "1750236994565369191",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1750236994565369190"] = {
      isStoryNode = true,
      key = "1750236994565369190",
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
    ["1750236994565369191"] = {
      isStoryNode = true,
      key = "1750236994565369191",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1481.764705882353, y = 273.52941176470586},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1750236994565369192"] = {
      isStoryNode = true,
      key = "1750236994565369192",
      type = "StoryNode",
      name = "\229\134\176\233\157\162\233\146\147\233\177\188",
      pos = {x = 1131.2941176470588, y = 283.8823529411765},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_IcelakeIceFish_Des",
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
            startQuest = "1750236994565369193",
            startPort = "QuestStart",
            endQuest = "1750236994566369196",
            endPort = "In"
          },
          {
            startQuest = "1750236994566369196",
            startPort = "Out",
            endQuest = "1750236994566369197",
            endPort = "In"
          },
          {
            startQuest = "1750236994566369196",
            startPort = "Out",
            endQuest = "17388224098001926",
            endPort = "In"
          },
          {
            startQuest = "17388224098001926",
            startPort = "Out",
            endQuest = "17388224338992241",
            endPort = "In"
          },
          {
            startQuest = "17388224338992241",
            startPort = "Out",
            endQuest = "1750236994566369198",
            endPort = "In"
          },
          {
            startQuest = "1750236994566369198",
            startPort = "Option_1",
            endQuest = "1750236994566369199",
            endPort = "In"
          },
          {
            startQuest = "1750236994566369198",
            startPort = "Option_2",
            endQuest = "1750236994566369200",
            endPort = "In"
          },
          {
            startQuest = "1750236994566369200",
            startPort = "Out",
            endQuest = "1750236994566369194",
            endPort = "Success"
          },
          {
            startQuest = "1750236994566369201",
            startPort = "Out",
            endQuest = "1750236994566369202",
            endPort = "In"
          },
          {
            startQuest = "1750236994566369202",
            startPort = "Out",
            endQuest = "1750236994566369194",
            endPort = "Success"
          },
          {
            startQuest = "1750236994566369205",
            startPort = "Out",
            endQuest = "1750236994566369204",
            endPort = "In"
          },
          {
            startQuest = "1750236994566369204",
            startPort = "Out",
            endQuest = "1750236994566369203",
            endPort = "Input"
          },
          {
            startQuest = "1750236994566369204",
            startPort = "Out",
            endQuest = "1750236994566369206",
            endPort = "In"
          },
          {
            startQuest = "1750236994566369199",
            startPort = "Out",
            endQuest = "1750236994566369205",
            endPort = "In"
          },
          {
            startQuest = "1750236994566369203",
            startPort = "Out",
            endQuest = "1750236994566369201",
            endPort = "In"
          }
        },
        nodeData = {
          ["17388224098001926"] = {
            key = "17388224098001926",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\167\189\229\133\189",
            pos = {x = 1532, y = 291},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240477,
                1240478,
                1240479
              }
            }
          },
          ["17388224338992241"] = {
            key = "17388224338992241",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1857, y = 300},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1240477,
                1240478,
                1240479
              }
            }
          },
          ["1750236994565369193"] = {
            key = "1750236994565369193",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1750236994566369194"] = {
            key = "1750236994566369194",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4127, y = 462},
            propsData = {ModeType = 0}
          },
          ["1750236994566369195"] = {
            key = "1750236994566369195",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3095, y = 755},
            propsData = {}
          },
          ["1750236994566369196"] = {
            key = "1750236994566369196",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\146\147\233\177\188NPC",
            pos = {x = 1144, y = 298},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240476}
            }
          },
          ["1750236994566369197"] = {
            key = "1750236994566369197",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1536, y = 20.999999999999957},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71006301,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1750236994566369198"] = {
            key = "1750236994566369198",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2188, y = 276},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818056,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1240476",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71006302,
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
              NormalOptions = {
                {
                  OptionText = "710063021",
                  OverrideBlend = true,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = -1
                },
                {
                  OptionText = "710063022",
                  OverrideBlend = true,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 2
                }
              },
              OverrideFailBlend = false
            }
          },
          ["1750236994566369199"] = {
            key = "1750236994566369199",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2497, y = 268},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71006303,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = -1,
              BlendOutTime = 1,
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
          ["1750236994566369200"] = {
            key = "1750236994566369200",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 2591, y = 513},
            propsData = {UseTalkFadeOut = false, TalkFadeOutTime = 0}
          },
          ["1750236994566369201"] = {
            key = "1750236994566369201",
            type = "TalkNode",
            name = "\233\146\147\233\177\188\230\136\144\229\138\159\229\175\185\232\175\157",
            pos = {x = 3560, y = 246},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818056,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1240476",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71006305,
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
          ["1750236994566369202"] = {
            key = "1750236994566369202",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3838, y = 254.75},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1750236994566369203"] = {
            key = "1750236994566369203",
            type = "ResourceCollectNode",
            name = "\232\142\183\229\190\151Resource\233\129\147\229\133\183",
            pos = {x = 3268.2922069158913, y = 261.9111049768946},
            propsData = {
              ResourceType = "Resource",
              ResourceId = -1,
              ResourceSType = "Fish",
              NeedCount = 1,
              bUseBagCount = false,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "Mechanism_Dyn_1240645"
            }
          },
          ["1750236994566369204"] = {
            key = "1750236994566369204",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2991.013432181853, y = 265.30092466013525},
            propsData = {WaitTime = 0.5}
          },
          ["1750236994566369205"] = {
            key = "1750236994566369205",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\146\147\233\177\188\231\130\185",
            pos = {x = 2752.5191965928807, y = 260.81556163135116},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240645}
            }
          },
          ["1750236994566369206"] = {
            key = "1750236994566369206",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\187\153\233\146\147\233\177\188\230\156\186\229\133\179\230\140\135\229\188\149\231\130\185",
            pos = {x = 3235.9560652797495, y = 450.69759626338566},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1240645,
              StateId = 9020002,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_Dyn_1240645"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
