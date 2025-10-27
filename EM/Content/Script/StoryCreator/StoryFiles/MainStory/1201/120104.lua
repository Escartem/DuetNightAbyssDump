return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17298427023896515859",
      startPort = "Success",
      endStory = "1729850805629504",
      endPort = "In"
    },
    {
      startStory = "1729850805629504",
      startPort = "Success",
      endStory = "17298522628911535677",
      endPort = "In"
    },
    {
      startStory = "17298522628911535677",
      startPort = "Success",
      endStory = "17300978037946719794",
      endPort = "In"
    },
    {
      startStory = "17300978037946719794",
      startPort = "Success",
      endStory = "17300983023828644287",
      endPort = "In"
    },
    {
      startStory = "17300983023828644287",
      startPort = "Success",
      endStory = "173009929022212491923",
      endPort = "In"
    },
    {
      startStory = "173009929022212491923",
      startPort = "Success",
      endStory = "173010091952515187310",
      endPort = "In"
    },
    {
      startStory = "173010091952515187310",
      startPort = "Success",
      endStory = "173010536723619426557",
      endPort = "In"
    },
    {
      startStory = "173010536723619426557",
      startPort = "Success",
      endStory = "173010599735122512093",
      endPort = "In"
    },
    {
      startStory = "173010599735122512093",
      startPort = "Success",
      endStory = "173010816968826757896",
      endPort = "In"
    },
    {
      startStory = "173010816968826757896",
      startPort = "Success",
      endStory = "173010907117129846419",
      endPort = "In"
    },
    {
      startStory = "173010907117129846419",
      startPort = "Success",
      endStory = "17302563218121973",
      endPort = "In"
    },
    {
      startStory = "17302563218121973",
      startPort = "Success",
      endStory = "17302573573652721009",
      endPort = "In"
    },
    {
      startStory = "17302573573652721009",
      startPort = "Success",
      endStory = "17302585392454276941",
      endPort = "In"
    },
    {
      startStory = "17302585392454276941",
      startPort = "Success",
      endStory = "17302735353198572270",
      endPort = "In"
    },
    {
      startStory = "1732783210844555876",
      startPort = "StoryStart",
      endStory = "17298427023896515859",
      endPort = "In"
    },
    {
      startStory = "173027635516714048439",
      startPort = "Success",
      endStory = "1749638981422935870",
      endPort = "In"
    },
    {
      startStory = "1749638981422935870",
      startPort = "Success",
      endStory = "173027672468215615090",
      endPort = "In"
    },
    {
      startStory = "17302735353198572270",
      startPort = "Success",
      endStory = "17351194070383272",
      endPort = "In"
    },
    {
      startStory = "17351194070383272",
      startPort = "Success",
      endStory = "173027635516714048439",
      endPort = "In"
    },
    {
      startStory = "173027672468215615090",
      startPort = "Success",
      endStory = "175369329747333382459",
      endPort = "In"
    },
    {
      startStory = "175369329747333382459",
      startPort = "Success",
      endStory = "1732783210844555877",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17298427023896515859"] = {
      isStoryNode = true,
      key = "17298427023896515859",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\229\140\187\233\166\134",
      pos = {x = 1644.5566721658656, y = 352.9821840381016},
      propsData = {
        QuestId = 12010401,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_1",
        QuestDeatil = "Content_120104_1",
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
            startQuest = "17298429214096901760",
            startPort = "Out",
            endQuest = "17298431295487285075",
            endPort = "In"
          },
          {
            startQuest = "17298431295487285075",
            startPort = "Out",
            endQuest = "17298427023896515864",
            endPort = "Success"
          },
          {
            startQuest = "17298427023896515863",
            startPort = "QuestStart",
            endQuest = "17298429214096901760",
            endPort = "In"
          }
        },
        nodeData = {
          ["17298427023896515863"] = {
            key = "17298427023896515863",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1912.3146853146854, y = 456.29570429570424},
            propsData = {ModeType = 0}
          },
          ["17298427023896515864"] = {
            key = "17298427023896515864",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2782.5257008798526, y = 437.78146067110936},
            propsData = {ModeType = 0}
          },
          ["17298427023896515865"] = {
            key = "17298427023896515865",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17298429214096901760"] = {
            key = "17298429214096901760",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\140\187\233\166\134",
            pos = {x = 2172.299810720856, y = 439.4024602662594},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930089,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1930089"
            }
          },
          ["17298431295487285075"] = {
            key = "17298431295487285075",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\140\187\233\166\134",
            pos = {x = 2492.5498107208555, y = 441.04531740911665},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12013701,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17518031836462852560"] = {
            key = "17518031836462852560",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\140\187\233\166\134",
            pos = {x = 1824.436090225564, y = 303.2503132832082},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2110113,
              GuideType = "P",
              GuidePointName = "QuestPoint_120104Start"
            }
          }
        },
        commentData = {}
      }
    },
    ["1729850805629504"] = {
      isStoryNode = true,
      key = "1729850805629504",
      type = "StoryNode",
      name = "\229\137\141\229\142\187\230\149\178\233\151\168",
      pos = {x = 1916.6991048147952, y = 351.47530204849176},
      propsData = {
        QuestId = 12010402,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_2",
        QuestDeatil = "Content_120104_2",
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
        SubRegionId = 104106,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12010402"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1729851623265767739",
            startPort = "Out",
            endQuest = "17298518493831151746",
            endPort = "In"
          },
          {
            startQuest = "1729851642097768154",
            startPort = "Out",
            endQuest = "1729850805629509",
            endPort = "Success"
          },
          {
            startQuest = "1729850805629508",
            startPort = "QuestStart",
            endQuest = "175507598114225975201",
            endPort = "In"
          },
          {
            startQuest = "175507598114225975201",
            startPort = "Out",
            endQuest = "1729851642097768154",
            endPort = "In"
          }
        },
        nodeData = {
          ["1729850805629508"] = {
            key = "1729850805629508",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2291.8146853146854, y = 483.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1729850805629509"] = {
            key = "1729850805629509",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3345.3705284660596, y = 473.81594342973005},
            propsData = {ModeType = 0}
          },
          ["1729850805629510"] = {
            key = "1729850805629510",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1729850942882384490"] = {
            key = "1729850942882384490",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2180.2758620689665, y = 219.78843911377635},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010402"
            }
          },
          ["1729851623265767739"] = {
            key = "1729851623265767739",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\149\178\233\151\168\231\130\185",
            pos = {x = 2734.493103448276, y = 98.55740463101779},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930090}
            }
          },
          ["1729851642097768154"] = {
            key = "1729851642097768154",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\149\178\233\151\168",
            pos = {x = 3006.852854245147, y = 474.63669859747984},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12013801,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_36",
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
          ["17298518493831151746"] = {
            key = "17298518493831151746",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\149\178\233\151\168\231\130\185",
            pos = {x = 3040.5482758620697, y = 155.04571047809418},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930090}
            }
          },
          ["17500414275306155"] = {
            key = "17500414275306155",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 3019.948529411765, y = 834.7107843137254},
            propsData = {WaitTime = 2}
          },
          ["175507598114225975201"] = {
            key = "175507598114225975201",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2655.5808823529414, y = 479.89215686274497},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2070054,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2070054"
            }
          }
        },
        commentData = {}
      }
    },
    ["17298522628911535677"] = {
      isStoryNode = true,
      key = "17298522628911535677",
      type = "StoryNode",
      name = "\229\175\187\230\137\190\230\137\182\231\150\143",
      pos = {x = 2202.612068297402, y = 347.2490615591108},
      propsData = {
        QuestId = 12010403,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_3",
        QuestDeatil = "Content_120104_3",
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
        SubRegionId = 104106,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12010402"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17299328289264222624",
            startPort = "Out",
            endQuest = "17299331729425758079",
            endPort = "In"
          },
          {
            startQuest = "17299331729425758079",
            startPort = "Out",
            endQuest = "17298522628921535682",
            endPort = "Success"
          },
          {
            startQuest = "17298522628921535681",
            startPort = "QuestStart",
            endQuest = "175368733202028359862",
            endPort = "In"
          },
          {
            startQuest = "175368733202028359862",
            startPort = "Out",
            endQuest = "17299329544334606785",
            endPort = "In"
          },
          {
            startQuest = "175368733202028359862",
            startPort = "Out",
            endQuest = "17299332503865759022",
            endPort = "In"
          },
          {
            startQuest = "17299329544334606785",
            startPort = "Out",
            endQuest = "175368770862028361022",
            endPort = "In"
          },
          {
            startQuest = "175368770862028361022",
            startPort = "Out",
            endQuest = "17299328289264222624",
            endPort = "In"
          }
        },
        nodeData = {
          ["17298522628921535681"] = {
            key = "17298522628921535681",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1712.9462642620538, y = 488.6378095588621},
            propsData = {ModeType = 0}
          },
          ["17298522628921535682"] = {
            key = "17298522628921535682",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3434.2455284660596, y = 450.12844342973005},
            propsData = {ModeType = 0}
          },
          ["17298522628921535683"] = {
            key = "17298522628921535683",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17299326764634222328"] = {
            key = "17299326764634222328",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2194.6598428542634, y = -11.36015223904326},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17299328289264222624"] = {
            key = "17299328289264222624",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\140\187\233\166\134\228\186\164\232\176\136",
            pos = {x = 2879.4554255610306, y = 438.6102424977987},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210013,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Fushu_1930093",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12014001,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_37",
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
                  TalkActorId = 210013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210056,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210013},
                {TalkActorType = "Npc", TalkActorId = 210056}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17299329544334606785"] = {
            key = "17299329544334606785",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\137\182\231\150\143",
            pos = {x = 2345.992549621181, y = 446.8052612947913},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2070002, 2070103}
            }
          },
          ["17299331729425758079"] = {
            key = "17299331729425758079",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\137\182\231\150\143",
            pos = {x = 3162.1151999971207, y = 443.57170866321235},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2070002}
            }
          },
          ["17299332503865759022"] = {
            key = "17299332503865759022",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\140\187\233\166\134",
            pos = {x = 2338.4012780955927, y = 249.07596830425064},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12013901,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["175368733202028359862"] = {
            key = "175368733202028359862",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2030.0111665032143, y = 457.526528277215},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2070051,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2070051"
            }
          },
          ["175368770862028361022"] = {
            key = "175368770862028361022",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2613.832595074643, y = 445.7479568486435},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2070051,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2070051"
            }
          },
          ["175368771044128361093"] = {
            key = "175368771044128361093",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2884.7254522175, y = 737.176528277215},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2070051,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2070051"
            }
          }
        },
        commentData = {}
      }
    },
    ["17300978037946719794"] = {
      isStoryNode = true,
      key = "17300978037946719794",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\230\185\150\229\191\131\229\178\155",
      pos = {x = 1664.778819744649, y = 669.2131080851491},
      propsData = {
        QuestId = 12010404,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_4",
        QuestDeatil = "Content_120104_4",
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
            startQuest = "17300978037946719798",
            startPort = "QuestStart",
            endQuest = "17300981851298258828",
            endPort = "In"
          },
          {
            startQuest = "17300981851298258828",
            startPort = "Out",
            endQuest = "17300982331138259276",
            endPort = "In"
          },
          {
            startQuest = "17300981851298258828",
            startPort = "Out",
            endQuest = "17300978037946719799",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17300978037946719798"] = {
            key = "17300978037946719798",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2030.3146853146854, y = 455.13986013986005},
            propsData = {ModeType = 0}
          },
          ["17300978037946719799"] = {
            key = "17300978037946719799",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2812.7556294761607, y = 465.4834217847084},
            propsData = {ModeType = 0}
          },
          ["17300978037946719800"] = {
            key = "17300978037946719800",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17300981217777874092"] = {
            key = "17300981217777874092",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\151\160\231\148\177\231\148\159\229\142\187\229\147\170\228\186\134",
            pos = {x = 2332.249220915657, y = 87.1443537718296},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12014201,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17300981851298258828"] = {
            key = "17300981851298258828",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\176\152\230\188\160\229\164\132",
            pos = {x = 2422.9653728193084, y = 436.9183436708194},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930095,
              GuideType = "P",
              GuidePointName = "QuestPoint_120104041"
            }
          },
          ["17300982331138259276"] = {
            key = "17300982331138259276",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\184\133\233\153\164\229\176\152\230\188\160",
            pos = {x = 2777.947002300939, y = 299.64794740042316},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12014201,
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
    ["17300983023828644287"] = {
      isStoryNode = true,
      key = "17300983023828644287",
      type = "StoryNode",
      name = "\230\184\133\233\153\164\229\176\152\230\188\160",
      pos = {x = 1917.9584311773222, y = 667.5770272607523},
      propsData = {
        QuestId = 12010405,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_5",
        QuestDeatil = "Content_120104_5",
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
        SubRegionId = 104104,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_JingGou_2050011"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173009879143410568211",
            startPort = "Out",
            endQuest = "17300983023828644292",
            endPort = "Success"
          },
          {
            startQuest = "17300983023828644291",
            startPort = "QuestStart",
            endQuest = "175368957333429363163",
            endPort = "In"
          },
          {
            startQuest = "175368957333429363163",
            startPort = "Out",
            endQuest = "175368956360029362867",
            endPort = "In"
          },
          {
            startQuest = "175368956360029362867",
            startPort = "Out",
            endQuest = "173009879143410568211",
            endPort = "In"
          }
        },
        nodeData = {
          ["17300983023828644291"] = {
            key = "17300983023828644291",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1895.6003996003997, y = 476.5814185814185},
            propsData = {ModeType = 0}
          },
          ["17300983023828644292"] = {
            key = "17300983023828644292",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3079.415536820279, y = 194.47263724760808},
            propsData = {ModeType = 0}
          },
          ["17300983023828644293"] = {
            key = "17300983023828644293",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17300983023828644294"] = {
            key = "17300983023828644294",
            type = "GoToNode",
            name = "\230\184\133\233\153\164\229\176\152\230\188\160",
            pos = {x = 2093.5851127285227, y = 139.65864138480157},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930096,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010405"
            }
          },
          ["173009879143410568211"] = {
            key = "173009879143410568211",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\231\149\143\231\148\159\228\186\164\230\181\129",
            pos = {x = 2799.704578058514, y = 291.3065110589869},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210044,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Weisheng_2050022",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12014301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_38",
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
                  TalkActorId = 210036,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210013,
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
                {TalkActorType = "Npc", TalkActorId = 210036},
                {TalkActorType = "Npc", TalkActorId = 210013},
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
          ["175368956360029362867"] = {
            key = "175368956360029362867",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2483.7631578947367, y = 356.0526315789474},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 2050011,
              StateId = 118022,
              IsGuideEnable = true,
              GuidePointName = "Mechanism_JingGou_2050011"
            }
          },
          ["175368957333429363163"] = {
            key = "175368957333429363163",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\151\160\231\148\177\231\148\159/\230\153\182\229\158\162",
            pos = {x = 2193.7631578947367, y = 443.0526315789474},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2050011, 2050022}
            }
          }
        },
        commentData = {}
      }
    },
    ["173009929022212491923"] = {
      isStoryNode = true,
      key = "173009929022212491923",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\165\173\229\143\176",
      pos = {x = 2176.27045163768, y = 666.0822844360862},
      propsData = {
        QuestId = 12010406,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_6",
        QuestDeatil = "Content_120104_6",
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
            startQuest = "173009929022212491927",
            startPort = "QuestStart",
            endQuest = "173009929022212491930",
            endPort = "In"
          },
          {
            startQuest = "173009929022212491932",
            startPort = "Out",
            endQuest = "173009929022212491928",
            endPort = "Success"
          },
          {
            startQuest = "173009929022212491930",
            startPort = "Out",
            endQuest = "173009929022212491932",
            endPort = "In"
          }
        },
        nodeData = {
          ["173009929022212491927"] = {
            key = "173009929022212491927",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["173009929022212491928"] = {
            key = "173009929022212491928",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2777.5788617993935, y = 441.23955454084114},
            propsData = {ModeType = 0}
          },
          ["173009929022212491929"] = {
            key = "173009929022212491929",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["173009929022212491930"] = {
            key = "173009929022212491930",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\165\173\229\143\176",
            pos = {x = 2218.07759393153, y = 443.2112729637489},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930100,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010406"
            }
          },
          ["173009929022212491932"] = {
            key = "173009929022212491932",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \231\149\143\231\148\159\229\155\158\229\174\182",
            pos = {x = 2498.942673296609, y = 439.5604793129552},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12014401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_39",
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
                  TalkActorId = 210036,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210013,
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
                {TalkActorType = "Npc", TalkActorId = 210036},
                {TalkActorType = "Npc", TalkActorId = 210013},
                {TalkActorType = "Npc", TalkActorId = 100001}
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
    ["173010091952515187310"] = {
      isStoryNode = true,
      key = "173010091952515187310",
      type = "StoryNode",
      name = "\229\175\187\230\137\190\231\172\172\228\186\140\229\143\170\230\151\160\231\148\177\231\148\159",
      pos = {x = 2449.879999804772, y = 660.3306504491579},
      propsData = {
        QuestId = 12010407,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_7",
        QuestDeatil = "Content_120104_7",
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
            startQuest = "173010091952515187314",
            startPort = "QuestStart",
            endQuest = "173010091952515187317",
            endPort = "In"
          },
          {
            startQuest = "173010453506017113402",
            startPort = "Out",
            endQuest = "173010467412017498645",
            endPort = "In"
          },
          {
            startQuest = "173010467412017498645",
            startPort = "Out",
            endQuest = "173010478943117884555",
            endPort = "In"
          },
          {
            startQuest = "173010478943117884555",
            startPort = "Out",
            endQuest = "173010518617118655234",
            endPort = "In"
          },
          {
            startQuest = "173010518617118655234",
            startPort = "Out",
            endQuest = "173010521475418655924",
            endPort = "In"
          },
          {
            startQuest = "173010521475418655924",
            startPort = "Out",
            endQuest = "173010091952515187315",
            endPort = "Success"
          },
          {
            startQuest = "174894290692326891304",
            startPort = "Out",
            endQuest = "173010453506017113402",
            endPort = "In"
          },
          {
            startQuest = "173010091952515187317",
            startPort = "Out",
            endQuest = "174894290692326891304",
            endPort = "In"
          },
          {
            startQuest = "173010091952515187314",
            startPort = "QuestStart",
            endQuest = "173010343186216727763",
            endPort = "In"
          },
          {
            startQuest = "173010453506017113402",
            startPort = "Out",
            endQuest = "175369007441029367887",
            endPort = "In"
          }
        },
        nodeData = {
          ["173010091952515187314"] = {
            key = "173010091952515187314",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1802.3146853146854, y = 558.8671328671328},
            propsData = {ModeType = 0}
          },
          ["173010091952515187315"] = {
            key = "173010091952515187315",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3936.4259795938797, y = 487.49644677141765},
            propsData = {ModeType = 0}
          },
          ["173010091952515187316"] = {
            key = "173010091952515187316",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["173010091952515187317"] = {
            key = "173010091952515187317",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\177\177\230\180\158",
            pos = {x = 2101.5061653601015, y = 540.1001618526378},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930104,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010407"
            }
          },
          ["173010343186216727763"] = {
            key = "173010343186216727763",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\151\160\231\148\177\231\148\159\231\154\132\229\163\176\233\159\179",
            pos = {x = 2208.071488925426, y = 307.5238492763252},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12014501,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["173010453506017113402"] = {
            key = "173010453506017113402",
            type = "GoToNode",
            name = "\232\191\155\229\133\165\229\177\177\230\180\158",
            pos = {x = 2671.3545362874206, y = 537.2439829438273},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930105,
              GuideType = "P",
              GuidePointName = "QuestPoint_120104071"
            }
          },
          ["173010467412017498645"] = {
            key = "173010467412017498645",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \232\191\155\232\161\140\232\176\131\233\166\153",
            pos = {x = 2920.1781337425964, y = 531.8929129611782},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12014601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["173010478943117884555"] = {
            key = "173010478943117884555",
            type = "TalkNode",
            name = "\227\128\144\231\142\169\230\179\149\227\128\145-\232\176\131\233\166\153",
            pos = {x = 3172.1139347836606, y = 532.9848736320863},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12023804,
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
          ["173010518617118655234"] = {
            key = "173010518617118655234",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\151\160\231\148\177\231\148\159",
            pos = {x = 3430.027468618247, y = 530.4585578426127},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930106}
            }
          },
          ["173010521475418655924"] = {
            key = "173010521475418655924",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \232\162\171\230\137\190\229\136\176\228\186\134",
            pos = {x = 3687.474837039299, y = 514.5600616020112},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12014701,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["174894290692326891304"] = {
            key = "174894290692326891304",
            type = "TalkNode",
            name = "\227\128\144\231\142\169\230\179\149\227\128\145-\230\184\133\233\153\164\233\154\156\231\162\141",
            pos = {x = 2378.5, y = 529.5},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12023805,
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
          ["175369007441029367887"] = {
            key = "175369007441029367887",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\156\168\229\164\180\228\186\186",
            pos = {x = 2965.5789473684213, y = 311.8432494279177},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12014601,
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
    ["173010536723619426557"] = {
      isStoryNode = true,
      key = "173010536723619426557",
      type = "StoryNode",
      name = "\229\135\187\232\180\165\230\128\170\231\137\169",
      pos = {x = 2729.232983422462, y = 657.3054403651245},
      propsData = {
        QuestId = 12010408,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_8",
        QuestDeatil = "Content_120104_8",
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
        SubRegionId = 104104,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_Cen_01"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173010569555919812994",
            startPort = "Out",
            endQuest = "173010570100419813134",
            endPort = "In"
          },
          {
            startQuest = "173010570100419813134",
            startPort = "Out",
            endQuest = "173010590084121355185",
            endPort = "In"
          },
          {
            startQuest = "173010536723619426561",
            startPort = "QuestStart",
            endQuest = "173010569555919812994",
            endPort = "In"
          },
          {
            startQuest = "173010590084121355185",
            startPort = "Out",
            endQuest = "173010536723619426562",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173010536723619426561"] = {
            key = "173010536723619426561",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2685.6190331407724, y = 473.14974156278504},
            propsData = {ModeType = 0}
          },
          ["173010536723619426562"] = {
            key = "173010536723619426562",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4069.3814842976676, y = 463.5635711039882},
            propsData = {ModeType = 0}
          },
          ["173010536723619426563"] = {
            key = "173010536723619426563",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["173010541196619427235"] = {
            key = "173010541196619427235",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2864.1122259661606, y = 221.98111423359003},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010302"
            }
          },
          ["173010569555919812994"] = {
            key = "173010569555919812994",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3034.408455340651, y = 444.61365077917014},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1930107,
                1930108,
                1930109,
                1930110
              }
            }
          },
          ["173010570100419813134"] = {
            key = "173010570100419813134",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 3341.671740364805, y = 426.0912215176104},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1930107,
                1930108,
                1930109,
                1930110
              }
            }
          },
          ["173010590084121355185"] = {
            key = "173010590084121355185",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\151\160\231\148\177\231\148\159",
            pos = {x = 3699.0659777699125, y = 445.54532779780374},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930106}
            }
          },
          ["173010592903821740993"] = {
            key = "173010592903821740993",
            type = "TalkNode",
            name = "\231\172\172\228\186\140\229\143\170\230\151\160\231\148\177\231\148\159\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 3904.1751910204307, y = 282.2851483637112},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12014801,
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
          ["175368996296829367300"] = {
            key = "175368996296829367300",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2511.2337841523117, y = 293.7821926357395},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2050023,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2050023"
            }
          }
        },
        commentData = {}
      }
    },
    ["173010599735122512093"] = {
      isStoryNode = true,
      key = "173010599735122512093",
      type = "StoryNode",
      name = "\229\175\187\230\137\190\231\172\172\228\184\137\229\143\170\230\151\160\231\148\177\231\148\159",
      pos = {x = 3003.0060256391416, y = 653.7130822999234},
      propsData = {
        QuestId = 12010409,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_9",
        QuestDeatil = "Content_120104_9",
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
            startQuest = "173010639162623285017",
            startPort = "Out",
            endQuest = "173010639162623285018",
            endPort = "In"
          },
          {
            startQuest = "173010599735122512097",
            startPort = "QuestStart",
            endQuest = "173010639162623285017",
            endPort = "In"
          },
          {
            startQuest = "173010682373224443019",
            startPort = "Out",
            endQuest = "173010676212724056818",
            endPort = "In"
          },
          {
            startQuest = "173010676212724056818",
            startPort = "Out",
            endQuest = "173010812007226371875",
            endPort = "In"
          },
          {
            startQuest = "173010812007226371875",
            startPort = "Out",
            endQuest = "173010599735122512098",
            endPort = "Success"
          },
          {
            startQuest = "173010639162623285017",
            startPort = "Out",
            endQuest = "173010682373224443019",
            endPort = "In"
          }
        },
        nodeData = {
          ["173010599735122512097"] = {
            key = "173010599735122512097",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3274.0289710289712, y = 506.5957042957042},
            propsData = {ModeType = 0}
          },
          ["173010599735122512098"] = {
            key = "173010599735122512098",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4645.242353862885, y = 506.81574501703165},
            propsData = {ModeType = 0}
          },
          ["173010599735122512099"] = {
            key = "173010599735122512099",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["173010639162623285017"] = {
            key = "173010639162623285017",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\159\179\231\162\145",
            pos = {x = 3554.1496648430766, y = 496.55159346196365},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930111,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010409"
            }
          },
          ["173010639162623285018"] = {
            key = "173010639162623285018",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\159\165\231\156\139\231\159\179\231\162\145",
            pos = {x = 3774.319506112918, y = 316.75318076355074},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12014901,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["173010676212724056818"] = {
            key = "173010676212724056818",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 4089.7020457954577, y = 509.1881013984715},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210020,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_CheckStele_1930112",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = false,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 12014902,
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
          ["173010682373224443018"] = {
            key = "173010682373224443018",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 3574.9764824698946, y = 832.9664341768042},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010409"
            }
          },
          ["173010682373224443019"] = {
            key = "173010682373224443019",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3850.8737629671755, y = 515.5416367520068},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930112}
            }
          },
          ["173010812007226371875"] = {
            key = "173010812007226371875",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\151\160\231\148\177\231\148\159\232\166\129\231\142\169",
            pos = {x = 4383.402045795458, y = 419.18810139847136},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12015001,
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
    ["173010816968826757896"] = {
      isStoryNode = true,
      key = "173010816968826757896",
      type = "StoryNode",
      name = "\230\137\190\229\136\176\231\172\172\228\184\137\229\143\170\230\151\160\231\148\177\231\148\159",
      pos = {x = 1662.2149182171552, y = 880.9154887170351},
      propsData = {
        QuestId = 12010410,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_10",
        QuestDeatil = "Content_120104_10",
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
        SubRegionId = 104104,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_Cen_01"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173010827440127916162",
            startPort = "Out",
            endQuest = "173010827440127916163",
            endPort = "In"
          },
          {
            startQuest = "173010827440127916163",
            startPort = "Out",
            endQuest = "173010816968826757901",
            endPort = "Success"
          },
          {
            startQuest = "173010816968826757900",
            startPort = "QuestStart",
            endQuest = "175369032524629370826",
            endPort = "In"
          },
          {
            startQuest = "175369032524629370826",
            startPort = "Out",
            endQuest = "173010827440127916162",
            endPort = "In"
          }
        },
        nodeData = {
          ["173010816968826757900"] = {
            key = "173010816968826757900",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3044.981351981352, y = 520.1671328671328},
            propsData = {ModeType = 0}
          },
          ["173010816968826757901"] = {
            key = "173010816968826757901",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4156.8048538628855, y = 515.2532450170316},
            propsData = {ModeType = 0}
          },
          ["173010816968826757902"] = {
            key = "173010816968826757902",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["173010827440127916161"] = {
            key = "173010827440127916161",
            type = "GoToNode",
            name = "\229\188\128\229\144\175\233\166\153\231\130\137",
            pos = {x = 3159.306442705736, y = 241.96154168367622},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930113,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010410"
            }
          },
          ["173010827440127916162"] = {
            key = "173010827440127916162",
            type = "TalkNode",
            name = "\227\128\144\231\142\169\230\179\149\227\128\145-\232\176\131\233\166\153",
            pos = {x = 3568.0356677290793, y = 504.7850710954408},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12023804,
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
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["173010827440127916163"] = {
            key = "173010827440127916163",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\231\172\172\228\184\137\229\143\170\230\151\160\231\148\177\231\148\159\228\186\164\230\181\129",
            pos = {x = 3866.4404296338407, y = 508.11840442877417},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210045,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Wuyousheng_2050024",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12015101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_40",
              BlendInTime = 0,
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
                  TalkActorId = 210013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210038,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 210013},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210038}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175369032524629370826"] = {
            key = "175369032524629370826",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3308.3333333333335, y = 510.6666666666667},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2050024}
            }
          }
        },
        commentData = {}
      }
    },
    ["173010907117129846419"] = {
      isStoryNode = true,
      key = "173010907117129846419",
      type = "StoryNode",
      name = "\232\191\148\229\155\158\231\165\173\229\143\176",
      pos = {x = 1931.6473872374606, y = 874.2872030816894},
      propsData = {
        QuestId = 12010411,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_11",
        QuestDeatil = "Content_120104_11",
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
            startQuest = "173010907117129846423",
            startPort = "QuestStart",
            endQuest = "173010907117129846426",
            endPort = "In"
          },
          {
            startQuest = "173010907117129846426",
            startPort = "Out",
            endQuest = "173010907117129846428",
            endPort = "In"
          },
          {
            startQuest = "173010907117129846428",
            startPort = "Out",
            endQuest = "17527347615193451",
            endPort = "In"
          },
          {
            startQuest = "17527347615193451",
            startPort = "Out",
            endQuest = "173010907117129846424",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173010907117129846423"] = {
            key = "173010907117129846423",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3053.3146853146854, y = 515.1671328671328},
            propsData = {ModeType = 0}
          },
          ["173010907117129846424"] = {
            key = "173010907117129846424",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4154.404853862886, y = 515.2532450170316},
            propsData = {ModeType = 0}
          },
          ["173010907117129846425"] = {
            key = "173010907117129846425",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4237.21390273013, y = 890.3435935261493},
            propsData = {}
          },
          ["173010907117129846426"] = {
            key = "173010907117129846426",
            type = "GoToNode",
            name = "\232\191\148\229\155\158\231\165\173\229\143\176",
            pos = {x = 3324.3848740782855, y = 513.6739599843298},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930100,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010406"
            }
          },
          ["173010907117129846428"] = {
            key = "173010907117129846428",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \233\155\134\233\189\144\230\151\160\231\148\177\231\148\159\228\186\134",
            pos = {x = 3604.462996921626, y = 513.1552574308446},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12015201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_41",
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
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210013,
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
                {TalkActorType = "Npc", TalkActorId = 210013},
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
          ["173010940401331005950"] = {
            key = "173010940401331005950",
            type = "TalkNode",
            name = "\227\128\144SC008\227\128\145\230\151\160\231\148\177\231\148\159\232\144\165\229\156\176\229\143\152\230\141\162",
            pos = {x = 3867.9675838482367, y = 297.91983585045665},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022518,
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
          ["17527347615193451"] = {
            key = "17527347615193451",
            type = "TalkNode",
            name = "\227\128\144SC008\227\128\145\230\151\160\231\148\177\231\148\159\232\144\165\229\156\176\229\188\128\229\144\175",
            pos = {x = 3874.9974937343354, y = 512.8571428571429},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/Ver01/Ver0101/Ver0101_SC008/SQ_Ver0101_SC008",
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
          }
        },
        commentData = {}
      }
    },
    ["17302563218121973"] = {
      isStoryNode = true,
      key = "17302563218121973",
      type = "StoryNode",
      name = "\229\146\140\230\151\160\231\148\177\231\148\159\233\149\191\232\128\129\229\175\185\232\175\157",
      pos = {x = 2194.38630077812, y = 874.1504909371628},
      propsData = {
        QuestId = 12010412,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_12",
        QuestDeatil = "Content_120104_12",
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
        SubRegionId = 104104,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12010412"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1730256603763391847",
            startPort = "Out",
            endQuest = "17302568818361168471",
            endPort = "In"
          },
          {
            startQuest = "17302563218121977",
            startPort = "QuestStart",
            endQuest = "1730256603763391847",
            endPort = "In"
          },
          {
            startQuest = "17302568818361168471",
            startPort = "Out",
            endQuest = "17302563218121978",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17302563218121977"] = {
            key = "17302563218121977",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3227.171828171828, y = 530.8814185814184},
            propsData = {ModeType = 0}
          },
          ["17302563218121978"] = {
            key = "17302563218121978",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4175.392077450109, y = 519.6021393659261},
            propsData = {ModeType = 0}
          },
          ["17302563218121979"] = {
            key = "17302563218121979",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1730256603763391846"] = {
            key = "1730256603763391846",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 3245.608329884326, y = 359.3206574997845},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 0,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1730256603763391847"] = {
            key = "1730256603763391847",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3509.791324667321, y = 520.8958600749871},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930122}
            }
          },
          ["17302568818361168471"] = {
            key = "17302568818361168471",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\233\149\191\232\128\129\230\151\160\231\148\177\231\148\159\229\175\185\232\175\157",
            pos = {x = 3830.1171349681317, y = 513.537104941232},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210040,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_ElderWuyousheng_1930122",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12015501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_42",
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
                  TalkActorId = 210040,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210013,
                  TalkActorVisible = true
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
                {TalkActorType = "Npc", TalkActorId = 210040},
                {TalkActorType = "Npc", TalkActorId = 210013},
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
          ["17302573090752332516"] = {
            key = "17302573090752332516",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 4086.5697445207406, y = 390.90396139558834},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930122}
            }
          }
        },
        commentData = {}
      }
    },
    ["17302573573652721009"] = {
      isStoryNode = true,
      key = "17302573573652721009",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\128\145\229\184\131",
      pos = {x = 2450.6769624371123, y = 877.8632991275311},
      propsData = {
        QuestId = 12010413,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_13",
        QuestDeatil = "Content_120104_13",
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
            startQuest = "17302575078283110473",
            startPort = "Out",
            endQuest = "17302575078283110474",
            endPort = "In"
          },
          {
            startQuest = "17302573573652721013",
            startPort = "QuestStart",
            endQuest = "17302575078283110473",
            endPort = "In"
          },
          {
            startQuest = "17302575078283110474",
            startPort = "Out",
            endQuest = "17302573573652721014",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17302573573652721013"] = {
            key = "17302573573652721013",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3627.1856530566206, y = 483.231648996165},
            propsData = {ModeType = 0}
          },
          ["17302573573652721014"] = {
            key = "17302573573652721014",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4447.004980675916, y = 486.9892361401196},
            propsData = {ModeType = 0}
          },
          ["17302573573652721015"] = {
            key = "17302573573652721015",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17302575078283110473"] = {
            key = "17302575078283110473",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\128\145\229\184\131\229\164\132",
            pos = {x = 3880.8228970187997, y = 483.6356271292751},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930126,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010413"
            }
          },
          ["17302575078283110474"] = {
            key = "17302575078283110474",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\188\128\229\167\139\233\135\135\233\155\134",
            pos = {x = 4164.081818633261, y = 482.254507781115},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12015601,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_43",
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
                  TalkActorId = 210013,
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
                {TalkActorType = "Npc", TalkActorId = 210013},
                {TalkActorType = "Npc", TalkActorId = 100001}
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
    ["17302585392454276941"] = {
      isStoryNode = true,
      key = "17302585392454276941",
      type = "StoryNode",
      name = "\233\135\135\233\155\134\229\191\152\229\191\167\232\141\137",
      pos = {x = 2735.588899992305, y = 867.4578403796138},
      propsData = {
        QuestId = 12010414,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_14",
        QuestDeatil = "Content_120104_14",
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
        SubRegionId = 104104,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_12010413"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17302723139805443403",
            startPort = "Out",
            endQuest = "17302723139805443404",
            endPort = "In"
          },
          {
            startQuest = "17302585392454276945",
            startPort = "QuestStart",
            endQuest = "17302723139805443403",
            endPort = "In"
          },
          {
            startQuest = "17302723139805443404",
            startPort = "Out",
            endQuest = "175369147204430372635",
            endPort = "In"
          },
          {
            startQuest = "175369147204430372635",
            startPort = "Out",
            endQuest = "17302734451137790374",
            endPort = "In"
          },
          {
            startQuest = "17302734451137790374",
            startPort = "Out",
            endQuest = "175369212072130375623",
            endPort = "In"
          },
          {
            startQuest = "175369212072130375623",
            startPort = "Out",
            endQuest = "17302585392454276946",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17302585392454276945"] = {
            key = "17302585392454276945",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3590.757081628049, y = 511.08879185330784},
            propsData = {ModeType = 0}
          },
          ["17302585392454276946"] = {
            key = "17302585392454276946",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 5241.58160405254, y = 511.0814439323273},
            propsData = {ModeType = 0}
          },
          ["17302585392454276947"] = {
            key = "17302585392454276947",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 5197.2853313015585, y = 683.1293078118636},
            propsData = {}
          },
          ["17302723139805443403"] = {
            key = "17302723139805443403",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 3854.175795499469, y = 510.98350303395307},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104104,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010413"
            }
          },
          ["17302723139805443404"] = {
            key = "17302723139805443404",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\143\231\153\189\229\146\140\230\137\182\231\150\143",
            pos = {x = 4145.77307599675, y = 515.0872770377271},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930133, 1930130}
            }
          },
          ["17302733114866227267"] = {
            key = "17302733114866227267",
            type = "GoToNode",
            name = "\233\135\135\233\155\134\230\151\160\229\191\167\232\141\137",
            pos = {x = 4464.770020665268, y = 270.43600892495976},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930132,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010414"
            }
          },
          ["17302734451137790374"] = {
            key = "17302734451137790374",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \228\189\160\232\191\135\230\157\165\229\149\138",
            pos = {x = 4716.378101473348, y = 460.3433682323193},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12015701,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["175369147204430372635"] = {
            key = "175369147204430372635",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 4433.238157894737, y = 486.46967418546376},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {
                2110027,
                2110028,
                2110029,
                2110030
              },
              QuestPickupId = -1,
              UnitId = 10059,
              UnitCount = 4,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010414",
              IsUseCount = false
            }
          },
          ["175369212072130375623"] = {
            key = "175369212072130375623",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\143\231\153\189\229\146\140\230\137\182\231\150\143",
            pos = {x = 4995.352443609022, y = 480.64110275689234},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930133, 1930130}
            }
          }
        },
        commentData = {}
      }
    },
    ["17302735353198572270"] = {
      isStoryNode = true,
      key = "17302735353198572270",
      type = "StoryNode",
      name = "\229\142\187\231\156\139\231\156\139\229\176\143\231\153\189\229\156\168\229\185\178\229\152\155",
      pos = {x = 3011.1007223611455, y = 868.7609439298435},
      propsData = {
        QuestId = 12010415,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_15",
        QuestDeatil = "Content_120104_15",
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
            startQuest = "173027433731110136781",
            startPort = "Out",
            endQuest = "173027449483111309873",
            endPort = "In"
          },
          {
            startQuest = "1734524506054918570",
            startPort = "Out",
            endQuest = "173027433731110136781",
            endPort = "In"
          },
          {
            startQuest = "173027449483111309873",
            startPort = "Out",
            endQuest = "174900257464428681634",
            endPort = "In"
          },
          {
            startQuest = "174900257464428681634",
            startPort = "Out",
            endQuest = "17302735353198572275",
            endPort = "Success"
          },
          {
            startQuest = "17302735353198572274",
            startPort = "QuestStart",
            endQuest = "1753194837807978114",
            endPort = "In"
          },
          {
            startQuest = "1753194837807978114",
            startPort = "Out",
            endQuest = "1734524506054918570",
            endPort = "In"
          }
        },
        nodeData = {
          ["17302735353198572274"] = {
            key = "17302735353198572274",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3765.7587830799544, y = 536.2073263360664},
            propsData = {ModeType = 0}
          },
          ["17302735353198572275"] = {
            key = "17302735353198572275",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 5424.663469129112, y = 539.2294968225137},
            propsData = {
              ModeType = 1,
              Id = 104301,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17302735353198572276"] = {
            key = "17302735353198572276",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 5430.83944385567, y = 677.053550236106},
            propsData = {}
          },
          ["173027433731110136781"] = {
            key = "173027433731110136781",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\176\143\231\153\189\229\175\185\232\175\157",
            pos = {x = 4550.028933009348, y = 526.5804245513791},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12015801,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_44",
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
          ["173027449483111309873"] = {
            key = "173027449483111309873",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\137\182\231\150\143\229\146\140\229\176\143\231\153\189\229\175\185\232\175\157",
            pos = {x = 4831.957507060146, y = 522.9856311420247},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12015901,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_45",
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
                  TalkActorId = 210013,
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
                {TalkActorType = "Npc", TalkActorId = 210013},
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
          ["1734524506054918570"] = {
            key = "1734524506054918570",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\143\231\153\189\229\146\140\230\137\182\231\150\143",
            pos = {x = 4297.537593984962, y = 521.5526315789473},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930133, 1930130}
            }
          },
          ["174900257464428681634"] = {
            key = "174900257464428681634",
            type = "TalkNode",
            name = "\227\128\144\228\184\180\230\151\182\227\128\145-\232\191\155\229\133\165\229\185\187\229\162\131",
            pos = {x = 5121.109244168135, y = 525.8553484698994},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12023806,
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
          ["1753194837807978114"] = {
            key = "1753194837807978114",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 4035.287593984962, y = 532.8026315789473},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104104,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010413"
            }
          }
        },
        commentData = {}
      }
    },
    ["173027635516714048439"] = {
      isStoryNode = true,
      key = "173027635516714048439",
      type = "StoryNode",
      name = "\230\137\182\231\150\143\229\137\175\230\156\172II",
      pos = {x = 3580.4192914111036, y = 862.5224647508725},
      propsData = {
        QuestId = 12010417,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_16",
        QuestDeatil = "Content_120104_16",
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
        IsFairyLand = true,
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = "0"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17345244024126706",
            startPort = "Fail",
            endQuest = "17345244251297128",
            endPort = "In"
          },
          {
            startQuest = "17345244024126706",
            startPort = "Success",
            endQuest = "173027635516714048444",
            endPort = "Success"
          },
          {
            startQuest = "17345244251297128",
            startPort = "Out",
            endQuest = "173027635516714048445",
            endPort = "Fail"
          },
          {
            startQuest = "17345244024126706",
            startPort = "PassiveFail",
            endQuest = "173027635516714048445",
            endPort = "Fail"
          },
          {
            startQuest = "175369280646431380705",
            startPort = "Out",
            endQuest = "175369280646431380707",
            endPort = "In"
          },
          {
            startQuest = "175369280646431380706",
            startPort = "LastDefaultOut",
            endQuest = "175369280646431380705",
            endPort = "In"
          },
          {
            startQuest = "173027635516714048443",
            startPort = "QuestStart",
            endQuest = "175369280646431380706",
            endPort = "In"
          },
          {
            startQuest = "173027635516714048443",
            startPort = "QuestStart",
            endQuest = "175369282260031381258",
            endPort = "In"
          },
          {
            startQuest = "175369282260031381258",
            startPort = "Out",
            endQuest = "17345244024126706",
            endPort = "In"
          }
        },
        nodeData = {
          ["173027635516714048443"] = {
            key = "173027635516714048443",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3787.5588609260853, y = 604.3115233086844},
            propsData = {ModeType = 0}
          },
          ["173027635516714048444"] = {
            key = "173027635516714048444",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4891.304487770454, y = 397.1271789595504},
            propsData = {
              ModeType = 1,
              Id = 105001,
              StartIndex = 1,
              IsWhite = true
            }
          },
          ["173027635516714048445"] = {
            key = "173027635516714048445",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4885.4490496159115, y = 671.3530269239675},
            propsData = {}
          },
          ["17345244024126706"] = {
            key = "17345244024126706",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 4448.181027650246, y = 468.2833508058},
            propsData = {SpecialConfigId = 2002, BlackScreenImmediately = false}
          },
          ["17345244251297128"] = {
            key = "17345244251297128",
            type = "SkipRegionNode",
            name = "\233\128\129\229\155\158\229\185\187\229\162\131\229\164\150",
            pos = {x = 4887.127986580812, y = 536.1150289516895},
            propsData = {
              ModeType = 1,
              Id = 104104,
              StartIndex = 1,
              IsWhite = true
            }
          },
          ["17358093693935785"] = {
            key = "17358093693935785",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 5083.989300173511, y = 999.6217466743783},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17363343102362415"] = {
            key = "17363343102362415",
            type = "CommonBlackFadeInOutNode",
            name = "\229\175\185\232\175\157\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = 4403.6146240254375, y = 187.02919062361804},
            propsData = {FadeTime = 0, FadeType = "FadeIn"}
          },
          ["175369280646431380705"] = {
            key = "175369280646431380705",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 4348.185169423471, y = 806.8279152473638},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2050010,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2050010"
            }
          },
          ["175369280646431380706"] = {
            key = "175369280646431380706",
            type = "JudgeRegionNode",
            name = "\229\136\164\230\150\173\228\189\141\228\186\142\229\140\186\229\159\159",
            pos = {x = 4061.2551878581635, y = 748.5433780242134},
            propsData = {
              IsWaitingEnterRegion = false,
              RegionIds = {104401}
            }
          },
          ["175369280646431380707"] = {
            key = "175369280646431380707",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 4626.5342858260465, y = 795.3820605722777},
            propsData = {
              ModeType = 1,
              Id = 104401,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["175369282260031381258"] = {
            key = "175369282260031381258",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 4120.21052631579, y = 487.7521929824562},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104401,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = "QuestPoint_Nai02StartPoint"
            }
          }
        },
        commentData = {}
      }
    },
    ["173027672468215615090"] = {
      isStoryNode = true,
      key = "173027672468215615090",
      type = "StoryNode",
      name = "\231\187\147\230\157\159\229\144\142\229\175\185\232\175\157",
      pos = {x = 4079.3776647688765, y = 862.2887910559955},
      propsData = {
        QuestId = 12010419,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_17",
        QuestDeatil = "Content_120104_17",
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
            startQuest = "173027672468315615094",
            startPort = "QuestStart",
            endQuest = "173027672468315615097",
            endPort = "In"
          },
          {
            startQuest = "173027672468315615097",
            startPort = "Out",
            endQuest = "173027733748216399452",
            endPort = "In"
          },
          {
            startQuest = "173027733748216399452",
            startPort = "Out",
            endQuest = "173027672468315615095",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173027672468315615094"] = {
            key = "173027672468315615094",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 4222.535098869428, y = 536.2073263360664},
            propsData = {ModeType = 0}
          },
          ["173027672468315615095"] = {
            key = "173027672468315615095",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 5092.546983931281, y = 531.41937496681},
            propsData = {ModeType = 0}
          },
          ["173027672468315615096"] = {
            key = "173027672468315615096",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 5405.142474158701, y = 660.6293078118636},
            propsData = {}
          },
          ["173027672468315615097"] = {
            key = "173027672468315615097",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 4499.419784687234, y = 529.2368861716812},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104104,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010413"
            }
          },
          ["173027733748216399452"] = {
            key = "173027733748216399452",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\188\128\229\167\139\233\135\135\233\155\134",
            pos = {x = 4793.663869902277, y = 526.7735872201793},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12018300,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_46",
              BlendInTime = 0,
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
                  TalkActorId = 210013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210017,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210013},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210017}
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
    ["1732783210844555876"] = {
      isStoryNode = true,
      key = "1732783210844555876",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1340.7961565563044, y = 367.10530727760624},
      propsData = {QuestChainId = 120104},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783210844555877"] = {
      isStoryNode = true,
      key = "1732783210844555877",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 4755.177517572671, y = 899.0606464593801},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17351194070383272"] = {
      isStoryNode = true,
      key = "17351194070383272",
      type = "StoryNode",
      name = "\230\137\182\231\150\143\229\137\175\230\156\172I",
      pos = {x = 3321.27511703758, y = 862.5127525931374},
      propsData = {
        QuestId = 12010416,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_16",
        QuestDeatil = "Content_120104_16",
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
        IsFairyLand = true,
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = "0"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17351194070383279",
            startPort = "Fail",
            endQuest = "17351194070383280",
            endPort = "In"
          },
          {
            startQuest = "17351194070383279",
            startPort = "Success",
            endQuest = "17351194070383277",
            endPort = "Success"
          },
          {
            startQuest = "17351194070383280",
            startPort = "Out",
            endQuest = "17351194070383278",
            endPort = "Fail"
          },
          {
            startQuest = "17351194070383279",
            startPort = "PassiveFail",
            endQuest = "17351194070383278",
            endPort = "Fail"
          },
          {
            startQuest = "1750129541947950938",
            startPort = "LastDefaultOut",
            endQuest = "1750129445993949883",
            endPort = "In"
          },
          {
            startQuest = "1750129445993949883",
            startPort = "Out",
            endQuest = "1750129971090953652",
            endPort = "In"
          },
          {
            startQuest = "17351194070383276",
            startPort = "QuestStart",
            endQuest = "175369257175831378307",
            endPort = "In"
          },
          {
            startQuest = "175369257175831378307",
            startPort = "Out",
            endQuest = "17351194070383279",
            endPort = "In"
          },
          {
            startQuest = "17351194070383276",
            startPort = "QuestStart",
            endQuest = "175369254198831377704",
            endPort = "In"
          },
          {
            startQuest = "17501311223452215163",
            startPort = "Out",
            endQuest = "175369262237031379051",
            endPort = "In"
          },
          {
            startQuest = "175369254198831377704",
            startPort = "LastDefaultOut",
            endQuest = "17501311223452215163",
            endPort = "In"
          }
        },
        nodeData = {
          ["17351194070383276"] = {
            key = "17351194070383276",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3773.0986000421685, y = 557.2934953729791},
            propsData = {ModeType = 0}
          },
          ["17351194070383277"] = {
            key = "17351194070383277",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4932.4558035599275, y = 475.13704738060306},
            propsData = {
              ModeType = 1,
              Id = 104401,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17351194070383278"] = {
            key = "17351194070383278",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4951.811903866923, y = 785.4494338065585},
            propsData = {}
          },
          ["17351194070383279"] = {
            key = "17351194070383279",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 4483.786696295101, y = 541.8668213969936},
            propsData = {SpecialConfigId = 2001, BlackScreenImmediately = false}
          },
          ["17351194070383280"] = {
            key = "17351194070383280",
            type = "SkipRegionNode",
            name = "\233\128\129\229\155\158\229\185\187\229\162\131\229\164\150",
            pos = {x = 4943.20718698567, y = 630.8075896804344},
            propsData = {
              ModeType = 1,
              Id = 104104,
              StartIndex = 1,
              IsWhite = true
            }
          },
          ["1737017972192966910"] = {
            key = "1737017972192966910",
            type = "CommonBlackFadeInOutNode",
            name = "\229\175\185\232\175\157\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = 4504.007492507491, y = 207.46053946053956},
            propsData = {FadeTime = 0, FadeType = "FadeIn"}
          },
          ["1750129445993949883"] = {
            key = "1750129445993949883",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 3744.5368070049703, y = 1212.5436127088014},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2050010,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2050010"
            }
          },
          ["1750129541947950938"] = {
            key = "1750129541947950938",
            type = "JudgeRegionNode",
            name = "\229\136\164\230\150\173\228\189\141\228\186\142\229\140\186\229\159\159",
            pos = {x = 3472.323928217092, y = 1123.034365828231},
            propsData = {
              IsWaitingEnterRegion = true,
              RegionIds = {104301}
            }
          },
          ["1750129971090953652"] = {
            key = "1750129971090953652",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 4007.6380194552953, y = 1223.088002152967},
            propsData = {
              ModeType = 1,
              Id = 104301,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17501311223452215163"] = {
            key = "17501311223452215163",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 4385.177225272978, y = 812.1171804048145},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2050010,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2050010"
            }
          },
          ["175369254198831377704"] = {
            key = "175369254198831377704",
            type = "JudgeRegionNode",
            name = "\229\136\164\230\150\173\228\189\141\228\186\142\229\140\186\229\159\159",
            pos = {x = 4129.826191076092, y = 769.6221168658745},
            propsData = {
              IsWaitingEnterRegion = false,
              RegionIds = {104301}
            }
          },
          ["175369257175831378307"] = {
            key = "175369257175831378307",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 4140.276913757934, y = 532.6621724116505},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104301,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = "QuestPoint_Nai01StartPoint"
            }
          },
          ["175369262237031379051"] = {
            key = "175369262237031379051",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 4669.842131149238, y = 819.618694150781},
            propsData = {
              ModeType = 1,
              Id = 104301,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17356291677822814833"] = {
      isStoryNode = true,
      key = "17356291677822814833",
      type = "StoryNode",
      name = "\230\137\182\231\150\143\229\137\175\230\156\172II\230\142\168\232\136\185\229\144\142",
      pos = {x = 3361.123137773044, y = 1220.8667769839528},
      propsData = {
        QuestId = 12010420,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_16",
        QuestDeatil = "Content_120104_16",
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
        IsFairyLand = true,
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = "0"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17356291677822814837",
            startPort = "QuestStart",
            endQuest = "17356291677822814840",
            endPort = "In"
          },
          {
            startQuest = "17356291677822814840",
            startPort = "Fail",
            endQuest = "17356291677822814841",
            endPort = "In"
          },
          {
            startQuest = "17356291677822814840",
            startPort = "Success",
            endQuest = "17356291677822814838",
            endPort = "Success"
          },
          {
            startQuest = "17356291677822814841",
            startPort = "Out",
            endQuest = "17356291677822814839",
            endPort = "Fail"
          },
          {
            startQuest = "17356291677822814840",
            startPort = "PassiveFail",
            endQuest = "1735809388886931474",
            endPort = "In"
          },
          {
            startQuest = "1735809388886931474",
            startPort = "Out",
            endQuest = "17356291677822814839",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17356291677822814837"] = {
            key = "17356291677822814837",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 4234.757321091651, y = 543.9851041138443},
            propsData = {ModeType = 0}
          },
          ["17356291677822814838"] = {
            key = "17356291677822814838",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4761.8308035599275, y = 476.07454738060306},
            propsData = {ModeType = 0}
          },
          ["17356291677822814839"] = {
            key = "17356291677822814839",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 5027.2864021946825, y = 616.1465491911739},
            propsData = {}
          },
          ["17356291677822814840"] = {
            key = "17356291677822814840",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 4508.126271193887, y = 544.1264367816091},
            propsData = {SpecialConfigId = 2003, BlackScreenImmediately = false}
          },
          ["17356291677822814841"] = {
            key = "17356291677822814841",
            type = "SkipRegionNode",
            name = "\233\128\129\229\155\158\229\185\187\229\162\131\229\164\150",
            pos = {x = 4757.654302370285, y = 615.0623973727421},
            propsData = {
              ModeType = 1,
              Id = 104101,
              StartIndex = 14,
              IsWhite = true
            }
          },
          ["1735809388886931474"] = {
            key = "1735809388886931474",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 4765.269736842106, y = 756.0620300751879},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17494489864357457007"] = {
      isStoryNode = true,
      key = "17494489864357457007",
      type = "StoryNode",
      name = "\229\142\187\231\156\139\231\156\139\229\176\143\231\153\189\229\156\168\229\185\178\229\152\155\239\188\136\229\164\135\228\187\189\239\188\137",
      pos = {x = 4090.3780959752326, y = 1157.2120743034056},
      propsData = {
        QuestId = 12010415,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_15",
        QuestDeatil = "Content_120104_15",
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
            startQuest = "17494489864367457015",
            startPort = "Out",
            endQuest = "17494489864367457016",
            endPort = "In"
          },
          {
            startQuest = "17494489864357457012",
            startPort = "QuestStart",
            endQuest = "17494489864367457017",
            endPort = "In"
          },
          {
            startQuest = "17494489864367457017",
            startPort = "Out",
            endQuest = "17494489864367457015",
            endPort = "In"
          },
          {
            startQuest = "17494489864367457016",
            startPort = "Out",
            endQuest = "17494489864367457018",
            endPort = "In"
          },
          {
            startQuest = "17494489864367457018",
            startPort = "Out",
            endQuest = "17494489864357457013",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17494489864357457012"] = {
            key = "17494489864357457012",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3992.0087830799544, y = 536.2073263360664},
            propsData = {ModeType = 0}
          },
          ["17494489864357457013"] = {
            key = "17494489864357457013",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 5408.147340096853, y = 533.4230452096106},
            propsData = {
              ModeType = 1,
              Id = 104401,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17494489864357457014"] = {
            key = "17494489864357457014",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 5412.506110522337, y = 673.7202169027727},
            propsData = {}
          },
          ["17494489864367457015"] = {
            key = "17494489864367457015",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\176\143\231\153\189\229\175\185\232\175\157",
            pos = {x = 4551.528933009348, y = 525.0804245513791},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12015801,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_44",
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
          ["17494489864367457016"] = {
            key = "17494489864367457016",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\137\182\231\150\143\229\146\140\229\176\143\231\153\189\229\175\185\232\175\157",
            pos = {x = 4832.457507060146, y = 523.6522978086913},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12015901,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_45",
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
                  TalkActorId = 210013,
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
                {TalkActorType = "Npc", TalkActorId = 210013},
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
          ["17494489864367457017"] = {
            key = "17494489864367457017",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\143\231\153\189\229\146\140\230\137\182\231\150\143",
            pos = {x = 4299.037593984962, y = 536.5526315789473},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930133, 1930130}
            }
          },
          ["17494489864367457018"] = {
            key = "17494489864367457018",
            type = "TalkNode",
            name = "\227\128\144\228\184\180\230\151\182\227\128\145-\232\191\155\229\133\165\229\185\187\229\162\131",
            pos = {x = 5109.304896342048, y = 523.8553484698994},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12023806,
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
          }
        },
        commentData = {}
      }
    },
    ["1749638981422935870"] = {
      isStoryNode = true,
      key = "1749638981422935870",
      type = "StoryNode",
      name = "\230\137\182\231\150\143\229\137\175\230\156\172III",
      pos = {x = 3825.280610979723, y = 861.2924993385789},
      propsData = {
        QuestId = 12010418,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_16",
        QuestDeatil = "Content_120104_16",
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
        IsFairyLand = true,
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = "0"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1749638981422935878",
            startPort = "Fail",
            endQuest = "1749638981423935879",
            endPort = "In"
          },
          {
            startQuest = "1749638981422935878",
            startPort = "Success",
            endQuest = "1749638981422935876",
            endPort = "Success"
          },
          {
            startQuest = "1749638981423935879",
            startPort = "Out",
            endQuest = "1749638981422935877",
            endPort = "Fail"
          },
          {
            startQuest = "1749638981422935878",
            startPort = "PassiveFail",
            endQuest = "1749638981422935877",
            endPort = "Fail"
          },
          {
            startQuest = "1749638981422935875",
            startPort = "QuestStart",
            endQuest = "175369287638531382512",
            endPort = "In"
          },
          {
            startQuest = "175369287638531382512",
            startPort = "Out",
            endQuest = "1749638981422935878",
            endPort = "In"
          },
          {
            startQuest = "175369290259231383431",
            startPort = "Out",
            endQuest = "175369290259231383433",
            endPort = "In"
          },
          {
            startQuest = "175369290259231383432",
            startPort = "LastDefaultOut",
            endQuest = "175369290259231383431",
            endPort = "In"
          },
          {
            startQuest = "1749638981422935875",
            startPort = "QuestStart",
            endQuest = "175369290259231383432",
            endPort = "In"
          }
        },
        nodeData = {
          ["1749638981422935875"] = {
            key = "1749638981422935875",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3697.776364913326, y = 649.6810076255371},
            propsData = {ModeType = 0}
          },
          ["1749638981422935876"] = {
            key = "1749638981422935876",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4759.3308035599275, y = 476.07454738060306},
            propsData = {
              ModeType = 1,
              Id = 104104,
              StartIndex = 1,
              IsWhite = true
            }
          },
          ["1749638981422935877"] = {
            key = "1749638981422935877",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4767.975365405385, y = 756.3003953450201},
            propsData = {}
          },
          ["1749638981422935878"] = {
            key = "1749638981422935878",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 4407.312606597614, y = 544.1960302316373},
            propsData = {SpecialConfigId = 2003, BlackScreenImmediately = false}
          },
          ["1749638981423935879"] = {
            key = "1749638981423935879",
            type = "SkipRegionNode",
            name = "\233\128\129\229\155\158\229\185\187\229\162\131\229\164\150",
            pos = {x = 4757.654302370285, y = 615.0623973727421},
            propsData = {
              ModeType = 1,
              Id = 104104,
              StartIndex = 1,
              IsWhite = true
            }
          },
          ["1749638981423935880"] = {
            key = "1749638981423935880",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 4471.2524580682475, y = 1297.5164835164835},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["1749638981423935881"] = {
            key = "1749638981423935881",
            type = "CommonBlackFadeInOutNode",
            name = "\229\175\185\232\175\157\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = 4458.417255604385, y = 309.1344537815128},
            propsData = {FadeTime = 0, FadeType = "FadeIn"}
          },
          ["175369287638531382512"] = {
            key = "175369287638531382512",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 4085.3981018981012, y = 559.218031968032},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 105001,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["175369290259231383431"] = {
            key = "175369290259231383431",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 4306.438534479467, y = 846.8603005796072},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2050010,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2050010"
            }
          },
          ["175369290259231383432"] = {
            key = "175369290259231383432",
            type = "JudgeRegionNode",
            name = "\229\136\164\230\150\173\228\189\141\228\186\142\229\140\186\229\159\159",
            pos = {x = 4063.2585529141597, y = 771.0757633564568},
            propsData = {
              IsWaitingEnterRegion = false,
              RegionIds = {105001}
            }
          },
          ["175369290259231383433"] = {
            key = "175369290259231383433",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 4566.037650882043, y = 944.1644459045211},
            propsData = {
              ModeType = 1,
              Id = 105001,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["175369329747333382459"] = {
      isStoryNode = true,
      key = "175369329747333382459",
      type = "StoryNode",
      name = "\229\174\140\230\136\144UI",
      pos = {x = 4348.767980533175, y = 861.8560683998998},
      propsData = {
        QuestId = 12010420,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120104_17",
        QuestDeatil = "Content_120104_17",
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
        SubRegionId = 104104,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_Cen_01"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175369329747333382464",
            startPort = "QuestStart",
            endQuest = "175369333814033383556",
            endPort = "In"
          },
          {
            startQuest = "175369333814033383556",
            startPort = "Out",
            endQuest = "175369329747333382465",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175369329747333382464"] = {
            key = "175369329747333382464",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 4222.535098869428, y = 536.2073263360664},
            propsData = {ModeType = 0}
          },
          ["175369329747333382465"] = {
            key = "175369329747333382465",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 5092.546983931281, y = 531.41937496681},
            propsData = {ModeType = 0}
          },
          ["175369329747333382466"] = {
            key = "175369329747333382466",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 5405.142474158701, y = 660.6293078118636},
            propsData = {}
          },
          ["175369333814033383556"] = {
            key = "175369333814033383556",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 4663.329168509509, y = 516.2179898275099},
            propsData = {WaitTime = 2}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {
    ["17483148147602655320"] = {
      key = "17483148147602655320",
      name = "\229\185\187\229\162\131",
      position = {x = 3294.256465373713, y = 728.9343672592491},
      size = {width = 1409.2615151594616, height = 359.6002725692223}
    },
    ["17483148599682656730"] = {
      key = "17483148599682656730",
      name = "\229\140\187\233\166\134",
      position = {x = 1607.0878700743951, y = 244.3136441496313},
      size = {width = 842.7837337345926, height = 286.0897835372329}
    },
    ["17483149530482659000"] = {
      key = "17483149530482659000",
      name = "\230\151\160\231\148\177\231\148\159\232\144\165\229\156\176",
      position = {x = 1610.502536273723, y = 566.9407578825804},
      size = {width = 1651.5983040624114, height = 492.063793938148}
    }
  }
}
