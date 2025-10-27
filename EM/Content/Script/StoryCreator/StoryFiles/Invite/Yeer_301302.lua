return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17337134843318363186",
      startPort = "StoryStart",
      endStory = "17337134843318363185",
      endPort = "In"
    },
    {
      startStory = "17337134843318363185",
      startPort = "Success",
      endStory = "17337134843318363187",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17337134843318363185"] = {
      isStoryNode = true,
      key = "17337134843318363185",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1123.448275862069, y = 288.0689655172414},
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
            startQuest = "17337134843318363188",
            startPort = "QuestStart",
            endQuest = "17337134843318363191",
            endPort = "In"
          },
          {
            startQuest = "17337134843318363188",
            startPort = "QuestStart",
            endQuest = "176008152749919281850",
            endPort = "In"
          },
          {
            startQuest = "17337134843318363191",
            startPort = "Out",
            endQuest = "176008154713519282390",
            endPort = "In"
          },
          {
            startQuest = "176008154713519282390",
            startPort = "Out",
            endQuest = "17337134843318363189",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17337134843318363188"] = {
            key = "17337134843318363188",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 353.3374384236454, y = 288.5451559934318},
            propsData = {ModeType = 0}
          },
          ["17337134843318363189"] = {
            key = "17337134843318363189",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1320.21176126432, y = 291.8176200267413},
            propsData = {ModeType = 0}
          },
          ["17337134843318363190"] = {
            key = "17337134843318363190",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1553.5555555555557, y = 437.16666666666663},
            propsData = {}
          },
          ["17337134843318363191"] = {
            key = "17337134843318363191",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 676.9329268292684, y = 274.4664634146342},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80130201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_Invite",
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
                  TalkActorType = "Npc",
                  TalkActorId = 93103,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 93103},
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
          ["176008152749919281850"] = {
            key = "176008152749919281850",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 682.25, y = 444.25000000000006},
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
          ["176008154713519282390"] = {
            key = "176008154713519282390",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1000.5610334159898, y = 294.3132327710244},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 1,
              SoundType = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["17337134843318363186"] = {
      isStoryNode = true,
      key = "17337134843318363186",
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
    ["17337134843318363187"] = {
      isStoryNode = true,
      key = "17337134843318363187",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1435.111111111111, y = 298.44444444444446},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    }
  },
  commentData = {}
}
