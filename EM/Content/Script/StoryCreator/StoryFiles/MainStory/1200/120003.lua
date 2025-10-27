return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17292500774591",
      startPort = "StoryStart",
      endStory = "1729250106331137",
      endPort = "In"
    },
    {
      startStory = "1729250106331137",
      startPort = "Success",
      endStory = "1729684563989741",
      endPort = "In"
    },
    {
      startStory = "1729684563989741",
      startPort = "Success",
      endStory = "17297503632772664460",
      endPort = "In"
    },
    {
      startStory = "17297503632772664460",
      startPort = "Success",
      endStory = "17297523075049139191",
      endPort = "In"
    },
    {
      startStory = "17297523075049139191",
      startPort = "Success",
      endStory = "172975495373411429037",
      endPort = "In"
    },
    {
      startStory = "172975495373411429037",
      startPort = "Success",
      endStory = "172975541764912953502",
      endPort = "In"
    },
    {
      startStory = "172975541764912953502",
      startPort = "Success",
      endStory = "172975632306116386188",
      endPort = "In"
    },
    {
      startStory = "172975632306116386188",
      startPort = "Success",
      endStory = "172976220001520784705",
      endPort = "In"
    },
    {
      startStory = "172976220001520784705",
      startPort = "Success",
      endStory = "17292500774605",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17292500774591"] = {
      isStoryNode = true,
      key = "17292500774591",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 300},
      propsData = {QuestChainId = 120003},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17292500774605"] = {
      isStoryNode = true,
      key = "17292500774605",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1929.648882830707, y = 453.4633308023237},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1729250106331137"] = {
      isStoryNode = true,
      key = "1729250106331137",
      type = "StoryNode",
      name = "\233\133\146\233\166\134\233\151\178\232\129\138",
      pos = {x = 1088.3174603174605, y = 287.7142857142857},
      propsData = {
        QuestId = 12000301,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120003_1",
        QuestDeatil = "Content_120003_1",
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
        SubRegionId = 101107,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_12000101_1220106",
        QuestUIId = 0
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1736064837968240056",
            startPort = "Out",
            endQuest = "1737688921940258458",
            endPort = "In"
          },
          {
            startQuest = "1737688921940258458",
            startPort = "Out",
            endQuest = "1737688923309258484",
            endPort = "In"
          },
          {
            startQuest = "17377021690622269908",
            startPort = "Out",
            endQuest = "1736064837968240056",
            endPort = "In"
          },
          {
            startQuest = "1737688923309258484",
            startPort = "Out",
            endQuest = "173779373643826582825",
            endPort = "In"
          },
          {
            startQuest = "173779373643826582825",
            startPort = "Out",
            endQuest = "1729250106331142",
            endPort = "Success"
          },
          {
            startQuest = "1729250106331141",
            startPort = "QuestStart",
            endQuest = "17377021690622269908",
            endPort = "In"
          }
        },
        nodeData = {
          ["1729250106331141"] = {
            key = "1729250106331141",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1842.0388232457199, y = 445.9705811429949},
            propsData = {ModeType = 0}
          },
          ["1729250106331142"] = {
            key = "1729250106331142",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3041.799485235032, y = 789.4154081190102},
            propsData = {
              ModeType = 1,
              Id = 210101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1729250106331143"] = {
            key = "1729250106331143",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1736064837968240055"] = {
            key = "1736064837968240055",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\233\133\146\233\166\134\229\134\133\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2173.9002079002075, y = 618.8210573210574},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010101"
            }
          },
          ["1736064837968240056"] = {
            key = "1736064837968240056",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\176\143\231\153\189 Fixsimple01",
            pos = {x = 2441.992145992147, y = 609.7344982344982},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200002,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Xiaobai12000301_1220112",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12001541,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "TalkStageNew12000301",
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
              RestoreStand = true,
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
                  TalkActorId = 220019,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 220019}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17364961986054083100"] = {
            key = "17364961986054083100",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2568.079768189533, y = 229.278479566064},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1220106,
              GuideType = "N",
              GuidePointName = "Xiaobai12000301"
            }
          },
          ["1737688921940258458"] = {
            key = "1737688921940258458",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\176\143\231\153\189 Fixsimple01",
            pos = {x = 2702.3676252759697, y = 604.2230887593404},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12001549,
              FlowAssetPath = "",
              TalkType = "BlackISS",
              BlendInTime = 0,
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
          ["1737688923309258484"] = {
            key = "1737688923309258484",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\176\143\231\153\189 Fixsimple01",
            pos = {x = 2967.046215070839, y = 591.5518128322504},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12001550,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "TalkStageNew12000301",
              BlendInTime = 0,
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
                  TalkActorId = 220019,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 220019}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17377021690622269908"] = {
            key = "17377021690622269908",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2278.749703442931, y = 250.71770430511918},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Xiaobai12000301_1220112",
              StaticCreatorIdList = {1220112, 1220108}
            }
          },
          ["173779373643826582825"] = {
            key = "173779373643826582825",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3210.3503780066153, y = 596.4600025366517},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Xiaobai12000301",
              StaticCreatorIdList = {1220112, 1220108}
            }
          }
        },
        commentData = {}
      }
    },
    ["1729684563989741"] = {
      isStoryNode = true,
      key = "1729684563989741",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\233\151\168\229\143\163",
      pos = {x = 1341.7385806978355, y = 284.9116715178639},
      propsData = {
        QuestId = 12000302,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120003_2",
        QuestDeatil = "Content_120003_2",
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
        SubRegionId = 210101,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_EX01"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1729740332630413",
            startPort = "Out",
            endQuest = "1729740341799726",
            endPort = "In"
          },
          {
            startQuest = "1729740341799726",
            startPort = "Out",
            endQuest = "1729740379783381322",
            endPort = "In"
          },
          {
            startQuest = "1729740379783381322",
            startPort = "Out",
            endQuest = "1729740387295381604",
            endPort = "In"
          },
          {
            startQuest = "1729740387295381604",
            startPort = "Out",
            endQuest = "17297502553742283321",
            endPort = "In"
          },
          {
            startQuest = "1736065343930242228",
            startPort = "Out",
            endQuest = "1736065343930242229",
            endPort = "In"
          },
          {
            startQuest = "1736065005906241501",
            startPort = "Out",
            endQuest = "1736065343930242231",
            endPort = "In"
          },
          {
            startQuest = "1736065343930242229",
            startPort = "Out",
            endQuest = "1729684563990746",
            endPort = "Success"
          },
          {
            startQuest = "1736065343930242231",
            startPort = "Out",
            endQuest = "1736065343930242228",
            endPort = "In"
          },
          {
            startQuest = "1729684563990745",
            startPort = "QuestStart",
            endQuest = "1736065005906241501",
            endPort = "In"
          }
        },
        nodeData = {
          ["1729684563990745"] = {
            key = "1729684563990745",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1893.7629611767545, y = 439.7636845912707},
            propsData = {ModeType = 0}
          },
          ["1729684563990746"] = {
            key = "1729684563990746",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3867.4336030420277, y = 467.81094206940656},
            propsData = {ModeType = 0}
          },
          ["1729684563990747"] = {
            key = "1729684563990747",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3334.295662512609, y = 656.1123554931786},
            propsData = {}
          },
          ["1729740332630413"] = {
            key = "1729740332630413",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2073.9605911330054, y = 67.41871921182224},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010302"
            }
          },
          ["1729740341799726"] = {
            key = "1729740341799726",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\187\145\229\184\130\229\149\134\228\186\186A",
            pos = {x = 2341.399014778325, y = 87.8128078817731},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930060}
            }
          },
          ["1729740379783381322"] = {
            key = "1729740379783381322",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\233\187\145\229\184\130\229\149\134\228\186\186\232\129\138\229\164\169 Fixsimple10",
            pos = {x = 2612.4827586206907, y = 87.07389162561532},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210008,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_MerchantA_1930060",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12012101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_10",
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
          ["1729740387295381604"] = {
            key = "1729740387295381604",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\233\187\145\229\184\130\229\149\134\228\186\186A",
            pos = {x = 2871.7438423645326, y = 107.3201970443346},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930060}
            }
          },
          ["17297502553742283321"] = {
            key = "17297502553742283321",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \233\130\163\233\135\140\229\143\145\231\148\159\228\186\134\228\187\128\228\185\136",
            pos = {x = 3121.9237524095092, y = 106.65624330691782},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12012201,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1736065005906241501"] = {
            key = "1736065005906241501",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2445.67984197965, y = 452.46291628554803},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1210087}
            }
          },
          ["1736065343930242228"] = {
            key = "1736065343930242228",
            type = "TalkNode",
            name = "\233\187\145\229\177\143 - \229\137\141\229\190\128\229\164\169\233\187\145",
            pos = {x = 3053.9253835561344, y = 460.44917974709165},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11017401,
              FlowAssetPath = "",
              TalkType = "BlackISS",
              BlendInTime = 0,
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
          ["1736065343930242229"] = {
            key = "1736065343930242229",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3582.475646524775, y = 474.49011119491036},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1210087}
            }
          },
          ["1736065343930242231"] = {
            key = "1736065343930242231",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 2716.5274335736, y = 446.0799837673095},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 10060,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "NewTargetPoint12000302",
              IsUseCount = false
            }
          }
        },
        commentData = {
          ["1736067259277244597"] = {
            key = "1736067259277244597",
            name = "\232\167\166\229\143\145\230\143\144\231\164\186\229\188\185\231\170\151",
            position = {x = 2691.2922365436534, y = 348.01308165121384},
            size = {width = 807.0967741935492, height = 289.35483870967767}
          }
        }
      }
    },
    ["17297503632772664460"] = {
      isStoryNode = true,
      key = "17297503632772664460",
      type = "StoryNode",
      name = "\233\151\168\229\143\163\231\154\132\230\188\148\229\135\186",
      pos = {x = 1587.9543554015936, y = 276.7954871276133},
      propsData = {
        QuestId = 12000303,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120003_3",
        QuestDeatil = "Content_120003_3",
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
            startQuest = "17297503632772664464",
            startPort = "QuestStart",
            endQuest = "173651656632034824817",
            endPort = "In"
          },
          {
            startQuest = "17392610015844082435",
            startPort = "Out",
            endQuest = "17392610015844082436",
            endPort = "In"
          },
          {
            startQuest = "17392610112784082592",
            startPort = "Out",
            endQuest = "17392610112784082593",
            endPort = "In"
          },
          {
            startQuest = "17297503632772664464",
            startPort = "QuestStart",
            endQuest = "17392610015844082435",
            endPort = "In"
          },
          {
            startQuest = "17297503632772664464",
            startPort = "QuestStart",
            endQuest = "17392610112784082592",
            endPort = "In"
          },
          {
            startQuest = "173651656632034824817",
            startPort = "Out",
            endQuest = "17360689212282192132",
            endPort = "In"
          },
          {
            startQuest = "17360689212282192132",
            startPort = "Out",
            endQuest = "17297514826724188018",
            endPort = "In"
          },
          {
            startQuest = "17297514826724188018",
            startPort = "Out",
            endQuest = "17562857693273456",
            endPort = "In"
          },
          {
            startQuest = "17562857693273456",
            startPort = "Out",
            endQuest = "17297503632772664465",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17297503632772664464"] = {
            key = "17297503632772664464",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1893.7629611767545, y = 439.7636845912707},
            propsData = {ModeType = 0}
          },
          ["17297503632772664465"] = {
            key = "17297503632772664465",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3269.720433350446, y = 446.01084048669605},
            propsData = {ModeType = 0}
          },
          ["17297503632772664466"] = {
            key = "17297503632772664466",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3260.532084548311, y = 601.6163207988767},
            propsData = {}
          },
          ["17297514826724188018"] = {
            key = "17297514826724188018",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\176\143\231\153\189 Fixsimple11",
            pos = {x = 2811.279787337007, y = 469.1276071937697},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12001701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "TalkStageNew_12000303",
              BlendInTime = 0,
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
              SkipToOption = true,
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
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
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
          ["17360689212282192132"] = {
            key = "17360689212282192132",
            type = "TalkNode",
            name = "\232\191\135\229\156\186\229\138\168\231\148\187-\230\146\158\229\176\143\231\153\189",
            pos = {x = 2503.3790002739543, y = 269.3957669782666},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0104/OBT0104_SC001/SQ_OBT0104_SC001",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = false,
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
          ["173651656632034824817"] = {
            key = "173651656632034824817",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2162.3332545514068, y = 350.6485533587152},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191032,
              GuideType = "P",
              GuidePointName = "NewTargetPoint_12000303"
            }
          },
          ["173685952369014471451"] = {
            key = "173685952369014471451",
            type = "TalkNode",
            name = "\232\191\135\229\156\186\229\138\168\231\148\187-\230\146\158\229\176\143\231\153\189",
            pos = {x = 2485.7246612782374, y = 442.29917352784634},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12001700,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
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
          ["17391909647793060860"] = {
            key = "17391909647793060860",
            type = "HasDetectiveResultNode",
            name = "\230\163\128\230\181\139\230\152\175\229\144\166\232\142\183\229\143\150\232\191\135\230\142\168\231\144\134\231\187\147\230\158\156",
            pos = {x = 3198.8558250610213, y = 885.7666718778632},
            propsData = {
              ResultIds = {}
            }
          },
          ["17391909915393061798"] = {
            key = "17391909915393061798",
            type = "HasDetectiveResultNode",
            name = "\230\163\128\230\181\139\230\152\175\229\144\166\232\142\183\229\143\150\232\191\135\230\142\168\231\144\134\231\187\147\230\158\156",
            pos = {x = 3171.242909153099, y = 1088.4167847325823},
            propsData = {
              ResultIds = {}
            }
          },
          ["17392610015844082435"] = {
            key = "17392610015844082435",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 2191.9087063890443, y = 648.419905316434},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17392610015844082436"] = {
            key = "17392610015844082436",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 2456.1581670803357, y = 644.4578793928159},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          },
          ["17392610112784082592"] = {
            key = "17392610112784082592",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150",
            pos = {x = 2204.305379131633, y = 834.7087433744762},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17392610112784082593"] = {
            key = "17392610112784082593",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 2520.567391143645, y = 830.3938570595899},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          },
          ["17562857693273456"] = {
            key = "17562857693273456",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2982.91638572425, y = 331.170284756299},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191039}
            }
          }
        },
        commentData = {}
      }
    },
    ["17297523075049139191"] = {
      isStoryNode = true,
      key = "17297523075049139191",
      type = "StoryNode",
      name = "\231\148\181\232\175\157\228\186\173\228\184\141\232\191\156\229\164\132",
      pos = {x = 1843.811966442695, y = 280.3794003917684},
      propsData = {
        QuestId = 12000304,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120003_4",
        QuestDeatil = "Content_120003_4",
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
        StoryGuideType = "Mechanism",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17297523075049139201",
            startPort = "Out",
            endQuest = "17297523075049139196",
            endPort = "Success"
          },
          {
            startQuest = "17297523075049139195",
            startPort = "QuestStart",
            endQuest = "17360690292663161233",
            endPort = "In"
          },
          {
            startQuest = "17360690292663161233",
            startPort = "Out",
            endQuest = "17297523075049139201",
            endPort = "In"
          },
          {
            startQuest = "174185192639915529572",
            startPort = "Out",
            endQuest = "174185192639915529573",
            endPort = "In"
          },
          {
            startQuest = "174185192639915529574",
            startPort = "Out",
            endQuest = "174185192639915529575",
            endPort = "In"
          },
          {
            startQuest = "17297523075049139195",
            startPort = "QuestStart",
            endQuest = "174185192639915529572",
            endPort = "In"
          },
          {
            startQuest = "17297523075049139195",
            startPort = "QuestStart",
            endQuest = "174185192639915529574",
            endPort = "In"
          }
        },
        nodeData = {
          ["17297523075049139195"] = {
            key = "17297523075049139195",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2458.0486754624685, y = 436.90654173412787},
            propsData = {ModeType = 0}
          },
          ["17297523075049139196"] = {
            key = "17297523075049139196",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3213.0100885228608, y = 440.41084048669603},
            propsData = {ModeType = 0}
          },
          ["17297523075049139197"] = {
            key = "17297523075049139197",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["17297523075049139201"] = {
            key = "17297523075049139201",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \232\175\162\233\151\174\230\131\133\229\134\181 Fixsimple11",
            pos = {x = 2884.701547082296, y = 546.6133168219709},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12001720,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "TalkStageNew_12000304",
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
                  TalkActorId = 220022,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 220022}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17360690292663161233"] = {
            key = "17360690292663161233",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2732.7409955987905, y = 359.3309355038482},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191035,
              GuideType = "M",
              GuidePointName = "Mechanism_12000304_1191035"
            }
          },
          ["174185192639915529572"] = {
            key = "174185192639915529572",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 2645.610051562093, y = 751.7456848418788},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["174185192639915529573"] = {
            key = "174185192639915529573",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 2909.8595122533843, y = 747.7836589182607},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          },
          ["174185192639915529574"] = {
            key = "174185192639915529574",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150",
            pos = {x = 2658.0067243046815, y = 938.0345228999211},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["174185192639915529575"] = {
            key = "174185192639915529575",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 2974.268736316694, y = 933.7196365850348},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["172975495373411429037"] = {
      isStoryNode = true,
      key = "172975495373411429037",
      type = "StoryNode",
      name = "\231\148\181\232\175\157\228\186\173",
      pos = {x = 2098.006688785061, y = 275.1373837549994},
      propsData = {
        QuestId = 12000305,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120003_5",
        QuestDeatil = "Content_120003_5",
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
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_12000305_1191038"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "172975511386711810437",
            startPort = "Out",
            endQuest = "172975495373411429044",
            endPort = "In"
          },
          {
            startQuest = "172975495373411429044",
            startPort = "Out",
            endQuest = "172976126090720014725",
            endPort = "In"
          },
          {
            startQuest = "172975495373411429041",
            startPort = "QuestStart",
            endQuest = "17360691206653162651",
            endPort = "In"
          },
          {
            startQuest = "173686267783920257138",
            startPort = "Out",
            endQuest = "17388290769604075647",
            endPort = "In"
          },
          {
            startQuest = "17388290769604075647",
            startPort = "Out",
            endQuest = "17360696807954131645",
            endPort = "In"
          },
          {
            startQuest = "174185193461615529905",
            startPort = "Out",
            endQuest = "174185193461615529906",
            endPort = "In"
          },
          {
            startQuest = "174185193461615529907",
            startPort = "Out",
            endQuest = "174185193461615529908",
            endPort = "In"
          },
          {
            startQuest = "172975495373411429041",
            startPort = "QuestStart",
            endQuest = "174185193461615529905",
            endPort = "In"
          },
          {
            startQuest = "172975495373411429041",
            startPort = "QuestStart",
            endQuest = "174185193461615529907",
            endPort = "In"
          },
          {
            startQuest = "17360696807954131645",
            startPort = "Out",
            endQuest = "1753257990684988481",
            endPort = "In"
          },
          {
            startQuest = "17360691206653162651",
            startPort = "Out",
            endQuest = "173686186326616400265",
            endPort = "In"
          },
          {
            startQuest = "173686186326616400265",
            startPort = "Out",
            endQuest = "173686267783920257138",
            endPort = "In"
          },
          {
            startQuest = "1753257990684988481",
            startPort = "Out",
            endQuest = "17360699731685099583",
            endPort = "In"
          },
          {
            startQuest = "17360699731685099583",
            startPort = "Out",
            endQuest = "17562860411345202",
            endPort = "In"
          },
          {
            startQuest = "17562860411345202",
            startPort = "Out",
            endQuest = "172975495373411429042",
            endPort = "Success"
          }
        },
        nodeData = {
          ["172975495373411429041"] = {
            key = "172975495373411429041",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2255.2486754624683, y = 436.90654173412787},
            propsData = {ModeType = 0}
          },
          ["172975495373411429042"] = {
            key = "172975495373411429042",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3973.9873951931095, y = 796.6600567683788},
            propsData = {ModeType = 0}
          },
          ["172975495373411429043"] = {
            key = "172975495373411429043",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4082.0705460867734, y = 574.4624746450305},
            propsData = {}
          },
          ["172975495373411429044"] = {
            key = "172975495373411429044",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \232\175\162\233\151\174\230\131\133\229\134\181 Fixsimple11",
            pos = {x = 2779.356995800245, y = 167.85209887325306},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12012701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_14",
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
          ["172975511386711810437"] = {
            key = "172975511386711810437",
            type = "GoToNode",
            name = "\232\191\155\229\138\158\229\133\172\229\174\164",
            pos = {x = 2652.2767518102714, y = 322.8965224104615},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930071,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010305"
            }
          },
          ["172976126090720014725"] = {
            key = "172976126090720014725",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\233\187\145\229\184\130\229\149\134\228\186\186B\229\146\140\229\185\180\232\189\187\229\165\179\229\173\169",
            pos = {x = 2899.8478076323017, y = 348.9228631260554},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930061, 1930062}
            }
          },
          ["17360691206653162650"] = {
            key = "17360691206653162650",
            type = "TalkNode",
            name = "\229\129\135\232\163\133\232\191\135\229\156\186\229\138\168\231\148\187-\232\181\176\232\191\145\231\148\181\232\175\157\228\186\173 Fixsimple11",
            pos = {x = 3165.1514908684117, y = 291.1946508866813},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12002001,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "TalkStageNew_12000305",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 220022,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 220022}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17360691206653162651"] = {
            key = "17360691206653162651",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2634.165517501514, y = 496.1880206864937},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191038,
              GuideType = "M",
              GuidePointName = "Mechanism_12000305_1191038"
            }
          },
          ["17360696807954131645"] = {
            key = "17360696807954131645",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\129\135\233\187\145\230\161\131\229\146\140\233\149\191\229\174\152 Fixsimple11",
            pos = {x = 3739.5593441436617, y = 545.0939061786247},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12001737,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "TalkStageNew_12000305",
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 220022,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 220031,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 220032,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 220033,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 220034,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 220035,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 220036,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 220022},
                {TalkActorType = "Npc", TalkActorId = 220031},
                {TalkActorType = "Npc", TalkActorId = 220032},
                {TalkActorType = "Npc", TalkActorId = 220033},
                {TalkActorType = "Npc", TalkActorId = 220034},
                {TalkActorType = "Npc", TalkActorId = 220035},
                {TalkActorType = "Npc", TalkActorId = 220036}
              },
              OptionType = "normal",
              FreezeWorldComposition = true,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17360699731685099583"] = {
            key = "17360699731685099583",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 3705.6133981661524, y = 802.5115185602717},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "NewTargetPoint_12000305",
              FadeIn = false,
              FadeOut = true,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["173686186326616400265"] = {
            key = "173686186326616400265",
            type = "TalkNode",
            name = "\232\191\135\229\156\186\229\138\168\231\148\187-\232\181\176\232\191\145\231\148\181\232\175\157\228\186\173 Fixsimple11",
            pos = {x = 2910.1541641785634, y = 511.92151487633566},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/MainStory/1200/12002001.12002001'",
              TalkType = "FixSimple",
              TalkStageName = "TalkStageNew_12000305",
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 220022,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 220022}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173686267783920257138"] = {
            key = "173686267783920257138",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\129\135\233\187\145\230\161\131\229\146\140\231\153\189 Fixsimple11",
            pos = {x = 3191.5651941194606, y = 507.78280335259893},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12001731,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "TalkStageNew_12000305",
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
                  TalkActorId = 220022,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 220022}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17388290769604075647"] = {
            key = "17388290769604075647",
            type = "TalkNode",
            name = "\233\187\145\229\185\149\232\175\180\231\153\189\232\181\176\228\186\134",
            pos = {x = 3474.3014767954105, y = 524.041571576562},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12001785,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
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
          ["174185193461615529905"] = {
            key = "174185193461615529905",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 2495.1706576226993, y = 910.6282605994544},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["174185193461615529906"] = {
            key = "174185193461615529906",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 2759.4201183139908, y = 906.6662346758363},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          },
          ["174185193461615529907"] = {
            key = "174185193461615529907",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150",
            pos = {x = 2507.567330365288, y = 1096.9170986574966},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["174185193461615529908"] = {
            key = "174185193461615529908",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 2823.8293423773002, y = 1092.6022123426103},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          },
          ["17526460229855857"] = {
            key = "17526460229855857",
            type = "TalkNode",
            name = "\232\191\135\229\156\186\229\138\168\231\148\187-\233\157\160\232\191\145",
            pos = {x = 3130.8838642070837, y = 771.5856737457838},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/East00/NPC_CloseTo",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = false,
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
          ["1753257990684988481"] = {
            key = "1753257990684988481",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\153\189\229\146\140\230\173\162\230\181\129",
            pos = {x = 3431.764965724758, y = 775.3194456929214},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191041}
            }
          },
          ["17562860411345202"] = {
            key = "17562860411345202",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3500.476537897255, y = 974.4308632707603},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191039}
            }
          }
        },
        commentData = {}
      }
    },
    ["172975541764912953502"] = {
      isStoryNode = true,
      key = "172975541764912953502",
      type = "StoryNode",
      name = "\232\167\146\232\144\189\231\171\153\230\161\169-\231\153\189\229\155\158\230\157\165",
      pos = {x = 2362.1121684769378, y = 271.9340224104617},
      propsData = {
        QuestId = 12000306,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120003_6",
        QuestDeatil = "Content_120003_6",
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
        StoryGuidePointName = "Xiaobai_12000306_1191041"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17400419801332347526",
            startPort = "Out",
            endQuest = "172975541764912953507",
            endPort = "Success"
          },
          {
            startQuest = "172975615582514479397",
            startPort = "Out",
            endQuest = "17400419801332347526",
            endPort = "In"
          },
          {
            startQuest = "174185194371015530241",
            startPort = "Out",
            endQuest = "174185194371015530242",
            endPort = "In"
          },
          {
            startQuest = "174185194371015530243",
            startPort = "Out",
            endQuest = "174185194371015530244",
            endPort = "In"
          },
          {
            startQuest = "172975541764912953506",
            startPort = "QuestStart",
            endQuest = "174185194371015530241",
            endPort = "In"
          },
          {
            startQuest = "172975541764912953506",
            startPort = "QuestStart",
            endQuest = "174185194371015530243",
            endPort = "In"
          },
          {
            startQuest = "172975541764912953506",
            startPort = "QuestStart",
            endQuest = "172975615582514479397",
            endPort = "In"
          }
        },
        nodeData = {
          ["172975541764912953506"] = {
            key = "172975541764912953506",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2069.8619759550797, y = 459.1375762168865},
            propsData = {ModeType = 0}
          },
          ["172975541764912953507"] = {
            key = "172975541764912953507",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2994.176908799358, y = 463.85521037037574},
            propsData = {ModeType = 0}
          },
          ["172975541764912953508"] = {
            key = "172975541764912953508",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["172975615582514479397"] = {
            key = "172975615582514479397",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\231\153\189\232\129\138\229\164\169\229\135\134\229\164\135\233\128\131\232\183\145",
            pos = {x = 2531.091008432582, y = 448.06972692482566},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200002,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Xiaobai_12000306_1191041",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12001745,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "TalkStageNew12000306",
              BlendInTime = 1,
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
              SkipToOption = true,
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
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
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
          ["172976141569720397644"] = {
            key = "172976141569720397644",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\153\189\229\146\140\230\173\162\230\181\129",
            pos = {x = 2277.0277416291597, y = 330.72316457423045},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191041}
            }
          },
          ["17400419801332347526"] = {
            key = "17400419801332347526",
            type = "ChangeStaticCreatorNode",
            name = "\229\136\160\233\153\164\231\153\189",
            pos = {x = 2769.6571122674486, y = 467.8821645278128},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191041}
            }
          },
          ["174185194371015530241"] = {
            key = "174185194371015530241",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 2280.0980291642013, y = 710.8484516402978},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["174185194371015530242"] = {
            key = "174185194371015530242",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 2544.3474898554928, y = 706.8864257166797},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          },
          ["174185194371015530243"] = {
            key = "174185194371015530243",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150",
            pos = {x = 2292.49470190679, y = 897.1372896983399},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["174185194371015530244"] = {
            key = "174185194371015530244",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 2608.7567139188022, y = 892.8224033834537},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["172975632306116386188"] = {
      isStoryNode = true,
      key = "172975632306116386188",
      type = "StoryNode",
      name = "\230\189\156\232\161\140\231\142\169\230\179\149",
      pos = {x = 1079.0281461614102, y = 443.38099714620154},
      propsData = {
        QuestId = 12000307,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120003_7",
        QuestDeatil = "Content_120003_7",
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
        SubRegionId = 101101,
        StoryGuideType = "Point",
        StoryGuidePointName = "NewTargetPoint12000307StealthStart"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "172975673771917149815",
            startPort = "Out",
            endQuest = "172975674938317150108",
            endPort = "In"
          },
          {
            startQuest = "172975674938317150108",
            startPort = "Out",
            endQuest = "172975680630317151254",
            endPort = "In"
          },
          {
            startQuest = "17400505190362109",
            startPort = "Out",
            endQuest = "17400505190362110",
            endPort = "In"
          },
          {
            startQuest = "17400505190362110",
            startPort = "Out",
            endQuest = "17400505190362111",
            endPort = "In"
          },
          {
            startQuest = "17360701627245100655",
            startPort = "Fail",
            endQuest = "17400505190362108",
            endPort = "In"
          },
          {
            startQuest = "17360701627245100655",
            startPort = "Fail",
            endQuest = "17400505190362107",
            endPort = "In"
          },
          {
            startQuest = "17400505190362114",
            startPort = "Out",
            endQuest = "17400505727673690",
            endPort = "In"
          },
          {
            startQuest = "17400505190362108",
            startPort = "Out",
            endQuest = "17400505190362114",
            endPort = "Input_1"
          },
          {
            startQuest = "17400505190362107",
            startPort = "Out",
            endQuest = "17400505190362114",
            endPort = "Input_2"
          },
          {
            startQuest = "17401335103189983881",
            startPort = "Out",
            endQuest = "17360701627245100655",
            endPort = "In"
          },
          {
            startQuest = "17360701627245100655",
            startPort = "Success",
            endQuest = "174013796313613917015",
            endPort = "In"
          },
          {
            startQuest = "17406444609133158163",
            startPort = "Out",
            endQuest = "1740050694603789888",
            endPort = "In"
          },
          {
            startQuest = "174185195098415530549",
            startPort = "Out",
            endQuest = "174185195098415530550",
            endPort = "In"
          },
          {
            startQuest = "174185195098415530551",
            startPort = "Out",
            endQuest = "174185195098415530552",
            endPort = "In"
          },
          {
            startQuest = "172975632306116386192",
            startPort = "QuestStart",
            endQuest = "174185195098415530549",
            endPort = "In"
          },
          {
            startQuest = "172975632306116386192",
            startPort = "QuestStart",
            endQuest = "174185195098415530551",
            endPort = "In"
          },
          {
            startQuest = "17434269413807331953",
            startPort = "Out",
            endQuest = "17434261998684078158",
            endPort = "In"
          },
          {
            startQuest = "17434261793554077880",
            startPort = "Out",
            endQuest = "17434269413807331953",
            endPort = "In"
          },
          {
            startQuest = "174013796313613917015",
            startPort = "Out",
            endQuest = "17400505190362109",
            endPort = "In"
          },
          {
            startQuest = "17360701627245100655",
            startPort = "Fail",
            endQuest = "17407264185626314146",
            endPort = "In"
          },
          {
            startQuest = "17407264185626314146",
            startPort = "Out",
            endQuest = "17400505190362114",
            endPort = "Input_3"
          },
          {
            startQuest = "17400505727673690",
            startPort = "Out",
            endQuest = "172975632306116386194",
            endPort = "Fail"
          },
          {
            startQuest = "17400505190362111",
            startPort = "Out",
            endQuest = "17406444609133158163",
            endPort = "In"
          },
          {
            startQuest = "1740050694603789888",
            startPort = "Out",
            endQuest = "172975632306116386193",
            endPort = "Success"
          },
          {
            startQuest = "172975632306116386192",
            startPort = "QuestStart",
            endQuest = "17569696844595105",
            endPort = "In"
          },
          {
            startQuest = "17569696844595105",
            startPort = "Out",
            endQuest = "17401335103189983881",
            endPort = "In"
          },
          {
            startQuest = "17360701627245100655",
            startPort = "PassiveFail",
            endQuest = "17400505190362108",
            endPort = "In"
          },
          {
            startQuest = "17360701627245100655",
            startPort = "PassiveFail",
            endQuest = "17400505190362107",
            endPort = "In"
          },
          {
            startQuest = "17360701627245100655",
            startPort = "PassiveFail",
            endQuest = "17407264185626314146",
            endPort = "In"
          }
        },
        nodeData = {
          ["172975632306116386192"] = {
            key = "172975632306116386192",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1799.8255985393919, y = 518.0911571187431},
            propsData = {ModeType = 0}
          },
          ["172975632306116386193"] = {
            key = "172975632306116386193",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4425.266558486346, y = 303.73490571575735},
            propsData = {ModeType = 0}
          },
          ["172975632306116386194"] = {
            key = "172975632306116386194",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4081.804376772218, y = 659.415432977021},
            propsData = {}
          },
          ["172975673771917149815"] = {
            key = "172975673771917149815",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 3735.819285048222, y = 1105.4653785986734},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010101"
            }
          },
          ["172975674938317150108"] = {
            key = "172975674938317150108",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\137\182\231\150\143",
            pos = {x = 3765.672863503748, y = 1155.017508128314},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930076}
            }
          },
          ["172975680630317151254"] = {
            key = "172975680630317151254",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3815.0748318180354, y = 1182.2868151903256},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210013,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Fushu_1930076",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 12013201,
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
          ["17360701627245100655"] = {
            key = "17360701627245100655",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\230\189\156\232\161\140\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 2545.8343863872983, y = 536.6772266577606},
            propsData = {SpecialConfigId = 12000307, BlackScreenImmediately = true}
          },
          ["173686318436023151262"] = {
            key = "173686318436023151262",
            type = "TalkNode",
            name = "\229\129\135\232\163\133\230\189\156\232\161\140\228\187\187\229\138\161",
            pos = {x = 3704.5757200555026, y = 1035.9670086147244},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12002100,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
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
          ["173686319318423151357"] = {
            key = "173686319318423151357",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 3659.43756256806, y = 967.9473062430383},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "NewTargetPoint12000307StealthStart",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17400505190362107"] = {
            key = "17400505190362107",
            type = "ForbidWeaponByWeaponTagNode",
            name = "\229\144\175\231\148\168 \230\173\166\229\153\168\232\138\130\231\130\185",
            pos = {x = 3064.031771250717, y = 657.4419530966827},
            propsData = {
              WeaponTags = {"Melee", "Ranged"},
              bForbid = false,
              ForbidTag = "ForbidDefault",
              bHidewhenForbid = true
            }
          },
          ["17400505190362108"] = {
            key = "17400505190362108",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 3063.6755809952547, y = 525.0741561339196},
            propsData = {}
          },
          ["17400505190362109"] = {
            key = "17400505190362109",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 3027.7851436727556, y = 332.86573921100955},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "BloodBar",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17400505190362110"] = {
            key = "17400505190362110",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 3295.9787465908007, y = 314.71200026546643},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17400505190362111"] = {
            key = "17400505190362111",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 3519.9386982914816, y = 317.29003599984065},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "Entrance",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["17400505190362114"] = {
            key = "17400505190362114",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 3449.30780767695, y = 637.363667638827},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          },
          ["17400505727673690"] = {
            key = "17400505727673690",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 3747.1691832564106, y = 679.5350170477802},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "Steathpoint1",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["1740050694603789888"] = {
            key = "1740050694603789888",
            type = "ForbidWeaponByWeaponTagNode",
            name = "\229\144\175\231\148\168 \230\173\166\229\153\168\232\138\130\231\130\185",
            pos = {x = 4047.4927345123087, y = 319.63191126506365},
            propsData = {
              WeaponTags = {"Melee", "Ranged"},
              bForbid = false,
              ForbidTag = "ForbidDefault",
              bHidewhenForbid = true
            }
          },
          ["17401335103189983881"] = {
            key = "17401335103189983881",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2209.675320287402, y = 518.6463795213502},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191141,
              GuideType = "M",
              GuidePointName = "Mechanism_12000307StealthStartBox_1191141"
            }
          },
          ["17401335310949984248"] = {
            key = "17401335310949984248",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2028.7343269812773, y = 179.6356754899549},
            propsData = {WaitTime = 0.1}
          },
          ["174013796313613917015"] = {
            key = "174013796313613917015",
            type = "SendMessageNode",
            name = "\230\142\162\231\180\162\231\187\132\230\156\170\230\191\128\230\180\187",
            pos = {x = 3034.505396283158, y = 200.7971540280964},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "East00SteathDie",
              UnitId = -1
            }
          },
          ["17406444609133158163"] = {
            key = "17406444609133158163",
            type = "ActivePlayerSkillsNode",
            name = "\231\166\129\230\173\162\230\148\187\229\135\187\230\148\190\230\138\128\232\131\189",
            pos = {x = 3782.5248742603794, y = 303.4619463539773},
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
                "BulletJump",
                "Jump",
                "Slide"
              }
            }
          },
          ["17407264185626314146"] = {
            key = "17407264185626314146",
            type = "SendMessageNode",
            name = "\230\142\162\231\180\162\231\187\132\233\135\141\231\189\174",
            pos = {x = 3040.4229404428715, y = 806.2435371343369},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "East00SteathDie",
              UnitId = -1
            }
          },
          ["174185195098415530549"] = {
            key = "174185195098415530549",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 1870.1706576227002, y = 764.3365939327881},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["174185195098415530550"] = {
            key = "174185195098415530550",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 2108.9201183139917, y = 773.87456800917},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          },
          ["174185195098415530551"] = {
            key = "174185195098415530551",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150",
            pos = {x = 1783.5673303652889, y = 908.6254319908304},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["174185195098415530552"] = {
            key = "174185195098415530552",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 2038.3293423773016, y = 920.8105456759441},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          },
          ["17434261793554077880"] = {
            key = "17434261793554077880",
            type = "CommonBlackFadeInOutNode",
            name = "\229\175\185\232\175\157\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = 2458.6077585539474, y = 1065.2525865923558},
            propsData = {FadeTime = 0, FadeType = "FadeIn"}
          },
          ["17434261998684078158"] = {
            key = "17434261998684078158",
            type = "CommonBlackFadeInOutNode",
            name = "\229\175\185\232\175\157\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = 2952.4932481399806, y = 1061.7950446384434},
            propsData = {FadeTime = 0, FadeType = "FadeOut"}
          },
          ["17434269413807331953"] = {
            key = "17434269413807331953",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2718.3794437554507, y = 1085.470956075565},
            propsData = {WaitTime = 0.1}
          },
          ["17569696844595105"] = {
            key = "17569696844595105",
            type = "SendMessageNode",
            name = "\230\142\162\231\180\162\231\187\132\233\135\141\231\189\174",
            pos = {x = 1998.320994794679, y = 391.85746747531664},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "East00SteathDie",
              UnitId = -1
            }
          }
        },
        commentData = {
          ["17434766250119774266"] = {
            key = "17434766250119774266",
            name = "\229\135\186+\232\191\155\231\137\185\230\174\138\228\187\187\229\138\161\233\129\174\231\155\150\231\169\191\229\184\174\239\188\140\229\187\182\232\191\1590.1\231\167\146\229\144\140\230\173\165\232\166\134\231\155\150\232\191\155\228\187\187\229\138\161",
            position = {x = 2395.8674220709004, y = 960.9539555659697},
            size = {width = 846.2439656453334, height = 278.66131682961935}
          }
        }
      }
    },
    ["172976220001520784705"] = {
      isStoryNode = true,
      key = "172976220001520784705",
      type = "StoryNode",
      name = "\230\173\162\230\181\129\230\142\165\228\186\186",
      pos = {x = 1343.178448561329, y = 448.4874581781537},
      propsData = {
        QuestId = 12000308,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120003_8",
        QuestDeatil = "Content_120003_8",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = true,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = false,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_12000308"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17388297762008149164",
            startPort = "Out",
            endQuest = "173703496106857903364",
            endPort = "In"
          },
          {
            startQuest = "174185195785115530855",
            startPort = "Out",
            endQuest = "174185195785115530856",
            endPort = "In"
          },
          {
            startQuest = "174185195785115530857",
            startPort = "Out",
            endQuest = "174185195785115530858",
            endPort = "In"
          },
          {
            startQuest = "172976220001520784709",
            startPort = "QuestStart",
            endQuest = "174185195785115530855",
            endPort = "In"
          },
          {
            startQuest = "172976220001520784709",
            startPort = "QuestStart",
            endQuest = "174185195785115530857",
            endPort = "In"
          },
          {
            startQuest = "17519720925528388",
            startPort = "Out",
            endQuest = "17519720925528389",
            endPort = "In"
          },
          {
            startQuest = "173703496106857903364",
            startPort = "Out",
            endQuest = "17519720925528386",
            endPort = "In"
          },
          {
            startQuest = "172976220001520784709",
            startPort = "QuestStart",
            endQuest = "1755257649921926097",
            endPort = "In"
          },
          {
            startQuest = "1755257649921926097",
            startPort = "Out",
            endQuest = "172976454183821552017",
            endPort = "In"
          },
          {
            startQuest = "172976454183821552017",
            startPort = "Out",
            endQuest = "1755257834772926619",
            endPort = "In"
          },
          {
            startQuest = "1755257834772926619",
            startPort = "Out",
            endQuest = "17388297762008149164",
            endPort = "In"
          },
          {
            startQuest = "17519720925528386",
            startPort = "Out",
            endQuest = "17519720925528388",
            endPort = "In"
          },
          {
            startQuest = "17519720925528388",
            startPort = "Out",
            endQuest = "17388296838478147939",
            endPort = "In"
          },
          {
            startQuest = "17388296838478147939",
            startPort = "Out",
            endQuest = "172976220001520784710",
            endPort = "Success"
          }
        },
        nodeData = {
          ["172976220001520784709"] = {
            key = "172976220001520784709",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2194.6723207826653, y = 350.71639395087675},
            propsData = {ModeType = 0}
          },
          ["172976220001520784710"] = {
            key = "172976220001520784710",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3826.829912618969, y = 772.3674976433167},
            propsData = {ModeType = 0}
          },
          ["172976220001520784711"] = {
            key = "172976220001520784711",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3934.4642254360983, y = 1027.6708769058523},
            propsData = {}
          },
          ["172976454183821552017"] = {
            key = "172976454183821552017",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\230\173\162\230\181\129\232\129\138\229\164\169 Fixsimple17",
            pos = {x = 2476.506632070616, y = 337.1241185504053},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12001753,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "TalkStageNew_12000308",
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
              HideAllBattleEntity = false,
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
                  TalkActorId = 210004,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210004}
              },
              OptionType = "normal",
              FreezeWorldComposition = true,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173703496106857903364"] = {
            key = "173703496106857903364",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3089.7612543140044, y = 351.37544912104426},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1191052,
                1191051,
                1191894
              }
            }
          },
          ["17388295334936113636"] = {
            key = "17388295334936113636",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\188\128\232\189\166\231\154\132\230\173\162\230\181\129",
            pos = {x = 3669.933789891491, y = 1385.4641597745822},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = true,
              EnableFadeOut = true,
              NewTargetPointName = "Zhiliu_12000308",
              StaticCreatorIdList = {1191046}
            }
          },
          ["17388296450567131258"] = {
            key = "17388296450567131258",
            type = "TalkNode",
            name = "\229\129\135\232\163\133\229\188\128\232\189\166Sequence",
            pos = {x = 3951.195786841853, y = 1359.2463089979078},
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
          },
          ["17388296838478147939"] = {
            key = "17388296838478147939",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 3517.280991511736, y = 769.8977690387812},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "NewTargetPoint_120003081",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17388297762008149164"] = {
            key = "17388297762008149164",
            type = "TalkNode",
            name = "\229\129\135\232\163\133\229\129\135\232\163\133\229\188\128\232\189\166Sequence",
            pos = {x = 2829.7985031526487, y = 312.71113664020004},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/East00/Zhiliu_Drive",
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
              HideAllBattleEntity = false,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
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
          ["173950313098411335662"] = {
            key = "173950313098411335662",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\188\128\232\189\166\231\154\132\230\173\162\230\181\129",
            pos = {x = 4283.064802450417, y = 1274.1545903765236},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "Zhiliu_12000308",
              StaticCreatorIdList = {1191046}
            }
          },
          ["174185195785115530855"] = {
            key = "174185195785115530855",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 2541.566761518803, y = 85.36906146525537},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["174185195785115530856"] = {
            key = "174185195785115530856",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 2804.476936495809, y = 84.88917839878015},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan`",
              UnitId = -1
            }
          },
          ["174185195785115530857"] = {
            key = "174185195785115530857",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150",
            pos = {x = 2546.999148547106, y = -106.28852904813105},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["174185195785115530858"] = {
            key = "174185195785115530858",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 2769.7790177019756, y = -87.56770107730301},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityKuanghuan",
              UnitId = -1
            }
          },
          ["17425418438261573133"] = {
            key = "17425418438261573133",
            type = "ResourceCollectNode",
            name = "\232\142\183\229\190\151Resource\233\129\147\229\133\183",
            pos = {x = 4341.09700903226, y = 1021.302009166404},
            propsData = {
              ResourceType = "Resource",
              ResourceId = -1,
              ResourceSType = "Fish",
              NeedCount = 0,
              bUseBagCount = true,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = ""
            }
          },
          ["17519720925528386"] = {
            key = "17519720925528386",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \233\151\168\229\143\163\229\163\171\229\133\181\230\163\128\230\159\165    ",
            pos = {x = 3398.8339575579566, y = 346.0246929584758},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12001762,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "TalkStageNew_12000309",
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
              HideAllBattleEntity = false,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              SkipToOption = true,
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
                  TalkActorId = 220014,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 220025,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 220026,
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
                {TalkActorType = "Npc", TalkActorId = 220014},
                {TalkActorType = "Npc", TalkActorId = 220025},
                {TalkActorType = "Npc", TalkActorId = 220026},
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
          ["17519720925528388"] = {
            key = "17519720925528388",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \233\151\168\229\143\163\229\163\171\229\133\181\230\163\128\230\159\1652D    ",
            pos = {x = 3168.042248091656, y = 771.9683208266115},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12001801,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "TalkStageNew_12000309",
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
              HideAllBattleEntity = false,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              SkipToOption = true,
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
                  TalkActorId = 220014,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 220025,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 220026,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 220014},
                {TalkActorType = "Npc", TalkActorId = 220025},
                {TalkActorType = "Npc", TalkActorId = 220026}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17519720925528389"] = {
            key = "17519720925528389",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\231\153\189\229\164\169",
            pos = {x = 3499.684325806485, y = 628.8265164945408},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityDay",
              UnitId = -1
            }
          },
          ["1755257649921926097"] = {
            key = "1755257649921926097",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2292.7344439093167, y = 485.0323974476785},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191895}
            }
          },
          ["1755257834772926619"] = {
            key = "1755257834772926619",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2652.3756542006936, y = 486.3638624231924},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191895}
            }
          }
        },
        commentData = {}
      }
    },
    ["172976411309121167728"] = {
      isStoryNode = true,
      key = "172976411309121167728",
      type = "StoryNode",
      name = "\229\134\176\230\185\150\229\159\142\230\173\163\233\151\168",
      pos = {x = 1616.4394568913563, y = 603.0776063982975},
      propsData = {
        QuestId = 12000309,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120003_9",
        QuestDeatil = "Content_120003_9",
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
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_12000309"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1730948580909825426",
            startPort = "Out",
            endQuest = "172976934913524610690",
            endPort = "In"
          },
          {
            startQuest = "172976934913524610690",
            startPort = "Out",
            endQuest = "1737042567503249497",
            endPort = "In"
          },
          {
            startQuest = "1737042567503249497",
            startPort = "Out",
            endQuest = "173703510161658881974",
            endPort = "In"
          },
          {
            startQuest = "1737042567503249497",
            startPort = "Out",
            endQuest = "17392635003305101632",
            endPort = "In"
          },
          {
            startQuest = "174185196412315531115",
            startPort = "Out",
            endQuest = "174185196412315531116",
            endPort = "In"
          },
          {
            startQuest = "174185196412315531117",
            startPort = "Out",
            endQuest = "174185196412315531118",
            endPort = "In"
          }
        },
        nodeData = {
          ["172976411309121167732"] = {
            key = "172976411309121167732",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2278.962961176754, y = 483.70654173412794},
            propsData = {ModeType = 0}
          },
          ["172976411309121167733"] = {
            key = "172976411309121167733",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3595.3541322487436, y = 673.578281970215},
            propsData = {ModeType = 0}
          },
          ["172976411309121167734"] = {
            key = "172976411309121167734",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3995.532084548312, y = 575.6163207988767},
            propsData = {}
          },
          ["172976934913524610690"] = {
            key = "172976934913524610690",
            type = "TalkNode",
            name = "\229\129\135\232\163\1332D\229\155\190",
            pos = {x = 2856.854709734033, y = 458.77078005586867},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12003201,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
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
          ["17309477497724650"] = {
            key = "17309477497724650",
            type = "GoToNode",
            name = "\230\173\163\233\151\168\230\163\128\230\181\139",
            pos = {x = 2544.1584513775474, y = 223.14384421962782},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191047,
              GuideType = "M",
              GuidePointName = "Mechanism_12000309"
            }
          },
          ["1730948580909825426"] = {
            key = "1730948580909825426",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \233\151\168\229\143\163\229\163\171\229\133\181\230\163\128\230\159\165    ",
            pos = {x = 2588.063614320628, y = 458.0297448955035},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12001762,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "TalkStageNew_12000309",
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
              SkipToOption = true,
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
                  TalkActorId = 220014,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 220025,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 220026,
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
                {TalkActorType = "Npc", TalkActorId = 220014},
                {TalkActorType = "Npc", TalkActorId = 220025},
                {TalkActorType = "Npc", TalkActorId = 220026},
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
          ["173703510161658881974"] = {
            key = "173703510161658881974",
            type = "TalkNode",
            name = "\228\188\160\229\136\176\228\184\156\229\155\189\228\186\134\229\176\177",
            pos = {x = 3265.7215381804654, y = 630.8335895535697},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12003301,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
          ["1737042567503249497"] = {
            key = "1737042567503249497",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \233\151\168\229\143\163\229\163\171\229\133\181\230\163\128\230\159\1652D    ",
            pos = {x = 3144.1949817774043, y = 457.7987006615476},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12001801,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "TalkStageNew_12000309",
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
              ShowSkipButton = false,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              SkipToOption = true,
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
                  TalkActorId = 220014,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 220025,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 220026,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 220014},
                {TalkActorType = "Npc", TalkActorId = 220025},
                {TalkActorType = "Npc", TalkActorId = 220026}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17392635003305101632"] = {
            key = "17392635003305101632",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\231\153\189\229\164\169",
            pos = {x = 3526.738726790452, y = 460.1911743428985},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityDay",
              UnitId = -1
            }
          },
          ["174185196412315531115"] = {
            key = "174185196412315531115",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 2506.2420861941278, y = 709.1223082185022},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["174185196412315531116"] = {
            key = "174185196412315531116",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 2844.241546885419, y = 705.1602822948842},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["174185196412315531117"] = {
            key = "174185196412315531117",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\229\134\176\230\185\150",
            pos = {x = 2518.6387589367164, y = 895.4111462765444},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101103,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["174185196412315531118"] = {
            key = "174185196412315531118",
            type = "SendMessageNode",
            name = "\230\153\154\228\184\138",
            pos = {x = 2949.9007709487287, y = 932.3462599616581},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeNight",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
