return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1730277995070232",
      startPort = "Success",
      endStory = "173027955144018163246",
      endPort = "In"
    },
    {
      startStory = "173027955144018163246",
      startPort = "Success",
      endStory = "1730376039493867",
      endPort = "In"
    },
    {
      startStory = "17304428894433154527",
      startPort = "Success",
      endStory = "17306883504171157",
      endPort = "In"
    },
    {
      startStory = "17306883504171157",
      startPort = "Success",
      endStory = "1730705513160408128",
      endPort = "In"
    },
    {
      startStory = "1730705513160408128",
      startPort = "Success",
      endStory = "17307071240024021459",
      endPort = "In"
    },
    {
      startStory = "17307071240024021459",
      startPort = "Success",
      endStory = "17307087592547637445",
      endPort = "In"
    },
    {
      startStory = "17307087592547637445",
      startPort = "Success",
      endStory = "17307092432499648427",
      endPort = "In"
    },
    {
      startStory = "17307092432499648427",
      startPort = "Success",
      endStory = "173070951718310853892",
      endPort = "In"
    },
    {
      startStory = "173070951718310853892",
      startPort = "Success",
      endStory = "173071010144912863815",
      endPort = "In"
    },
    {
      startStory = "173071010144912863815",
      startPort = "Success",
      endStory = "173071036030314069762",
      endPort = "In"
    },
    {
      startStory = "173071205291817690514",
      startPort = "Success",
      endStory = "17307962001767295271",
      endPort = "In"
    },
    {
      startStory = "17307962001767295271",
      startPort = "Success",
      endStory = "173079802280910132367",
      endPort = "In"
    },
    {
      startStory = "173079802280910132367",
      startPort = "Success",
      endStory = "173080027464112567025",
      endPort = "In"
    },
    {
      startStory = "17302779849021",
      startPort = "StoryStart",
      endStory = "1730277995070232",
      endPort = "In"
    },
    {
      startStory = "1730376039493867",
      startPort = "Success",
      endStory = "17414154533691564612",
      endPort = "In"
    },
    {
      startStory = "17414154533691564612",
      startPort = "Success",
      endStory = "17501484720731287440",
      endPort = "In"
    },
    {
      startStory = "17501484720731287440",
      startPort = "Success",
      endStory = "17501484732221287532",
      endPort = "In"
    },
    {
      startStory = "17501484732221287532",
      startPort = "Success",
      endStory = "173071205291817690514",
      endPort = "In"
    },
    {
      startStory = "173080027464112567025",
      startPort = "Success",
      endStory = "17536985632864016862",
      endPort = "In"
    },
    {
      startStory = "17536985632864016862",
      startPort = "Success",
      endStory = "17302779849025",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17302779849021"] = {
      isStoryNode = true,
      key = "17302779849021",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1690.7213720633424, y = 164.71880283110994},
      propsData = {QuestChainId = 120105},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17302779849025"] = {
      isStoryNode = true,
      key = "17302779849025",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 4197.494125605872, y = -347.4393509164501},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1730277995070232"] = {
      isStoryNode = true,
      key = "1730277995070232",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\232\153\172\229\133\136\231\148\159\229\138\158\229\133\172\229\174\164",
      pos = {x = 2005.8113325009745, y = 25.81127543953619},
      propsData = {
        QuestId = 12010501,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_1",
        QuestDeatil = "Content_120105_1",
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
            startQuest = "1730277995070239",
            startPort = "Out",
            endQuest = "17302876775582749664",
            endPort = "In"
          },
          {
            startQuest = "17302876775582749664",
            startPort = "Out",
            endQuest = "1730277995070237",
            endPort = "Success"
          },
          {
            startQuest = "1730277995070236",
            startPort = "QuestStart",
            endQuest = "17536975002642008685",
            endPort = "In"
          },
          {
            startQuest = "17536975002642008685",
            startPort = "Out",
            endQuest = "17536974818962008182",
            endPort = "In"
          },
          {
            startQuest = "17536974818962008182",
            startPort = "Out",
            endQuest = "1730277995070239",
            endPort = "In"
          }
        },
        nodeData = {
          ["1730277995070236"] = {
            key = "1730277995070236",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1635.5778432094223, y = 472.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1730277995070237"] = {
            key = "1730277995070237",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2837.0257008798526, y = 419.4957463853951},
            propsData = {ModeType = 0}
          },
          ["1730277995070238"] = {
            key = "1730277995070238",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1730277995070239"] = {
            key = "1730277995070239",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\232\153\172\229\133\136\231\148\159\229\138\158\229\133\172\229\174\164",
            pos = {x = 2217.771239292285, y = 425.5723850782895},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2270009,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2270009"
            }
          },
          ["17302876775582749664"] = {
            key = "17302876775582749664",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\232\153\172\229\133\136\231\148\159\229\175\185\232\175\157",
            pos = {x = 2522.8432228590136, y = 506.03227951247555},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12018401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_47",
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
          ["17536974818962008182"] = {
            key = "17536974818962008182",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2031.2574370709378, y = 646.5697940503431},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2270010}
            }
          },
          ["17536975002642008685"] = {
            key = "17536975002642008685",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1873.3627002288326, y = 419.2013729977116},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104901,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = "RegionPoint_Off_Qiu"
            }
          }
        },
        commentData = {}
      }
    },
    ["173027955144018163246"] = {
      isStoryNode = true,
      key = "173027955144018163246",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\229\143\164\230\136\152\229\156\186",
      pos = {x = 2287.366934481023, y = -115.1715133779492},
      propsData = {
        QuestId = 12010502,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_2",
        QuestDeatil = "Content_120105_2",
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
            startQuest = "17302889708006277832",
            startPort = "Out",
            endQuest = "173027955144018163251",
            endPort = "Success"
          },
          {
            startQuest = "173027955144018163250",
            startPort = "QuestStart",
            endQuest = "17302887340945493761",
            endPort = "In"
          },
          {
            startQuest = "17302883143974708983",
            startPort = "Out",
            endQuest = "17302885390785101426",
            endPort = "In"
          },
          {
            startQuest = "17302887340945493761",
            startPort = "Out",
            endQuest = "17302889708006277832",
            endPort = "In"
          },
          {
            startQuest = "173027955144018163250",
            startPort = "QuestStart",
            endQuest = "17302883143974708983",
            endPort = "In"
          }
        },
        nodeData = {
          ["173027955144018163250"] = {
            key = "173027955144018163250",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["173027955144018163251"] = {
            key = "173027955144018163251",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3008.8744674832683, y = 439.6797528912232},
            propsData = {ModeType = 0}
          },
          ["173027955144018163252"] = {
            key = "173027955144018163252",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17302883143974708983"] = {
            key = "17302883143974708983",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2317.310601695097, y = 281.72698068666335},
            propsData = {WaitTime = 1}
          },
          ["17302885390785101426"] = {
            key = "17302885390785101426",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \232\153\172\229\133\136\231\148\159\228\187\139\231\187\141",
            pos = {x = 2670.5438085262167, y = 253.95942850450018},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12018501,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17302887340945493761"] = {
            key = "17302887340945493761",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\143\164\230\136\152\229\156\186",
            pos = {x = 2320.1477120230998, y = 417.79548163542984},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930143,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010502"
            }
          },
          ["17302889708006277832"] = {
            key = "17302889708006277832",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\176\143\229\188\159\229\175\185\232\175\157",
            pos = {x = 2663.906833736301, y = 429.84254045895926},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12018601,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_48",
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
                  TalkActorId = 210010,
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
                {TalkActorType = "Npc", TalkActorId = 210010},
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
          }
        },
        commentData = {}
      }
    },
    ["1730376039493867"] = {
      isStoryNode = true,
      key = "1730376039493867",
      type = "StoryNode",
      name = "\230\183\177\229\133\165\229\143\164\230\136\152\229\156\186",
      pos = {x = 2561.2283859331806, y = -239.28949140104788},
      propsData = {
        QuestId = 12010503,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_3",
        QuestDeatil = "Content_120105_3",
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
            startQuest = "1730376039493871",
            startPort = "QuestStart",
            endQuest = "1730376039494876",
            endPort = "In"
          },
          {
            startQuest = "1730376039494876",
            startPort = "Out",
            endQuest = "17527365187724806033",
            endPort = "In"
          },
          {
            startQuest = "17527365187724806033",
            startPort = "Out",
            endQuest = "1730376039493872",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1730376039493871"] = {
            key = "1730376039493871",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1730376039493872"] = {
            key = "1730376039493872",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2774.831610340411, y = 453.4797528912232},
            propsData = {
              ModeType = 1,
              Id = 104201,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1730376039493873"] = {
            key = "1730376039493873",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1730376039494876"] = {
            key = "1730376039494876",
            type = "GoToNode",
            name = "\230\183\177\229\133\165\229\143\164\230\136\152\229\156\186",
            pos = {x = 2213.2400708270866, y = 442.8931560540345},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930147,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010503"
            }
          },
          ["17304426141212365975"] = {
            key = "17304426141212365975",
            type = "TalkNode",
            name = "\227\128\144SC009\227\128\145\233\187\145\229\184\130\229\176\143\229\188\159\232\167\166\229\143\145\230\156\186\229\133\179",
            pos = {x = 2510.1602990033225, y = 169.48353971609777},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022519,
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
          ["17527365187724806033"] = {
            key = "17527365187724806033",
            type = "TalkNode",
            name = "\227\128\144SC009\227\128\145\233\187\145\229\184\130\229\176\143\229\188\159\232\167\166\229\143\145\230\156\186\229\133\179",
            pos = {x = 2499.25, y = 445.5},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/Ver01/Ver0101/Ver0101_SC009/SQ_Ver0101_SC009",
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
    ["17304428894433154527"] = {
      isStoryNode = true,
      key = "17304428894433154527",
      type = "StoryNode",
      name = "\230\137\190\232\153\172\229\133\136\231\148\159\228\186\164\232\176\136",
      pos = {x = 1227.96224705527, y = 726.6913319238902},
      propsData = {
        QuestId = 12010504,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_4",
        QuestDeatil = "Content_120105_4",
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
            startQuest = "17304428894433154531",
            startPort = "QuestStart",
            endQuest = "17304497462881706",
            endPort = "In"
          },
          {
            startQuest = "17304428894433154531",
            startPort = "QuestStart",
            endQuest = "1730449883345402879",
            endPort = "In"
          },
          {
            startQuest = "1730449883345402879",
            startPort = "Out",
            endQuest = "1730449919138802112",
            endPort = "In"
          },
          {
            startQuest = "1730449919138802112",
            startPort = "Out",
            endQuest = "1730449839528402056",
            endPort = "In"
          },
          {
            startQuest = "1730449839528402056",
            startPort = "Out",
            endQuest = "17304558022052399268",
            endPort = "In"
          },
          {
            startQuest = "17304558022052399268",
            startPort = "Out",
            endQuest = "17304428894433154532",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17304428894433154531"] = {
            key = "17304428894433154531",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["17304428894433154532"] = {
            key = "17304428894433154532",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3353.250965179121, y = 442.2539464396103},
            propsData = {ModeType = 0}
          },
          ["17304428894433154533"] = {
            key = "17304428894433154533",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17304497462881706"] = {
            key = "17304497462881706",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \232\191\153\230\152\175\229\147\170\233\135\140",
            pos = {x = 2239.336892498185, y = 287.4651226909291},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12018801,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1730449839528402056"] = {
            key = "1730449839528402056",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\232\153\172\229\133\136\231\148\159\229\175\185\232\175\157",
            pos = {x = 2791.5591147204073, y = 448.11028398125165},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210012,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_MrQiu_1980001",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12018901,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_BattleField01",
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
          ["1730449883345402879"] = {
            key = "1730449883345402879",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2222.383487480263, y = 443.88089330024815},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104201,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_MS01"
            }
          },
          ["1730449919138802112"] = {
            key = "1730449919138802112",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\153\172\229\133\136\231\148\159",
            pos = {x = 2498.5483620322348, y = 440.5834022608214},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1980001}
            }
          },
          ["17304558022052399268"] = {
            key = "17304558022052399268",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\232\153\172\229\133\136\231\148\159",
            pos = {x = 3069.301050204279, y = 440.8342983181694},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1980001}
            }
          }
        },
        commentData = {}
      }
    },
    ["17306883504171157"] = {
      isStoryNode = true,
      key = "17306883504171157",
      type = "StoryNode",
      name = "\230\149\178\231\159\179\231\162\145",
      pos = {x = 1507.1994139293988, y = 728.3937674020133},
      propsData = {
        QuestId = 12010505,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_5",
        QuestDeatil = "Content_120105_5",
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
            startQuest = "17307057800741211085",
            startPort = "Out",
            endQuest = "17306883504171162",
            endPort = "Success"
          },
          {
            startQuest = "17306883504171161",
            startPort = "QuestStart",
            endQuest = "17307057800741211085",
            endPort = "In"
          }
        },
        nodeData = {
          ["17306883504171161"] = {
            key = "17306883504171161",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2502.814685314686, y = 452.5099900099899},
            propsData = {ModeType = 0}
          },
          ["17306883504171162"] = {
            key = "17306883504171162",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3294.359339563358, y = 440.148035109561},
            propsData = {ModeType = 0}
          },
          ["17306883504171163"] = {
            key = "17306883504171163",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17307057800741211085"] = {
            key = "17307057800741211085",
            type = "TalkNode",
            name = "\230\149\178\231\159\179\231\162\145",
            pos = {x = 2900.247784863092, y = 433.1609864593609},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12018909,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
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
          }
        },
        commentData = {}
      }
    },
    ["1730705513160408128"] = {
      isStoryNode = true,
      key = "1730705513160408128",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\172\172\228\184\128\229\177\130\231\187\136\231\130\185",
      pos = {x = 1772.534797850105, y = 725.6467007450752},
      propsData = {
        QuestId = 12010506,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_6",
        QuestDeatil = "Content_120105_6",
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
            startQuest = "1730705513161408132",
            startPort = "QuestStart",
            endQuest = "1730705513161408135",
            endPort = "In"
          },
          {
            startQuest = "1730705513161408132",
            startPort = "QuestStart",
            endQuest = "1730705513161408137",
            endPort = "In"
          },
          {
            startQuest = "1730705513161408137",
            startPort = "Out",
            endQuest = "17307063617212415819",
            endPort = "In"
          },
          {
            startQuest = "17307063617212415819",
            startPort = "Out",
            endQuest = "17307067898833218739",
            endPort = "In"
          },
          {
            startQuest = "17307067898833218739",
            startPort = "Out",
            endQuest = "1730705513161408133",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1730705513161408132"] = {
            key = "1730705513161408132",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1730705513161408133"] = {
            key = "1730705513161408133",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3152.34187427003, y = 445.89031007597396},
            propsData = {ModeType = 0}
          },
          ["1730705513161408134"] = {
            key = "1730705513161408134",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1730705513161408135"] = {
            key = "1730705513161408135",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \233\151\175\229\133\179\230\143\144\231\164\186",
            pos = {x = 2220.4480036092964, y = 299.6873449131513},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12019001,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1730705513161408137"] = {
            key = "1730705513161408137",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2222.383487480263, y = 443.88089330024815},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104201,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_MS01"
            }
          },
          ["17307063617212415819"] = {
            key = "17307063617212415819",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\231\187\136\231\130\185",
            pos = {x = 2510.8906420059493, y = 443.87527217364635},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1980004,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010506"
            }
          },
          ["17307067898833218739"] = {
            key = "17307067898833218739",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\149\178\228\184\164\228\184\170\231\159\179\231\162\145",
            pos = {x = 2817.504003536813, y = 431.62099130387065},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12019101,
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
    ["17307071240024021459"] = {
      isStoryNode = true,
      key = "17307071240024021459",
      type = "StoryNode",
      name = "\229\146\140\229\136\187\232\136\159\229\175\185\232\175\157",
      pos = {x = 2048.259248292058, y = 726.7459552288348},
      propsData = {
        QuestId = 12010507,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_7",
        QuestDeatil = "Content_120105_7",
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
            startQuest = "17307071240024021463",
            startPort = "QuestStart",
            endQuest = "17307071240024021467",
            endPort = "In"
          },
          {
            startQuest = "17307071240024021467",
            startPort = "Out",
            endQuest = "17307078940965629816",
            endPort = "In"
          },
          {
            startQuest = "17307078940965629816",
            startPort = "Out",
            endQuest = "17307073225034423790",
            endPort = "In"
          },
          {
            startQuest = "17307073225034423790",
            startPort = "Out",
            endQuest = "17307077404594825352",
            endPort = "In"
          },
          {
            startQuest = "17307077404594825352",
            startPort = "Out",
            endQuest = "17307078940965629815",
            endPort = "In"
          },
          {
            startQuest = "17307078940965629815",
            startPort = "Out",
            endQuest = "17307078940965629817",
            endPort = "In"
          },
          {
            startQuest = "17307078940965629817",
            startPort = "Out",
            endQuest = "17307071240024021464",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17307071240024021463"] = {
            key = "17307071240024021463",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1796.148018648019, y = 414.5337995337994},
            propsData = {ModeType = 0}
          },
          ["17307071240024021464"] = {
            key = "17307071240024021464",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3649.8418742700296, y = 420.89031007597396},
            propsData = {ModeType = 0}
          },
          ["17307071240024021465"] = {
            key = "17307071240024021465",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17307071240024021467"] = {
            key = "17307071240024021467",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2094.4668208135963, y = 415.5475599669148},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104201,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_MS3"
            }
          },
          ["17307073225034423790"] = {
            key = "17307073225034423790",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2589.9389019717105, y = 417.2062726891523},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "FallingPoint_12010507",
              FadeIn = true,
              FadeOut = true,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17307077404594825352"] = {
            key = "17307077404594825352",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \231\150\188\231\150\188\231\150\188\231\150\188",
            pos = {x = 2846.605568638379, y = 407.2062726891521},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12019201,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17307078940965629815"] = {
            key = "17307078940965629815",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\136\187\232\136\159\229\175\185\232\175\157",
            pos = {x = 3087.5733105738627, y = 406.39982107624894},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210021,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Kezhou_1980008",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12019301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_BattleField02",
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
                  TalkActorId = 210021,
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
                {TalkActorType = "Npc", TalkActorId = 210021},
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
          ["17307078940965629816"] = {
            key = "17307078940965629816",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\136\187\232\136\159",
            pos = {x = 2346.229224552357, y = 415.5396060224854},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1980008}
            }
          },
          ["17307078940965629817"] = {
            key = "17307078940965629817",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\136\187\232\136\159",
            pos = {x = 3356.9819127244014, y = 420.5127243020556},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1980008}
            }
          }
        },
        commentData = {}
      }
    },
    ["17307087592547637445"] = {
      isStoryNode = true,
      key = "17307087592547637445",
      type = "StoryNode",
      name = "\230\149\178\230\156\186\229\133\179",
      pos = {x = 955.0274559644191, y = 930.0398967045058},
      propsData = {
        QuestId = 12010508,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_8",
        QuestDeatil = "Content_120105_8",
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
            startQuest = "17307088474068040745",
            startPort = "Out",
            endQuest = "17307088474068040746",
            endPort = "In"
          },
          {
            startQuest = "17307087592557637449",
            startPort = "QuestStart",
            endQuest = "17307088474068040745",
            endPort = "In"
          },
          {
            startQuest = "17307088474068040746",
            startPort = "Out",
            endQuest = "17307088958878041948",
            endPort = "In"
          },
          {
            startQuest = "17307088958878041948",
            startPort = "Out",
            endQuest = "17307088474068040747",
            endPort = "In"
          },
          {
            startQuest = "17307088474068040747",
            startPort = "Out",
            endQuest = "17307087592557637450",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17307087592557637449"] = {
            key = "17307087592557637449",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2590.8908757908753, y = 510.3052281052279},
            propsData = {ModeType = 0}
          },
          ["17307087592557637450"] = {
            key = "17307087592557637450",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3851.8418742700296, y = 494.60459579025957},
            propsData = {ModeType = 0}
          },
          ["17307087592557637451"] = {
            key = "17307087592557637451",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17307088474068040745"] = {
            key = "17307088474068040745",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2814.595916874888, y = 510.317510864759},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104201,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_MS04"
            }
          },
          ["17307088474068040746"] = {
            key = "17307088474068040746",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\231\155\174\230\160\135\231\130\185",
            pos = {x = 3050.8173571148604, y = 509.45474688101433},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1980009,
              GuideType = "P",
              GuidePointName = "QuestPoint_MS04"
            }
          },
          ["17307088474068040747"] = {
            key = "17307088474068040747",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\149\178\230\156\186\229\133\179",
            pos = {x = 3548.573575788581, y = 490.6290374398101},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12019401,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17307088958878041948"] = {
            key = "17307088958878041948",
            type = "TalkNode",
            name = "\230\149\178\231\159\179\231\162\145",
            pos = {x = 3298.633328350076, y = 498.2207366712107},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12018909,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
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
          }
        },
        commentData = {}
      }
    },
    ["17307092432499648427"] = {
      isStoryNode = true,
      key = "17307092432499648427",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\187\136\231\130\185",
      pos = {x = 1236.2027589195063, y = 927.7385938140679},
      propsData = {
        QuestId = 12010509,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_9",
        QuestDeatil = "Content_120105_9",
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
            startQuest = "17307092432499648435",
            startPort = "Out",
            endQuest = "17307092432499648432",
            endPort = "Success"
          },
          {
            startQuest = "17307092432499648431",
            startPort = "QuestStart",
            endQuest = "17307092432499648435",
            endPort = "In"
          }
        },
        nodeData = {
          ["17307092432499648431"] = {
            key = "17307092432499648431",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2841.275491175491, y = 514.9206127206126},
            propsData = {ModeType = 0}
          },
          ["17307092432499648432"] = {
            key = "17307092432499648432",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3568.984731412887, y = 510.89031007597384},
            propsData = {ModeType = 0}
          },
          ["17307092432499648433"] = {
            key = "17307092432499648433",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17307092432499648434"] = {
            key = "17307092432499648434",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2868.9255872045587, y = 310.7021262493744},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104201,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_MS05"
            }
          },
          ["17307092432499648435"] = {
            key = "17307092432499648435",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\231\155\174\230\160\135\231\130\185",
            pos = {x = 3157.9602142577173, y = 512.0261754524429},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1980010,
              GuideType = "P",
              GuidePointName = "QuestPoint_MS05"
            }
          }
        },
        commentData = {}
      }
    },
    ["173070951718310853892"] = {
      isStoryNode = true,
      key = "173070951718310853892",
      type = "StoryNode",
      name = "\229\135\187\230\157\128\230\128\170\231\137\169",
      pos = {x = 1509.1739127656574, y = 929.6135938140679},
      propsData = {
        QuestId = 12010510,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_10",
        QuestDeatil = "Content_120105_10",
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
            startQuest = "173070951718310853896",
            startPort = "QuestStart",
            endQuest = "173070951718310853899",
            endPort = "In"
          },
          {
            startQuest = "173070978611911256708",
            startPort = "Out",
            endQuest = "173070978612011256710",
            endPort = "In"
          },
          {
            startQuest = "173070951718310853899",
            startPort = "Out",
            endQuest = "173070951718310853897",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173070951718310853896"] = {
            key = "173070951718310853896",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2590.8908757908753, y = 510.3052281052279},
            propsData = {ModeType = 0}
          },
          ["173070951718310853897"] = {
            key = "173070951718310853897",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3187.99950973801, y = 509.5307041646438},
            propsData = {ModeType = 0}
          },
          ["173070951718310853898"] = {
            key = "173070951718310853898",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["173070951718310853899"] = {
            key = "173070951718310853899",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2875.4530597320313, y = 510.317510864759},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104201,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_MS05"
            }
          },
          ["173070978611911256708"] = {
            key = "173070978611911256708",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3117.718166883187, y = 315.5316288441718},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1980011,
                1980012,
                1980013,
                1980014
              }
            }
          },
          ["173070978612011256709"] = {
            key = "173070978612011256709",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 3694.898243511539, y = 306.65259217203163},
            propsData = {
              KillMonsterType = "Nums",
              MonsterNeedNums = 1,
              IsShow = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["173070978612011256710"] = {
            key = "173070978612011256710",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\137\147\230\128\170\231\137\169",
            pos = {x = 3416.569836286581, y = 328.458831909306},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12019501,
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
    ["173071010144912863815"] = {
      isStoryNode = true,
      key = "173071010144912863815",
      type = "StoryNode",
      name = "\230\149\178\230\156\186\229\133\179",
      pos = {x = 1783.107446523988, y = 928.1113118668062},
      propsData = {
        QuestId = 12010511,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_11",
        QuestDeatil = "Content_120105_11",
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
            startQuest = "173071010144912863822",
            startPort = "Out",
            endQuest = "173071010144912863823",
            endPort = "In"
          },
          {
            startQuest = "173071010144912863819",
            startPort = "QuestStart",
            endQuest = "173071010144912863822",
            endPort = "In"
          },
          {
            startQuest = "173071010144912863823",
            startPort = "Out",
            endQuest = "173071010144912863825",
            endPort = "In"
          },
          {
            startQuest = "173071010144912863825",
            startPort = "Out",
            endQuest = "173071010144912863824",
            endPort = "In"
          },
          {
            startQuest = "173071010144912863824",
            startPort = "Out",
            endQuest = "173071010144912863820",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173071010144912863819"] = {
            key = "173071010144912863819",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2568.13225510122, y = 510.3052281052279},
            propsData = {ModeType = 0}
          },
          ["173071010144912863820"] = {
            key = "173071010144912863820",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3851.8418742700296, y = 494.60459579025957},
            propsData = {ModeType = 0}
          },
          ["173071010144912863821"] = {
            key = "173071010144912863821",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["173071010144912863822"] = {
            key = "173071010144912863822",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2813.5614341162677, y = 510.317510864759},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104201,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_MS06"
            }
          },
          ["173071010144912863823"] = {
            key = "173071010144912863823",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\231\155\174\230\160\135\231\130\185",
            pos = {x = 3050.8173571148604, y = 509.45474688101433},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1980015,
              GuideType = "P",
              GuidePointName = "QuestPoint_MS06"
            }
          },
          ["173071010144912863824"] = {
            key = "173071010144912863824",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\149\178\230\156\186\229\133\179",
            pos = {x = 3549.6080585472014, y = 500.6290374398101},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12019601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["173071010144912863825"] = {
            key = "173071010144912863825",
            type = "TalkNode",
            name = "\230\149\178\231\159\179\231\162\145",
            pos = {x = 3298.633328350076, y = 498.2207366712107},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12018909,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
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
          }
        },
        commentData = {}
      }
    },
    ["173071036030314069762"] = {
      isStoryNode = true,
      key = "173071036030314069762",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\172\172\228\186\140\229\177\130\231\187\136\231\130\185",
      pos = {x = 2043.7971016964016, y = 927.9173463495648},
      propsData = {
        QuestId = 12010512,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_12",
        QuestDeatil = "Content_120105_12",
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
            startQuest = "173071036030314069766",
            startPort = "QuestStart",
            endQuest = "173071036030314069770",
            endPort = "In"
          },
          {
            startQuest = "173071137896614472779",
            startPort = "Out",
            endQuest = "173071138714814473040",
            endPort = "In"
          },
          {
            startQuest = "173071138714814473040",
            startPort = "Out",
            endQuest = "173071036030314069767",
            endPort = "Success"
          },
          {
            startQuest = "173071036030314069770",
            startPort = "Out",
            endQuest = "17307879208101220541",
            endPort = "In"
          },
          {
            startQuest = "17307879208101220541",
            startPort = "Out",
            endQuest = "173071137896614472779",
            endPort = "In"
          }
        },
        nodeData = {
          ["173071036030314069766"] = {
            key = "173071036030314069766",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1584.4526163491682, y = 436.66023631540867},
            propsData = {ModeType = 0}
          },
          ["173071036030314069767"] = {
            key = "173071036030314069767",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3125.4453225458924, y = 422.0972066276981},
            propsData = {
              ModeType = 1,
              Id = 104101,
              StartIndex = 2,
              IsWhite = true
            }
          },
          ["173071036030314069768"] = {
            key = "173071036030314069768",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["173071036030314069770"] = {
            key = "173071036030314069770",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2049.6248667906075, y = 439.7429622657654},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104201,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["173071137896614472779"] = {
            key = "173071137896614472779",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\136\187\232\136\159\229\145\138\229\136\171",
            pos = {x = 2554.80023649264, y = 426.5380360047373},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12019701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_BattleField03",
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
                  TalkActorId = 210021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210021}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173071138714814473040"] = {
            key = "173071138714814473040",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\232\153\172\229\133\136\231\148\159\229\175\185\232\175\157",
            pos = {x = 2852.7312709753987, y = 429.64148428059923},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12019801,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_BattleField04",
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
                  TalkActorId = 210012,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210012}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17307879208101220541"] = {
            key = "17307879208101220541",
            type = "GoToNode",
            name = "\230\138\181\232\190\190\231\155\174\230\160\135\231\130\185",
            pos = {x = 2299.2173913043453, y = 439.3853073463269},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1980016,
              GuideType = "P",
              GuidePointName = "QuestPoint_MS08"
            }
          }
        },
        commentData = {}
      }
    },
    ["173071205291817690514"] = {
      isStoryNode = true,
      key = "173071205291817690514",
      type = "StoryNode",
      name = "\228\188\160\233\128\129\229\155\158\229\143\164\230\136\152\229\156\186",
      pos = {x = 3022.269844470868, y = 372.115863349806},
      propsData = {
        QuestId = 12010513,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_13",
        QuestDeatil = "Content_120105_13",
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
            startQuest = "173071205291817690521",
            startPort = "Out",
            endQuest = "173071205291817690523",
            endPort = "In"
          },
          {
            startQuest = "173071205291817690518",
            startPort = "QuestStart",
            endQuest = "173071205291817690521",
            endPort = "In"
          },
          {
            startQuest = "173071205291817690523",
            startPort = "Out",
            endQuest = "17544824228863370",
            endPort = "In"
          },
          {
            startQuest = "17544824228863370",
            startPort = "Out",
            endQuest = "173071205291817690519",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173071205291817690518"] = {
            key = "173071205291817690518",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2217.5560646250296, y = 466.6602363154086},
            propsData = {ModeType = 0}
          },
          ["173071205291817690519"] = {
            key = "173071205291817690519",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3274.8097192948862, y = 457.44361237219425},
            propsData = {ModeType = 0}
          },
          ["173071205291817690520"] = {
            key = "173071205291817690520",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["173071205291817690521"] = {
            key = "173071205291817690521",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2496.3243741797696, y = 451.122272610593},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104102,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["173071205291817690523"] = {
            key = "173071205291817690523",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \233\128\174\230\141\149\231\133\156\230\152\142",
            pos = {x = 2760.5253438637665, y = 448.65158449365066},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12019901,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_51",
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
                  TalkActorId = 210007,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210012,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210012},
                {TalkActorType = "Npc", TalkActorId = 210007}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17307915915615675180"] = {
            key = "17307915915615675180",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2265.7691154422773, y = 309.0404797601199},
            propsData = {
              ModeType = 1,
              Id = 104101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17544824228863370"] = {
            key = "17544824228863370",
            type = "TalkNode",
            name = "\227\128\144SC010\227\128\145\233\128\174\230\141\149\231\133\156\230\152\142",
            pos = {x = 3006.2096927839957, y = 444.9455525125029},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/Ver01/Ver0101/Ver0101_SC010/SQ_Ver0101_SC010",
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
    ["17307962001767295271"] = {
      isStoryNode = true,
      key = "17307962001767295271",
      type = "StoryNode",
      name = "\229\135\187\232\180\165\231\133\156\230\152\142",
      pos = {x = 3282.704352618894, y = 204.72309886515285},
      propsData = {
        QuestId = 12010514,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_14",
        QuestDeatil = "Content_120105_14",
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
            startQuest = "17307962001767295275",
            startPort = "QuestStart",
            endQuest = "17307962001767295278",
            endPort = "In"
          },
          {
            startQuest = "17307969394587701290",
            startPort = "Out",
            endQuest = "17307969394587701291",
            endPort = "In"
          },
          {
            startQuest = "17307969394587701292",
            startPort = "Out",
            endQuest = "17307969394587701293",
            endPort = "In"
          },
          {
            startQuest = "17307962001767295278",
            startPort = "Out",
            endQuest = "17307969394587701290",
            endPort = "In"
          },
          {
            startQuest = "17307969394587701290",
            startPort = "Out",
            endQuest = "17307969394587701292",
            endPort = "In"
          },
          {
            startQuest = "17307969394587701293",
            startPort = "Out",
            endQuest = "17307962001767295276",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17307962001767295275"] = {
            key = "17307962001767295275",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1977.5560646250296, y = 453.21196045333966},
            propsData = {ModeType = 0}
          },
          ["17307962001767295276"] = {
            key = "17307962001767295276",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3295.1004949596845, y = 454.1661721449394},
            propsData = {ModeType = 0}
          },
          ["17307962001767295277"] = {
            key = "17307962001767295277",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17307962001767295278"] = {
            key = "17307962001767295278",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2235.831763342331, y = 453.19123812783437},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104102,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010514"
            }
          },
          ["17307969394587701290"] = {
            key = "17307969394587701290",
            type = "GoToNode",
            name = "\229\146\140\231\133\156\230\152\142\230\136\152\230\150\151",
            pos = {x = 2487.2310233238964, y = 453.3131945931797},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930153,
              GuideType = "P",
              GuidePointName = "QuestPoint_12010514"
            }
          },
          ["17307969394587701291"] = {
            key = "17307969394587701291",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \233\187\145\233\190\153\230\136\152\230\150\151",
            pos = {x = 2736.243064922145, y = 263.0436269960259},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12020101,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17307969394587701292"] = {
            key = "17307969394587701292",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 2743.272724802039, y = 454.0449215240841},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930152}
            }
          },
          ["17307969394587701293"] = {
            key = "17307969394587701293",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 3031.4796213537625, y = 458.544921524084},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 1,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {1930152}
            }
          }
        },
        commentData = {}
      }
    },
    ["173079802280910132367"] = {
      isStoryNode = true,
      key = "173079802280910132367",
      type = "StoryNode",
      name = "\230\136\152\229\144\142\229\175\185\232\175\157",
      pos = {x = 3515.211517867438, y = 4.160626854404967},
      propsData = {
        QuestId = 12010515,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_15",
        QuestDeatil = "Content_120105_15",
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
            startQuest = "173079927219211755541",
            startPort = "Out",
            endQuest = "173079802280910132372",
            endPort = "Success"
          },
          {
            startQuest = "173079802280910132371",
            startPort = "QuestStart",
            endQuest = "17531951931161952441",
            endPort = "In"
          },
          {
            startQuest = "17531951931161952441",
            startPort = "Out",
            endQuest = "17536984965884015963",
            endPort = "In"
          },
          {
            startQuest = "17536984965884015963",
            startPort = "Out",
            endQuest = "173079927219211755541",
            endPort = "In"
          }
        },
        nodeData = {
          ["173079802280910132371"] = {
            key = "173079802280910132371",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1644.0560646250296, y = 493.71196045333966},
            propsData = {ModeType = 0}
          },
          ["173079802280910132372"] = {
            key = "173079802280910132372",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2807.159318489096, y = 450.63676038023357},
            propsData = {ModeType = 0}
          },
          ["173079802280910132373"] = {
            key = "173079802280910132373",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["173079802280910132374"] = {
            key = "173079802280910132374",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2254.361175107037, y = 273.19123812783437},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010514"
            }
          },
          ["173079850958511350020"] = {
            key = "173079850958511350020",
            type = "TalkNode",
            name = "\227\128\144SC011\227\128\145",
            pos = {x = 2227.91755479726, y = 853.5025134491577},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12022521,
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
          ["173079927219211755541"] = {
            key = "173079927219211755541",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\136\187\232\136\159\227\128\129\232\153\172\229\133\136\231\148\159\229\175\185\232\175\157",
            pos = {x = 2514.4904448228363, y = 439.1418996384161},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12020301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_52",
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
                  TalkActorId = 210012,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210012},
                {TalkActorType = "Npc", TalkActorId = 210021}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17531951931161952441"] = {
            key = "17531951931161952441",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 1967.8478260869565, y = 436.9347826086956},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104102,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010514"
            }
          },
          ["17536984965884015963"] = {
            key = "17536984965884015963",
            type = "TalkNode",
            name = "\227\128\144SC011\227\128\145\229\136\187\232\136\159\230\149\145\229\156\186",
            pos = {x = 2238.146739130435, y = 444.881483600305},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/Ver01/Ver0101/Ver0101_SC011/SQ_Ver0101_SC011",
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
    ["173080027464112567025"] = {
      isStoryNode = true,
      key = "173080027464112567025",
      type = "StoryNode",
      name = "\229\146\140\229\136\187\232\136\159\229\175\185\232\175\157",
      pos = {x = 3753.577607659999, y = -152.03523205342162},
      propsData = {
        QuestId = 12010516,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_16",
        QuestDeatil = "Content_120105_16",
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
            startQuest = "173080027464112567029",
            startPort = "QuestStart",
            endQuest = "173080027464112567032",
            endPort = "In"
          },
          {
            startQuest = "173080027464112567032",
            startPort = "Out",
            endQuest = "173080045654912973954",
            endPort = "In"
          },
          {
            startQuest = "173080045654912973954",
            startPort = "Out",
            endQuest = "173080072999313379658",
            endPort = "In"
          },
          {
            startQuest = "173080072999313379658",
            startPort = "Out",
            endQuest = "173080027464112567030",
            endPort = "Success"
          },
          {
            startQuest = "173080027464112567032",
            startPort = "Out",
            endQuest = "173080091057415001673",
            endPort = "In"
          }
        },
        nodeData = {
          ["173080027464112567029"] = {
            key = "173080027464112567029",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1817.9137083837954, y = 455.18484497881883},
            propsData = {ModeType = 0}
          },
          ["173080027464112567030"] = {
            key = "173080027464112567030",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2909.659318489096, y = 451.4700937135669},
            propsData = {ModeType = 0}
          },
          ["173080027464112567031"] = {
            key = "173080027464112567031",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["173080027464112567032"] = {
            key = "173080027464112567032",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2079.7959577157326, y = 452.44848450464593},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104102,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010514"
            }
          },
          ["173080045654912973954"] = {
            key = "173080045654912973954",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\136\187\232\136\159",
            pos = {x = 2345.328397205752, y = 456.62770664003835},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930157}
            }
          },
          ["173080072999313379658"] = {
            key = "173080072999313379658",
            type = "TalkNode",
            name = "\227\128\14453\227\128\145\229\136\187\232\136\159\229\175\185\232\175\157",
            pos = {x = 2631.161730539086, y = 445.3777066400383},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210021,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Kezhou_1930157",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12020501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_53",
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
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210021}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173080091057415001673"] = {
            key = "173080091057415001673",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\176\143\231\153\189\229\144\144\230\167\189",
            pos = {x = 2347.8283972057525, y = 309.12770664003835},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12020401,
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
    ["17414154533691564612"] = {
      isStoryNode = true,
      key = "17414154533691564612",
      type = "StoryNode",
      name = "\229\143\164\230\136\152\229\156\186\229\137\175\230\156\172I",
      pos = {x = 2611.3509751689962, y = -2.1983574777626416},
      propsData = {
        QuestId = 12010517,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_4",
        QuestDeatil = "Content_120105_4",
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
            startQuest = "17414154533691564620",
            startPort = "Fail",
            endQuest = "17414154533691564621",
            endPort = "In"
          },
          {
            startQuest = "17414154533691564621",
            startPort = "Out",
            endQuest = "17414154533691564619",
            endPort = "Fail"
          },
          {
            startQuest = "17414154533691564620",
            startPort = "PassiveFail",
            endQuest = "17414154533691564619",
            endPort = "Fail"
          },
          {
            startQuest = "17414154533691564620",
            startPort = "Success",
            endQuest = "17414154533691564618",
            endPort = "Success"
          },
          {
            startQuest = "17536979506683010409",
            startPort = "Out",
            endQuest = "17536979506683010411",
            endPort = "In"
          },
          {
            startQuest = "17536979506683010410",
            startPort = "LastDefaultOut",
            endQuest = "17536979506683010409",
            endPort = "In"
          },
          {
            startQuest = "17414154533691564617",
            startPort = "QuestStart",
            endQuest = "17536979561713010575",
            endPort = "In"
          },
          {
            startQuest = "17536979561713010575",
            startPort = "Out",
            endQuest = "17414154533691564620",
            endPort = "In"
          },
          {
            startQuest = "17414154533691564617",
            startPort = "QuestStart",
            endQuest = "17536979506683010410",
            endPort = "In"
          }
        },
        nodeData = {
          ["17414154533691564617"] = {
            key = "17414154533691564617",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3722.541690688082, y = 571.2841075103231},
            propsData = {ModeType = 0}
          },
          ["17414154533691564618"] = {
            key = "17414154533691564618",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4758.4782689977155, y = 489.48468562945095},
            propsData = {
              ModeType = 1,
              Id = 104601,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17414154533691564619"] = {
            key = "17414154533691564619",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4756.283057713077, y = 746.8578808702475},
            propsData = {}
          },
          ["17414154533691564620"] = {
            key = "17414154533691564620",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "2008\229\143\164\230\136\152\229\156\186<1>",
            pos = {x = 4349.637260204876, y = 552.2692939244662},
            propsData = {SpecialConfigId = 2008, BlackScreenImmediately = false}
          },
          ["17414154533691564621"] = {
            key = "17414154533691564621",
            type = "SkipRegionNode",
            name = "\233\128\129\229\155\158\229\185\187\229\162\131\229\164\150",
            pos = {x = 4758.7654134813965, y = 617.4235084838532},
            propsData = {
              ModeType = 1,
              Id = 104102,
              StartIndex = 1,
              IsWhite = true
            }
          },
          ["17414154533691564623"] = {
            key = "17414154533691564623",
            type = "CommonBlackFadeInOutNode",
            name = "\229\175\185\232\175\157\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = 3656.9659158046243, y = 919.1371639113572},
            propsData = {FadeTime = 0, FadeType = "FadeIn"}
          },
          ["174901916246333185788"] = {
            key = "174901916246333185788",
            type = "TalkNode",
            name = "\227\128\144\229\185\187\229\162\131\227\128\145\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186",
            pos = {x = 4442.611611506773, y = 85.86300258880837},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12023807,
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
          ["17536979366283010240"] = {
            key = "17536979366283010240",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 4115.728199174407, y = 382.4456914344686},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 0,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17536979506683010409"] = {
            key = "17536979506683010409",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 4285.321263334719, y = 860.6924663309553},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2030014,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2030014"
            }
          },
          ["17536979506683010410"] = {
            key = "17536979506683010410",
            type = "JudgeRegionNode",
            name = "\229\136\164\230\150\173\228\189\141\228\186\142\229\140\186\229\159\159",
            pos = {x = 4022.4702291378335, y = 809.4474027920154},
            propsData = {
              IsWaitingEnterRegion = false,
              RegionIds = {104201}
            }
          },
          ["17536979506683010411"] = {
            key = "17536979506683010411",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 4554.98616921098, y = 876.9439800769219},
            propsData = {
              ModeType = 1,
              Id = 104201,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17536979561713010575"] = {
            key = "17536979561713010575",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 4023.2281991744067, y = 571.4456914344686},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104201,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = "QuestPoint_Batt01StartPoint"
            }
          }
        },
        commentData = {}
      }
    },
    ["17501484720731287440"] = {
      isStoryNode = true,
      key = "17501484720731287440",
      type = "StoryNode",
      name = "\229\143\164\230\136\152\229\156\186\229\137\175\230\156\172II",
      pos = {x = 2666.0502392344497, y = 232.13590797074778},
      propsData = {
        QuestId = 12010518,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_4",
        QuestDeatil = "Content_120105_4",
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
            startQuest = "17501484720731287448",
            startPort = "Fail",
            endQuest = "17501484720731287449",
            endPort = "In"
          },
          {
            startQuest = "17501484720731287449",
            startPort = "Out",
            endQuest = "17501484720731287447",
            endPort = "Fail"
          },
          {
            startQuest = "17501484720731287448",
            startPort = "PassiveFail",
            endQuest = "17501484720731287447",
            endPort = "Fail"
          },
          {
            startQuest = "17501484720731287448",
            startPort = "Success",
            endQuest = "17501484720731287446",
            endPort = "Success"
          },
          {
            startQuest = "17536981218533012502",
            startPort = "Out",
            endQuest = "17536981218533012504",
            endPort = "In"
          },
          {
            startQuest = "17536981218533012503",
            startPort = "LastDefaultOut",
            endQuest = "17536981218533012502",
            endPort = "In"
          },
          {
            startQuest = "17501484720731287445",
            startPort = "QuestStart",
            endQuest = "17536981218533012505",
            endPort = "In"
          },
          {
            startQuest = "17536981218533012505",
            startPort = "Out",
            endQuest = "17501484720731287448",
            endPort = "In"
          },
          {
            startQuest = "17501484720731287445",
            startPort = "QuestStart",
            endQuest = "17536981218533012503",
            endPort = "In"
          }
        },
        nodeData = {
          ["17501484720731287445"] = {
            key = "17501484720731287445",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3668.541690688082, y = 644.7841075103231},
            propsData = {ModeType = 0}
          },
          ["17501484720731287446"] = {
            key = "17501484720731287446",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4758.4782689977155, y = 489.48468562945095},
            propsData = {
              ModeType = 1,
              Id = 104701,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17501484720731287447"] = {
            key = "17501484720731287447",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4756.283057713077, y = 746.8578808702475},
            propsData = {}
          },
          ["17501484720731287448"] = {
            key = "17501484720731287448",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "2009\229\143\164\230\136\152\229\156\186<2>",
            pos = {x = 4372.915037982653, y = 548.8804050355773},
            propsData = {SpecialConfigId = 2009, BlackScreenImmediately = false}
          },
          ["17501484720731287449"] = {
            key = "17501484720731287449",
            type = "SkipRegionNode",
            name = "\233\128\129\229\155\158\229\185\187\229\162\131\229\164\150",
            pos = {x = 4758.7654134813965, y = 616.1735084838532},
            propsData = {
              ModeType = 1,
              Id = 104102,
              StartIndex = 1,
              IsWhite = true
            }
          },
          ["17501484720731287451"] = {
            key = "17501484720731287451",
            type = "TalkNode",
            name = "\227\128\144\229\185\187\229\162\131\227\128\145\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186",
            pos = {x = 4442.611611506773, y = 85.86300258880837},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12023807,
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
          ["17536981218533012502"] = {
            key = "17536981218533012502",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 4289.389116791892, y = 818.74763057526},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2030014,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2030014"
            }
          },
          ["17536981218533012503"] = {
            key = "17536981218533012503",
            type = "JudgeRegionNode",
            name = "\229\136\164\230\150\173\228\189\141\228\186\142\229\140\186\229\159\159",
            pos = {x = 4005.538082595006, y = 778.0025670363201},
            propsData = {
              IsWaitingEnterRegion = false,
              RegionIds = {104601}
            }
          },
          ["17536981218533012504"] = {
            key = "17536981218533012504",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 4535.054022668152, y = 845.4991443212266},
            propsData = {
              ModeType = 1,
              Id = 104601,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17536981218533012505"] = {
            key = "17536981218533012505",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 4022.796052631579, y = 535.5008556787733},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104601,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = "QuestPoint_Batt02StartPoint"
            }
          }
        },
        commentData = {}
      }
    },
    ["17501484732221287532"] = {
      isStoryNode = true,
      key = "17501484732221287532",
      type = "StoryNode",
      name = "\229\143\164\230\136\152\229\156\186\229\137\175\230\156\172III",
      pos = {x = 2708.2842105263153, y = 465.08077363140296},
      propsData = {
        QuestId = 12010519,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_4",
        QuestDeatil = "Content_120105_4",
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
            startQuest = "17501484732231287540",
            startPort = "Fail",
            endQuest = "17501484732231287541",
            endPort = "In"
          },
          {
            startQuest = "17501484732231287541",
            startPort = "Out",
            endQuest = "17501484732231287539",
            endPort = "Fail"
          },
          {
            startQuest = "17501484732231287540",
            startPort = "PassiveFail",
            endQuest = "17501484732231287539",
            endPort = "Fail"
          },
          {
            startQuest = "17501484732231287540",
            startPort = "Success",
            endQuest = "17501484732231287538",
            endPort = "Success"
          },
          {
            startQuest = "17536981964883014361",
            startPort = "Out",
            endQuest = "17536981964883014362",
            endPort = "In"
          },
          {
            startQuest = "17536981964883014360",
            startPort = "LastDefaultOut",
            endQuest = "17536981964883014361",
            endPort = "In"
          },
          {
            startQuest = "17501484732231287537",
            startPort = "QuestStart",
            endQuest = "17536981964883014359",
            endPort = "In"
          },
          {
            startQuest = "17536981964883014359",
            startPort = "Out",
            endQuest = "17501484732231287540",
            endPort = "In"
          },
          {
            startQuest = "17501484732231287537",
            startPort = "QuestStart",
            endQuest = "17536981964883014360",
            endPort = "In"
          }
        },
        nodeData = {
          ["17501484732231287537"] = {
            key = "17501484732231287537",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3754.827404973796, y = 605.5698217960373},
            propsData = {ModeType = 0}
          },
          ["17501484732231287538"] = {
            key = "17501484732231287538",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4769.530900576663, y = 476.8531066820825},
            propsData = {
              ModeType = 1,
              Id = 104102,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17501484732231287539"] = {
            key = "17501484732231287539",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4808.764260720596, y = 774.8278056822777},
            propsData = {}
          },
          ["17501484732231287540"] = {
            key = "17501484732231287540",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 4398.994403062019, y = 576.3407224958947},
            propsData = {SpecialConfigId = 2010, BlackScreenImmediately = false}
          },
          ["17501484732231287541"] = {
            key = "17501484732231287541",
            type = "SkipRegionNode",
            name = "\233\128\129\229\155\158\229\185\187\229\162\131\229\164\150",
            pos = {x = 4758.7654134813965, y = 614.5945611154322},
            propsData = {
              ModeType = 1,
              Id = 104102,
              StartIndex = 1,
              IsWhite = true
            }
          },
          ["17501484732231287542"] = {
            key = "17501484732231287542",
            type = "CommonBlackFadeInOutNode",
            name = "\229\175\185\232\175\157\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = 4701.965915804624, y = 76.28002105421433},
            propsData = {FadeTime = 0, FadeType = "FadeIn"}
          },
          ["17501484732231287543"] = {
            key = "17501484732231287543",
            type = "TalkNode",
            name = "\227\128\144\229\185\187\229\162\131\227\128\145\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186",
            pos = {x = 4442.611611506773, y = 85.86300258880837},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12023807,
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
          ["17536981964883014359"] = {
            key = "17536981964883014359",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 4121.84962406015, y = 586.6485779255667},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104701,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = "QuestPoint_Batt03StartPoint"
            }
          },
          ["17536981964883014360"] = {
            key = "17536981964883014360",
            type = "JudgeRegionNode",
            name = "\229\136\164\230\150\173\228\189\141\228\186\142\229\140\186\229\159\159",
            pos = {x = 4130.305939737863, y = 794.8645749973992},
            propsData = {
              IsWaitingEnterRegion = false,
              RegionIds = {104701}
            }
          },
          ["17536981964883014361"] = {
            key = "17536981964883014361",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 4425.585545363321, y = 881.3239242506248},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2030014,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_2030014"
            }
          },
          ["17536981964883014362"] = {
            key = "17536981964883014362",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 4719.82187981101, y = 979.5040094251628},
            propsData = {
              ModeType = 1,
              Id = 104701,
              StartIndex = 1,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17536985632864016862"] = {
      isStoryNode = true,
      key = "17536985632864016862",
      type = "StoryNode",
      name = "\229\146\140\229\136\187\232\136\159\229\175\185\232\175\157",
      pos = {x = 3985.688502673797, y = -219.80066141289052},
      propsData = {
        QuestId = 12010550,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120105_16",
        QuestDeatil = "Content_120105_16",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17536985632864016867",
            startPort = "QuestStart",
            endQuest = "17536985632864016870",
            endPort = "In"
          },
          {
            startQuest = "17536985632864016870",
            startPort = "Out",
            endQuest = "17536985632864016871",
            endPort = "In"
          },
          {
            startQuest = "17536985632864016871",
            startPort = "Out",
            endQuest = "17536985632864016872",
            endPort = "In"
          },
          {
            startQuest = "17536985632864016872",
            startPort = "Out",
            endQuest = "17536985632864016868",
            endPort = "Success"
          },
          {
            startQuest = "17536985632864016870",
            startPort = "Out",
            endQuest = "17536985632864016873",
            endPort = "In"
          }
        },
        nodeData = {
          ["17536985632864016867"] = {
            key = "17536985632864016867",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1817.9137083837954, y = 455.18484497881883},
            propsData = {ModeType = 0}
          },
          ["17536985632864016868"] = {
            key = "17536985632864016868",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2909.659318489096, y = 451.4700937135669},
            propsData = {ModeType = 0}
          },
          ["17536985632864016869"] = {
            key = "17536985632864016869",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["17536985632864016870"] = {
            key = "17536985632864016870",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\143\164\230\136\152\229\156\186\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2079.7959577157326, y = 452.44848450464593},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104102,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12010514"
            }
          },
          ["17536985632864016871"] = {
            key = "17536985632864016871",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\136\187\232\136\159",
            pos = {x = 2345.328397205752, y = 456.62770664003835},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930157}
            }
          },
          ["17536985632864016872"] = {
            key = "17536985632864016872",
            type = "TalkNode",
            name = "\227\128\14453\227\128\145\229\136\187\232\136\159\229\175\185\232\175\157",
            pos = {x = 2631.161730539086, y = 445.3777066400383},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210021,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Kezhou_1930157",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12020501,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_53",
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
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 210021}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17536985632864016873"] = {
            key = "17536985632864016873",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\176\143\231\153\189\229\144\144\230\167\189",
            pos = {x = 2347.8283972057525, y = 309.12770664003835},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12020401,
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
    }
  },
  commentData = {}
}
