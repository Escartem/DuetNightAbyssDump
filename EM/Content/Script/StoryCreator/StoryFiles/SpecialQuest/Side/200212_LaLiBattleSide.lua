return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "174238251289314066504",
      startPort = "StoryStart",
      endStory = "174238251488914066540",
      endPort = "In"
    },
    {
      startStory = "174238251488914066540",
      startPort = "Success",
      endStory = "174238251289314066507",
      endPort = "StoryEnd"
    },
    {
      startStory = "174238251488914066540",
      startPort = "Fail",
      endStory = "174238251289314066507",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["174238251289314066504"] = {
      isStoryNode = true,
      key = "174238251289314066504",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1036.25, y = 257.25},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["174238251289314066507"] = {
      isStoryNode = true,
      key = "174238251289314066507",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2042.5, y = 280},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["174238251488914066540"] = {
      isStoryNode = true,
      key = "174238251488914066540",
      type = "StoryNode",
      name = "\230\149\153\232\174\173\230\139\137\233\135\140",
      pos = {x = 1434.5, y = 269.5},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "\230\149\153\232\174\173\230\139\137\233\135\140",
        QuestDescription = "Description_200212_4",
        QuestDeatil = "Content_200212_7",
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
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = ""
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "174238251488914066546",
            startPort = "Out",
            endQuest = "174238251488914066547",
            endPort = "In"
          },
          {
            startQuest = "174238251488914066545",
            startPort = "Out",
            endQuest = "174238251488914066546",
            endPort = "In"
          },
          {
            startQuest = "174238286773614588398",
            startPort = "Out",
            endQuest = "174238286773614588399",
            endPort = "In"
          },
          {
            startQuest = "174238251488914066548",
            startPort = "QuestStart",
            endQuest = "174238251488914066545",
            endPort = "In"
          },
          {
            startQuest = "174238287837114588845",
            startPort = "false",
            endQuest = "174238286773614588398",
            endPort = "In"
          },
          {
            startQuest = "174238251488914066547",
            startPort = "Out",
            endQuest = "174238287837114588845",
            endPort = "In"
          },
          {
            startQuest = "174238287837114588845",
            startPort = "true",
            endQuest = "174238401831714589877",
            endPort = "In"
          },
          {
            startQuest = "174238251488914066548",
            startPort = "QuestStart",
            endQuest = "17429868625462344554",
            endPort = "In"
          },
          {
            startQuest = "17429868625462344554",
            startPort = "Out",
            endQuest = "174238251488914066550",
            endPort = "Fail"
          },
          {
            startQuest = "174238401831714589877",
            startPort = "Out",
            endQuest = "17429887963843385180",
            endPort = "In"
          },
          {
            startQuest = "174238286773614588399",
            startPort = "Out",
            endQuest = "17429887963843385180",
            endPort = "In"
          }
        },
        nodeData = {
          ["174238251488914066545"] = {
            key = "174238251488914066545",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 571.7626027383263, y = 129.78397808501384},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1190518}
            }
          },
          ["174238251488914066546"] = {
            key = "174238251488914066546",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 838.2495035187055, y = 137.11861205008256},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 1,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {1190518}
            }
          },
          ["174238251488914066547"] = {
            key = "174238251488914066547",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1090.0617063441246, y = 150.55795101393772},
            propsData = {WaitTime = 2}
          },
          ["174238251488914066548"] = {
            key = "174238251488914066548",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 224.37569676700116, y = 121.82320698625044},
            propsData = {ModeType = 0}
          },
          ["174238251488914066549"] = {
            key = "174238251488914066549",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2561.914877151834, y = 196.9079623275276},
            propsData = {ModeType = 0}
          },
          ["174238251488914066550"] = {
            key = "174238251488914066550",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1433.6363636363637, y = 484.54545454545456},
            propsData = {}
          },
          ["174238286773614588398"] = {
            key = "174238286773614588398",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1484.3054999546453, y = 315.2699088650093},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51002801,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_20021204",
              BlendInTime = 0.5,
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
                  TalkActorId = 700112,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700114,
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
                {TalkActorType = "Npc", TalkActorId = 700112},
                {TalkActorType = "Npc", TalkActorId = 700114},
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
          ["174238286773614588399"] = {
            key = "174238286773614588399",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1772.3372459863917, y = 306.6032421983427},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51002810,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 2,
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
          ["174238287837114588845"] = {
            key = "174238287837114588845",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = 1368.988039637185, y = 131.38101997612043},
            propsData = {
              FunctionName = "Equal",
              VarName = "LarryChoice",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "1"}
              }
            }
          },
          ["174238401831714589877"] = {
            key = "174238401831714589877",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1738.672504689041, y = 42.740482494278595},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51008046,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_20021204",
              BlendInTime = 0.5,
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
                  TalkActorId = 700114,
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
                {TalkActorType = "Npc", TalkActorId = 700114},
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
          ["17429868625462344554"] = {
            key = "17429868625462344554",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 856.9090730141329, y = 448.5473481395369},
            propsData = {}
          },
          ["17429887963843385180"] = {
            key = "17429887963843385180",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 2224, y = 234},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
