return {
  storyName = "\233\128\129\232\181\155\231\144\170\229\155\158\231\150\151\229\133\187\233\153\162",
  storyDescription = "",
  lineData = {
    {
      startStory = "story_16892500485402573",
      startPort = "Success",
      endStory = "story_16892505080022589",
      endPort = "In"
    },
    {
      startStory = "story_16892505080022589",
      startPort = "Success",
      endStory = "story_16892516874782619",
      endPort = "In"
    },
    {
      startStory = "1701255662145216559",
      startPort = "Success",
      endStory = "1701312586718335632",
      endPort = "In"
    },
    {
      startStory = "story_16892486490582553",
      startPort = "StoryStart",
      endStory = "story_16892500485402573",
      endPort = "In"
    },
    {
      startStory = "1701260945535298827",
      startPort = "Success",
      endStory = "story_16892486490582555",
      endPort = "StoryEnd"
    },
    {
      startStory = "story_16892516874782619",
      startPort = "Success",
      endStory = "17195703113832106389",
      endPort = "In"
    },
    {
      startStory = "17195703113832106389",
      startPort = "Success",
      endStory = "story_1689320953371486",
      endPort = "In"
    },
    {
      startStory = "story_1689320953371486",
      startPort = "Success",
      endStory = "1704353127695158062",
      endPort = "In"
    },
    {
      startStory = "1704353127695158062",
      startPort = "Success",
      endStory = "1725954150101591776",
      endPort = "In"
    },
    {
      startStory = "1701249139980165403",
      startPort = "Success",
      endStory = "1701255662145216559",
      endPort = "In"
    },
    {
      startStory = "1725954150101591776",
      startPort = "Success",
      endStory = "1701249139980165403",
      endPort = "In"
    },
    {
      startStory = "1701312586718335632",
      startPort = "Success",
      endStory = "1701260945535298827",
      endPort = "In"
    }
  },
  storyNodeData = {
    story_16892486490582553 = {
      isStoryNode = true,
      key = "story_16892486490582553",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = -305.7909049100013, y = 89.03986646942484},
      propsData = {QuestChainId = 100204},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_16892486490582555 = {
      isStoryNode = true,
      key = "story_16892486490582555",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = -54.52180623188774, y = 717.97050600889},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_16892500485402573 = {
      isStoryNode = true,
      key = "story_16892500485402573",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\229\165\165\231\137\185\232\181\155\229\190\183\229\174\182",
      pos = {x = -59.08428795873619, y = 82.33212126767282},
      propsData = {
        QuestId = 10020401,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020401",
        QuestDeatil = "QuestDesc_10020401",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = true,
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
        StoryGuidePointName = "",
        QuestUIId = 0
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "quest_16892486642252561",
            startPort = "QuestStart",
            endQuest = "170100048957316263",
            endPort = "In"
          },
          {
            startQuest = "170625607396920356",
            startPort = "Out",
            endQuest = "170625607396920358",
            endPort = "In"
          },
          {
            startQuest = "170625607396920356",
            startPort = "Out",
            endQuest = "170625607396920357",
            endPort = "In"
          },
          {
            startQuest = "17241456801814118424",
            startPort = "Out",
            endQuest = "17241456801814118423",
            endPort = "In"
          },
          {
            startQuest = "17241456801814118425",
            startPort = "Out",
            endQuest = "17241456801814118422",
            endPort = "In"
          },
          {
            startQuest = "quest_16892486642252561",
            startPort = "QuestStart",
            endQuest = "17241456801814118425",
            endPort = "In"
          },
          {
            startQuest = "quest_16892486642252561",
            startPort = "QuestStart",
            endQuest = "17241456801814118424",
            endPort = "In"
          },
          {
            startQuest = "170625607396920358",
            startPort = "Out",
            endQuest = "170625607396920359",
            endPort = "In"
          },
          {
            startQuest = "170625607396920359",
            startPort = "Out",
            endQuest = "quest_16892486642252563",
            endPort = "Success"
          },
          {
            startQuest = "170100048957316263",
            startPort = "Out",
            endQuest = "17470572809751445747",
            endPort = "In"
          },
          {
            startQuest = "17470572809751445747",
            startPort = "Out",
            endQuest = "170625607396920352",
            endPort = "In"
          },
          {
            startQuest = "17470572809751445747",
            startPort = "Out",
            endQuest = "170625607396920354",
            endPort = "In"
          },
          {
            startQuest = "170100048957316263",
            startPort = "Out",
            endQuest = "1709128989551120310",
            endPort = "In"
          },
          {
            startQuest = "17520564724531922679",
            startPort = "Out",
            endQuest = "170625607396920356",
            endPort = "In"
          },
          {
            startQuest = "170625607396920352",
            startPort = "Out",
            endQuest = "175325534117510303",
            endPort = "In"
          },
          {
            startQuest = "175325534117510303",
            startPort = "Out",
            endQuest = "17520564724531922679",
            endPort = "In"
          },
          {
            startQuest = "170625607396920352",
            startPort = "Out",
            endQuest = "170625607396920355",
            endPort = "In"
          },
          {
            startQuest = "170625607396920352",
            startPort = "Out",
            endQuest = "175387166153715482256",
            endPort = "In"
          },
          {
            startQuest = "17241456801814118425",
            startPort = "Out",
            endQuest = "17588677271193532",
            endPort = "In"
          },
          {
            startQuest = "17588677271193532",
            startPort = "Out",
            endQuest = "17586845845843382",
            endPort = "In"
          }
        },
        nodeData = {
          quest_16892486642252561 = {
            key = "quest_16892486642252561",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -708.4460702951793, y = -82.92422114008886},
            propsData = {ModeType = 0}
          },
          quest_16892486642252563 = {
            key = "quest_16892486642252563",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1556.2807465226026, y = -75.04019799363816},
            propsData = {ModeType = 0}
          },
          quest_16892486642252565 = {
            key = "quest_16892486642252565",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1317.3132099999748, y = 563.4562808115834},
            propsData = {}
          },
          ["170100048957316263"] = {
            key = "170100048957316263",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\165\165\229\147\165\229\174\182",
            pos = {x = -381.4287111278113, y = -81.31676360800104},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101105,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "BP_OuterHome"
            }
          },
          ["170625607396920351"] = {
            key = "170625607396920351",
            type = "TalkNode",
            name = "\232\143\178\229\168\156\231\153\187\229\156\186",
            pos = {x = -246.00611970796194, y = 269.9269775645324},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10106001,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101060",
              BlendInTime = 0,
              BlendOutTime = 0,
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
              SkipToOption = true,
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
                  TalkActorId = 200020,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 200020},
                {TalkActorType = "Npc", TalkActorId = 200021},
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
          ["170625607396920352"] = {
            key = "170625607396920352",
            type = "TalkNode",
            name = "\232\143\178\229\168\156\231\153\187\229\156\186",
            pos = {x = 179.9527790020235, y = -81.23920082229816},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10106004,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_10106004",
              BlendInTime = 0,
              BlendOutTime = 0,
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
              SkipToOption = true,
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
                  TalkActorId = 200020,
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
                {TalkActorType = "Npc", TalkActorId = 200020},
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
          ["170625607396920354"] = {
            key = "170625607396920354",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\155\139\231\179\149",
            pos = {x = -75.40075921504162, y = 79.78239279698656},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230016}
            }
          },
          ["170625607396920355"] = {
            key = "170625607396920355",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\152\159\231\169\186\231\129\175(\229\183\178\232\189\172\231\167\187\232\135\179\229\175\185\232\175\157\232\132\154\230\156\172\228\184\173)",
            pos = {x = 191.96077369649186, y = -368.1333581187646},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230019}
            }
          },
          ["170625607396920356"] = {
            key = "170625607396920356",
            type = "TalkNode",
            name = "\228\184\187\232\167\146",
            pos = {x = 704.2458219815397, y = -86.7273752127816},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10106101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101061",
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
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200020,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 200020},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["170625607396920357"] = {
            key = "170625607396920357",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\152\159\231\169\186\231\129\175",
            pos = {x = 803.8755601581391, y = 99.94351143000273},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230019}
            }
          },
          ["170625607396920358"] = {
            key = "170625607396920358",
            type = "TalkNode",
            name = "\232\140\182\228\188\154",
            pos = {x = 1054.282156407348, y = -83.8696122155451},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10106201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101062",
              BlendInTime = 0,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
              SkipToOption = true,
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
                  TalkActorId = 200020,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 200020},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["170625607396920359"] = {
            key = "170625607396920359",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\232\155\139\231\179\149",
            pos = {x = 1310.459975742555, y = -79.92272233623112},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230016}
            }
          },
          ["1709128989551120310"] = {
            key = "1709128989551120310",
            type = "PlayOrStopBGMNode",
            name = "\230\146\173\230\148\190\230\154\130\229\129\156\233\159\179\228\185\144",
            pos = {x = -375.957024487161, y = 77.10785004970302},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/mute.mute'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101105},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17241456801814118422"] = {
            key = "17241456801814118422",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = -69.09497937290386, y = -481.3227788141018},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["17241456801814118423"] = {
            key = "17241456801814118423",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = -97.00663051984912, y = -262.9614342762867},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeNight",
              UnitId = -1
            }
          },
          ["17241456801814118424"] = {
            key = "17241456801814118424",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150",
            pos = {x = -392.21671455346285, y = -282.2051317552782},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17241456801814118425"] = {
            key = "17241456801814118425",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = -364.45578460201017, y = -498.27859299950046},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17470572809751445747"] = {
            key = "17470572809751445747",
            type = "TalkNode",
            name = "\232\143\178\229\168\156\231\153\187\229\156\186",
            pos = {x = -92.68316670541722, y = -84.99831683661608},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "LevelSequence'/Game/Asset/Cinematics/Story/OBT01/OBT0101/OBT0101_SC015/SQ_OBT0101_SC015.SQ_OBT0101_SC015'",
              InType = "BlendIn",
              OutType = "BlendOut",
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
          },
          ["17520564724531922679"] = {
            key = "17520564724531922679",
            type = "TalkNode",
            name = "\232\143\178\229\168\156\231\153\187\229\156\186",
            pos = {x = 442.95057720057724, y = -80.3484848484848},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10106013,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_10106013",
              BlendInTime = 0,
              BlendOutTime = 0,
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
              SkipToOption = true,
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
                  TalkActorId = 200020,
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
                {TalkActorType = "Npc", TalkActorId = 200020},
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
          ["175325534117510303"] = {
            key = "175325534117510303",
            type = "TalkNode",
            name = "\232\143\178\229\168\156\231\157\129\231\156\188",
            pos = {x = 442.9305555555555, y = -254.59722222222223},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10106012,
              FlowAssetPath = "DialogueAsset'/Game/AssetDesign/Story/DialogueSequence/MainStory/1002/10106012.10106012'",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101060",
              BlendInTime = 0,
              BlendOutTime = 0.5,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200020,
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
                {TalkActorType = "Npc", TalkActorId = 200020},
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
          ["175387166153715482256"] = {
            key = "175387166153715482256",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\230\146\173bgm",
            pos = {x = 439.39520202020185, y = -380.7083333333333},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17586845845843382"] = {
            key = "17586845845843382",
            type = "TalkNode",
            name = "\230\129\169\233\135\140\229\133\139\228\187\164\228\186\186\231\129\171\229\164\167",
            pos = {x = 122.45203081232461, y = -685.2258350309819},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10105901,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17588677271193532"] = {
            key = "17588677271193532",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -153.7613636363636, y = -696.3636363636368},
            propsData = {WaitTime = 3}
          }
        },
        commentData = {}
      }
    },
    story_16892505080022589 = {
      isStoryNode = true,
      key = "story_16892505080022589",
      type = "StoryNode",
      name = "\231\166\187\229\188\128\229\165\165\231\137\185\232\181\155\229\190\183\229\174\182",
      pos = {x = 201.18712376208862, y = 83.98064401156265},
      propsData = {
        QuestId = 10020402,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020402",
        QuestDeatil = "QuestDesc_10020402",
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
            startQuest = "1704175979205198681",
            startPort = "QuestStart",
            endQuest = "quest_1691151400291960",
            endPort = "In"
          },
          {
            startQuest = "quest_1691151400291960",
            startPort = "Out",
            endQuest = "1704175979205198682",
            endPort = "Success"
          },
          {
            startQuest = "17241457037814293691",
            startPort = "Out",
            endQuest = "17241457037814293690",
            endPort = "In"
          },
          {
            startQuest = "17241457037814293692",
            startPort = "Out",
            endQuest = "17241457037814293689",
            endPort = "In"
          },
          {
            startQuest = "1704175979205198681",
            startPort = "QuestStart",
            endQuest = "17241457037814293692",
            endPort = "In"
          },
          {
            startQuest = "1704175979205198681",
            startPort = "QuestStart",
            endQuest = "17241457037814293691",
            endPort = "In"
          },
          {
            startQuest = "1704175979205198681",
            startPort = "QuestStart",
            endQuest = "17452463676036594875",
            endPort = "In"
          },
          {
            startQuest = "17452463676036594875",
            startPort = "Out",
            endQuest = "1713879217311168241",
            endPort = "In"
          },
          {
            startQuest = "1713879217311168241",
            startPort = "Out",
            endQuest = "170895210257934758",
            endPort = "In"
          }
        },
        nodeData = {
          quest_1691151400291960 = {
            key = "quest_1691151400291960",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\166\187\229\188\128\229\165\165\229\147\165\229\174\182",
            pos = {x = 96.89189189189192, y = 116.77340977340977},
            propsData = {
              RegionType = 1,
              IsEnter = "Leave",
              RegionId = 101105,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "BP_TargetPoint_LeaveOutsidersHome"
            }
          },
          ["1704175979205198681"] = {
            key = "1704175979205198681",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -344.2948402948397, y = 120.95331695331699},
            propsData = {ModeType = 0}
          },
          ["1704175979205198682"] = {
            key = "1704175979205198682",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 488.6857834637011, y = 112.62197953305197},
            propsData = {ModeType = 0}
          },
          ["1704175979205198683"] = {
            key = "1704175979205198683",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 464.31132709545614, y = 265.57714501877496},
            propsData = {}
          },
          ["170895210257934758"] = {
            key = "170895210257934758",
            type = "TalkNode",
            name = "\232\143\178\229\168\156\229\190\133\230\156\186",
            pos = {x = 548.9379501895855, y = -168.25886124136727},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200020,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "Npc_101060Feena_1230006",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10114201,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
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
          ["1713879217311168241"] = {
            key = "1713879217311168241",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144 \232\143\178\229\168\156",
            pos = {x = 309.6463945749603, y = -128.22982107245758},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230018}
            }
          },
          ["17241457037814293689"] = {
            key = "17241457037814293689",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 257.3631173793108, y = -445.06227461242105},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["17241457037814293690"] = {
            key = "17241457037814293690",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 257.3631173793108, y = -297.91941746956394},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeNight",
              UnitId = -1
            }
          },
          ["17241457037814293691"] = {
            key = "17241457037814293691",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150",
            pos = {x = -22.63688262068942, y = -332.20513175527816},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17241457037814293692"] = {
            key = "17241457037814293692",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = -15.254103929741076, y = -470.0432988818534},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17452463676036594875"] = {
            key = "17452463676036594875",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\165\165\229\147\165\229\174\182",
            pos = {x = 40.702474162815385, y = -117.64306172507158},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101105,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = "TargetPoint_LeaveOutsidersHome"
            }
          }
        },
        commentData = {}
      }
    },
    story_16892516874782619 = {
      isStoryNode = true,
      key = "story_16892516874782619",
      type = "StoryNode",
      name = "\228\184\142\229\165\165\231\137\185\232\181\155\229\190\183\232\176\136\232\176\136",
      pos = {x = 456.7527474438373, y = 76.24085534292674},
      propsData = {
        QuestId = 10020403,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020403",
        QuestDeatil = "QuestDesc_10020403",
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
            startQuest = "17115439474924820",
            startPort = "Out",
            endQuest = "17115439474924827",
            endPort = "In"
          },
          {
            startQuest = "1704175979205198684",
            startPort = "QuestStart",
            endQuest = "17115439474924819",
            endPort = "In"
          },
          {
            startQuest = "17241457171894294203",
            startPort = "Out",
            endQuest = "17241457171894294202",
            endPort = "In"
          },
          {
            startQuest = "17115439474924819",
            startPort = "Out",
            endQuest = "17241457171894294201",
            endPort = "In"
          },
          {
            startQuest = "1704175979205198684",
            startPort = "QuestStart",
            endQuest = "17241457171894294203",
            endPort = "In"
          },
          {
            startQuest = "17115439474924827",
            startPort = "Out",
            endQuest = "1704175979205198685",
            endPort = "Success"
          },
          {
            startQuest = "17115439474924821",
            startPort = "Out",
            endQuest = "17427985274984732333",
            endPort = "In"
          },
          {
            startQuest = "17427985274984732333",
            startPort = "Out",
            endQuest = "17427985657384732858",
            endPort = "In"
          },
          {
            startQuest = "17115439474924821",
            startPort = "Out",
            endQuest = "17427986032504733582",
            endPort = "In"
          },
          {
            startQuest = "17427986032504733582",
            startPort = "Out",
            endQuest = "17427985910284733352",
            endPort = "In"
          },
          {
            startQuest = "17427985910284733352",
            startPort = "Out",
            endQuest = "17115439474924820",
            endPort = "In"
          },
          {
            startQuest = "17115439474924819",
            startPort = "Out",
            endQuest = "17472966674012901586",
            endPort = "In"
          },
          {
            startQuest = "17472966674012901586",
            startPort = "Out",
            endQuest = "17115439474924821",
            endPort = "In"
          }
        },
        nodeData = {
          ["1704175979205198684"] = {
            key = "1704175979205198684",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -741.0706896551725, y = 283.62758620689664},
            propsData = {ModeType = 0}
          },
          ["1704175979205198685"] = {
            key = "1704175979205198685",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1376.2110289073025, y = 269.3957607301885},
            propsData = {ModeType = 0}
          },
          ["1704175979205198686"] = {
            key = "1704175979205198686",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1321.7923759232526, y = 421.9217924455807},
            propsData = {}
          },
          ["17115439474924819"] = {
            key = "17115439474924819",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = -391.82226331904235, y = 287.86542780495836},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_Auto"
            }
          },
          ["17115439474924820"] = {
            key = "17115439474924820",
            type = "TalkNode",
            name = "\231\173\137\229\190\133\232\176\136\232\176\136\230\173\163\228\186\139\229\174\140\230\136\144",
            pos = {x = 872.3614663483821, y = 284.9380442975579},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200021,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_101063Aote_1190272",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10106301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101063",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
              EndNewTargetPointName = "P101063Nvzhu",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              PauseNpcBT = true,
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
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
                {TalkActorType = "Npc", TalkActorId = 100001},
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
          ["17115439474924821"] = {
            key = "17115439474924821",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144 \229\165\165\229\147\165",
            pos = {x = 105.37910663140701, y = 317.08899295823153},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190272}
            }
          },
          ["17115439474924823"] = {
            key = "17115439474924823",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129 \230\151\167\229\165\165\229\147\165",
            pos = {x = 862.9923666815569, y = 93.26680693493682},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190272}
            }
          },
          ["17115439474924827"] = {
            key = "17115439474924827",
            type = "PlayOrStopBGMNode",
            name = "\230\154\130\229\129\156\231\150\151\229\133\187\233\153\162bgm",
            pos = {x = 1155.8738188873726, y = 266.9862400711592},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17241457171894294201"] = {
            key = "17241457171894294201",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 65.9345459507393, y = 124.93772538757892},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["17241457171894294202"] = {
            key = "17241457171894294202",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 67.36311737931072, y = -29.347988898135412},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeNight",
              UnitId = -1
            }
          },
          ["17241457171894294203"] = {
            key = "17241457171894294203",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150",
            pos = {x = -310.96200577339886, y = 127.105213072308},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17427985274984732333"] = {
            key = "17427985274984732333",
            type = "SendMessageNode",
            name = "AoteGo1",
            pos = {x = 366.78631367542687, y = 139.1684674305642},
            propsData = {
              MessageType = "BehaviorTree",
              MessageContent = "AoteGo1",
              UnitId = 200021
            }
          },
          ["17427985657384732858"] = {
            key = "17427985657384732858",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\231\187\153\229\165\165\229\147\165\230\140\130\230\140\135\229\188\149\231\130\185",
            pos = {x = 606.7863136754269, y = 134.30360256569932},
            propsData = {
              IsShow = true,
              GuideType = "N",
              GuideName = "Npc_101063Aote_1190272"
            }
          },
          ["17427985910284733352"] = {
            key = "17427985910284733352",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\231\187\153\229\165\165\229\147\165\230\140\130\230\140\135\229\188\149\231\130\185",
            pos = {x = 624.4786213677346, y = 308.90859217068885},
            propsData = {
              IsShow = false,
              GuideType = "N",
              GuideName = "Npc_101063Aote_1190272"
            }
          },
          ["17427986032504733582"] = {
            key = "17427986032504733582",
            type = "WaitOfTimeNode",
            name = "\231\173\1374S",
            pos = {x = 349.75928664839984, y = 309.4387377008344},
            propsData = {WaitTime = 4}
          },
          ["17472966674012901586"] = {
            key = "17472966674012901586",
            type = "GoToNode",
            name = "\229\142\187\229\165\165\229\147\165\232\186\171\232\190\185",
            pos = {x = -130.16680864113434, y = 311.874335559493},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191411,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1191411"
            }
          }
        },
        commentData = {}
      }
    },
    story_1689320953371486 = {
      isStoryNode = true,
      key = "story_1689320953371486",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\150\151\229\133\187\233\153\162\233\151\168\229\143\163",
      pos = {x = -654.6802297548231, y = 485.5663938071845},
      propsData = {
        QuestId = 10020405,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020405",
        QuestDeatil = "QuestDesc_10020405",
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
            startQuest = "1704175979205198690",
            startPort = "QuestStart",
            endQuest = "170124236155669149",
            endPort = "In"
          },
          {
            startQuest = "170124236155669149",
            startPort = "Out",
            endQuest = "1701002153863104816",
            endPort = "In"
          },
          {
            startQuest = "1701002153863104816",
            startPort = "Out",
            endQuest = "1701002173984107621",
            endPort = "In"
          },
          {
            startQuest = "170124236155669149",
            startPort = "Out",
            endQuest = "170895179453229975",
            endPort = "In"
          },
          {
            startQuest = "1701002173984107621",
            startPort = "Out",
            endQuest = "1709129779001131131",
            endPort = "In"
          },
          {
            startQuest = "1709129779001131131",
            startPort = "Out",
            endQuest = "1704175979205198691",
            endPort = "Success"
          },
          {
            startQuest = "170124236155669149",
            startPort = "Out",
            endQuest = "17235523833171730253",
            endPort = "In"
          }
        },
        nodeData = {
          ["1701002153863104816"] = {
            key = "1701002153863104816",
            type = "GoToNode",
            name = "goto \231\150\151\229\133\187\233\153\162\233\151\168\229\143\163",
            pos = {x = -41.04133175327675, y = 121.75138849317588},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190006,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1190006"
            }
          },
          ["1701002173984107621"] = {
            key = "1701002173984107621",
            type = "TalkNode",
            name = "\230\129\169\233\135\140\229\133\139\229\188\128\233\151\168",
            pos = {x = 402.31037277622, y = 133.08080422619497},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10106701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101067",
              BlendInTime = 1,
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
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 100001},
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
          ["170124236155669149"] = {
            key = "170124236155669149",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\228\189\141\228\186\142\229\134\176\230\185\150\229\159\142",
            pos = {x = -462.43897205812505, y = 125.16967100344078},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "P10101202"
            }
          },
          ["170124449608479599"] = {
            key = "170124449608479599",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 653.0256033120511, y = -304.7528301643362},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 0,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["1704175979205198690"] = {
            key = "1704175979205198690",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -719.9047684806197, y = 135.62589782404024},
            propsData = {ModeType = 0}
          },
          ["1704175979205198691"] = {
            key = "1704175979205198691",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1131.2619154130382, y = 134.94952392798163},
            propsData = {ModeType = 0}
          },
          ["1704175979205198692"] = {
            key = "1704175979205198692",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 894.4905840860855, y = 357.70701039078347},
            propsData = {}
          },
          ["1704175979205198693"] = {
            key = "1704175979205198693",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\231\150\151\229\133\187\233\153\162",
            pos = {x = 372.2120941035281, y = -355.47800269634007},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101106,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_Sanatorium"
            }
          },
          ["170895179453229975"] = {
            key = "170895179453229975",
            type = "TalkNode",
            name = "\229\138\168\232\186\171\229\142\187\231\150\151\229\133\187\233\153\162",
            pos = {x = -203.70682333754206, y = -135.13623223638584},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10106601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["170912472446362455"] = {
            key = "170912472446362455",
            type = "PlayOrStopBGMNode",
            name = "\230\154\130\229\129\156\231\150\151\229\133\187\233\153\162bgm",
            pos = {x = 1180.5616319432834, y = 251.79535598370217},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["1709129779001131131"] = {
            key = "1709129779001131131",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\230\154\130\229\129\156\233\159\179\228\185\144",
            pos = {x = 884.8816006127115, y = 167.2845627395731},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17235523833171730253"] = {
            key = "17235523833171730253",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\231\153\189\229\164\169",
            pos = {x = -212.0432051010853, y = 350.5589838236436},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityDay",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["1701249139980165403"] = {
      isStoryNode = true,
      key = "1701249139980165403",
      type = "StoryNode",
      name = "\232\176\131\230\159\165\230\129\169\233\135\140\229\133\139\229\138\158\229\133\172\229\174\164\231\154\132\233\151\168",
      pos = {x = 431.81102843518187, y = 517.8464655029652},
      propsData = {
        QuestId = 10020408,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020408",
        QuestDeatil = "QuestDesc_10020408",
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
            startQuest = "1704175979205198703",
            startPort = "QuestStart",
            endQuest = "1704175979205198706",
            endPort = "In"
          },
          {
            startQuest = "1704175979205198706",
            startPort = "Out",
            endQuest = "1701249594469181025",
            endPort = "In"
          },
          {
            startQuest = "1704175979205198706",
            startPort = "Out",
            endQuest = "170895217967136684",
            endPort = "In"
          },
          {
            startQuest = "1701249594469181025",
            startPort = "Out",
            endQuest = "17427970397182710",
            endPort = "In"
          },
          {
            startQuest = "17427970397182710",
            startPort = "Out",
            endQuest = "1704175979205198704",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1701249594469181025"] = {
            key = "1701249594469181025",
            type = "PickUpNode",
            name = "\232\176\131\230\159\165\230\129\169\229\136\169\229\133\139\229\138\158\229\133\172\229\174\164\231\154\132\233\151\168",
            pos = {x = 53.24832477599636, y = 137.24924386522315},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1200043},
              QuestPickupId = -1,
              UnitId = 10018,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_OpenDoor",
              IsUseCount = false
            }
          },
          ["1704175979205198703"] = {
            key = "1704175979205198703",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -469.8856516290724, y = 126.59147869674186},
            propsData = {ModeType = 0}
          },
          ["1704175979205198704"] = {
            key = "1704175979205198704",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 828.0955001966873, y = 144.27862589321964},
            propsData = {ModeType = 0}
          },
          ["1704175979205198705"] = {
            key = "1704175979205198705",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1198.9352260965168, y = 214.91658838983514},
            propsData = {}
          },
          ["1704175979205198706"] = {
            key = "1704175979205198706",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\231\150\151\229\133\187\233\153\162",
            pos = {x = -217.64889197502197, y = 124.91527281130175},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101106,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "P10106801"
            }
          },
          ["170895217967136684"] = {
            key = "170895217967136684",
            type = "TalkNode",
            name = "\232\181\155\231\144\170\229\190\133\230\156\186",
            pos = {x = 27.167302536584515, y = -39.215486315640234},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200006,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "Npc_101070Saiqi_1200060",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10114301,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
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
          ["17427970397182710"] = {
            key = "17427970397182710",
            type = "TalkNode",
            name = "\229\144\145\229\176\145\229\185\180\230\137\147\230\142\162\230\182\136\230\129\175",
            pos = {x = 386.909090909091, y = 143.72727272727275},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10107101,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_101071",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
                  TalkActorId = 200019,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200019}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1701255662145216559"] = {
      isStoryNode = true,
      key = "1701255662145216559",
      type = "StoryNode",
      name = "\229\146\140\231\177\179\229\168\133\232\129\138\232\129\138",
      pos = {x = 726.1664045910081, y = 517.0137849374335},
      propsData = {
        QuestId = 10020409,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020409",
        QuestDeatil = "QuestDesc_10020409",
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
            startQuest = "1704175979205198707",
            startPort = "QuestStart",
            endQuest = "1704175979205198710",
            endPort = "In"
          },
          {
            startQuest = "1701255417410214194",
            startPort = "Out",
            endQuest = "1704175979205198708",
            endPort = "Success"
          },
          {
            startQuest = "1704175979205198710",
            startPort = "Out",
            endQuest = "17214573887832583079",
            endPort = "In"
          },
          {
            startQuest = "17214573887832583079",
            startPort = "Out",
            endQuest = "170671389110245049",
            endPort = "In"
          },
          {
            startQuest = "17214573887832583079",
            startPort = "Out",
            endQuest = "1701255417410214194",
            endPort = "In"
          }
        },
        nodeData = {
          ["1701255417410214194"] = {
            key = "1701255417410214194",
            type = "TalkNode",
            name = "\229\144\145\231\177\179\229\168\133\230\137\147\230\142\162\230\182\136\230\129\175",
            pos = {x = 230.3429159304463, y = 114.04786254326852},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700049,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_101073Miya_1200064",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10107301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101073",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
                  TalkActorId = 700049,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700049}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1704175979205198707"] = {
            key = "1704175979205198707",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -795.8494596542495, y = 114.50650623411401},
            propsData = {ModeType = 0}
          },
          ["1704175979205198708"] = {
            key = "1704175979205198708",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 477.93598788235636, y = 120.89919219748971},
            propsData = {ModeType = 0}
          },
          ["1704175979205198709"] = {
            key = "1704175979205198709",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1198.9352260965168, y = 214.91658838983514},
            propsData = {}
          },
          ["1704175979205198710"] = {
            key = "1704175979205198710",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\231\150\151\229\133\187\233\153\162",
            pos = {x = -526.5555390913465, y = 119.80774592958132},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101106,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "P10106801"
            }
          },
          ["170671389110245049"] = {
            key = "170671389110245049",
            type = "TalkNode",
            name = "\229\176\145\229\185\180\231\154\132\229\190\133\230\156\186\229\175\185\232\175\157",
            pos = {x = -12.459258933238178, y = -45.94893343799024},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200019,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "Npc_101071Boy_1200062",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10107201,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
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
          ["17214573887832583079"] = {
            key = "17214573887832583079",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144 \233\152\180\233\131\129\231\154\132\229\176\145\229\185\180",
            pos = {x = -270.3895968492398, y = 119.86626223849139},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1200062}
            }
          }
        },
        commentData = {}
      }
    },
    ["1701260588750276841"] = {
      isStoryNode = true,
      key = "1701260588750276841",
      type = "StoryNode",
      name = "\231\166\187\229\188\128\231\150\151\229\133\187\233\153\162",
      pos = {x = 1253.1581726107436, y = 648.9938107495706},
      propsData = {
        QuestId = 10020411,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020411",
        QuestDeatil = "QuestDesc_10020411",
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
            startQuest = "1701260588760276842",
            startPort = "QuestStart",
            endQuest = "17067162163804583",
            endPort = "In"
          },
          {
            startQuest = "1701260588760276842",
            startPort = "QuestStart",
            endQuest = "1701260642479282363",
            endPort = "In"
          },
          {
            startQuest = "1701260588760276842",
            startPort = "QuestStart",
            endQuest = "1701260642479282364",
            endPort = "In"
          },
          {
            startQuest = "1701260642479282363",
            startPort = "Out",
            endQuest = "1701260588760276844",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1701260588760276842"] = {
            key = "1701260588760276842",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 647.6315789473686, y = 325.2631578947369},
            propsData = {ModeType = 0}
          },
          ["1701260588760276844"] = {
            key = "1701260588760276844",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1423.4135356589388, y = 340.56509313811773},
            propsData = {ModeType = 0}
          },
          ["1701260588760276846"] = {
            key = "1701260588760276846",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1701260642479282363"] = {
            key = "1701260642479282363",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\166\187\229\188\128\231\150\151\229\133\187\233\153\162",
            pos = {x = 897.4666436579566, y = 325.16520749263003},
            propsData = {
              RegionType = 1,
              IsEnter = "Leave",
              RegionId = 101106,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_LeaveSanatorium"
            }
          },
          ["1701260642479282364"] = {
            key = "1701260642479282364",
            type = "TalkNode",
            name = "\229\138\168\232\186\171\229\142\187\229\165\165\229\147\165\229\174\182",
            pos = {x = 891.0393427682512, y = 10.595779244456955},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10107601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17067162163804583"] = {
            key = "17067162163804583",
            type = "TalkNode",
            name = "\230\129\169\233\135\140\229\133\139\231\154\132\229\190\133\230\156\186\229\175\185\232\175\157",
            pos = {x = 894.8007518796992, y = 164.91228070175433},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200005,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "Npc_101075Enlike_1200065",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10107701,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
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
          ["1725432797960378378"] = {
            key = "1725432797960378378",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\232\137\190\232\142\137\232\142\142\229\146\140\232\181\155\231\144\170",
            pos = {x = 1140.1950755765984, y = 524.6425031490251},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1200156, 1200157}
            }
          }
        },
        commentData = {}
      }
    },
    ["1701260945535298827"] = {
      isStoryNode = true,
      key = "1701260945535298827",
      type = "StoryNode",
      name = "\229\144\145\229\165\165\229\147\165\230\138\165\229\145\138",
      pos = {x = -295.9200992763726, y = 707.4349438825567},
      propsData = {
        QuestId = 10020412,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020412",
        QuestDeatil = "QuestDesc_10020412",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = true,
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
            startQuest = "1704175979205198711",
            startPort = "QuestStart",
            endQuest = "1704175979205198715",
            endPort = "In"
          },
          {
            startQuest = "1701312301240324474",
            startPort = "Out",
            endQuest = "1704175979205198714",
            endPort = "In"
          },
          {
            startQuest = "1704175979205198714",
            startPort = "Out",
            endQuest = "1701312359321327793",
            endPort = "In"
          },
          {
            startQuest = "1701334641681476075",
            startPort = "Out",
            endQuest = "1701312301240324474",
            endPort = "In"
          },
          {
            startQuest = "1704175979205198715",
            startPort = "Out",
            endQuest = "1701334641681476075",
            endPort = "In"
          },
          {
            startQuest = "1701312359321327793",
            startPort = "Out",
            endQuest = "170859909309199963",
            endPort = "In"
          },
          {
            startQuest = "170859909309199963",
            startPort = "Out",
            endQuest = "1704175979205198712",
            endPort = "Success"
          },
          {
            startQuest = "1704175979205198715",
            startPort = "Out",
            endQuest = "17508352481632982189",
            endPort = "In"
          }
        },
        nodeData = {
          ["1701312301240324474"] = {
            key = "1701312301240324474",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144 \229\165\165\229\147\165",
            pos = {x = 107.25205585202069, y = 160.0187372660492},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190278}
            }
          },
          ["1701312359321327793"] = {
            key = "1701312359321327793",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129 \229\165\165\229\147\165",
            pos = {x = 635.1419239943991, y = 131.9671770077992},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190278}
            }
          },
          ["1701334641681476075"] = {
            key = "1701334641681476075",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 108.80911924504466, y = -10.161397672338722},
            propsData = {WaitTime = 2}
          },
          ["1704175979205198711"] = {
            key = "1704175979205198711",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -443.91432101958407, y = 144.27094558673505},
            propsData = {ModeType = 0}
          },
          ["1704175979205198712"] = {
            key = "1704175979205198712",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1126.255092967191, y = 134.55232965883613},
            propsData = {ModeType = 0}
          },
          ["1704175979205198713"] = {
            key = "1704175979205198713",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 893.3015596958415, y = 263.0118884395639},
            propsData = {}
          },
          ["1704175979205198714"] = {
            key = "1704175979205198714",
            type = "TalkNode",
            name = "\229\144\145\229\165\165\229\147\165\230\177\135\230\138\165",
            pos = {x = 358.87611370673864, y = 123.44153388391172},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200021,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_101078Aote_1190278",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10107801,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101078",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
              SkipToOption = true,
              DisableNpcOptimization = true,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              PauseNpcBT = true,
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = true,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1704175979205198715"] = {
            key = "1704175979205198715",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\228\189\141\228\186\142\229\134\176\230\185\150\229\159\142",
            pos = {x = -187.32132499930148, y = 144.8961667299365},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_Auto2"
            }
          },
          ["170859909309199963"] = {
            key = "170859909309199963",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 871.8373102084474, y = 131.84145704609708},
            propsData = {WaitTime = 1}
          },
          ["17508352481632982189"] = {
            key = "17508352481632982189",
            type = "TalkNode",
            name = "\229\138\168\232\186\171\229\142\187\229\165\165\229\147\165\229\174\182",
            pos = {x = 117.43478260869598, y = 322.47282608695645},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10107601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1701312586718335632"] = {
      isStoryNode = true,
      key = "1701312586718335632",
      type = "StoryNode",
      name = "\232\191\148\229\155\158\229\142\159\229\164\132\239\188\140\231\173\137\229\190\133\230\129\169\233\135\140\229\133\139",
      pos = {x = 984.5254405046647, y = 518.8262943200596},
      propsData = {
        QuestId = 10020410,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020410",
        QuestDeatil = "QuestDesc_10020410",
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
            startQuest = "1701312586718335633",
            startPort = "QuestStart",
            endQuest = "1701312631867341052",
            endPort = "In"
          },
          {
            startQuest = "1701312631867341052",
            startPort = "Out",
            endQuest = "1701313188435354046",
            endPort = "In"
          },
          {
            startQuest = "1701313188435354046",
            startPort = "Out",
            endQuest = "1701313129800350037",
            endPort = "In"
          },
          {
            startQuest = "1701313129800350037",
            startPort = "Out",
            endQuest = "1701312614194338334",
            endPort = "In"
          },
          {
            startQuest = "1701312631867341052",
            startPort = "Out",
            endQuest = "170671408892353521",
            endPort = "In"
          },
          {
            startQuest = "1701312614194338334",
            startPort = "Out",
            endQuest = "1701312614194338335",
            endPort = "In"
          },
          {
            startQuest = "1701312614194338335",
            startPort = "Out",
            endQuest = "1701312586718335635",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1701312586718335633"] = {
            key = "1701312586718335633",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 187.38598442714152, y = 287.98665183537264},
            propsData = {ModeType = 0}
          },
          ["1701312586718335635"] = {
            key = "1701312586718335635",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1994.877419354839, y = 299.22580645161287},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 8,
              IsWhite = false
            }
          },
          ["1701312586718335637"] = {
            key = "1701312586718335637",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1701312614194338334"] = {
            key = "1701312614194338334",
            type = "TalkNode",
            name = "\230\129\169\229\136\169\229\133\139\233\137\180\229\174\154\229\174\140\230\175\149",
            pos = {x = 1206.5268169910928, y = 278.6914794181093},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10107501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101075",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
                  TalkActorId = 200005,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200005}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1701312614194338335"] = {
            key = "1701312614194338335",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144 \230\129\169\233\135\140\229\133\139",
            pos = {x = 1464.1700802306798, y = 287.00970947433893},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1200065}
            }
          },
          ["1701312631867341052"] = {
            key = "1701312631867341052",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\228\189\141\228\186\142\231\150\151\229\133\187\233\153\162",
            pos = {x = 451.6944803194302, y = 285.20823670550124},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101106,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "P10106801"
            }
          },
          ["1701313129800350037"] = {
            key = "1701313129800350037",
            type = "GoToNode",
            name = "goto \231\150\151\229\133\187\233\153\162\233\151\168\229\143\163",
            pos = {x = 962.9384551062304, y = 293.0188617265684},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1200050,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1200050"
            }
          },
          ["1701313188435354046"] = {
            key = "1701313188435354046",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 719.5117309682994, y = 288.86910352640035},
            propsData = {WaitTime = 1}
          },
          ["170671408892353521"] = {
            key = "170671408892353521",
            type = "TalkNode",
            name = "\231\177\179\229\168\133\231\154\132\229\190\133\230\156\186\229\175\185\232\175\157",
            pos = {x = 726.6546732199948, y = 124.53840381566212},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700049,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "Npc_101073Miya_1200064",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10107401,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
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
          }
        },
        commentData = {}
      }
    },
    ["1704353127695158062"] = {
      isStoryNode = true,
      key = "1704353127695158062",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\150\151\229\133\187\233\153\162",
      pos = {x = -397.8871144359646, y = 494.30838581001535},
      propsData = {
        QuestId = 10020406,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020406",
        QuestDeatil = "QuestDesc_10020406",
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
            startQuest = "1704353127695158071",
            startPort = "QuestStart",
            endQuest = "1704353127695158074",
            endPort = "In"
          },
          {
            startQuest = "17240689851724040106",
            startPort = "Out",
            endQuest = "1704353127695158072",
            endPort = "Success"
          },
          {
            startQuest = "1704353127695158074",
            startPort = "Out",
            endQuest = "17469795791134001269",
            endPort = "In"
          },
          {
            startQuest = "17469795791134001269",
            startPort = "Out",
            endQuest = "17581627969955871",
            endPort = "In"
          },
          {
            startQuest = "17469795791134001271",
            startPort = "Out",
            endQuest = "17581628306076239",
            endPort = "In"
          },
          {
            startQuest = "17581627969955871",
            startPort = "Out",
            endQuest = "17469795791134001270",
            endPort = "In"
          },
          {
            startQuest = "17469795791134001270",
            startPort = "Out",
            endQuest = "17469795791134001271",
            endPort = "In"
          },
          {
            startQuest = "17581628306076239",
            startPort = "Out",
            endQuest = "17240689851724040106",
            endPort = "In"
          }
        },
        nodeData = {
          ["1704353127695158071"] = {
            key = "1704353127695158071",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -99.73684210526307, y = 139.21052631578948},
            propsData = {ModeType = 0}
          },
          ["1704353127695158072"] = {
            key = "1704353127695158072",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1119.0999090787209, y = 103.27522150333594},
            propsData = {ModeType = 0}
          },
          ["1704353127695158073"] = {
            key = "1704353127695158073",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1091.8518927631835, y = 426.5832550565018},
            propsData = {}
          },
          ["1704353127695158074"] = {
            key = "1704353127695158074",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\231\150\151\229\133\187\233\153\162",
            pos = {x = 155.58029550416546, y = 140.40114110966994},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101106,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "P10106801"
            }
          },
          ["172085567759117622"] = {
            key = "172085567759117622",
            type = "TalkNode",
            name = "\231\187\174\230\153\182\229\184\166\230\157\165\228\186\134\239\188\159",
            pos = {x = 436.2690883995232, y = -69.2844751866491},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10106800,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101068",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
              EndNewTargetPointName = "P101068Player",
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
                  TalkActorId = 200005,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200059,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200045,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200005},
                {TalkActorType = "Npc", TalkActorId = 200045},
                {TalkActorType = "Npc", TalkActorId = 200059}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17240689851724040106"] = {
            key = "17240689851724040106",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\177\179\229\168\133",
            pos = {x = 761.8672574278773, y = 460.69010455399354},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1200064}
            }
          },
          ["17240692340804390043"] = {
            key = "17240692340804390043",
            type = "TalkNode",
            name = "\231\177\179\229\168\133\229\190\133\230\156\186\229\175\185\232\175\157",
            pos = {x = 1038.0858431899414, y = -138.30416204896852},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700049,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 20003601,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
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
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17469795791134001269"] = {
            key = "17469795791134001269",
            type = "TalkNode",
            name = "\231\187\174\230\153\182\229\184\166\230\157\165\228\186\134\239\188\159",
            pos = {x = 445.1016210492013, y = 117.18849366997021},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10106802,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101068",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
                  TalkActorId = 200005,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200005}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17469795791134001270"] = {
            key = "17469795791134001270",
            type = "TalkNode",
            name = "\230\162\179\229\164\180\229\143\145",
            pos = {x = 446.98898100107766, y = 436.70424673411037},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "LevelSequence'/Game/Asset/Cinematics/Story/OBT01/OBT0101/OBT0101_SC016/SQ_OBT0101_SC016.SQ_OBT0101_SC016'",
              InType = "BlendIn",
              OutType = "BlendOut",
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
          },
          ["17469795791134001271"] = {
            key = "17469795791134001271",
            type = "TalkNode",
            name = "\232\181\155\231\144\170\239\188\129",
            pos = {x = 760.8427319497321, y = 109.16098683443407},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10106902,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101069",
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
              EndNewTargetPointName = "P10106904",
              CameraLookAtTartgetPoint = "P101073Nvzhu",
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
                  TalkActorId = 200045,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200006,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200045},
                {TalkActorType = "Npc", TalkActorId = 200006}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17469804936446566506"] = {
            key = "17469804936446566506",
            type = "SendMessageNode",
            name = "\232\181\155\231\144\170sit",
            pos = {x = 689.8764430014428, y = 698.6640179995445},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "SaiqiSit",
              UnitId = -1
            }
          },
          ["17469805045656566738"] = {
            key = "17469805045656566738",
            type = "SendMessageNode",
            name = "\232\181\155\231\144\170sit",
            pos = {x = 698.0257936507934, y = 818.9886933242198},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "SaiqiSit",
              UnitId = -1
            }
          },
          ["17581627969955871"] = {
            key = "17581627969955871",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 442.08615936035295, y = 297.8109023592894},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["17581628306076239"] = {
            key = "17581628306076239",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 759.4511993382962, y = 298.46598920792457},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          }
        },
        commentData = {
          ["1733799806045870326"] = {
            key = "1733799806045870326",
            name = "\231\148\168TalkTrigger\229\129\154",
            position = {x = 908.5, y = -345.5},
            size = {width = 600, height = 400}
          }
        }
      }
    },
    ["17195703113832106389"] = {
      isStoryNode = true,
      key = "17195703113832106389",
      type = "StoryNode",
      name = "\232\191\148\229\155\158\230\141\174\231\130\185\233\151\168\229\143\163",
      pos = {x = 708.0003917565726, y = 78.44359405148813},
      propsData = {
        QuestId = 10020404,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020404",
        QuestDeatil = "QuestDesc_10020404",
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
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_1190035"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17195703113832106405",
            startPort = "Out",
            endQuest = "17195703113832106401",
            endPort = "In"
          },
          {
            startQuest = "17195710011242246929",
            startPort = "Out",
            endQuest = "17195703113832106405",
            endPort = "In"
          },
          {
            startQuest = "17195703113832106393",
            startPort = "QuestStart",
            endQuest = "1722522925707322990",
            endPort = "In"
          },
          {
            startQuest = "1722522925707322990",
            startPort = "Out",
            endQuest = "17195710011242246929",
            endPort = "In"
          },
          {
            startQuest = "17195703113832106393",
            startPort = "QuestStart",
            endQuest = "1727599865040212773",
            endPort = "In"
          },
          {
            startQuest = "17195710011242246929",
            startPort = "Out",
            endQuest = "1727600026616397781",
            endPort = "In"
          },
          {
            startQuest = "17562944185653586",
            startPort = "Out",
            endQuest = "17241439146473044001",
            endPort = "In"
          },
          {
            startQuest = "17195703113832106403",
            startPort = "Out",
            endQuest = "17195703113832106394",
            endPort = "Success"
          },
          {
            startQuest = "17195703113832106401",
            startPort = "Out",
            endQuest = "17588085907864146",
            endPort = "In"
          },
          {
            startQuest = "17588085907864146",
            startPort = "Out",
            endQuest = "17195703113832106403",
            endPort = "In"
          }
        },
        nodeData = {
          ["17195703113832106393"] = {
            key = "17195703113832106393",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -59.31255819458811, y = 355.5794839422394},
            propsData = {ModeType = 0}
          },
          ["17195703113832106394"] = {
            key = "17195703113832106394",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1730.0107872135127, y = 377.5595324423473},
            propsData = {ModeType = 0}
          },
          ["17195703113832106395"] = {
            key = "17195703113832106395",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1470.7555095638063, y = 544.928704887977},
            propsData = {}
          },
          ["17195703113832106401"] = {
            key = "17195703113832106401",
            type = "TalkNode",
            name = "\228\187\138\229\164\169\229\143\145\231\148\159\228\186\134\229\190\136\229\164\154\228\186\139",
            pos = {x = 956.6982039941721, y = 368.1422103833018},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10106501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101065",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17195703113832106403"] = {
            key = "17195703113832106403",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\230\154\130\229\129\156\233\159\179\228\185\144",
            pos = {x = 1474.41826210619, y = 398.7032367415218},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17195703113832106405"] = {
            key = "17195703113832106405",
            type = "PlayOrStopBGMNode",
            name = "\230\146\173\230\148\190\230\154\130\229\129\156\233\159\179\228\185\144",
            pos = {x = 700.8698667086859, y = 368.87896027086657},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/mute.mute'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17195710011242246929"] = {
            key = "17195710011242246929",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\141\174\231\130\185\233\151\168\229\143\163",
            pos = {x = 451.2317486388695, y = 368.72451921590005},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190035,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1190035"
            }
          },
          ["1722522925707322990"] = {
            key = "1722522925707322990",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 218.7284136344204, y = 358.2820850202429},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight1",
              UnitId = -1
            }
          },
          ["17241439146473044001"] = {
            key = "17241439146473044001",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\230\184\133\230\153\168",
            pos = {x = 1630.618895355434, y = 39.32156767082398},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityDay",
              UnitId = -1
            }
          },
          ["1727599865040212773"] = {
            key = "1727599865040212773",
            type = "TalkNode",
            name = "\229\165\165\229\147\165\231\154\132\229\190\133\230\156\186\229\175\185\232\175\157",
            pos = {x = 213.3130553148755, y = 203.71428571428567},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200021,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "Npc_101085Aote_1190281",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10106401,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
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
          ["1727600026616397781"] = {
            key = "1727600026616397781",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129 \230\151\167\229\165\165\229\147\165",
            pos = {x = 698.9285714285706, y = 227.28571428571425},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190272}
            }
          },
          ["17562944185653586"] = {
            key = "17562944185653586",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1309.9999999999998, y = 47.04642857142869},
            propsData = {WaitTime = 1}
          },
          ["17588085907864146"] = {
            key = "17588085907864146",
            type = "SendMessageNode",
            name = "\230\158\129\229\133\137\231\187\147\230\157\159",
            pos = {x = 1225.5542264752792, y = 399.3582887700536},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeAuroraOff",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["17214569789492575411"] = {
      isStoryNode = true,
      key = "17214569789492575411",
      type = "StoryNode",
      name = "\227\128\144\229\141\176\232\177\161\229\175\185\232\175\157\227\128\145\229\146\140\232\181\155\231\144\170\232\129\138\232\129\138",
      pos = {x = 123.79485666690755, y = 349.1465938325645},
      propsData = {
        QuestId = 10020407,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020407",
        QuestDeatil = "QuestDesc_10020407",
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
            startQuest = "1725344718653397824",
            startPort = "Out",
            endQuest = "17214569789492575415",
            endPort = "Success"
          },
          {
            startQuest = "17214569789492575412",
            startPort = "QuestStart",
            endQuest = "1729601076823962358",
            endPort = "In"
          },
          {
            startQuest = "1729601076823962358",
            startPort = "Out",
            endQuest = "173606411853411553168",
            endPort = "In"
          },
          {
            startQuest = "173606411853411553168",
            startPort = "Out",
            endQuest = "1725344718653397824",
            endPort = "In"
          }
        },
        nodeData = {
          ["17214569789492575412"] = {
            key = "17214569789492575412",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 769.4152923538231, y = 321.2709030100334},
            propsData = {ModeType = 0}
          },
          ["17214569789492575415"] = {
            key = "17214569789492575415",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2247.5440993788816, y = 337.62857142857143},
            propsData = {ModeType = 0}
          },
          ["17214569789492575418"] = {
            key = "17214569789492575418",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2005, y = 732.1428571428571},
            propsData = {}
          },
          ["1725344718653397824"] = {
            key = "1725344718653397824",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\230\146\173\230\148\190\231\171\153\230\161\169bgm",
            pos = {x = 1493.3125058815199, y = 326.62959734661155},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["1729601076823962358"] = {
            key = "1729601076823962358",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\231\150\151\229\133\187\233\153\162",
            pos = {x = 1006.1496774309444, y = 321.58127764114545},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101106,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_Sanatorium"
            }
          },
          ["173606411853411553168"] = {
            key = "173606411853411553168",
            type = "TalkNode",
            name = "\229\144\145\232\181\155\231\144\170\230\137\147\230\142\162\230\182\136\230\129\175",
            pos = {x = 1244.315640064511, y = 304.68963895469756},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200006,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_101069Saiqi_1200157",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10107001,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_101070",
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
                  TalkActorId = 200006,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200006}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1725954150101591776"] = {
      isStoryNode = true,
      key = "1725954150101591776",
      type = "StoryNode",
      name = "AI\232\183\145\230\173\165",
      pos = {x = -55.352494953000146, y = 516.7255808913468},
      propsData = {
        QuestId = 10020407,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020407",
        QuestDeatil = "QuestDesc_10020407",
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
            startQuest = "1725954150101591780",
            startPort = "QuestStart",
            endQuest = "1725954150101591783",
            endPort = "In"
          },
          {
            startQuest = "1725954188948593169",
            startPort = "Out",
            endQuest = "1725954188948593170",
            endPort = "In"
          },
          {
            startQuest = "1725954150101591783",
            startPort = "Out",
            endQuest = "1725954188948593169",
            endPort = "In"
          },
          {
            startQuest = "17259580360182262880",
            startPort = "Out",
            endQuest = "17259580360182262881",
            endPort = "In"
          },
          {
            startQuest = "1725954188948593172",
            startPort = "Out",
            endQuest = "17259580360182262880",
            endPort = "In"
          },
          {
            startQuest = "1725954188948593173",
            startPort = "Out",
            endQuest = "17259580360182262878",
            endPort = "In"
          },
          {
            startQuest = "1742797123006791954",
            startPort = "Out",
            endQuest = "1742797123006791955",
            endPort = "In"
          },
          {
            startQuest = "1725954188948593170",
            startPort = "Out",
            endQuest = "174280815091314972814",
            endPort = "In"
          },
          {
            startQuest = "17259580360182262881",
            startPort = "Out",
            endQuest = "174280817486614973301",
            endPort = "In"
          },
          {
            startQuest = "174280817486614973301",
            startPort = "Out",
            endQuest = "1742797123006791954",
            endPort = "In"
          },
          {
            startQuest = "1742797123006791955",
            startPort = "Out",
            endQuest = "17473952525902026973",
            endPort = "In"
          },
          {
            startQuest = "17473952525902026973",
            startPort = "Out",
            endQuest = "1725954150101591781",
            endPort = "Success"
          },
          {
            startQuest = "1725954188948593170",
            startPort = "Out",
            endQuest = "1725954188948593172",
            endPort = "In"
          }
        },
        nodeData = {
          ["1725954150101591780"] = {
            key = "1725954150101591780",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -194.95423340961088, y = 139.21052631578948},
            propsData = {ModeType = 0}
          },
          ["1725954150101591781"] = {
            key = "1725954150101591781",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2549.5723352033215, y = 139.67210963935446},
            propsData = {ModeType = 0}
          },
          ["1725954150101591782"] = {
            key = "1725954150101591782",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1301.8518927631835, y = 319.44039791364463},
            propsData = {}
          },
          ["1725954150101591783"] = {
            key = "1725954150101591783",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\231\150\151\229\133\187\233\153\162",
            pos = {x = 77.31942593894807, y = 141.7054889357569},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101106,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "P10106801"
            }
          },
          ["1725954150101591785"] = {
            key = "1725954150101591785",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\231\142\169\229\174\182\231\167\187\229\136\176\231\171\153\230\161\169\231\187\147\230\157\159\229\144\142\231\154\132\228\189\141\231\189\174",
            pos = {x = 492.5428571428568, y = 421.7785714285716},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["1725954188948593169"] = {
            key = "1725954188948593169",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\181\155\231\144\170\229\146\140\232\137\190\232\142\137\232\142\142",
            pos = {x = 330.8399727566574, y = 131.21810082564252},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1200069, 1200156}
            }
          },
          ["1725954188948593170"] = {
            key = "1725954188948593170",
            type = "SendMessageNode",
            name = "\232\181\155\231\144\170go",
            pos = {x = 578.0934423305025, y = 132.71797086377103},
            propsData = {
              MessageType = "BehaviorTree",
              MessageContent = "SaiqiGoHome",
              UnitId = 200006
            }
          },
          ["1725954188948593171"] = {
            key = "1725954188948593171",
            type = "SendMessageNode",
            name = "\232\137\190\232\142\137\232\165\191\228\186\154go",
            pos = {x = 520.1547822745658, y = -90.09180538845354},
            propsData = {
              MessageType = "BehaviorTree",
              MessageContent = "AlyssaGo",
              UnitId = 200045
            }
          },
          ["1725954188948593172"] = {
            key = "1725954188948593172",
            type = "WaitOfTimeNode",
            name = "\231\173\137\232\181\155\231\144\170\232\183\145\229\136\176\228\189\141",
            pos = {x = 1046.962830386854, y = 127.44481203144342},
            propsData = {WaitTime = 7}
          },
          ["1725954188948593173"] = {
            key = "1725954188948593173",
            type = "WaitOfTimeNode",
            name = "\231\173\137\232\137\190\232\142\137\232\142\142\232\183\145\229\136\176\228\189\141",
            pos = {x = 558.0444093180186, y = -246.3880197163616},
            propsData = {WaitTime = 6}
          },
          ["1725954233766776331"] = {
            key = "1725954233766776331",
            type = "TalkNode",
            name = "\232\137\190\232\142\137\232\142\142\229\190\133\230\156\186\229\175\185\232\175\157",
            pos = {x = 1769.0639364416918, y = -167.18181605952856},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200045,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 20003501,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
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
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17259580360182262878"] = {
            key = "17259580360182262878",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\232\137\190\232\142\137\232\165\191\228\186\154",
            pos = {x = 887.5195632003089, y = -228.74671488431622},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1200070}
            }
          },
          ["17259580360182262879"] = {
            key = "17259580360182262879",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\137\190\232\142\137\232\165\191\228\186\154\230\155\191\232\186\171",
            pos = {x = 879.0901105273783, y = -16.834499563405345},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1200156}
            }
          },
          ["17259580360182262880"] = {
            key = "17259580360182262880",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\232\181\155\231\144\170",
            pos = {x = 1354.5428435298982, y = 124.15805610110274},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1200069}
            }
          },
          ["17259580360182262881"] = {
            key = "17259580360182262881",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\181\155\231\144\170\230\155\191\232\186\171",
            pos = {x = 1588.3788683746188, y = 129.435074734643},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1200157}
            }
          },
          ["1742797123006791954"] = {
            key = "1742797123006791954",
            type = "TalkNode",
            name = "\229\144\145\232\181\155\231\144\170\230\137\147\230\142\162\230\182\136\230\129\175",
            pos = {x = 1831.0103505785396, y = 133.21941474343708},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200006,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_101069Saiqi_1200157",
              DelayShowGuideTime = 0,
              FirstDialogueId = 10107001,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_101070",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
              SkipToOption = true,
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
                  TalkActorId = 200006,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200006}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742797123006791955"] = {
            key = "1742797123006791955",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\230\146\173\230\148\190\231\171\153\230\161\169bgm",
            pos = {x = 2077.784994173326, y = 142.93715091312887},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["174280815091314972814"] = {
            key = "174280815091314972814",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\231\187\153\232\181\155\231\144\170\230\140\130\230\140\135\229\188\149\231\130\185",
            pos = {x = 801.0643390425994, y = 261.96717171717194},
            propsData = {
              IsShow = true,
              GuideType = "N",
              GuideName = "Npc_101068Saiqi_1200069"
            }
          },
          ["174280817486614973301"] = {
            key = "174280817486614973301",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\232\181\155\231\144\170\229\143\150\230\182\136\230\140\135\229\188\149\231\130\185",
            pos = {x = 1631.0643390425994, y = 319.74494949494965},
            propsData = {
              IsShow = false,
              GuideType = "N",
              GuideName = "Npc_101068Saiqi_1200069"
            }
          },
          ["174281356942917854668"] = {
            key = "174281356942917854668",
            type = "TalkNode",
            name = "\229\144\145\232\181\155\231\144\170\230\137\147\230\142\162\230\182\136\230\129\175",
            pos = {x = 2137.591165413534, y = 472.3599624060149},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10107031,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17473952525902026973"] = {
            key = "17473952525902026973",
            type = "WaitOfTimeNode",
            name = "1",
            pos = {x = 2318.178647376016, y = 144.4061384521909},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {
          ["1733799767735869448"] = {
            key = "1733799767735869448",
            name = "\231\148\168TalkTrigger\229\129\154",
            position = {x = 1648.102272727273, y = -318.2045454545455},
            size = {width = 374.99999999999994, height = 321.8181818181818}
          }
        }
      }
    }
  },
  commentData = {}
}
