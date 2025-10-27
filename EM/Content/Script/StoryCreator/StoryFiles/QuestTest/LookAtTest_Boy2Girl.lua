return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17396021539616058041",
      startPort = "StoryStart",
      endStory = "17396021539616058043",
      endPort = "In"
    },
    {
      startStory = "17396021539616058043",
      startPort = "Success",
      endStory = "17396021539616058042",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17396021539616058041"] = {
      isStoryNode = true,
      key = "17396021539616058041",
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
    ["17396021539616058042"] = {
      isStoryNode = true,
      key = "17396021539616058042",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1387.7777777777778, y = 298.8888888888889},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17396021539616058043"] = {
      isStoryNode = true,
      key = "17396021539616058043",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1096.4444444444443, y = 288},
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
            startQuest = "17396021539616058045",
            startPort = "QuestStart",
            endQuest = "17396021539616058044",
            endPort = "In"
          },
          {
            startQuest = "17396021539616058044",
            startPort = "Out",
            endQuest = "17396021539616058046",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17396021539616058044"] = {
            key = "17396021539616058044",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1220.857142857143, y = 295.4285714285714},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 750000201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "LookAt_Boy2Girl",
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
                  TalkActorType = "Npc",
                  TalkActorId = 76000007,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 76000008,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 76000007},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 76000008}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17396021539616058045"] = {
            key = "17396021539616058045",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17396021539616058046"] = {
            key = "17396021539616058046",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1830, y = 312},
            propsData = {ModeType = 0}
          },
          ["17396021539616058047"] = {
            key = "17396021539616058047",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1848, y = 808},
            propsData = {}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
