return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17506614399822427863",
      startPort = "StoryStart",
      endStory = "17506614399832427865",
      endPort = "In"
    },
    {
      startStory = "17506614399832427865",
      startPort = "Success",
      endStory = "17506614399832427864",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17506614399822427863"] = {
      isStoryNode = true,
      key = "17506614399822427863",
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
    ["17506614399832427864"] = {
      isStoryNode = true,
      key = "17506614399832427864",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1646.9565217391303, y = 306.5217391304348},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17506614399832427865"] = {
      isStoryNode = true,
      key = "17506614399832427865",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1223.4935064935066, y = 309.55194805194805},
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
            startQuest = "17506614399832427866",
            startPort = "QuestStart",
            endQuest = "17506614399832427869",
            endPort = "In"
          },
          {
            startQuest = "17506614399832427869",
            startPort = "Out",
            endQuest = "17506614399832427867",
            endPort = "Success"
          },
          {
            startQuest = "17506614399832427869",
            startPort = "Fail",
            endQuest = "17506614399832427868",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["17506614399832427866"] = {
            key = "17506614399832427866",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1092.8, y = 297.6},
            propsData = {ModeType = 0}
          },
          ["17506614399832427867"] = {
            key = "17506614399832427867",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2035.8823529411766, y = 275.29411764705884},
            propsData = {ModeType = 0}
          },
          ["17506614399832427868"] = {
            key = "17506614399832427868",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["17506614399832427869"] = {
            key = "17506614399832427869",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1590.1411764705883, y = 386.0470588235295},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = false,
              FirstDialogueId = 51010202,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
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
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700342,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 700342}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
