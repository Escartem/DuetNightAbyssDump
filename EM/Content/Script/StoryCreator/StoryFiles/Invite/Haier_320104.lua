return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17503211196481911482",
      startPort = "StoryStart",
      endStory = "17503211219441911525",
      endPort = "In"
    },
    {
      startStory = "17503211219441911525",
      startPort = "Success",
      endStory = "17503211196481911485",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17503211196481911482"] = {
      isStoryNode = true,
      key = "17503211196481911482",
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
    ["17503211196481911485"] = {
      isStoryNode = true,
      key = "17503211196481911485",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1610, y = 306},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17503211219441911525"] = {
      isStoryNode = true,
      key = "17503211219441911525",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1208, y = 296},
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
            startQuest = "17503211219441911530",
            startPort = "QuestStart",
            endQuest = "17503211219441911533",
            endPort = "In"
          },
          {
            startQuest = "17503211219441911530",
            startPort = "QuestStart",
            endQuest = "176008107561713061767",
            endPort = "In"
          },
          {
            startQuest = "17503211219441911533",
            startPort = "Out",
            endQuest = "176008108718113062110",
            endPort = "In"
          },
          {
            startQuest = "176008108718113062110",
            startPort = "Out",
            endQuest = "17503211219441911531",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17503211219441911530"] = {
            key = "17503211219441911530",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 353.3374384236454, y = 288.5451559934318},
            propsData = {ModeType = 0}
          },
          ["17503211219441911531"] = {
            key = "17503211219441911531",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1246.9218093320528, y = 294.37604826448637},
            propsData = {ModeType = 0}
          },
          ["17503211219441911532"] = {
            key = "17503211219441911532",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1034.3663663663665, y = 492.78828828828824},
            propsData = {}
          },
          ["17503211219441911533"] = {
            key = "17503211219441911533",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 679.197097020625, y = 275.99522536287265},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80160401,
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
          ["176008107561713061767"] = {
            key = "176008107561713061767",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 687.5469807540242, y = 127.88478046721087},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/0018_scene_iceground",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["176008108718113062110"] = {
            key = "176008108718113062110",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 957.5469807540239, y = 295.61205319448356},
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
