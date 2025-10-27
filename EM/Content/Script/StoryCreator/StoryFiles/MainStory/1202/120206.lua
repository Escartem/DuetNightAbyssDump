return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1742891256151720375",
      startPort = "StoryStart",
      endStory = "1742891256151720377",
      endPort = "In"
    },
    {
      startStory = "1742891256151720377",
      startPort = "Success",
      endStory = "1742891256151720378",
      endPort = "In"
    },
    {
      startStory = "1742891256151720378",
      startPort = "Success",
      endStory = "1742891256151720379",
      endPort = "In"
    },
    {
      startStory = "1742891256151720379",
      startPort = "Success",
      endStory = "1742891256151720380",
      endPort = "In"
    },
    {
      startStory = "1742891256151720380",
      startPort = "Success",
      endStory = "1742891256151720381",
      endPort = "In"
    },
    {
      startStory = "1742891256151720381",
      startPort = "Success",
      endStory = "1742891256151720382",
      endPort = "In"
    },
    {
      startStory = "1742891256151720382",
      startPort = "Success",
      endStory = "1742891256151720383",
      endPort = "In"
    },
    {
      startStory = "1742891256151720383",
      startPort = "Success",
      endStory = "1742891256151720384",
      endPort = "In"
    },
    {
      startStory = "1742891256151720384",
      startPort = "Success",
      endStory = "1742891256151720376",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1742891256151720375"] = {
      isStoryNode = true,
      key = "1742891256151720375",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 300},
      propsData = {QuestChainId = 120206},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1742891256151720376"] = {
      isStoryNode = true,
      key = "1742891256151720376",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 3295.803571428571, y = 266.38392857142856},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1742891256151720377"] = {
      isStoryNode = true,
      key = "1742891256151720377",
      type = "StoryNode",
      name = "\232\191\148\229\155\158\231\153\190\229\185\180\230\152\165",
      pos = {x = 1102.3333333333333, y = 287.50000000000006},
      propsData = {
        QuestId = 12020601,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120206_1",
        QuestDeatil = "Content_120206_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
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
            startQuest = "1742891256151720385",
            startPort = "QuestStart",
            endQuest = "1742891256151720388",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720388",
            startPort = "Out",
            endQuest = "1742891256151720389",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720388",
            startPort = "Out",
            endQuest = "1742891256151720390",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720390",
            startPort = "Out",
            endQuest = "1742891256151720391",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720391",
            startPort = "Out",
            endQuest = "1742891256151720386",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256151720385"] = {
            key = "1742891256151720385",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256151720386"] = {
            key = "1742891256151720386",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3050.3590342131856, y = 425.3290797187284},
            propsData = {ModeType = 0}
          },
          ["1742891256151720387"] = {
            key = "1742891256151720387",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256151720388"] = {
            key = "1742891256151720388",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2214.97619047619, y = 443.2857142857142},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_Bainianchun"
            }
          },
          ["1742891256151720389"] = {
            key = "1742891256151720389",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\176\143\231\153\189\229\144\144\230\167\189",
            pos = {x = 2453.3095238095234, y = 290.7857142857142},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742891256151720390"] = {
            key = "1742891256151720390",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\231\153\190\229\185\180\230\152\165",
            pos = {x = 2493.071428571428, y = 444.3571428571428},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930158,
              GuideType = "P",
              GuidePointName = "QuestPoint_Bainianchun"
            }
          },
          ["1742891256151720391"] = {
            key = "1742891256151720391",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\231\167\152\228\185\166\229\175\185\232\175\157",
            pos = {x = 2776.6428571428564, y = 433.28571428571416},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_35",
              BlendInTime = 1,
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210022,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210022}
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
    ["1742891256151720378"] = {
      isStoryNode = true,
      key = "1742891256151720378",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\233\187\145\233\190\153\231\165\173\229\157\155",
      pos = {x = 1370.5185463659145, y = 287.36178681999115},
      propsData = {
        QuestId = 12020602,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120206_2",
        QuestDeatil = "Content_120206_2",
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
            startQuest = "1742891256151720392",
            startPort = "QuestStart",
            endQuest = "1742891256151720395",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720395",
            startPort = "Out",
            endQuest = "1742891256151720396",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720396",
            startPort = "Out",
            endQuest = "1742891256151720398",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720398",
            startPort = "Out",
            endQuest = "1742891256151720397",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720397",
            startPort = "Out",
            endQuest = "1742891256151720399",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720399",
            startPort = "Out",
            endQuest = "1742891256151720393",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256151720392"] = {
            key = "1742891256151720392",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1862.8728248495693, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256151720393"] = {
            key = "1742891256151720393",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3383.847406306208, y = 435.79419599779817},
            propsData = {ModeType = 0}
          },
          ["1742891256151720394"] = {
            key = "1742891256151720394",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256151720395"] = {
            key = "1742891256151720395",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\233\187\145\233\190\153\230\158\151\228\188\160\233\128\129\231\130\185",
            pos = {x = 2114.381875230712, y = 441.8903654485049},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930162,
              GuideType = "P",
              GuidePointName = "QuestPoint_AltarEntrance"
            }
          },
          ["1742891256151720396"] = {
            key = "1742891256151720396",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2352.321222235415, y = 441.93694923167857},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_AltarStartPoint",
              FadeIn = true,
              FadeOut = true,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["1742891256151720397"] = {
            key = "1742891256151720397",
            type = "TalkNode",
            name = "\232\191\135\229\156\186 - \229\176\129\233\148\129\233\187\145\233\190\153",
            pos = {x = 2860.9258733982056, y = 429.37880969679475},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = -1,
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
          ["1742891256151720398"] = {
            key = "1742891256151720398",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\231\165\173\229\157\155",
            pos = {x = 2597.9026175842528, y = 441.2392748130739},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930163,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020602"
            }
          },
          ["1742891256151720399"] = {
            key = "1742891256151720399",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\230\173\162\230\181\129\228\186\164\230\181\129",
            pos = {x = 3118.3677338633224, y = 428.68113527819014},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_36",
              BlendInTime = -1,
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
                  TalkActorId = 210004,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210005,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210004},
                {TalkActorType = "Npc", TalkActorId = 210005},
                {TalkActorType = "Npc", TalkActorId = 200002}
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
    ["1742891256151720379"] = {
      isStoryNode = true,
      key = "1742891256151720379",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\131\155\233\152\180\231\154\132\233\162\157\233\166\150\229\164\132",
      pos = {x = 1635.4250340906349, y = 285.79584064626164},
      propsData = {
        QuestId = 12020603,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120206_3",
        QuestDeatil = "Content_120206_3",
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
            startQuest = "1742891256151720400",
            startPort = "QuestStart",
            endQuest = "1742891256151720403",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720403",
            startPort = "Out",
            endQuest = "1742891256151720404",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720405",
            startPort = "Out",
            endQuest = "1742891256151720406",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720407",
            startPort = "Out",
            endQuest = "1742891256151720408",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720403",
            startPort = "Out",
            endQuest = "1742891256151720405",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720405",
            startPort = "Out",
            endQuest = "1742891256151720407",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720407",
            startPort = "Out",
            endQuest = "1742891256151720401",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256151720400"] = {
            key = "1742891256151720400",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1862.8728248495693, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256151720401"] = {
            key = "1742891256151720401",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3002.418834877637, y = 442.2227674263696},
            propsData = {ModeType = 0}
          },
          ["1742891256151720402"] = {
            key = "1742891256151720402",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256151720403"] = {
            key = "1742891256151720403",
            type = "GoToNode",
            name = "\230\178\191\233\128\148\229\137\141\229\190\128\233\162\157\233\166\150\229\164\132",
            pos = {x = 2114.381875230712, y = 441.8903654485049},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930168,
              GuideType = "P",
              GuidePointName = "QuestPoint_120206031"
            }
          },
          ["1742891256151720404"] = {
            key = "1742891256151720404",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \231\131\155\233\152\1801",
            pos = {x = 2368.2142857142876, y = 281.4285714285716},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742891256151720405"] = {
            key = "1742891256151720405",
            type = "GoToNode",
            name = "\230\178\191\233\128\148\229\137\141\229\190\128\233\162\157\233\166\150\229\164\132",
            pos = {x = 2392.9052233296425, y = 440.9451827242525},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930169,
              GuideType = "P",
              GuidePointName = "QuestPoint_120206032"
            }
          },
          ["1742891256151720406"] = {
            key = "1742891256151720406",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \231\131\155\233\152\1802",
            pos = {x = 2642.451919527504, y = 284.4768951978257},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742891256151720407"] = {
            key = "1742891256151720407",
            type = "GoToNode",
            name = "\230\178\191\233\128\148\229\137\141\229\190\128\233\162\157\233\166\150\229\164\132",
            pos = {x = 2684.333794758214, y = 442.01661129568106},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930170,
              GuideType = "P",
              GuidePointName = "QuestPoint_120206033"
            }
          },
          ["1742891256151720408"] = {
            key = "1742891256151720408",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \231\131\155\233\152\1803",
            pos = {x = 2957.451919527504, y = 276.1976744186049},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
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
    ["1742891256151720380"] = {
      isStoryNode = true,
      key = "1742891256151720380",
      type = "StoryNode",
      name = "\229\176\129\229\141\176\231\131\155\233\152\180",
      pos = {x = 1893.6798103215722, y = 282.1400430369037},
      propsData = {
        QuestId = 12020604,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120206_4",
        QuestDeatil = "Content_120206_4",
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
            startQuest = "1742891256151720413",
            startPort = "Out",
            endQuest = "1742891256151720414",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720409",
            startPort = "QuestStart",
            endQuest = "1742891256151720413",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720414",
            startPort = "Out",
            endQuest = "1742891256151720412",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720412",
            startPort = "Out",
            endQuest = "1742891256151720415",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720412",
            startPort = "Out",
            endQuest = "1742891256151720416",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720416",
            startPort = "Out",
            endQuest = "1742891256151720417",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720417",
            startPort = "Out",
            endQuest = "1742891256151720418",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720418",
            startPort = "Out",
            endQuest = "1742891256151720410",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256151720409"] = {
            key = "1742891256151720409",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1679.6585391352835, y = 450.3671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256151720410"] = {
            key = "1742891256151720410",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3559.561692020494, y = 445.43705314065534},
            propsData = {ModeType = 0}
          },
          ["1742891256151720411"] = {
            key = "1742891256151720411",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3558.356759872987, y = 574.057879240435},
            propsData = {}
          },
          ["1742891256151720412"] = {
            key = "1742891256151720412",
            type = "TalkNode",
            name = "\232\191\155\232\161\140\229\176\129\229\141\176",
            pos = {x = 2461.428571428574, y = 438.9285714285717},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210023,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Seal_1930171",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 0,
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
          ["1742891256151720413"] = {
            key = "1742891256151720413",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 1932.2337802549919, y = 449.42824607516116},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_120206033"
            }
          },
          ["1742891256151720414"] = {
            key = "1742891256151720414",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\169\186NPC",
            pos = {x = 2180.6233626021544, y = 450.9288967819822},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930171}
            }
          },
          ["1742891256151720415"] = {
            key = "1742891256151720415",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 2727.1428571428587, y = 287.857142857143},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742891256151720416"] = {
            key = "1742891256151720416",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\231\169\186NPC",
            pos = {x = 2729.285714285716, y = 453.9285714285717},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930171}
            }
          },
          ["1742891256151720417"] = {
            key = "1742891256151720417",
            type = "TalkNode",
            name = "\232\191\135\229\156\186 - \231\142\169\229\174\182\229\157\160\232\144\189",
            pos = {x = 2993.9285714285734, y = 441.07142857142867},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = -1,
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
          ["1742891256151720418"] = {
            key = "1742891256151720418",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\156\186\229\133\179\233\184\159\230\138\181\232\190\190",
            pos = {x = 3261.7857142857183, y = 442.14285714285734},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_37",
              BlendInTime = -1,
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
                  TalkActorId = 210012,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210014,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210012},
                {TalkActorType = "Npc", TalkActorId = 210014}
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
    ["1742891256151720381"] = {
      isStoryNode = true,
      key = "1742891256151720381",
      type = "StoryNode",
      name = "\230\156\186\229\133\179\230\139\179\230\136\152\230\150\151",
      pos = {x = 2155.0000000000045, y = 281.42857142857156},
      propsData = {
        QuestId = 12020605,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120206_5",
        QuestDeatil = "Content_120206_5",
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
            startQuest = "1742891256151720419",
            startPort = "QuestStart",
            endQuest = "1742891256151720422",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720422",
            startPort = "Out",
            endQuest = "1742891256151720424",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720424",
            startPort = "Out",
            endQuest = "1742891256151720420",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256151720419"] = {
            key = "1742891256151720419",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2722.1585391352837, y = 454.6528471528471},
            propsData = {ModeType = 0}
          },
          ["1742891256151720420"] = {
            key = "1742891256151720420",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3532.7759777347796, y = 431.5084817120839},
            propsData = {ModeType = 0}
          },
          ["1742891256151720421"] = {
            key = "1742891256151720421",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3558.356759872987, y = 574.057879240435},
            propsData = {}
          },
          ["1742891256151720422"] = {
            key = "1742891256151720422",
            type = "TalkNode",
            name = "\230\156\186\229\133\179\230\139\179\230\136\152\230\150\151",
            pos = {x = 2987.500000000002, y = 444.2857142857144},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = -1,
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
          ["1742891256151720424"] = {
            key = "1742891256151720424",
            type = "TalkNode",
            name = "\229\164\167\233\163\142\228\185\157\231\171\160CG",
            pos = {x = 3244.642857142862, y = 438.92857142857156},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = -1,
              BlendOutTime = 1,
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
    ["1742891256151720382"] = {
      isStoryNode = true,
      key = "1742891256151720382",
      type = "StoryNode",
      name = "Boss\230\136\152\230\150\151",
      pos = {x = 2418.571428571433, y = 280.35714285714306},
      propsData = {
        QuestId = 12020606,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120206_6",
        QuestDeatil = "Content_120206_6",
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
            startQuest = "1742891256151720425",
            startPort = "QuestStart",
            endQuest = "1742891256151720428",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720428",
            startPort = "Out",
            endQuest = "1742891256151720429",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720429",
            startPort = "Out",
            endQuest = "1742891256151720430",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720430",
            startPort = "Out",
            endQuest = "1742891256151720426",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256151720425"] = {
            key = "1742891256151720425",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2722.1585391352837, y = 454.6528471528471},
            propsData = {ModeType = 0}
          },
          ["1742891256151720426"] = {
            key = "1742891256151720426",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3924.918834877637, y = 433.6513388549411},
            propsData = {ModeType = 0}
          },
          ["1742891256151720427"] = {
            key = "1742891256151720427",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4270.856759872987, y = 694.0578792404351},
            propsData = {}
          },
          ["1742891256151720428"] = {
            key = "1742891256151720428",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 3017.0178462598315, y = 454.1279069767445},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_AltarStartPoint",
              FadeIn = true,
              FadeOut = true,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["1742891256151720429"] = {
            key = "1742891256151720429",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\230\173\162\230\181\129\228\186\164\230\181\129",
            pos = {x = 3324.49292931631, y = 440.872093023256},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_38",
              BlendInTime = 1,
              BlendOutTime = -1,
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
                  TalkActorId = 210004,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210004},
                {TalkActorType = "Npc", TalkActorId = 200002}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256151720430"] = {
            key = "1742891256151720430",
            type = "TalkNode",
            name = "Boss\230\136\152\230\150\151",
            pos = {x = 3600.357142857147, y = 440.0000000000002},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = -1,
              BlendOutTime = 1,
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
    ["1742891256151720383"] = {
      isStoryNode = true,
      key = "1742891256151720383",
      type = "StoryNode",
      name = "\230\136\152\229\144\142\229\137\167\230\131\133",
      pos = {x = 2695.0000000000055, y = 280.3571428571432},
      propsData = {
        QuestId = 12020607,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120206_7",
        QuestDeatil = "Content_120206_7",
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
            startQuest = "1742891256151720431",
            startPort = "QuestStart",
            endQuest = "1742891256151720434",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720434",
            startPort = "Out",
            endQuest = "1742891256151720435",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720435",
            startPort = "Out",
            endQuest = "1742891256151720432",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256151720431"] = {
            key = "1742891256151720431",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3018.944253420998, y = 455.7242757242756},
            propsData = {ModeType = 0}
          },
          ["1742891256151720432"] = {
            key = "1742891256151720432",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3912.0616920204943, y = 434.72276742636967},
            propsData = {ModeType = 0}
          },
          ["1742891256151720433"] = {
            key = "1742891256151720433",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4270.856759872987, y = 694.0578792404351},
            propsData = {}
          },
          ["1742891256151720434"] = {
            key = "1742891256151720434",
            type = "TalkNode",
            name = "\230\136\152\229\144\142\232\191\135\229\156\186",
            pos = {x = 3317.5000000000045, y = 443.21428571428595},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = -1,
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
          ["1742891256151720435"] = {
            key = "1742891256151720435",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\136\187\232\136\159\227\128\129\230\137\182\231\150\143\228\186\164\230\181\129",
            pos = {x = 3599.214285714292, y = 442.14285714285757},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_39",
              BlendInTime = -1,
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
                  TalkActorId = 210021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210013,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210021},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210013}
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
    ["1742891256151720384"] = {
      isStoryNode = true,
      key = "1742891256151720384",
      type = "StoryNode",
      name = "\231\166\187\229\188\128\233\187\145\233\190\153\231\165\173\229\157\155",
      pos = {x = 2965.0535714285775, y = 275.66510025062695},
      propsData = {
        QuestId = 12020608,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120206_8",
        QuestDeatil = "Content_120206_8",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
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
            startQuest = "1742891256151720436",
            startPort = "QuestStart",
            endQuest = "1742891256151720439",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720439",
            startPort = "Out",
            endQuest = "1742891256151720440",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720442",
            startPort = "Out",
            endQuest = "1742891256151720441",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720439",
            startPort = "Out",
            endQuest = "1742891256151720442",
            endPort = "In"
          },
          {
            startQuest = "1742891256151720441",
            startPort = "Out",
            endQuest = "1742891256151720437",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256151720436"] = {
            key = "1742891256151720436",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3018.006753420998, y = 455.7242757242756},
            propsData = {ModeType = 0}
          },
          ["1742891256151720437"] = {
            key = "1742891256151720437",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4102.553081963568, y = 444.2989296654589},
            propsData = {ModeType = 0}
          },
          ["1742891256151720438"] = {
            key = "1742891256151720438",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4270.856759872987, y = 694.0578792404351},
            propsData = {}
          },
          ["1742891256151720439"] = {
            key = "1742891256151720439",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 3283.8035714285775, y = 455.6651002506269},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_AltarLeave",
              FadeIn = true,
              FadeOut = true,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["1742891256151720440"] = {
            key = "1742891256151720440",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\176\143\231\153\189\229\144\144\230\167\189",
            pos = {x = 3541.7675657359773, y = 283.77876248971603},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742891256151720441"] = {
            key = "1742891256151720441",
            type = "TalkNode",
            name = "\232\191\135\229\156\186 - \230\152\143\231\157\161\231\186\162\232\140\182",
            pos = {x = 3812.479193642955, y = 443.4485299315764},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = 1,
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
          ["1742891256151720442"] = {
            key = "1742891256151720442",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\229\177\177\232\132\154\229\164\132",
            pos = {x = 3549.4559378290023, y = 455.30899504785555},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930182,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020608"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
