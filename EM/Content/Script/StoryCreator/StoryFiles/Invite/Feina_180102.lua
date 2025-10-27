return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1732783210609494565",
      startPort = "StoryStart",
      endStory = "1732783210609494567",
      endPort = "In"
    },
    {
      startStory = "1732783210609494567",
      startPort = "Success",
      endStory = "1732783210609494566",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1732783210609494565"] = {
      isStoryNode = true,
      key = "1732783210609494565",
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
    ["1732783210609494566"] = {
      isStoryNode = true,
      key = "1732783210609494566",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1435.111111111111, y = 298.44444444444446},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783210609494567"] = {
      isStoryNode = true,
      key = "1732783210609494567",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1102.888888888889, y = 288.44444444444446},
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
            startQuest = "1732783210609494571",
            startPort = "Out",
            endQuest = "1725259013188200997",
            endPort = "In"
          },
          {
            startQuest = "1725259013188200997",
            startPort = "Out",
            endQuest = "1732783210609494569",
            endPort = "Success"
          },
          {
            startQuest = "1732783210609494568",
            startPort = "QuestStart",
            endQuest = "1752587403208586",
            endPort = "In"
          },
          {
            startQuest = "1752587403208586",
            startPort = "Out",
            endQuest = "1737623289938565",
            endPort = "In"
          },
          {
            startQuest = "1732783210609494568",
            startPort = "QuestStart",
            endQuest = "1752587416941987",
            endPort = "In"
          },
          {
            startQuest = "1752587416941987",
            startPort = "Out",
            endQuest = "17227467872431101",
            endPort = "In"
          },
          {
            startQuest = "1752587416941987",
            startPort = "Out",
            endQuest = "17252443077681630",
            endPort = "In"
          },
          {
            startQuest = "1752587416941987",
            startPort = "Out",
            endQuest = "1732783210609494571",
            endPort = "In"
          }
        },
        nodeData = {
          ["17227467872431101"] = {
            key = "17227467872431101",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175,\229\164\156\233\135\140",
            pos = {x = 1084.5217391304345, y = -8.434782608695727},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "IcelakeCityNight",
              UnitId = -1
            }
          },
          ["17252443077681630"] = {
            key = "17252443077681630",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1085.6521739130433, y = 146.69565217391295},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/0034_atomos_feina_home",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["1725259013188200997"] = {
            key = "1725259013188200997",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1338.0591133004932, y = 287.25123152709386},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 1,
              SoundType = 0
            }
          },
          ["1732783210609494568"] = {
            key = "1732783210609494568",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 232.4444444444444, y = -126.88888888888891},
            propsData = {ModeType = 0}
          },
          ["1732783210609494569"] = {
            key = "1732783210609494569",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1657.8928571428573, y = 287},
            propsData = {ModeType = 0}
          },
          ["1732783210609494570"] = {
            key = "1732783210609494570",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1572.0000000000002, y = 434.5},
            propsData = {}
          },
          ["1732783210609494571"] = {
            key = "1732783210609494571",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1079.3599878382488, y = 287.07230330056404},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80050201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_180102",
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
                  TalkActorType = "Npc",
                  TalkActorId = 790017,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790017},
                {TalkActorType = "Player", TalkActorId = 0},
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
          ["1737623289938565"] = {
            key = "1737623289938565",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1183.7777777777778, y = -268.22222222222223},
            propsData = {
              ModeType = 1,
              Id = 101101,
              StartIndex = 7,
              IsWhite = false
            }
          },
          ["1752587403208586"] = {
            key = "1752587403208586",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 726, y = -270},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1752587416941987"] = {
            key = "1752587416941987",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 744, y = 184},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
