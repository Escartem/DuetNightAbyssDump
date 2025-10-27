return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1750321016240638978",
      startPort = "StoryStart",
      endStory = "1750321021896639019",
      endPort = "In"
    },
    {
      startStory = "1750321021896639019",
      startPort = "Success",
      endStory = "1750321016240638981",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1750321016240638978"] = {
      isStoryNode = true,
      key = "1750321016240638978",
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
    ["1750321016240638981"] = {
      isStoryNode = true,
      key = "1750321016240638981",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1616, y = 300},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1750321021896639019"] = {
      isStoryNode = true,
      key = "1750321021896639019",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1210, y = 286},
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
            startQuest = "1750321021896639024",
            startPort = "QuestStart",
            endQuest = "1750321021896639027",
            endPort = "In"
          },
          {
            startQuest = "1750321021896639024",
            startPort = "QuestStart",
            endQuest = "176008084326110573999",
            endPort = "In"
          },
          {
            startQuest = "1750321021896639027",
            startPort = "Out",
            endQuest = "176008085684410574385",
            endPort = "In"
          },
          {
            startQuest = "176008085684410574385",
            startPort = "Out",
            endQuest = "1750321021896639025",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1750321021896639024"] = {
            key = "1750321021896639024",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 353.3374384236454, y = 288.5451559934318},
            propsData = {ModeType = 0}
          },
          ["1750321021896639025"] = {
            key = "1750321021896639025",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1327.2399911502348, y = 294.23968462812275},
            propsData = {ModeType = 0}
          },
          ["1750321021896639026"] = {
            key = "1750321021896639026",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1034.3663663663665, y = 492.78828828828824},
            propsData = {}
          },
          ["1750321021896639027"] = {
            key = "1750321021896639027",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 721.6516424751705, y = 276.49522536287265},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80160201,
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
                  TalkActorId = 93201,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 93201},
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
          ["176008084326110573999"] = {
            key = "176008084326110573999",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 718.7801724137931, y = 99.6336206896552},
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
          ["176008085684410574385"] = {
            key = "176008085684410574385",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1039.9870689655172, y = 295.875},
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
