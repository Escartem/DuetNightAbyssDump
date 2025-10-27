return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17329462474616147442",
      startPort = "StoryStart",
      endStory = "17329462474616147444",
      endPort = "In"
    },
    {
      startStory = "17329462474616147444",
      startPort = "Success",
      endStory = "17329462474616147443",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17329462474616147442"] = {
      isStoryNode = true,
      key = "17329462474616147442",
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
    ["17329462474616147443"] = {
      isStoryNode = true,
      key = "17329462474616147443",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1435.111111111111, y = 298.44444444444446},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17329462474616147444"] = {
      isStoryNode = true,
      key = "17329462474616147444",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1109.867132867133, y = 300.07692307692304},
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
            startQuest = "17329462474616147445",
            startPort = "QuestStart",
            endQuest = "17329462474616147448",
            endPort = "In"
          },
          {
            startQuest = "17329462474616147445",
            startPort = "QuestStart",
            endQuest = "176008434936427995784",
            endPort = "In"
          },
          {
            startQuest = "17329462474616147448",
            startPort = "Out",
            endQuest = "176008435971327996058",
            endPort = "In"
          },
          {
            startQuest = "176008435971327996058",
            startPort = "Out",
            endQuest = "17329462474616147446",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17329462474616147445"] = {
            key = "17329462474616147445",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 353.3374384236454, y = 288.5451559934318},
            propsData = {ModeType = 0}
          },
          ["17329462474616147446"] = {
            key = "17329462474616147446",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1284.2569608053118, y = 297.77477927702813},
            propsData = {ModeType = 0}
          },
          ["17329462474616147447"] = {
            key = "17329462474616147447",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1140.0772946859904, y = 588.4710144927535},
            propsData = {}
          },
          ["17329462474616147448"] = {
            key = "17329462474616147448",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 689.7987012987002, y = 277.98051948051966},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80120401,
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
                  TalkActorId = 93301,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 93301},
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
          ["176008434936427995784"] = {
            key = "176008434936427995784",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 684, y = 442.00000000000006},
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
          ["176008435971327996058"] = {
            key = "176008435971327996058",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1000, y = 296.00000000000006},
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
