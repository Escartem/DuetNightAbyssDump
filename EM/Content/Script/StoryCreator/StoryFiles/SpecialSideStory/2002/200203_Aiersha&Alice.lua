return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17114392283851136",
      startPort = "Success",
      endStory = "1728393971867209877",
      endPort = "In"
    },
    {
      startStory = "1728397161549214981",
      startPort = "Success",
      endStory = "1704175979517220918",
      endPort = "StoryEnd"
    },
    {
      startStory = "1728393973261209952",
      startPort = "Success",
      endStory = "1704175979517220918",
      endPort = "StoryEnd"
    },
    {
      startStory = "17419218651729263109",
      startPort = "Success",
      endStory = "17419218952809263461",
      endPort = "In"
    },
    {
      startStory = "17419218952809263461",
      startPort = "Success",
      endStory = "169822017027411337",
      endPort = "In"
    },
    {
      startStory = "169822017027411337",
      startPort = "Success",
      endStory = "17419219222629263738",
      endPort = "In"
    },
    {
      startStory = "17419219222629263738",
      startPort = "Success",
      endStory = "17114392283851133",
      endPort = "In"
    },
    {
      startStory = "17114392283851133",
      startPort = "Success",
      endStory = "17114392283851136",
      endPort = "In"
    },
    {
      startStory = "1728393971867209877",
      startPort = "\239\188\136\229\177\149\231\164\186\231\136\177\228\184\189\228\184\157\231\154\132\230\151\165\232\174\176\239\188\137111",
      endStory = "17471282058732396239",
      endPort = "In"
    },
    {
      startStory = "17471282058732396239",
      startPort = "Success",
      endStory = "1728397161549214981",
      endPort = "In"
    },
    {
      startStory = "1728393971867209877",
      startPort = "\239\188\136\228\184\141\229\177\149\231\164\186\231\136\177\228\184\189\228\184\157\231\154\132\230\151\165\232\174\176\239\188\137222",
      endStory = "17471282069062396317",
      endPort = "In"
    },
    {
      startStory = "17471282069062396317",
      startPort = "Success",
      endStory = "1728393973261209952",
      endPort = "In"
    },
    {
      startStory = "17509203211412056",
      startPort = "Success",
      endStory = "17419218651729263109",
      endPort = "In"
    },
    {
      startStory = "1704175979517220917",
      startPort = "StoryStart",
      endStory = "17509203211412056",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["169822017027411337"] = {
      isStoryNode = true,
      key = "169822017027411337",
      type = "StoryNode",
      name = "\232\191\183\232\140\171\231\154\132\229\176\145\229\165\179",
      pos = {x = 1122.4492624523182, y = 292.9212819438625},
      propsData = {
        QuestId = 20020302,
        QuestDescriptionComment = "\228\184\142\232\191\183\232\140\171\231\154\132\229\176\145\229\165\179\229\175\185\232\175\157",
        QuestDescription = "Description_200203_2",
        QuestDeatil = "Content_200203_2",
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
        SubRegionId = 101101,
        StoryGuideType = "Point",
        StoryGuidePointName = "Npc_Alice_1_1190116"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1704175979517220923",
            startPort = "QuestStart",
            endQuest = "1704175979517220926",
            endPort = "In"
          },
          {
            startQuest = "1704175979517220926",
            startPort = "Out",
            endQuest = "1704175979517220924",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1704175979517220923"] = {
            key = "1704175979517220923",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1704175979517220924"] = {
            key = "1704175979517220924",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1660, y = 336.3157894736842},
            propsData = {ModeType = 0}
          },
          ["1704175979517220925"] = {
            key = "1704175979517220925",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1704175979517220926"] = {
            key = "1704175979517220926",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1190.1418318523579, y = 310.78400546821604},
            propsData = {
              ImpressionTalkTriggerId = 510007,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Alice_1_1190116",
              GuideStaticCreatorId = 700032
            }
          }
        },
        commentData = {}
      }
    },
    ["1704175979517220917"] = {
      isStoryNode = true,
      key = "1704175979517220917",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 731.4044095439444, y = 301.3008472555596},
      propsData = {QuestChainId = 200203},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175979517220918"] = {
      isStoryNode = true,
      key = "1704175979517220918",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2841.2909278543952, y = 255.4120148856991},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17114392283851133"] = {
      isStoryNode = true,
      key = "17114392283851133",
      type = "StoryNode",
      name = "\231\148\159\230\136\144\230\128\170\231\137\169",
      pos = {x = 1717.8601041373481, y = 264.97599396217805},
      propsData = {
        QuestId = 20020303,
        QuestDescriptionComment = "\230\137\147\230\128\170",
        QuestDescription = "Description_200203_3",
        QuestDeatil = "Content_200203_3",
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
        SubRegionId = 101103,
        StoryGuideType = "Point",
        StoryGuidePointName = "Quest_Alice_diary"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17114392283861178",
            startPort = "Out",
            endQuest = "17114392283861174",
            endPort = "Success"
          },
          {
            startQuest = "17114392283861173",
            startPort = "QuestStart",
            endQuest = "17114392283861182",
            endPort = "In"
          },
          {
            startQuest = "17114392283861182",
            startPort = "Out",
            endQuest = "17419467738535735146",
            endPort = "In"
          },
          {
            startQuest = "17524832705255482",
            startPort = "Out",
            endQuest = "17114392283861178",
            endPort = "In"
          },
          {
            startQuest = "17419467738535735146",
            startPort = "Out",
            endQuest = "17114392283861179",
            endPort = "In"
          },
          {
            startQuest = "17114392283861179",
            startPort = "Out",
            endQuest = "17114392283861177",
            endPort = "In"
          },
          {
            startQuest = "17114392283861177",
            startPort = "Out",
            endQuest = "17524832705255482",
            endPort = "In"
          }
        },
        nodeData = {
          ["17114392283861173"] = {
            key = "17114392283861173",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 116.45854145854203, y = 296.6383616383617},
            propsData = {ModeType = 0}
          },
          ["17114392283861174"] = {
            key = "17114392283861174",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2178.3600539811064, y = 267.9049032838507},
            propsData = {ModeType = 0}
          },
          ["17114392283861175"] = {
            key = "17114392283861175",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2274.3473748473757, y = 513.6208791208792},
            propsData = {}
          },
          ["17114392283861176"] = {
            key = "17114392283861176",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1138.5038353459406, y = -116.03303713829999},
            propsData = {
              ImpressionTalkTriggerId = 510011,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Mading_1190115",
              GuideStaticCreatorId = 0
            }
          },
          ["17114392283861177"] = {
            key = "17114392283861177",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\128\170\231\137\169",
            pos = {x = 1254.4721930586375, y = 328.0579786247723},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180152,
                1180153,
                1180154,
                1180155,
                1180156
              }
            }
          },
          ["17114392283861178"] = {
            key = "17114392283861178",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1706.8455974320414, y = 281.20158647890685},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 5,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1180152,
                1180153,
                1180154,
                1180155,
                1180156
              }
            }
          },
          ["17114392283861179"] = {
            key = "17114392283861179",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1007.1812617677059, y = 337.8637284305221},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1180157,
              GuideType = "P",
              GuidePointName = "Quest_Alice_diary"
            }
          },
          ["17114392283861182"] = {
            key = "17114392283861182",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\128\170\231\137\169",
            pos = {x = 488.58660212128524, y = 307.41500146856816},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180152,
                1180153,
                1180154,
                1180155,
                1180156
              }
            }
          },
          ["17114392283861184"] = {
            key = "17114392283861184",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 449.6715083162448, y = 31.16798569507546},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "Quest_Alice_diary"
            }
          },
          ["17419467738535735146"] = {
            key = "17419467738535735146",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 739.137434043063, y = 322.22784647663985},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180606}
            }
          },
          ["17524832705255482"] = {
            key = "17524832705255482",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1473.150887790365, y = 161.36063093645183},
            propsData = {
              NewDescription = "Description_200203_3_3",
              NewDetail = "Content_200203_3_3",
              SubTaskTargetIndex = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["17114392283851136"] = {
      isStoryNode = true,
      key = "17114392283851136",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1978.707159262025, y = 268.37642910703875},
      propsData = {
        QuestId = 20020305,
        QuestDescriptionComment = "\230\151\165\232\174\176",
        QuestDescription = "Description_200203_3_2",
        QuestDeatil = "Content_200203_3_2",
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
        SubRegionId = 101103,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_20020304Alino_1180606"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17114392283861197",
            startPort = "Out",
            endQuest = "17114392283861198",
            endPort = "In"
          },
          {
            startQuest = "17114392283861198",
            startPort = "Out",
            endQuest = "17114392283861194",
            endPort = "Success"
          },
          {
            startQuest = "17114392283861193",
            startPort = "QuestStart",
            endQuest = "17114392283861197",
            endPort = "In"
          }
        },
        nodeData = {
          ["17114392283861193"] = {
            key = "17114392283861193",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 997.4125000000001, y = 318.325},
            propsData = {ModeType = 0}
          },
          ["17114392283861194"] = {
            key = "17114392283861194",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2293.1944444444443, y = 345.48245614035085},
            propsData = {ModeType = 0}
          },
          ["17114392283861195"] = {
            key = "17114392283861195",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2320, y = 747.5},
            propsData = {}
          },
          ["17114392283861196"] = {
            key = "17114392283861196",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1314.4129262550312, y = 33.96696286169973},
            propsData = {
              ImpressionTalkTriggerId = 510011,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Mading_1190115",
              GuideStaticCreatorId = 0
            }
          },
          ["17114392283861197"] = {
            key = "17114392283861197",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1498.7524960889407, y = 313.1107383650322},
            propsData = {
              ImpressionTalkTriggerId = 510011,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_20020304Alino_1180606",
              GuideStaticCreatorId = 700235
            }
          },
          ["17114392283861198"] = {
            key = "17114392283861198",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\142\137\232\144\189\231\137\169",
            pos = {x = 1885.8953532317973, y = 320.6335767108969},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = true,
              EnableFadeIn = true,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180160,
                1180161,
                1180606
              }
            }
          },
          ["17114392283861199"] = {
            key = "17114392283861199",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 902.6949038117032, y = 777.7365749971401},
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
    ["1728393971867209877"] = {
      isStoryNode = true,
      key = "1728393971867209877",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 2257.690816803077, y = 217.3788002760688},
      propsData = {
        QuestId = 20020306,
        QuestDescriptionComment = "\229\145\138\232\175\137\229\176\145\229\165\179\232\176\131\230\159\165\231\187\147\230\158\156",
        QuestDescription = "Description_200203_4",
        QuestDeatil = "Content_200203_4",
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
            startQuest = "1728393971867209878",
            startPort = "QuestStart",
            endQuest = "1728454807962362304",
            endPort = "In"
          },
          {
            startQuest = "1728454807962362304",
            startPort = "Out",
            endQuest = "1728393984774210436",
            endPort = "In"
          },
          {
            startQuest = "1728393984774210436",
            startPort = "Option_1",
            endQuest = "1728396991145212604",
            endPort = "In"
          },
          {
            startQuest = "1728393984774210436",
            startPort = "Option_2",
            endQuest = "1728396989857212574",
            endPort = "In"
          }
        },
        nodeData = {
          ["1728393971867209878"] = {
            key = "1728393971867209878",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1728393971867209881"] = {
            key = "1728393971867209881",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1964.382142857142, y = 339.2142857142857},
            propsData = {ModeType = 0}
          },
          ["1728393971867209884"] = {
            key = "1728393971867209884",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1823.124999999999, y = 737.5},
            propsData = {}
          },
          ["1728393984774210436"] = {
            key = "1728393984774210436",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1343.9007915077386, y = 273.0250719469128},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700032,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Alice_1_1190116",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51000801,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
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
              OptionType = "branch",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              BranchOptions = {
                "\229\177\149\231\164\186\231\136\177\228\184\189\228\184\157\231\154\132\230\151\165\232\174\176",
                "\228\184\141\229\177\149\231\164\186\231\136\177\228\184\189\228\184\157\231\154\132\230\151\165\232\174\176"
              },
              OverrideFailBlend = false
            }
          },
          ["1728396989857212574"] = {
            key = "1728396989857212574",
            type = "QuestConditionNode",
            name = "QuestCondition",
            pos = {x = 1663.6090701336084, y = 444.8162543145418},
            propsData = {
              PortName = "\239\188\136\228\184\141\229\177\149\231\164\186\231\136\177\228\184\189\228\184\157\231\154\132\230\151\165\232\174\176\239\188\137222"
            }
          },
          ["1728396991145212604"] = {
            key = "1728396991145212604",
            type = "QuestConditionNode",
            name = "QuestCondition",
            pos = {x = 1669.1659495387164, y = 164.33743474592094},
            propsData = {
              PortName = "\239\188\136\229\177\149\231\164\186\231\136\177\228\184\189\228\184\157\231\154\132\230\151\165\232\174\176\239\188\137111"
            }
          },
          ["1728454807962362304"] = {
            key = "1728454807962362304",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1044.0088285233564, y = 293.787211540762},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "N",
              GuideName = "Npc_Alice_1_1190116"
            }
          }
        },
        commentData = {}
      }
    },
    ["1728393973261209952"] = {
      isStoryNode = true,
      key = "1728393973261209952",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 2547.7064465960707, y = 171.83605329760204},
      propsData = {
        QuestId = 20020309,
        QuestDescriptionComment = "\229\155\158\229\164\141\231\136\177\229\176\148\232\142\142\228\184\141\229\177\149\231\164\186",
        QuestDescription = "Description_200203_5",
        QuestDeatil = "Content_200203_6",
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
            startQuest = "1728393973261209957",
            startPort = "QuestStart",
            endQuest = "1728455726938366197",
            endPort = "In"
          },
          {
            startQuest = "1728455726938366197",
            startPort = "Out",
            endQuest = "1728635513781755655",
            endPort = "In"
          },
          {
            startQuest = "1728635513781755655",
            startPort = "Out",
            endQuest = "1728393973261209958",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1728393973261209957"] = {
            key = "1728393973261209957",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1728393973261209958"] = {
            key = "1728393973261209958",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1595.9676964659366, y = 337.0402871425251},
            propsData = {ModeType = 0}
          },
          ["1728393973261209959"] = {
            key = "1728393973261209959",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1496.363636363635, y = 735.4545454545455},
            propsData = {}
          },
          ["1728455726938366197"] = {
            key = "1728455726938366197",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1064.3384624695866, y = 323.4867931558469},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "Aier_51000601"
            }
          },
          ["1728635513781755655"] = {
            key = "1728635513781755655",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1345.1797807567477, y = 300.934464258243},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700006,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Aier_1190083",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51000601,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_200203",
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
              ShowSkipButton = false,
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
                  TalkActorId = 700196,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700006,
                  TalkActorVisible = true
                },
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
                {TalkActorType = "Npc", TalkActorId = 700196},
                {TalkActorType = "Npc", TalkActorId = 700006},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1728397161549214981"] = {
      isStoryNode = true,
      key = "1728397161549214981",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 2564.542649646429, y = 357.4447650033182},
      propsData = {
        QuestId = 20020310,
        QuestDescriptionComment = "\229\155\158\229\164\141\231\136\177\229\176\148\232\142\142\229\177\149\231\164\186",
        QuestDescription = "Description_200203_5",
        QuestDeatil = "Content_200203_5",
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
        SubRegionId = 101101,
        StoryGuideType = "Point",
        StoryGuidePointName = "Aier_51000601"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1728397161549214986",
            startPort = "QuestStart",
            endQuest = "1728455642775364893",
            endPort = "In"
          },
          {
            startQuest = "1728455642775364893",
            startPort = "Out",
            endQuest = "1728397161549214989",
            endPort = "In"
          },
          {
            startQuest = "1728397161549214989",
            startPort = "Out",
            endQuest = "1728397161549214987",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1728397161549214986"] = {
            key = "1728397161549214986",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1728397161549214987"] = {
            key = "1728397161549214987",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1744.9328963256842, y = 284.3957219251337},
            propsData = {ModeType = 0}
          },
          ["1728397161549214988"] = {
            key = "1728397161549214988",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1496.363636363635, y = 735.4545454545455},
            propsData = {}
          },
          ["1728397161549214989"] = {
            key = "1728397161549214989",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1231.481046678848, y = 270.15008608682524},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700006,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Aier_1190083",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51000501,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = false,
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
          ["1728455642775364893"] = {
            key = "1728455642775364893",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1011.817378306906, y = 494.1028500689004},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "Aier_51000601"
            }
          }
        },
        commentData = {}
      }
    },
    ["17419218651729263109"] = {
      isStoryNode = true,
      key = "17419218651729263109",
      type = "StoryNode",
      name = "\231\131\173\229\191\131\232\130\160\231\154\132\229\184\130\230\176\145",
      pos = {x = 1264.6981790659297, y = 74.06122246414908},
      propsData = {
        QuestId = 20020312,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200203_12",
        QuestDeatil = "Content_200203_12",
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
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_HotHeart_Zhi20020312_1191259"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17419338252479265210",
            startPort = "Out",
            endQuest = "17419218651739263113",
            endPort = "Success"
          },
          {
            startQuest = "17419218651739263110",
            startPort = "QuestStart",
            endQuest = "17419383476509269448",
            endPort = "In"
          },
          {
            startQuest = "17419383476509269448",
            startPort = "Out",
            endQuest = "17419338252479265210",
            endPort = "In"
          }
        },
        nodeData = {
          ["17419218651739263110"] = {
            key = "17419218651739263110",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17419218651739263113"] = {
            key = "17419218651739263113",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1826.363636363636, y = 316.3636363636364},
            propsData = {ModeType = 0}
          },
          ["17419218651739263116"] = {
            key = "17419218651739263116",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17419338252479265210"] = {
            key = "17419338252479265210",
            type = "TalkNode",
            name = "free",
            pos = {x = 1388.439393939394, y = 285.63157894736844},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700232,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_HotHeart_Zhi20020312_1191259",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51000420,
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
          ["17419383476509269448"] = {
            key = "17419383476509269448",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1092.1256191818168, y = 343.13397126514974},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Npc_HotHeart_Zhi20020312_1191259",
              StaticCreatorIdList = {1191259}
            }
          }
        },
        commentData = {}
      }
    },
    ["17419218952809263461"] = {
      isStoryNode = true,
      key = "17419218952809263461",
      type = "StoryNode",
      name = "\232\140\171\231\132\182\231\154\132\229\184\130\230\176\145",
      pos = {x = 1499.7029360022905, y = 72.17361180943271},
      propsData = {
        QuestId = 20020313,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200203_13",
        QuestDeatil = "Content_200203_13",
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
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_20020313What_1191261"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17419338843279266277",
            startPort = "Out",
            endQuest = "17419218952809263465",
            endPort = "Success"
          },
          {
            startQuest = "17419218952809263462",
            startPort = "QuestStart",
            endQuest = "17419383897649270126",
            endPort = "In"
          },
          {
            startQuest = "17419383897649270126",
            startPort = "Out",
            endQuest = "17419338843279266277",
            endPort = "In"
          }
        },
        nodeData = {
          ["17419218952809263462"] = {
            key = "17419218952809263462",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17419218952809263465"] = {
            key = "17419218952809263465",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2316, y = 336},
            propsData = {ModeType = 0}
          },
          ["17419218952809263468"] = {
            key = "17419218952809263468",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17419338843279266277"] = {
            key = "17419338843279266277",
            type = "TalkNode",
            name = "free",
            pos = {x = 1594.967741935484, y = 385.03225806451616},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700233,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_20020313What_1191261",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51000427,
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
          ["17419383897649270126"] = {
            key = "17419383897649270126",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1254.764731740418, y = 404.225160205576},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Npc_20020313What_1191261",
              StaticCreatorIdList = {1191261}
            }
          }
        },
        commentData = {}
      }
    },
    ["17419219222629263738"] = {
      isStoryNode = true,
      key = "17419219222629263738",
      type = "StoryNode",
      name = "\229\188\128\230\156\151\231\154\132\229\184\130\230\176\145",
      pos = {x = 1444.3996743675743, y = 287.13983623275004},
      propsData = {
        QuestId = 20020314,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200203_14",
        QuestDeatil = "Content_200203_14",
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
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Open20020314_1191260"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17419339340159266784",
            startPort = "Out",
            endQuest = "17419219222629263742",
            endPort = "Success"
          },
          {
            startQuest = "17419219222629263739",
            startPort = "QuestStart",
            endQuest = "17419384151809270605",
            endPort = "In"
          },
          {
            startQuest = "17419384151809270605",
            startPort = "Out",
            endQuest = "17419339340159266784",
            endPort = "In"
          }
        },
        nodeData = {
          ["17419219222629263739"] = {
            key = "17419219222629263739",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17419219222629263742"] = {
            key = "17419219222629263742",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1984, y = 325.5},
            propsData = {ModeType = 0}
          },
          ["17419219222629263745"] = {
            key = "17419219222629263745",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17419339340159266784"] = {
            key = "17419339340159266784",
            type = "TalkNode",
            name = "free",
            pos = {x = 1441.1080751463878, y = 298.21426208810124},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700234,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Open20020314_1191260",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51000429,
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
          ["17419384151809270605"] = {
            key = "17419384151809270605",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1161.2236296187966, y = 277.11510989620695},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Npc_Open20020314_1191260",
              StaticCreatorIdList = {1191260}
            }
          }
        },
        commentData = {}
      }
    },
    ["17471282058732396239"] = {
      isStoryNode = true,
      key = "17471282058732396239",
      type = "StoryNode",
      name = "\229\187\182\232\191\1590.3\231\167\146",
      pos = {x = 2318.3142407024147, y = 481.2559561033081},
      propsData = {
        QuestId = 20020320,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200203_5",
        QuestDeatil = "Content_200203_5",
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
        SubRegionId = 101101,
        StoryGuideType = "Point",
        StoryGuidePointName = "Aier_51000601"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17471282058732396240",
            startPort = "QuestStart",
            endQuest = "17471283479062398129",
            endPort = "In"
          },
          {
            startQuest = "17471283479062398129",
            startPort = "Out",
            endQuest = "17471282058742396243",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17471282058732396240"] = {
            key = "17471282058732396240",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17471282058742396243"] = {
            key = "17471282058742396243",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17471282058742396246"] = {
            key = "17471282058742396246",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17471283479062398129"] = {
            key = "17471283479062398129",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1476, y = 368.00000000000006},
            propsData = {WaitTime = 0.3}
          }
        },
        commentData = {}
      }
    },
    ["17471282069062396317"] = {
      isStoryNode = true,
      key = "17471282069062396317",
      type = "StoryNode",
      name = "\229\187\182\232\191\1590.3\231\167\146",
      pos = {x = 2445.288233376408, y = -18.472615325263302},
      propsData = {
        QuestId = 20020319,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200203_5",
        QuestDeatil = "Content_200203_5",
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
        SubRegionId = 101101,
        StoryGuideType = "Point",
        StoryGuidePointName = "Aier_51000601"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17471282069062396322",
            startPort = "QuestStart",
            endQuest = "17471283216162397280",
            endPort = "In"
          },
          {
            startQuest = "17471283216162397280",
            startPort = "Out",
            endQuest = "17471282069062396323",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17471282069062396322"] = {
            key = "17471282069062396322",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17471282069062396323"] = {
            key = "17471282069062396323",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17471282069062396324"] = {
            key = "17471282069062396324",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17471283216162397280"] = {
            key = "17471283216162397280",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1500, y = 378.00000000000006},
            propsData = {WaitTime = 0.3}
          }
        },
        commentData = {}
      }
    },
    ["17509203211412056"] = {
      isStoryNode = true,
      key = "17509203211412056",
      type = "PreStoryNode",
      name = "\228\187\187\229\138\161\229\137\141\231\189\174\232\138\130\231\130\185",
      pos = {x = 997.7406567374137, y = 81.26426006184614},
      propsData = {
        QuestId = 20020300,
        QuestDescriptionComment = "",
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Aier_1190083"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17509203211412062",
            startPort = "ApproveOut",
            endQuest = "17509203211412061",
            endPort = "Success"
          },
          {
            startQuest = "17509203211412060",
            startPort = "QuestStart",
            endQuest = "17509203211412064",
            endPort = "In"
          },
          {
            startQuest = "17509203211412062",
            startPort = "CancelOut",
            endQuest = "17509203211412063",
            endPort = "Fail"
          },
          {
            startQuest = "17509203211412064",
            startPort = "Out",
            endQuest = "17509203211412062",
            endPort = "Input"
          },
          {
            startQuest = "17509203211412064",
            startPort = "Fail",
            endQuest = "17509203211412063",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17509203211412060"] = {
            key = "17509203211412060",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17509203211412061"] = {
            key = "17509203211412061",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1999.8571428571427, y = 215.9142857142857},
            propsData = {ModeType = 0}
          },
          ["17509203211412062"] = {
            key = "17509203211412062",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 1582.2571428571428, y = 239.91428571428574},
            propsData = {
              SideQuestChainId = 200203,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          },
          ["17509203211412063"] = {
            key = "17509203211412063",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2023.3995603258763, y = 467.03856200698306},
            propsData = {}
          },
          ["17509203211412064"] = {
            key = "17509203211412064",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1100.2567697066775, y = 261.39374921071516},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700006,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Aier_1190083",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51000401,
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
    }
  },
  commentData = {}
}
