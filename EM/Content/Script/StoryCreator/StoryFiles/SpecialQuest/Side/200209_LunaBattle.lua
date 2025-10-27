return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17524838607991024",
      startPort = "StoryStart",
      endStory = "17524838654391165",
      endPort = "In"
    },
    {
      startStory = "17524838654391165",
      startPort = "Success",
      endStory = "17524838608001027",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17524838607991024"] = {
      isStoryNode = true,
      key = "17524838607991024",
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
    ["17524838608001027"] = {
      isStoryNode = true,
      key = "17524838608001027",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2800, y = 300},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17524838654391165"] = {
      isStoryNode = true,
      key = "17524838654391165",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1435.4285714285713, y = 273.42857142857144},
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
            startQuest = "17524838697991365",
            startPort = "Out",
            endQuest = "17524838697991366",
            endPort = "In"
          },
          {
            startQuest = "17524838654391166",
            startPort = "QuestStart",
            endQuest = "17524838697991365",
            endPort = "In"
          },
          {
            startQuest = "17524838698001367",
            startPort = "Out",
            endQuest = "17524941306802058",
            endPort = "In"
          },
          {
            startQuest = "17524838654391166",
            startPort = "QuestStart",
            endQuest = "17524941416082356",
            endPort = "In"
          },
          {
            startQuest = "17524838697991366",
            startPort = "Out",
            endQuest = "17524838698001368",
            endPort = "In"
          },
          {
            startQuest = "17524838697991366",
            startPort = "Out",
            endQuest = "17524838698001367",
            endPort = "In"
          },
          {
            startQuest = "17524941416082356",
            startPort = "Out",
            endQuest = "17524838654391172",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17524838654391166"] = {
            key = "17524838654391166",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 768.5714285714286, y = 480},
            propsData = {ModeType = 0}
          },
          ["17524838654391169"] = {
            key = "17524838654391169",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2491.2422360248447, y = 284.9689440993789},
            propsData = {ModeType = 0}
          },
          ["17524838654391172"] = {
            key = "17524838654391172",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2247.5801242236025, y = 836.5142857142858},
            propsData = {}
          },
          ["17524838697991365"] = {
            key = "17524838697991365",
            type = "TalkNode",
            name = "\232\167\166\229\143\145\233\156\178\229\168\156",
            pos = {x = 1085.2710987538126, y = 427.75753876866247},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51004935,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "TalkStageNew20020901",
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
                  TalkActorId = 700225,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700226,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700227,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 700225},
                {TalkActorType = "Npc", TalkActorId = 700226},
                {TalkActorType = "Npc", TalkActorId = 700227}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17524838697991366"] = {
            key = "17524838697991366",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\228\184\128\233\152\159\233\157\162\229\140\133\228\186\186",
            pos = {x = 1355.288232333141, y = 453.8373000876073},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1191210, 1191211}
            }
          },
          ["17524838698001367"] = {
            key = "17524838698001367",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1893.7289012461874, y = 472.03172880006684},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 2,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {1191210, 1191211}
            }
          },
          ["17524838698001368"] = {
            key = "17524838698001368",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1661.6593239089902, y = 260.3521997713618},
            propsData = {
              NewDescription = "Description_200209_7",
              NewDetail = "Content_200209_7",
              SubTaskTargetIndex = 0
            }
          },
          ["17524941306802058"] = {
            key = "17524941306802058",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 2241.9361118745096, y = 501.3873121131607},
            propsData = {}
          },
          ["17524941416082356"] = {
            key = "17524941416082356",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1762.9351610931528, y = 745.6897429743159},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
