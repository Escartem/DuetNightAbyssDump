return {
  storyName = "\230\156\170\229\145\189\229\144\141\230\149\133\228\186\139",
  storyDescription = "",
  lineData = {
    {
      startStory = "1704175979401216445",
      startPort = "StoryStart",
      endStory = "1712738562140114476",
      endPort = "In"
    },
    {
      startStory = "1712738562140114476",
      startPort = "Test_A",
      endStory = "1704961116490114334",
      endPort = "In"
    },
    {
      startStory = "1704961116490114334",
      startPort = "Success",
      endStory = "1704175979401216446",
      endPort = "StoryEnd"
    },
    {
      startStory = "1712738562140114476",
      startPort = "Test_B",
      endStory = "17260398231782328886",
      endPort = "In"
    },
    {
      startStory = "17260398231782328886",
      startPort = "Success",
      endStory = "1704175979401216446",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1704175979401216445"] = {
      isStoryNode = true,
      key = "1704175979401216445",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = -68.95394087937514, y = 400.89114832535887},
      propsData = {QuestChainId = 990102},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175979401216446"] = {
      isStoryNode = true,
      key = "1704175979401216446",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1097.5849936900756, y = 428.9732212472523},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704961116490114334"] = {
      isStoryNode = true,
      key = "1704961116490114334",
      type = "StoryNode",
      name = "\230\181\139\232\175\149\228\187\187\229\138\161",
      pos = {x = 641.462205072471, y = 212.12627410690288},
      propsData = {
        QuestId = 99010203,
        QuestDescriptionComment = "",
        QuestDescription = "Description_100101_1",
        QuestDeatil = "Description_100101_1",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1704961116490114348",
            startPort = "QuestStart",
            endQuest = "1704961116490114351",
            endPort = "Input"
          },
          {
            startQuest = "1704961116490114351",
            startPort = "Out",
            endQuest = "1704961116490114349",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1704961116490114348"] = {
            key = "1704961116490114348",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 192.72727272727275, y = 149.54545454545453},
            propsData = {ModeType = 0}
          },
          ["1704961116490114349"] = {
            key = "1704961116490114349",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 953.2884574803063, y = 151.79038606504403},
            propsData = {ModeType = 0}
          },
          ["1704961116490114350"] = {
            key = "1704961116490114350",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["1704961116490114351"] = {
            key = "1704961116490114351",
            type = "TestPrintNode",
            name = "\230\181\139\232\175\149\230\137\147\229\141\176",
            pos = {x = 546.5369265712924, y = 149.96715854726088},
            propsData = {Text = "TestAAAAAA"}
          }
        },
        commentData = {}
      }
    },
    ["1712738562140114476"] = {
      isStoryNode = true,
      key = "1712738562140114476",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 248.8881109860223, y = 362.7858734402846},
      propsData = {
        QuestId = 99010201,
        QuestDescriptionComment = "Description_100101_1",
        QuestDescription = "Description_100101_1",
        QuestDeatil = "Description_100101_1",
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
            startQuest = "1712738591246116041",
            startPort = "Option_1",
            endQuest = "1712738591246116042",
            endPort = "In"
          },
          {
            startQuest = "1712738591246116041",
            startPort = "Option_2",
            endQuest = "1712738591246116043",
            endPort = "In"
          },
          {
            startQuest = "1712738562141114477",
            startPort = "QuestStart",
            endQuest = "1712738591246116041",
            endPort = "In"
          },
          {
            startQuest = "1712738591246116042",
            startPort = "Out",
            endQuest = "17260380969831570",
            endPort = "In"
          },
          {
            startQuest = "1712738591246116043",
            startPort = "Out",
            endQuest = "17260381255252068",
            endPort = "In"
          }
        },
        nodeData = {
          ["1712738562141114477"] = {
            key = "1712738562141114477",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1062.1052631578948, y = 336.3157894736842},
            propsData = {ModeType = 0}
          },
          ["1712738562141114479"] = {
            key = "1712738562141114479",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2425.7894736842104, y = 198.94736842105263},
            propsData = {ModeType = 0}
          },
          ["1712738562141114481"] = {
            key = "1712738562141114481",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2421.0526315789475, y = 407.89473684210526},
            propsData = {}
          },
          ["1712738591246116041"] = {
            key = "1712738591246116041",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1362.117676016216, y = 297.52631049039087},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 700175,
              GuideUIEnable = true,
              GuideType = "Area",
              GuidePointName = "QuestPoint_AreaGuideTest",
              DelayShowGuideTime = 0,
              QuestHintId = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007001,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 0,
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
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              PlusOptions = {
                {
                  OptionText = "510070011",
                  PlusId = 1004,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "510070012",
                  PlusId = 1005,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["1712738591246116042"] = {
            key = "1712738591246116042",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1722.8515284119692, y = 211.58639035757798},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007002,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0,
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
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1712738591246116043"] = {
            key = "1712738591246116043",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1722.4510413989822, y = 429.398890357578},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51007003,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0,
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
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17260380969831570"] = {
            key = "17260380969831570",
            type = "QuestConditionNode",
            name = "QuestCondition",
            pos = {x = 2028.5263157894738, y = 203.1111111111112},
            propsData = {PortName = "Test_A"}
          },
          ["17260381255252068"] = {
            key = "17260381255252068",
            type = "QuestConditionNode",
            name = "QuestCondition",
            pos = {x = 2035.894736842105, y = 421.00584795321646},
            propsData = {PortName = "Test_B"}
          }
        },
        commentData = {}
      }
    },
    ["17260398231782328886"] = {
      isStoryNode = true,
      key = "17260398231782328886",
      type = "StoryNode",
      name = "\230\181\139\232\175\149\228\187\187\229\138\161",
      pos = {x = 651.157894736842, y = 439.953216374269},
      propsData = {
        QuestId = 99010202,
        QuestDescriptionComment = "",
        QuestDescription = "Description_100101_1",
        QuestDeatil = "Description_100101_1",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17260398231782328890",
            startPort = "QuestStart",
            endQuest = "17260398231782328893",
            endPort = "Input"
          },
          {
            startQuest = "17260398231782328893",
            startPort = "Out",
            endQuest = "17260398231782328891",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17260398231782328890"] = {
            key = "17260398231782328890",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 192.72727272727275, y = 149.54545454545453},
            propsData = {ModeType = 0}
          },
          ["17260398231782328891"] = {
            key = "17260398231782328891",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 953.2884574803063, y = 151.79038606504403},
            propsData = {ModeType = 0}
          },
          ["17260398231782328892"] = {
            key = "17260398231782328892",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["17260398231782328893"] = {
            key = "17260398231782328893",
            type = "TestPrintNode",
            name = "\230\181\139\232\175\149\230\137\147\229\141\176",
            pos = {x = 546.5369265712924, y = 149.96715854726088},
            propsData = {Text = "TestBBBBBB"}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
