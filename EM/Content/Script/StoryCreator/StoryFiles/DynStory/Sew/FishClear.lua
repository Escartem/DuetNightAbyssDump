return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17364937609611",
      startPort = "StoryStart",
      endStory = "1736494694115285",
      endPort = "In"
    },
    {
      startStory = "1736494694115285",
      startPort = "Success",
      endStory = "17364937609615",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17364937609611"] = {
      isStoryNode = true,
      key = "17364937609611",
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
    ["17364937609615"] = {
      isStoryNode = true,
      key = "17364937609615",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1563.6842105263158, y = 292.10526315789474},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1736494694115285"] = {
      isStoryNode = true,
      key = "1736494694115285",
      type = "StoryNode",
      name = "\230\141\149\233\177\188\230\184\133\231\144\134",
      pos = {x = 1155.0384615384617, y = 297.3846153846153},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_SewFishClear_Des",
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
            startQuest = "1736494694115286",
            startPort = "QuestStart",
            endQuest = "17364947393661571",
            endPort = "In"
          },
          {
            startQuest = "17364947393661571",
            startPort = "Out",
            endQuest = "17364947210671145",
            endPort = "In"
          },
          {
            startQuest = "17364947393661571",
            startPort = "Out",
            endQuest = "17364947631282168",
            endPort = "In"
          },
          {
            startQuest = "1736509312818709015",
            startPort = "Out",
            endQuest = "1736494694116293",
            endPort = "Success"
          },
          {
            startQuest = "1736508947624698",
            startPort = "Out",
            endQuest = "1736494694116293",
            endPort = "Success"
          },
          {
            startQuest = "17365089779261587",
            startPort = "Out",
            endQuest = "1736736311430703960",
            endPort = "In"
          },
          {
            startQuest = "1736736311430703960",
            startPort = "Out",
            endQuest = "1736509312818709015",
            endPort = "In"
          },
          {
            startQuest = "1736508954362861",
            startPort = "Out",
            endQuest = "17393511827993042903",
            endPort = "In"
          },
          {
            startQuest = "17393511827993042903",
            startPort = "Out",
            endQuest = "17393502619633041811",
            endPort = "In"
          },
          {
            startQuest = "1736508954362861",
            startPort = "Out",
            endQuest = "17393617510421000",
            endPort = "In"
          },
          {
            startQuest = "17393617510421000",
            startPort = "Out",
            endQuest = "17365089779261587",
            endPort = "Input_1"
          },
          {
            startQuest = "1736508954362861",
            startPort = "Out",
            endQuest = "17393617659031474",
            endPort = "In"
          },
          {
            startQuest = "1736508954362861",
            startPort = "Out",
            endQuest = "17393617669601529",
            endPort = "In"
          },
          {
            startQuest = "1736508954362861",
            startPort = "Out",
            endQuest = "17393617677721562",
            endPort = "In"
          },
          {
            startQuest = "1736508954362861",
            startPort = "Out",
            endQuest = "17393617708711660",
            endPort = "In"
          },
          {
            startQuest = "17393617659031474",
            startPort = "Out",
            endQuest = "17365089779261587",
            endPort = "Input_2"
          },
          {
            startQuest = "17393617669601529",
            startPort = "Out",
            endQuest = "17365089779261587",
            endPort = "Input_3"
          },
          {
            startQuest = "17393617677721562",
            startPort = "Out",
            endQuest = "17365089779261587",
            endPort = "Input_4"
          },
          {
            startQuest = "17393617708711660",
            startPort = "Out",
            endQuest = "17365089779261587",
            endPort = "Input_5"
          },
          {
            startQuest = "17364947631282168",
            startPort = "Option_1",
            endQuest = "1736508954362861",
            endPort = "In"
          },
          {
            startQuest = "17364947631282168",
            startPort = "Option_2",
            endQuest = "1736508947624698",
            endPort = "In"
          }
        },
        nodeData = {
          ["1736494694115286"] = {
            key = "1736494694115286",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1736494694116293"] = {
            key = "1736494694116293",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3648.9615384615386, y = 424.03846153846155},
            propsData = {ModeType = 0}
          },
          ["1736494694116300"] = {
            key = "1736494694116300",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3478.4615384615386, y = 771.5384615384614},
            propsData = {}
          },
          ["17364947210671145"] = {
            key = "17364947210671145",
            type = "TalkNode",
            name = "\229\188\128\232\189\166",
            pos = {x = 1484.784206840631, y = 64.91220330237358},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71005601,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17364947393661571"] = {
            key = "17364947393661571",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\141\149\233\177\188NPC",
            pos = {x = 1123.6984925549168, y = 309.140774730945},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1730133}
            }
          },
          ["17364947631282168"] = {
            key = "17364947631282168",
            type = "TalkNode",
            name = "\228\186\164\228\186\146\232\175\183\230\177\130\230\184\133\231\144\134\229\158\131\229\156\190",
            pos = {x = 1482.7001409065651, y = 270.112752752923},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818050,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1730133",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71005602,
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
              OptionType = "branch",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              BranchOptions = {"", ""},
              OverrideFailBlend = false
            }
          },
          ["1736508947624698"] = {
            key = "1736508947624698",
            type = "DynamicQuestFailNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\229\164\177\232\180\165",
            pos = {x = 1889.7307692307695, y = 638.9306680161944},
            propsData = {UseTalkFadeOut = false, TalkFadeOutTime = 0}
          },
          ["1736508954362861"] = {
            key = "1736508954362861",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\143\175\231\160\180\229\157\143\231\137\169",
            pos = {x = 1951.461538461539, y = 285.0460526315789},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1730134,
                1730135,
                1730136,
                1730162,
                1730163
              }
            }
          },
          ["17365089779261587"] = {
            key = "17365089779261587",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2626.1837606837607, y = 236.11015519568153},
            propsData = {ListenCount = 5, NeedFinishCount = 5}
          },
          ["1736509312818709015"] = {
            key = "1736509312818709015",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 3304.923076923077, y = 322.4883603238866},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1736736311430703960"] = {
            key = "1736736311430703960",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2925.4526224282813, y = 286.40541608492924},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 818050,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Dyn_1730133",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 71005605,
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
          ["17393502619633041811"] = {
            key = "17393502619633041811",
            type = "SendMessageNode",
            name = "\230\140\130\229\158\131\229\156\190\230\140\135\229\188\149\231\130\185",
            pos = {x = 2271.8125, y = -144.45138888888886},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "OpenGuidePoint",
              UnitId = -1
            }
          },
          ["17393511827993042903"] = {
            key = "17393511827993042903",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1972.75, y = -138.82638888888886},
            propsData = {WaitTime = 1}
          },
          ["17393617510421000"] = {
            key = "17393617510421000",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 2300.75, y = 24.5000000000001},
            propsData = {SendMessage = "", FinishCondition = "1730134"}
          },
          ["17393617659031474"] = {
            key = "17393617659031474",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 2309.5, y = 159.5},
            propsData = {SendMessage = "", FinishCondition = "1730135"}
          },
          ["17393617669601529"] = {
            key = "17393617669601529",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 2309.5, y = 288.25},
            propsData = {SendMessage = "", FinishCondition = "1730136"}
          },
          ["17393617677721562"] = {
            key = "17393617677721562",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 2320.75, y = 415.75},
            propsData = {SendMessage = "", FinishCondition = "1730162"}
          },
          ["17393617708711660"] = {
            key = "17393617708711660",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 2304.5, y = 555.7500000000001},
            propsData = {SendMessage = "", FinishCondition = "1730163"}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
