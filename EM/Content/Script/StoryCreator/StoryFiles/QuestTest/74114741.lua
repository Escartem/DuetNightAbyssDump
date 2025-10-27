return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1737617619218669558",
      startPort = "StoryStart",
      endStory = "1737617619218669560",
      endPort = "In"
    },
    {
      startStory = "1737617619218669560",
      startPort = "Success",
      endStory = "1737617619218669559",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1737617619218669558"] = {
      isStoryNode = true,
      key = "1737617619218669558",
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
    ["1737617619218669559"] = {
      isStoryNode = true,
      key = "1737617619218669559",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1620, y = 310},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1737617619218669560"] = {
      isStoryNode = true,
      key = "1737617619218669560",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1172, y = 278},
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
            startQuest = "1737617619218669562",
            startPort = "QuestStart",
            endQuest = "1737617619218669561",
            endPort = "In"
          },
          {
            startQuest = "1737617619218669561",
            startPort = "Out",
            endQuest = "1737617619218669563",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1737617619218669561"] = {
            key = "1737617619218669561",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1220.857142857143, y = 295.4285714285714},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 741149401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Kawaii39",
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
                  TalkActorId = 74114779,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 74114779},
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
          ["1737617619218669562"] = {
            key = "1737617619218669562",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1737617619218669563"] = {
            key = "1737617619218669563",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1830, y = 312},
            propsData = {ModeType = 0}
          },
          ["1737617619218669564"] = {
            key = "1737617619218669564",
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
