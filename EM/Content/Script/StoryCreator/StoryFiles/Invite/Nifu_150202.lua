return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1749707929295698",
      startPort = "StoryStart",
      endStory = "1749707937727774",
      endPort = "In"
    },
    {
      startStory = "1749707937727774",
      startPort = "Success",
      endStory = "1749707929295701",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1749707929295698"] = {
      isStoryNode = true,
      key = "1749707929295698",
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
    ["1749707929295701"] = {
      isStoryNode = true,
      key = "1749707929295701",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1822, y = 316},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1749707937727774"] = {
      isStoryNode = true,
      key = "1749707937727774",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1326, y = 298.00000000000006},
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
            startQuest = "1749707937727779",
            startPort = "QuestStart",
            endQuest = "1749707937727782",
            endPort = "In"
          },
          {
            startQuest = "1749707937727779",
            startPort = "QuestStart",
            endQuest = "176008122481914927927",
            endPort = "In"
          },
          {
            startQuest = "1749707937727782",
            startPort = "Out",
            endQuest = "176008123032314928094",
            endPort = "In"
          },
          {
            startQuest = "176008123032314928094",
            startPort = "Out",
            endQuest = "1749707937727780",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1749707937727779"] = {
            key = "1749707937727779",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 353.3374384236454, y = 288.5451559934318},
            propsData = {ModeType = 0}
          },
          ["1749707937727780"] = {
            key = "1749707937727780",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1288.2352216748773, y = 300.3726053639847},
            propsData = {ModeType = 0}
          },
          ["1749707937727781"] = {
            key = "1749707937727781",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1553.5555555555557, y = 437.16666666666663},
            propsData = {}
          },
          ["1749707937727782"] = {
            key = "1749707937727782",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 684.7987012987002, y = 279.23051948051966},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80170201,
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
          ["176008122481914927927"] = {
            key = "176008122481914927927",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 685, y = 444.00000000000006},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/musicbox/0017_story_incave",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["176008123032314928094"] = {
            key = "176008123032314928094",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1002.5, y = 292.75},
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
