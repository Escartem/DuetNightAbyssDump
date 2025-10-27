return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17422013783831",
      startPort = "StoryStart",
      endStory = "1742201391511260",
      endPort = "In"
    },
    {
      startStory = "1742201391511260",
      startPort = "Success",
      endStory = "17422013783845",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17422013783831"] = {
      isStoryNode = true,
      key = "17422013783831",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 744.1379310344828, y = 318.62068965517244},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17422013783845"] = {
      isStoryNode = true,
      key = "17422013783845",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1302.7586206896551, y = 314.2068965517241},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1742201391511260"] = {
      isStoryNode = true,
      key = "1742201391511260",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1018.4827586206898, y = 304.41379310344826},
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
            startQuest = "1742201391512271",
            startPort = "Out",
            endQuest = "17422032266211041739",
            endPort = "In"
          },
          {
            startQuest = "17422085268285721065",
            startPort = "Out",
            endQuest = "17422085446106240911",
            endPort = "In"
          },
          {
            startQuest = "17422032266211041739",
            startPort = "Out",
            endQuest = "1742202793318521699",
            endPort = "In"
          },
          {
            startQuest = "17424865707381047203",
            startPort = "Out",
            endQuest = "17422085268285721065",
            endPort = "In"
          },
          {
            startQuest = "1742202793318521699",
            startPort = "Out",
            endQuest = "17426211356414172",
            endPort = "In"
          },
          {
            startQuest = "1742201391512268",
            startPort = "QuestStart",
            endQuest = "17426212030085275",
            endPort = "In"
          },
          {
            startQuest = "17426212030085275",
            startPort = "Out",
            endQuest = "17424865707381047203",
            endPort = "In"
          },
          {
            startQuest = "1742201391512268",
            startPort = "QuestStart",
            endQuest = "17426231946011575063",
            endPort = "In"
          },
          {
            startQuest = "17426231946011575063",
            startPort = "Out",
            endQuest = "17426236393562625898",
            endPort = "In"
          },
          {
            startQuest = "1742201391512268",
            startPort = "QuestStart",
            endQuest = "17426236454012626102",
            endPort = "In"
          },
          {
            startQuest = "17426236454012626102",
            startPort = "Out",
            endQuest = "1742201391512271",
            endPort = "In"
          },
          {
            startQuest = "17426236454012626102",
            startPort = "Out",
            endQuest = "1742201391512265",
            endPort = "In"
          },
          {
            startQuest = "17426212030085275",
            startPort = "Out",
            endQuest = "17601720579201246281",
            endPort = "In"
          },
          {
            startQuest = "17422085446106240911",
            startPort = "Out",
            endQuest = "17601720677451246484",
            endPort = "In"
          },
          {
            startQuest = "17601720677451246484",
            startPort = "Out",
            endQuest = "1742201391512269",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742201391512265"] = {
            key = "1742201391512265",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 225.94247005721377, y = 901.0648653687749},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["1742201391512268"] = {
            key = "1742201391512268",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -382.4319191210849, y = 752.0836950956165},
            propsData = {ModeType = 0}
          },
          ["1742201391512269"] = {
            key = "1742201391512269",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1323.1706349206354, y = 1026.6825396825398},
            propsData = {ModeType = 0}
          },
          ["1742201391512270"] = {
            key = "1742201391512270",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1937.4480286738353, y = 208.1917562724014},
            propsData = {}
          },
          ["1742201391512271"] = {
            key = "1742201391512271",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 224.40175051105973, y = 747.4115250107535},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140401,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 0,
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
          ["1742202793318521699"] = {
            key = "1742202793318521699",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 716.590792272244, y = 748.1324170900785},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140453,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_110304",
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
                  TalkActorType = "Npc",
                  TalkActorId = 790026,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790027,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790029,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790026},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790027},
                {TalkActorType = "Npc", TalkActorId = 790029}
              },
              OptionType = "normal",
              FreezeWorldComposition = true,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17422032266211041739"] = {
            key = "17422032266211041739",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 469.1635329276455, y = 745.986551754697},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140402,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 0,
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
          ["17422085268285721065"] = {
            key = "17422085268285721065",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 472.6825396825397, y = 1021.6269841269843},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140451,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 0,
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
          ["17422085446106240911"] = {
            key = "17422085446106240911",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 720.3015873015873, y = 1022.9365079365081},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140452,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 0,
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
          ["17424865707381047203"] = {
            key = "17424865707381047203",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 216.35714285714278, y = 1026.888888888889},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140441,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_Sew_110304",
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
                  TalkActorType = "Npc",
                  TalkActorId = 790028,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790029,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790028},
                {TalkActorType = "Npc", TalkActorId = 790029}
              },
              OptionType = "normal",
              FreezeWorldComposition = true,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17426211356414172"] = {
            key = "17426211356414172",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 968.114285714286, y = 757.725},
            propsData = {
              ModeType = 1,
              Id = 101703,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17426212030085275"] = {
            key = "17426212030085275",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = -40.393343573988744, y = 1027.2655913978494},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101703,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17426231946011575063"] = {
            key = "17426231946011575063",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = -65.05522658043287, y = 583.7604266048795},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17426236393562625898"] = {
            key = "17426236393562625898",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 229.4763324593073, y = 599.4490471948159},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17426236454012626102"] = {
            key = "17426236454012626102",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = -66.77366754069271, y = 754.1365471948159},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17601720579201246281"] = {
            key = "17601720579201246281",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 230.48983957219238, y = 1219.8020435446908},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt02/0040_story_enlike_death",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["17601720677451246484"] = {
            key = "17601720677451246484",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1000.4898395721925, y = 1031.2306149732622},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 1,
              SoundType = 0
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
