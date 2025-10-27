return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "173768748566334676931",
      startPort = "StoryStart",
      endStory = "173768748732034676998",
      endPort = "In"
    },
    {
      startStory = "173768748732034676998",
      startPort = "Success",
      endStory = "173768748966734677140",
      endPort = "In"
    },
    {
      startStory = "173768748966734677140",
      startPort = "Success",
      endStory = "173768777402935426585",
      endPort = "In"
    },
    {
      startStory = "173768777402935426585",
      startPort = "Success",
      endStory = "173768797308536177137",
      endPort = "In"
    },
    {
      startStory = "173768797308536177137",
      startPort = "Success",
      endStory = "173768748566434676934",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["173768748566334676931"] = {
      isStoryNode = true,
      key = "173768748566334676931",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 295.6923076923077},
      propsData = {QuestChainId = 200225},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["173768748566434676934"] = {
      isStoryNode = true,
      key = "173768748566434676934",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2260, y = 308},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["173768748732034676998"] = {
      isStoryNode = true,
      key = "173768748732034676998",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1108.25, y = 277.17105263157896},
      propsData = {
        QuestId = 20022501,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200225_1",
        QuestDeatil = "Content_200225_1",
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
        StoryGuideType = "Point",
        StoryGuidePointName = "BP_Npc_SideQuest_Xiao_1191070"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173768748732034676999",
            startPort = "QuestStart",
            endQuest = "173768788788836175600",
            endPort = "In"
          },
          {
            startQuest = "173768788788836175600",
            startPort = "Out",
            endQuest = "173768792649136175853",
            endPort = "In"
          },
          {
            startQuest = "173768792649136175853",
            startPort = "Out",
            endQuest = "173768793454836176144",
            endPort = "In"
          },
          {
            startQuest = "173768793454836176144",
            startPort = "Out",
            endQuest = "173768748732034677002",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173768748732034676999"] = {
            key = "173768748732034676999",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 848.3333333333334, y = 321.6666666666667},
            propsData = {ModeType = 0}
          },
          ["173768748732034677002"] = {
            key = "173768748732034677002",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2323.3333333333335, y = 373.33333333333337},
            propsData = {ModeType = 0}
          },
          ["173768748732034677005"] = {
            key = "173768748732034677005",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173768788788836175600"] = {
            key = "173768788788836175600",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\165\191\232\146\153",
            pos = {x = 1174.941348973607, y = 319.6666666666667},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191070}
            }
          },
          ["173768792649136175853"] = {
            key = "173768792649136175853",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1499.9354838709678, y = 300.8320158102767},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700204,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_SideQuest_Xiao_1191070",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007702,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
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
          ["173768793454836176144"] = {
            key = "173768793454836176144",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\232\165\191\232\146\153",
            pos = {x = 1832.4848484848485, y = 333.5418894830659},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191070}
            }
          }
        },
        commentData = {}
      }
    },
    ["173768748966734677140"] = {
      isStoryNode = true,
      key = "173768748966734677140",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1400.551724137931, y = 280.7068965517241},
      propsData = {
        QuestId = 20022502,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200225_2",
        QuestDeatil = "Content_200225_2",
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
        StoryGuidePointName = "BP_ShotPoint_Xiao01"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173768808107236178180",
            startPort = "Out",
            endQuest = "173770362818544179101",
            endPort = "In"
          },
          {
            startQuest = "173770362818544179101",
            startPort = "Out",
            endQuest = "173768748966734677144",
            endPort = "Success"
          },
          {
            startQuest = "173770361355144178635",
            startPort = "Out",
            endQuest = "173768750095734677527",
            endPort = "In"
          },
          {
            startQuest = "173768748966734677141",
            startPort = "QuestStart",
            endQuest = "173770361355144178635",
            endPort = "In"
          },
          {
            startQuest = "173768750095734677527",
            startPort = "Success",
            endQuest = "173768808107236178180",
            endPort = "In"
          }
        },
        nodeData = {
          ["173768748966734677141"] = {
            key = "173768748966734677141",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 421.97368421052624, y = 220.3157894736842},
            propsData = {ModeType = 0}
          },
          ["173768748966734677144"] = {
            key = "173768748966734677144",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2449.305263157895, y = 251.0842105263158},
            propsData = {ModeType = 0}
          },
          ["173768748966734677147"] = {
            key = "173768748966734677147",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2180, y = 644},
            propsData = {}
          },
          ["173768750095734677527"] = {
            key = "173768750095734677527",
            type = "CameraNode",
            name = "\230\139\141\230\145\132\229\185\191\229\156\186\229\176\143\230\145\138",
            pos = {x = 1209.1961306428125, y = 226.67272727272726},
            propsData = {
              bFadeInOut = false,
              bIsForceOpenCamera = false,
              bGuideUIEnable = true,
              GuideType = "P",
              _GuidePointName = "BP_ShotPoint_Xiao01",
              TargetPointList = {
                "BP_ShotPoint_Xiao01"
              },
              Text_TargetFound = "",
              Text_TargetNotFound = "",
              bShouldSetCameraParams = false,
              FocalLength = 0,
              LookAtTargetName = "",
              StartPos = "",
              bLockCameraPos = false,
              bStartHiddenRole = false,
              bLockHiddenRole = false,
              bStartHiddenNPC = false,
              bLockHiddenNPC = false,
              bStartHiddenMonster = false,
              bLockHiddenMonster = false,
              bStartHiddenPet = false,
              bLockHiddenPet = false,
              bLockGamePause = false
            }
          },
          ["173768800091036177506"] = {
            key = "173768800091036177506",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\139\141\230\145\132\231\130\185",
            pos = {x = 641.1578947368421, y = -104.56750572082379},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191072}
            }
          },
          ["173768805783836177792"] = {
            key = "173768805783836177792",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\139\141\230\145\132\231\130\185",
            pos = {x = 1480.0095693779906, y = -46.37320574162666},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191072}
            }
          },
          ["173768808107236178180"] = {
            key = "173768808107236178180",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1750.2631578947369, y = 227.95789473684215},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51007712,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Fixsimple_Shoot01",
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700204,
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
                {TalkActorType = "Npc", TalkActorId = 700204},
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
          ["173770361355144178635"] = {
            key = "173770361355144178635",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186\230\140\135\229\188\149\231\130\185",
            pos = {x = 962.5454545454545, y = 239.0478468899521},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "BP_ShotPoint_Xiao01"
            }
          },
          ["173770362818544179101"] = {
            key = "173770362818544179101",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\233\148\128\230\175\129\230\140\135\229\188\149\231\130\185",
            pos = {x = 2098, y = 253.68421052631578},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "BP_ShotPoint_Xiao01"
            }
          }
        },
        commentData = {}
      }
    },
    ["173768777402935426585"] = {
      isStoryNode = true,
      key = "173768777402935426585",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1727.5439560439559, y = 294.9655172413793},
      propsData = {
        QuestId = 20022503,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200225_3",
        QuestDeatil = "Content_200225_2",
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
        StoryGuidePointName = "BP_ShotPoint_Xiao02"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173768811232736179113",
            startPort = "Out",
            endQuest = "173768777402935426591",
            endPort = "Success"
          },
          {
            startQuest = "173770356721944176974",
            startPort = "Out",
            endQuest = "173768777402935426593",
            endPort = "In"
          },
          {
            startQuest = "173770358290644177481",
            startPort = "Out",
            endQuest = "173768811232736179113",
            endPort = "In"
          },
          {
            startQuest = "173768777402935426590",
            startPort = "QuestStart",
            endQuest = "173770356721944176974",
            endPort = "In"
          },
          {
            startQuest = "173768777402935426593",
            startPort = "Success",
            endQuest = "173770358290644177481",
            endPort = "In"
          }
        },
        nodeData = {
          ["173768777402935426590"] = {
            key = "173768777402935426590",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 476.00000000000017, y = 259.7142857142857},
            propsData = {ModeType = 0}
          },
          ["173768777402935426591"] = {
            key = "173768777402935426591",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2531.5217391304345, y = 296.32608695652175},
            propsData = {ModeType = 0}
          },
          ["173768777402935426592"] = {
            key = "173768777402935426592",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2180, y = 644},
            propsData = {}
          },
          ["173768777402935426593"] = {
            key = "173768777402935426593",
            type = "CameraNode",
            name = "\230\139\141\230\145\132\232\180\171\230\176\145\231\170\159",
            pos = {x = 1338.8690748610657, y = 251.11589318122893},
            propsData = {
              bFadeInOut = false,
              bIsForceOpenCamera = false,
              bGuideUIEnable = true,
              GuideType = "P",
              _GuidePointName = "BP_ShotPoint_Xiao02",
              TargetPointList = {
                "BP_ShotPoint_Xiao02"
              },
              Text_TargetFound = "",
              Text_TargetNotFound = "",
              bShouldSetCameraParams = false,
              FocalLength = 0,
              LookAtTargetName = "",
              StartPos = "",
              bLockCameraPos = false,
              bStartHiddenRole = false,
              bLockHiddenRole = false,
              bStartHiddenNPC = false,
              bLockHiddenNPC = false,
              bStartHiddenMonster = false,
              bLockHiddenMonster = false,
              bStartHiddenPet = false,
              bLockHiddenPet = false,
              bLockGamePause = false
            }
          },
          ["173768809055536178550"] = {
            key = "173768809055536178550",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\139\141\230\145\132\231\130\185",
            pos = {x = 772.0292522911476, y = 33.40095365850897},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191073}
            }
          },
          ["173768809889036178672"] = {
            key = "173768809889036178672",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\139\141\230\145\132\231\130\185",
            pos = {x = 1583.3821510297482, y = 104.8466819221967},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191073}
            }
          },
          ["173768811232736179113"] = {
            key = "173768811232736179113",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2218.1304347826085, y = 235.52173913043472},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51007714,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Fixsimple_Shoot02",
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
                  TalkActorId = 700204,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 700204},
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
          ["173770356721944176974"] = {
            key = "173770356721944176974",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186\230\140\135\229\188\149\231\130\185",
            pos = {x = 1039.7949948796722, y = 267.2433135783387},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "BP_ShotPoint_Xiao02"
            }
          },
          ["173770358290644177481"] = {
            key = "173770358290644177481",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\233\154\144\232\151\143\230\140\135\229\188\149\231\130\185",
            pos = {x = 1874.2235663082438, y = 257.97073558162265},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "BP_ShotPoint_Xiao02"
            }
          }
        },
        commentData = {}
      }
    },
    ["173768797308536177137"] = {
      isStoryNode = true,
      key = "173768797308536177137",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 2014.923076923077, y = 300},
      propsData = {
        QuestId = 20022504,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200225_4",
        QuestDeatil = "Content_200225_3",
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
        StoryGuideType = "Point",
        StoryGuidePointName = "BP_Npc_SideQuest_Xiao_1191070"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "173768797308636177142",
            startPort = "QuestStart",
            endQuest = "173768797308636177145",
            endPort = "In"
          },
          {
            startQuest = "173768797308636177145",
            startPort = "Out",
            endQuest = "173768797308636177146",
            endPort = "In"
          },
          {
            startQuest = "173768797308636177146",
            startPort = "Out",
            endQuest = "173768797308636177147",
            endPort = "In"
          },
          {
            startQuest = "173768797308636177147",
            startPort = "Out",
            endQuest = "17389955843561013854",
            endPort = "In"
          },
          {
            startQuest = "17389955843561013854",
            startPort = "Out",
            endQuest = "173768797308636177143",
            endPort = "Success"
          }
        },
        nodeData = {
          ["173768797308636177142"] = {
            key = "173768797308636177142",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 848.3333333333334, y = 321.6666666666667},
            propsData = {ModeType = 0}
          },
          ["173768797308636177143"] = {
            key = "173768797308636177143",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2323.3333333333335, y = 373.33333333333337},
            propsData = {ModeType = 0}
          },
          ["173768797308636177144"] = {
            key = "173768797308636177144",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["173768797308636177145"] = {
            key = "173768797308636177145",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\165\191\232\146\153",
            pos = {x = 1175, y = 319.6666666666667},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191070}
            }
          },
          ["173768797308636177146"] = {
            key = "173768797308636177146",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1496, y = 308},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700204,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_SideQuest_Xiao_1191070",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007723,
              FlowAssetPath = "",
              TalkType = "Impression",
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
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["173768797308636177147"] = {
            key = "173768797308636177147",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\232\165\191\232\146\153",
            pos = {x = 1830.6666666666667, y = 334.45098039215685},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191070}
            }
          },
          ["17389955843561013854"] = {
            key = "17389955843561013854",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 2084.242424242424, y = 359.87878787878793},
            propsData = {VarName = "XiAoStage", VarValue = 2}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
