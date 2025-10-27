return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17485896308493565760",
      startPort = "StoryStart",
      endStory = "17485896345763565908",
      endPort = "In"
    },
    {
      startStory = "17485896345763565908",
      startPort = "Success",
      endStory = "17485896308493565763",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17485896308493565760"] = {
      isStoryNode = true,
      key = "17485896308493565760",
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
    ["17485896308493565763"] = {
      isStoryNode = true,
      key = "17485896308493565763",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1686, y = 304},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17485896345763565908"] = {
      isStoryNode = true,
      key = "17485896345763565908",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1242, y = 304},
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
            startQuest = "1750409343631970496",
            startPort = "Out",
            endQuest = "1750409343630970495",
            endPort = "In"
          },
          {
            startQuest = "1750409343631970497",
            startPort = "Out",
            endQuest = "1750409343631970498",
            endPort = "In"
          },
          {
            startQuest = "1750409343631970500",
            startPort = "Out",
            endQuest = "1750409343631970499",
            endPort = "In"
          },
          {
            startQuest = "17485896345763565909",
            startPort = "QuestStart",
            endQuest = "1750409343631970497",
            endPort = "In"
          },
          {
            startQuest = "17485896345763565909",
            startPort = "QuestStart",
            endQuest = "1750409343631970500",
            endPort = "In"
          },
          {
            startQuest = "1750409343631970499",
            startPort = "Out",
            endQuest = "1750409468415971352",
            endPort = "In"
          },
          {
            startQuest = "1750409468415971352",
            startPort = "Out",
            endQuest = "1750409470294971402",
            endPort = "In"
          },
          {
            startQuest = "17485896345763565909",
            startPort = "QuestStart",
            endQuest = "17504112098421938550",
            endPort = "In"
          },
          {
            startQuest = "17504112098421938550",
            startPort = "Out",
            endQuest = "1750409343631970496",
            endPort = "In"
          },
          {
            startQuest = "1750409470294971402",
            startPort = "Out",
            endQuest = "17600792813141780",
            endPort = "In"
          },
          {
            startQuest = "17504112098421938550",
            startPort = "Out",
            endQuest = "1760079343367623912",
            endPort = "In"
          },
          {
            startQuest = "1750409343631970500",
            startPort = "Out",
            endQuest = "1760079370229624390",
            endPort = "In"
          },
          {
            startQuest = "1760079408572625217",
            startPort = "Out",
            endQuest = "17485896345773565912",
            endPort = "Success"
          },
          {
            startQuest = "17600792813141780",
            startPort = "Out",
            endQuest = "1760407717784979",
            endPort = "In"
          },
          {
            startQuest = "17600792813141780",
            startPort = "Out",
            endQuest = "1760079388697624802",
            endPort = "In"
          },
          {
            startQuest = "1760407717784979",
            startPort = "Out",
            endQuest = "1760079408572625217",
            endPort = "In"
          },
          {
            startQuest = "1750409470294971402",
            startPort = "Out",
            endQuest = "1760409524790776",
            endPort = "In"
          }
        },
        nodeData = {
          ["17485896345763565909"] = {
            key = "17485896345763565909",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17485896345773565912"] = {
            key = "17485896345773565912",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3199.2484948002184, y = 496.49616858237556},
            propsData = {ModeType = 0}
          },
          ["17485896345773565915"] = {
            key = "17485896345773565915",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3120.357142857143, y = 641.0714285714286},
            propsData = {}
          },
          ["1750409343630970495"] = {
            key = "1750409343630970495",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1814, y = 290.5},
            propsData = {
              ModeType = 1,
              Id = 102101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1750409343631970496"] = {
            key = "1750409343631970496",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1527, y = 265.5},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80180301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_540103",
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
                  TalkActorId = 790045,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790057,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790045},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790057}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1750409343631970497"] = {
            key = "1750409343631970497",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1208, y = -59.277777777777786},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1750409343631970498"] = {
            key = "1750409343631970498",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1525, y = -36.277777777777786},
            propsData = {
              ModeType = 1,
              Id = 103201,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1750409343631970499"] = {
            key = "1750409343631970499",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1518, y = 474.5},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80180315,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_540103_1",
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
                  TalkActorType = "Npc",
                  TalkActorId = 790045,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110029,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790045},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 110029}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1750409343631970500"] = {
            key = "1750409343631970500",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1204.2222222222222, y = 488.5},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 102101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1750409468415971352"] = {
            key = "1750409468415971352",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1804, y = 478},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80180321,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_540103_2",
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
                  TalkActorType = "Npc",
                  TalkActorId = 790045,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110028,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790045},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 110028}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1750409470294971402"] = {
            key = "1750409470294971402",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2082, y = 478},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80180331,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_540103_3",
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
                  TalkActorType = "Npc",
                  TalkActorId = 790045,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110025,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790045},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 110025}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17504112098421938550"] = {
            key = "17504112098421938550",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1196.888888888889, y = 271.77777777777777},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 103201,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17600792813141780"] = {
            key = "17600792813141780",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2359.7886162687887, y = 475.1852692075014},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80180352,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = false,
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
          ["1760079343367623912"] = {
            key = "1760079343367623912",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1524.8460875331564, y = 128.55691671707984},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["1760079370229624390"] = {
            key = "1760079370229624390",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1522.623865310934, y = 639.668027828191},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt02/0057_scene_ex01_prepare",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["1760079388697624802"] = {
            key = "1760079388697624802",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2645.6000557871243, y = 643.0013611615243},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt02/0066_story_daphnis_surrender",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["1760079408572625217"] = {
            key = "1760079408572625217",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2922.2270399141084, y = 486.3743770345402},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 1,
              SoundType = 0
            }
          },
          ["1760407717784979"] = {
            key = "1760407717784979",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2639.3973191060154, y = 477.5302861389818},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80180355,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = false,
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
          ["1760409524790776"] = {
            key = "1760409524790776",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 2357.229341736694, y = 643.8018207282915},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
