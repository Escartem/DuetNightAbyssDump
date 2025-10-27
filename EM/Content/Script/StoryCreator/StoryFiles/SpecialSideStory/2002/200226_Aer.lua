return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17390038257516830202",
      startPort = "StoryStart",
      endStory = "17390038280566830278",
      endPort = "In"
    },
    {
      startStory = "17390038280566830278",
      startPort = "Success",
      endStory = "17390041452678853678",
      endPort = "In"
    },
    {
      startStory = "17390041452678853678",
      startPort = "Success",
      endStory = "17390044792449866814",
      endPort = "In"
    },
    {
      startStory = "17390044792449866814",
      startPort = "Success",
      endStory = "17390044834029867041",
      endPort = "In"
    },
    {
      startStory = "17390044834029867041",
      startPort = "Success",
      endStory = "17390038257636830205",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17390038257516830202"] = {
      isStoryNode = true,
      key = "17390038257516830202",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 298},
      propsData = {QuestChainId = 200226},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17390038257636830205"] = {
      isStoryNode = true,
      key = "17390038257636830205",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2392.086956521739, y = 354.8695652173913},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17390038280566830278"] = {
      isStoryNode = true,
      key = "17390038280566830278",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1176, y = 310.2352941176471},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200226_1",
        QuestDeatil = "Content_200226_1",
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
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Aer_1180093"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17390038280566830279",
            startPort = "QuestStart",
            endQuest = "17390039973147841901",
            endPort = "In"
          },
          {
            startQuest = "17390039973147841901",
            startPort = "Out",
            endQuest = "17390038280566830282",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17390038280566830279"] = {
            key = "17390038280566830279",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1098, y = 374},
            propsData = {ModeType = 0}
          },
          ["17390038280566830282"] = {
            key = "17390038280566830282",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1874, y = 394},
            propsData = {ModeType = 0}
          },
          ["17390038280566830285"] = {
            key = "17390038280566830285",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17390039973147841901"] = {
            key = "17390039973147841901",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1426, y = 376},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700018,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Aer_1180093",
              DelayShowGuideTime = 0,
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
    ["17390041452678853678"] = {
      isStoryNode = true,
      key = "17390041452678853678",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1510, y = 334},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200226_2",
        QuestDeatil = "Content_200226_2",
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
            startQuest = "17390041452678853679",
            startPort = "QuestStart",
            endQuest = "17390044014838854552",
            endPort = "In"
          },
          {
            startQuest = "17390044014838854552",
            startPort = "Out",
            endQuest = "17390044213648854803",
            endPort = "In"
          },
          {
            startQuest = "17390044213648854803",
            startPort = "Out",
            endQuest = "17390044306388855092",
            endPort = "In"
          },
          {
            startQuest = "17390044306388855092",
            startPort = "Out",
            endQuest = "17390041452678853682",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17390041452678853679"] = {
            key = "17390041452678853679",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 846, y = 368},
            propsData = {ModeType = 0}
          },
          ["17390041452678853682"] = {
            key = "17390041452678853682",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2116, y = 374},
            propsData = {ModeType = 0}
          },
          ["17390041452678853685"] = {
            key = "17390041452678853685",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2144, y = 626},
            propsData = {}
          },
          ["17390044014838854552"] = {
            key = "17390044014838854552",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1178, y = 380},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 0,
              GuideType = "N",
              GuidePointName = ""
            }
          },
          ["17390044213648854803"] = {
            key = "17390044213648854803",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1472, y = 390},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {}
            }
          },
          ["17390044306388855092"] = {
            key = "17390044306388855092",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1776, y = 380},
            propsData = {
              KillMonsterType = "Nums",
              MonsterNeedNums = 1,
              IsShow = false,
              GuideType = "P",
              GuideName = ""
            }
          }
        },
        commentData = {}
      }
    },
    ["17390044792449866814"] = {
      isStoryNode = true,
      key = "17390044792449866814",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1824.2853240838667, y = 337.31376861125153},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200226_3",
        QuestDeatil = "Content_200226_3",
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
            startQuest = "17390044792449866815",
            startPort = "QuestStart",
            endQuest = "17390047108589868192",
            endPort = "In"
          },
          {
            startQuest = "17390047108589868192",
            startPort = "Out",
            endQuest = "17390046904429868014",
            endPort = "In"
          },
          {
            startQuest = "17390046904429868014",
            startPort = "Out",
            endQuest = "17390047305049868820",
            endPort = "In"
          },
          {
            startQuest = "17390047152719868371",
            startPort = "Out",
            endQuest = "17390044792449866818",
            endPort = "Success"
          },
          {
            startQuest = "17390047305049868820",
            startPort = "Out",
            endQuest = "173900479774010881165",
            endPort = "In"
          },
          {
            startQuest = "173900479774010881165",
            startPort = "Fail",
            endQuest = "17390047152719868371",
            endPort = "In"
          }
        },
        nodeData = {
          ["17390044792449866815"] = {
            key = "17390044792449866815",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 262.6363636363636, y = 263},
            propsData = {ModeType = 0}
          },
          ["17390044792449866818"] = {
            key = "17390044792449866818",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1975.7386363636363, y = 222.03409090909093},
            propsData = {ModeType = 0}
          },
          ["17390044792449866821"] = {
            key = "17390044792449866821",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1656.909090909091, y = 497.27272727272725},
            propsData = {}
          },
          ["17390046904429868014"] = {
            key = "17390046904429868014",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 794.1094782410573, y = 252.1097060833902},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {}
            }
          },
          ["17390047108589868192"] = {
            key = "17390047108589868192",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 534.0084681400471, y = 250.74606971975396},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17390047152719868371"] = {
            key = "17390047152719868371",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 1606.0412964228753, y = 227.7347060833904},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17390047305049868820"] = {
            key = "17390047305049868820",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1068.2003873319666, y = 230.2915242652084},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11010,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["173900479774010881165"] = {
            key = "173900479774010881165",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1324.6233122331523, y = 220.74606971975393},
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
    ["17390044834029867041"] = {
      isStoryNode = true,
      key = "17390044834029867041",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 2103.4157588664757, y = 350.3572468721211},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_200226_4",
        QuestDeatil = "Content_200226_4",
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
        StoryGuideType = "Npc",
        StoryGuidePointName = "Npc_Aer_1180093"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17390044834029867042",
            startPort = "QuestStart",
            endQuest = "173900488427710882191",
            endPort = "In"
          },
          {
            startQuest = "173900488427710882191",
            startPort = "Out",
            endQuest = "17390044834029867045",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17390044834029867042"] = {
            key = "17390044834029867042",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1076.6666666666667, y = 366.6666666666667},
            propsData = {ModeType = 0}
          },
          ["17390044834029867045"] = {
            key = "17390044834029867045",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1768.6666666666665, y = 309.66666666666663},
            propsData = {ModeType = 0}
          },
          ["17390044834029867048"] = {
            key = "17390044834029867048",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1910, y = 571.6666666666666},
            propsData = {}
          },
          ["173900488427710882191"] = {
            key = "173900488427710882191",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1402, y = 340},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700018,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Aer_1180093",
              DelayShowGuideTime = 0,
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
    }
  },
  commentData = {}
}
