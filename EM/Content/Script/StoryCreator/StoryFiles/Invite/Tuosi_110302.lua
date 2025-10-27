return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17426217297281",
      startPort = "StoryStart",
      endStory = "1742971395435520332",
      endPort = "In"
    },
    {
      startStory = "1742971395435520332",
      startPort = "Success",
      endStory = "17426217297285",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17426217297281"] = {
      isStoryNode = true,
      key = "17426217297281",
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
    ["17426217297285"] = {
      isStoryNode = true,
      key = "17426217297285",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1341.6153846153848, y = 297.6923076923077},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1742971395435520332"] = {
      isStoryNode = true,
      key = "1742971395435520332",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1074.1935483870968, y = 288.83870967741933},
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
            startQuest = "1742971395436520340",
            startPort = "Out",
            endQuest = "1742971395436520343",
            endPort = "In"
          },
          {
            startQuest = "1742971395436520343",
            startPort = "Out",
            endQuest = "1742971395436520342",
            endPort = "In"
          },
          {
            startQuest = "1742971395436520342",
            startPort = "Out",
            endQuest = "17429764706543639904",
            endPort = "In"
          },
          {
            startQuest = "17429764706543639904",
            startPort = "Out",
            endQuest = "1743314154288524817",
            endPort = "In"
          },
          {
            startQuest = "1743314154288524817",
            startPort = "Out",
            endQuest = "17433181184802088920",
            endPort = "In"
          },
          {
            startQuest = "17433181184802088920",
            startPort = "Out",
            endQuest = "17433188005812610483",
            endPort = "In"
          },
          {
            startQuest = "17433188005812610483",
            startPort = "Out",
            endQuest = "17433188104172610772",
            endPort = "In"
          },
          {
            startQuest = "17433188104172610772",
            startPort = "Out",
            endQuest = "1742971395436520338",
            endPort = "Success"
          },
          {
            startQuest = "1742971395436520337",
            startPort = "QuestStart",
            endQuest = "17528096174225133239",
            endPort = "In"
          },
          {
            startQuest = "17528096174225133239",
            startPort = "Out",
            endQuest = "1742971395436520341",
            endPort = "In"
          },
          {
            startQuest = "17528096180935133258",
            startPort = "Out",
            endQuest = "1742971395436520340",
            endPort = "In"
          },
          {
            startQuest = "1742971395436520337",
            startPort = "QuestStart",
            endQuest = "17528096180935133258",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742971395436520337"] = {
            key = "1742971395436520337",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -71.30588117851744, y = 645.0899279931538},
            propsData = {ModeType = 0}
          },
          ["1742971395436520338"] = {
            key = "1742971395436520338",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1487.529193816863, y = 925.5461201992312},
            propsData = {ModeType = 0}
          },
          ["1742971395436520339"] = {
            key = "1742971395436520339",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1937.4480286738353, y = 208.1917562724014},
            propsData = {}
          },
          ["1742971395436520340"] = {
            key = "1742971395436520340",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 483.3062834780927, y = 731.5873491865776},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140201,
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
          ["1742971395436520341"] = {
            key = "1742971395436520341",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 486.7702853065756, y = 527.1805338660176},
            propsData = {
              ModeType = 1,
              Id = 101901,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1742971395436520342"] = {
            key = "1742971395436520342",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 965.3615387671284, y = 729.7842028043642},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140203,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_110302_01",
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
                  TalkActorId = 790040,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790042,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790043,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790040},
                {TalkActorType = "Npc", TalkActorId = 790042},
                {TalkActorType = "Npc", TalkActorId = 790043},
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
          ["1742971395436520343"] = {
            key = "1742971395436520343",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 726.0613769314679, y = 729.6575682382133},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140202,
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
          ["17429764706543639904"] = {
            key = "17429764706543639904",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1214.0869565217392, y = 729.4945652173913},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140219,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_110302_02",
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
                  TalkActorId = 790041,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790042,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790043,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790041},
                {TalkActorType = "Npc", TalkActorId = 790042},
                {TalkActorType = "Npc", TalkActorId = 790043},
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
          ["1743314154288524817"] = {
            key = "1743314154288524817",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 486.125, y = 923.5},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140252,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_110302_03",
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
                  TalkActorId = 790041,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790042,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790036,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790041},
                {TalkActorType = "Npc", TalkActorId = 790042},
                {TalkActorType = "Npc", TalkActorId = 790036},
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
          ["17433181184802088920"] = {
            key = "17433181184802088920",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 717.875, y = 922.5},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140266,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_110302_04",
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
                  TalkActorId = 790043,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790043},
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
          ["17433188005812610483"] = {
            key = "17433188005812610483",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 967.3750000000002, y = 924.375},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140268,
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
          ["17433188104172610772"] = {
            key = "17433188104172610772",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1200.6250000000002, y = 923.125},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80140269,
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
          ["17528096174225133239"] = {
            key = "17528096174225133239",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 201.875, y = 531.125},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17528096180935133258"] = {
            key = "17528096180935133258",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 197.5, y = 723.25},
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
