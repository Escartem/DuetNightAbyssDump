return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17439931090241637",
      startPort = "StoryStart",
      endStory = "17439932284851928",
      endPort = "In"
    },
    {
      startStory = "17439932284851928",
      startPort = "Success",
      endStory = "17439931090241640",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17439931090241637"] = {
      isStoryNode = true,
      key = "17439931090241637",
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
    ["17439931090241640"] = {
      isStoryNode = true,
      key = "17439931090241640",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1570, y = 278},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17439932284851928"] = {
      isStoryNode = true,
      key = "17439932284851928",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1278, y = 272},
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
            startQuest = "17439933030682535",
            startPort = "Out",
            endQuest = "17439932300602022",
            endPort = "In"
          },
          {
            startQuest = "17439932300602022",
            startPort = "Out",
            endQuest = "17439932996902433",
            endPort = "In"
          },
          {
            startQuest = "17439932284851929",
            startPort = "QuestStart",
            endQuest = "17446224536513936",
            endPort = "In"
          },
          {
            startQuest = "17446224536513936",
            startPort = "Out",
            endQuest = "17439932284851935",
            endPort = "Fail"
          },
          {
            startQuest = "17439932284851929",
            startPort = "QuestStart",
            endQuest = "17485244536888708005",
            endPort = "In"
          },
          {
            startQuest = "17485244536888708005",
            startPort = "Out",
            endQuest = "17439933030682535",
            endPort = "In"
          },
          {
            startQuest = "17439932996902433",
            startPort = "Out",
            endQuest = "17446224443803695",
            endPort = "In"
          }
        },
        nodeData = {
          ["17439932284851929"] = {
            key = "17439932284851929",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 516.3636363636363, y = 294.54545454545456},
            propsData = {ModeType = 0}
          },
          ["17439932284851932"] = {
            key = "17439932284851932",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2237.4848484848485, y = 307.3636363636364},
            propsData = {ModeType = 0}
          },
          ["17439932284851935"] = {
            key = "17439932284851935",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1570.6363636363637, y = 703.3636363636364},
            propsData = {}
          },
          ["17439932300602022"] = {
            key = "17439932300602022",
            type = "TalkNode",
            name = "\230\181\183\229\176\148\230\179\149\229\174\161\229\136\164",
            pos = {x = 1316, y = 264},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11015301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "EX01_FixSimple_24",
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
                  TalkActorId = 110039,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110022,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 110021,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 110039},
                {TalkActorType = "Npc", TalkActorId = 110022},
                {TalkActorType = "Npc", TalkActorId = 110021}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17439932996902433"] = {
            key = "17439932996902433",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1596, y = 272.6666666666667},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1660170}
            }
          },
          ["17439933030682535"] = {
            key = "17439933030682535",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1061.0476190476195, y = 286.00000000000006},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1660170}
            }
          },
          ["17446224443803695"] = {
            key = "17446224443803695",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 1960.3450923431571, y = 311.1286605551311},
            propsData = {}
          },
          ["17446224536513936"] = {
            key = "17446224536513936",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1102.6178196158844, y = 676.5832060096766},
            propsData = {}
          },
          ["17485244536888708005"] = {
            key = "17485244536888708005",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 796.2424242424244, y = 279.6969696969697},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "TargetPoint_JailFin",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = true,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
