return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "170143106653317330",
      startPort = "Success",
      endStory = "170143036906414032",
      endPort = "StoryEnd"
    },
    {
      startStory = "170143105374516790",
      startPort = "Success",
      endStory = "170435751793830008",
      endPort = "In"
    },
    {
      startStory = "170435751793830008",
      startPort = "Success",
      endStory = "170435767734732642",
      endPort = "In"
    },
    {
      startStory = "170435767734732642",
      startPort = "Success",
      endStory = "174003852026723490188",
      endPort = "In"
    },
    {
      startStory = "174003852026723490188",
      startPort = "Success",
      endStory = "1740052656236806",
      endPort = "In"
    },
    {
      startStory = "17400528844481563225",
      startPort = "Success",
      endStory = "170143106653317330",
      endPort = "In"
    },
    {
      startStory = "17401219986371075",
      startPort = "Success",
      endStory = "17400528844481563225",
      endPort = "In"
    },
    {
      startStory = "170143036906414029",
      startPort = "StoryStart",
      endStory = "17512710557341964057",
      endPort = "In"
    },
    {
      startStory = "1740052656236806",
      startPort = "Success",
      endStory = "17405379927842808",
      endPort = "In"
    },
    {
      startStory = "17405379927842808",
      startPort = "Success",
      endStory = "17401219986371075",
      endPort = "In"
    },
    {
      startStory = "17512710557341964057",
      startPort = "Success",
      endStory = "170143105374516790",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["170143036906414029"] = {
      isStoryNode = true,
      key = "170143036906414029",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 300},
      propsData = {QuestChainId = 200205},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["170143036906414032"] = {
      isStoryNode = true,
      key = "170143036906414032",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2435.024742002064, y = 450.8551083591331},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["170143104144116404"] = {
      isStoryNode = true,
      key = "170143104144116404",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\229\135\128\231\149\140\229\178\155",
      pos = {x = 1079.8186383601144, y = 288.34504286077504},
      propsData = {
        QuestId = 20020502,
        QuestDescriptionComment = "\229\155\158\230\157\145\229\186\132",
        QuestDescription = "Description_200205_2",
        QuestDeatil = "Content_200205_2",
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
        SubRegionId = 100101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_Blue_1590049"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1704175979530221389",
            startPort = "QuestStart",
            endQuest = "170185275095664542",
            endPort = "In"
          },
          {
            startQuest = "170185275095664542",
            startPort = "Out",
            endQuest = "1704175979530221390",
            endPort = "Success"
          }
        },
        nodeData = {
          ["170185275095664542"] = {
            key = "170185275095664542",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1096.0431746940933, y = 281.9982325850819},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 100101,
              bGuideUIEnable = true,
              GuideType = "M",
              GuideName = "Mechanism_QuestTrigger_Blue_1590049"
            }
          },
          ["1704175979530221389"] = {
            key = "1704175979530221389",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1704175979530221390"] = {
            key = "1704175979530221390",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1393.2571428571428, y = 295.31428571428575},
            propsData = {ModeType = 0}
          },
          ["1704175979530221391"] = {
            key = "1704175979530221391",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          }
        },
        commentData = {}
      }
    },
    ["170143105374516790"] = {
      isStoryNode = true,
      key = "170143105374516790",
      type = "StoryNode",
      name = "\229\142\187\229\184\131\233\178\129\229\134\133\230\137\152\231\154\132\229\174\182",
      pos = {x = 1349.0475443765488, y = 287.72825814536344},
      propsData = {
        QuestId = 20020503,
        QuestDescriptionComment = "\230\137\190\228\184\156\232\165\191",
        QuestDescription = "Description_200205_3",
        QuestDeatil = "Content_200205_3",
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
        SubRegionId = 100101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_QuestTrigger_Blue_1590049"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "170435767215932408",
            startPort = "Out",
            endQuest = "170435767215932409",
            endPort = "In"
          },
          {
            startQuest = "170435767215932408",
            startPort = "Out",
            endQuest = "170435767215932410",
            endPort = "In"
          },
          {
            startQuest = "170435767215932410",
            startPort = "Out",
            endQuest = "1704175979530221393",
            endPort = "Success"
          },
          {
            startQuest = "1704175979530221392",
            startPort = "QuestStart",
            endQuest = "17412603969887542",
            endPort = "In"
          },
          {
            startQuest = "17412603969887542",
            startPort = "Out",
            endQuest = "170435767215932408",
            endPort = "In"
          }
        },
        nodeData = {
          ["1704175979530221392"] = {
            key = "1704175979530221392",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 663.5333333333334, y = 303.8666666666667},
            propsData = {ModeType = 0}
          },
          ["1704175979530221393"] = {
            key = "1704175979530221393",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1794.3378151260506, y = 236.3159663865546},
            propsData = {ModeType = 0}
          },
          ["1704175979530221394"] = {
            key = "1704175979530221394",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1907.142857142857, y = 715.7142857142857},
            propsData = {}
          },
          ["170435767215932408"] = {
            key = "170435767215932408",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1177.715396800615, y = 312.46647157496955},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1590049,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_Blue_1590049"
            }
          },
          ["170435767215932409"] = {
            key = "170435767215932409",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1497.3966428612052, y = 408.58770384362066},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51002101,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["170435767215932410"] = {
            key = "170435767215932410",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1498.1921797066575, y = 235.415834159335},
            propsData = {WaitTime = 0.5}
          },
          ["17412603969887542"] = {
            key = "17412603969887542",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 927.9555555555555, y = 307.20000000000005},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "20020503BlueExplore",
              UnitId = -1
            }
          }
        },
        commentData = {}
      }
    },
    ["170143106653317330"] = {
      isStoryNode = true,
      key = "170143106653317330",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 2131.800733397859, y = 459.44675090131744},
      propsData = {
        QuestId = 20020506,
        QuestDescriptionComment = "\230\137\190\229\184\131\233\178\129\229\134\133\230\137\152",
        QuestDescription = "Description_200205_6",
        QuestDeatil = "Content_200205_6",
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
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Bulu_1190178"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1704175979530221395",
            startPort = "QuestStart",
            endQuest = "170186186999075244",
            endPort = "In"
          },
          {
            startQuest = "170186186999075244",
            startPort = "Out",
            endQuest = "1704175979530221396",
            endPort = "Success"
          }
        },
        nodeData = {
          ["170186186999075244"] = {
            key = "170186186999075244",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = 1291.2766868341275, y = 279.7025521785316},
            propsData = {
              ImpressionTalkTriggerId = 510022,
              bShowGuide = true,
              GuideType = "N",
              NPCStaticCreaterName = "Npc_Bulu_1190178",
              GuideStaticCreatorId = 700048
            }
          },
          ["1704175979530221395"] = {
            key = "1704175979530221395",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1704175979530221396"] = {
            key = "1704175979530221396",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1847.142857142857, y = 315.7142857142857},
            propsData = {ModeType = 0}
          },
          ["1704175979530221397"] = {
            key = "1704175979530221397",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          }
        },
        commentData = {}
      }
    },
    ["170435751793830008"] = {
      isStoryNode = true,
      key = "170435751793830008",
      type = "StoryNode",
      name = "\229\175\187\230\137\190\233\146\165\229\140\153",
      pos = {x = 1606.5003475766657, y = 287.6241100591131},
      propsData = {
        QuestId = 20020504,
        QuestDescriptionComment = "\230\137\190\228\184\156\232\165\191",
        QuestDescription = "Description_200205_4",
        QuestDeatil = "Content_200205_4",
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
        SubRegionId = 100101,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_Blue2"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "170435751793930015",
            startPort = "QuestStart",
            endQuest = "170435770263433652",
            endPort = "Input"
          },
          {
            startQuest = "170435751793930015",
            startPort = "QuestStart",
            endQuest = "171145224140838238",
            endPort = "Input"
          },
          {
            startQuest = "171145224140838238",
            startPort = "Out",
            endQuest = "170435751793930016",
            endPort = "Success"
          },
          {
            startQuest = "170435770263433652",
            startPort = "Out",
            endQuest = "174001769791116522555",
            endPort = "In"
          },
          {
            startQuest = "174001769791116522555",
            startPort = "Out",
            endQuest = "170435751793930016",
            endPort = "Success"
          }
        },
        nodeData = {
          ["170435751793930015"] = {
            key = "170435751793930015",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 585.2, y = 307.2},
            propsData = {ModeType = 0}
          },
          ["170435751793930016"] = {
            key = "170435751793930016",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1413.3822595704949, y = 317.0963585434173},
            propsData = {ModeType = 0}
          },
          ["170435751793930017"] = {
            key = "170435751793930017",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1907.142857142857, y = 715.7142857142857},
            propsData = {}
          },
          ["170435770263433652"] = {
            key = "170435770263433652",
            type = "ResourceCollectNode",
            name = "\229\175\187\230\137\190\233\146\165\229\140\153",
            pos = {x = 887.7826652589841, y = 237.28269591769873},
            propsData = {
              ResourceType = "Resource",
              ResourceId = 20501,
              ResourceSType = "None",
              NeedCount = 1,
              bUseBagCount = true,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_Blue2"
            }
          },
          ["171145224140838238"] = {
            key = "171145224140838238",
            type = "ResourceCollectNode",
            name = "\230\137\147\229\188\128\229\174\157\231\174\177",
            pos = {x = 886.239094831523, y = 401.6670249867992},
            propsData = {
              ResourceType = "Resource",
              ResourceId = 3000003,
              ResourceSType = "None",
              NeedCount = 1,
              bUseBagCount = true,
              bGuideUIEnable = false,
              GuideType = "P",
              GuidePointName = "QuestPoint_Blue"
            }
          },
          ["174001769791116522555"] = {
            key = "174001769791116522555",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1133.4664289958407, y = 137.9459298871064},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51002104,
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
    ["170435767734732642"] = {
      isStoryNode = true,
      key = "170435767734732642",
      type = "StoryNode",
      name = "\230\137\147\229\188\128\229\174\157\231\174\177",
      pos = {x = 1864.673435025616, y = 285.47710151210447},
      propsData = {
        QuestId = 20020505,
        QuestDescriptionComment = "\229\188\128\231\174\177\229\173\144",
        QuestDescription = "Description_200205_5",
        QuestDeatil = "Content_200205_5",
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
        SubRegionId = 100101,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_Blue"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "170435767734732646",
            startPort = "Out",
            endQuest = "174001765462215748437",
            endPort = "In"
          },
          {
            startQuest = "174001869891318846343",
            startPort = "Out",
            endQuest = "174001885048119620004",
            endPort = "In"
          },
          {
            startQuest = "174001885048119620004",
            startPort = "Out",
            endQuest = "170435767734732650",
            endPort = "Success"
          },
          {
            startQuest = "170435767734732649",
            startPort = "QuestStart",
            endQuest = "170435767734732646",
            endPort = "Input"
          },
          {
            startQuest = "174001765462215748437",
            startPort = "Out",
            endQuest = "174001869891318846343",
            endPort = "In"
          }
        },
        nodeData = {
          ["170435767734732646"] = {
            key = "170435767734732646",
            type = "ResourceCollectNode",
            name = "\230\137\147\229\188\128\229\174\157\231\174\177",
            pos = {x = 1100.1571428571428, y = 277.597600225861},
            propsData = {
              ResourceType = "Resource",
              ResourceId = 3000003,
              ResourceSType = "None",
              NeedCount = 1,
              bUseBagCount = true,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_Blue"
            }
          },
          ["170435767734732649"] = {
            key = "170435767734732649",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 844.4000000000001, y = 285.59999999999997},
            propsData = {ModeType = 0}
          },
          ["170435767734732650"] = {
            key = "170435767734732650",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2191.285714285714, y = 304.4285714285714},
            propsData = {ModeType = 0}
          },
          ["170435767734732651"] = {
            key = "170435767734732651",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2191.1428571428573, y = 441.71428571428555},
            propsData = {}
          },
          ["174001765462215748437"] = {
            key = "174001765462215748437",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1373.9805194805194, y = 302.6623376623377},
            propsData = {WaitTime = 0.5}
          },
          ["174001869891318846343"] = {
            key = "174001869891318846343",
            type = "GoToRegionNode",
            name = "\230\163\128\230\181\139\229\189\147\229\137\141\229\140\186\229\159\159",
            pos = {x = 1654.9548872180449, y = 293.5789473684212},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 100101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_Blue"
            }
          },
          ["174001885048119620004"] = {
            key = "174001885048119620004",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \231\167\189\229\133\189\229\135\186\231\142\176",
            pos = {x = 1917.9548872180449, y = 292.57894736842127},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51002105,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_51002105",
              BlendInTime = 0.5,
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
                  TalkActorId = 700208,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700209,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700208},
                {TalkActorType = "Npc", TalkActorId = 700209}
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
    ["174003852026723490188"] = {
      isStoryNode = true,
      key = "174003852026723490188",
      type = "StoryNode",
      name = "\229\135\187\230\157\128\231\167\189\229\133\189",
      pos = {x = 1081.9338863750631, y = 461.0771744595274},
      propsData = {
        QuestId = 20020507,
        QuestDescriptionComment = "\230\137\147\230\128\170",
        QuestDescription = "Description_200205_7",
        QuestDeatil = "Content_200205_7",
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
        SubRegionId = 100101,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_Blue"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "174003852026723490194",
            startPort = "QuestStart",
            endQuest = "174003864291124265537",
            endPort = "In"
          },
          {
            startQuest = "174003864291124265537",
            startPort = "Out",
            endQuest = "174003885213225040186",
            endPort = "In"
          },
          {
            startQuest = "174003885213225040186",
            startPort = "Out",
            endQuest = "174003934722025815558",
            endPort = "In"
          },
          {
            startQuest = "174003943843127363865",
            startPort = "Out",
            endQuest = "174003950509128138271",
            endPort = "In"
          },
          {
            startQuest = "174003950509128138271",
            startPort = "Out",
            endQuest = "174003852026723490195",
            endPort = "Success"
          },
          {
            startQuest = "17466238684445036031",
            startPort = "Out",
            endQuest = "17466238684445036034",
            endPort = "In"
          },
          {
            startQuest = "17466238684445036036",
            startPort = "Out",
            endQuest = "17466238684445036035",
            endPort = "In"
          },
          {
            startQuest = "174003864291124265537",
            startPort = "Out",
            endQuest = "17466238684445036030",
            endPort = "In"
          },
          {
            startQuest = "174003864291124265537",
            startPort = "Out",
            endQuest = "17466238684445036031",
            endPort = "In"
          },
          {
            startQuest = "17466238684445036035",
            startPort = "Out",
            endQuest = "17466248283516713645",
            endPort = "Input_2"
          },
          {
            startQuest = "17466248283516713645",
            startPort = "Out",
            endQuest = "174003852026723490196",
            endPort = "Fail"
          },
          {
            startQuest = "17466238684445036031",
            startPort = "Out",
            endQuest = "17466248167906713429",
            endPort = "In"
          },
          {
            startQuest = "17466248167906713429",
            startPort = "Out",
            endQuest = "17466238684445036036",
            endPort = "In"
          },
          {
            startQuest = "174003934722025815558",
            startPort = "Out",
            endQuest = "17471477089775144073",
            endPort = "In"
          },
          {
            startQuest = "17471477089775144073",
            startPort = "Out",
            endQuest = "174003943843127363865",
            endPort = "In"
          },
          {
            startQuest = "17466238684445036030",
            startPort = "Out",
            endQuest = "175429541005211496565",
            endPort = "In"
          },
          {
            startQuest = "175429541005211496565",
            startPort = "Out",
            endQuest = "174003852026723490196",
            endPort = "Fail"
          },
          {
            startQuest = "175429543030612479822",
            startPort = "Out",
            endQuest = "17466248283516713645",
            endPort = "Input_1"
          },
          {
            startQuest = "17466238684445036034",
            startPort = "Out",
            endQuest = "175429543030612479822",
            endPort = "In"
          }
        },
        nodeData = {
          ["174003852026723490194"] = {
            key = "174003852026723490194",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["174003852026723490195"] = {
            key = "174003852026723490195",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2390.112554112554, y = 279.2900432900433},
            propsData = {ModeType = 0}
          },
          ["174003852026723490196"] = {
            key = "174003852026723490196",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2381.825396825396, y = 518.3333333333334},
            propsData = {}
          },
          ["174003864291124265537"] = {
            key = "174003864291124265537",
            type = "GoToRegionNode",
            name = "\230\163\128\230\181\139\229\189\147\229\137\141\229\140\186\229\159\159",
            pos = {x = 1067.753246753247, y = 287.1818181818181},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 100101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_Blue"
            }
          },
          ["174003885213225040186"] = {
            key = "174003885213225040186",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1317.1099718994453, y = 300.5151515151514},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1590263,
                1590264,
                1590265,
                1590266,
                1590267
              }
            }
          },
          ["174003934722025815558"] = {
            key = "174003934722025815558",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1575.531024531024, y = 284.95959595959584},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 5,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1590263,
                1590264,
                1590265,
                1590266,
                1590267
              }
            }
          },
          ["174003943843127363865"] = {
            key = "174003943843127363865",
            type = "GoToRegionNode",
            name = "\230\163\128\230\181\139\229\189\147\229\137\141\229\140\186\229\159\159",
            pos = {x = 1838.37100177935, y = 283.72180826264304},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 100101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_Blue"
            }
          },
          ["174003950509128138271"] = {
            key = "174003950509128138271",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\151\167\230\151\182\229\155\158\229\191\134",
            pos = {x = 2093.37100177935, y = 282.72180826264304},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51002106,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_51002106",
              BlendInTime = 0.5,
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
                  TalkActorId = 700211,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 700211}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17466238684445036030"] = {
            key = "17466238684445036030",
            type = "GoToRegionNode",
            name = "\231\166\187\229\188\128\229\189\147\229\137\141\229\140\186\229\159\159",
            pos = {x = 1311.4402420737492, y = 547.2746696477902},
            propsData = {
              RegionType = 1,
              IsEnter = "Leave",
              RegionId = 100101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17466238684445036031"] = {
            key = "17466238684445036031",
            type = "MonitorPlayerStatusNode",
            name = "\231\155\145\229\144\172\231\142\169\229\174\182\231\138\182\230\128\129",
            pos = {x = 1321.1163796645694, y = 773.2335855803537},
            propsData = {
              ListenHPPercent = false,
              ListenESPercent = false,
              ListenSPPercent = false,
              ListenDead = true
            }
          },
          ["17466238684445036034"] = {
            key = "17466238684445036034",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1595.652056931593, y = 801.8749633279294},
            propsData = {WaitTime = 1}
          },
          ["17466238684445036035"] = {
            key = "17466238684445036035",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2113.6756999552363, y = 966.4653729183387},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "QuestPoint_Blue_ReStart",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17466238684445036036"] = {
            key = "17466238684445036036",
            type = "RefreshPlayerNode",
            name = "\233\135\141\230\150\176\229\136\157\229\167\139\229\140\150\231\142\169\229\174\182",
            pos = {x = 1872.4659878627638, y = 972.7178012119912},
            propsData = {}
          },
          ["17466248167906713429"] = {
            key = "17466248167906713429",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1594.6521070462718, y = 970.7696439715892},
            propsData = {WaitTime = 1.9}
          },
          ["17466248283516713645"] = {
            key = "17466248283516713645",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2289.1975615917263, y = 768.9514621534073},
            propsData = {ListenCount = 2, NeedFinishCount = 2}
          },
          ["17471477089775144073"] = {
            key = "17471477089775144073",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1836.2167572130388, y = 107.7139054690542},
            propsData = {WaitTime = 2}
          },
          ["175429541005211496565"] = {
            key = "175429541005211496565",
            type = "FailBlackScreenNode",
            name = "\229\164\177\232\180\165\233\187\145\229\177\143\232\138\130\231\130\185",
            pos = {x = 1909.5916642003044, y = 551.554720052487},
            propsData = {
              Text = "FailBlackScreenHode_1",
              FadeInTime = 0,
              FadeOutTime = 0.5,
              ContinueTime = 2
            }
          },
          ["175429543030612479822"] = {
            key = "175429543030612479822",
            type = "FailBlackScreenNode",
            name = "\229\164\177\232\180\165\233\187\145\229\177\143\232\138\130\231\130\185",
            pos = {x = 1943.8800976267823, y = 775.891669455741},
            propsData = {
              Text = "FailBlackScreenHode_1",
              FadeInTime = 0,
              FadeOutTime = 0.5,
              ContinueTime = 2
            }
          }
        },
        commentData = {}
      }
    },
    ["1740052656236806"] = {
      isStoryNode = true,
      key = "1740052656236806",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\233\171\152\231\130\185\232\144\189\229\186\167",
      pos = {x = 1354.6932608281243, y = 463.19626446007356},
      propsData = {
        QuestId = 20020508,
        QuestDescriptionComment = "\229\137\141\229\190\128\233\171\152\231\130\185\232\144\189\229\186\167",
        QuestDescription = "Description_200205_8",
        QuestDeatil = "Content_200205_8",
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
        SubRegionId = 100101,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_20020508"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1740052656236811",
            startPort = "QuestStart",
            endQuest = "1740052656236814",
            endPort = "In"
          },
          {
            startQuest = "1740052656236814",
            startPort = "Out",
            endQuest = "1740052656236815",
            endPort = "In"
          },
          {
            startQuest = "1740052656236815",
            startPort = "Out",
            endQuest = "1740052656236818",
            endPort = "In"
          },
          {
            startQuest = "1740052656236818",
            startPort = "Out",
            endQuest = "17401188197833912190",
            endPort = "In"
          },
          {
            startQuest = "17401188197833912190",
            startPort = "Out",
            endQuest = "1740052656236812",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1740052656236811"] = {
            key = "1740052656236811",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1740052656236812"] = {
            key = "1740052656236812",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2106.5641670157797, y = 294.77391425778524},
            propsData = {ModeType = 0}
          },
          ["1740052656236813"] = {
            key = "1740052656236813",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2390.1587301587297, y = 416.6666666666667},
            propsData = {}
          },
          ["1740052656236814"] = {
            key = "1740052656236814",
            type = "GoToRegionNode",
            name = "\230\163\128\230\181\139\229\189\147\229\137\141\229\140\186\229\159\159",
            pos = {x = 1065.4455544455545, y = 287.1818181818181},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 100101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_20020508"
            }
          },
          ["1740052656236815"] = {
            key = "1740052656236815",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1315.5310245310243, y = 300.5151515151514},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1590271}
            }
          },
          ["1740052656236818"] = {
            key = "1740052656236818",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\151\167\230\151\182\229\155\158\229\191\134",
            pos = {x = 1586.97100177935, y = 287.52180826264305},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700212,
              GuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_20020508",
              DelayShowGuideTime = 0,
              FirstDialogueId = 51002111,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_51002111",
              BlendInTime = 0.5,
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
                  TalkActorId = 700210,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 700210}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17401188197833912190"] = {
            key = "17401188197833912190",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1848.5775772614484, y = 295.11249253592706},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1590271}
            }
          }
        },
        commentData = {}
      }
    },
    ["17400528844481563225"] = {
      isStoryNode = true,
      key = "17400528844481563225",
      type = "StoryNode",
      name = "\232\191\148\229\155\158\229\134\176\230\185\150\229\159\142",
      pos = {x = 1879.6462248296903, y = 460.0051858113193},
      propsData = {
        QuestId = 20020510,
        QuestDescriptionComment = "\232\191\148\229\155\158\229\134\176\230\185\150\229\159\142",
        QuestDescription = "Description_200205_10",
        QuestDeatil = "Content_200205_10",
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
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Bulu_1190178"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17401191270285476210",
            startPort = "Out",
            endQuest = "17400528844481563231",
            endPort = "Success"
          },
          {
            startQuest = "17400528844481563230",
            startPort = "QuestStart",
            endQuest = "17401191270285476210",
            endPort = "In"
          }
        },
        nodeData = {
          ["17400528844481563230"] = {
            key = "17400528844481563230",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1550, y = 332.72727272727275},
            propsData = {ModeType = 0}
          },
          ["17400528844481563231"] = {
            key = "17400528844481563231",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2390.112554112554, y = 279.2900432900433},
            propsData = {ModeType = 0}
          },
          ["17400528844481563232"] = {
            key = "17400528844481563232",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2390.1587301587297, y = 416.6666666666667},
            propsData = {}
          },
          ["17401191270285476210"] = {
            key = "17401191270285476210",
            type = "GoToRegionNode",
            name = "\232\191\148\229\155\158\229\134\176\230\185\150\229\159\142",
            pos = {x = 2051.1400208986415, y = 318.06635318704275},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = true,
              GuideType = "N",
              GuideName = "Npc_Bulu_1190178"
            }
          },
          ["17401191812305476855"] = {
            key = "17401191812305476855",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1812.8066875653085, y = 473.1812957157782},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51002117,
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
    ["17401219986371075"] = {
      isStoryNode = true,
      key = "17401219986371075",
      type = "StoryNode",
      name = "\232\191\155\232\161\140\233\146\147\233\177\188",
      pos = {x = 1622.2104791759964, y = 459.30609046126295},
      propsData = {
        QuestId = 20020509,
        QuestDescriptionComment = "\232\191\155\232\161\140\233\146\147\233\177\188",
        QuestDescription = "Description_200205_9",
        QuestDeatil = "Content_200205_9",
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
        SubRegionId = 100101,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_20020509"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17405402683022346495",
            startPort = "Out",
            endQuest = "17401219986371081",
            endPort = "Success"
          },
          {
            startQuest = "17401219986371080",
            startPort = "QuestStart",
            endQuest = "17405402683022346495",
            endPort = "In"
          }
        },
        nodeData = {
          ["17401219986371080"] = {
            key = "17401219986371080",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17401219986371081"] = {
            key = "17401219986371081",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1913.294936246549, y = 329.58160656547756},
            propsData = {ModeType = 0}
          },
          ["17401219986371082"] = {
            key = "17401219986371082",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2390.1587301587297, y = 416.6666666666667},
            propsData = {}
          },
          ["17405402683022346495"] = {
            key = "17405402683022346495",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1420.9939245705161, y = 316.2896089417829},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51002117,
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
    ["17405379927842808"] = {
      isStoryNode = true,
      key = "17405379927842808",
      type = "GameModeCompleteNode",
      name = "\232\191\155\232\161\140\233\146\147\233\177\188",
      pos = {x = 1606.62987012987, y = 655.0194805194806},
      propsData = {
        QuestId = 20020512,
        QuestDescriptionComment = "\232\191\155\232\161\140\233\146\147\233\177\188",
        QuestDescription = "Description_200205_9",
        QuestDeatil = "Content_200205_9",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        InRegionExportName = "",
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        GameModeTargetId = 10119,
        GameModeKeyCount = 1,
        QuestHintMessageId = 0,
        IsShowGuide = true,
        GuideType = "P",
        GuidePointName = "QuestPoint_20020509",
        InterfaceJumpId = 0
      },
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17512710557341964057"] = {
      isStoryNode = true,
      key = "17512710557341964057",
      type = "PreStoryNode",
      name = "\228\187\187\229\138\161\229\137\141\231\189\174\232\138\130\231\130\185",
      pos = {x = 969.86862296406, y = 73.48627002288322},
      propsData = {
        QuestId = 20020501,
        QuestDescriptionComment = "",
        SubRegionId = 101101,
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Bulu_1190178"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17512710557341964063",
            startPort = "ApproveOut",
            endQuest = "17512710557341964062",
            endPort = "Success"
          },
          {
            startQuest = "17512710557341964063",
            startPort = "CancelOut",
            endQuest = "17512710557341964064",
            endPort = "Fail"
          },
          {
            startQuest = "17512710557341964061",
            startPort = "QuestStart",
            endQuest = "17512710557341964065",
            endPort = "In"
          },
          {
            startQuest = "17512710557341964065",
            startPort = "Out",
            endQuest = "17512710557341964063",
            endPort = "Input"
          },
          {
            startQuest = "17512710557341964065",
            startPort = "Fail",
            endQuest = "17512710557341964064",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17512710557341964061"] = {
            key = "17512710557341964061",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17512710557341964062"] = {
            key = "17512710557341964062",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1724.2340777502068, y = 222.22828784119108},
            propsData = {ModeType = 0}
          },
          ["17512710557341964063"] = {
            key = "17512710557341964063",
            type = "ReceiveSideQuestNode",
            name = "\230\148\175\231\186\191\228\187\187\229\138\161\230\142\165\229\143\150\232\138\130\231\130\185",
            pos = {x = 1363.2727272727275, y = 285.020979020979},
            propsData = {
              SideQuestChainId = 200205,
              EnableSequence = false,
              SequencePath = "",
              PauseMark = ""
            }
          },
          ["17512710557341964064"] = {
            key = "17512710557341964064",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1744.4184790541526, y = 539.2236169902204},
            propsData = {}
          },
          ["17512710557341964065"] = {
            key = "17512710557341964065",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1065.8533471121184, y = 305.71978021978026},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700048,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Bulu_1190178",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51002001,
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
    ["17551598007935553"] = {
      isStoryNode = true,
      key = "17551598007935553",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\144\231\155\174\230\160\135",
      pos = {x = 1301.2455167416235, y = 700.7976768245491},
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
    }
  },
  commentData = {}
}
