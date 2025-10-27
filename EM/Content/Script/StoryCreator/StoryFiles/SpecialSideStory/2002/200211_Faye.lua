return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1716791550015909457",
      startPort = "Success",
      endStory = "17167916932871023203",
      endPort = "In"
    },
    {
      startStory = "17167916932871023203",
      startPort = "Success",
      endStory = "17167917396561023772",
      endPort = "In"
    },
    {
      startStory = "17167917396561023772",
      startPort = "Success",
      endStory = "17167918514511024954",
      endPort = "In"
    },
    {
      startStory = "17167918514511024954",
      startPort = "Success",
      endStory = "1716791260021344590",
      endPort = "StoryEnd"
    },
    {
      startStory = "1716791393123458283",
      startPort = "Success",
      endStory = "1716791550015909457",
      endPort = "In"
    },
    {
      startStory = "1716791260021344587",
      startPort = "StoryStart",
      endStory = "17512712050785232450",
      endPort = "In"
    },
    {
      startStory = "17512712050785232450",
      startPort = "Success",
      endStory = "1716791393123458283",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1716791260021344587"] = {
      isStoryNode = true,
      key = "1716791260021344587",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 491.92307692307685, y = 308.2775919732441},
      propsData = {QuestChainId = 200211},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1716791260021344590"] = {
      isStoryNode = true,
      key = "1716791260021344590",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2004.9115826702036, y = 287.58620689655174},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1716791393123458283"] = {
      isStoryNode = true,
      key = "1716791393123458283",
      type = "StoryNode",
      name = "\229\146\140\232\180\185\228\188\138\229\175\185\232\175\157",
      pos = {x = 743.5725165129658, y = 297.36166939467876},
      propsData = {
        QuestId = 20021101,
        QuestDescriptionComment = "\229\146\140\232\180\185\228\188\138\229\175\185\232\175\157",
        QuestDescription = "Description_200211_1",
        QuestDeatil = "Content_200211_1",
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
        StoryGuidePointName = "QuestPoint_SSS_Faye"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17175746784841023445",
            startPort = "Out",
            endQuest = "17175842391833316070",
            endPort = "In"
          },
          {
            startQuest = "17175842391833316070",
            startPort = "Out",
            endQuest = "1716791393123458289",
            endPort = "Success"
          },
          {
            startQuest = "1716791393123458288",
            startPort = "QuestStart",
            endQuest = "1717148878615982347",
            endPort = "In"
          },
          {
            startQuest = "1717148878615982347",
            startPort = "Out",
            endQuest = "1747126578546580181",
            endPort = "In"
          },
          {
            startQuest = "1747126578546580181",
            startPort = "Out",
            endQuest = "17175746784841023445",
            endPort = "In"
          }
        },
        nodeData = {
          ["1716791393123458288"] = {
            key = "1716791393123458288",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 528.9230769230769, y = 297},
            propsData = {ModeType = 0}
          },
          ["1716791393123458289"] = {
            key = "1716791393123458289",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1860.0783803153372, y = 296.45143334925945},
            propsData = {ModeType = 0}
          },
          ["1716791393123458290"] = {
            key = "1716791393123458290",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1717148878615982347"] = {
            key = "1717148878615982347",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 792.3223739886142, y = 282.5211707049775},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51003813,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20021101",
              BlendInTime = 0.5,
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
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700089,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700090,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700012,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700088,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700088},
                {TalkActorType = "Npc", TalkActorId = 700089},
                {TalkActorType = "Npc", TalkActorId = 700090},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700012}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17175746784841023445"] = {
            key = "17175746784841023445",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1320.2793348460666, y = 296.2478975571919},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1190479,
                1190480,
                1190481
              }
            }
          },
          ["17175842391833316070"] = {
            key = "17175842391833316070",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1581.6333721131473, y = 295.9155994205459},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190471}
            }
          },
          ["17176431399083699590"] = {
            key = "17176431399083699590",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1049.6124125235378, y = 81.93507536793925},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51003821,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = -1,
              BlendOutTime = 2,
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
          ["1747126578546580181"] = {
            key = "1747126578546580181",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1063.9453727235343, y = 266.7170309667449},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51003821,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 2,
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
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700089,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700090,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700012,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700088,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700088},
                {TalkActorType = "Npc", TalkActorId = 700089},
                {TalkActorType = "Npc", TalkActorId = 700090},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700012}
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
    ["1716791550015909457"] = {
      isStoryNode = true,
      key = "1716791550015909457",
      type = "StoryNode",
      name = "\229\142\187\232\180\171\230\176\145\231\170\159\229\146\140\232\180\185\228\188\138\229\175\185\232\175\157",
      pos = {x = 986.3552405355698, y = 294.4647716896849},
      propsData = {
        QuestId = 20021102,
        QuestDescriptionComment = "\229\142\187\232\180\171\230\176\145\231\170\159\229\146\140\232\180\185\228\188\138\229\175\185\232\175\157",
        QuestDescription = "Description_200211_2",
        QuestDeatil = "Content_200211_2",
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
        StoryGuidePointName = "Npc_Faye_1190471"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1717052183704246190",
            startPort = "Out",
            endQuest = "1717052972673850373",
            endPort = "In"
          },
          {
            startQuest = "1717052972673850373",
            startPort = "Out",
            endQuest = "1716791550016909463",
            endPort = "Success"
          },
          {
            startQuest = "1716791550016909462",
            startPort = "QuestStart",
            endQuest = "1717052183704246190",
            endPort = "In"
          }
        },
        nodeData = {
          ["1716791550016909462"] = {
            key = "1716791550016909462",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 752.5439777613691, y = 294.2592407592408},
            propsData = {ModeType = 0}
          },
          ["1716791550016909463"] = {
            key = "1716791550016909463",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1547.8943143812712, y = 299.1266602962255},
            propsData = {ModeType = 0}
          },
          ["1716791550016909464"] = {
            key = "1716791550016909464",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1717052183704246190"] = {
            key = "1717052183704246190",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1011.5352392401853, y = 298.99914341863365},
            propsData = {
              ImpressionTalkTriggerId = 510039,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Faye_1190471",
              GuideStaticCreatorId = 700104
            }
          },
          ["1717052972673850373"] = {
            key = "1717052972673850373",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1271.5737007786474, y = 297.8452972647877},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = true,
              EnableFadeIn = true,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190471}
            }
          }
        },
        commentData = {}
      }
    },
    ["17167916932871023203"] = {
      isStoryNode = true,
      key = "17167916932871023203",
      type = "StoryNode",
      name = "\228\184\142\229\136\187\232\150\132\231\154\132\229\173\166\231\148\159\229\175\185\232\175\157",
      pos = {x = 1235.8943052462075, y = 294.2702401675673},
      propsData = {
        QuestId = 20021103,
        QuestDescriptionComment = "\228\184\142\229\136\187\232\150\132\231\154\132\229\173\166\231\148\159\229\175\185\232\175\157",
        QuestDescription = "Description_200211_3",
        QuestDeatil = "Content_200211_3",
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
        StoryGuidePointName = "Npc_MeanStudent_1190479"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17167916932871023208",
            startPort = "QuestStart",
            endQuest = "17170537331501092372",
            endPort = "In"
          },
          {
            startQuest = "17170537331501092372",
            startPort = "Out",
            endQuest = "1717148046306858874",
            endPort = "In"
          },
          {
            startQuest = "1717148046306858874",
            startPort = "Out",
            endQuest = "17167916932871023209",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17167916932871023208"] = {
            key = "17167916932871023208",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1232.008547008547, y = 314.01709401709394},
            propsData = {ModeType = 0}
          },
          ["17167916932871023209"] = {
            key = "17167916932871023209",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2058.2789297658865, y = 313.06896798853325},
            propsData = {ModeType = 0}
          },
          ["17167916932871023210"] = {
            key = "17167916932871023210",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17170537331501092372"] = {
            key = "17170537331501092372",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1513.458316163263, y = 302.4606818801724},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700088,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_MeanStudent_1190479",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51004001,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20021103",
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
                  TalkActorType = "Npc",
                  TalkActorId = 700104,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700088,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700089,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700090,
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
                {TalkActorType = "Npc", TalkActorId = 700104},
                {TalkActorType = "Npc", TalkActorId = 700088},
                {TalkActorType = "Npc", TalkActorId = 700089},
                {TalkActorType = "Npc", TalkActorId = 700090},
                {TalkActorType = "Npc", TalkActorId = 100001},
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
          ["1717148046306858874"] = {
            key = "1717148046306858874",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1770.4761006966887, y = 313.5972576614993},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1190479,
                1190480,
                1190481
              }
            }
          }
        },
        commentData = {}
      }
    },
    ["17167917396561023772"] = {
      isStoryNode = true,
      key = "17167917396561023772",
      type = "StoryNode",
      name = "\230\149\153\232\174\173\232\180\185\228\188\138\231\154\132\229\144\140\229\173\166",
      pos = {x = 1485.1848362272349, y = 295.0221893677924},
      propsData = {
        QuestId = 20021104,
        QuestDescriptionComment = "\230\149\153\232\174\173\232\180\185\228\188\138\231\154\132\229\144\140\229\173\166",
        QuestDescription = "Description_200211_4",
        QuestDeatil = "Content_200211_4",
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
        StoryGuidePointName = "QuestPoint_SSS_Faye"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17170541358711333531",
            startPort = "Out",
            endQuest = "17170541640381333924",
            endPort = "In"
          },
          {
            startQuest = "17167917396561023777",
            startPort = "QuestStart",
            endQuest = "1717135453217246399",
            endPort = "In"
          },
          {
            startQuest = "1717135453217246399",
            startPort = "Out",
            endQuest = "17170541358711333531",
            endPort = "In"
          },
          {
            startQuest = "1718183719612798267",
            startPort = "Out",
            endQuest = "1718183719612798268",
            endPort = "In"
          },
          {
            startQuest = "17170541640381333924",
            startPort = "Out",
            endQuest = "1718183719612798267",
            endPort = "In"
          },
          {
            startQuest = "1718183719612798268",
            startPort = "Out",
            endQuest = "17167917396561023778",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17167917396561023777"] = {
            key = "17167917396561023777",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 136.45715603736596, y = 285.0305616422558},
            propsData = {ModeType = 0}
          },
          ["17167917396561023778"] = {
            key = "17167917396561023778",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1713.6165366034934, y = 287.78920082083505},
            propsData = {ModeType = 0}
          },
          ["17167917396561023779"] = {
            key = "17167917396561023779",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17170541358711333531"] = {
            key = "17170541358711333531",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 662.5369403127263, y = 291.21863943985403},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1190473,
                1190474,
                1190475
              }
            }
          },
          ["17170541640381333924"] = {
            key = "17170541640381333924",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 923.4463798237402, y = 280.92354660165773},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1190473,
                1190474,
                1190475
              }
            }
          },
          ["1717135453217246399"] = {
            key = "1717135453217246399",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 408.69074745011795, y = 278.1141160189134},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_SSS_Faye"
            }
          },
          ["1718183719612798267"] = {
            key = "1718183719612798267",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1195.0279789284032, y = 280.4055121760387},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51004101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20021104",
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
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700089,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700090,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700088,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 700088},
                {TalkActorType = "Npc", TalkActorId = 700089},
                {TalkActorType = "Npc", TalkActorId = 700090},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1718183719612798268"] = {
            key = "1718183719612798268",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1457.8618335628578, y = 280.6900622087154},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51004106,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 2,
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
    ["17167918514511024954"] = {
      isStoryNode = true,
      key = "17167918514511024954",
      type = "StoryNode",
      name = "\229\146\140\232\180\185\228\188\138\231\154\132\229\144\140\229\173\166\229\175\185\229\179\153",
      pos = {x = 1735.0914621683432, y = 295.6508901689068},
      propsData = {
        QuestId = 20021105,
        QuestDescriptionComment = "\229\146\140\232\180\185\228\188\138\231\154\132\229\144\140\229\173\166\229\175\185\229\179\153",
        QuestDescription = "Description_200211_5",
        QuestDeatil = "Content_200211_5",
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
        StoryGuidePointName = "Npc_Faye_1190476"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17170544099971455251",
            startPort = "Out",
            endQuest = "17167918514511024960",
            endPort = "Success"
          },
          {
            startQuest = "17167918514511024959",
            startPort = "QuestStart",
            endQuest = "17170544099971455251",
            endPort = "In"
          }
        },
        nodeData = {
          ["17167918514511024959"] = {
            key = "17167918514511024959",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1171.3181818181818, y = 316.6363636363636},
            propsData = {ModeType = 0}
          },
          ["17167918514511024960"] = {
            key = "17167918514511024960",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1722.9912174781741, y = 313.7700169395822},
            propsData = {ModeType = 0}
          },
          ["17167918514511024961"] = {
            key = "17167918514511024961",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17170544099971455251"] = {
            key = "17170544099971455251",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1451.0682062731523, y = 301.42222034171107},
            propsData = {
              ImpressionTalkTriggerId = 510041,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Faye_1190476",
              GuideStaticCreatorId = 700105
            }
          }
        },
        commentData = {}
      }
    },
    ["17512712050785232450"] = {
      isStoryNode = true,
      key = "17512712050785232450",
      type = "PreStoryNode",
      name = "\228\187\187\229\138\161\229\137\141\231\189\174\232\138\130\231\130\185",
      pos = {x = 740.2519032691447, y = 43.766614591863856},
      propsData = {
        QuestId = 20021100,
        QuestDescriptionComment = "",
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_NPC_Feiyi_1190334"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17512712050785232456",
            startPort = "ApproveOut",
            endQuest = "17512712050785232455",
            endPort = "Success"
          },
          {
            startQuest = "17512712050785232454",
            startPort = "QuestStart",
            endQuest = "17512712050785232458",
            endPort = "In"
          },
          {
            startQuest = "17512712050785232456",
            startPort = "CancelOut",
            endQuest = "17512712050785232457",
            endPort = "Fail"
          },
          {
            startQuest = "17512712050785232458",
            startPort = "Out",
            endQuest = "17512712050785232456",
            endPort = "Input"
          }
        },
        nodeData = {
          ["17512712050785232454"] = {
            key = "17512712050785232454",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17512712050785232455"] = {
            key = "17512712050785232455",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1921.190476190476, y = 44.04761904761904},
            propsData = {ModeType = 0}
          },
          ["17512712050785232456"] = {
            key = "17512712050785232456",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 1512.8571428571427, y = 120.57539682539687},
            propsData = {
              SideQuestChainId = 200211,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          },
          ["17512712050785232457"] = {
            key = "17512712050785232457",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1950.746928746929, y = 233.67949767949773},
            propsData = {}
          },
          ["17512712050785232458"] = {
            key = "17512712050785232458",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 994.5506777048766, y = 111.5737184824228},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700012,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_NPC_Feiyi_1190334",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51003801,
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
