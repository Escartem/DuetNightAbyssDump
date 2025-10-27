return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17435595846971",
      startPort = "StoryStart",
      endStory = "1743559618139625",
      endPort = "In"
    },
    {
      startStory = "1743559618139625",
      startPort = "Success",
      endStory = "17435598526374889",
      endPort = "In"
    },
    {
      startStory = "17435601845837737",
      startPort = "Success",
      endStory = "17435595846985",
      endPort = "StoryEnd"
    },
    {
      startStory = "17435598526374889",
      startPort = "Success",
      endStory = "17552574373981827398",
      endPort = "In"
    },
    {
      startStory = "17552574373981827398",
      startPort = "Success",
      endStory = "17435601845837737",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17435595846971"] = {
      isStoryNode = true,
      key = "17435595846971",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 710, y = 308.1818181818182},
      propsData = {QuestChainId = 200229},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17435595846985"] = {
      isStoryNode = true,
      key = "17435595846985",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2141.984754376059, y = 308.9025974025973},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1743559618139625"] = {
      isStoryNode = true,
      key = "1743559618139625",
      type = "StoryNode",
      name = "\228\184\142\233\152\191\231\177\179\229\159\131\231\137\185\229\175\185\232\175\157",
      pos = {x = 1002.7143361024939, y = 294.51983980931357},
      propsData = {
        QuestId = 20022901,
        QuestDescriptionComment = "\228\184\142\233\152\191\231\177\179\229\159\131\231\137\185\229\175\185\232\175\157",
        QuestDescription = "Description_200229_1",
        QuestDeatil = "Content_200229_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
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
            startQuest = "1743559627483903",
            startPort = "Out",
            endQuest = "17442557202696837759",
            endPort = "In"
          },
          {
            startQuest = "17442557202696837759",
            startPort = "Out",
            endQuest = "1743559618140633",
            endPort = "Success"
          },
          {
            startQuest = "17442840937771644927",
            startPort = "Out",
            endQuest = "17435597604923729",
            endPort = "In"
          },
          {
            startQuest = "1743559618139626",
            startPort = "QuestStart",
            endQuest = "17442840937771644927",
            endPort = "In"
          },
          {
            startQuest = "17435597022192301",
            startPort = "Out",
            endQuest = "17444257246772268",
            endPort = "In"
          },
          {
            startQuest = "17444257364252540",
            startPort = "Out",
            endQuest = "17444257423042707",
            endPort = "In"
          },
          {
            startQuest = "17435597604923729",
            startPort = "Out",
            endQuest = "17435597022192301",
            endPort = "In"
          },
          {
            startQuest = "17435597022192301",
            startPort = "Out",
            endQuest = "1743559627483903",
            endPort = "In"
          },
          {
            startQuest = "17435597022192301",
            startPort = "Out",
            endQuest = "17444257364252540",
            endPort = "In"
          }
        },
        nodeData = {
          ["1743559618139626"] = {
            key = "1743559618139626",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 363.78787878787887, y = 331.0777777777778},
            propsData = {ModeType = 0}
          },
          ["1743559618140633"] = {
            key = "1743559618140633",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2058.3089094788497, y = 328.47268536996773},
            propsData = {ModeType = 0}
          },
          ["1743559618140640"] = {
            key = "1743559618140640",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2745.8302675585287, y = 579.4729096989968},
            propsData = {}
          },
          ["1743559627483903"] = {
            key = "1743559627483903",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1484.9759115700374, y = 303.78584036622874},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 230003,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Almit_SSS_1191330",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51009201,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20022901",
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
                  TalkActorId = 230002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 230003,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 230002},
                {TalkActorType = "Npc", TalkActorId = 230003}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17435597022192301"] = {
            key = "17435597022192301",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1205.0971317616347, y = 314.7912152305661},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191343,
              GuideType = "N",
              GuidePointName = "Npc_Almit_SSS_1191330"
            }
          },
          ["17435597604923729"] = {
            key = "17435597604923729",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 919.1767676767679, y = 325.35268065268076},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191330}
            }
          },
          ["17442557202696837759"] = {
            key = "17442557202696837759",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1786.4480359554593, y = 317.5472624446344},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 2,
              SoundType = 0,
              SoundUnitKey = "sidestory_tiejiangjiaojiao"
            }
          },
          ["17442840937771644927"] = {
            key = "17442840937771644927",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 642.3844842284742, y = 314.49857914180154},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "N",
              GuideName = "Npc_Almit_SSS_1191330"
            }
          },
          ["17444257246772268"] = {
            key = "17444257246772268",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\227\128\144\232\191\156\227\128\145",
            pos = {x = 1209.8519107871982, y = 150.53222410245561},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009243,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17444257364252540"] = {
            key = "17444257364252540",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1487.339246207196, y = 30.649692547323347},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1191344,
              GuideType = "N",
              GuidePointName = "Npc_Almit_SSS_1191330"
            }
          },
          ["17444257423042707"] = {
            key = "17444257423042707",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\227\128\144\232\191\145\227\128\145",
            pos = {x = 1731.7094278831057, y = -112.96359122772506},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009244,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
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
    ["17435598526374889"] = {
      isStoryNode = true,
      key = "17435598526374889",
      type = "StoryNode",
      name = "\232\191\148\229\155\158\230\141\174\231\130\185",
      pos = {x = 1289.8861431538203, y = 294.2231333883509},
      propsData = {
        QuestId = 20022902,
        QuestDescriptionComment = "\232\191\148\229\155\158\228\188\145\230\134\169\228\185\139\230\137\128",
        QuestDescription = "Description_200229_2",
        QuestDeatil = "Content_200229_2",
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
            startQuest = "17435598526374890",
            startPort = "QuestStart",
            endQuest = "17554235925141825498",
            endPort = "In"
          },
          {
            startQuest = "17554235925141825498",
            startPort = "Out",
            endQuest = "17435598526384893",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17435598526374890"] = {
            key = "17435598526374890",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1011.4436090225565, y = 329.406015037594},
            propsData = {ModeType = 0}
          },
          ["17435598526384893"] = {
            key = "17435598526384893",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1644.3655580044078, y = 336.33934081346416},
            propsData = {ModeType = 0}
          },
          ["17435598526384896"] = {
            key = "17435598526384896",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2086.6706896551723, y = 608.9559113300494},
            propsData = {}
          },
          ["17440012558381580158"] = {
            key = "17440012558381580158",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1100.1493388644024, y = 602.2723519674518},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_HomeBase"
            }
          },
          ["1751617732010952307"] = {
            key = "1751617732010952307",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1855.7, y = 69.89999999999998},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 230004,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_200229Ranse_1210123",
              DelayShowGuideTime = 0,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/SystemQuest/SystemQuest_Duanzao",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["1751617854667953061"] = {
            key = "1751617854667953061",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1558.3, y = -54.099999999999994},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1210123}
            }
          },
          ["1751617862853953351"] = {
            key = "1751617862853953351",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1885.4, y = -82.5},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1210123}
            }
          },
          ["17554235925141825498"] = {
            key = "17554235925141825498",
            type = "GoToRegionNode",
            name = "\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 1322, y = 312.00000000000006},
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
    ["17435601553186739"] = {
      isStoryNode = true,
      key = "17435601553186739",
      type = "StoryNode",
      name = "\231\173\137\230\159\147\232\137\178\229\188\149\229\175\188\229\174\140\230\136\144",
      pos = {x = 1621.653868792026, y = 18.096629686103483},
      propsData = {
        QuestId = 20022903,
        QuestDescriptionComment = "\229\176\157\232\175\149\230\159\147\232\137\178\231\179\187\231\187\159",
        QuestDescription = "Description_200229_3",
        QuestDeatil = "Content_200229_3",
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
            startQuest = "17435601553186740",
            startPort = "QuestStart",
            endQuest = "17435601637106942",
            endPort = "In"
          },
          {
            startQuest = "17435601637106942",
            startPort = "Out",
            endQuest = "17435601553196743",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17435601553186740"] = {
            key = "17435601553186740",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17435601553196743"] = {
            key = "17435601553196743",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1405.25, y = 301},
            propsData = {ModeType = 0}
          },
          ["17435601553196746"] = {
            key = "17435601553196746",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1397, y = 435.75},
            propsData = {}
          },
          ["17435601637106942"] = {
            key = "17435601637106942",
            type = "WaitingCompleteSysGuideNode",
            name = "\231\173\137\229\190\133\229\174\140\230\136\144\230\140\135\229\188\149",
            pos = {x = 1124.25, y = 297},
            propsData = {SystemGuideId = 2054}
          }
        },
        commentData = {}
      }
    },
    ["17435601845837737"] = {
      isStoryNode = true,
      key = "17435601845837737",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1850.9386944926414, y = 302.0304800462696},
      propsData = {
        QuestId = 20022904,
        QuestDescriptionComment = "\229\174\140\230\136\144\229\144\142\229\175\185\232\175\157",
        QuestDescription = "Description_200229_3",
        QuestDeatil = "Content_200229_3",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
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
            startQuest = "17435601845837738",
            startPort = "QuestStart",
            endQuest = "17457217694223975",
            endPort = "In"
          },
          {
            startQuest = "17435602110888152",
            startPort = "Out",
            endQuest = "1745724484966653",
            endPort = "In"
          },
          {
            startQuest = "1745724484966653",
            startPort = "Out",
            endQuest = "17435601845847741",
            endPort = "Success"
          },
          {
            startQuest = "17457217694223975",
            startPort = "Out",
            endQuest = "17554236147801826138",
            endPort = "In"
          },
          {
            startQuest = "17554236147801826138",
            startPort = "Out",
            endQuest = "17435602110888152",
            endPort = "In"
          }
        },
        nodeData = {
          ["17435601845837738"] = {
            key = "17435601845837738",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 541.0644677661169, y = 318.3958020989505},
            propsData = {ModeType = 0}
          },
          ["17435601845847741"] = {
            key = "17435601845847741",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1684.554617795997, y = 291.3793103448276},
            propsData = {ModeType = 0}
          },
          ["17435601845847744"] = {
            key = "17435601845847744",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1372.2068965517242, y = 485.37931034482756},
            propsData = {}
          },
          ["17435602110888152"] = {
            key = "17435602110888152",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1123.4482758620688, y = 137.1724137931035},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51009236,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20022904",
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
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 230002,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 230002}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17457217694223975"] = {
            key = "17457217694223975",
            type = "GoToRegionNode",
            name = "\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 813.7311437160674, y = 303.6074505317002},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_HomeBase"
            }
          },
          ["1745724484966653"] = {
            key = "1745724484966653",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1384, y = 314},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 2,
              SoundType = 0,
              SoundUnitKey = "sidestory_tiejiangjiaojiao"
            }
          },
          ["17554236147801826138"] = {
            key = "17554236147801826138",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 998, y = -58.00000000000006},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1210122,
              GuideType = "N",
              GuidePointName = "Npc_200229Ranse_1210123"
            }
          }
        },
        commentData = {}
      }
    },
    ["1743574264245534512"] = {
      isStoryNode = true,
      key = "1743574264245534512",
      type = "StoryNode",
      name = "\230\141\174\231\130\185\233\153\132\228\187\182\229\136\183NPC\239\188\140\229\188\128\232\189\166",
      pos = {x = 1107.2606584554521, y = 2.478976515475601},
      propsData = {
        QuestId = 20022905,
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
        lineData = {},
        nodeData = {
          ["1743574264245534513"] = {
            key = "1743574264245534513",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 766.25, y = 303.75},
            propsData = {ModeType = 0}
          },
          ["1743574264245534516"] = {
            key = "1743574264245534516",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1608.75, y = 301.75},
            propsData = {ModeType = 0}
          },
          ["1743574264245534519"] = {
            key = "1743574264245534519",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1613.5, y = 491},
            propsData = {}
          },
          ["1743574299237535317"] = {
            key = "1743574299237535317",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1051.9311145510837, y = 294.5745614035089},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 0,
              GuideType = "N",
              GuidePointName = ""
            }
          },
          ["1743574328252535839"] = {
            key = "1743574328252535839",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1273.9311145510837, y = 156.57456140350894},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10010101,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = true,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1743574358122536359"] = {
            key = "1743574358122536359",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1326.9311145510837, y = 313.3245614035088},
            propsData = {WaitTime = 0}
          }
        },
        commentData = {}
      }
    },
    ["17552574373981827398"] = {
      isStoryNode = true,
      key = "17552574373981827398",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\144\231\155\174\230\160\135",
      pos = {x = 1575.6315789473688, y = 309.8708133971292},
      propsData = {
        QuestId = 20022903,
        QuestDescriptionComment = "\229\176\157\232\175\149\230\159\147\232\137\178\231\179\187\231\187\159",
        QuestDescription = "Description_200229_3",
        QuestDeatil = "Content_200229_3",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        InRegionExportName = "",
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        GameModeTargetId = 2000101,
        GameModeKeyCount = 1,
        QuestHintMessageId = 0,
        IsShowGuide = false,
        GuideType = "P",
        GuidePointName = "",
        InterfaceJumpId = 4
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
