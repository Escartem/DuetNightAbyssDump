return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17485894894881190504",
      startPort = "Success",
      endStory = "17485894841931190293",
      endPort = "StoryEnd"
    },
    {
      startStory = "17485894841931190290",
      startPort = "StoryStart",
      endStory = "17485894894881190504",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["17485894841931190290"] = {
      isStoryNode = true,
      key = "17485894841931190290",
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
    ["17485894841931190293"] = {
      isStoryNode = true,
      key = "17485894841931190293",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1690, y = 292},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17485894894881190504"] = {
      isStoryNode = true,
      key = "17485894894881190504",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1248, y = 286},
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
            startQuest = "17485894894881190505",
            startPort = "QuestStart",
            endQuest = "17489354962031090",
            endPort = "In"
          },
          {
            startQuest = "17485894894881190505",
            startPort = "QuestStart",
            endQuest = "17600804294256843763",
            endPort = "In"
          },
          {
            startQuest = "17489354962031090",
            startPort = "Out",
            endQuest = "17600804435326844042",
            endPort = "In"
          },
          {
            startQuest = "17600804435326844042",
            startPort = "Out",
            endQuest = "17485894894891190508",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17485894894881190505"] = {
            key = "17485894894881190505",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17485894894891190508"] = {
            key = "17485894894891190508",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1810, y = 304},
            propsData = {ModeType = 0}
          },
          ["17485894894891190511"] = {
            key = "17485894894891190511",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17489354962031090"] = {
            key = "17489354962031090",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1202, y = 306},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80150201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_410102",
              BlendInTime = 0,
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
                  TalkActorType = "Npc",
                  TalkActorId = 790044,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790008,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790044},
                {TalkActorType = "Npc", TalkActorId = 790008},
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
          ["17600804294256843763"] = {
            key = "17600804294256843763",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1204, y = 490},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/0016_judian",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["17600804435326844042"] = {
            key = "17600804435326844042",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1524, y = 310},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 1,
              SoundType = 0
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
