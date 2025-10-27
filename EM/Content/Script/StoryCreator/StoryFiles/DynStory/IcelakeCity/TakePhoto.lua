return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1749799107834369963",
      startPort = "StoryStart",
      endStory = "1749799107834369965",
      endPort = "In"
    },
    {
      startStory = "1749799107834369965",
      startPort = "Success",
      endStory = "1749799107834369964",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1749799107834369963"] = {
      isStoryNode = true,
      key = "1749799107834369963",
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
    ["1749799107834369964"] = {
      isStoryNode = true,
      key = "1749799107834369964",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1507.5806451612902, y = 290.9032258064516},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1749799107834369965"] = {
      isStoryNode = true,
      key = "1749799107834369965",
      type = "StoryNode",
      name = "\230\139\141\231\133\167",
      pos = {x = 1153.3101736972706, y = 283.85856079404465},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_TakePhoto_Des",
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
        bIsDynamicEvent = true,
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
            startQuest = "1749799107834369966",
            startPort = "QuestStart",
            endQuest = "1749799107834369969",
            endPort = "In"
          },
          {
            startQuest = "1749799107834369969",
            startPort = "Out",
            endQuest = "1749799107834369970",
            endPort = "In"
          },
          {
            startQuest = "1749799107834369969",
            startPort = "Out",
            endQuest = "1749799107834369971",
            endPort = "In"
          },
          {
            startQuest = "1749799107834369974",
            startPort = "Success",
            endQuest = "1749799107834369975",
            endPort = "In"
          },
          {
            startQuest = "1749799107834369972",
            startPort = "Out",
            endQuest = "1749799107834369967",
            endPort = "Success"
          },
          {
            startQuest = "1749799107834369975",
            startPort = "Out",
            endQuest = "1749799107834369976",
            endPort = "In"
          },
          {
            startQuest = "1749799107834369976",
            startPort = "Out",
            endQuest = "1749799107834369967",
            endPort = "Success"
          },
          {
            startQuest = "1749799107834369978",
            startPort = "Out",
            endQuest = "1749799107834369974",
            endPort = "In"
          },
          {
            startQuest = "1749799107834369977",
            startPort = "Out",
            endQuest = "1749799107834369980",
            endPort = "In"
          },
          {
            startQuest = "1749799107834369980",
            startPort = "Out",
            endQuest = "1749799107834369978",
            endPort = "In"
          },
          {
            startQuest = "1749799107834369978",
            startPort = "Out",
            endQuest = "1749799107834369981",
            endPort = "In"
          },
          {
            startQuest = "1749799107834369974",
            startPort = "Success",
            endQuest = "1749799107834369982",
            endPort = "In"
          },
          {
            startQuest = "1749799107834369982",
            startPort = "Out",
            endQuest = "1749799107834369979",
            endPort = "In"
          },
          {
            startQuest = "1749799107834369981",
            startPort = "Out",
            endQuest = "1749799107834369978",
            endPort = "In"
          },
          {
            startQuest = "1749799107834369971",
            startPort = "Out",
            endQuest = "1749799107834369977",
            endPort = "In"
          },
          {
            startQuest = "1749799107834369971",
            startPort = "Fail",
            endQuest = "1749799107834369972",
            endPort = "In"
          }
        },
        nodeData = {
          ["1749799107834369966"] = {
            key = "1749799107834369966",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1749799107834369967"] = {
            key = "1749799107834369967",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3491.6695652173917, y = 367.66956521739127},
            propsData = {ModeType = 0}
          },
          ["1749799107834369968"] = {
            key = "1749799107834369968",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1749799107834369969"] = {
            key = "1749799107834369969",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144NPC",
            pos = {x = 1208, y = 296.4},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190959}
            }
          },
          ["1749799107834369970"] = {
            key = "1749799107834369970",
            type = "TalkNode",
            name = "\230\139\141\231\133\167\229\188\128\232\189\166",
            pos = {x = 1509.2, y = 83.99999999999993},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71005001,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1749799107834369971"] = {
            key = "1749799107834369971",
            type = "TalkNode",
            name = "\228\186\164\228\186\146\229\188\128\232\189\166",
            pos = {x = 1590.5233082706764, y = 261.53684210526325},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818041,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190959",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71005002,
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
              OverrideFailBlend = true,
              FailOutType = "FadeOut",
              FailOutTime = 2
            }
          },
          ["1749799107834369972"] = {
            key = "1749799107834369972",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 2051.5262672811064, y = 711.7640552995392},
            propsData = {UseTalkFadeOut = false, TalkFadeOutTime = 0}
          },
          ["1749799107834369974"] = {
            key = "1749799107834369974",
            type = "CameraNode",
            name = "\231\155\184\230\156\186\232\138\130\231\130\185",
            pos = {x = 2357.26446989196, y = 201.45395249911374},
            propsData = {
              bFadeInOut = false,
              bIsForceOpenCamera = true,
              bGuideUIEnable = false,
              GuideType = "P",
              _GuidePointName = "",
              TargetPointList = {
                "Npc_Dyn_1190959",
                "BP_Dyn_PhotoPoint"
              },
              Text_TargetFound = "",
              Text_TargetNotFound = "",
              bShouldSetCameraParams = true,
              FocalLength = 15,
              LookAtTargetName = "Npc_Dyn_1190959",
              StartPos = "(X=-4526.700195,Y=-3124.115723,Z=-3703.814209)",
              bLockCameraPos = true,
              bStartHiddenRole = true,
              bLockHiddenRole = true,
              bStartHiddenNPC = false,
              bLockHiddenNPC = true,
              bStartHiddenMonster = true,
              bLockHiddenMonster = true,
              bStartHiddenPet = true,
              bLockHiddenPet = true,
              bLockGamePause = true
            }
          },
          ["1749799107834369975"] = {
            key = "1749799107834369975",
            type = "TalkNode",
            name = "\229\174\140\230\136\144\229\175\185\232\175\157",
            pos = {x = 2593.451696129958, y = 234.62990922121347},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818041,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1190959",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71005005,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 2,
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
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1749799107834369976"] = {
            key = "1749799107834369976",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2853.83197123243, y = 271.6574043805165},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1749799107834369977"] = {
            key = "1749799107834369977",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\133\167\231\155\184\230\156\186\230\156\186\229\133\179",
            pos = {x = 2046.3535631035636, y = -136.0480769230769},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190964}
            }
          },
          ["1749799107834369978"] = {
            key = "1749799107834369978",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2045.476764707299, y = 164.24464759378563},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190964,
              StateId = 780421,
              IsGuideEnable = false,
              GuidePointName = "Mechanism_Dyn_1190964"
            }
          },
          ["1749799107834369979"] = {
            key = "1749799107834369979",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\231\133\167\231\155\184\230\156\186\230\156\186\229\133\179",
            pos = {x = 2942.021167125594, y = 10.929924074892941},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190964}
            }
          },
          ["1749799107834369980"] = {
            key = "1749799107834369980",
            type = "SwitchMechanismStateNode",
            name = "\229\136\157\229\167\139\229\140\150\230\156\186\229\133\179",
            pos = {x = 2055.905959752322, y = 16.75849550346436},
            propsData = {
              StaticCreatorIdList = {1190964},
              ManualItemIdList = {},
              StateId = 780420,
              QuestId = 0
            }
          },
          ["1749799107834369981"] = {
            key = "1749799107834369981",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2071.199581064097, y = 383.64079388353565},
            propsData = {WaitTime = 0.5}
          },
          ["1749799107834369982"] = {
            key = "1749799107834369982",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 2656.8253875157097, y = 2.156922915793688},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190964,
              StateId = 780420,
              IsGuideEnable = false,
              GuidePointName = "Mechanism_Dyn_1190964"
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
