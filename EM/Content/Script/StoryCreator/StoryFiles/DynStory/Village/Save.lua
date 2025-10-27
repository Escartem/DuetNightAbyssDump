return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17159285687791",
      startPort = "StoryStart",
      endStory = "1715931069544447",
      endPort = "In"
    },
    {
      startStory = "1715931069544447",
      startPort = "Success",
      endStory = "17159285687805",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17159285687791"] = {
      isStoryNode = true,
      key = "17159285687791",
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
    ["17159285687805"] = {
      isStoryNode = true,
      key = "17159285687805",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2325.2941176470586, y = 298.2352941176471},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1715931069544447"] = {
      isStoryNode = true,
      key = "1715931069544447",
      type = "StoryNode",
      name = "\230\149\145\231\154\142\231\154\142",
      pos = {x = 1552, y = 299.409090909091},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_VillageSave_Des",
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
            startQuest = "1715931069544448",
            startPort = "QuestStart",
            endQuest = "17159311071121515",
            endPort = "In"
          },
          {
            startQuest = "17159311071121515",
            startPort = "Out",
            endQuest = "17159310962711082",
            endPort = "In"
          },
          {
            startQuest = "17159311071121515",
            startPort = "Out",
            endQuest = "17159311417892530",
            endPort = "In"
          },
          {
            startQuest = "17169518415012526",
            startPort = "Out",
            endQuest = "1716898164412135073",
            endPort = "In"
          },
          {
            startQuest = "17159311417892530",
            startPort = "Out",
            endQuest = "1720944862106891",
            endPort = "In"
          },
          {
            startQuest = "1720944862106891",
            startPort = "Out",
            endQuest = "17169518415012526",
            endPort = "In"
          },
          {
            startQuest = "17159311686453265",
            startPort = "Out",
            endQuest = "1715931069544454",
            endPort = "Success"
          },
          {
            startQuest = "1720944862106891",
            startPort = "Out",
            endQuest = "17218172676278323",
            endPort = "In"
          },
          {
            startQuest = "17218172676278323",
            startPort = "Out",
            endQuest = "17159311478612743",
            endPort = "In"
          },
          {
            startQuest = "17159311478612743",
            startPort = "Out",
            endQuest = "17159311686453265",
            endPort = "In"
          }
        },
        nodeData = {
          ["1715931069544448"] = {
            key = "1715931069544448",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1715931069544454"] = {
            key = "1715931069544454",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2905.657894736842, y = 269.6390977443609},
            propsData = {ModeType = 0}
          },
          ["1715931069544460"] = {
            key = "1715931069544460",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2708.996240601504, y = 570.0714285714286},
            propsData = {}
          },
          ["17159310962711082"] = {
            key = "17159310962711082",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1437.734133126935, y = 140.24461722488047},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000501,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17159311071121515"] = {
            key = "17159311071121515",
            type = "ChangeStaticCreatorNode",
            name = "\229\136\155\229\187\186\231\154\142\231\154\142\229\146\140\230\128\170\231\137\169",
            pos = {x = 1109.7867647058822, y = 311.284090909091},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1590148,
                1590149,
                1590150,
                1590151
              }
            }
          },
          ["17159311417892530"] = {
            key = "17159311417892530",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1439.9860128261832, y = 371.9213089542038},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 3,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1590149,
                1590150,
                1590151
              }
            }
          },
          ["17159311478612743"] = {
            key = "17159311478612743",
            type = "TalkNode",
            name = "\231\154\142\231\154\142\230\132\159\232\176\162",
            pos = {x = 2296.879682422169, y = 271.1575789770871},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000511,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_Dyn71000601",
              BlendInTime = 0.2,
              BlendOutTime = 2,
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
                  TalkActorId = 800005,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 800005},
                {TalkActorType = "Player", TalkActorId = 0}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17159311686453265"] = {
            key = "17159311686453265",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2617.6702233524993, y = 278.58860218728654},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["1716898164412135073"] = {
            key = "1716898164412135073",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 2348.6233766233763, y = 588.779220779221},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "Dyn_TargetPoint2",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = true,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["17169518415012526"] = {
            key = "17169518415012526",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2040.7840909090912, y = 583.2613636363635},
            propsData = {WaitTime = 0.5}
          },
          ["1720944862106891"] = {
            key = "1720944862106891",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1706.8133971291868, y = 370.57607655502386},
            propsData = {WaitTime = 2}
          },
          ["17218172676278323"] = {
            key = "17218172676278323",
            type = "ChangeStaticCreatorNode",
            name = "\231\167\187\233\153\164\231\154\142\231\154\142",
            pos = {x = 1992.1102756892226, y = 295.5388471177945},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1590148}
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
