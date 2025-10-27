return {
  storyName = "\231\166\187\229\188\128\230\141\174\231\130\185",
  storyDescription = "",
  lineData = {
    {
      startStory = "17107449546501952",
      startPort = "Success",
      endStory = "1711004775483129905",
      endPort = "In"
    },
    {
      startStory = "1711004775483129905",
      startPort = "Success",
      endStory = "1711006166041141792",
      endPort = "In"
    },
    {
      startStory = "1711006166041141792",
      startPort = "Success",
      endStory = "1711010183150150203",
      endPort = "In"
    },
    {
      startStory = "story_16919063411454084",
      startPort = "StoryStart",
      endStory = "17107449546501952",
      endPort = "In"
    },
    {
      startStory = "1715756785353969626",
      startPort = "Success",
      endStory = "1715756785353969627",
      endPort = "In"
    },
    {
      startStory = "1715756785353969627",
      startPort = "Success",
      endStory = "story_16919063411454086",
      endPort = "StoryEnd"
    },
    {
      startStory = "17113695216159609",
      startPort = "Success",
      endStory = "171861535368619607",
      endPort = "In"
    },
    {
      startStory = "1711010183150150203",
      startPort = "Success",
      endStory = "17212189858261122521",
      endPort = "In"
    },
    {
      startStory = "17212189858261122521",
      startPort = "Success",
      endStory = "1721273382491416456",
      endPort = "In"
    },
    {
      startStory = "1721273382491416456",
      startPort = "Success",
      endStory = "17213705168042310",
      endPort = "In"
    },
    {
      startStory = "17213705168042310",
      startPort = "Success",
      endStory = "17442870280643025502",
      endPort = "In"
    },
    {
      startStory = "17442870280643025502",
      startPort = "Success",
      endStory = "1715756785353969626",
      endPort = "In"
    }
  },
  storyNodeData = {
    story_16919063411454084 = {
      isStoryNode = true,
      key = "story_16919063411454084",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = -386.97750051588685, y = 156.7860147555623},
      propsData = {QuestChainId = 100207},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_16919063411454086 = {
      isStoryNode = true,
      key = "story_16919063411454086",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 397.63744385018043, y = 368.8437273156879},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17107449546501952"] = {
      isStoryNode = true,
      key = "17107449546501952",
      type = "StoryNode",
      name = "\229\156\168\229\185\191\229\156\186\231\173\137\232\181\155\231\144\170",
      pos = {x = -133.22895710787168, y = 158.90276045050481},
      propsData = {
        QuestId = 10020701,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020701",
        QuestDeatil = "QuestDesc_10020701",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = true,
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
        StoryGuidePointName = "",
        QuestUIId = 0
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17107449546501956",
            startPort = "QuestStart",
            endQuest = "17174061377078062",
            endPort = "In"
          },
          {
            startQuest = "1721455809736150998",
            startPort = "Out",
            endQuest = "1721455809736150997",
            endPort = "In"
          },
          {
            startQuest = "17112756878705270",
            startPort = "Out",
            endQuest = "1723198650082828508",
            endPort = "In"
          },
          {
            startQuest = "1723198650082828508",
            startPort = "Out",
            endQuest = "1721455809736150998",
            endPort = "In"
          },
          {
            startQuest = "1721455809736150997",
            startPort = "Out",
            endQuest = "171439295189120942",
            endPort = "In"
          },
          {
            startQuest = "1723198650082828508",
            startPort = "Out",
            endQuest = "1721455809736150996",
            endPort = "In"
          },
          {
            startQuest = "17174061377078062",
            startPort = "Out",
            endQuest = "17232745277244136175",
            endPort = "In"
          },
          {
            startQuest = "17232745277244136175",
            startPort = "Out",
            endQuest = "1723688248145173143",
            endPort = "In"
          },
          {
            startQuest = "17232012426941489991",
            startPort = "Out",
            endQuest = "17107449546501957",
            endPort = "Success"
          },
          {
            startQuest = "17174061377078062",
            startPort = "Out",
            endQuest = "17232012388351489843",
            endPort = "In"
          },
          {
            startQuest = "1723688248145173143",
            startPort = "Out",
            endQuest = "17232012426941489991",
            endPort = "In"
          }
        },
        nodeData = {
          ["17107449546501956"] = {
            key = "17107449546501956",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1005.2616603326401, y = 278.0300179469034},
            propsData = {ModeType = 0}
          },
          ["17107449546501957"] = {
            key = "17107449546501957",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 643.4714655055786, y = 285.75892696399467},
            propsData = {ModeType = 0}
          },
          ["17107449546501958"] = {
            key = "17107449546501958",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 652.34094540129, y = 418.4824378789897},
            propsData = {}
          },
          ["17112756878705270"] = {
            key = "17112756878705270",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144 \231\169\186NPC \231\173\137\229\190\133\232\181\155\231\144\170",
            pos = {x = -164.16512303600146, y = 932.317299604049},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190397}
            }
          },
          ["171439295189120942"] = {
            key = "171439295189120942",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129 \231\169\186NPC \231\173\137\229\190\133\232\181\155\231\144\170",
            pos = {x = 605.6030691845109, y = 931.2378626636696},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190397}
            }
          },
          ["17174061377078062"] = {
            key = "17174061377078062",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = -658.0274738792864, y = 276.96804691509425},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_WaitSaiqi"
            }
          },
          ["1721455809736150996"] = {
            key = "1721455809736150996",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 209.65255588401448, y = 1186.798478204973},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight1",
              UnitId = -1
            }
          },
          ["1721455809736150997"] = {
            key = "1721455809736150997",
            type = "TalkNode",
            name = "\233\131\189\229\164\135\229\166\165\228\186\134\227\128\130",
            pos = {x = 358.74824467379653, y = 923.5433027761944},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10110501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101105",
              BlendInTime = 0,
              BlendOutTime = 1,
              InType = "FadeIn",
              OutType = "BlendOut",
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200021}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1721455809736150998"] = {
            key = "1721455809736150998",
            type = "TalkNode",
            name = "\229\141\160\228\189\141\239\188\140\229\164\169\233\187\145\229\144\142\231\171\153\230\161\169",
            pos = {x = 91.77983849623065, y = 929.936728561246},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20001601,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101105",
              BlendInTime = 0,
              BlendOutTime = 0,
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200021}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1723198453092827337"] = {
            key = "1723198453092827337",
            type = "TalkNode",
            name = "\229\141\160\228\189\141\233\187\145\229\177\143",
            pos = {x = 180.6696781479393, y = -40.510163749294264},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20002901,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 2,
              BlendOutTime = 0,
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
          ["1723198650082828508"] = {
            key = "1723198650082828508",
            type = "TalkNode",
            name = "\229\141\160\228\189\141\239\188\140\229\164\169\233\187\145\229\144\142\231\171\153\230\161\169",
            pos = {x = -83.3562958780345, y = 1137.606719367589},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200051,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_WaitSaiqi_1190397",
              DelayShowGuideTime = 0,
              FirstDialogueId = 20002901,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101105",
              BlendInTime = 1,
              BlendOutTime = 0,
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200061,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 200061}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17232012388351489843"] = {
            key = "17232012388351489843",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = -338.96443948758025, y = -5.406480616158245},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["17232012426941489991"] = {
            key = "17232012426941489991",
            type = "TalkNode",
            name = "\233\131\189\229\164\135\229\166\165\228\186\134\227\128\130",
            pos = {x = 370.4099378881997, y = 279.1651609260304},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10110501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101105",
              BlendInTime = 0,
              BlendOutTime = 1,
              InType = "BlendIn",
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200021}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17232745277244136175"] = {
            key = "17232745277244136175",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = -409.60595201899497, y = 299.4210825406476},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190743,
              GuideType = "P",
              GuidePointName = "QuestPoint_20022004"
            }
          },
          ["1723688248145173143"] = {
            key = "1723688248145173143",
            type = "TalkNode",
            name = "\230\137\128\228\187\165\239\188\140\228\189\160\230\149\178\229\188\128",
            pos = {x = -167.04040404040435, y = 283.93706293706293},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10115801,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = 0,
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
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
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
    ["1711004775483129905"] = {
      isStoryNode = true,
      key = "1711004775483129905",
      type = "StoryNode",
      name = "\229\142\187\231\150\151\229\133\187\233\153\162\233\151\168\229\143\163\231\156\139\231\156\139\229\143\145\231\148\159\228\186\134\228\187\128\228\185\136",
      pos = {x = 126.94136336060058, y = 166.19908023742087},
      propsData = {
        QuestId = 10020702,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020702",
        QuestDeatil = "QuestDesc_10020702",
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
            startQuest = "171144480516088383",
            startPort = "Out",
            endQuest = "1711004775483129913",
            endPort = "In"
          },
          {
            startQuest = "1717406222059259032",
            startPort = "Out",
            endQuest = "1717406222059259033",
            endPort = "In"
          },
          {
            startQuest = "1711004775483129909",
            startPort = "QuestStart",
            endQuest = "1717406222059259032",
            endPort = "In"
          },
          {
            startQuest = "1717406222059259032",
            startPort = "Out",
            endQuest = "171144480516088383",
            endPort = "In"
          },
          {
            startQuest = "171144526689293463",
            startPort = "Out",
            endQuest = "1711004775483129910",
            endPort = "Success"
          },
          {
            startQuest = "1711004775483129913",
            startPort = "Out",
            endQuest = "1723106772058165140",
            endPort = "In"
          },
          {
            startQuest = "1723106772058165140",
            startPort = "Out",
            endQuest = "1723099018055676216",
            endPort = "In"
          },
          {
            startQuest = "1725459527481552476",
            startPort = "Out",
            endQuest = "1725459527481552475",
            endPort = "In"
          },
          {
            startQuest = "1711004775483129913",
            startPort = "Out",
            endQuest = "1725459527481552476",
            endPort = "In"
          },
          {
            startQuest = "1725459527481552475",
            startPort = "Out",
            endQuest = "171144526689293463",
            endPort = "In"
          },
          {
            startQuest = "1717406222059259032",
            startPort = "Out",
            endQuest = "1729666715845568782",
            endPort = "In"
          }
        },
        nodeData = {
          ["1711004775483129909"] = {
            key = "1711004775483129909",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -603.0356920197157, y = 302.41590428931147},
            propsData = {ModeType = 0}
          },
          ["1711004775483129910"] = {
            key = "1711004775483129910",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1370.3568416556595, y = 310.71764299624016},
            propsData = {ModeType = 0}
          },
          ["1711004775483129911"] = {
            key = "1711004775483129911",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1358.436064908173, y = 435.4794562289491},
            propsData = {}
          },
          ["1711004775483129913"] = {
            key = "1711004775483129913",
            type = "GoToNode",
            name = "goto \231\150\151\229\133\187\233\153\162\233\151\168\229\143\163",
            pos = {x = 115.67010149188829, y = 310.3685269971447},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1190006,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1190006"
            }
          },
          ["171144480516088383"] = {
            key = "171144480516088383",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144   \229\176\143\231\153\189",
            pos = {x = -119.60442099899386, y = 307.5069814586886},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190392}
            }
          },
          ["171144526689293463"] = {
            key = "171144526689293463",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129 \229\176\143\231\153\189",
            pos = {x = 1105.109014318019, y = 309.56112622638824},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190392}
            }
          },
          ["1717406222059259032"] = {
            key = "1717406222059259032",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = -358.8343906521723, y = 301.77964509735887},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "P10106701"
            }
          },
          ["1717406222059259033"] = {
            key = "1717406222059259033",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = -112.3854495264719, y = 171.681240902758},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["1723099018055676216"] = {
            key = "1723099018055676216",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 626.9606080418436, y = 481.6816770186334},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_EnterSan",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["1723106772058165140"] = {
            key = "1723106772058165140",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 380.3956766917295, y = 483.77913533834584},
            propsData = {WaitTime = 1}
          },
          ["1725459527481552475"] = {
            key = "1725459527481552475",
            type = "TalkNode",
            name = "\232\175\183\239\188\140\229\184\174\229\184\174\230\136\145\228\187\172",
            pos = {x = 661.098333157154, y = 289.140063334526},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10114501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101107",
              BlendInTime = 0,
              BlendOutTime = 1,
              InType = "BlendIn",
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200019,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200019}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1725459527481552476"] = {
            key = "1725459527481552476",
            type = "TalkNode",
            name = "\228\189\160\228\187\172\231\187\136\228\186\142\230\157\165\228\186\134",
            pos = {x = 406.8152006774322, y = 293.25279380833115},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10110601,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101106",
              BlendInTime = 1,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "BlendOut",
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
                  TalkActorId = 200021,
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
                {TalkActorType = "Npc", TalkActorId = 200021},
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
          ["1729666715845568782"] = {
            key = "1729666715845568782",
            type = "PlayOrStopBGMNode",
            name = "\229\188\128\229\167\139\230\146\173\230\148\190\231\171\153\230\161\169bgm",
            pos = {x = -109.07692307692253, y = 38.0769230769231},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt02/0051_story_danger",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101106, 101101},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          }
        },
        commentData = {}
      }
    },
    ["1711006166041141792"] = {
      isStoryNode = true,
      key = "1711006166041141792",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\150\151\229\133\187\233\153\162",
      pos = {x = 403.94132159370395, y = 164.09838500276638},
      propsData = {
        QuestId = 10020703,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020703",
        QuestDeatil = "QuestDesc_10020703",
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
            startQuest = "1711006166041141796",
            startPort = "QuestStart",
            endQuest = "1711011100090157467",
            endPort = "In"
          },
          {
            startQuest = "1711023336810208821",
            startPort = "Out",
            endQuest = "1711023336810208822",
            endPort = "In"
          },
          {
            startQuest = "1711011100090157467",
            startPort = "Out",
            endQuest = "171135284927939961",
            endPort = "In"
          },
          {
            startQuest = "171135284927939961",
            startPort = "Out",
            endQuest = "1711023336810208821",
            endPort = "In"
          },
          {
            startQuest = "171161181907811034",
            startPort = "Out",
            endQuest = "171161181907811033",
            endPort = "In"
          },
          {
            startQuest = "1711006166041141796",
            startPort = "QuestStart",
            endQuest = "171161181907811034",
            endPort = "In"
          },
          {
            startQuest = "1717406231286259646",
            startPort = "Out",
            endQuest = "1717406231286259647",
            endPort = "In"
          },
          {
            startQuest = "1711006166041141796",
            startPort = "QuestStart",
            endQuest = "1717406231286259646",
            endPort = "In"
          },
          {
            startQuest = "1711011100090157467",
            startPort = "Out",
            endQuest = "17230278169929027",
            endPort = "In"
          },
          {
            startQuest = "1723172546073332969",
            startPort = "Out",
            endQuest = "171161183239311759",
            endPort = "In"
          },
          {
            startQuest = "17230278169929027",
            startPort = "Out",
            endQuest = "1723172546073332969",
            endPort = "In"
          },
          {
            startQuest = "1711011100090157467",
            startPort = "Out",
            endQuest = "1723173255739660663",
            endPort = "In"
          },
          {
            startQuest = "1711011100090157467",
            startPort = "Out",
            endQuest = "17296685922142047194",
            endPort = "In"
          },
          {
            startQuest = "1711011100090157467",
            startPort = "Out",
            endQuest = "17441317859214151",
            endPort = "In"
          },
          {
            startQuest = "1723173255739660663",
            startPort = "Out",
            endQuest = "17441326556315946",
            endPort = "In"
          },
          {
            startQuest = "17441326556315946",
            startPort = "Out",
            endQuest = "1711006166041141797",
            endPort = "Success"
          },
          {
            startQuest = "1711011100090157467",
            startPort = "Out",
            endQuest = "17441323640855065",
            endPort = "In"
          },
          {
            startQuest = "17441323640855065",
            startPort = "Out",
            endQuest = "17441327008476870",
            endPort = "In"
          },
          {
            startQuest = "1723172546073332969",
            startPort = "Out",
            endQuest = "17230276732318107",
            endPort = "In"
          }
        },
        nodeData = {
          ["1711006166041141796"] = {
            key = "1711006166041141796",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -319.99999999999966, y = 142.7601809954751},
            propsData = {ModeType = 0}
          },
          ["1711006166041141797"] = {
            key = "1711006166041141797",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1068.3152098278636, y = 143.8655841734763},
            propsData = {ModeType = 0}
          },
          ["1711006166041141798"] = {
            key = "1711006166041141798",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 941.3393354268226, y = 295.91589609513545},
            propsData = {}
          },
          ["1711011100090157467"] = {
            key = "1711011100090157467",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\231\150\151\229\133\187\233\153\162",
            pos = {x = -92.48565391166895, y = 143.50846348849046},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101106,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "P10106801"
            }
          },
          ["1711023336810208821"] = {
            key = "1711023336810208821",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129 \232\181\155\231\144\170\230\136\191\233\151\180\233\135\140\231\154\132\230\129\169\233\135\140\229\133\139",
            pos = {x = 403.36882791133587, y = 299.8795090490938},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1200088}
            }
          },
          ["1711023336810208822"] = {
            key = "1711023336810208822",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144 \230\151\129\232\167\130\231\154\132\228\186\186\229\146\140\230\173\187\230\129\169\233\135\140\229\133\139",
            pos = {x = 662.6494691769087, y = 290.1089341099091},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1200096, 1200098}
            }
          },
          ["171135284927939961"] = {
            key = "171135284927939961",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\230\137\147\229\188\128\229\156\176\228\184\139\229\174\164\231\154\132\233\151\168",
            pos = {x = 162.56430567196782, y = 286.73451824922853},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "OpenEnlike",
              UnitId = -1
            }
          },
          ["171161181907811033"] = {
            key = "171161181907811033",
            type = "TalkNode",
            name = "\230\139\156\230\137\152\228\186\134\239\188\140\232\175\183\232\183\159\230\136\145\230\157\165\239\188\129",
            pos = {x = 172.91409044867805, y = -152.8810642890873},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10114601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["171161181907811034"] = {
            key = "171161181907811034",
            type = "GoToNode",
            name = "goto \231\150\151\229\133\187\233\153\162\233\151\168\229\143\163",
            pos = {x = -86.28101367992974, y = -135.7253280815607},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1190006,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1190006"
            }
          },
          ["171161183239311759"] = {
            key = "171161183239311759",
            type = "TalkNode",
            name = "\232\191\153\232\190\185\239\188\140\230\129\169\233\135\140\229\133\139\229\133\136\231\148\159\231\154\132\229\138\158\229\133\172\229\174\164\239\188\129",
            pos = {x = 665.6472440718569, y = 404.70878033784163},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10114701,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1717406231286259646"] = {
            key = "1717406231286259646",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = -86.56014316053357, y = -299.90171701878563},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1717406231286259647"] = {
            key = "1717406231286259647",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 162.38043676115342, y = -299.5060500671415},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["17230276732318107"] = {
            key = "17230276732318107",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 419.07292707292686, y = 542.0546953046954},
            propsData = {
              MessageType = "BehaviorTree",
              MessageContent = "BoyGo",
              UnitId = 200019
            }
          },
          ["17230278169929027"] = {
            key = "17230278169929027",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144 \229\184\166\232\183\175\231\154\132\228\186\186",
            pos = {x = 155.7499999999999, y = 414.2500000000001},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1200097}
            }
          },
          ["1723172546073332969"] = {
            key = "1723172546073332969",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 411.23971616618627, y = 416.72029441147095},
            propsData = {WaitTime = 0.5}
          },
          ["1723173255739660663"] = {
            key = "1723173255739660663",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\156\176\228\184\139\229\174\164",
            pos = {x = 162.01893694540675, y = 146.20081389199046},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1200150,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1200150"
            }
          },
          ["17296685922142047194"] = {
            key = "17296685922142047194",
            type = "PlayOrStopBGMNode",
            name = "\229\188\128\229\167\139\230\146\173\230\148\190\231\171\153\230\161\169bgm",
            pos = {x = 169.00000000000014, y = 33.46153846153884},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt02/0051_story_danger",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101106},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17441317859214151"] = {
            key = "17441317859214151",
            type = "SendMessageNode",
            name = "sequence\229\135\134\229\164\135\229\165\189",
            pos = {x = 395.13846153846146, y = 14.847152847152827},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EnlikeDeathReady",
              UnitId = -1
            }
          },
          ["17441323640855065"] = {
            key = "17441323640855065",
            type = "GoToNode",
            name = "\231\156\139sequence",
            pos = {x = 414.37984084880657, y = -125.96664025629548},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1200164,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1200150"
            }
          },
          ["17441326556315946"] = {
            key = "17441326556315946",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\129\169\233\135\140\229\133\139\233\151\168\229\143\163",
            pos = {x = 777.400530503979, y = 114.2402562954286},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1200165,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1200100"
            }
          },
          ["17441327008476870"] = {
            key = "17441327008476870",
            type = "SendMessageNode",
            name = "sequence\229\135\134\229\164\135\229\165\189",
            pos = {x = 662.3278219864427, y = -112.71913067775134},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EnlikeDeath",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["1711010183150150203"] = {
      isStoryNode = true,
      key = "1711010183150150203",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\229\156\176\228\184\139\229\174\164",
      pos = {x = 656.7170376114741, y = 163.927934610102},
      propsData = {
        QuestId = 10020704,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020704",
        QuestDeatil = "QuestDesc_10020704",
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
            startQuest = "1711010183150150207",
            startPort = "QuestStart",
            endQuest = "1717406242951260506",
            endPort = "In"
          },
          {
            startQuest = "1711010183150150207",
            startPort = "QuestStart",
            endQuest = "17216287274379254",
            endPort = "In"
          },
          {
            startQuest = "17216287274379254",
            startPort = "Out",
            endQuest = "1711011041914155309",
            endPort = "In"
          },
          {
            startQuest = "1717406242951260506",
            startPort = "Out",
            endQuest = "1721629019288993434",
            endPort = "In"
          },
          {
            startQuest = "1711011041914155309",
            startPort = "Out",
            endQuest = "1722672914419800667",
            endPort = "In"
          },
          {
            startQuest = "17297373112863712",
            startPort = "Out",
            endQuest = "1711010183150150208",
            endPort = "Success"
          },
          {
            startQuest = "17442729153343036049",
            startPort = "Out",
            endQuest = "17442730268153037379",
            endPort = "In"
          },
          {
            startQuest = "17216287274379254",
            startPort = "Out",
            endQuest = "17442738652817151101",
            endPort = "In"
          },
          {
            startQuest = "1711011247473162271",
            startPort = "Out",
            endQuest = "17469822903939993349",
            endPort = "In"
          },
          {
            startQuest = "17469822903939993349",
            startPort = "Out",
            endQuest = "17442729153343036049",
            endPort = "In"
          },
          {
            startQuest = "17469822903939993349",
            startPort = "Out",
            endQuest = "17442728251823035571",
            endPort = "In"
          },
          {
            startQuest = "17469822903939993349",
            startPort = "Out",
            endQuest = "1724123090963353650",
            endPort = "In"
          },
          {
            startQuest = "17469822903939993349",
            startPort = "Out",
            endQuest = "1724123090963353651",
            endPort = "In"
          },
          {
            startQuest = "17442730268153037379",
            startPort = "Out",
            endQuest = "17442729311983036282",
            endPort = "In"
          },
          {
            startQuest = "17442729311983036282",
            startPort = "Out",
            endQuest = "17297373112863712",
            endPort = "In"
          },
          {
            startQuest = "1711011041914155309",
            startPort = "Out",
            endQuest = "1711011247473162271",
            endPort = "In"
          },
          {
            startQuest = "17216287274379254",
            startPort = "Out",
            endQuest = "17296677862101491667",
            endPort = "In"
          }
        },
        nodeData = {
          ["1711010183150150207"] = {
            key = "1711010183150150207",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 53.80084151472651, y = 137.09677419354838},
            propsData = {ModeType = 0}
          },
          ["1711010183150150208"] = {
            key = "1711010183150150208",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1994.8540330098897, y = 144.5798999761584},
            propsData = {ModeType = 0}
          },
          ["1711010183150150209"] = {
            key = "1711010183150150209",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1571.8238046272315, y = 525.1157804365719},
            propsData = {}
          },
          ["1711011041914155309"] = {
            key = "1711011041914155309",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\156\176\228\184\139\229\174\164",
            pos = {x = 514.1602784759837, y = 153.17484766258167},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1200100,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1200100"
            }
          },
          ["1711011247473162271"] = {
            key = "1711011247473162271",
            type = "TalkNode",
            name = "\230\129\169\233\135\140\229\133\139\239\188\159\239\188\129",
            pos = {x = 752.4433861913349, y = 134.78130320470336},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10110801,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101108",
              BlendInTime = 0.5,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "BlendOut",
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
                  TalkActorId = 200061,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200005,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 200061},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200005}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1717406242951260506"] = {
            key = "1717406242951260506",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 249.71075984949957, y = -158.48031233651162},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17216287274379254"] = {
            key = "17216287274379254",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\231\150\151\229\133\187\233\153\162",
            pos = {x = 280.7579192546592, y = 147.72484472049698},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101106,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "P10106801"
            }
          },
          ["1721629019288993434"] = {
            key = "1721629019288993434",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 498.5840062111811, y = -212.27515527950337},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["1722672914419800667"] = {
            key = "1722672914419800667",
            type = "ChangeStaticCreatorNode",
            name = "\229\136\183\230\176\155\229\155\180\233\129\147\229\133\183",
            pos = {x = 761.2728521478538, y = -44.75152479099873},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1200138,
                1200139,
                1200140,
                1200141
              }
            }
          },
          ["1723358345572183934"] = {
            key = "1723358345572183934",
            type = "ChangeStaticCreatorNode",
            name = "\229\136\183\230\155\191\232\186\171\230\129\169\233\135\140\229\133\139",
            pos = {x = 1205.0089966295038, y = 552.1546279491835},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1200152}
            }
          },
          ["1724123090963353650"] = {
            key = "1724123090963353650",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129 \229\184\166\232\183\175\231\154\132\228\186\186",
            pos = {x = 1170.2350931677024, y = -96.37142857142864},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1200097}
            }
          },
          ["1724123090963353651"] = {
            key = "1724123090963353651",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144 \229\184\166\232\183\175\231\154\132\228\186\186\230\155\191\232\186\171",
            pos = {x = 1171.974223602485, y = -217.03726708074544},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1200151}
            }
          },
          ["17296677862101491667"] = {
            key = "17296677862101491667",
            type = "PlayOrStopBGMNode",
            name = "\229\188\128\229\167\139\230\146\173\230\148\190\231\171\153\230\161\169bgm",
            pos = {x = 515.6244602833518, y = 316.71013797185265},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt02/0051_story_danger",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101106},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17297373112863712"] = {
            key = "17297373112863712",
            type = "PlayOrStopBGMNode",
            name = "\229\188\128\229\167\139\230\146\173\230\148\190\231\171\153\230\161\169bgm",
            pos = {x = 1779.7899050474762, y = 262.6266866566715},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["1744135248502827288"] = {
            key = "1744135248502827288",
            type = "CameraLookAtNode",
            name = "CameraLookAt",
            pos = {x = 873.3319625745532, y = 458.9685400408561},
            propsData = {
              TargetType = "Point",
              PointName = "P10110802",
              ActorId = 0,
              Duration = 1,
              EasingFunc = 4,
              bDisableUserInput = true
            }
          },
          ["17442728251823035571"] = {
            key = "17442728251823035571",
            type = "SendMessageNode",
            name = "\230\129\169\233\135\140\229\133\139\230\173\187",
            pos = {x = 1181.8285714285716, y = 27.822077922077966},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "DeadEnlike",
              UnitId = -1
            }
          },
          ["17442729153343036049"] = {
            key = "17442729153343036049",
            type = "WaitOfTimeNode",
            name = "1s",
            pos = {x = 1196.2991596638653, y = 146.8691367456075},
            propsData = {WaitTime = 1}
          },
          ["17442729311983036282"] = {
            key = "17442729311983036282",
            type = "SendMessageNode",
            name = "\228\185\166\230\142\137\232\144\189",
            pos = {x = 1637.3229341736696, y = 103.2056563534507},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "BookDrop",
              UnitId = -1
            }
          },
          ["17442730268153037379"] = {
            key = "17442730268153037379",
            type = "CameraLookAtNode",
            name = "\231\156\139\228\185\166\230\158\182",
            pos = {x = 1413.7088335088329, y = 151.872497659998},
            propsData = {
              TargetType = "Point",
              PointName = "P10108906",
              ActorId = 0,
              Duration = 0.5,
              EasingFunc = 4,
              bDisableUserInput = true
            }
          },
          ["17442738652817151101"] = {
            key = "17442738652817151101",
            type = "SendMessageNode",
            name = "sequence\229\135\134\229\164\135\229\165\189",
            pos = {x = 526.5891242447038, y = 25.91938405805636},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EnlikeDeathReady",
              UnitId = -1
            }
          },
          ["17469822903939993349"] = {
            key = "17469822903939993349",
            type = "TalkNode",
            name = "\230\149\145\230\149\145\232\181\155\231\144\170",
            pos = {x = 969.4528265851794, y = 133.0951107715811},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0101/OBT0101_SC019/SQ_OBT0101_SC019",
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "P101108Nvzhu1",
              CameraLookAtTartgetPoint = "P10110802",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = true,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17113695216159609"] = {
      isStoryNode = true,
      key = "17113695216159609",
      type = "StoryNode",
      name = "\229\137\141\229\190\128boss\230\136\152",
      pos = {x = 1041.8616774582483, y = -210.12821721682698},
      propsData = {
        QuestId = 10020705,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020705",
        QuestDeatil = "QuestDesc_10020705",
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
            startQuest = "17113695216159613",
            startPort = "QuestStart",
            endQuest = "171137021923812914",
            endPort = "In"
          },
          {
            startQuest = "17113695216159613",
            startPort = "QuestStart",
            endQuest = "171161306268820366",
            endPort = "In"
          },
          {
            startQuest = "171161306268820366",
            startPort = "Out",
            endQuest = "171161309056221863",
            endPort = "In"
          },
          {
            startQuest = "171161309056221863",
            startPort = "Out",
            endQuest = "171161303858219383",
            endPort = "In"
          },
          {
            startQuest = "17113695216159613",
            startPort = "QuestStart",
            endQuest = "171161438503355909",
            endPort = "In"
          },
          {
            startQuest = "17113695216159613",
            startPort = "QuestStart",
            endQuest = "171161449399357783",
            endPort = "In"
          },
          {
            startQuest = "17113695216159613",
            startPort = "QuestStart",
            endQuest = "171161455809659045",
            endPort = "In"
          },
          {
            startQuest = "17113695216159613",
            startPort = "QuestStart",
            endQuest = "171161468875861696",
            endPort = "In"
          },
          {
            startQuest = "171161468875861696",
            startPort = "Out",
            endQuest = "171161472557864003",
            endPort = "In"
          },
          {
            startQuest = "171161472557864003",
            startPort = "Out",
            endQuest = "171161474169964639",
            endPort = "In"
          },
          {
            startQuest = "17113695216159613",
            startPort = "QuestStart",
            endQuest = "171161481259166935",
            endPort = "In"
          },
          {
            startQuest = "171161482781867537",
            startPort = "Out",
            endQuest = "171161490781868721",
            endPort = "In"
          },
          {
            startQuest = "171161472557864003",
            startPort = "Out",
            endQuest = "1717406277982262457",
            endPort = "In"
          },
          {
            startQuest = "171161306268820366",
            startPort = "Out",
            endQuest = "1717406443863264298",
            endPort = "In"
          },
          {
            startQuest = "17113695216159613",
            startPort = "QuestStart",
            endQuest = "17185924860562821150",
            endPort = "In"
          },
          {
            startQuest = "17185924860562821150",
            startPort = "Out",
            endQuest = "1717406277982262457",
            endPort = "In"
          },
          {
            startQuest = "171161481259166935",
            startPort = "Out",
            endQuest = "17125658499917852",
            endPort = "In"
          },
          {
            startQuest = "17185924860562821150",
            startPort = "Out",
            endQuest = "17185927853463215297",
            endPort = "In"
          },
          {
            startQuest = "1717406477673265977",
            startPort = "Out",
            endQuest = "1718615692431417434",
            endPort = "In"
          },
          {
            startQuest = "1718615692431417434",
            startPort = "Out",
            endQuest = "171161482781867537",
            endPort = "In"
          },
          {
            startQuest = "171137021923812914",
            startPort = "Out",
            endQuest = "1718615756407418991",
            endPort = "In"
          },
          {
            startQuest = "1718615756407418991",
            startPort = "Out",
            endQuest = "17113695216159614",
            endPort = "Success"
          },
          {
            startQuest = "17125658499917852",
            startPort = "Out",
            endQuest = "1718618456191136557",
            endPort = "In"
          },
          {
            startQuest = "1718618456191136557",
            startPort = "Out",
            endQuest = "1717406477673265977",
            endPort = "In"
          },
          {
            startQuest = "17113695216159613",
            startPort = "QuestStart",
            endQuest = "1719495851048835332",
            endPort = "In"
          },
          {
            startQuest = "1719495851048835332",
            startPort = "Out",
            endQuest = "17195431902491106748",
            endPort = "In"
          },
          {
            startQuest = "17195431902491106748",
            startPort = "Out",
            endQuest = "1719495874089836091",
            endPort = "In"
          }
        },
        nodeData = {
          ["17113695216159613"] = {
            key = "17113695216159613",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -140.72176927015636, y = 162.25954153373502},
            propsData = {ModeType = 0}
          },
          ["17113695216159614"] = {
            key = "17113695216159614",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 703.2653526399334, y = 212.56497586513697},
            propsData = {ModeType = 0}
          },
          ["17113695216159615"] = {
            key = "17113695216159615",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1039.8017695168555, y = 380.61884376425763},
            propsData = {}
          },
          ["171137021923812914"] = {
            key = "171137021923812914",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\134\176\230\185\150\229\175\185\233\157\162",
            pos = {x = 142.78248839590935, y = 203.44618888601036},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240122,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1240122"
            }
          },
          ["171161303858219383"] = {
            key = "171161303858219383",
            type = "TalkNode",
            name = "\229\133\136\230\138\147\231\180\167\231\166\187\229\188\128\232\191\153\229\132\191\229\144\167\227\128\130",
            pos = {x = 623.5951208824575, y = -165.75050114509682},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10114801,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["171161306268820366"] = {
            key = "171161306268820366",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\231\150\151\229\133\187\233\153\162",
            pos = {x = 141.37289866023545, y = -152.41716781176336},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101106,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["171161309056221863"] = {
            key = "171161309056221863",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 375.48400977134634, y = -147.52827892287468},
            propsData = {WaitTime = 1}
          },
          ["171161438503355909"] = {
            key = "171161438503355909",
            type = "TalkNode",
            name = "\232\137\190\232\142\137\232\142\142\228\187\187\229\138\161\229\144\142",
            pos = {x = 152.81585684657298, y = -992.7134588226556},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200045,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "Npc_101109Alyssa_1200104",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10114901,
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
          ["171161449399357783"] = {
            key = "171161449399357783",
            type = "TalkNode",
            name = "\231\177\179\229\168\133\228\187\187\229\138\161\229\144\142",
            pos = {x = 154.76632124285774, y = -840.8746764652177},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700049,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "Npc_Miya_1200098",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10115001,
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
          ["171161455809659045"] = {
            key = "171161455809659045",
            type = "TalkNode",
            name = "\229\176\145\229\185\180\228\187\187\229\138\161\229\144\142",
            pos = {x = 148.8684884255202, y = -695.6209199614214},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200019,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "Npc_Boy_1200097",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 10115101,
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
          ["171161468875861696"] = {
            key = "171161468875861696",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\231\166\187\229\188\128\231\150\151\229\133\187\233\153\162",
            pos = {x = 143.84755433880312, y = -301.8956545215061},
            propsData = {
              RegionType = 1,
              IsEnter = "Leave",
              RegionId = 101106,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["171161472557864003"] = {
            key = "171161472557864003",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 387.46849465754485, y = -299.74953927154996},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["171161474169964639"] = {
            key = "171161474169964639",
            type = "TalkNode",
            name = "\232\191\152\232\174\176\229\190\151\232\181\155\231\144\170\230\152\175\229\190\128\229\147\170\228\184\170\230\150\185\229\144\145\232\183\145\231\154\132\229\144\151",
            pos = {x = 632.7626123046035, y = -312.1024804480205},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10115201,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["171161481259166935"] = {
            key = "171161481259166935",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\229\134\176\230\185\150",
            pos = {x = 145.74660843479276, y = 0.877414081085828},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["171161482781867537"] = {
            key = "171161482781867537",
            type = "TalkNode",
            name = "\229\165\189\229\164\167\231\154\132\233\163\142",
            pos = {x = 1452.725109415734, y = 23.548778192847735},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10115301,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["171161490781868721"] = {
            key = "171161490781868721",
            type = "TalkNode",
            name = "\232\191\153\230\152\175\230\156\128\232\191\145\231\154\132\232\183\175",
            pos = {x = 1697.4160281794786, y = 20.500351977667663},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10115401,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17125658499917852"] = {
            key = "17125658499917852",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\188\128\229\144\175\233\163\142\229\156\186\230\156\186\229\133\179",
            pos = {x = 407.942285397217, y = 4.885560193669798},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Icelake_SearchSaiqi",
              UnitId = -1
            }
          },
          ["1717406277982262457"] = {
            key = "1717406277982262457",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 632.671062089031, y = -467.79224916216356},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["1717406443863264298"] = {
            key = "1717406443863264298",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 852.1492267831333, y = -161.3949579854411},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "SanatoriumNight",
              UnitId = -1
            }
          },
          ["1717406477673265977"] = {
            key = "1717406477673265977",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 903.5815855568212, y = 9.444686046796216},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeNight",
              UnitId = -1
            }
          },
          ["17185924860562821150"] = {
            key = "17185924860562821150",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 140.89018092503363, y = -474.35016991300614},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17185927853463215297"] = {
            key = "17185927853463215297",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\188\128\229\144\175\229\134\176\230\185\150\233\163\142\230\154\180",
            pos = {x = 628.7732412445604, y = -591.2451235118936},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeStorm_On",
              UnitId = -1
            }
          },
          ["1718615692431417434"] = {
            key = "1718615692431417434",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\157\180\232\157\182",
            pos = {x = 1176.5881263519518, y = 19.35398807741383},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240110,
                1240111,
                1240112,
                1240113,
                1240114,
                1240115,
                1240116,
                1240117,
                1240118,
                1240119,
                1240120,
                1240121
              }
            }
          },
          ["1718615756407418991"] = {
            key = "1718615756407418991",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\232\157\180\232\157\182",
            pos = {x = 400.91034857417515, y = 208.99843252185798},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240110,
                1240111,
                1240112,
                1240113,
                1240114,
                1240115,
                1240116,
                1240117,
                1240118,
                1240119,
                1240120,
                1240121
              }
            }
          },
          ["1718618456191136557"] = {
            key = "1718618456191136557",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\188\128\229\144\175\229\134\176\230\185\150\233\163\142\230\154\180",
            pos = {x = 661.7350844358648, y = 0.9213198282847372},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeStorm_On",
              UnitId = -1
            }
          },
          ["1719495851048835332"] = {
            key = "1719495851048835332",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\229\133\172\232\183\175",
            pos = {x = 133.9574188159473, y = 380.2505325646067},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1719495874089836091"] = {
            key = "1719495874089836091",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\133\172\232\183\175\232\157\180\232\157\182",
            pos = {x = 645.1112649697935, y = 374.48130179537594},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180335,
                1180336,
                1180337,
                1180338,
                1180339,
                1180340
              }
            }
          },
          ["17195431902491106748"] = {
            key = "17195431902491106748",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 381.91895727748596, y = 375.51426882834284},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    },
    ["1715756785353969626"] = {
      isStoryNode = true,
      key = "1715756785353969626",
      type = "StoryNode",
      name = "\229\135\187\232\180\165BOSS\232\181\155\231\144\170",
      pos = {x = -134.83852350792492, y = 361.81429299920507},
      propsData = {
        QuestId = 10020708,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020708",
        QuestDeatil = "QuestDesc_10020708",
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
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_Saiqi8"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1715756785354969640",
            startPort = "Out",
            endQuest = "1715756785354969639",
            endPort = "In"
          },
          {
            startQuest = "1715756785354969640",
            startPort = "Out",
            endQuest = "1715756785354969638",
            endPort = "In"
          },
          {
            startQuest = "1715756785354969647",
            startPort = "Out",
            endQuest = "1715756785354969640",
            endPort = "In"
          },
          {
            startQuest = "1715756785354969656",
            startPort = "Out",
            endQuest = "1715756785354969641",
            endPort = "In"
          },
          {
            startQuest = "1715756785354969641",
            startPort = "Out",
            endQuest = "1715756785354969647",
            endPort = "In"
          },
          {
            startQuest = "1715756785354969660",
            startPort = "Out",
            endQuest = "1715756785354969659",
            endPort = "In"
          },
          {
            startQuest = "1717406559504393185",
            startPort = "Out",
            endQuest = "1717406542547392816",
            endPort = "In"
          },
          {
            startQuest = "1715756785354969635",
            startPort = "QuestStart",
            endQuest = "1717406559504393185",
            endPort = "In"
          },
          {
            startQuest = "17184388615852879055",
            startPort = "Fail",
            endQuest = "17184389660142883033",
            endPort = "In"
          },
          {
            startQuest = "1715756785354969640",
            startPort = "Out",
            endQuest = "1715756785354969660",
            endPort = "In"
          },
          {
            startQuest = "1715756785354969635",
            startPort = "QuestStart",
            endQuest = "1722668767127324450",
            endPort = "In"
          },
          {
            startQuest = "1722668767127324450",
            startPort = "Out",
            endQuest = "1715756785354969661",
            endPort = "In"
          },
          {
            startQuest = "17247507492995077122",
            startPort = "Out",
            endQuest = "17247507492995077123",
            endPort = "In"
          },
          {
            startQuest = "17184388615852879055",
            startPort = "Fail",
            endQuest = "17251736098981997897",
            endPort = "In"
          },
          {
            startQuest = "1715756785354969635",
            startPort = "QuestStart",
            endQuest = "1727425751507203922",
            endPort = "In"
          },
          {
            startQuest = "1727425785747387996",
            startPort = "BeginOverlap",
            endQuest = "1727425806133388256",
            endPort = "In"
          },
          {
            startQuest = "1727425799315388093",
            startPort = "Out",
            endQuest = "1727425800843388116",
            endPort = "In"
          },
          {
            startQuest = "17285300550133400816",
            startPort = "Out",
            endQuest = "1715756785354969637",
            endPort = "Fail"
          },
          {
            startQuest = "1717406542547392816",
            startPort = "Out",
            endQuest = "1730204194934751671",
            endPort = "In"
          },
          {
            startQuest = "1730204198766751837",
            startPort = "Out",
            endQuest = "1730204215416752227",
            endPort = "In"
          },
          {
            startQuest = "1730204198766751837",
            startPort = "Out",
            endQuest = "1717406559504393185",
            endPort = "In"
          },
          {
            startQuest = "1717406559504393185",
            startPort = "Out",
            endQuest = "1730204198766751837",
            endPort = "In"
          },
          {
            startQuest = "17184388615852879055",
            startPort = "Fail",
            endQuest = "173035819283735366",
            endPort = "In"
          },
          {
            startQuest = "17184388615852879055",
            startPort = "PassiveFail",
            endQuest = "17251736098981997897",
            endPort = "In"
          },
          {
            startQuest = "17184388615852879055",
            startPort = "PassiveFail",
            endQuest = "173035819283735366",
            endPort = "In"
          },
          {
            startQuest = "173035819283735366",
            startPort = "Out",
            endQuest = "1745241950556830638",
            endPort = "In"
          },
          {
            startQuest = "17251736098981997897",
            startPort = "Out",
            endQuest = "17490918033592342065",
            endPort = "In"
          },
          {
            startQuest = "17490918033592342065",
            startPort = "Out",
            endQuest = "17490917619432341373",
            endPort = "In"
          },
          {
            startQuest = "17247507492995077123",
            startPort = "Out",
            endQuest = "17285300550133400816",
            endPort = "Input_1"
          },
          {
            startQuest = "17490917619432341373",
            startPort = "Out",
            endQuest = "17285300550133400816",
            endPort = "Input_3"
          },
          {
            startQuest = "1745241950556830638",
            startPort = "Out",
            endQuest = "17285300550133400816",
            endPort = "Input_4"
          },
          {
            startQuest = "17184388615852879055",
            startPort = "PassiveFail",
            endQuest = "1757433719936960987",
            endPort = "In"
          },
          {
            startQuest = "17184389660142883033",
            startPort = "Out",
            endQuest = "17247507492995077122",
            endPort = "In"
          },
          {
            startQuest = "1757433719936960987",
            startPort = "Out",
            endQuest = "17247507492995077122",
            endPort = "In"
          },
          {
            startQuest = "17184388615852879055",
            startPort = "Success",
            endQuest = "1715756785354969636",
            endPort = "Success"
          },
          {
            startQuest = "17184388615852879055",
            startPort = "Fail",
            endQuest = "17285300550133400816",
            endPort = "Input_2"
          },
          {
            startQuest = "17184388615852879055",
            startPort = "PassiveFail",
            endQuest = "17285300550133400816",
            endPort = "Input_2"
          },
          {
            startQuest = "1759219514507944786",
            startPort = "true",
            endQuest = "17592170569644415",
            endPort = "In"
          },
          {
            startQuest = "1715756785354969635",
            startPort = "QuestStart",
            endQuest = "1759219514507944786",
            endPort = "In"
          },
          {
            startQuest = "1759219514507944786",
            startPort = "false",
            endQuest = "17184388615852879055",
            endPort = "In"
          },
          {
            startQuest = "17592170569644415",
            startPort = "Out",
            endQuest = "17184388615852879055",
            endPort = "In"
          }
        },
        nodeData = {
          ["1715756785354969635"] = {
            key = "1715756785354969635",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -2755.2632066794454, y = 75.05287354633654},
            propsData = {ModeType = 0}
          },
          ["1715756785354969636"] = {
            key = "1715756785354969636",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -410.4697219519711, y = -15.30587921222159},
            propsData = {ModeType = 0}
          },
          ["1715756785354969637"] = {
            key = "1715756785354969637",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -88.31995989694738, y = 714.7456785433153},
            propsData = {}
          },
          ["1715756785354969638"] = {
            key = "1715756785354969638",
            type = "KillMonsterNode",
            name = "\229\135\187\232\180\165\232\181\155\231\144\170",
            pos = {x = 802.8521063471424, y = -492.0851741271574},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 1,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = false,
              StaticCreatorIdList = {1240026}
            }
          },
          ["1715756785354969639"] = {
            key = "1715756785354969639",
            type = "PlayOrStopBGMNode",
            name = "\230\146\173\230\148\190\229\163\176\233\159\179",
            pos = {x = 801.9816662337605, y = -760.7036085150208},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt01/0032_combat_shijingzhe.0032_combat_shijingzhe'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["1715756785354969640"] = {
            key = "1715756785354969640",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 504.23809740983614, y = -494.4365244006581},
            propsData = {GuideId = 6}
          },
          ["1715756785354969641"] = {
            key = "1715756785354969641",
            type = "BossBattleFinishNode",
            name = "\231\187\153GameMode\229\143\145\230\182\136\230\129\175\239\188\140\232\181\155\231\144\170boss\229\136\155\229\187\186",
            pos = {x = -14.12779125603922, y = -493.24639074509787},
            propsData = {
              SendMessage = "Chapter01_Icelake_SaiqiBoss_Temporary_Start",
              FinishCondition = "BossSaiqi_Create"
            }
          },
          ["1715756785354969647"] = {
            key = "1715756785354969647",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 236.43069485802437, y = -494.55023421121575},
            propsData = {WaitTime = 0.5}
          },
          ["1715756785354969656"] = {
            key = "1715756785354969656",
            type = "TalkNode",
            name = "\232\191\135\229\156\186\229\138\168\231\148\187 \232\181\155\231\144\170\229\143\152\232\186\171",
            pos = {x = -256.1981361875849, y = -484.96032709935093},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0101/OBT0101_SC003/SQ_OBT0101_SC003",
              InType = "BlendIn",
              OutType = "BlendOut",
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = false,
              HideNpcs = false,
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
          ["1715756785354969659"] = {
            key = "1715756785354969659",
            type = "TalkNode",
            name = "\232\181\155\231\144\170\239\188\140\229\144\172\229\190\151\232\167\129\230\136\145\231\154\132\229\163\176\233\159\179\229\144\151\239\188\159",
            pos = {x = 1139.7469425569257, y = -628.428908468698},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10111101,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1715756785354969660"] = {
            key = "1715756785354969660",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 803.1313299087046, y = -621.2698175596071},
            propsData = {WaitTime = 4}
          },
          ["1715756785354969661"] = {
            key = "1715756785354969661",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\134\176\230\185\150boss\232\181\155\231\144\170",
            pos = {x = -1294.4491971041555, y = -170.34128623908083},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240026}
            }
          },
          ["1717406542547392816"] = {
            key = "1717406542547392816",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = -1285.0081485584524, y = -294.31713840710717},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeNight",
              UnitId = -1
            }
          },
          ["1717406559504393185"] = {
            key = "1717406559504393185",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\229\134\176\230\185\150",
            pos = {x = -1630.7561385801268, y = -253.21306170895124},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17184388615852879055"] = {
            key = "17184388615852879055",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = -1486.181176066242, y = 119.04276234681875},
            propsData = {SpecialConfigId = 117, BlackScreenImmediately = true}
          },
          ["17184389660142883033"] = {
            key = "17184389660142883033",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\232\174\190\231\189\174\231\142\169\229\174\182\229\156\168\233\163\142\230\154\180\229\133\165\229\143\163",
            pos = {x = -463.18135291075606, y = 142.1436452986133},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_SaiqiBossBattleFail4",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["1722668767127324450"] = {
            key = "1722668767127324450",
            type = "GoToNode",
            name = "\231\161\174\232\174\164\231\142\169\229\174\182\230\152\175\228\184\141\230\152\175\229\156\168\229\134\176\230\185\150",
            pos = {x = -1613.4124625374616, y = -72.69732898680299},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1240291,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1240291"
            }
          },
          ["17247507492995077122"] = {
            key = "17247507492995077122",
            type = "ActivePlayerSkillsNode",
            name = "\229\133\129\232\174\184\230\148\187\229\135\187\230\148\190\230\138\128\232\131\189",
            pos = {x = -719.4675190005736, y = 445.2852753374772},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Lock",
              SkillNameList = {
                "Attack",
                "Skill1",
                "Skill2",
                "Skill3",
                "FallAttack",
                "SlideAttack",
                "Fire",
                "Avoid",
                "HeavyAttack",
                "FireInAir",
                "Jump",
                "Slide",
                "BulletJump"
              }
            }
          },
          ["17247507492995077123"] = {
            key = "17247507492995077123",
            type = "ForbidWeaponByWeaponTagNode",
            name = "\229\144\175\231\148\168\230\173\166\229\153\168\232\138\130\231\130\185",
            pos = {x = -713.6132829977535, y = 572.0315976650354},
            propsData = {
              WeaponTags = {"Melee", "Ranged"},
              bForbid = false,
              ForbidTag = "ForbidDefault",
              bHidewhenForbid = true
            }
          },
          ["17251736098981997897"] = {
            key = "17251736098981997897",
            type = "SendMessageNode",
            name = "\232\181\155\231\144\1703\233\152\182\230\174\181",
            pos = {x = -729.3609860827366, y = 821.5038335666042},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Icelake_NvzhuWind_End",
              UnitId = -1
            }
          },
          ["1727425751507203922"] = {
            key = "1727425751507203922",
            type = "SendMessageNode",
            name = "\229\136\135\229\155\158\230\157\165",
            pos = {x = -1652.959542188976, y = -595.1686624014798},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "LeaveStormCam",
              UnitId = -1
            }
          },
          ["1727425785747387996"] = {
            key = "1727425785747387996",
            type = "CollisionBoxNode",
            name = "\229\136\164\229\174\154\231\142\169\229\174\182\230\152\175\229\144\166\233\156\128\232\166\129\229\155\158\228\189\141",
            pos = {x = -1796.3722164712146, y = 635.9977798519188},
            propsData = {StaticCreatorId = 1240709}
          },
          ["1727425799315388093"] = {
            key = "1727425799315388093",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -2170.192922619287, y = 598.6677569336608},
            propsData = {WaitTime = 0.2}
          },
          ["1727425800843388116"] = {
            key = "1727425800843388116",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\155\158\228\189\141\232\167\166\229\143\145\231\155\146",
            pos = {x = -1849.2634045670068, y = 801.0299982728844},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240709}
            }
          },
          ["1727425806133388256"] = {
            key = "1727425806133388256",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\232\174\190\231\189\174\231\142\169\229\174\182\229\156\168\233\163\142\230\154\180\229\133\165\229\143\163",
            pos = {x = -1348.490531954232, y = 771.839112432382},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_SaiqiBossBattleFail",
              FadeIn = false,
              FadeOut = true,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17285300550133400816"] = {
            key = "17285300550133400816",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 38.52518018206189, y = 490.71740839289646},
            propsData = {ListenCount = 4, NeedFinishCount = 4}
          },
          ["1730204194934751671"] = {
            key = "1730204194934751671",
            type = "SendMessageNode",
            name = "\232\181\155\231\144\1703\233\152\182\230\174\181",
            pos = {x = -987.7535887479671, y = -308.2585815035238},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Icelake_NvzhuWind_Start",
              UnitId = -1
            }
          },
          ["1730204198766751837"] = {
            key = "1730204198766751837",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\231\166\187\229\188\128\229\134\176\230\185\150",
            pos = {x = -1643.9216015661816, y = -458.40257291727886},
            propsData = {
              RegionType = 1,
              IsEnter = "Leave",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1730204215416752227"] = {
            key = "1730204215416752227",
            type = "SendMessageNode",
            name = "\232\181\155\231\144\1703\233\152\182\230\174\181",
            pos = {x = -1244.8088270386022, y = -444.456106093283},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Icelake_NvzhuWind_End",
              UnitId = -1
            }
          },
          ["173035819283735366"] = {
            key = "173035819283735366",
            type = "SendMessageNode",
            name = "boss\230\136\152\229\164\177\232\180\165\233\135\141\231\189\174",
            pos = {x = -741.052507164157, y = 1071.4740416875861},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "BossBattleFail",
              UnitId = -1
            }
          },
          ["1745241950556830638"] = {
            key = "1745241950556830638",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129",
            pos = {x = -738.8571428571429, y = 1203.4642857142858},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240026}
            }
          },
          ["17490917619432341373"] = {
            key = "17490917619432341373",
            type = "SendMessageNode",
            name = "boss\230\136\152\233\163\142\230\154\180\233\148\128\230\175\129",
            pos = {x = -689.9999999999998, y = 934.5},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Icelake_SaiqiBossWind_End",
              UnitId = -1
            }
          },
          ["17490918033592342065"] = {
            key = "17490918033592342065",
            type = "WaitOfTimeNode",
            name = "0.1",
            pos = {x = -719.9999999999998, y = 882},
            propsData = {WaitTime = 0.1}
          },
          ["1757433719936960987"] = {
            key = "1757433719936960987",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = -750.7207064640002, y = 216.57635340895092},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "BP_1240710",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17592170569644415"] = {
            key = "17592170569644415",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\134\176\230\185\150boss\230\136\152",
            pos = {x = -2003.4998685525004, y = 396.90042108920835},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240710,
              GuideType = "P",
              GuidePointName = "TargetPoint_Saiqi8"
            }
          },
          ["1759219514507944786"] = {
            key = "1759219514507944786",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = -2260.61430342521, y = 199.99110540883433},
            propsData = {
              FunctionName = "Equal",
              VarName = "BossRe10020708",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "1"}
              }
            }
          }
        },
        commentData = {}
      }
    },
    ["1715756785353969627"] = {
      isStoryNode = true,
      key = "1715756785353969627",
      type = "StoryNode",
      name = "\230\136\152\229\144\142\233\128\146\232\138\177",
      pos = {x = 142.3255527521784, y = 361.0627705262222},
      propsData = {
        QuestId = 10020709,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020709",
        QuestDeatil = "QuestDesc_10020709",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = true,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
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
            startQuest = "1715756785354969662",
            startPort = "QuestStart",
            endQuest = "1715756785354969666",
            endPort = "In"
          },
          {
            startQuest = "1715756785354969666",
            startPort = "Out",
            endQuest = "1715756785354969665",
            endPort = "In"
          },
          {
            startQuest = "1715756785354969666",
            startPort = "Out",
            endQuest = "1717406599452519147",
            endPort = "In"
          },
          {
            startQuest = "1715756785354969665",
            startPort = "Out",
            endQuest = "174698249571411714574",
            endPort = "In"
          },
          {
            startQuest = "174698249571411714574",
            startPort = "Out",
            endQuest = "1715756785354969663",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1715756785354969662"] = {
            key = "1715756785354969662",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 636.551724137931, y = 319.6551724137931},
            propsData = {ModeType = 0}
          },
          ["1715756785354969663"] = {
            key = "1715756785354969663",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1678.2487684729067, y = 325.50492610837443},
            propsData = {
              ModeType = 1,
              Id = 101401,
              StartIndex = 1,
              IsWhite = true
            }
          },
          ["1715756785354969664"] = {
            key = "1715756785354969664",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1715756785354969665"] = {
            key = "1715756785354969665",
            type = "TalkNode",
            name = "\232\191\135\229\156\186\229\138\168\231\148\187 \230\136\152\229\144\142\233\128\146\232\138\177",
            pos = {x = 1111.7410805608843, y = 323.5389372174721},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0101/OBT0101_SC006/SQ_OBT0101_SC006",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = false,
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
          ["1715756785354969666"] = {
            key = "1715756785354969666",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150",
            pos = {x = 866.2885114241114, y = 321.6849872039137},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_IceLake3"
            }
          },
          ["1717406599452519147"] = {
            key = "1717406599452519147",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 1111.1897353957281, y = 205.78487793414922},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeNight",
              UnitId = -1
            }
          },
          ["174698249571411714574"] = {
            key = "174698249571411714574",
            type = "TalkNode",
            name = "\232\191\135\229\156\186\229\138\168\231\148\187 \230\139\188\232\138\177",
            pos = {x = 1394.5579578631734, y = 307.8101574212894},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "LevelSequence'/Game/Asset/Cinematics/Story/OBT01/OBT0101/OBT0101_SC020/OBT0101_SC020_Shot0010.OBT0101_SC020_Shot0010'",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = false,
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
          }
        },
        commentData = {}
      }
    },
    ["171861535368619607"] = {
      isStoryNode = true,
      key = "171861535368619607",
      type = "StoryNode",
      name = "\233\161\182\233\163\142",
      pos = {x = 1279.4041657478638, y = -213.74629736485002},
      propsData = {
        QuestId = 10020706,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020706",
        QuestDeatil = "QuestDesc_10020706",
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
            startQuest = "171861535368619611",
            startPort = "QuestStart",
            endQuest = "171861535368619614",
            endPort = "In"
          },
          {
            startQuest = "171861535368619614",
            startPort = "Out",
            endQuest = "171861535368619612",
            endPort = "Success"
          },
          {
            startQuest = "171861535368619611",
            startPort = "QuestStart",
            endQuest = "171861535368819624",
            endPort = "In"
          },
          {
            startQuest = "171861535368619622",
            startPort = "Out",
            endQuest = "171861535368819629",
            endPort = "In"
          },
          {
            startQuest = "171861535368819624",
            startPort = "Out",
            endQuest = "17186184342055966",
            endPort = "In"
          },
          {
            startQuest = "17186184342055966",
            startPort = "Out",
            endQuest = "171861535368819631",
            endPort = "In"
          },
          {
            startQuest = "171861535368619611",
            startPort = "QuestStart",
            endQuest = "171861535368619622",
            endPort = "In"
          }
        },
        nodeData = {
          ["171861535368619611"] = {
            key = "171861535368619611",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -140.72176927015636, y = 162.25954153373502},
            propsData = {ModeType = 0}
          },
          ["171861535368619612"] = {
            key = "171861535368619612",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 456.3900540255064, y = 168.40547594476755},
            propsData = {ModeType = 0}
          },
          ["171861535368619613"] = {
            key = "171861535368619613",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 528.5039513929521, y = 290.0201284698902},
            propsData = {}
          },
          ["171861535368619614"] = {
            key = "171861535368619614",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\134\176\230\185\150boss\230\136\152",
            pos = {x = 154.2224277668832, y = 167.52822753701466},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240055,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1240055"
            }
          },
          ["171861535368619622"] = {
            key = "171861535368619622",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 141.34212103117193, y = -141.48030850231964},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["171861535368819624"] = {
            key = "171861535368819624",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\229\134\176\230\185\150",
            pos = {x = 145.74660843479276, y = -0.12258591891417225},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["171861535368819629"] = {
            key = "171861535368819629",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 411.9567763747459, y = -135.64939201930738},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["171861535368819631"] = {
            key = "171861535368819631",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 641.9375562432059, y = -0.4034883953944117},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeNight",
              UnitId = -1
            }
          },
          ["17186184342055966"] = {
            key = "17186184342055966",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\133\179\233\151\173\229\134\176\230\185\150\233\163\142\230\154\180",
            pos = {x = 400.94852800289135, y = 2.4807765210578054},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeStorm_Off",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["17212189858261122521"] = {
      isStoryNode = true,
      key = "17212189858261122521",
      type = "StoryNode",
      name = "\229\135\134\229\164\135\229\135\186\229\143\145",
      pos = {x = 888.5425980353974, y = 157.0114953900677},
      propsData = {
        QuestId = 10020705,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020705",
        QuestDeatil = "QuestDesc_10020705",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
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
            startQuest = "17212189858261122525",
            startPort = "QuestStart",
            endQuest = "17212189858261122532",
            endPort = "In"
          },
          {
            startQuest = "17212189858261122525",
            startPort = "QuestStart",
            endQuest = "1721628757676149956",
            endPort = "In"
          },
          {
            startQuest = "17212189858261122532",
            startPort = "Out",
            endQuest = "17216290321271133442",
            endPort = "In"
          },
          {
            startQuest = "1721628757676149956",
            startPort = "Out",
            endQuest = "17232714238522483282",
            endPort = "In"
          },
          {
            startQuest = "1721628757676149956",
            startPort = "Out",
            endQuest = "17232713594312482343",
            endPort = "In"
          },
          {
            startQuest = "1721628757676149956",
            startPort = "Out",
            endQuest = "17232732499273638538",
            endPort = "In"
          },
          {
            startQuest = "17253463929081317769",
            startPort = "Out",
            endQuest = "173131585045037554",
            endPort = "Input_1"
          },
          {
            startQuest = "17247455236412892447",
            startPort = "Out",
            endQuest = "173131585045037554",
            endPort = "Input_2"
          },
          {
            startQuest = "1721628757676149956",
            startPort = "Out",
            endQuest = "17442739240637973650",
            endPort = "In"
          },
          {
            startQuest = "1721628757676149956",
            startPort = "Out",
            endQuest = "17442739688558796352",
            endPort = "In"
          },
          {
            startQuest = "17230999726141006290",
            startPort = "Out",
            endQuest = "17247455236412892447",
            endPort = "In"
          },
          {
            startQuest = "17230999726141006290",
            startPort = "Out",
            endQuest = "17253463929081317769",
            endPort = "In"
          },
          {
            startQuest = "173131585045037554",
            startPort = "Out",
            endQuest = "17212189858261122526",
            endPort = "Success"
          },
          {
            startQuest = "17232732499273638538",
            startPort = "Out",
            endQuest = "17212189858261122529",
            endPort = "In"
          },
          {
            startQuest = "17212189858261122529",
            startPort = "Option_2",
            endQuest = "17212189858261122527",
            endPort = "Fail"
          },
          {
            startQuest = "17212189858261122529",
            startPort = "Option_1",
            endQuest = "1752663325424980126",
            endPort = "Input"
          },
          {
            startQuest = "1752663325424980126",
            startPort = "False",
            endQuest = "17230999726141006290",
            endPort = "In"
          },
          {
            startQuest = "1752663325424980126",
            startPort = "True",
            endQuest = "1753080382762970978",
            endPort = "In"
          },
          {
            startQuest = "1753080382762970978",
            startPort = "Out",
            endQuest = "17230999726141006290",
            endPort = "In"
          },
          {
            startQuest = "1721628757676149956",
            startPort = "Out",
            endQuest = "17296678144901675950",
            endPort = "In"
          }
        },
        nodeData = {
          ["17212189858261122525"] = {
            key = "17212189858261122525",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 90.3225806451613, y = 137.09677419354838},
            propsData = {ModeType = 0}
          },
          ["17212189858261122526"] = {
            key = "17212189858261122526",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2066.9852747400078, y = 34.34071187789985},
            propsData = {ModeType = 0}
          },
          ["17212189858261122527"] = {
            key = "17212189858261122527",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1325.4650134184403, y = 429.5822639530553},
            propsData = {}
          },
          ["17212189858261122529"] = {
            key = "17212189858261122529",
            type = "TalkNode",
            name = "\229\146\140\229\165\165\229\147\165\229\175\185\232\175\157",
            pos = {x = 809.327145654378, y = 85.22891313952556},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200021,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_200017Aote_1200131",
              DelayShowGuideTime = 0,
              FirstDialogueId = 20001701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_200017",
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200021}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {
                {
                  OptionText = "200017011",
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "200017012",
                  OverrideBlend = true,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0.5
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17212189858261122532"] = {
            key = "17212189858261122532",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 359.7728716507419, y = -268.4182005352693},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1721628757676149956"] = {
            key = "1721628757676149956",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\231\150\151\229\133\187\233\153\162",
            pos = {x = 325.29898205659174, y = 141.20310559006205},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101106,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "P10106801"
            }
          },
          ["17216290321271133442"] = {
            key = "17216290321271133442",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 585.9131987577649, y = -270.1633540372672},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["17230999726141006290"] = {
            key = "17230999726141006290",
            type = "TalkNode",
            name = "\230\152\175\232\166\129\229\142\187\230\137\190\232\181\155\231\144\170\229\144\151",
            pos = {x = 1316.7836496864677, y = 57.88029241952107},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10110901,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101109",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
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
                  TalkActorId = 200021,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200045,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 200045}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17232713594312482343"] = {
            key = "17232713594312482343",
            type = "TalkNode",
            name = "\231\150\151\229\133\187\233\153\162\232\183\175\228\186\186\229\175\185\232\175\157",
            pos = {x = 591.0204216073789, y = 404.550752870318},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200045,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 20002501,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
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
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17232714238522483282"] = {
            key = "17232714238522483282",
            type = "TalkNode",
            name = "\231\150\151\229\133\187\233\153\162\232\183\175\228\186\186\229\175\185\232\175\157",
            pos = {x = 588.3347073216647, y = 266.89361001317525},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700049,
              GuideUIEnable = false,
              GuideType = "N",
              GuidePointName = "",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 20002401,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 1,
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
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17232732499273638538"] = {
            key = "17232732499273638538",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\143\231\153\189\229\146\140\229\165\165\229\147\165",
            pos = {x = 580.277564464522, y = 114.14440366396883},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1200131, 1200133}
            }
          },
          ["17247455236412892447"] = {
            key = "17247455236412892447",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\155\158\228\189\141\231\189\174",
            pos = {x = 1557.7371387067046, y = 90.24163614163632},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "P_FindSaiqi1Fail",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17253463929081317769"] = {
            key = "17253463929081317769",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\230\146\173\230\148\190\231\171\153\230\161\169bgm",
            pos = {x = 1557.55473726592, y = -61.132354797653065},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17296678144901675950"] = {
            key = "17296678144901675950",
            type = "PlayOrStopBGMNode",
            name = "\229\188\128\229\167\139\230\146\173\230\148\190\231\171\153\230\161\169bgm",
            pos = {x = 588.8825799414716, y = 571.217364079079},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101106},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["173131585045037554"] = {
            key = "173131585045037554",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 1811.5187652926784, y = 18.248861283643677},
            propsData = {ListenCount = 2, NeedFinishCount = 2}
          },
          ["17442739240637973650"] = {
            key = "17442739240637973650",
            type = "SendMessageNode",
            name = "sequence\229\135\134\229\164\135\229\165\189",
            pos = {x = 353.01587301587296, y = 4.222222222222225},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EnlikeDeathReady",
              UnitId = -1
            }
          },
          ["17442739688558796352"] = {
            key = "17442739688558796352",
            type = "SendMessageNode",
            name = "\230\129\169\233\135\140\229\133\139\230\173\187",
            pos = {x = 353.4920634920636, y = -111.17460317460308},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "DeadEnlike",
              UnitId = -1
            }
          },
          ["1752663325424980126"] = {
            key = "1752663325424980126",
            type = "ShowPopupUINode",
            name = "\230\152\190\231\164\186\229\188\185\231\170\151",
            pos = {x = 1060.178021978022, y = 67.65274725274732},
            propsData = {PopupId = 100217}
          },
          ["1753080382762970978"] = {
            key = "1753080382762970978",
            type = "WaitOfTimeNode",
            name = "0.2",
            pos = {x = 1198.1056261343012, y = -98.73857322350966},
            propsData = {WaitTime = 0.2}
          }
        },
        commentData = {}
      }
    },
    ["1721273382491416456"] = {
      isStoryNode = true,
      key = "1721273382491416456",
      type = "StoryNode",
      name = "\228\188\160\229\136\176\229\159\142\233\151\168\229\143\163\228\184\138\229\133\172\232\183\175",
      pos = {x = 1119.2925070352985, y = 159.7325518588961},
      propsData = {
        QuestId = 10020706,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020706",
        QuestDeatil = "QuestDesc_10020706",
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
        StoryGuideType = "Point",
        StoryGuidePointName = "Mechanism_SaiqiBegin_1180476"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1721292507042148582",
            startPort = "Out",
            endQuest = "1721292747643148895",
            endPort = "In"
          },
          {
            startQuest = "1721292747643148895",
            startPort = "Out",
            endQuest = "172130030248715524",
            endPort = "In"
          },
          {
            startQuest = "1721292747643148895",
            startPort = "Out",
            endQuest = "172130031361615930",
            endPort = "In"
          },
          {
            startQuest = "172130031361615930",
            startPort = "Out",
            endQuest = "1721294322252426905",
            endPort = "In"
          },
          {
            startQuest = "1721294081756287577",
            startPort = "Out",
            endQuest = "17212911512795369",
            endPort = "In"
          },
          {
            startQuest = "1721294145026288275",
            startPort = "Out",
            endQuest = "17214602335911973352",
            endPort = "In"
          },
          {
            startQuest = "1721292507042148582",
            startPort = "Out",
            endQuest = "1721294145026288275",
            endPort = "In"
          },
          {
            startQuest = "1721273382491416460",
            startPort = "QuestStart",
            endQuest = "1724654553467600054",
            endPort = "In"
          },
          {
            startQuest = "17226679040986184",
            startPort = "Success",
            endQuest = "1725173036468735217",
            endPort = "In"
          },
          {
            startQuest = "1725173036468735217",
            startPort = "Out",
            endQuest = "1721273382491416461",
            endPort = "Success"
          },
          {
            startQuest = "17226679040986184",
            startPort = "Fail",
            endQuest = "17253475976331675746",
            endPort = "In"
          },
          {
            startQuest = "17226679040986184",
            startPort = "Fail",
            endQuest = "1725173099074914792",
            endPort = "In"
          },
          {
            startQuest = "17226679040986184",
            startPort = "Fail",
            endQuest = "1723626847206683228",
            endPort = "In"
          },
          {
            startQuest = "1724654553467600055",
            startPort = "Out",
            endQuest = "17226679040986184",
            endPort = "In"
          },
          {
            startQuest = "1725173099074914792",
            startPort = "Out",
            endQuest = "173131587187737753",
            endPort = "Input_1"
          },
          {
            startQuest = "17253475976331675746",
            startPort = "Out",
            endQuest = "173131587187737753",
            endPort = "Input_2"
          },
          {
            startQuest = "1723626847206683228",
            startPort = "Out",
            endQuest = "173131587187737753",
            endPort = "Input_3"
          },
          {
            startQuest = "173131587187737753",
            startPort = "Out",
            endQuest = "1721273382491416462",
            endPort = "Fail"
          },
          {
            startQuest = "17226679040986184",
            startPort = "PassiveFail",
            endQuest = "1725173099074914792",
            endPort = "In"
          },
          {
            startQuest = "17226679040986184",
            startPort = "PassiveFail",
            endQuest = "17253475976331675746",
            endPort = "In"
          },
          {
            startQuest = "17226679040986184",
            startPort = "PassiveFail",
            endQuest = "1723626847206683228",
            endPort = "In"
          },
          {
            startQuest = "1721273382491416460",
            startPort = "QuestStart",
            endQuest = "17241539902404664562",
            endPort = "In"
          },
          {
            startQuest = "17241539902404664562",
            startPort = "Out",
            endQuest = "1724654553468600057",
            endPort = "In"
          },
          {
            startQuest = "17241539902404664562",
            startPort = "Out",
            endQuest = "1724654553467600055",
            endPort = "In"
          },
          {
            startQuest = "17241539902404664562",
            startPort = "Out",
            endQuest = "17452920165891646737",
            endPort = "In"
          },
          {
            startQuest = "17452920165891646737",
            startPort = "Out",
            endQuest = "17442754584109620079",
            endPort = "In"
          }
        },
        nodeData = {
          ["1721273382491416460"] = {
            key = "1721273382491416460",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -315.19466073414907, y = 180.84061655808043},
            propsData = {ModeType = 0}
          },
          ["1721273382491416461"] = {
            key = "1721273382491416461",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1144.9205426122317, y = 84.10046074840386},
            propsData = {ModeType = 0}
          },
          ["1721273382491416462"] = {
            key = "1721273382491416462",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1418.329360182787, y = 310.478353535987},
            propsData = {}
          },
          ["17212911512795369"] = {
            key = "17212911512795369",
            type = "TalkNode",
            name = "\232\157\180\232\157\182",
            pos = {x = 848.9624505928848, y = -126.07509881422925},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20002001,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1721292507042148582"] = {
            key = "1721292507042148582",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\232\183\175\229\190\132\231\130\1851-\229\133\172\232\183\175\232\181\183\231\130\185",
            pos = {x = 865.9333492594358, y = -405.5973693825355},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1180400,
              GuideType = "M",
              GuidePointName = "Mechanism_Saiqi1_1180400"
            }
          },
          ["1721292747643148895"] = {
            key = "1721292747643148895",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\232\183\175\229\190\132\231\130\1852-\229\133\172\232\183\175\231\187\136\231\130\185",
            pos = {x = 1128.7795031055896, y = -403.85927414444023},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1180401,
              GuideType = "M",
              GuidePointName = "Mechanism_Saiqi2_1180401"
            }
          },
          ["1721294081756287577"] = {
            key = "1721294081756287577",
            type = "GoToNode",
            name = "\229\188\128\232\189\166\232\167\166\229\143\145-\232\157\180\232\157\182",
            pos = {x = 844.7867494824009, y = -253.08391182559967},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1180403,
              GuideType = "M",
              GuidePointName = "Mechanism_SaiqiGuide1_1180403"
            }
          },
          ["1721294145026288275"] = {
            key = "1721294145026288275",
            type = "GoToNode",
            name = "\229\188\128\232\189\166\232\167\166\229\143\145-\231\167\189\229\133\189\229\176\184\228\189\147",
            pos = {x = 1134.2277432712206, y = -245.04043356473},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1180404,
              GuideType = "M",
              GuidePointName = "Mechanism_SaiqiGuide2_1180404"
            }
          },
          ["1721294322252426905"] = {
            key = "1721294322252426905",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\232\183\175\229\190\132\231\130\1853-\231\148\181\230\162\175",
            pos = {x = 1744.3519668737054, y = -422.369626111314},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1180402,
              GuideType = "M",
              GuidePointName = "Mechanism_Saiqi3_1180402"
            }
          },
          ["172130030248715524"] = {
            key = "172130030248715524",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\163\142\230\154\180\232\167\130\229\175\159\231\130\185\231\169\186npc",
            pos = {x = 1463.8464622782424, y = -547.5712836631652},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180405}
            }
          },
          ["172130031361615930"] = {
            key = "172130031361615930",
            type = "TalkNode",
            name = "\230\181\139\232\175\149\231\148\168",
            pos = {x = 1466.6321765639566, y = -423.428426520308},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 790012,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_StormObserveNpc_1180405",
              DelayShowGuideTime = 0,
              FirstDialogueId = 20001901,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_WatchStorm",
              BlendInTime = 3,
              BlendOutTime = 2,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = false,
              ShowAutoPlayButton = false,
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
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790012}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1721376760062149943"] = {
            key = "1721376760062149943",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\133\172\232\183\175\232\157\180\232\157\182",
            pos = {x = 863.6890772965976, y = -525.2560769367032},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180335,
                1180336,
                1180337,
                1180338,
                1180339,
                1180340
              }
            }
          },
          ["17214602335911973352"] = {
            key = "17214602335911973352",
            type = "TalkNode",
            name = "\231\167\189\229\133\189",
            pos = {x = 1135.5533416845503, y = -120.43012452829186},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20002101,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1721628858102431514"] = {
            key = "1721628858102431514",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 882.584006211181, y = -638.5360248447207},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["1721644427002424444"] = {
            key = "1721644427002424444",
            type = "TalkNode",
            name = "\229\165\189\229\164\167\231\154\132\233\163\142",
            pos = {x = 531.1930069930073, y = -163.11648351648347},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20001801,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101006",
              BlendInTime = 0,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = false,
              ShowAutoPlayButton = false,
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
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1721646379812708023"] = {
            key = "1721646379812708023",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\159\142\233\151\168\229\143\163npc",
            pos = {x = 314.9468531468535, y = -314.6549450549451},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1190686,
                1190687,
                1190688,
                1190689,
                1190690,
                1190691,
                1190692,
                1190693
              }
            }
          },
          ["17216490739911967642"] = {
            key = "17216490739911967642",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\188\128\229\144\175\229\134\176\230\185\150\233\163\142\230\154\180",
            pos = {x = 882.0759237330177, y = -748.716228279729},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeStorm_On",
              UnitId = -1
            }
          },
          ["17226679040986184"] = {
            key = "17226679040986184",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 534.3163056524688, y = 162.9360902255637},
            propsData = {SpecialConfigId = 115, BlackScreenImmediately = false}
          },
          ["1723626847206683228"] = {
            key = "1723626847206683228",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\155\158\228\189\141\231\189\174",
            pos = {x = 885.8354978354976, y = 583.11056998557},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "P_FindSaiqi1Fail",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17241539902404664562"] = {
            key = "17241539902404664562",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = -6.567297062525524, y = 185.88289625150654},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1180476,
              GuideType = "M",
              GuidePointName = "Mechanism_SaiqiBegin_1180476"
            }
          },
          ["1724654553467600054"] = {
            key = "1724654553467600054",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 8.784726171999466, y = 60.643472275851536},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["1724654553467600055"] = {
            key = "1724654553467600055",
            type = "TalkNode",
            name = "\231\156\139\233\163\142\230\153\175",
            pos = {x = 269.0593113694099, y = 187.6831434742186},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20003101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_200031",
              BlendInTime = 0.5,
              BlendOutTime = 3,
              InType = "FadeIn",
              OutType = "BlendOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = true,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = false,
              HideAllBattleEntity = false,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              SkipToOption = false,
              DisableNpcOptimization = true,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "P200031Nvzhu",
              CameraLookAtTartgetPoint = "QuestPoint_10020108",
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
                  TalkActorId = 200021,
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
                {TalkActorType = "Npc", TalkActorId = 200021},
                {TalkActorType = "Npc", TalkActorId = 200002}
              },
              OptionType = "normal",
              FreezeWorldComposition = true,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1724654553468600056"] = {
            key = "1724654553468600056",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\232\191\189\232\181\155\231\144\1701\233\152\182\230\174\181\229\188\128\229\167\139",
            pos = {x = 7.870799537991615, y = -61.09517271759843},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Icelake_SearchSaiqi0",
              UnitId = -1
            }
          },
          ["1724654553468600057"] = {
            key = "1724654553468600057",
            type = "ChangeStaticCreatorNode",
            name = "\233\152\178\229\141\161\239\188\140\229\136\134\230\137\185\231\148\159\230\136\144\231\167\189\229\133\189\229\176\184\228\189\147",
            pos = {x = 259.92779572639535, y = 70.43928380610373},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180443, 1180449}
            }
          },
          ["1725173036468735217"] = {
            key = "1725173036468735217",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\232\191\189\232\181\155\231\144\1701\233\152\182\230\174\181\231\187\147\230\157\159",
            pos = {x = 834.6778645858603, y = 78.78456741375288},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Icelake_SearchSaiqi0_End",
              UnitId = -1
            }
          },
          ["1725173099074914792"] = {
            key = "1725173099074914792",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\232\191\189\232\181\155\231\144\1701\233\152\182\230\174\181\231\187\147\230\157\159",
            pos = {x = 870.0945312525272, y = 311.00678963597517},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Icelake_SearchSaiqi0_End",
              UnitId = -1
            }
          },
          ["17253475976331675746"] = {
            key = "17253475976331675746",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\230\146\173\230\148\190\231\171\153\230\161\169bgm",
            pos = {x = 870.471135843188, y = 434.6064995846797},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["1730102124866396055"] = {
            key = "1730102124866396055",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186\229\133\172\232\183\175\228\184\138\231\154\132\230\140\135\229\188\149\231\130\185",
            pos = {x = 529.4790137398829, y = 354.4901656314697},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "TargetPoint_Saiqi1_1180400"
            }
          },
          ["173131587187737753"] = {
            key = "173131587187737753",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 1169.4027597748118, y = 407.8604678386479},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          },
          ["17442132675094944131"] = {
            key = "17442132675094944131",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 877.2348901098901, y = 763.1208791208791},
            propsData = {}
          },
          ["17442751800029619316"] = {
            key = "17442751800029619316",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = -1.949758075507802, y = 334.6093771296171},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "M",
              GuideName = "Mechanism_SaiqiBegin_1180476"
            }
          },
          ["17442754584109620079"] = {
            key = "17442754584109620079",
            type = "SendMessageNode",
            name = "peoplerun",
            pos = {x = 246.3403139214608, y = 471.77212817167856},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_IcelakeCity_PeopleRun",
              UnitId = -1
            }
          },
          ["17452920165891646737"] = {
            key = "17452920165891646737",
            type = "WaitOfTimeNode",
            name = "1",
            pos = {x = 247.0981921304502, y = 356.07763204537383},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    },
    ["17213705168042310"] = {
      isStoryNode = true,
      key = "17213705168042310",
      type = "StoryNode",
      name = "\229\133\172\232\183\175\229\136\176\232\181\155\231\144\170boss\230\136\152\230\150\151",
      pos = {x = 1350.5854667072058, y = 160.1032783073704},
      propsData = {
        QuestId = 10020707,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020707",
        QuestDeatil = "QuestDesc_10020707",
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
        StoryGuideType = "Point",
        StoryGuidePointName = "Mechanism_SaiqiBegin2_1240302"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17213705168042311",
            startPort = "QuestStart",
            endQuest = "17241542218914839969",
            endPort = "In"
          },
          {
            startQuest = "172267502181419850",
            startPort = "Fail",
            endQuest = "17247416039781092914",
            endPort = "In"
          },
          {
            startQuest = "17251733575141633305",
            startPort = "Out",
            endQuest = "17251733575141633306",
            endPort = "In"
          },
          {
            startQuest = "17213705168042311",
            startPort = "QuestStart",
            endQuest = "17251733575141633305",
            endPort = "In"
          },
          {
            startQuest = "172267502181419850",
            startPort = "Success",
            endQuest = "17213705168042314",
            endPort = "Success"
          },
          {
            startQuest = "172267502181419850",
            startPort = "Fail",
            endQuest = "1723626884094850093",
            endPort = "In"
          },
          {
            startQuest = "172267502181419850",
            startPort = "Fail",
            endQuest = "17253479640031855911",
            endPort = "In"
          },
          {
            startQuest = "17241542218914839969",
            startPort = "Out",
            endQuest = "17253480838422394874",
            endPort = "In"
          },
          {
            startQuest = "17253480838422394874",
            startPort = "Out",
            endQuest = "172267502181419850",
            endPort = "In"
          },
          {
            startQuest = "17213705168042311",
            startPort = "QuestStart",
            endQuest = "1728991864523569110",
            endPort = "In"
          },
          {
            startQuest = "1728991864523569110",
            startPort = "Out",
            endQuest = "17289895830894995",
            endPort = "In"
          },
          {
            startQuest = "17247416039781092914",
            startPort = "Out",
            endQuest = "173131589202237959",
            endPort = "Input_1"
          },
          {
            startQuest = "17253479640031855911",
            startPort = "Out",
            endQuest = "173131589202237959",
            endPort = "Input_2"
          },
          {
            startQuest = "1723626884094850093",
            startPort = "Out",
            endQuest = "173131589202237959",
            endPort = "Input_3"
          },
          {
            startQuest = "173131589202237959",
            startPort = "Out",
            endQuest = "17213705168042317",
            endPort = "Fail"
          },
          {
            startQuest = "172267502181419850",
            startPort = "PassiveFail",
            endQuest = "17247416039781092914",
            endPort = "In"
          },
          {
            startQuest = "172267502181419850",
            startPort = "PassiveFail",
            endQuest = "17253479640031855911",
            endPort = "In"
          },
          {
            startQuest = "172267502181419850",
            startPort = "PassiveFail",
            endQuest = "1723626884094850093",
            endPort = "In"
          }
        },
        nodeData = {
          ["17213705168042311"] = {
            key = "17213705168042311",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1041.25, y = 367.5},
            propsData = {ModeType = 0}
          },
          ["17213705168042314"] = {
            key = "17213705168042314",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2396.7845849802375, y = 284.2545246515498},
            propsData = {ModeType = 0}
          },
          ["17213705168042317"] = {
            key = "17213705168042317",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2591.5631578947373, y = 569.2973684210526},
            propsData = {}
          },
          ["172267502181419850"] = {
            key = "172267502181419850",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1812.8670168067222, y = 403.18027421494935},
            propsData = {SpecialConfigId = 116, BlackScreenImmediately = false}
          },
          ["1723626884094850093"] = {
            key = "1723626884094850093",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\155\158\228\189\141\231\189\174",
            pos = {x = 2116.75, y = 758.2386363636363},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "P_FindSaiqi2",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17241542218914839969"] = {
            key = "17241542218914839969",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1284.0721038591337, y = 369.0722971731654},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240302,
              GuideType = "M",
              GuidePointName = "Mechanism_SaiqiBegin2_1240302"
            }
          },
          ["17247416039781092914"] = {
            key = "17247416039781092914",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\232\181\155\231\144\1702",
            pos = {x = 2122.733883028735, y = 469.06144149967696},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Icelake_SearchSaiqi_End",
              UnitId = -1
            }
          },
          ["17251733575141633305"] = {
            key = "17251733575141633305",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\229\134\176\230\185\150",
            pos = {x = 1341.4884304366458, y = 210.24170340935976},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17251733575141633306"] = {
            key = "17251733575141633306",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 1645.0499402718401, y = 204.21882329240043},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeNight",
              UnitId = -1
            }
          },
          ["17253479640031855911"] = {
            key = "17253479640031855911",
            type = "PlayOrStopBGMNode",
            name = "\229\129\156\230\173\162\230\146\173\230\148\190\231\171\153\230\161\169bgm",
            pos = {x = 2103.236760431581, y = 629.0778744460138},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17253480838422394874"] = {
            key = "17253480838422394874",
            type = "PlayOrStopBGMNode",
            name = "\230\146\173\230\148\190\231\171\153\230\161\169Bgm",
            pos = {x = 1550.026442114624, y = 399.3290013144185},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt02/0042_story_find_saiqi",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101103},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17289895830894995"] = {
            key = "17289895830894995",
            type = "TalkNode",
            name = "\229\136\171\230\139\133\229\191\131",
            pos = {x = 1521.5479797979795, y = 558.5358526352932},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 20002801,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1728991864523569110"] = {
            key = "1728991864523569110",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\229\133\172\232\183\175",
            pos = {x = 1285.8813131313123, y = 569.4567099567096},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["173131589202237959"] = {
            key = "173131589202237959",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2355.246699022402, y = 600.2884836897113},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          }
        },
        commentData = {}
      }
    },
    ["17442870280643025502"] = {
      isStoryNode = true,
      key = "17442870280643025502",
      type = "StoryNode",
      name = "\231\136\172\229\177\177",
      pos = {x = -398.819153055969, y = 372.01333033998566},
      propsData = {
        QuestId = 10020710,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020706",
        QuestDeatil = "QuestDesc_10020706",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101103,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_Saiqi8"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17442870280653025512",
            startPort = "Out",
            endQuest = "17442870280653025511",
            endPort = "In"
          },
          {
            startQuest = "17442870280653025512",
            startPort = "Out",
            endQuest = "17442870280653025510",
            endPort = "In"
          },
          {
            startQuest = "17442870280653025514",
            startPort = "Out",
            endQuest = "17442870280653025512",
            endPort = "In"
          },
          {
            startQuest = "17442870280653025515",
            startPort = "Out",
            endQuest = "17442870280653025513",
            endPort = "In"
          },
          {
            startQuest = "17442870280653025513",
            startPort = "Out",
            endQuest = "17442870280653025514",
            endPort = "In"
          },
          {
            startQuest = "17442870280653025517",
            startPort = "Out",
            endQuest = "17442870280653025516",
            endPort = "In"
          },
          {
            startQuest = "17442870280663025520",
            startPort = "Out",
            endQuest = "17442870280663025519",
            endPort = "In"
          },
          {
            startQuest = "17442870280653025507",
            startPort = "QuestStart",
            endQuest = "17442870280663025520",
            endPort = "In"
          },
          {
            startQuest = "17442870280663025521",
            startPort = "Fail",
            endQuest = "17442870280663025523",
            endPort = "In"
          },
          {
            startQuest = "17442870280653025512",
            startPort = "Out",
            endQuest = "17442870280653025517",
            endPort = "In"
          },
          {
            startQuest = "17442870280663025525",
            startPort = "Out",
            endQuest = "17442870280653025518",
            endPort = "In"
          },
          {
            startQuest = "17442870280653025507",
            startPort = "QuestStart",
            endQuest = "17442870280663025526",
            endPort = "In"
          },
          {
            startQuest = "17442870280663025528",
            startPort = "Out",
            endQuest = "17442870280663025529",
            endPort = "In"
          },
          {
            startQuest = "17442870280663025521",
            startPort = "Fail",
            endQuest = "17442870280663025530",
            endPort = "In"
          },
          {
            startQuest = "17442870280663025521",
            startPort = "Fail",
            endQuest = "17442870280663025524",
            endPort = "In"
          },
          {
            startQuest = "17442870280663025526",
            startPort = "Out",
            endQuest = "17442870280663025531",
            endPort = "In"
          },
          {
            startQuest = "17442870280653025507",
            startPort = "QuestStart",
            endQuest = "17442870280663025532",
            endPort = "In"
          },
          {
            startQuest = "17442870280673025533",
            startPort = "BeginOverlap",
            endQuest = "17442870280673025536",
            endPort = "In"
          },
          {
            startQuest = "17442870280663025523",
            startPort = "Out",
            endQuest = "17442870280673025537",
            endPort = "Input_1"
          },
          {
            startQuest = "17442870280673025537",
            startPort = "Out",
            endQuest = "17442870280653025509",
            endPort = "Fail"
          },
          {
            startQuest = "17442870280663025519",
            startPort = "Out",
            endQuest = "17442870280673025538",
            endPort = "In"
          },
          {
            startQuest = "17442870280673025539",
            startPort = "Out",
            endQuest = "17442870280673025540",
            endPort = "In"
          },
          {
            startQuest = "17442870280673025539",
            startPort = "Out",
            endQuest = "17442870280663025520",
            endPort = "In"
          },
          {
            startQuest = "17442870280663025520",
            startPort = "Out",
            endQuest = "17442870280673025539",
            endPort = "In"
          },
          {
            startQuest = "17442870280663025529",
            startPort = "Out",
            endQuest = "17442870280673025537",
            endPort = "Input_2"
          },
          {
            startQuest = "17442870280663025524",
            startPort = "Out",
            endQuest = "17442870280673025537",
            endPort = "Input_3"
          },
          {
            startQuest = "17442870280663025521",
            startPort = "PassiveFail",
            endQuest = "17442870280663025523",
            endPort = "In"
          },
          {
            startQuest = "17442870280663025521",
            startPort = "PassiveFail",
            endQuest = "17442870280663025524",
            endPort = "In"
          },
          {
            startQuest = "17442870280663025521",
            startPort = "PassiveFail",
            endQuest = "17442870280663025530",
            endPort = "In"
          },
          {
            startQuest = "17442870280663025521",
            startPort = "Fail",
            endQuest = "17442870280663025528",
            endPort = "In"
          },
          {
            startQuest = "17442870280663025521",
            startPort = "PassiveFail",
            endQuest = "17442870280663025528",
            endPort = "In"
          },
          {
            startQuest = "17442870280663025530",
            startPort = "Out",
            endQuest = "17442870280673025541",
            endPort = "In"
          },
          {
            startQuest = "17442870280673025541",
            startPort = "Out",
            endQuest = "17442870280673025537",
            endPort = "Input_4"
          },
          {
            startQuest = "17476428264911746832",
            startPort = "Out",
            endQuest = "17442870280653025508",
            endPort = "Success"
          },
          {
            startQuest = "17442870280663025526",
            startPort = "Out",
            endQuest = "17442870280663025521",
            endPort = "In"
          },
          {
            startQuest = "17442870280663025526",
            startPort = "Out",
            endQuest = "17442870280673025535",
            endPort = "In"
          },
          {
            startQuest = "17442870280663025521",
            startPort = "Success",
            endQuest = "17476428264911746832",
            endPort = "In"
          }
        },
        nodeData = {
          ["17442870280653025507"] = {
            key = "17442870280653025507",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -1894.8284240707496, y = 35.48765615503219},
            propsData = {ModeType = 0}
          },
          ["17442870280653025508"] = {
            key = "17442870280653025508",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = -260.94115052339964, y = 59.13697793063554},
            propsData = {ModeType = 0}
          },
          ["17442870280653025509"] = {
            key = "17442870280653025509",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -88.31995989694738, y = 714.7456785433153},
            propsData = {}
          },
          ["17442870280653025510"] = {
            key = "17442870280653025510",
            type = "KillMonsterNode",
            name = "\229\135\187\232\180\165\232\181\155\231\144\170",
            pos = {x = 802.8521063471424, y = -492.0851741271574},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 1,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = false,
              StaticCreatorIdList = {1240026}
            }
          },
          ["17442870280653025511"] = {
            key = "17442870280653025511",
            type = "PlayOrStopBGMNode",
            name = "\230\146\173\230\148\190\229\163\176\233\159\179",
            pos = {x = 801.9816662337605, y = -760.7036085150208},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt01/0032_combat_shijingzhe.0032_combat_shijingzhe'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17442870280653025512"] = {
            key = "17442870280653025512",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 504.23809740983614, y = -494.4365244006581},
            propsData = {GuideId = 6}
          },
          ["17442870280653025513"] = {
            key = "17442870280653025513",
            type = "BossBattleFinishNode",
            name = "\231\187\153GameMode\229\143\145\230\182\136\230\129\175\239\188\140\232\181\155\231\144\170boss\229\136\155\229\187\186",
            pos = {x = -14.12779125603922, y = -493.24639074509787},
            propsData = {
              SendMessage = "Chapter01_Icelake_SaiqiBoss_Temporary_Start",
              FinishCondition = "BossSaiqi_Create"
            }
          },
          ["17442870280653025514"] = {
            key = "17442870280653025514",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 236.43069485802437, y = -494.55023421121575},
            propsData = {WaitTime = 0.5}
          },
          ["17442870280653025515"] = {
            key = "17442870280653025515",
            type = "TalkNode",
            name = "\232\191\135\229\156\186\229\138\168\231\148\187 \232\181\155\231\144\170\229\143\152\232\186\171",
            pos = {x = -256.1981361875849, y = -484.96032709935093},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0101/OBT0101_SC003/SQ_OBT0101_SC003",
              InType = "BlendIn",
              OutType = "BlendOut",
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = false,
              HideNpcs = false,
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
          ["17442870280653025516"] = {
            key = "17442870280653025516",
            type = "TalkNode",
            name = "\232\181\155\231\144\170\239\188\140\229\144\172\229\190\151\232\167\129\230\136\145\231\154\132\229\163\176\233\159\179\229\144\151\239\188\159",
            pos = {x = 1139.7469425569257, y = -628.428908468698},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10111101,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17442870280653025517"] = {
            key = "17442870280653025517",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 803.1313299087046, y = -621.2698175596071},
            propsData = {WaitTime = 4}
          },
          ["17442870280653025518"] = {
            key = "17442870280653025518",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\134\176\230\185\150boss\232\181\155\231\144\170",
            pos = {x = -1294.4491971041555, y = -185.94128623908082},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240026}
            }
          },
          ["17442870280663025519"] = {
            key = "17442870280663025519",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = -1298.8543024046062, y = -316.24021533018407},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeNight",
              UnitId = -1
            }
          },
          ["17442870280663025520"] = {
            key = "17442870280663025520",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\232\191\155\229\133\165\229\134\176\230\185\150",
            pos = {x = -1571.884343708332, y = -315.56348905937864},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17442870280663025521"] = {
            key = "17442870280663025521",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = -1041.8785482592662, y = 49.29579626941788},
            propsData = {SpecialConfigId = 111, BlackScreenImmediately = false}
          },
          ["17442870280663025523"] = {
            key = "17442870280663025523",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\232\174\190\231\189\174\231\142\169\229\174\182\229\156\168\233\163\142\230\154\180\229\133\165\229\143\163",
            pos = {x = -723.067799797203, y = 186.8414474964155},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_SaiqiBossBattleFail",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17442870280663025524"] = {
            key = "17442870280663025524",
            type = "PlayOrStopBGMNode",
            name = "\229\133\179\233\151\173\229\163\176\233\159\179",
            pos = {x = -715.6859816153864, y = 617.103785158753},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["17442870280663025525"] = {
            key = "17442870280663025525",
            type = "GoToNode",
            name = "\231\161\174\232\174\164\231\142\169\229\174\182\230\152\175\228\184\141\230\152\175\229\156\168\229\134\176\230\185\150",
            pos = {x = -1524.3816933066923, y = -155.17425206372607},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1240291,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1240291"
            }
          },
          ["17442870280663025526"] = {
            key = "17442870280663025526",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\177\177\233\161\182",
            pos = {x = -1632.6252906613247, y = 59.052181064566184},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240306,
              GuideType = "P",
              GuidePointName = "TargetPoint_Saiqi8"
            }
          },
          ["17442870280663025527"] = {
            key = "17442870280663025527",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = -1475.277558065156, y = 850.4772572685897},
            propsData = {}
          },
          ["17442870280663025528"] = {
            key = "17442870280663025528",
            type = "ActivePlayerSkillsNode",
            name = "\229\133\129\232\174\184\230\148\187\229\135\187\230\148\190\230\138\128\232\131\189",
            pos = {x = -716.6103761434307, y = 329.57098962319145},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Lock",
              SkillNameList = {
                "Attack",
                "Skill1",
                "Skill2",
                "Skill3",
                "FallAttack",
                "SlideAttack",
                "Fire",
                "Avoid",
                "HeavyAttack",
                "FireInAir",
                "Jump",
                "Slide",
                "BulletJump"
              }
            }
          },
          ["17442870280663025529"] = {
            key = "17442870280663025529",
            type = "ForbidWeaponByWeaponTagNode",
            name = "\229\144\175\231\148\168\230\173\166\229\153\168\232\138\130\231\130\185",
            pos = {x = -707.8989972834678, y = 470.60302623646396},
            propsData = {
              WeaponTags = {"Melee", "Ranged"},
              bForbid = false,
              ForbidTag = "ForbidDefault",
              bHidewhenForbid = true
            }
          },
          ["17442870280663025530"] = {
            key = "17442870280663025530",
            type = "SendMessageNode",
            name = "\232\181\155\231\144\1703\233\152\182\230\174\181",
            pos = {x = -700.7895575113081, y = 765.7895478523185},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Icelake_NvzhuWind_End",
              UnitId = -1
            }
          },
          ["17442870280663025531"] = {
            key = "17442870280663025531",
            type = "PlayOrStopBGMNode",
            name = "\229\188\128\229\167\139\230\146\173\230\148\190\231\171\153\230\161\169bgm",
            pos = {x = -1283.1369865958495, y = -55.11363636363641},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt02/0042_story_find_saiqi",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101103},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17442870280663025532"] = {
            key = "17442870280663025532",
            type = "SendMessageNode",
            name = "\229\136\135\229\155\158\230\157\165",
            pos = {x = -1581.4210806505146, y = -630.9378931707106},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "LeaveStormCam",
              UnitId = -1
            }
          },
          ["17442870280673025533"] = {
            key = "17442870280673025533",
            type = "CollisionBoxNode",
            name = "\229\136\164\229\174\154\231\142\169\229\174\182\230\152\175\229\144\166\233\156\128\232\166\129\229\155\158\228\189\141",
            pos = {x = -1534.1983034277364, y = 330.780388547571},
            propsData = {StaticCreatorId = 1240401}
          },
          ["17442870280673025535"] = {
            key = "17442870280673025535",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\155\158\228\189\141\232\167\166\229\143\145\231\155\146",
            pos = {x = -1311.3236105530436, y = 168.19527096245366},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240401}
            }
          },
          ["17442870280673025536"] = {
            key = "17442870280673025536",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\232\174\190\231\189\174\231\142\169\229\174\182\229\156\168\233\163\142\230\154\180\229\133\165\229\143\163",
            pos = {x = -1266.3166189107537, y = 332.2738950410776},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_SaiqiBossBattleFail",
              FadeIn = false,
              FadeOut = true,
              bResetCamera = true,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          },
          ["17442870280673025537"] = {
            key = "17442870280673025537",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = -349.54204670869444, y = 662.4821142752494},
            propsData = {ListenCount = 4, NeedFinishCount = 4}
          },
          ["17442870280673025538"] = {
            key = "17442870280673025538",
            type = "SendMessageNode",
            name = "\232\181\155\231\144\1703\233\152\182\230\174\181",
            pos = {x = -1029.2920502864285, y = -318.6431968881392},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Icelake_NvzhuWind_Start",
              UnitId = -1
            }
          },
          ["17442870280673025539"] = {
            key = "17442870280673025539",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\231\142\169\229\174\182\231\166\187\229\188\128\229\134\176\230\185\150",
            pos = {x = -1572.6434352880156, y = -494.6729691876751},
            propsData = {
              RegionType = 1,
              IsEnter = "Leave",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17442870280673025540"] = {
            key = "17442870280673025540",
            type = "SendMessageNode",
            name = "\232\181\155\231\144\1703\233\152\182\230\174\181",
            pos = {x = -1277.1165193462946, y = -473.30225993943685},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Icelake_NvzhuWind_End",
              UnitId = -1
            }
          },
          ["17442870280673025541"] = {
            key = "17442870280673025541",
            type = "SendMessageNode",
            name = "boss\230\136\152\229\164\177\232\180\165\233\135\141\231\189\174",
            pos = {x = -684.6239357355855, y = 896.2954702590147},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "BossBattleFail",
              UnitId = -1
            }
          },
          ["17476428264911746832"] = {
            key = "17476428264911746832",
            type = "ActivePlayerSkillsNode",
            name = "\229\133\129\232\174\184\230\148\187\229\135\187\230\148\190\230\138\128\232\131\189",
            pos = {x = -662.7087595002865, y = 39.34285714285714},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Lock",
              SkillNameList = {
                "Attack",
                "Skill1",
                "Skill2",
                "Skill3",
                "FallAttack",
                "SlideAttack",
                "Fire",
                "Avoid",
                "HeavyAttack",
                "FireInAir",
                "Jump",
                "Slide",
                "BulletJump"
              }
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
