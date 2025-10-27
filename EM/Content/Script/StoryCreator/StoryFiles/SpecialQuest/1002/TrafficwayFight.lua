return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17527501134331206152",
      startPort = "StoryStart",
      endStory = "17527501134331206154",
      endPort = "In"
    },
    {
      startStory = "17527501134331206154",
      startPort = "Success",
      endStory = "17527501134331206153",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17527501134331206152"] = {
      isStoryNode = true,
      key = "17527501134331206152",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 300},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17527501134331206153"] = {
      isStoryNode = true,
      key = "17527501134331206153",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1288.4000000000053, y = 308.3999999999999},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17527501134331206154"] = {
      isStoryNode = true,
      key = "17527501134331206154",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1051.5395246666662, y = 298.4969205415665},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "",
        QuestDeatil = "",
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
            startQuest = "17527501134331206159",
            startPort = "Out",
            endQuest = "17527501134331206157",
            endPort = "Fail"
          },
          {
            startQuest = "17527501134331206155",
            startPort = "QuestStart",
            endQuest = "17527501134331206159",
            endPort = "In"
          },
          {
            startQuest = "17527502108671289290",
            startPort = "Out",
            endQuest = "17527502108671289289",
            endPort = "In"
          },
          {
            startQuest = "17527502108681289297",
            startPort = "Out",
            endQuest = "17527502108681289299",
            endPort = "In"
          },
          {
            startQuest = "17527502108681289299",
            startPort = "Out",
            endQuest = "17527502108681289298",
            endPort = "In"
          },
          {
            startQuest = "17527502108681289301",
            startPort = "Out",
            endQuest = "17527502108681289297",
            endPort = "In"
          },
          {
            startQuest = "17527502108681289307",
            startPort = "Out",
            endQuest = "17527502108681289303",
            endPort = "In"
          },
          {
            startQuest = "17527502108681289301",
            startPort = "Out",
            endQuest = "17527502108681289307",
            endPort = "In"
          },
          {
            startQuest = "17527502108681289302",
            startPort = "Out",
            endQuest = "17527502108671289290",
            endPort = "In"
          },
          {
            startQuest = "17527503206021291119",
            startPort = "Out",
            endQuest = "17527503206021291121",
            endPort = "In"
          },
          {
            startQuest = "17527503206021291121",
            startPort = "Out",
            endQuest = "17527503206021291122",
            endPort = "In"
          },
          {
            startQuest = "17527503206021291123",
            startPort = "Out",
            endQuest = "17527503206021291121",
            endPort = "In"
          },
          {
            startQuest = "17527503206021291122",
            startPort = "Out",
            endQuest = "17527502108681289295",
            endPort = "In"
          },
          {
            startQuest = "17527501134331206155",
            startPort = "QuestStart",
            endQuest = "17527502108681289304",
            endPort = "In"
          },
          {
            startQuest = "17527501134331206155",
            startPort = "QuestStart",
            endQuest = "17527502108681289302",
            endPort = "In"
          },
          {
            startQuest = "17527502108681289304",
            startPort = "Out",
            endQuest = "17549828191227294849",
            endPort = "In"
          },
          {
            startQuest = "17549828191227294849",
            startPort = "Out",
            endQuest = "17527502108681289306",
            endPort = "In"
          },
          {
            startQuest = "17527502108671289289",
            startPort = "Out",
            endQuest = "17527501134331206158",
            endPort = "In"
          },
          {
            startQuest = "17527502108681289304",
            startPort = "Out",
            endQuest = "17527502108671289287",
            endPort = "In"
          }
        },
        nodeData = {
          ["17527501134331206155"] = {
            key = "17527501134331206155",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 187.74745196324307, y = 455.57351712614854},
            propsData = {ModeType = 0}
          },
          ["17527501134331206156"] = {
            key = "17527501134331206156",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2377.5649958228914, y = 269.6894736842106},
            propsData = {ModeType = 0}
          },
          ["17527501134331206157"] = {
            key = "17527501134331206157",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 839.2210526315826, y = 914.9210526315795},
            propsData = {}
          },
          ["17527501134331206158"] = {
            key = "17527501134331206158",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 1564.6101558783848, y = 442.20032967514317},
            propsData = {}
          },
          ["17527501134331206159"] = {
            key = "17527501134331206159",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 489.29812454215215, y = 912.0699103709542},
            propsData = {}
          },
          ["17527502108671289287"] = {
            key = "17527502108671289287",
            type = "TalkNode",
            name = "\229\176\143\231\153\189\229\143\151\230\131\138",
            pos = {x = 1010.6027202348336, y = 622.8817458655983},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10100305,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17527502108671289289"] = {
            key = "17527502108671289289",
            type = "WaitOfTimeNode",
            name = "1",
            pos = {x = 1016.9102394878929, y = 445.1843119850295},
            propsData = {WaitTime = 1}
          },
          ["17527502108671289290"] = {
            key = "17527502108671289290",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 753.2495127948282, y = 446.4600568572381},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 11,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1180139,
                1180140,
                1180141,
                1180142,
                1180143,
                1180144,
                1180145,
                1180146,
                1180566,
                1240765,
                1240766
              }
            }
          },
          ["17527502108681289295"] = {
            key = "17527502108681289295",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 1770.0699946215416, y = 1625.6183178371211},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "P100203Nvzhu1",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17527502108681289297"] = {
            key = "17527502108681289297",
            type = "SendMessageNode",
            name = "\229\141\161\232\189\166\229\128\146",
            pos = {x = 595.4857874323816, y = 208.8858654795622},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Trafficway_Truck2",
              UnitId = -1
            }
          },
          ["17527502108681289298"] = {
            key = "17527502108681289298",
            type = "SendMessageNode",
            name = "\229\141\161\232\189\166\229\128\146",
            pos = {x = 1052.4805426771366, y = 206.68936222436332},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Trafficway_Truck3",
              UnitId = -1
            }
          },
          ["17527502108681289299"] = {
            key = "17527502108681289299",
            type = "WaitOfTimeNode",
            name = "7",
            pos = {x = 812.3831400797343, y = 202.3062453412465},
            propsData = {WaitTime = 7}
          },
          ["17527502108681289300"] = {
            key = "17527502108681289300",
            type = "TalkNode",
            name = "\231\156\139\229\136\176\230\128\170\231\137\169\229\176\143\231\153\189\232\183\145\232\183\175",
            pos = {x = 596.9835258051195, y = -159.10247950878284},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10120301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_100203",
              BlendInTime = 2,
              BlendOutTime = 1,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = false,
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
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
          ["17527502108681289301"] = {
            key = "17527502108681289301",
            type = "WaitOfTimeNode",
            name = "3",
            pos = {x = 382.5818164034101, y = 14.277473871170372},
            propsData = {WaitTime = 3}
          },
          ["17527502108681289302"] = {
            key = "17527502108681289302",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\170\231\137\169",
            pos = {x = 468.77905556775477, y = 460.66808326177994},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1180139,
                1180140,
                1180141,
                1180142,
                1180143,
                1180144,
                1180145,
                1180146,
                1180566,
                1240765,
                1240766
              }
            }
          },
          ["17527502108681289303"] = {
            key = "17527502108681289303",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 813.0547525174758, y = 83.81260540630228},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "P100203Nvzhu1",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17527502108681289304"] = {
            key = "17527502108681289304",
            type = "CameraLookAtNode",
            name = "CameraLookAt",
            pos = {x = 491.6252736771308, y = 633.1014744320133},
            propsData = {
              TargetType = "Point",
              PointName = "P100203LookPoint",
              ActorId = 0,
              Duration = 2.5,
              EasingFunc = 4,
              bDisableUserInput = true
            }
          },
          ["17527502108681289306"] = {
            key = "17527502108681289306",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\229\176\143\231\153\1891\229\143\183",
            pos = {x = 1002.1859782439857, y = 770.4766213420575},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1180006}
            }
          },
          ["17527502108681289307"] = {
            key = "17527502108681289307",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 590.1198533664475, y = 90.95547508142977},
            propsData = {WaitTime = 1}
          },
          ["17527502108691289309"] = {
            key = "17527502108691289309",
            type = "ChangeStaticCreatorNode",
            name = "\231\172\172\228\186\140\230\137\185\230\128\170\231\137\169",
            pos = {x = 1198.3395794736734, y = -840.6952409140442},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240765, 1240766}
            }
          },
          ["17527502108691289310"] = {
            key = "17527502108691289310",
            type = "WaitOfTimeNode",
            name = "1",
            pos = {x = 134.09090780220725, y = 16.696459297509065},
            propsData = {WaitTime = 1}
          },
          ["17527503206021291119"] = {
            key = "17527503206021291119",
            type = "MonitorPlayerStatusNode",
            name = "\231\155\145\229\144\172\231\142\169\229\174\182\231\138\182\230\128\129",
            pos = {x = 1330.762602022772, y = 1414.9417433361518},
            propsData = {
              ListenHPPercent = false,
              ListenESPercent = false,
              ListenSPPercent = false,
              ListenDead = true
            }
          },
          ["17527503206021291121"] = {
            key = "17527503206021291121",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1701.3192028107192, y = 1550.6574356580422},
            propsData = {WaitTime = 1.9}
          },
          ["17527503206021291122"] = {
            key = "17527503206021291122",
            type = "RefreshPlayerNode",
            name = "\233\135\141\230\150\176\229\136\157\229\167\139\229\140\150\231\142\169\229\174\182",
            pos = {x = 1725.0884006971569, y = 1587.2831018249321},
            propsData = {}
          },
          ["17527503206021291123"] = {
            key = "17527503206021291123",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\134\176\230\185\150\229\159\142",
            pos = {x = 1335.3820612752038, y = 1593.3650125694599},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17549828191227294849"] = {
            key = "17549828191227294849",
            type = "WaitOfTimeNode",
            name = "0.1",
            pos = {x = 760.0559603535296, y = 771.805309456625},
            propsData = {WaitTime = 0.1}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
