return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17260248431146350",
      startPort = "StoryStart",
      endStory = "17260248559866628",
      endPort = "In"
    },
    {
      startStory = "17260248559866628",
      startPort = "Success",
      endStory = "17260248431146353",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17260248431146350"] = {
      isStoryNode = true,
      key = "17260248431146350",
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
    ["17260248431146353"] = {
      isStoryNode = true,
      key = "17260248431146353",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1452.1634615384614, y = 282.1153846153846},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17260248559866628"] = {
      isStoryNode = true,
      key = "17260248559866628",
      type = "StoryNode",
      name = "\232\165\191\229\165\165\231\154\132\231\160\148\231\169\182",
      pos = {x = 1110.7667107631348, y = 278.70288887518876},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_IcelakeXiaoresearch_Des",
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
            startQuest = "17260248559866629",
            startPort = "QuestStart",
            endQuest = "17260249605948134",
            endPort = "In"
          },
          {
            startQuest = "17260248559866629",
            startPort = "QuestStart",
            endQuest = "17260250030748785",
            endPort = "In"
          },
          {
            startQuest = "17260249605948134",
            startPort = "Out",
            endQuest = "17260251272839457",
            endPort = "In"
          },
          {
            startQuest = "172602534410711876",
            startPort = "Out",
            endQuest = "172602537196412349",
            endPort = "In"
          },
          {
            startQuest = "172602553072513493",
            startPort = "Out",
            endQuest = "172603658450822505",
            endPort = "In"
          },
          {
            startQuest = "172602537196412349",
            startPort = "Out",
            endQuest = "172603732465624312",
            endPort = "In"
          },
          {
            startQuest = "172603732465624312",
            startPort = "Out",
            endQuest = "17260248559866632",
            endPort = "Success"
          },
          {
            startQuest = "172603658450822505",
            startPort = "Out",
            endQuest = "172602534410711876",
            endPort = "In"
          },
          {
            startQuest = "17260251272839457",
            startPort = "Option_1",
            endQuest = "172602553072513493",
            endPort = "In"
          },
          {
            startQuest = "17260251272839457",
            startPort = "Option_2",
            endQuest = "17268133369501800",
            endPort = "In"
          }
        },
        nodeData = {
          ["17260248559866629"] = {
            key = "17260248559866629",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17260248559866632"] = {
            key = "17260248559866632",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3115, y = 302.3076923076923},
            propsData = {ModeType = 0}
          },
          ["17260248559866635"] = {
            key = "17260248559866635",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17260249605948134"] = {
            key = "17260249605948134",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\232\165\191\229\165\165",
            pos = {x = 1089.5052418280288, y = 299.5042627395619},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240104}
            }
          },
          ["17260250030748785"] = {
            key = "17260250030748785",
            type = "TalkNode",
            name = "\232\165\191\229\165\165\229\188\128\232\189\166",
            pos = {x = 1106.5052418280288, y = 75.50426273956191},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000801,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17260251272839457"] = {
            key = "17260251272839457",
            type = "TalkNode",
            name = "\228\184\142\232\165\191\229\165\165\229\175\185\232\175\157",
            pos = {x = 1416.5052418280288, y = 267.5042627395619},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 800011,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dynquest_1240104",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71000802,
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
              OptionType = "branch",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              BranchOptions = {"", ""},
              OverrideFailBlend = false
            }
          },
          ["172602534410711876"] = {
            key = "172602534410711876",
            type = "TalkNode",
            name = "\230\139\190\229\143\150\229\174\140\230\136\144\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 2133.505241828029, y = 287.5042627395619},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000803,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["172602537196412349"] = {
            key = "172602537196412349",
            type = "TalkNode",
            name = "\228\184\142\232\165\191\229\165\165\228\186\164\230\181\129\229\174\140\230\136\144\228\187\187\229\138\161",
            pos = {x = 2460.200894001942, y = 266.5042627395619},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 800011,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dynquest_1240104",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71000804,
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
          ["172602553072513493"] = {
            key = "172602553072513493",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\233\135\135\233\155\134\231\137\169",
            pos = {x = 1647.8129341357212, y = 89.1965704318696},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240325}
            }
          },
          ["172603579510518611"] = {
            key = "172603579510518611",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1763.5052418280288, y = 274.73503197033114},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1240325},
              QuestPickupId = -1,
              UnitId = 80015,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["172603658450822505"] = {
            key = "172603658450822505",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 1889.5109666878768, y = 77.19973668091293},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1240325,
              StateId = 610011,
              IsGuideEnable = true,
              GuidePointName = "Drop_Dynquest_1240325"
            }
          },
          ["172603732465624312"] = {
            key = "172603732465624312",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2786.0494282263385, y = 249.12281360398975},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17268133369501800"] = {
            key = "17268133369501800",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 2137.5944055944055, y = 551.3086619263089},
            propsData = {UseTalkFadeOut = false, TalkFadeOutTime = 0}
          }
        },
        commentData = {
          ["172603664418023583"] = {
            key = "172603664418023583",
            name = "\230\154\130\230\151\182\231\148\168\228\186\134\233\135\135\233\155\134\231\137\169\231\154\132\239\188\140\231\173\137\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129\231\154\132\230\140\135\229\188\149\231\130\185\229\165\189\229\134\141\230\141\162\230\136\144\230\156\186\229\133\179\232\138\130\231\130\185",
            position = {x = 2273.576900753811, y = -191.3167468355707},
            size = {width = 600, height = 400}
          }
        }
      }
    }
  },
  commentData = {}
}
