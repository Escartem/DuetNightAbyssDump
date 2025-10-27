return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1749799177882622291",
      startPort = "StoryStart",
      endStory = "1749799188538622383",
      endPort = "In"
    },
    {
      startStory = "1749799188538622383",
      startPort = "Success",
      endStory = "1749799177883622294",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1749799177882622291"] = {
      isStoryNode = true,
      key = "1749799177882622291",
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
    ["1749799177883622294"] = {
      isStoryNode = true,
      key = "1749799177883622294",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1608, y = 298},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1749799188538622383"] = {
      isStoryNode = true,
      key = "1749799188538622383",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1208, y = 288},
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
            startQuest = "1749799188538622388",
            startPort = "QuestStart",
            endQuest = "1749799188538622391",
            endPort = "In"
          },
          {
            startQuest = "1749799188538622388",
            startPort = "QuestStart",
            endQuest = "176008451189530486205",
            endPort = "In"
          },
          {
            startQuest = "1749799188538622391",
            startPort = "Out",
            endQuest = "176008451812530486432",
            endPort = "In"
          },
          {
            startQuest = "176008451812530486432",
            startPort = "Out",
            endQuest = "1749799188538622389",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1749799188538622388"] = {
            key = "1749799188538622388",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 353.3374384236454, y = 288.5451559934318},
            propsData = {ModeType = 0}
          },
          ["1749799188538622389"] = {
            key = "1749799188538622389",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1288.2352216748773, y = 291.6226053639847},
            propsData = {ModeType = 0}
          },
          ["1749799188538622390"] = {
            key = "1749799188538622390",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1553.5555555555557, y = 437.16666666666663},
            propsData = {}
          },
          ["1749799188538622391"] = {
            key = "1749799188538622391",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 678.5487012987002, y = 275.48051948051966},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80090301,
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
                  TalkActorId = 92301,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 92301},
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
          ["176008451189530486205"] = {
            key = "176008451189530486205",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 683.3385093167702, y = 446.3237713849841},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/0033_story_humour",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["176008451812530486432"] = {
            key = "176008451812530486432",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1000.8385093167703, y = 295.0737713849841},
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
