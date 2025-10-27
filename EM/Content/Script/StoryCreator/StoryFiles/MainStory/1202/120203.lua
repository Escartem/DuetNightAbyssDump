return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1742891256134715204",
      startPort = "StoryStart",
      endStory = "1742891256134715206",
      endPort = "In"
    },
    {
      startStory = "1742891256134715206",
      startPort = "Success",
      endStory = "1742891256134715207",
      endPort = "In"
    },
    {
      startStory = "1742891256134715207",
      startPort = "Success",
      endStory = "1742891256134715208",
      endPort = "In"
    },
    {
      startStory = "1742891256134715208",
      startPort = "Success",
      endStory = "1742891256134715209",
      endPort = "In"
    },
    {
      startStory = "1742891256134715209",
      startPort = "Success",
      endStory = "1742891256134715210",
      endPort = "In"
    },
    {
      startStory = "1742891256134715211",
      startPort = "Success",
      endStory = "1742891256134715212",
      endPort = "In"
    },
    {
      startStory = "1742891256134715212",
      startPort = "Success",
      endStory = "1742891256134715213",
      endPort = "In"
    },
    {
      startStory = "1742891256134715213",
      startPort = "Success",
      endStory = "1742891256134715214",
      endPort = "In"
    },
    {
      startStory = "1742891256134715214",
      startPort = "Success",
      endStory = "1742891256134715202",
      endPort = "In"
    },
    {
      startStory = "1742891256134715202",
      startPort = "Success",
      endStory = "1742891256134715203",
      endPort = "In"
    },
    {
      startStory = "1742891256134715215",
      startPort = "Success",
      endStory = "1742891256134715216",
      endPort = "In"
    },
    {
      startStory = "1742891256134715210",
      startPort = "Success",
      endStory = "1742891256134715211",
      endPort = "In"
    },
    {
      startStory = "1742891256134715203",
      startPort = "Success",
      endStory = "1742891256134715215",
      endPort = "In"
    },
    {
      startStory = "1742891256134715216",
      startPort = "Success",
      endStory = "1742891256134715205",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1742891256134715202"] = {
      isStoryNode = true,
      key = "1742891256134715202",
      type = "StoryNode",
      name = "\228\184\137\228\184\170\229\136\134\230\148\175\228\187\187\229\138\1613",
      pos = {x = 1830.5327474249889, y = 443.9851768920738},
      propsData = {
        QuestId = 12020310,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120203_10",
        QuestDeatil = "Content_120203_10",
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
            startQuest = "1742891256134715217",
            startPort = "QuestStart",
            endQuest = "1742891256134715220",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715220",
            startPort = "Out",
            endQuest = "1742891256134715221",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715221",
            startPort = "Out",
            endQuest = "1742891256134715218",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256134715217"] = {
            key = "1742891256134715217",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2273.2486754624683, y = 453.7065417341279},
            propsData = {ModeType = 0}
          },
          ["1742891256134715218"] = {
            key = "1742891256134715218",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3207.4197659422157, y = 434.91836736841645},
            propsData = {ModeType = 0}
          },
          ["1742891256134715219"] = {
            key = "1742891256134715219",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["1742891256134715220"] = {
            key = "1742891256134715220",
            type = "GoToNode",
            name = "\232\191\148\229\155\158\230\173\162\230\181\129\229\164\132",
            pos = {x = 2562.8282598627407, y = 454.71035430087187},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930084,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020310"
            }
          },
          ["1742891256134715221"] = {
            key = "1742891256134715221",
            type = "TalkNode",
            name = "\229\146\140\230\173\162\230\181\129\228\186\164\230\181\129",
            pos = {x = 2852.560060629024, y = 443.3310439560443},
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
          }
        },
        commentData = {}
      }
    },
    ["1742891256134715203"] = {
      isStoryNode = true,
      key = "1742891256134715203",
      type = "StoryNode",
      name = "\231\166\187\229\188\128\231\153\190\229\185\180\230\152\165",
      pos = {x = 2079.7492666815942, y = 441.55990819525346},
      propsData = {
        QuestId = 12020311,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120203_11",
        QuestDeatil = "Content_120203_11",
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
            startQuest = "1742891256134715222",
            startPort = "QuestStart",
            endQuest = "1742891256134715225",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715225",
            startPort = "Out",
            endQuest = "1742891256134715226",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715226",
            startPort = "Out",
            endQuest = "1742891256134715227",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715227",
            startPort = "Out",
            endQuest = "1742891256134715223",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256134715222"] = {
            key = "1742891256134715222",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2273.2486754624683, y = 453.7065417341279},
            propsData = {ModeType = 0}
          },
          ["1742891256134715223"] = {
            key = "1742891256134715223",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3424.6611452525603, y = 432.8494018511751},
            propsData = {ModeType = 0}
          },
          ["1742891256134715224"] = {
            key = "1742891256134715224",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["1742891256134715225"] = {
            key = "1742891256134715225",
            type = "GoToNode",
            name = "\231\166\187\229\188\128\231\153\190\229\185\180\230\152\165",
            pos = {x = 2554.629026146265, y = 453.6758715422513},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930085,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020311"
            }
          },
          ["1742891256134715226"] = {
            key = "1742891256134715226",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \233\187\145\229\184\130\229\149\134\228\186\186 Fixsimple03",
            pos = {x = 2813.2026938578642, y = 443.3310439560443},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_18",
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
                  TalkActorId = 210010,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210010}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256134715227"] = {
            key = "1742891256134715227",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \233\128\137\230\139\169\228\187\187\229\138\161",
            pos = {x = 3118.4221295945413, y = 441.2620784388029},
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
    ["1742891256134715204"] = {
      isStoryNode = true,
      key = "1742891256134715204",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 805.2173913043479, y = 286.95652173913044},
      propsData = {QuestChainId = 120203},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1742891256134715205"] = {
      isStoryNode = true,
      key = "1742891256134715205",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2819.6659207318976, y = 457.1472614569807},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1742891256134715206"] = {
      isStoryNode = true,
      key = "1742891256134715206",
      type = "StoryNode",
      name = "\230\151\160\231\148\177\231\148\159\232\129\154\233\155\134\229\156\176",
      pos = {x = 1081.9854139854142, y = 287.7142857142857},
      propsData = {
        QuestId = 12020301,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120203_1",
        QuestDeatil = "Content_120203_1",
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
        SubRegionId = 104109,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_2100002"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256134715229",
            startPort = "QuestStart",
            endQuest = "17509411052064605197",
            endPort = "In"
          },
          {
            startQuest = "17509411052064605197",
            startPort = "Out",
            endQuest = "1742891256134715228",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715228",
            startPort = "Out",
            endQuest = "17509411234464605602",
            endPort = "In"
          },
          {
            startQuest = "17509411234464605602",
            startPort = "Out",
            endQuest = "1742891256134715230",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256134715228"] = {
            key = "1742891256134715228",
            type = "GoToNode",
            name = "\230\151\160\231\148\177\231\148\159\232\129\154\233\155\134\229\156\176\231\155\146\229\173\144",
            pos = {x = 2401.7537846033365, y = 449.4417238036972},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2340001,
              GuideType = "M",
              GuidePointName = "Mechanism_12020301_2340001"
            }
          },
          ["1742891256134715229"] = {
            key = "1742891256134715229",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1899.4636214848983, y = 481.80330307989874},
            propsData = {ModeType = 0}
          },
          ["1742891256134715230"] = {
            key = "1742891256134715230",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2917.518944123096, y = 492.2710842232329},
            propsData = {ModeType = 0}
          },
          ["1742891256134715231"] = {
            key = "1742891256134715231",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17509411052064605197"] = {
            key = "17509411052064605197",
            type = "SkipRegionNode",
            name = "\228\188\160\233\128\129\229\136\176\230\151\160\231\148\177\231\148\159\232\129\154\233\155\134\229\156\176",
            pos = {x = 2148.6711650498137, y = 480.1872799004945},
            propsData = {
              ModeType = 0,
              Id = 0,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17509411234464605602"] = {
            key = "17509411234464605602",
            type = "TalkNode",
            name = "\229\146\140\229\136\187\232\136\159\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2666.842027043624, y = 475.41649704371747},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10010101,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
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
          }
        },
        commentData = {}
      }
    },
    ["1742891256134715207"] = {
      isStoryNode = true,
      key = "1742891256134715207",
      type = "StoryNode",
      name = "\229\146\140\230\137\182\231\150\143\229\175\185\232\175\157",
      pos = {x = 1323.2486327970198, y = 286.29943726717914},
      propsData = {
        QuestId = 12020302,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120203_2",
        QuestDeatil = "Content_120203_2",
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
        SubRegionId = 104109,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12020302"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256134715236",
            startPort = "Out",
            endQuest = "1742891256134715237",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715237",
            startPort = "Out",
            endQuest = "1742891256134715238",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715238",
            startPort = "Out",
            endQuest = "1742891256134715233",
            endPort = "Success"
          },
          {
            startQuest = "1742891256134715232",
            startPort = "QuestStart",
            endQuest = "17509937172304610616",
            endPort = "In"
          },
          {
            startQuest = "17509937172304610616",
            startPort = "Out",
            endQuest = "1742891256134715236",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256134715232"] = {
            key = "1742891256134715232",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1893.7629611767545, y = 439.7636845912707},
            propsData = {ModeType = 0}
          },
          ["1742891256134715233"] = {
            key = "1742891256134715233",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3182.9308732936456, y = 430.6903276661832},
            propsData = {ModeType = 0}
          },
          ["1742891256134715234"] = {
            key = "1742891256134715234",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256134715236"] = {
            key = "1742891256134715236",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\187\145\229\184\130\229\149\134\228\186\186A",
            pos = {x = 2394.613300492611, y = 453.1699507389163},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2100003}
            }
          },
          ["1742891256134715237"] = {
            key = "1742891256134715237",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\233\187\145\229\184\130\229\149\134\228\186\186\232\129\138\229\164\169 Fixsimple10",
            pos = {x = 2649.5224411603735, y = 440.64532019704427},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210008,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_MerchantA_2100003",
              DelayShowGuideTime = 0,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East02_12020302",
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
                  TalkActorId = 210008,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210008}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256134715238"] = {
            key = "1742891256134715238",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\233\187\145\229\184\130\229\149\134\228\186\186A",
            pos = {x = 2916.029556650247, y = 430.8916256157635},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2100003}
            }
          },
          ["17509937172304610616"] = {
            key = "17509937172304610616",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2142.004227712188, y = 436.66123661965867},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2340002,
              GuideType = "M",
              GuidePointName = "Mechanism_12020302_2340002"
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256134715208"] = {
      isStoryNode = true,
      key = "1742891256134715208",
      type = "StoryNode",
      name = "\228\188\160\233\128\129\229\136\176\229\176\143\233\187\145\229\177\139",
      pos = {x = 1572.6856865704249, y = 283.09153975919224},
      propsData = {
        QuestId = 12020303,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120203_3",
        QuestDeatil = "Content_120203_3",
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
        SubRegionId = 104109,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12020303"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256134715239",
            startPort = "Out",
            endQuest = "1742891256134715240",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715240",
            startPort = "Out",
            endQuest = "1742891256134715241",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715241",
            startPort = "Out",
            endQuest = "1742891256134715249",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715249",
            startPort = "Out",
            endQuest = "1742891256134715242",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715249",
            startPort = "Out",
            endQuest = "1742891256134715243",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715242",
            startPort = "Out",
            endQuest = "1742891256134715244",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715244",
            startPort = "Out",
            endQuest = "1742891256134715245",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715239",
            startPort = "Out",
            endQuest = "1742891256134715250",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715246",
            startPort = "QuestStart",
            endQuest = "17509942347386583146",
            endPort = "In"
          },
          {
            startQuest = "17509942347386583146",
            startPort = "Out",
            endQuest = "17509942513386583442",
            endPort = "In"
          },
          {
            startQuest = "17509942513386583442",
            startPort = "Success",
            endQuest = "1742891256134715247",
            endPort = "Success"
          },
          {
            startQuest = "17509942513386583442",
            startPort = "Fail",
            endQuest = "1742891256134715248",
            endPort = "Fail"
          },
          {
            startQuest = "17509942513386583442",
            startPort = "PassiveFail",
            endQuest = "1742891256134715248",
            endPort = "Fail"
          },
          {
            startQuest = "17509942729946584130",
            startPort = "Out",
            endQuest = "17509942712396584080",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256134715239"] = {
            key = "1742891256134715239",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2161.603448275863, y = 92.27586206896547},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104109,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12020303"
            }
          },
          ["1742891256134715240"] = {
            key = "1742891256134715240",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\187\145\229\184\130\229\149\134\228\186\186B\229\146\140\229\185\180\232\189\187\229\165\179\229\173\169",
            pos = {x = 2415.051724137931, y = 104.58165971959079},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2100006, 2100007}
            }
          },
          ["1742891256134715241"] = {
            key = "1742891256134715241",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\144\181\233\151\185\231\154\132\229\156\176\230\150\185",
            pos = {x = 2684.1593366046022, y = 89.0701288271701},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2100009,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2100009"
            }
          },
          ["1742891256134715242"] = {
            key = "1742891256134715242",
            type = "GoToNode",
            name = "\229\135\145\229\190\151\230\155\180\232\191\145\228\184\128\228\186\155",
            pos = {x = 3193.9303311354442, y = 86.91625497041036},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2100010,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2100010"
            }
          },
          ["1742891256134715243"] = {
            key = "1742891256134715243",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\135\145\229\190\151\230\155\180\232\191\145\228\184\128\228\186\155",
            pos = {x = 3197.8796110222233, y = -79.42750543585015},
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
          ["1742891256134715244"] = {
            key = "1742891256134715244",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\175\148\232\175\149\229\188\128\229\167\139 Fixsimple12",
            pos = {x = 3449.308182450795, y = 87.8452218368771},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_12022301",
              BlendInTime = 1,
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
                  TalkActorId = 210009,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210011,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 210009},
                {TalkActorType = "Npc", TalkActorId = 210011}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256134715245"] = {
            key = "1742891256134715245",
            type = "TalkNode",
            name = "\233\187\145\229\177\143 - \228\184\187\232\167\146\229\135\186\230\137\139",
            pos = {x = 3718.2042863468987, y = 82.45561144726662},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
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
          ["1742891256134715246"] = {
            key = "1742891256134715246",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1893.7629611767545, y = 439.7636845912707},
            propsData = {ModeType = 0}
          },
          ["1742891256134715247"] = {
            key = "1742891256134715247",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3990.8742795042926, y = 422.3185327943884},
            propsData = {ModeType = 0}
          },
          ["1742891256134715248"] = {
            key = "1742891256134715248",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["1742891256134715249"] = {
            key = "1742891256134715249",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \233\187\145\229\184\130\228\186\137\229\144\181 Fixsimple11",
            pos = {x = 2921.0948204755696, y = 88.37888458753883},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_12022301",
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
                  TalkActorId = 210009,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210011,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 210009},
                {TalkActorType = "Npc", TalkActorId = 210011}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256134715250"] = {
            key = "1742891256134715250",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \233\130\163\233\135\140\229\143\145\231\148\159\228\186\134\228\187\128\228\185\136",
            pos = {x = 2425.6381951381945, y = -68.72816072816084},
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
          ["17509942347386583146"] = {
            key = "17509942347386583146",
            type = "SkipRegionNode",
            name = "\229\142\187\229\176\143\233\187\145\229\177\139",
            pos = {x = 2157.6255512673038, y = 443.68061856773426},
            propsData = {
              ModeType = 0,
              Id = 0,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17509942513386583442"] = {
            key = "17509942513386583442",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\172\172\228\186\140\230\172\161\229\176\143\233\187\145\229\177\139",
            pos = {x = 2436.1355887634936, y = 451.8398906348447},
            propsData = {SpecialConfigId = 0, BlackScreenImmediately = false}
          },
          ["17509942712396584080"] = {
            key = "17509942712396584080",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \233\187\145\229\184\130\228\186\137\229\144\181 Fixsimple11",
            pos = {x = 2542.2864469428414, y = 257.2864768258871},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_12022301",
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
                  TalkActorId = 210009,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210011,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 210009},
                {TalkActorType = "Npc", TalkActorId = 210011}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17509942729946584130"] = {
            key = "17509942729946584130",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\187\145\229\184\130\229\149\134\228\186\186B\229\146\140\229\185\180\232\189\187\229\165\179\229\173\169",
            pos = {x = 2289.2864469428414, y = 291.2864768258871},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2100006, 2100007}
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256134715209"] = {
      isStoryNode = true,
      key = "1742891256134715209",
      type = "StoryNode",
      name = "\229\155\158\230\151\160\231\148\177\231\148\159\232\129\154\233\155\134\229\156\176",
      pos = {x = 1825.0301482608768, y = 284.61576402813205},
      propsData = {
        QuestId = 12020304,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120203_4",
        QuestDeatil = "Content_120203_4",
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
        SubRegionId = 104109,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_YoungGirl_2100007"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256134715259",
            startPort = "Out",
            endQuest = "1742891256134715258",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715254",
            startPort = "Out",
            endQuest = "1742891256134715261",
            endPort = "In"
          },
          {
            startQuest = "17509945330097570322",
            startPort = "Out",
            endQuest = "1742891256134715254",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715251",
            startPort = "QuestStart",
            endQuest = "17509945330097570322",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715256",
            startPort = "Out",
            endQuest = "1742891256134715259",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715261",
            startPort = "Out",
            endQuest = "1742891256134715252",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256134715251"] = {
            key = "1742891256134715251",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1840.646078059871, y = 437.5558923834785},
            propsData = {ModeType = 0}
          },
          ["1742891256134715252"] = {
            key = "1742891256134715252",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3658.2219818926496, y = 449.7170605823898},
            propsData = {ModeType = 0}
          },
          ["1742891256134715253"] = {
            key = "1742891256134715253",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4197.090526106753, y = 588.2137233962793},
            propsData = {}
          },
          ["1742891256134715254"] = {
            key = "1742891256134715254",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \232\175\162\233\151\174\230\131\133\229\134\181 Fixsimple11",
            pos = {x = 2329.7252957350765, y = 440.00570579500516},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210011,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_YoungGirl_2100007",
              DelayShowGuideTime = 0,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_12022601",
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
                  TalkActorId = 210009,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210011,
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
                {TalkActorType = "Npc", TalkActorId = 210009},
                {TalkActorType = "Npc", TalkActorId = 210011},
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
          ["1742891256134715256"] = {
            key = "1742891256134715256",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2761.335214495713, y = 265.4401874692908},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2100011,
                2100012,
                2100013
              }
            }
          },
          ["1742891256134715258"] = {
            key = "1742891256134715258",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 3307.1848430838986, y = 276.88476789107347},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                2100011,
                2100012,
                2100013
              }
            }
          },
          ["1742891256134715259"] = {
            key = "1742891256134715259",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 3042.1537724694226, y = 265.84413839856256},
            propsData = {
              NewDescription = "Description_120203_12",
              NewDetail = "Content_120203_12",
              SubTaskTargetIndex = 0
            }
          },
          ["1742891256134715261"] = {
            key = "1742891256134715261",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\233\187\145\229\184\130\229\149\134\228\186\186B\229\146\140\229\185\180\232\189\187\229\165\179\229\173\169",
            pos = {x = 2622.17716002156, y = 465.2113266100706},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2100006, 2100007}
            }
          },
          ["17509945330097570322"] = {
            key = "17509945330097570322",
            type = "SkipRegionNode",
            name = "\229\155\158\230\151\160\231\148\177\231\148\159\232\129\154\233\155\134\229\156\176",
            pos = {x = 2066.769585253456, y = 454.37327188940094},
            propsData = {
              ModeType = 0,
              Id = 0,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256134715210"] = {
      isStoryNode = true,
      key = "1742891256134715210",
      type = "StoryNode",
      name = "\228\184\156\233\131\138\233\135\142\229\164\150",
      pos = {x = 2076.635031031051, y = 282.18856786500703},
      propsData = {
        QuestId = 12020305,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120203_5",
        QuestDeatil = "Content_120203_5",
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
        SubRegionId = 104109,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_2100014"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256134715262",
            startPort = "QuestStart",
            endQuest = "1742891256134715265",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715265",
            startPort = "Out",
            endQuest = "175101037089214494618",
            endPort = "In"
          },
          {
            startQuest = "175101037089214494618",
            startPort = "Out",
            endQuest = "175101039472114495005",
            endPort = "In"
          },
          {
            startQuest = "175101039472114495005",
            startPort = "Out",
            endQuest = "1742891256134715263",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256134715262"] = {
            key = "1742891256134715262",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1922.440983154776, y = 497.8680801956663},
            propsData = {ModeType = 0}
          },
          ["1742891256134715263"] = {
            key = "1742891256134715263",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3024.180552398066, y = 444.77968285122813},
            propsData = {ModeType = 0}
          },
          ["1742891256134715264"] = {
            key = "1742891256134715264",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["1742891256134715265"] = {
            key = "1742891256134715265",
            type = "GoToNode",
            name = "\229\142\187\228\184\156\233\131\138\233\135\142\229\164\150",
            pos = {x = 2212.2473400455656, y = 463.73108123399095},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010046,
              GuideType = "M",
              GuidePointName = "Mechanism_12020305_2010046"
            }
          },
          ["175101037089214494618"] = {
            key = "175101037089214494618",
            type = "GoToNode",
            name = "\231\160\148\228\185\160\230\160\135\232\174\17612345",
            pos = {x = 2477.181478306896, y = 497.91913067263863},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 0,
              GuideType = "N",
              GuidePointName = ""
            }
          },
          ["175101039472114495005"] = {
            key = "175101039472114495005",
            type = "GoToNode",
            name = "\232\183\175\228\184\138\233\129\135\229\136\176\232\139\143\228\185\153",
            pos = {x = 2740.3394009354074, y = 454.8112875353837},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010048,
              GuideType = "N",
              GuidePointName = "Npc_12020305suyi_2010047"
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256134715211"] = {
      isStoryNode = true,
      key = "1742891256134715211",
      type = "StoryNode",
      name = "\229\186\159\229\188\131\232\144\165\229\156\176",
      pos = {x = 2335.181113980359, y = 293.0628452005748},
      propsData = {
        QuestId = 12020306,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120203_6",
        QuestDeatil = "Content_120203_6",
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
        SubRegionId = 104109,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12020306"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256134715268",
            startPort = "Out",
            endQuest = "1742891256134715273",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715270",
            startPort = "QuestStart",
            endQuest = "1742891256134715274",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715274",
            startPort = "Out",
            endQuest = "1742891256134715268",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715274",
            startPort = "Out",
            endQuest = "1742891256134715267",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715273",
            startPort = "Out",
            endQuest = "1742891256134715271",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256134715267"] = {
            key = "1742891256134715267",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \231\153\189\232\174\164\230\128\130",
            pos = {x = 2556.614251810271, y = 308.4719534449446},
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
          ["1742891256134715268"] = {
            key = "1742891256134715268",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\165\179\229\173\169\232\186\171\230\151\129",
            pos = {x = 2553.5108035344097, y = 458.30643620356517},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2010049,
              GuideType = "M",
              GuidePointName = "Mechanism_12020306_2010049"
            }
          },
          ["1742891256134715270"] = {
            key = "1742891256134715270",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1908.0762616693653, y = 451.6375762168865},
            propsData = {ModeType = 0}
          },
          ["1742891256134715271"] = {
            key = "1742891256134715271",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3148.728488051749, y = 494.1822956983692},
            propsData = {ModeType = 0}
          },
          ["1742891256134715272"] = {
            key = "1742891256134715272",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3597.027044760514, y = 582.2386019659855},
            propsData = {}
          },
          ["1742891256134715273"] = {
            key = "1742891256134715273",
            type = "TalkNode",
            name = "\232\191\135\229\156\186 - \230\137\182\231\150\143\231\153\187\229\156\186",
            pos = {x = 2815.5159759482026, y = 458.7202293070135},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256134715274"] = {
            key = "1742891256134715274",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\185\180\232\189\187\229\167\145\229\168\152",
            pos = {x = 2227.434014528853, y = 450.8840700226073},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2100015}
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256134715212"] = {
      isStoryNode = true,
      key = "1742891256134715212",
      type = "StoryNode",
      name = "\232\191\155\229\133\165\229\143\141\230\138\151\229\134\155\229\159\186\229\156\176",
      pos = {x = 1082.3985373800988, y = 438.7695205669831},
      propsData = {
        QuestId = 12020307,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120203_7",
        QuestDeatil = "Content_120203_7",
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
        SubRegionId = 104105,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_Gongshu"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256134715282",
            startPort = "Out",
            endQuest = "1742891256134715283",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715281",
            startPort = "Out",
            endQuest = "1742891256134715278",
            endPort = "Success"
          },
          {
            startQuest = "1742891256134715283",
            startPort = "Out",
            endQuest = "1742891256134715281",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715277",
            startPort = "QuestStart",
            endQuest = "1751027093404993361",
            endPort = "In"
          },
          {
            startQuest = "1751027093404993361",
            startPort = "Out",
            endQuest = "1742891256134715282",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256134715277"] = {
            key = "1742891256134715277",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2177.4794446932374, y = 453.7065417341279},
            propsData = {ModeType = 0}
          },
          ["1742891256134715278"] = {
            key = "1742891256134715278",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3423.8087769312265, y = 452.7139717640208},
            propsData = {ModeType = 0}
          },
          ["1742891256134715279"] = {
            key = "1742891256134715279",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["1742891256134715280"] = {
            key = "1742891256134715280",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2435.4077167035425, y = 632.7583921073496},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104105,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "Point12020307"
            }
          },
          ["1742891256134715281"] = {
            key = "1742891256134715281",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\133\172\229\176\154\229\184\136\229\130\133",
            pos = {x = 3162.917224437189, y = 452.90665763492547},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930082}
            }
          },
          ["1742891256134715282"] = {
            key = "1742891256134715282",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\133\172\229\176\154\229\184\136\229\130\133",
            pos = {x = 2661.205281208003, y = 454.660972285792},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930082}
            }
          },
          ["1742891256134715283"] = {
            key = "1742891256134715283",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\133\172\229\176\154\229\184\136\229\130\133\232\129\138\229\164\169 Fixsimple17",
            pos = {x = 2919.8464676078106, y = 441.22475333233155},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210014,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_MasterGS_1930082",
              DelayShowGuideTime = 0,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_12023401",
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
                  TalkActorId = 210014,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210014}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1751027093404993361"] = {
            key = "1751027093404993361",
            type = "SkipRegionNode",
            name = "\228\188\160\233\128\129\229\143\141\230\138\151\229\134\155\232\144\165\229\156\176",
            pos = {x = 2422.40202376239, y = 453.7095718199191},
            propsData = {
              ModeType = 0,
              Id = 0,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256134715213"] = {
      isStoryNode = true,
      key = "1742891256134715213",
      type = "StoryNode",
      name = "\228\184\137\228\184\170\229\136\134\230\148\175\228\187\187\229\138\1611",
      pos = {x = 1325.4126183005578, y = 440.0560857463473},
      propsData = {
        QuestId = 12020308,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120203_8",
        QuestDeatil = "Content_120203_8",
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
            startQuest = "1742891256134715284",
            startPort = "Out",
            endQuest = "1742891256134715290",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715287",
            startPort = "QuestStart",
            endQuest = "1742891256134715284",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715290",
            startPort = "Out",
            endQuest = "1742891256134715291",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715291",
            startPort = "Out",
            endQuest = "1742891256134715286",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715286",
            startPort = "Out",
            endQuest = "1742891256134715285",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715285",
            startPort = "Out",
            endQuest = "1742891256134715288",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256134715284"] = {
            key = "1742891256134715284",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2448.9964119015926, y = 346.1547323105109},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104105,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12020308"
            }
          },
          ["1742891256134715285"] = {
            key = "1742891256134715285",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\133\172\229\176\154\229\184\136\229\130\133",
            pos = {x = 3547.674251303571, y = 339.31098984607877},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930082}
            }
          },
          ["1742891256134715286"] = {
            key = "1742891256134715286",
            type = "TalkNode",
            name = "\229\141\160\228\189\141",
            pos = {x = 3271.2037242107363, y = 333.13089374665236},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
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
          ["1742891256134715287"] = {
            key = "1742891256134715287",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2193.7486754624683, y = 347.206541734128},
            propsData = {ModeType = 0}
          },
          ["1742891256134715288"] = {
            key = "1742891256134715288",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3869.052581906739, y = 329.87712568327237},
            propsData = {ModeType = 0}
          },
          ["1742891256134715289"] = {
            key = "1742891256134715289",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["1742891256134715290"] = {
            key = "1742891256134715290",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\133\172\229\176\154\229\184\136\229\130\133",
            pos = {x = 2710.7205498326266, y = 345.1202495518903},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930082}
            }
          },
          ["1742891256134715291"] = {
            key = "1742891256134715291",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\133\172\229\176\154\229\184\136\229\130\133\232\129\138\229\164\169 Fixsimple17",
            pos = {x = 3021.2848131555115, y = 333.99172290612216},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210014,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_MasterGS_1930082",
              DelayShowGuideTime = 0,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_17",
              BlendInTime = 1,
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
                  TalkActorId = 200002,
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
                {TalkActorType = "Npc", TalkActorId = 200002},
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
    ["1742891256134715214"] = {
      isStoryNode = true,
      key = "1742891256134715214",
      type = "StoryNode",
      name = "\228\184\137\228\184\170\229\136\134\230\148\175\228\187\187\229\138\1612",
      pos = {x = 1574.1537821175837, y = 445.16518660717225},
      propsData = {
        QuestId = 12020309,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120203_9",
        QuestDeatil = "Content_120203_9",
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
            startQuest = "1742891256134715295",
            startPort = "Out",
            endQuest = "1742891256134715293",
            endPort = "Success"
          },
          {
            startQuest = "1742891256134715292",
            startPort = "QuestStart",
            endQuest = "1742891256134715296",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715296",
            startPort = "Out",
            endQuest = "1742891256134715297",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715297",
            startPort = "Out",
            endQuest = "1742891256134715295",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256134715292"] = {
            key = "1742891256134715292",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2273.2486754624683, y = 453.7065417341279},
            propsData = {ModeType = 0}
          },
          ["1742891256134715293"] = {
            key = "1742891256134715293",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3260.4966890191386, y = 441.84144429149336},
            propsData = {ModeType = 0}
          },
          ["1742891256134715294"] = {
            key = "1742891256134715294",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["1742891256134715295"] = {
            key = "1742891256134715295",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\137\190\230\173\162\230\181\129\228\186\164\229\183\174",
            pos = {x = 3005.604709734033, y = 439.604113389202},
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
          ["1742891256134715296"] = {
            key = "1742891256134715296",
            type = "GoToNode",
            name = "\229\142\187\230\177\161\231\167\189\228\185\139\229\156\176\233\171\152\230\177\161\230\159\147\229\140\186",
            pos = {x = 2520.7520007976, y = 453.8350418286792},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930183,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020309"
            }
          },
          ["1742891256134715297"] = {
            key = "1742891256134715297",
            type = "TalkNode",
            name = "\229\141\160\228\189\141",
            pos = {x = 2754.1772506842644, y = 453.2342903500489},
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
          }
        },
        commentData = {}
      }
    },
    ["1742891256134715215"] = {
      isStoryNode = true,
      key = "1742891256134715215",
      type = "StoryNode",
      name = "\229\146\140\232\153\172\229\133\136\231\148\159\228\186\164\230\181\129",
      pos = {x = 2322.649769585253, y = 450.1405529953917},
      propsData = {
        QuestId = 12020312,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120203_13",
        QuestDeatil = "Content_120203_13",
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
        SubRegionId = 104111,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_2270004"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256134715301",
            startPort = "Out",
            endQuest = "1742891256134715299",
            endPort = "Success"
          },
          {
            startQuest = "1742891256134715298",
            startPort = "QuestStart",
            endQuest = "1742891256134715302",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715302",
            startPort = "Out",
            endQuest = "1742891256134715303",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715303",
            startPort = "Out",
            endQuest = "1742891256134715304",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715304",
            startPort = "Out",
            endQuest = "1742891256134715301",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256134715298"] = {
            key = "1742891256134715298",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2043.1861754624683, y = 450.03154173412787},
            propsData = {ModeType = 0}
          },
          ["1742891256134715299"] = {
            key = "1742891256134715299",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3353.9722190647326, y = 439.15468285122813},
            propsData = {ModeType = 0}
          },
          ["1742891256134715300"] = {
            key = "1742891256134715300",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["1742891256134715301"] = {
            key = "1742891256134715301",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \232\175\162\233\151\174\230\131\133\229\134\181 Fixsimple11",
            pos = {x = 3074.669495800245, y = 434.50388458753883},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_12022701",
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210012,
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
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210012},
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
          ["1742891256134715302"] = {
            key = "1742891256134715302",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 2311.25, y = 432.0625},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104111,
              bGuideUIEnable = true,
              GuideType = "M",
              GuideName = "Mechanism_QuestTrigger_2270004"
            }
          },
          ["1742891256134715303"] = {
            key = "1742891256134715303",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2566.25, y = 442.375},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2270001}
            }
          },
          ["1742891256134715304"] = {
            key = "1742891256134715304",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2817.5, y = 433},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2270004,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2270004"
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256134715216"] = {
      isStoryNode = true,
      key = "1742891256134715216",
      type = "StoryNode",
      name = "\229\142\187\229\164\150\233\157\162\231\156\139\231\156\139",
      pos = {x = 2560.887096774193, y = 457.88248847926263},
      propsData = {
        QuestId = 12020313,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120203_14",
        QuestDeatil = "Content_120203_14",
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
        SubRegionId = 104111,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_2270004"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256134715308",
            startPort = "Out",
            endQuest = "1742891256134715309",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715305",
            startPort = "QuestStart",
            endQuest = "1742891256134715308",
            endPort = "In"
          },
          {
            startQuest = "1742891256134715309",
            startPort = "Out",
            endQuest = "1742891256134715306",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256134715305"] = {
            key = "1742891256134715305",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2043.1861754624683, y = 450.03154173412787},
            propsData = {ModeType = 0}
          },
          ["1742891256134715306"] = {
            key = "1742891256134715306",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2869.9722190647326, y = 458.15468285122813},
            propsData = {ModeType = 0}
          },
          ["1742891256134715307"] = {
            key = "1742891256134715307",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["1742891256134715308"] = {
            key = "1742891256134715308",
            type = "GoToNode",
            name = "\231\166\187\229\188\128\229\138\158\229\133\172\229\174\164",
            pos = {x = 2328.185930252962, y = 445.04744598783935},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2270005,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2270005"
            }
          },
          ["1742891256134715309"] = {
            key = "1742891256134715309",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2589.2216784426905, y = 458.21342357737785},
            propsData = {
              ModeType = 1,
              Id = 104109,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
