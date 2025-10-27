return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17174120597141060",
      startPort = "StoryStart",
      endStory = "17174120687931611",
      endPort = "In"
    },
    {
      startStory = "17174120687931611",
      startPort = "Success",
      endStory = "17174120597141063",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17174120597141060"] = {
      isStoryNode = true,
      key = "17174120597141060",
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
    ["17174120597141063"] = {
      isStoryNode = true,
      key = "17174120597141063",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1580.4113526570047, y = 272.32198067632845},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17174120687931611"] = {
      isStoryNode = true,
      key = "17174120687931611",
      type = "StoryNode",
      name = "\233\171\152\231\169\186\228\189\156\228\184\154",
      pos = {x = 1127.33390974967, y = 290.9020489755123},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_IcelakeCityGaokong_Des",
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
            startQuest = "17174120687931612",
            startPort = "QuestStart",
            endQuest = "17174129404419102",
            endPort = "In"
          },
          {
            startQuest = "171747307229126529",
            startPort = "Out",
            endQuest = "171747334876334482",
            endPort = "In"
          },
          {
            startQuest = "171747310449227249",
            startPort = "Out",
            endQuest = "171747345059438631",
            endPort = "In"
          },
          {
            startQuest = "17174129404419102",
            startPort = "Out",
            endQuest = "171746974535716988",
            endPort = "In"
          },
          {
            startQuest = "17174129404419102",
            startPort = "Out",
            endQuest = "171746957792412380",
            endPort = "In"
          },
          {
            startQuest = "171757840803519522",
            startPort = "Out",
            endQuest = "172197747882916962",
            endPort = "In"
          },
          {
            startQuest = "172197747882916962",
            startPort = "Out",
            endQuest = "17174120687931615",
            endPort = "Success"
          },
          {
            startQuest = "172197711197315690",
            startPort = "Out",
            endQuest = "171757840803519522",
            endPort = "In"
          },
          {
            startQuest = "172197647865611655",
            startPort = "Out",
            endQuest = "17253547308829634",
            endPort = "In"
          },
          {
            startQuest = "17253547308829634",
            startPort = "WeightBranch_1",
            endQuest = "172197711197315690",
            endPort = "In"
          },
          {
            startQuest = "17253547308829634",
            startPort = "WeightBranch_2",
            endQuest = "172535480720210231",
            endPort = "In"
          },
          {
            startQuest = "172535489232911259",
            startPort = "Out",
            endQuest = "172535489232911258",
            endPort = "In"
          },
          {
            startQuest = "172535483414610946",
            startPort = "Out",
            endQuest = "172535489232911259",
            endPort = "In"
          },
          {
            startQuest = "172535497614512174",
            startPort = "Out",
            endQuest = "172535498081812403",
            endPort = "In"
          },
          {
            startQuest = "172535498081812403",
            startPort = "Out",
            endQuest = "17174120687931615",
            endPort = "Success"
          },
          {
            startQuest = "172535489232911258",
            startPort = "Out",
            endQuest = "17253577301913026",
            endPort = "In"
          },
          {
            startQuest = "17253577301913026",
            startPort = "Out",
            endQuest = "172535497614512174",
            endPort = "In"
          },
          {
            startQuest = "172535480720210231",
            startPort = "Out",
            endQuest = "17253582843024411",
            endPort = "In"
          },
          {
            startQuest = "17253582843024411",
            startPort = "Out",
            endQuest = "172535483414610946",
            endPort = "In"
          },
          {
            startQuest = "17253582843024411",
            startPort = "Out",
            endQuest = "17253576771351649",
            endPort = "In"
          },
          {
            startQuest = "171746974535716988",
            startPort = "Option_1",
            endQuest = "171747307229126529",
            endPort = "In"
          },
          {
            startQuest = "171746974535716988",
            startPort = "Option_1",
            endQuest = "171747310449227249",
            endPort = "In"
          },
          {
            startQuest = "171746974535716988",
            startPort = "Option_1",
            endQuest = "172197647865611655",
            endPort = "In"
          },
          {
            startQuest = "171746974535716988",
            startPort = "Option_2",
            endQuest = "17219761341019382",
            endPort = "In"
          }
        },
        nodeData = {
          ["17174120687931612"] = {
            key = "17174120687931612",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 798.9655172413793, y = 295.86206896551727},
            propsData = {ModeType = 0}
          },
          ["17174120687931615"] = {
            key = "17174120687931615",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3684.2073826500296, y = 401.90310816071474},
            propsData = {ModeType = 0}
          },
          ["17174120687941618"] = {
            key = "17174120687941618",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3536.7968733993075, y = 89.1986779560309},
            propsData = {}
          },
          ["17174129404419102"] = {
            key = "17174129404419102",
            type = "ChangeStaticCreatorNode",
            name = "\229\136\183\229\135\186800007",
            pos = {x = 1092.8950208607812, y = 295.9183072383224},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190501}
            }
          },
          ["171746957792412380"] = {
            key = "171746957792412380",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\229\175\185\232\175\157",
            pos = {x = 1389.582624272279, y = 77.43596059113308},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000701,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["171746974535716988"] = {
            key = "171746974535716988",
            type = "TalkNode",
            name = "\229\146\140\228\191\174\231\144\134\229\183\165\229\175\185\232\175\157",
            pos = {x = 1376.7450119859852, y = 274.8432193567082},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 800007,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dynquest_1190501",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71000710,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
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
          ["171747307229126529"] = {
            key = "171747307229126529",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 2003.6988224756994, y = 133.54578383077364},
            propsData = {
              bActiveEnable = false,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 80004,
              UnitCount = 1,
              bGuideUIEnable = false,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["171747310449227249"] = {
            key = "171747310449227249",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 2003.4047048286404, y = 284.42813677195005},
            propsData = {
              bActiveEnable = false,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 80004,
              UnitCount = 2,
              bGuideUIEnable = false,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["171747334876334482"] = {
            key = "171747334876334482",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2340.4431035214534, y = 105.70877402685208},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000751,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
              BlendInTime = 0,
              BlendOutTime = 0,
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["171747345059438631"] = {
            key = "171747345059438631",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2335.633054501846, y = 269.23001585691736},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000751,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
              BlendInTime = 0,
              BlendOutTime = 0,
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["171757840803519522"] = {
            key = "171757840803519522",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 3027.481132066641, y = 423.0295532085041},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 800007,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dynquest_1190501",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71000771,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0,
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
          ["17219761341019382"] = {
            key = "17219761341019382",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 2014.1746906070741, y = 682.7835482959094},
            propsData = {UseTalkFadeOut = true, TalkFadeOutTime = 1}
          },
          ["172197647865611655"] = {
            key = "172197647865611655",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 2010.7776317835455, y = 454.14384241355657},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {
                1190487,
                1190488,
                1190489
              },
              QuestPickupId = -1,
              UnitId = 80004,
              UnitCount = 3,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["172197711197315690"] = {
            key = "172197711197315690",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2688.424690607075, y = 448.6090830552678},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000761,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
              BlendInTime = 0,
              BlendOutTime = 0,
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["172197747882916962"] = {
            key = "172197747882916962",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3342.58244461777, y = 419.9025322531287},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 2
            }
          },
          ["17253547308829634"] = {
            key = "17253547308829634",
            type = "WeightBranchNode",
            name = "\230\157\131\233\135\141\229\136\134\230\148\175\232\138\130\231\130\185",
            pos = {x = 2329.3795687770435, y = 491.78988205424287},
            propsData = {
              RandomTriggerBranchCount = 1,
              WeightBranchArray = {1, 1}
            }
          },
          ["172535480720210231"] = {
            key = "172535480720210231",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2505.497475025385, y = 839.6438396908092},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000780,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
              BlendInTime = 0,
              BlendOutTime = 0,
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
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["172535483414610946"] = {
            key = "172535483414610946",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\128\187\233\151\184\230\156\186\229\133\179",
            pos = {x = 3030.8771798616117, y = 676.4888787097613},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190762}
            }
          },
          ["172535489232911258"] = {
            key = "172535489232911258",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 3542.141508045505, y = 673.885819329528},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190762,
              StateId = 780212,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["172535489232911259"] = {
            key = "172535489232911259",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = 3278.82092621188, y = 676.8093293943423},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1190762,
              StateId = 780210,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["172535497614512174"] = {
            key = "172535497614512174",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 4084.469312366787, y = 664.5142410286018},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 800007,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dynquest_1190757",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71000782,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0,
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
          ["172535498081812403"] = {
            key = "172535498081812403",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 4339.875156522632, y = 666.1051501195109},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 2
            }
          },
          ["17253576771351649"] = {
            key = "17253576771351649",
            type = "ChangeStaticCreatorNode",
            name = "\229\136\160\233\153\164\231\171\153\229\156\168\233\171\152\231\169\186\231\154\132NPC",
            pos = {x = 3033.3783173348393, y = 918.7175905012863},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190501}
            }
          },
          ["17253577301913026"] = {
            key = "17253577301913026",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\171\153\229\156\168\230\128\187\233\151\184\230\151\129\232\190\185\231\154\132npx",
            pos = {x = 3807.2275236840483, y = 673.3207651044609},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190757}
            }
          },
          ["17253582843024411"] = {
            key = "17253582843024411",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2773.292741075352, y = 842.5164172783736},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 800007,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dynquest_1190501",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71000781,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0,
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
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {
          ["17253533912364147"] = {
            key = "17253533912364147",
            name = "\231\174\161\233\129\147\230\151\160\231\160\180\230\141\159",
            position = {x = 2610.4129131737823, y = 309.5338183555572},
            size = {width = 1348.6363636363635, height = 295.909090909091}
          }
        }
      }
    }
  },
  commentData = {}
}
