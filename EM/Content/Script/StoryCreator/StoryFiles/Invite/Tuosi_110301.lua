return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17426216898661",
      startPort = "StoryStart",
      endStory = "174262169681783",
      endPort = "In"
    },
    {
      startStory = "174262169681783",
      startPort = "Success",
      endStory = "17426216898665",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17426216898661"] = {
      isStoryNode = true,
      key = "17426216898661",
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
    ["17426216898665"] = {
      isStoryNode = true,
      key = "17426216898665",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1378.5, y = 300},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["174262169681783"] = {
      isStoryNode = true,
      key = "174262169681783",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1071.478927203065, y = 288.9655172413793},
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
            startQuest = "174262169681792",
            startPort = "Out",
            endQuest = "174262169681895",
            endPort = "In"
          },
          {
            startQuest = "174262169681895",
            startPort = "Out",
            endQuest = "174262169681894",
            endPort = "In"
          },
          {
            startQuest = "174262169681894",
            startPort = "Out",
            endQuest = "1742885080280696",
            endPort = "In"
          },
          {
            startQuest = "1742885080280696",
            startPort = "Out",
            endQuest = "17428868479241045747",
            endPort = "In"
          },
          {
            startQuest = "17428868479241045747",
            startPort = "Out",
            endQuest = "17429098682024176147",
            endPort = "In"
          },
          {
            startQuest = "17429098682024176147",
            startPort = "Out",
            endQuest = "17429099439644176647",
            endPort = "In"
          },
          {
            startQuest = "17429099439644176647",
            startPort = "Out",
            endQuest = "174262169681790",
            endPort = "Success"
          },
          {
            startQuest = "174262169681789",
            startPort = "QuestStart",
            endQuest = "17528095401014490651",
            endPort = "In"
          },
          {
            startQuest = "17528095401014490651",
            startPort = "Out",
            endQuest = "174262169681893",
            endPort = "In"
          },
          {
            startQuest = "174262169681789",
            startPort = "QuestStart",
            endQuest = "17528095406924490669",
            endPort = "In"
          },
          {
            startQuest = "17528095406924490669",
            startPort = "Out",
            endQuest = "174262169681792",
            endPort = "In"
          }
        },
        nodeData = {
          ["174262169681789"] = {
            key = "174262169681789",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -41.30588117851744, y = 611.0899279931538},
            propsData = {ModeType = 0}
          },
          ["174262169681790"] = {
            key = "174262169681790",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1722.7302807733847, y = 742.7689462861877},
            propsData = {ModeType = 0}
          },
          ["174262169681791"] = {
            key = "174262169681791",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1937.4480286738353, y = 208.1917562724014},
            propsData = {}
          },
          ["174262169681792"] = {
            key = "174262169681792",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 519.0709893604457, y = 677.8095714087998},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140101,
              FlowAssetPath = "",
              TalkType = "BlackISS",
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
          ["174262169681893"] = {
            key = "174262169681893",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 558.6452853065756, y = 513.4305338660176},
            propsData = {
              ModeType = 1,
              Id = 101901,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["174262169681894"] = {
            key = "174262169681894",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 464.6262446494813, y = 867.1592028043642},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140103,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_110301_01",
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
                  TalkActorId = 790030,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790031,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790032,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790036,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790030},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790031},
                {TalkActorType = "Npc", TalkActorId = 790032},
                {TalkActorType = "Npc", TalkActorId = 790036}
              },
              OptionType = "normal",
              FreezeWorldComposition = true,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["174262169681895"] = {
            key = "174262169681895",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 810.3415701681829, y = 674.7686793493244},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140102,
              FlowAssetPath = "",
              TalkType = "BlackISS",
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
          ["1742885080280696"] = {
            key = "1742885080280696",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 724.9806744979163, y = 874.2663887836301},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140140,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_110301_02",
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
                  TalkActorId = 790033,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790034,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790035,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790033},
                {TalkActorType = "Npc", TalkActorId = 790034},
                {TalkActorType = "Npc", TalkActorId = 790035},
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
          ["17428868479241045747"] = {
            key = "17428868479241045747",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 974.5738208152002, y = 880.6239966929624},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140143,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_110301_03",
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
                  TalkActorId = 790031,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790036,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790037,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790038,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790039,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790031},
                {TalkActorType = "Npc", TalkActorId = 790036},
                {TalkActorType = "Npc", TalkActorId = 790037},
                {TalkActorType = "Npc", TalkActorId = 790038},
                {TalkActorType = "Npc", TalkActorId = 790039},
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
          ["17429098682024176147"] = {
            key = "17429098682024176147",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1236.5566832592704, y = 881.1068758827378},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140162,
              FlowAssetPath = "",
              TalkType = "BlackISS",
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
          ["17429099439644176647"] = {
            key = "17429099439644176647",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1488.0951447977318, y = 882.2607220365841},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140163,
              FlowAssetPath = "",
              TalkType = "BlackISS",
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
          ["17528095401014490651"] = {
            key = "17528095401014490651",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 248, y = 500},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17528095406924490669"] = {
            key = "17528095406924490669",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 250, y = 672},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101901,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
