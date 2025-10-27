return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17185058221339550956",
      startPort = "Success",
      endStory = "17185058680909551562",
      endPort = "In"
    },
    {
      startStory = "17185058680909551562",
      startPort = "Success",
      endStory = "17185059024689551976",
      endPort = "In"
    },
    {
      startStory = "17185061123049553788",
      startPort = "Success",
      endStory = "17185061412649554267",
      endPort = "In"
    },
    {
      startStory = "17185061412649554267",
      startPort = "Success",
      endStory = "17191120381874244071",
      endPort = "In"
    },
    {
      startStory = "17191120381874244071",
      startPort = "Success",
      endStory = "171851537020311650724",
      endPort = "StoryEnd"
    },
    {
      startStory = "17423749000558216",
      startPort = "Success",
      endStory = "17185058221339550956",
      endPort = "In"
    },
    {
      startStory = "17185059024689551976",
      startPort = "Success",
      endStory = "17423767837501657521",
      endPort = "In"
    },
    {
      startStory = "1742544001930787380",
      startPort = "Success",
      endStory = "17423749000558216",
      endPort = "In"
    },
    {
      startStory = "171851537020311650723",
      startPort = "StoryStart",
      endStory = "17512713997609153706",
      endPort = "In"
    },
    {
      startStory = "17512713997609153706",
      startPort = "Success",
      endStory = "1742544001930787380",
      endPort = "In"
    },
    {
      startStory = "17423767837501657521",
      startPort = "Success",
      endStory = "17185061123049553788",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17185058221339550956"] = {
      isStoryNode = true,
      key = "17185058221339550956",
      type = "StoryNode",
      name = "\229\174\140\230\136\144\233\135\135\233\155\134\228\187\187\229\138\161",
      pos = {x = 808.4213935757954, y = 212.40948860758985},
      propsData = {
        QuestId = 20021502,
        QuestDescriptionComment = "\232\191\155\232\161\140\233\135\135\233\155\134\228\187\187\229\138\161",
        QuestDescription = "Description_200215_3",
        QuestDeatil = "Content_200215_3",
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
        SubRegionId = 101103,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Makusi_1240125"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "171851357572310749371",
            startPort = "Out",
            endQuest = "17185058221339550961",
            endPort = "Success"
          },
          {
            startQuest = "17185058221339550960",
            startPort = "QuestStart",
            endQuest = "17225966929691274978",
            endPort = "In"
          },
          {
            startQuest = "17225966929691274978",
            startPort = "Out",
            endQuest = "17525627773817952",
            endPort = "In"
          },
          {
            startQuest = "17525627773817952",
            startPort = "Out",
            endQuest = "171851357572310749371",
            endPort = "In"
          },
          {
            startQuest = "17185058221339550960",
            startPort = "QuestStart",
            endQuest = "17562956397502219946",
            endPort = "In"
          },
          {
            startQuest = "17562956397502219946",
            startPort = "Out",
            endQuest = "1755672458352313193",
            endPort = "In"
          }
        },
        nodeData = {
          ["17185058221339550960"] = {
            key = "17185058221339550960",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1257.5, y = 303.75},
            propsData = {ModeType = 0}
          },
          ["17185058221339550961"] = {
            key = "17185058221339550961",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2586.0681818181824, y = 324.5},
            propsData = {ModeType = 0}
          },
          ["17185058221339550962"] = {
            key = "17185058221339550962",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2867.5, y = 328.74999999999994},
            propsData = {}
          },
          ["171851357572310749371"] = {
            key = "171851357572310749371",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2226.156526656521, y = 335.1819900870335},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700116,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Makusi_1240125",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51005401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17225966929691274978"] = {
            key = "17225966929691274978",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1604.4378370671486, y = 310.5995709271569},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_Gather"
            }
          },
          ["17425434513551815"] = {
            key = "17425434513551815",
            type = "ResourceCollectNode",
            name = "\232\142\183\229\190\151Resource\233\129\147\229\133\183",
            pos = {x = 2843.981115786995, y = 127.43418555009629},
            propsData = {
              ResourceType = "Resource",
              ResourceId = -1,
              ResourceSType = "Fish",
              NeedCount = 0,
              bUseBagCount = true,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_Gather"
            }
          },
          ["17525627773817952"] = {
            key = "17525627773817952",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1874.5996952025746, y = 322.93310920896306},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1241023}
            }
          },
          ["1755672458352313193"] = {
            key = "1755672458352313193",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1863.0595533498758, y = 28.88413479928198},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51005314,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17562956397502219946"] = {
            key = "17562956397502219946",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1592, y = 26},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1241113,
              GuideType = "M",
              GuidePointName = ""
            }
          }
        },
        commentData = {}
      }
    },
    ["17185058680909551562"] = {
      isStoryNode = true,
      key = "17185058680909551562",
      type = "StoryNode",
      name = "\229\134\141\230\172\161\229\146\140\233\169\172\229\186\147\230\150\175\229\175\185\232\175\157",
      pos = {x = 1113.0493656037672, y = 211.03641168451298},
      propsData = {
        QuestId = 20021503,
        QuestDescriptionComment = "\229\134\141\230\172\161\229\146\140\233\169\172\229\186\147\230\150\175\229\175\185\232\175\157",
        QuestDescription = "Description_200215_41",
        QuestDeatil = "Content_200215_41",
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
        SubRegionId = 101103,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Makusi_1240125"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17185058680909551566",
            startPort = "QuestStart",
            endQuest = "17436483487671932",
            endPort = "In"
          },
          {
            startQuest = "17436484151142434",
            startPort = "Option_3",
            endQuest = "17436484151142437",
            endPort = "In"
          },
          {
            startQuest = "17436484151142435",
            startPort = "Out",
            endQuest = "17436484151142438",
            endPort = "In"
          },
          {
            startQuest = "17436484151142436",
            startPort = "Out",
            endQuest = "17436484151142438",
            endPort = "In"
          },
          {
            startQuest = "17436484151142437",
            startPort = "Out",
            endQuest = "17436484151142438",
            endPort = "In"
          },
          {
            startQuest = "17436484151142434",
            startPort = "Option_1",
            endQuest = "17436484151142435",
            endPort = "In"
          },
          {
            startQuest = "17436484151142434",
            startPort = "Option_2",
            endQuest = "17436484151142436",
            endPort = "In"
          },
          {
            startQuest = "17436483487671932",
            startPort = "Out",
            endQuest = "17436483487671931",
            endPort = "In"
          },
          {
            startQuest = "17436483487671931",
            startPort = "Out",
            endQuest = "17185058680909551567",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17185058680909551566"] = {
            key = "17185058680909551566",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 776.1784897025173, y = 306.0411899313502},
            propsData = {ModeType = 0}
          },
          ["17185058680909551567"] = {
            key = "17185058680909551567",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1410.9454545454546, y = 302.07272727272726},
            propsData = {ModeType = 0}
          },
          ["17185058680909551568"] = {
            key = "17185058680909551568",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1627.2727272727275, y = 468.1818181818182},
            propsData = {}
          },
          ["1719040501689532684"] = {
            key = "1719040501689532684",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1128.6001507360688, y = 93.40124710424425},
            propsData = {
              ImpressionTalkTriggerId = 510054,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Makusi_1240125",
              GuideStaticCreatorId = 0
            }
          },
          ["17436483487671931"] = {
            key = "17436483487671931",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1261.629862331844, y = 493.3153106079091},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700116,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Makusi_1240125",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51005403,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 1,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
          ["17436483487671932"] = {
            key = "17436483487671932",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 953.7935256836483, y = 503.4828914480325},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_Gather"
            }
          },
          ["17436484151142434"] = {
            key = "17436484151142434",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1185.8949779243062, y = 739.0256987663608},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700116,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Makusi_1240125",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51005403,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
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
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              PlusOptions = {
                {
                  OptionText = "510054061",
                  PlusId = 1003,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "510054062",
                  PlusId = 1004,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "510054063",
                  PlusId = 1005,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17436484151142435"] = {
            key = "17436484151142435",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1456.9294606829267, y = 671.7843194560162},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51005407,
              FlowAssetPath = "",
              TalkType = "Impression",
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
          ["17436484151142436"] = {
            key = "17436484151142436",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1457.9639434415471, y = 816.6119056629127},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51005408,
              FlowAssetPath = "",
              TalkType = "Impression",
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
          ["17436484151142437"] = {
            key = "17436484151142437",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1456.9294606829267, y = 964.5429401456713},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51005409,
              FlowAssetPath = "",
              TalkType = "Impression",
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
          ["17436484151142438"] = {
            key = "17436484151142438",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1746.8309385154398, y = 795.5281618205481},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51005410,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0,
              BlendOutTime = 1.5,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
    ["17185059024689551976"] = {
      isStoryNode = true,
      key = "17185059024689551976",
      type = "StoryNode",
      name = "\229\146\140\233\169\172\229\186\147\230\150\175\229\136\176\229\159\142\229\164\150\229\175\185\232\175\157",
      pos = {x = -31.642661872302746, y = 436.1445726724611},
      propsData = {
        QuestId = 20021504,
        QuestDescriptionComment = "\229\146\140\233\169\172\229\186\147\230\150\175\229\136\176\229\159\142\229\164\150\229\175\185\232\175\157",
        QuestDescription = "Description_200215_4",
        QuestDeatil = "Content_200215_4",
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
        SubRegionId = 101103,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Makusi_1240127"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17190437959811721254",
            startPort = "Out",
            endQuest = "17190438338461722211",
            endPort = "In"
          },
          {
            startQuest = "17225968877551597399",
            startPort = "Out",
            endQuest = "17190437959811721254",
            endPort = "In"
          },
          {
            startQuest = "17185059024689551980",
            startPort = "QuestStart",
            endQuest = "17225968877551597399",
            endPort = "In"
          },
          {
            startQuest = "17190438338461722211",
            startPort = "Out",
            endQuest = "17528350961482910",
            endPort = "In"
          },
          {
            startQuest = "17528350961482910",
            startPort = "Out",
            endQuest = "17185059024689551981",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17185059024689551980"] = {
            key = "17185059024689551980",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 589.9137931034483, y = 270.9913793103448},
            propsData = {ModeType = 0}
          },
          ["17185059024689551981"] = {
            key = "17185059024689551981",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1840.365111561866, y = 271.55172413793105},
            propsData = {ModeType = 0}
          },
          ["17185059024689551982"] = {
            key = "17185059024689551982",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1830.3245436105476, y = 404.8073022312373},
            propsData = {}
          },
          ["17190437959811721254"] = {
            key = "17190437959811721254",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1070.942413894304, y = 252.54220675354418},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240127}
            }
          },
          ["17190438338461722211"] = {
            key = "17190438338461722211",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1331.4585588424977, y = 264.9864258204813},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700117,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Makusi_1240127",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 51005501,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
          ["17225968877551597399"] = {
            key = "17225968877551597399",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 829.0092656385773, y = 275.78363686122293},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_20021504"
            }
          },
          ["175256300802410447"] = {
            key = "175256300802410447",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1224.2295059900393, y = 459.4085958181902},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {0}
            }
          },
          ["17528350961482910"] = {
            key = "17528350961482910",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1591.6918679697585, y = 211.2737842786018},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1241023}
            }
          }
        },
        commentData = {}
      }
    },
    ["17185060353869553083"] = {
      isStoryNode = true,
      key = "17185060353869553083",
      type = "StoryNode",
      name = "\233\135\135\233\155\134\232\130\165\233\177\188",
      pos = {x = -553.470403516002, y = 528.6019295000307},
      propsData = {
        QuestId = 20021505,
        QuestDescriptionComment = "\233\135\135\233\155\134\232\130\165\233\177\188",
        QuestDescription = "Description_200215_5",
        QuestDeatil = "Content_200215_5",
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
            startQuest = "17185060353869553087",
            startPort = "QuestStart",
            endQuest = "17225969985371919213",
            endPort = "In"
          },
          {
            startQuest = "17190451165692118229",
            startPort = "Out",
            endQuest = "17185060353869553088",
            endPort = "Success"
          },
          {
            startQuest = "17225969985371919213",
            startPort = "Out",
            endQuest = "17448133432182599",
            endPort = "In"
          },
          {
            startQuest = "17448133432182599",
            startPort = "Out",
            endQuest = "17190451165692118229",
            endPort = "In"
          }
        },
        nodeData = {
          ["17185060353869553087"] = {
            key = "17185060353869553087",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 485.55555555555554, y = 290.4166666666667},
            propsData = {ModeType = 0}
          },
          ["17185060353869553088"] = {
            key = "17185060353869553088",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1861.3333333333335, y = 297.3333333333333},
            propsData = {ModeType = 0}
          },
          ["17185060353869553089"] = {
            key = "17185060353869553089",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17190451165692118229"] = {
            key = "17190451165692118229",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1213.7516197605585, y = 284.8811302539789},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51005508,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
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
          ["17225969985371919213"] = {
            key = "17225969985371919213",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 759.6910838203952, y = 304.3063641339502},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_20021504"
            }
          },
          ["17448133432182599"] = {
            key = "17448133432182599",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 971.046000319364, y = 486.7359522710565},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240767,
              GuideType = "M",
              GuidePointName = "Mechanism_20021505Makus_1240767"
            }
          },
          ["1755672526151313705"] = {
            key = "1755672526151313705",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 783.0098039215686, y = 108.39013213981234},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51005315,
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
    ["17185061123049553788"] = {
      isStoryNode = true,
      key = "17185061123049553788",
      type = "StoryNode",
      name = "\230\138\138\232\130\165\233\177\188\228\186\164\231\187\153\233\169\172\229\186\147\230\150\175",
      pos = {x = 547.6929148081863, y = 414.70222196119283},
      propsData = {
        QuestId = 20021506,
        QuestDescriptionComment = "\230\138\138\232\130\165\233\177\188\228\186\164\231\187\153\233\169\172\229\186\147\230\150\175",
        QuestDescription = "Description_200215_6",
        QuestDeatil = "Content_200215_6",
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
        SubRegionId = 101103,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Makusi_1240127"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1719458091381544433",
            startPort = "Out",
            endQuest = "17185061123059553793",
            endPort = "Success"
          },
          {
            startQuest = "17185061123059553792",
            startPort = "QuestStart",
            endQuest = "1743648750348815982",
            endPort = "In"
          },
          {
            startQuest = "1743648750348815982",
            startPort = "Out",
            endQuest = "1719458091381544433",
            endPort = "In"
          },
          {
            startQuest = "17185061123059553792",
            startPort = "QuestStart",
            endQuest = "17562956768902220708",
            endPort = "In"
          },
          {
            startQuest = "17562956768902220708",
            startPort = "Out",
            endQuest = "17561188833232547",
            endPort = "In"
          }
        },
        nodeData = {
          ["17185061123059553792"] = {
            key = "17185061123059553792",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1343.5111111111114, y = 284.48888888888894},
            propsData = {ModeType = 0}
          },
          ["17185061123059553793"] = {
            key = "17185061123059553793",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2303.313908313908, y = 300.3379953379954},
            propsData = {ModeType = 0}
          },
          ["17185061123059553794"] = {
            key = "17185061123059553794",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2372.6262626262624, y = 515.0505050505051},
            propsData = {}
          },
          ["17190453180832251125"] = {
            key = "17190453180832251125",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1703.6127308716698, y = 299.3255746984234},
            propsData = {
              ImpressionTalkTriggerId = 510056,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Makusi_1240127",
              GuideStaticCreatorId = 0
            }
          },
          ["1719458091381544433"] = {
            key = "1719458091381544433",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2048.257499245717, y = 597.311579621902},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240127, 1241023}
            }
          },
          ["1743648750348815982"] = {
            key = "1743648750348815982",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1753.2288889910071, y = 587.4766084391306},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700117,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Makusi_1240127",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51005601,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              PlusOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1743648750348815985"] = {
            key = "1743648750348815985",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2267.8694745703033, y = 784.9219070473326},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51005604,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = -1,
              BlendOutTime = 1.5,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
          ["17561188833232547"] = {
            key = "17561188833232547",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1959.1484820648907, y = 85.13929478674072},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51005315,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17562956768902220708"] = {
            key = "17562956768902220708",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1664, y = 72},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1241114,
              GuideType = "M",
              GuidePointName = ""
            }
          }
        },
        commentData = {}
      }
    },
    ["17185061412649554267"] = {
      isStoryNode = true,
      key = "17185061412649554267",
      type = "StoryNode",
      name = "\232\191\148\229\155\158\229\134\176\230\185\150\229\159\142",
      pos = {x = 833.2568248112265, y = 421.13512963323103},
      propsData = {
        QuestId = 20021507,
        QuestDescriptionComment = "\232\191\148\229\155\158\229\134\176\230\185\150\229\159\142",
        QuestDescription = "Description_200215_7",
        QuestDeatil = "Content_200215_7",
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
        StoryGuidePointName = "QuestPoint_20021507"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17190496038802919896",
            startPort = "Out",
            endQuest = "17185061412659554272",
            endPort = "Success"
          },
          {
            startQuest = "17191117048373846566",
            startPort = "Out",
            endQuest = "17190496038802919896",
            endPort = "In"
          },
          {
            startQuest = "17185061412659554271",
            startPort = "QuestStart",
            endQuest = "17191117048373846566",
            endPort = "In"
          }
        },
        nodeData = {
          ["17185061412659554271"] = {
            key = "17185061412659554271",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 677.2727272727273, y = 300},
            propsData = {ModeType = 0}
          },
          ["17185061412659554272"] = {
            key = "17185061412659554272",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1813.333333333333, y = 303.33333333333337},
            propsData = {ModeType = 0}
          },
          ["17185061412659554273"] = {
            key = "17185061412659554273",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1993.3333333333333, y = 463.3333333333333},
            propsData = {}
          },
          ["17190496038802919896"] = {
            key = "17190496038802919896",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1506.8706764120948, y = 303.47897000415384},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190563}
            }
          },
          ["17191117048373846566"] = {
            key = "17191117048373846566",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1178.7761919018767, y = 301.3855634107478},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_20021507"
            }
          }
        },
        commentData = {}
      }
    },
    ["171851537020311650723"] = {
      isStoryNode = true,
      key = "171851537020311650723",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = -294.26492023534865, y = 235.40580710428065},
      propsData = {QuestChainId = 200215},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["171851537020311650724"] = {
      isStoryNode = true,
      key = "171851537020311650724",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1491.7056325580816, y = 416.85020711796847},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17191120381874244071"] = {
      isStoryNode = true,
      key = "17191120381874244071",
      type = "StoryNode",
      name = "\230\156\128\229\144\142\229\146\140\233\169\172\229\186\147\230\150\175\232\175\180\232\175\157",
      pos = {x = 1141.0838842095689, y = 423.5767056018899},
      propsData = {
        QuestId = 20021508,
        QuestDescriptionComment = "\229\146\140\233\169\172\229\186\147\230\150\175\230\156\128\229\144\142\232\175\180\232\175\157",
        QuestDescription = "Description_200215_8",
        QuestDeatil = "Content_200215_8",
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
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_MakusiSit_1190563"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17191120381874244075",
            startPort = "QuestStart",
            endQuest = "1743648907990816899",
            endPort = "In"
          },
          {
            startQuest = "1743648907990816899",
            startPort = "Out",
            endQuest = "1757647817246929568",
            endPort = "In"
          },
          {
            startQuest = "1757647817246929568",
            startPort = "Out",
            endQuest = "17191120381874244076",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17191120381874244075"] = {
            key = "17191120381874244075",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 303.3333333333333},
            propsData = {ModeType = 0}
          },
          ["17191120381874244076"] = {
            key = "17191120381874244076",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1418.333333333333, y = 306.6666666666667},
            propsData = {ModeType = 0}
          },
          ["17191120381874244077"] = {
            key = "17191120381874244077",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1993.3333333333333, y = 463.3333333333333},
            propsData = {}
          },
          ["17191121516654376778"] = {
            key = "17191121516654376778",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1113.7761919018765, y = 304.7188967440811},
            propsData = {
              ImpressionTalkTriggerId = 510057,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_MakusiSit_1190563",
              GuideStaticCreatorId = 0
            }
          },
          ["1743648907990816899"] = {
            key = "1743648907990816899",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 907.1187186929435, y = 563.87602501128},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700121,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_MakusiSit_1190563",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 51005701,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              PlusOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1757647817246929568"] = {
            key = "1757647817246929568",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1229.4482758620688, y = 577.5172413793103},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = true,
              EnableFadeIn = true,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190563}
            }
          }
        },
        commentData = {}
      }
    },
    ["17423749000558216"] = {
      isStoryNode = true,
      key = "17423749000558216",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\144\231\155\174\230\160\135",
      pos = {x = 530.816029848565, y = 226.69752834055708},
      propsData = {
        QuestId = 20021510,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200215_2",
        QuestDeatil = "Content_200215_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        InRegionExportName = "",
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        GameModeTargetId = 10118,
        GameModeKeyCount = 1,
        QuestHintMessageId = 0,
        IsShowGuide = true,
        GuideType = "P",
        GuidePointName = "NewTargetPointFish",
        InterfaceJumpId = 0
      },
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17423767837501657521"] = {
      isStoryNode = true,
      key = "17423767837501657521",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\144\231\155\174\230\160\135",
      pos = {x = 253.76499741032717, y = 428.8021731811495},
      propsData = {
        QuestId = 20021509,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200215_22",
        QuestDeatil = "Content_200215_2",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        InRegionExportName = "",
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        GameModeTargetId = 10115,
        GameModeKeyCount = 1,
        QuestHintMessageId = 0,
        IsShowGuide = true,
        GuideType = "M",
        GuidePointName = "Mechanism_20021501FishSpot_1241023",
        InterfaceJumpId = 0
      },
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1742544001930787380"] = {
      isStoryNode = true,
      key = "1742544001930787380",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 248.3438870220172, y = 219.38482941477827},
      propsData = {
        QuestId = 20021501,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200215_2",
        QuestDeatil = "Content_200215_2",
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
        SubRegionId = 101103,
        StoryGuideType = "Point",
        StoryGuidePointName = "NewTargetPointFish"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742544001930787381",
            startPort = "QuestStart",
            endQuest = "17425440915411572577",
            endPort = "In"
          },
          {
            startQuest = "17425440915411572577",
            startPort = "Out",
            endQuest = "1742544001931787384",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742544001930787381"] = {
            key = "1742544001930787381",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1285.357142857143, y = 336.42857142857144},
            propsData = {ModeType = 0}
          },
          ["1742544001931787384"] = {
            key = "1742544001931787384",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1939.248120300752, y = 334.3984962406015},
            propsData = {ModeType = 0}
          },
          ["1742544001931787387"] = {
            key = "1742544001931787387",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17425440915411572577"] = {
            key = "17425440915411572577",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1516.5574468085106, y = 347.2255319148936},
            propsData = {WaitTime = 0.3}
          }
        },
        commentData = {}
      }
    },
    ["17512713997609153706"] = {
      isStoryNode = true,
      key = "17512713997609153706",
      type = "PreStoryNode",
      name = "\228\187\187\229\138\161\229\137\141\231\189\174\232\138\130\231\130\185",
      pos = {x = -37.227719473596736, y = 223.57854406130272},
      propsData = {
        QuestId = 20021500,
        QuestDescriptionComment = "",
        SubRegionId = 101103,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Makusi_1240125"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17512713997609153712",
            startPort = "ApproveOut",
            endQuest = "17512713997609153711",
            endPort = "Success"
          },
          {
            startQuest = "17512713997609153710",
            startPort = "QuestStart",
            endQuest = "17512713997609153714",
            endPort = "In"
          },
          {
            startQuest = "17512713997609153712",
            startPort = "CancelOut",
            endQuest = "17512713997609153713",
            endPort = "Fail"
          },
          {
            startQuest = "17512713997609153714",
            startPort = "Out",
            endQuest = "17512713997609153712",
            endPort = "Input"
          },
          {
            startQuest = "17512713997609153714",
            startPort = "Fail",
            endQuest = "17512713997609153713",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17512713997609153710"] = {
            key = "17512713997609153710",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17512713997609153711"] = {
            key = "17512713997609153711",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1857.8571428571427, y = 173.57142857142858},
            propsData = {ModeType = 0}
          },
          ["17512713997609153712"] = {
            key = "17512713997609153712",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 1448.7499999999998, y = 231.30952380952377},
            propsData = {
              SideQuestChainId = 200215,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          },
          ["17512713997609153713"] = {
            key = "17512713997609153713",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1861.6040716040718, y = 489.90171990171996},
            propsData = {}
          },
          ["17512713997609153714"] = {
            key = "17512713997609153714",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1114.0766526258137, y = 284.7953250029914},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700116,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Makusi_1240125",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51005301,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              PlusOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1752577456386340563"] = {
      isStoryNode = true,
      key = "1752577456386340563",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\144\231\155\174\230\160\135",
      pos = {x = 951.3598215142885, y = -388.3080897737943},
      propsData = {
        QuestId = 20021509,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200215_2",
        QuestDeatil = "Content_200215_2",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        InRegionExportName = "",
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        GameModeTargetId = 10115,
        GameModeKeyCount = 1,
        QuestHintMessageId = 0,
        IsShowGuide = true,
        GuideType = "P",
        GuidePointName = "Mechanism_20021501FishSpot_1241023",
        InterfaceJumpId = 0
      },
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1752582747771666718"] = {
      isStoryNode = true,
      key = "1752582747771666718",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\144\231\155\174\230\160\135",
      pos = {x = 604.2084633851264, y = -376.06943109594454},
      propsData = {
        QuestId = 20021509,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200215_22",
        QuestDeatil = "Content_200215_2",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        InRegionExportName = "",
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        GameModeTargetId = 10115,
        GameModeKeyCount = 1,
        QuestHintMessageId = 0,
        IsShowGuide = true,
        GuideType = "M",
        GuidePointName = "Mechanism_20021501FishSpot_1241023",
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
