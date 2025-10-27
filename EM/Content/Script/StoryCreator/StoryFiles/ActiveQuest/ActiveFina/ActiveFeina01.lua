return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1744439178266367",
      startPort = "Success",
      endStory = "17444394510245619",
      endPort = "In"
    },
    {
      startStory = "1744888674560543",
      startPort = "Success",
      endStory = "17444385752705",
      endPort = "StoryEnd"
    },
    {
      startStory = "17444394510245619",
      startPort = "Success",
      endStory = "17478836366563561164",
      endPort = "In"
    },
    {
      startStory = "1744888674560542",
      startPort = "Success",
      endStory = "17479027609643564232",
      endPort = "In"
    },
    {
      startStory = "17479031060384453675",
      startPort = "Success",
      endStory = "17479043632358904821",
      endPort = "In"
    },
    {
      startStory = "17479043632358904821",
      startPort = "Success",
      endStory = "1744888674560543",
      endPort = "In"
    },
    {
      startStory = "17478836366563561164",
      startPort = "Success",
      endStory = "1744888674560542",
      endPort = "In"
    },
    {
      startStory = "17444385752701",
      startPort = "StoryStart",
      endStory = "17574912490162616",
      endPort = "In"
    },
    {
      startStory = "17574912490162616",
      startPort = "Success",
      endStory = "1744439178266367",
      endPort = "In"
    },
    {
      startStory = "175740355254411490745",
      startPort = "Success",
      endStory = "17479031060384453675",
      endPort = "In"
    },
    {
      startStory = "17479027609643564232",
      startPort = "\229\174\140\230\136\144\229\137\175\230\156\172",
      endStory = "17479031060384453675",
      endPort = "In"
    },
    {
      startStory = "17479027609643564232",
      startPort = "\230\156\170\229\174\140\230\136\144\229\137\175\230\156\172",
      endStory = "175740355254411490745",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17444385752701"] = {
      isStoryNode = true,
      key = "17444385752701",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 564.623188405797, y = -128.84963768115944},
      propsData = {QuestChainId = 120111},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17444385752705"] = {
      isStoryNode = true,
      key = "17444385752705",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 3351.164035843384, y = 244.94889784128918},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1744439178266367"] = {
      isStoryNode = true,
      key = "1744439178266367",
      type = "StoryNode",
      name = "\229\165\165\231\137\185\232\181\155\229\190\183\228\185\139\229\174\182",
      pos = {x = 1169.4603056554429, y = -119.37438977879484},
      propsData = {
        QuestId = 12011101,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120111_0",
        QuestDeatil = "Content_120111_0",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = true,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_LeaveOutsidersHome",
        QuestUIId = 120111
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17540164075606617",
            startPort = "Fail",
            endQuest = "1744439178267382",
            endPort = "Fail"
          },
          {
            startQuest = "17540164075606617",
            startPort = "PassiveFail",
            endQuest = "1744439178267382",
            endPort = "Fail"
          },
          {
            startQuest = "17528049035921931672",
            startPort = "Out",
            endQuest = "175198700738617158311",
            endPort = "In"
          },
          {
            startQuest = "17553425933174566595",
            startPort = "true",
            endQuest = "17553425933174566594",
            endPort = "In"
          },
          {
            startQuest = "1744439178266368",
            startPort = "QuestStart",
            endQuest = "17553425933174566595",
            endPort = "In"
          },
          {
            startQuest = "17553425933174566595",
            startPort = "true",
            endQuest = "17528049035921931672",
            endPort = "In"
          },
          {
            startQuest = "17540164075606617",
            startPort = "Success",
            endQuest = "17540558803313928731",
            endPort = "In"
          },
          {
            startQuest = "17540558803313928731",
            startPort = "Out",
            endQuest = "1744439178267375",
            endPort = "Success"
          },
          {
            startQuest = "17573992892535585637",
            startPort = "Out",
            endQuest = "17573992892535585636",
            endPort = "In"
          },
          {
            startQuest = "17573992892535585636",
            startPort = "Out",
            endQuest = "17573992892535585638",
            endPort = "In"
          },
          {
            startQuest = "17553425933174566595",
            startPort = "false",
            endQuest = "17573992892535585637",
            endPort = "In"
          },
          {
            startQuest = "17573992892535585636",
            startPort = "Out",
            endQuest = "17540164075606617",
            endPort = "In"
          },
          {
            startQuest = "175198700738617158311",
            startPort = "Out",
            endQuest = "17540164075606617",
            endPort = "In"
          }
        },
        nodeData = {
          ["1744439178266368"] = {
            key = "1744439178266368",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 799.7730038723953, y = 319.0985309484296},
            propsData = {ModeType = 0}
          },
          ["1744439178267375"] = {
            key = "1744439178267375",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2541.816906644082, y = 311.2890222096743},
            propsData = {ModeType = 0}
          },
          ["1744439178267382"] = {
            key = "1744439178267382",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2611.886617730096, y = 534.2575381140603},
            propsData = {}
          },
          ["17478325550069078"] = {
            key = "17478325550069078",
            type = "TalkNode",
            name = "\233\187\145\229\185\149",
            pos = {x = 2980.7259406206276, y = -1043.7328113063406},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 211023,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Feina_Feina01_1230054",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12030001,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
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
          ["175198700738617158311"] = {
            key = "175198700738617158311",
            type = "TalkNode",
            name = "\227\128\144fx02\227\128\145\229\165\165\230\160\188\231\156\139\229\136\176\230\149\133\228\186\139\228\185\166",
            pos = {x = 1758.2109749500826, y = 318.01908142969256},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12030201,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Feina_FixSimple02",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
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
                  TalkActorId = 211024,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211002,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 211024},
                {TalkActorType = "Npc", TalkActorId = 211002}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17526331435646707510"] = {
            key = "17526331435646707510",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 3304.570652173912, y = -776.7611892583119},
            propsData = {
              MessageType = "GameMode",
              MessageContent = -1,
              UnitId = -1
            }
          },
          ["17526348523346709599"] = {
            key = "17526348523346709599",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 3296.3967949311873, y = -639.6927783819356},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Feina01HomeEnd",
              UnitId = -1
            }
          },
          ["17526361054358625916"] = {
            key = "17526361054358625916",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\180\187\229\138\168\229\133\165\229\143\163",
            pos = {x = 2164.4637307312487, y = -262.6884460884247},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230054}
            }
          },
          ["17526361707338626195"] = {
            key = "17526361707338626195",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\180\187\229\138\168\229\133\165\229\143\163",
            pos = {x = 3084.773465474267, y = -910.9037145046366},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230054}
            }
          },
          ["175264683755010543540"] = {
            key = "175264683755010543540",
            type = "TalkNode",
            name = "\227\128\144fx02\227\128\145\229\165\165\230\160\188\231\156\139\229\136\176\230\149\133\228\186\139\228\185\166",
            pos = {x = 3334.3657882600783, y = -934.4837353708979},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12030201,
              FlowAssetPath = "DialogueAsset'/Game/Dialogue/ActiveQuest/ActiveFeina/ActiveFeina01/120302.120302'",
              TalkType = "QuestImpression",
              TalkStageName = "",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
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
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211002,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211002}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17528049035921931672"] = {
            key = "17528049035921931672",
            type = "TalkNode",
            name = "\233\187\145\229\185\149",
            pos = {x = 1484.3340579710148, y = 314.51666666666665},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12030001,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 0,
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
          ["17540164075606617"] = {
            key = "17540164075606617",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 2047.6691767451075, y = 330.05572755417967},
            propsData = {SpecialConfigId = 2051, BlackScreenImmediately = true}
          },
          ["17540415331641965435"] = {
            key = "17540415331641965435",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\180\187\229\138\168\229\133\165\229\143\163",
            pos = {x = 2441.4611111111108, y = -147.69999999999996},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230054}
            }
          },
          ["17540558803313928731"] = {
            key = "17540558803313928731",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 2280.7000000000003, y = 176.25000000000006},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 4,
              IsWhite = false
            }
          },
          ["17553425933174566594"] = {
            key = "17553425933174566594",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 1540.34779030286, y = 154.6558441558442},
            propsData = {
              VarName = "FeinaDay01Home",
              VarValue = 1
            }
          },
          ["17553425933174566595"] = {
            key = "17553425933174566595",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 1182.8840698990468, y = 340.1558441558442},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay01Home",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17573992892535585636"] = {
            key = "17573992892535585636",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1582, y = 642},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook00",
              IsUseCount = false
            }
          },
          ["17573992892535585637"] = {
            key = "17573992892535585637",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1480, y = 497.5},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          },
          ["17573992892535585638"] = {
            key = "17573992892535585638",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1720, y = 826.5},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          }
        },
        commentData = {}
      }
    },
    ["17444394510245619"] = {
      isStoryNode = true,
      key = "17444394510245619",
      type = "StoryNode",
      name = "\228\184\139\229\177\130\229\140\186&\229\135\186\233\151\168",
      pos = {x = 928.4608268860561, y = 265.83281845919157},
      propsData = {
        QuestId = 12011102,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120111_2",
        QuestDeatil = "Content_120111_2",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101101,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_OutSiderHome"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175403333644310043",
            startPort = "Fail",
            endQuest = "17444394510245626",
            endPort = "Fail"
          },
          {
            startQuest = "175403333644310043",
            startPort = "PassiveFail",
            endQuest = "17444394510245626",
            endPort = "Fail"
          },
          {
            startQuest = "175483180012010476808",
            startPort = "Out",
            endQuest = "175483180012010476807",
            endPort = "In"
          },
          {
            startQuest = "175403333644310043",
            startPort = "Success",
            endQuest = "175483180012010476808",
            endPort = "In"
          },
          {
            startQuest = "175483180012010476807",
            startPort = "Out",
            endQuest = "17444394510245623",
            endPort = "Success"
          },
          {
            startQuest = "17553423753523654750",
            startPort = "true",
            endQuest = "17553423753523654749",
            endPort = "In"
          },
          {
            startQuest = "17444394510245620",
            startPort = "QuestStart",
            endQuest = "17553423753523654750",
            endPort = "In"
          },
          {
            startQuest = "17553423753523654750",
            startPort = "true",
            endQuest = "175748640189017586",
            endPort = "In"
          },
          {
            startQuest = "175748640189017586",
            startPort = "Out",
            endQuest = "175403333644310043",
            endPort = "In"
          },
          {
            startQuest = "1757492307691936326",
            startPort = "Out",
            endQuest = "1757492307691936325",
            endPort = "In"
          },
          {
            startQuest = "1757492307691936325",
            startPort = "Out",
            endQuest = "1757492307691936327",
            endPort = "In"
          },
          {
            startQuest = "17553423753523654750",
            startPort = "false",
            endQuest = "1757492307691936326",
            endPort = "In"
          },
          {
            startQuest = "1757492307691936325",
            startPort = "Out",
            endQuest = "175403333644310043",
            endPort = "In"
          }
        },
        nodeData = {
          ["17444394510245620"] = {
            key = "17444394510245620",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -846.1180692372644, y = 291.8048128342246},
            propsData = {ModeType = 0}
          },
          ["17444394510245623"] = {
            key = "17444394510245623",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1059.8243501349916, y = 327.7169455258702},
            propsData = {ModeType = 0}
          },
          ["17444394510245626"] = {
            key = "17444394510245626",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 571.7263068739043, y = 666.1524933876192},
            propsData = {}
          },
          ["17478834342082674845"] = {
            key = "17478834342082674845",
            type = "TalkNode",
            name = "\227\128\144fx04\227\128\145",
            pos = {x = 624.261722488038, y = 1504.634928229665},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12030401,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Feina_FixSimple04",
              BlendInTime = 1,
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
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211002,
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
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211002},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175067639011110829628"] = {
            key = "175067639011110829628",
            type = "TalkNode",
            name = "\227\128\144fx05a\227\128\145\232\143\178\229\168\156\229\146\140\228\184\137\229\176\143\229\143\170",
            pos = {x = 964.3074534161485, y = 1494.6024844720496},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 211011,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Freida_Feina01_1191495",
              DelayShowGuideTime = 0,
              FirstDialogueId = 12030451,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Feina_FixSimple05",
              BlendInTime = 1,
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
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211011,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211010,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211013},
                {TalkActorType = "Npc", TalkActorId = 211011},
                {TalkActorType = "Npc", TalkActorId = 211010}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175205047567321913608"] = {
            key = "175205047567321913608",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\142\155\229\176\148\230\180\129\232\183\175\228\186\186",
            pos = {x = 212.11326173826154, y = 1482.83991008991},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {0}
            }
          },
          ["175403333644310043"] = {
            key = "175403333644310043",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 60.25140648824851, y = 290.8018034596981},
            propsData = {SpecialConfigId = 2052, BlackScreenImmediately = true}
          },
          ["175483180012010476807"] = {
            key = "175483180012010476807",
            type = "TalkNode",
            name = "\227\128\144fx05\227\128\145\232\143\178\229\168\156\229\146\140\228\184\137\229\176\143\229\143\170",
            pos = {x = 693.5907132083598, y = 314.7856983058223},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12030501,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Feina_FixSimple05",
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
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211011,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211010,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211013},
                {TalkActorType = "Npc", TalkActorId = 211011},
                {TalkActorType = "Npc", TalkActorId = 211010}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["175483180012010476808"] = {
            key = "175483180012010476808",
            type = "TalkNode",
            name = "\227\128\144fx05\227\128\145\232\143\178\229\168\156\229\146\140\228\184\137\229\176\143\229\143\170",
            pos = {x = 382.40928679164017, y = 313.2143016941777},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12030451,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Feina_FixSimple05",
              BlendInTime = 0,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211011,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211010,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211013},
                {TalkActorType = "Npc", TalkActorId = 211011},
                {TalkActorType = "Npc", TalkActorId = 211010}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17553423753523654749"] = {
            key = "17553423753523654749",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = -225.76813979809344, y = 107.65584415584419},
            propsData = {
              VarName = "FeinaDay01Walk",
              VarValue = 1
            }
          },
          ["17553423753523654750"] = {
            key = "17553423753523654750",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = -532.2318602019066, y = 278.6558441558442},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay01Walk",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["175748640189017586"] = {
            key = "175748640189017586",
            type = "TalkNode",
            name = "\227\128\144fx04\227\128\145",
            pos = {x = -225.18796992481194, y = 283.2469635627532},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12030401,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Feina_FixSimple04",
              BlendInTime = 1,
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
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211002,
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
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211002},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1757492307691936325"] = {
            key = "1757492307691936325",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = -170.02341137123744, y = 591.5317725752508},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook01",
              IsUseCount = false
            }
          },
          ["1757492307691936326"] = {
            key = "1757492307691936326",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = -275.07286192068796, y = 457.16913521261347},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191939, 1191940}
            }
          },
          ["1757492307691936327"] = {
            key = "1757492307691936327",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = -41.25418060200667, y = 755.2625418060201},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191939, 1191940}
            }
          }
        },
        commentData = {}
      }
    },
    ["1744888674560542"] = {
      isStoryNode = true,
      key = "1744888674560542",
      type = "StoryNode",
      name = "\228\184\139\229\177\130\229\140\186&\231\172\172\228\186\140\230\172\161\230\141\137\232\191\183\232\151\143",
      pos = {x = 1443.2947771011238, y = 265.02431308203626},
      propsData = {
        QuestId = 12011105,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120111_5",
        QuestDeatil = "Content_120111_5",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101101,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_OutSiderHome"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175403606123715077",
            startPort = "Fail",
            endQuest = "1744888674560555",
            endPort = "Fail"
          },
          {
            startQuest = "175403606123715077",
            startPort = "PassiveFail",
            endQuest = "1744888674560555",
            endPort = "Fail"
          },
          {
            startQuest = "175403606123715077",
            startPort = "Success",
            endQuest = "17552514160522133884",
            endPort = "In"
          },
          {
            startQuest = "17552514160522133884",
            startPort = "Out",
            endQuest = "17552514160522133883",
            endPort = "In"
          },
          {
            startQuest = "17553422040623652378",
            startPort = "true",
            endQuest = "17553422040623652377",
            endPort = "In"
          },
          {
            startQuest = "1744888674560553",
            startPort = "QuestStart",
            endQuest = "17553422040623652378",
            endPort = "In"
          },
          {
            startQuest = "17553422040623652378",
            startPort = "true",
            endQuest = "175403606123715077",
            endPort = "In"
          },
          {
            startQuest = "17574927663801869711",
            startPort = "Out",
            endQuest = "17574927663801869710",
            endPort = "In"
          },
          {
            startQuest = "17574927663801869710",
            startPort = "Out",
            endQuest = "17574927663801869712",
            endPort = "In"
          },
          {
            startQuest = "17553422040623652378",
            startPort = "false",
            endQuest = "17574927663801869711",
            endPort = "In"
          },
          {
            startQuest = "17574927663801869710",
            startPort = "Out",
            endQuest = "175403606123715077",
            endPort = "In"
          },
          {
            startQuest = "17552514160522133883",
            startPort = "Out",
            endQuest = "1744888674560554",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1744888674560553"] = {
            key = "1744888674560553",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 333.21638655462175, y = 317.2689075630252},
            propsData = {ModeType = 0}
          },
          ["1744888674560554"] = {
            key = "1744888674560554",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2179.8014811275684, y = 248.86120401337786},
            propsData = {ModeType = 0}
          },
          ["1744888674560555"] = {
            key = "1744888674560555",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1582.1428571428573, y = 485.42857142857144},
            propsData = {}
          },
          ["175403606123715077"] = {
            key = "175403606123715077",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1216.9450554927535, y = 302.58415707099914},
            propsData = {SpecialConfigId = 2054, BlackScreenImmediately = true}
          },
          ["17548310594037784288"] = {
            key = "17548310594037784288",
            type = "CommonBlackFadeInOutNode",
            name = "\233\128\154\231\148\168\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = 903.0643939393938, y = -95.96408199643507},
            propsData = {FadeTime = 0.5, FadeType = "FadeIn"}
          },
          ["17552514160522133883"] = {
            key = "17552514160522133883",
            type = "TalkNode",
            name = "\227\128\144fx08\227\128\145\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1890.1999141209662, y = 239.660972132368},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12030901,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple08",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
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
                  TalkActorId = 211001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 211001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17552514160522133884"] = {
            key = "17552514160522133884",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1535.8000858790338, y = 244.33902786763196},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12030809,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_FixSimple07",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "BlendOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
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
                  TalkActorId = 211001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 211001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17553422040623652377"] = {
            key = "17553422040623652377",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 999.2318602019066, y = 130.6558441558442},
            propsData = {
              VarName = "FeinaDay01Catch02",
              VarValue = 1
            }
          },
          ["17553422040623652378"] = {
            key = "17553422040623652378",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 662.7681397980934, y = 313.6558441558442},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay01Catch02",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17574927663801869710"] = {
            key = "17574927663801869710",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 971.2686932632586, y = 587.2958074534162},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook02",
              IsUseCount = false
            }
          },
          ["17574927663801869711"] = {
            key = "17574927663801869711",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 894.1322861920689, y = 448.5636048733875},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1192007, 1192008}
            }
          },
          ["17574927663801869712"] = {
            key = "17574927663801869712",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1068.3677138079313, y = 768.9363951266126},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1192007, 1192008}
            }
          }
        },
        commentData = {}
      }
    },
    ["1744888674560543"] = {
      isStoryNode = true,
      key = "1744888674560543",
      type = "StoryNode",
      name = "\229\155\158\229\165\165\231\137\185\232\181\155\229\190\183\231\154\132\229\174\182",
      pos = {x = 3051.2929745913293, y = 253.65081346634568},
      propsData = {
        QuestId = 12011109,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120111_9",
        QuestDeatil = "Content_120111_9",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = true,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = false,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_LeaveOutsidersHome"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17548212746641500956",
            startPort = "Out",
            endQuest = "17548212746641500955",
            endPort = "In"
          },
          {
            startQuest = "17548212746641500954",
            startPort = "Out",
            endQuest = "17548212746641500956",
            endPort = "In"
          },
          {
            startQuest = "17548212746641500955",
            startPort = "Out",
            endQuest = "1744888674560561",
            endPort = "Success"
          },
          {
            startQuest = "175403642062519915",
            startPort = "Success",
            endQuest = "17548212746641500954",
            endPort = "In"
          },
          {
            startQuest = "175403642062519915",
            startPort = "Fail",
            endQuest = "1744888674560562",
            endPort = "Fail"
          },
          {
            startQuest = "175403642062519915",
            startPort = "PassiveFail",
            endQuest = "1744888674560562",
            endPort = "Fail"
          },
          {
            startQuest = "17553428267704573162",
            startPort = "true",
            endQuest = "17553428267704573161",
            endPort = "In"
          },
          {
            startQuest = "1744888674560560",
            startPort = "QuestStart",
            endQuest = "17553428267704573162",
            endPort = "In"
          },
          {
            startQuest = "17553428267704573162",
            startPort = "true",
            endQuest = "175403642062519915",
            endPort = "In"
          },
          {
            startQuest = "17573993088675586327",
            startPort = "Out",
            endQuest = "17573993088675586326",
            endPort = "In"
          },
          {
            startQuest = "17573993088675586326",
            startPort = "Out",
            endQuest = "17573993088675586328",
            endPort = "In"
          },
          {
            startQuest = "17553428267704573162",
            startPort = "false",
            endQuest = "17573993088675586327",
            endPort = "In"
          },
          {
            startQuest = "17573993088675586326",
            startPort = "Out",
            endQuest = "175403642062519915",
            endPort = "In"
          }
        },
        nodeData = {
          ["1744888674560560"] = {
            key = "1744888674560560",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -162.55319448353498, y = 539.6145510835913},
            propsData = {ModeType = 0}
          },
          ["1744888674560561"] = {
            key = "1744888674560561",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2087.2167285803434, y = 396.06658147344643},
            propsData = {ModeType = 0}
          },
          ["1744888674560562"] = {
            key = "1744888674560562",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1718.9864661654137, y = 734.4526315789474},
            propsData = {}
          },
          ["175403642062519915"] = {
            key = "175403642062519915",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1111.4736842105262, y = 527.1578947368421},
            propsData = {SpecialConfigId = 2057, BlackScreenImmediately = true}
          },
          ["17548212746641500954"] = {
            key = "17548212746641500954",
            type = "CameraControlClearNode",
            name = "\233\149\156\229\164\180\230\129\162\229\164\141",
            pos = {x = 1505.3059468641575, y = -17.115768575143473},
            propsData = {Duration = 3}
          },
          ["17548212746641500955"] = {
            key = "17548212746641500955",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136 \229\173\144\229\188\185\232\183\179/\230\148\187\229\135\187",
            pos = {x = 1726.0353660539536, y = 319.9906105131674},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Empty",
              SkillNameList = {"Skill2", "Skill3"}
            }
          },
          ["17548212746641500956"] = {
            key = "17548212746641500956",
            type = "ActivePlayerSkillsNode",
            name = "\229\164\177\230\149\136 \229\173\144\229\188\185\232\183\179/\230\148\187\229\135\187",
            pos = {x = 1598.791879222799, y = 156.80279182138892},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Lock",
              SkillNameList = {
                "Attack",
                "Avoid",
                "Skill1",
                "BulletJump",
                "Fire",
                "Slide"
              }
            }
          },
          ["17553428267704573161"] = {
            key = "17553428267704573161",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 650.9669345449618, y = 393.2308441558441},
            propsData = {
              VarName = "FeinaDay01Sleep",
              VarValue = 1
            }
          },
          ["17553428267704573162"] = {
            key = "17553428267704573162",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 196.50321414114865, y = 528.2308441558441},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay01Sleep",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17573993088675586326"] = {
            key = "17573993088675586326",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 626, y = 776},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook00",
              IsUseCount = false
            }
          },
          ["17573993088675586327"] = {
            key = "17573993088675586327",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 504, y = 619.5},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          },
          ["17573993088675586328"] = {
            key = "17573993088675586328",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 692, y = 962.5},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          }
        },
        commentData = {}
      }
    },
    ["17478836366563561164"] = {
      isStoryNode = true,
      key = "17478836366563561164",
      type = "StoryNode",
      name = "\228\184\139\229\177\130\229\140\186&\231\172\172\228\184\128\230\172\161\230\141\137\232\191\183\232\151\143",
      pos = {x = 1186.8399171075407, y = 264.0015427528753},
      propsData = {
        QuestId = 12011103,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120111_3",
        QuestDeatil = "Content_120111_3",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101101,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_OutSiderHome"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175403380166911929",
            startPort = "Fail",
            endQuest = "17478836366573561171",
            endPort = "Fail"
          },
          {
            startQuest = "175403380166911929",
            startPort = "PassiveFail",
            endQuest = "17478836366573561171",
            endPort = "Fail"
          },
          {
            startQuest = "175489665431112280473",
            startPort = "Out",
            endQuest = "17478836366573561170",
            endPort = "Success"
          },
          {
            startQuest = "175403380166911929",
            startPort = "Success",
            endQuest = "17552519385634867316",
            endPort = "In"
          },
          {
            startQuest = "17552519385634867316",
            startPort = "Out",
            endQuest = "175489665431112280473",
            endPort = "In"
          },
          {
            startQuest = "17478836366563561169",
            startPort = "QuestStart",
            endQuest = "17553406029391827249",
            endPort = "In"
          },
          {
            startQuest = "17553406029391827249",
            startPort = "true",
            endQuest = "17553405527051826843",
            endPort = "In"
          },
          {
            startQuest = "17553406029391827249",
            startPort = "true",
            endQuest = "175403380166911929",
            endPort = "In"
          },
          {
            startQuest = "1757492420271938599",
            startPort = "Out",
            endQuest = "1757492420271938598",
            endPort = "In"
          },
          {
            startQuest = "17553406029391827249",
            startPort = "false",
            endQuest = "1757492420271938599",
            endPort = "In"
          },
          {
            startQuest = "1757492420271938598",
            startPort = "Out",
            endQuest = "175403380166911929",
            endPort = "In"
          },
          {
            startQuest = "1757492420271938598",
            startPort = "Out",
            endQuest = "1757492717362939279",
            endPort = "In"
          }
        },
        nodeData = {
          ["17478836366563561169"] = {
            key = "17478836366563561169",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -244.27941583251857, y = 370.6170967947115},
            propsData = {ModeType = 0}
          },
          ["17478836366573561170"] = {
            key = "17478836366573561170",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1532.1025153336373, y = 351.4643297206227},
            propsData = {ModeType = 0}
          },
          ["17478836366573561171"] = {
            key = "17478836366573561171",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 944.626222747504, y = 520.2908944602308},
            propsData = {}
          },
          ["175403369262111335"] = {
            key = "175403369262111335",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1042.8974864285224, y = 860.3187464709204},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1191428,
              GuideType = "M",
              GuidePointName = "Mechanism_TriggerBox_Feina01_1191428"
            }
          },
          ["175403380166911929"] = {
            key = "175403380166911929",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 577.0225870620626, y = 330.2137686874528},
            propsData = {SpecialConfigId = 2053, BlackScreenImmediately = true}
          },
          ["175489665431112280473"] = {
            key = "175489665431112280473",
            type = "TalkNode",
            name = "\227\128\144fx06\227\128\145\232\143\178\229\168\156\229\146\140\228\184\137\229\176\143\229\143\170",
            pos = {x = 1208, y = 322},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12030701,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Feina_FixSimple06",
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
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211011,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211010,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211013},
                {TalkActorType = "Npc", TalkActorId = 211011},
                {TalkActorType = "Npc", TalkActorId = 211010}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17552519385634867316"] = {
            key = "17552519385634867316",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 912, y = 324},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12030650,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = 0,
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
          ["17553405527051826843"] = {
            key = "17553405527051826843",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 584, y = 147.5},
            propsData = {
              VarName = "FeinaDay01Catch01",
              VarValue = 1
            }
          },
          ["17553406029391827249"] = {
            key = "17553406029391827249",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 78.53627959618689, y = 336.5},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay01Catch01",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["1757492420271938598"] = {
            key = "1757492420271938598",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 264.12561713648665, y = 635.2579630514413},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook02",
              IsUseCount = false
            }
          },
          ["1757492420271938599"] = {
            key = "1757492420271938599",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 186.98921006529696, y = 496.5257604714125},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1192007, 1192008}
            }
          },
          ["1757492717362939279"] = {
            key = "1757492717362939279",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 383.7246376811593, y = 809.3985507246377},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1192007, 1192008}
            }
          }
        },
        commentData = {}
      }
    },
    ["17479027609643564232"] = {
      isStoryNode = true,
      key = "17479027609643564232",
      type = "StoryNode",
      name = "\231\173\137\229\190\133\229\174\140\230\136\144\229\137\175\230\156\172\227\128\1441\227\128\145",
      pos = {x = 1900.4357812731387, y = 222.0285725461927},
      propsData = {
        QuestId = 12011106,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120111_6",
        QuestDeatil = "Content_120111_6",
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
        StoryGuidePointName = "TargetPoint_OutSiderHome"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17573994855196516952",
            startPort = "Out",
            endQuest = "17551386439832235",
            endPort = "In"
          },
          {
            startQuest = "175755657860020437414",
            startPort = "Out",
            endQuest = "17573994855196516952",
            endPort = "In"
          },
          {
            startQuest = "17479027609643564233",
            startPort = "QuestStart",
            endQuest = "17573994855196516953",
            endPort = "In"
          },
          {
            startQuest = "17573994855196516953",
            startPort = "true",
            endQuest = "175755657860020437414",
            endPort = "In"
          },
          {
            startQuest = "17573994855196516953",
            startPort = "false",
            endQuest = "1759477794518313340",
            endPort = "In"
          },
          {
            startQuest = "1759477794518313340",
            startPort = "Success",
            endQuest = "1759478059804316139",
            endPort = "In"
          },
          {
            startQuest = "1759477794518313340",
            startPort = "Fail",
            endQuest = "1759478060871316185",
            endPort = "In"
          },
          {
            startQuest = "17551386439832235",
            startPort = "Out",
            endQuest = "1759478060871316185",
            endPort = "In"
          }
        },
        nodeData = {
          ["17479027609643564233"] = {
            key = "17479027609643564233",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 719.2156862745098, y = 424.7352941176471},
            propsData = {ModeType = 0}
          },
          ["17479027609643564236"] = {
            key = "17479027609643564236",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2213.6666666666656, y = 50.38235294117635},
            propsData = {ModeType = 0}
          },
          ["17479027609643564239"] = {
            key = "17479027609643564239",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2200, y = 960},
            propsData = {}
          },
          ["17551386439832235"] = {
            key = "17551386439832235",
            type = "OpenSytstemUINode",
            name = "\230\137\147\229\188\128\231\149\140\233\157\162\232\138\130\231\130\185",
            pos = {x = 1710.6, y = 420.10952380952386},
            propsData = {
              UIName = "ActivityFeinaEventLevelSelect"
            }
          },
          ["17573994855196516952"] = {
            key = "17573994855196516952",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 1705.296813064772, y = 262.54514924249276},
            propsData = {
              VarName = "FeinaDay01UI",
              VarValue = 1
            }
          },
          ["17573994855196516953"] = {
            key = "17573994855196516953",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 1035.0188400782056, y = 422.11904761904754},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay01UI",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["175755657860020437414"] = {
            key = "175755657860020437414",
            type = "TalkNode",
            name = "\230\137\147\229\188\128\228\185\166\230\156\172",
            pos = {x = 1413.4379084967322, y = 418.1470588235294},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/AssetDesign/Story/Sequence/ActivityFeina/Feina01_Seq/Feina01_Book",
              InType = "BlendIn",
              OutType = "BlendOut",
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["1759477794518313340"] = {
            key = "1759477794518313340",
            type = "ConditionNode",
            name = "\230\157\161\228\187\182\232\138\130\231\130\185",
            pos = {x = 1710, y = 640},
            propsData = {ConditionId = 12011106}
          },
          ["1759478059804316139"] = {
            key = "1759478059804316139",
            type = "QuestConditionNode",
            name = "QuestCondition",
            pos = {x = 2287.6666666666674, y = 516},
            propsData = {
              PortName = "\229\174\140\230\136\144\229\137\175\230\156\172"
            }
          },
          ["1759478060871316185"] = {
            key = "1759478060871316185",
            type = "QuestConditionNode",
            name = "QuestCondition",
            pos = {x = 2286.0000000000005, y = 676.0000000000001},
            propsData = {
              PortName = "\230\156\170\229\174\140\230\136\144\229\137\175\230\156\172"
            }
          }
        },
        commentData = {}
      }
    },
    ["17479031060384453675"] = {
      isStoryNode = true,
      key = "17479031060384453675",
      type = "StoryNode",
      name = "\228\184\139\229\177\130\229\140\186&\231\172\172\228\184\137\230\172\161\230\141\137\232\191\183\232\151\143",
      pos = {x = 2560.390304924544, y = 259.24098268880846},
      propsData = {
        QuestId = 12011107,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120111_7",
        QuestDeatil = "Content_120111_7",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101101,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_OutSiderHome"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175403618593617157",
            startPort = "Fail",
            endQuest = "17479031060384453682",
            endPort = "Fail"
          },
          {
            startQuest = "175403618593617157",
            startPort = "PassiveFail",
            endQuest = "17479031060384453682",
            endPort = "Fail"
          },
          {
            startQuest = "175403618593617157",
            startPort = "Success",
            endQuest = "175489699287512283944",
            endPort = "In"
          },
          {
            startQuest = "175489699287512283944",
            startPort = "Out",
            endQuest = "17479031060384453681",
            endPort = "Success"
          },
          {
            startQuest = "17553423420213653883",
            startPort = "true",
            endQuest = "17553423420213653882",
            endPort = "In"
          },
          {
            startQuest = "17479031060384453680",
            startPort = "QuestStart",
            endQuest = "17553423420213653883",
            endPort = "In"
          },
          {
            startQuest = "17553423420213653883",
            startPort = "true",
            endQuest = "175403618593617157",
            endPort = "In"
          },
          {
            startQuest = "17574928369232800697",
            startPort = "Out",
            endQuest = "17574928369232800696",
            endPort = "In"
          },
          {
            startQuest = "17574928369232800696",
            startPort = "Out",
            endQuest = "17574928369232800698",
            endPort = "In"
          },
          {
            startQuest = "17553423420213653883",
            startPort = "false",
            endQuest = "17574928369232800697",
            endPort = "In"
          },
          {
            startQuest = "17574928369232800696",
            startPort = "Out",
            endQuest = "175403618593617157",
            endPort = "In"
          }
        },
        nodeData = {
          ["17479031060384453680"] = {
            key = "17479031060384453680",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -287.75652173913056, y = 337.9826086956522},
            propsData = {ModeType = 0}
          },
          ["17479031060384453681"] = {
            key = "17479031060384453681",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1321.5511048918784, y = 275.676663624436},
            propsData = {ModeType = 0}
          },
          ["17479031060384453682"] = {
            key = "17479031060384453682",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 963.577994760659, y = 541.7273160276259},
            propsData = {}
          },
          ["175403618593617157"] = {
            key = "175403618593617157",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 607.438497680081, y = 279.5526695956263},
            propsData = {SpecialConfigId = 2055, BlackScreenImmediately = true}
          },
          ["175489699287512283944"] = {
            key = "175489699287512283944",
            type = "TalkNode",
            name = "\227\128\144fx10\227\128\145\232\143\178\229\168\156\229\146\140\228\184\137\229\176\143\229\143\170",
            pos = {x = 958, y = 282},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12031101,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Feina_FixSimple10",
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
              EndNewTargetPointName = "QuestPoint_Feina01Back",
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
                  TalkActorId = 211001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211011,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211010,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 211001},
                {TalkActorType = "Npc", TalkActorId = 211013},
                {TalkActorType = "Npc", TalkActorId = 211011},
                {TalkActorType = "Npc", TalkActorId = 211010}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17553423420213653882"] = {
            key = "17553423420213653882",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 352.23186020190656, y = 131.6558441558442},
            propsData = {
              VarName = "FeinaDay01Catch03",
              VarValue = 1
            }
          },
          ["17553423420213653883"] = {
            key = "17553423420213653883",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 11.768139798093443, y = 288.6558441558442},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay01Catch03",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17574928369232800696"] = {
            key = "17574928369232800696",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 358.66343010536383, y = 593.3484390323634},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook02",
              IsUseCount = false
            }
          },
          ["17574928369232800697"] = {
            key = "17574928369232800697",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 281.5270230341742, y = 454.6162364523347},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1192007, 1192008}
            }
          },
          ["17574928369232800698"] = {
            key = "17574928369232800698",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 478.26245065003656, y = 767.4890267055599},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1192007, 1192008}
            }
          }
        },
        commentData = {}
      }
    },
    ["17479043632358904821"] = {
      isStoryNode = true,
      key = "17479043632358904821",
      type = "StoryNode",
      name = "\229\155\158\229\174\182",
      pos = {x = 2807.095287200722, y = 252.3817294420555},
      propsData = {
        QuestId = 12011108,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120111_8",
        QuestDeatil = "Content_120111_8",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101101,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_TriggerBox_Feina01_1191468"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "175403620832817979",
            startPort = "Fail",
            endQuest = "17479043632358904828",
            endPort = "Fail"
          },
          {
            startQuest = "175403620832817979",
            startPort = "PassiveFail",
            endQuest = "17479043632358904828",
            endPort = "Fail"
          },
          {
            startQuest = "17553427675764571411",
            startPort = "true",
            endQuest = "17553427675764571410",
            endPort = "In"
          },
          {
            startQuest = "17479043632358904826",
            startPort = "QuestStart",
            endQuest = "17553427675764571411",
            endPort = "In"
          },
          {
            startQuest = "17553427675764571411",
            startPort = "true",
            endQuest = "175403620832817979",
            endPort = "In"
          },
          {
            startQuest = "175403620832817979",
            startPort = "Success",
            endQuest = "17555141494613634",
            endPort = "In"
          },
          {
            startQuest = "17555141494613634",
            startPort = "Out",
            endQuest = "17479043632358904827",
            endPort = "Success"
          },
          {
            startQuest = "175757798621735285102",
            startPort = "Out",
            endQuest = "175757798621735285101",
            endPort = "In"
          },
          {
            startQuest = "175757798621735285101",
            startPort = "Out",
            endQuest = "175757798621735285103",
            endPort = "In"
          },
          {
            startQuest = "17553427675764571411",
            startPort = "false",
            endQuest = "175757798621735285102",
            endPort = "In"
          },
          {
            startQuest = "175757798621735285101",
            startPort = "Out",
            endQuest = "175403620832817979",
            endPort = "In"
          }
        },
        nodeData = {
          ["17479043632358904826"] = {
            key = "17479043632358904826",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 534.6124401913876, y = 359.94736842105266},
            propsData = {ModeType = 0}
          },
          ["17479043632358904827"] = {
            key = "17479043632358904827",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1999.006937799043, y = 320.79377990430623},
            propsData = {ModeType = 0}
          },
          ["17479043632358904828"] = {
            key = "17479043632358904828",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1670.4, y = 519.9},
            propsData = {}
          },
          ["175403620832817979"] = {
            key = "175403620832817979",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 1379.4450554927535, y = 339.58415707099914},
            propsData = {SpecialConfigId = 2056, BlackScreenImmediately = true}
          },
          ["17553427675764571410"] = {
            key = "17553427675764571410",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 1052.2318602019066, y = 127.5},
            propsData = {
              VarName = "FeinaDay01Back",
              VarValue = 1
            }
          },
          ["17553427675764571411"] = {
            key = "17553427675764571411",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\152\175\229\144\166\229\156\168\233\152\182\230\174\1811",
            pos = {x = 809.7681397980934, y = 340.5},
            propsData = {
              FunctionName = "Equal",
              VarName = "FeinaDay01Back",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "0"}
              }
            }
          },
          ["17555141494613634"] = {
            key = "17555141494613634",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1654, y = 322},
            propsData = {
              ModeType = 1,
              Id = 101105,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["175757798621735285101"] = {
            key = "175757798621735285101",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1132.7686932632585, y = 603.4958074534162},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook02",
              IsUseCount = false
            }
          },
          ["175757798621735285102"] = {
            key = "175757798621735285102",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1055.632286192069, y = 464.7636048733874},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1192007, 1192008}
            }
          },
          ["175757798621735285103"] = {
            key = "175757798621735285103",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1252.3677138079313, y = 777.6363951266127},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1192007, 1192008}
            }
          }
        },
        commentData = {}
      }
    },
    ["175740355254411490745"] = {
      isStoryNode = true,
      key = "175740355254411490745",
      type = "GameModeCompleteNode",
      name = "\229\174\140\230\136\144\231\155\174\230\160\135",
      pos = {x = 2152.1530689752653, y = 390.77632256187746},
      propsData = {
        QuestId = 12011110,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120111_6",
        QuestDeatil = "Content_120111_6",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        InRegionExportName = "",
        bIsStartQuest = false,
        bIsEndQuest = true,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        GameModeTargetId = 70151,
        GameModeKeyCount = 1,
        QuestHintMessageId = 0,
        IsShowGuide = false,
        GuideType = "P",
        GuidePointName = "",
        InterfaceJumpId = 54
      },
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17574912490162616"] = {
      isStoryNode = true,
      key = "17574912490162616",
      type = "StoryNode",
      name = "\229\188\128\229\167\139\228\187\187\229\138\161",
      pos = {x = 889.380754475703, y = -118.03878942881522},
      propsData = {
        QuestId = 12011150,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120111_0",
        QuestDeatil = "Content_120111_0",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 101105,
        StoryGuideType = "Point",
        StoryGuidePointName = "TargetPoint_LeaveOutsidersHome"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17574912991473868",
            startPort = "Out",
            endQuest = "17574912991473867",
            endPort = "In"
          },
          {
            startQuest = "17574912991473867",
            startPort = "Out",
            endQuest = "17574912991473869",
            endPort = "In"
          },
          {
            startQuest = "17574912490162617",
            startPort = "QuestStart",
            endQuest = "17574912991473868",
            endPort = "In"
          },
          {
            startQuest = "17574912991473869",
            startPort = "Out",
            endQuest = "17574912490162620",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17574912490162617"] = {
            key = "17574912490162617",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 998.2105263157895, y = 321.89473684210526},
            propsData = {ModeType = 0}
          },
          ["17574912490162620"] = {
            key = "17574912490162620",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1796, y = 330},
            propsData = {ModeType = 0}
          },
          ["17574912490162623"] = {
            key = "17574912490162623",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17574912991473867"] = {
            key = "17574912991473867",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1392, y = 314},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11052,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "SavePoint_FeinaBook00",
              IsUseCount = false
            }
          },
          ["17574912991473868"] = {
            key = "17574912991473868",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1300, y = 161.5},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          },
          ["17574912991473869"] = {
            key = "17574912991473869",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1528, y = 486.5},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1230086, 1230087}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {
    ["1759478596340320545"] = {
      key = "1759478596340320545",
      name = "Phase01_Bonfire_Start",
      position = {x = 851.3759316770186, y = -233.55388198757754},
      size = {width = 588, height = 300}
    },
    ["1759478604197320813"] = {
      key = "1759478604197320813",
      name = "Phase02_SandBox_Try&Obstruction",
      position = {x = 848.3759316770186, y = 127.94611801242246},
      size = {width = 969, height = 325.5}
    },
    ["1759478632195321865"] = {
      key = "1759478632195321865",
      name = "Phase03_Labyrinth_Challenge",
      position = {x = 1861.2489073855206, y = 134.77708967234165},
      size = {width = 600, height = 400}
    },
    ["1759478645595322326"] = {
      key = "1759478645595322326",
      name = "Phase04_Reward&Back&Review",
      position = {x = 2531.563009949623, y = 116.81875633900833},
      size = {width = 733.3333333333336, height = 385}
    }
  }
}
