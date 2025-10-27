return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "174364668103714097091",
      startPort = "StoryStart",
      endStory = "1743518811729790526",
      endPort = "In"
    },
    {
      startStory = "1743518811729790526",
      startPort = "Success",
      endStory = "1743518819586790740",
      endPort = "In"
    },
    {
      startStory = "1743519128383796070",
      startPort = "Success",
      endStory = "174364668103714097092",
      endPort = "StoryEnd"
    },
    {
      startStory = "1743518819586790740",
      startPort = "Success",
      endStory = "17453186284463876956",
      endPort = "In"
    },
    {
      startStory = "17453186284463876956",
      startPort = "Success",
      endStory = "1743519128383796070",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1743518811729790526"] = {
      isStoryNode = true,
      key = "1743518811729790526",
      type = "StoryNode",
      name = "\233\133\146\233\166\134\233\151\168\229\143\163\229\175\185\232\175\157",
      pos = {x = 1126.8329831932776, y = 307.8607142857143},
      propsData = {
        QuestId = 20022801,
        QuestDescriptionComment = "\233\147\129\229\140\160\231\154\142\231\154\142\229\143\171\228\189\143\228\186\134\232\135\170\229\183\177",
        QuestDescription = "Description_200228_1",
        QuestDeatil = "Content_200228_1",
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
            startQuest = "1743518811729790527",
            startPort = "QuestStart",
            endQuest = "1743518894532792190",
            endPort = "In"
          },
          {
            startQuest = "1743518894532792190",
            startPort = "Out",
            endQuest = "1743518903459792382",
            endPort = "In"
          },
          {
            startQuest = "1743518903459792382",
            startPort = "Out",
            endQuest = "17441658273943533",
            endPort = "In"
          },
          {
            startQuest = "17441658273943533",
            startPort = "Out",
            endQuest = "1743518811729790530",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1743518811729790527"] = {
            key = "1743518811729790527",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 810, y = 304.44444444444446},
            propsData = {ModeType = 0}
          },
          ["1743518811729790530"] = {
            key = "1743518811729790530",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1854.7853118258797, y = 307.82403812099545},
            propsData = {ModeType = 0}
          },
          ["1743518811729790533"] = {
            key = "1743518811729790533",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1743518894532792190"] = {
            key = "1743518894532792190",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1075.5238095238096, y = 302.4257703081233},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191326,
              GuideType = "M",
              GuidePointName = "Mechanism_200228Duanzao_1191326"
            }
          },
          ["1743518903459792382"] = {
            key = "1743518903459792382",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1332.725134084642, y = 308.1508349076065},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20022801",
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
                  TalkActorId = 230001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 230002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 230001},
                {TalkActorType = "Npc", TalkActorId = 230002},
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
          ["17441658273943533"] = {
            key = "17441658273943533",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1603.1344502522497, y = 308.8215270192957},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 2,
              SoundType = 0,
              SoundUnitKey = "sidestory_tiejiangjiaojiao"
            }
          }
        },
        commentData = {}
      }
    },
    ["1743518819586790740"] = {
      isStoryNode = true,
      key = "1743518819586790740",
      type = "StoryNode",
      name = "\229\155\158\230\141\174\231\130\185",
      pos = {x = 1362.749747407324, y = 310.2947371781142},
      propsData = {
        QuestId = 20022802,
        QuestDescriptionComment = "\229\155\158\228\188\145\230\134\169\228\185\139\230\137\128\229\146\140\233\147\129\229\140\160\229\175\185\232\175\157",
        QuestDescription = "Description_200228_2",
        QuestDeatil = "Content_200228_2",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
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
            startQuest = "1743518819586790741",
            startPort = "QuestStart",
            endQuest = "17444494019899023",
            endPort = "In"
          },
          {
            startQuest = "1743518939108793242",
            startPort = "Out",
            endQuest = "17522011008421731",
            endPort = "In"
          },
          {
            startQuest = "17522011008421731",
            startPort = "Out",
            endQuest = "1743518819586790744",
            endPort = "Success"
          },
          {
            startQuest = "17444494019899023",
            startPort = "Out",
            endQuest = "1743518939108793242",
            endPort = "In"
          }
        },
        nodeData = {
          ["1743518819586790741"] = {
            key = "1743518819586790741",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 938.25, y = 342},
            propsData = {ModeType = 0}
          },
          ["1743518819586790744"] = {
            key = "1743518819586790744",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2188.7, y = 297.29999999999995},
            propsData = {ModeType = 0}
          },
          ["1743518819586790747"] = {
            key = "1743518819586790747",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2069.406349206349, y = 517.5238095238095},
            propsData = {}
          },
          ["1743518939108793242"] = {
            key = "1743518939108793242",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1582.2555555555555, y = 258.4888888888889},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009107,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20022804",
              BlendInTime = 1,
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
                  TalkActorId = 230001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 230002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 230001},
                {TalkActorType = "Npc", TalkActorId = 230002},
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
          ["1743518949644793506"] = {
            key = "1743518949644793506",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1018.9850427350427, y = 79.97222222222223},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_HomeBase"
            }
          },
          ["17444494019899023"] = {
            key = "17444494019899023",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1266.6353383458645, y = 308.4631578947368},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1210104,
              GuideType = "M",
              GuidePointName = "P20022802"
            }
          },
          ["17522010884241235"] = {
            key = "17522010884241235",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1442, y = 51.199999999999974},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 2,
              SoundType = 0,
              SoundPath = "",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {210101},
              ClientRelatedRegionId = {},
              SoundUnitKey = "sidestory_tiejiangjiaojiao"
            }
          },
          ["17522011008421731"] = {
            key = "17522011008421731",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1839.6460084033615, y = 153.9972049689441},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 2,
              SoundType = 0,
              SoundUnitKey = "sidestory_tiejiangjiaojiao"
            }
          },
          ["1752201541271956184"] = {
            key = "1752201541271956184",
            type = "OpenSytstemUINode",
            name = "\230\137\147\229\188\128\231\149\140\233\157\162\232\138\130\231\130\185",
            pos = {x = 1742.8460084033613, y = 522.3972049689442},
            propsData = {
              UIName = "ActivityFeinaEventLevelSelect"
            }
          }
        },
        commentData = {}
      }
    },
    ["1743518842283791435"] = {
      isStoryNode = true,
      key = "1743518842283791435",
      type = "StoryNode",
      name = "\231\173\137\229\190\133\229\188\149\229\175\188\229\174\140\230\136\144",
      pos = {x = 1622.5484586286368, y = 102.35040405621356},
      propsData = {
        QuestId = 20022803,
        QuestDescriptionComment = "\231\173\137\229\190\133\233\148\187\233\128\160\229\188\149\229\175\188",
        QuestDescription = "Description_200228_3",
        QuestDeatil = "Content_200228_3",
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
            startQuest = "1743518842283791436",
            startPort = "QuestStart",
            endQuest = "1743519111982795637",
            endPort = "In"
          },
          {
            startQuest = "1743519111982795637",
            startPort = "Out",
            endQuest = "1743518842283791439",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1743518842283791436"] = {
            key = "1743518842283791436",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 796.6666666666666, y = 326.6666666666667},
            propsData = {ModeType = 0}
          },
          ["1743518842283791439"] = {
            key = "1743518842283791439",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1327.2222222222224, y = 323.77777777777777},
            propsData = {ModeType = 0}
          },
          ["1743518842283791442"] = {
            key = "1743518842283791442",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1712, y = 522},
            propsData = {}
          },
          ["1743519111982795637"] = {
            key = "1743519111982795637",
            type = "WaitingCompleteSysGuideNode",
            name = "\231\173\137\229\190\133\229\174\140\230\136\144\230\140\135\229\188\149",
            pos = {x = 1073.0526315789475, y = 325.38596491228066},
            propsData = {SystemGuideId = 2053}
          }
        },
        commentData = {}
      }
    },
    ["1743519128383796070"] = {
      isStoryNode = true,
      key = "1743519128383796070",
      type = "StoryNode",
      name = "\229\188\149\229\175\188\229\174\140\230\136\144\229\144\142\232\135\170\229\138\168\229\175\185\232\175\157",
      pos = {x = 1861.7687547305861, y = 308.30710311053275},
      propsData = {
        QuestId = 20022804,
        QuestDescriptionComment = "\229\146\140\233\147\129\229\140\160\231\154\142\231\154\142\229\175\185\232\175\157",
        QuestDescription = "Description_200228_3",
        QuestDeatil = "Content_200228_3",
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
            startQuest = "1743519135543796301",
            startPort = "Out",
            endQuest = "17441658685214217",
            endPort = "In"
          },
          {
            startQuest = "174359410844612564075",
            startPort = "Out",
            endQuest = "1743519128383796074",
            endPort = "Success"
          },
          {
            startQuest = "1743519128383796071",
            startPort = "QuestStart",
            endQuest = "17457245157335785657",
            endPort = "In"
          },
          {
            startQuest = "17457245157335785657",
            startPort = "Out",
            endQuest = "1743519135543796301",
            endPort = "In"
          },
          {
            startQuest = "17441658685214217",
            startPort = "Out",
            endQuest = "174359410844612564075",
            endPort = "In"
          }
        },
        nodeData = {
          ["1743519128383796071"] = {
            key = "1743519128383796071",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1743519128383796074"] = {
            key = "1743519128383796074",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2170.2588932806325, y = 324.6897233201581},
            propsData = {ModeType = 0}
          },
          ["1743519128383796077"] = {
            key = "1743519128383796077",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1364.8695652173913, y = 474.5217391304348},
            propsData = {}
          },
          ["1743519135543796301"] = {
            key = "1743519135543796301",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1322.4016304347826, y = 301.4592391304348},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009110,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20022804",
              BlendInTime = 1,
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
                  TalkActorId = 230001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 230002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 230001},
                {TalkActorType = "Npc", TalkActorId = 230002},
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
          ["174359410844612564075"] = {
            key = "174359410844612564075",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1882.0676929477845, y = 310.3509985437903},
            propsData = {WaitTime = 0.2}
          },
          ["17441658685214217"] = {
            key = "17441658685214217",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1611.8735177865613, y = 311.27667984189736},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 2,
              SoundType = 0,
              SoundUnitKey = "sidestory_tiejiangjiaojiao"
            }
          },
          ["17457245157335785657"] = {
            key = "17457245157335785657",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1072.4257246376812, y = 297.6305413469736},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_HomeBase"
            }
          }
        },
        commentData = {}
      }
    },
    ["174364668103714097091"] = {
      isStoryNode = true,
      key = "174364668103714097091",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 868.6999999999999, y = 318.2068965517241},
      propsData = {QuestChainId = 200228},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["174364668103714097092"] = {
      isStoryNode = true,
      key = "174364668103714097092",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2132.816666666667, y = 322.996551724138},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17453186284463876956"] = {
      isStoryNode = true,
      key = "17453186284463876956",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\144\231\155\174\230\160\135",
      pos = {x = 1606, y = 312.7424812030076},
      propsData = {
        QuestId = 20022803,
        QuestDescriptionComment = "\229\174\140\230\136\144\230\173\166\229\153\168\233\148\187\233\128\160",
        QuestDescription = "Description_200228_3",
        QuestDeatil = "Content_200228_3",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        InRegionExportName = "",
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        GameModeTargetId = 20022803,
        GameModeKeyCount = 1,
        QuestHintMessageId = 0,
        IsShowGuide = true,
        GuideType = "P",
        GuidePointName = "P20022802",
        InterfaceJumpId = 0
      },
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    }
  },
  commentData = {}
}
