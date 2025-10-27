return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1702882724750889",
      startPort = "Success",
      endStory = "1700738400583182495",
      endPort = "In"
    },
    {
      startStory = "1700738400583182495",
      startPort = "Success",
      endStory = "17398669692334648",
      endPort = "In"
    },
    {
      startStory = "17398669692334648",
      startPort = "Success",
      endStory = "1700737762327155743",
      endPort = "StoryEnd"
    },
    {
      startStory = "1700737762327155740",
      startPort = "StoryStart",
      endStory = "1751271012406983251",
      endPort = "In"
    },
    {
      startStory = "1751271012406983251",
      startPort = "Success",
      endStory = "1702882724750889",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1700737762327155740"] = {
      isStoryNode = true,
      key = "1700737762327155740",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 582.0749243403583, y = 126.17208661129031},
      propsData = {QuestChainId = 200204},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1700737762327155743"] = {
      isStoryNode = true,
      key = "1700737762327155743",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1761.7018522642393, y = 300.27894897182875},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1700738400583182495"] = {
      isStoryNode = true,
      key = "1700738400583182495",
      type = "StoryNode",
      name = "\231\156\139wells\229\146\140\229\178\179\231\136\182\229\144\181\230\158\182",
      pos = {x = 1158.6651336802922, y = 321.8621234901212},
      propsData = {
        QuestId = 20020404,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200204_4",
        QuestDeatil = "Content_200204_4",
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
        SubRegionId = 101107,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Wells_1220057"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1704175979523221229",
            startPort = "QuestStart",
            endQuest = "1700818004159129368",
            endPort = "In"
          },
          {
            startQuest = "1700817966991123103",
            startPort = "Out",
            endQuest = "1704175979523221232",
            endPort = "In"
          },
          {
            startQuest = "1704175979523221232",
            startPort = "Out",
            endQuest = "1700818085759139321",
            endPort = "In"
          },
          {
            startQuest = "1700818085759139321",
            startPort = "Out",
            endQuest = "1704175979523221230",
            endPort = "Success"
          },
          {
            startQuest = "1700818004159129368",
            startPort = "Out",
            endQuest = "170167476653057935",
            endPort = "In"
          },
          {
            startQuest = "170167476653057935",
            startPort = "Out",
            endQuest = "1700817966991123103",
            endPort = "In"
          }
        },
        nodeData = {
          ["1700817966991123103"] = {
            key = "1700817966991123103",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\128\129\228\184\136\228\186\186",
            pos = {x = 1109.5854678949188, y = 298.0681524651253},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1220058}
            }
          },
          ["1700818004159129368"] = {
            key = "1700818004159129368",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\233\133\146\233\166\134",
            pos = {x = 608.0664337127942, y = 297.8550608744546},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101107,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "TargetPoint_Tavern"
            }
          },
          ["1700818085759139321"] = {
            key = "1700818085759139321",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\232\128\129\228\184\136\228\186\186",
            pos = {x = 1625.01228547085, y = 305.42559216632714},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1220058}
            }
          },
          ["170167476653057935"] = {
            key = "170167476653057935",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 856.4748506413533, y = 298.57375269601437},
            propsData = {WaitTime = 1}
          },
          ["1704175979523221229"] = {
            key = "1704175979523221229",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 366.1561866125766, y = 297.396103589792},
            propsData = {ModeType = 0}
          },
          ["1704175979523221230"] = {
            key = "1704175979523221230",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1883.8185895678805, y = 310.5896218577761},
            propsData = {ModeType = 0}
          },
          ["1704175979523221231"] = {
            key = "1704175979523221231",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1775.2570269487114, y = 465.09069834830507},
            propsData = {}
          },
          ["1704175979523221232"] = {
            key = "1704175979523221232",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1373.5932744292993, y = 303.7959726023825},
            propsData = {
              ImpressionTalkTriggerId = 510019,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Wells_1220057",
              GuideStaticCreatorId = 200015
            }
          }
        },
        commentData = {}
      }
    },
    ["1702882724750889"] = {
      isStoryNode = true,
      key = "1702882724750889",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\144\229\137\175\230\156\172",
      pos = {x = 838.8909356718741, y = 337.31727206686514},
      propsData = {
        QuestId = 20020403,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200204_3",
        QuestDeatil = "Content_200204_3",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        InRegionExportName = "",
        bIsStartQuest = true,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        GameModeTargetId = 20020401,
        GameModeKeyCount = 1,
        QuestHintMessageId = 0,
        IsShowGuide = false,
        GuideType = "P",
        GuidePointName = "",
        InterfaceJumpId = 19
      },
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17398669692334648"] = {
      isStoryNode = true,
      key = "17398669692334648",
      type = "StoryNode",
      name = "\229\137\141\229\142\187\229\188\128\229\149\164\233\133\146",
      pos = {x = 1470.602540834846, y = 305.9498314752398},
      propsData = {
        QuestId = 20020405,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200204_5",
        QuestDeatil = "Content_200204_5",
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
        SubRegionId = 101107,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_20020405"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17398669692334657",
            startPort = "QuestStart",
            endQuest = "17398672210361544614",
            endPort = "In"
          },
          {
            startQuest = "17398682717013084081",
            startPort = "Out",
            endQuest = "17398682931003853092",
            endPort = "In"
          },
          {
            startQuest = "17398682931003853092",
            startPort = "Out",
            endQuest = "17398778054098482303",
            endPort = "In"
          },
          {
            startQuest = "17398672210361544614",
            startPort = "Out",
            endQuest = "17399347243681084",
            endPort = "In"
          },
          {
            startQuest = "17399347243681084",
            startPort = "Out",
            endQuest = "17398677296692314107",
            endPort = "In"
          },
          {
            startQuest = "17398677296692314107",
            startPort = "Out",
            endQuest = "17398682717013084081",
            endPort = "In"
          },
          {
            startQuest = "17398778054098482303",
            startPort = "Out",
            endQuest = "17399347538061965",
            endPort = "In"
          },
          {
            startQuest = "17399347538061965",
            startPort = "Out",
            endQuest = "17398669692334658",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17398669692334657"] = {
            key = "17398669692334657",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 495.96128406385105, y = 314.98231048634375},
            propsData = {ModeType = 0}
          },
          ["17398669692334658"] = {
            key = "17398669692334658",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2572.295601062133, y = 290.24479427156916},
            propsData = {ModeType = 0}
          },
          ["17398669692334659"] = {
            key = "17398669692334659",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2194.222544190091, y = 472.3320776586499},
            propsData = {}
          },
          ["17398672210361544614"] = {
            key = "17398672210361544614",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\233\133\146\233\166\134",
            pos = {x = 767.7153161864449, y = 301.52023988006005},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101107,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_20020405"
            }
          },
          ["17398677296692314107"] = {
            key = "17398677296692314107",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1248.4044359122965, y = 298.4703362604413},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1220118,
              StateId = 572,
              IsGuideEnable = true,
              GuidePointName = "QuestPoint_20020405"
            }
          },
          ["17398682717013084081"] = {
            key = "17398682717013084081",
            type = "GoToRegionNode",
            name = "\231\173\137\229\190\133\232\191\155\229\133\165\233\133\146\233\166\134",
            pos = {x = 1504.180297981262, y = 301.03191261512114},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101107,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17398682931003853092"] = {
            key = "17398682931003853092",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \231\156\139\229\168\129\229\176\148\230\150\175\232\176\136\231\172\145\233\163\142\231\148\159",
            pos = {x = 1743.6887580369487, y = 298.8151638466481},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51001935,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20020405",
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
                  TalkActorId = 700207,
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
                {TalkActorType = "Npc", TalkActorId = 700207},
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
          ["17398778054098482303"] = {
            key = "17398778054098482303",
            type = "TalkNode",
            name = "\233\187\145\229\177\143 - \231\156\139\229\168\129\229\176\148\230\150\175\232\176\136\231\172\145\233\163\142\231\148\159",
            pos = {x = 2017.1113324640214, y = 293.3389733704577},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51001936,
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
          ["17399347243681084"] = {
            key = "17399347243681084",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\156\186\229\133\179",
            pos = {x = 1014.9072547059801, y = 314.3808095952023},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1220118}
            }
          },
          ["17399347538061965"] = {
            key = "17399347538061965",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\156\186\229\133\179",
            pos = {x = 2291.2003581542563, y = 290.107410580424},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1220118}
            }
          }
        },
        commentData = {}
      }
    },
    ["1751271012406983251"] = {
      isStoryNode = true,
      key = "1751271012406983251",
      type = "PreStoryNode",
      name = "\228\187\187\229\138\161\229\137\141\231\189\174\232\138\130\231\130\185",
      pos = {x = 839.0326086956522, y = 113.46920289855075},
      propsData = {
        QuestId = 20020400,
        QuestDescriptionComment = "",
        SubRegionId = 101107,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Wells_1220120"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1751271012406983257",
            startPort = "ApproveOut",
            endQuest = "1751271012406983256",
            endPort = "Success"
          },
          {
            startQuest = "1751271012406983255",
            startPort = "QuestStart",
            endQuest = "1751271012406983259",
            endPort = "In"
          },
          {
            startQuest = "1751271012406983257",
            startPort = "CancelOut",
            endQuest = "1751271012406983258",
            endPort = "Fail"
          },
          {
            startQuest = "1751271012406983259",
            startPort = "Fail",
            endQuest = "1751271012406983258",
            endPort = "Fail"
          },
          {
            startQuest = "1751271012406983259",
            startPort = "Out",
            endQuest = "1751271012406983257",
            endPort = "Input"
          }
        },
        nodeData = {
          ["1751271012406983255"] = {
            key = "1751271012406983255",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1751271012406983256"] = {
            key = "1751271012406983256",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1799.1904761904761, y = 189.3809523809524},
            propsData = {ModeType = 0}
          },
          ["1751271012406983257"] = {
            key = "1751271012406983257",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 1502.190476190476, y = 300.3809523809524},
            propsData = {
              SideQuestChainId = 200204,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          },
          ["1751271012406983258"] = {
            key = "1751271012406983258",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1820.3144963144964, y = 494.15847665847673},
            propsData = {}
          },
          ["1751271012406983259"] = {
            key = "1751271012406983259",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1147.0923593022994, y = 296.65803057877923},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200015,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Wells_1220120",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51001801,
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
                  TalkActorType = "Npc",
                  TalkActorId = 200015,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200003,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 200015},
                {TalkActorType = "Npc", TalkActorId = 200003}
              },
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
    }
  },
  commentData = {}
}
