return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1749708077062619827",
      startPort = "StoryStart",
      endStory = "1749708086086619893",
      endPort = "In"
    },
    {
      startStory = "1749708086086619893",
      startPort = "Success",
      endStory = "1749708077062619830",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1749708077062619827"] = {
      isStoryNode = true,
      key = "1749708077062619827",
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
    ["1749708077062619830"] = {
      isStoryNode = true,
      key = "1749708077062619830",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1608, y = 300},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1749708086086619893"] = {
      isStoryNode = true,
      key = "1749708086086619893",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1208, y = 288.00000000000006},
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
            startQuest = "1749708086086619898",
            startPort = "QuestStart",
            endQuest = "1749708086086619901",
            endPort = "In"
          },
          {
            startQuest = "1749708086086619898",
            startPort = "QuestStart",
            endQuest = "176008127674215550093",
            endPort = "In"
          },
          {
            startQuest = "1749708086086619901",
            startPort = "Out",
            endQuest = "176008131551015550732",
            endPort = "In"
          },
          {
            startQuest = "176008131551015550732",
            startPort = "Out",
            endQuest = "1749708086086619899",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1749708086086619898"] = {
            key = "1749708086086619898",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 353.3374384236454, y = 288.5451559934318},
            propsData = {ModeType = 0}
          },
          ["1749708086086619899"] = {
            key = "1749708086086619899",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1246.9852216748773, y = 294.1226053639847},
            propsData = {ModeType = 0}
          },
          ["1749708086086619900"] = {
            key = "1749708086086619900",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1553.5555555555557, y = 437.16666666666663},
            propsData = {}
          },
          ["1749708086086619901"] = {
            key = "1749708086086619901",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 686.0487012987002, y = 277.98051948051966},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80170301,
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
                  TalkActorId = 91502,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 91502},
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
          ["176008127674215550093"] = {
            key = "176008127674215550093",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 691.0977654115527, y = 441.5794884939623},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0071_lise_secret",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["176008131551015550732"] = {
            key = "176008131551015550732",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 966.0977654115527, y = 292.8294884939622},
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
