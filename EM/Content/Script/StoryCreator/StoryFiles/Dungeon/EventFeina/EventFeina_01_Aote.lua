return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17575949569621",
      startPort = "StoryStart",
      endStory = "175760050156549537215",
      endPort = "In"
    },
    {
      startStory = "175760050156549537215",
      startPort = "Success",
      endStory = "17575949569635",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17575949569621"] = {
      isStoryNode = true,
      key = "17575949569621",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 986, y = 274},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17575949569635"] = {
      isStoryNode = true,
      key = "17575949569635",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1710.7368421052631, y = 294.8421052631579},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["175760050156549537215"] = {
      isStoryNode = true,
      key = "175760050156549537215",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1358.421052631579, y = 267.1578947368421},
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
            startQuest = "175760050156549537220",
            startPort = "QuestStart",
            endQuest = "175760050156549537223",
            endPort = "In"
          },
          {
            startQuest = "175760050156549537223",
            startPort = "Out",
            endQuest = "175760050156549537221",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175760050156549537220"] = {
            key = "175760050156549537220",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 828, y = 354},
            propsData = {ModeType = 0}
          },
          ["175760050156549537221"] = {
            key = "175760050156549537221",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1592, y = 350},
            propsData = {ModeType = 0}
          },
          ["175760050156549537222"] = {
            key = "175760050156549537222",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1656, y = 662},
            propsData = {}
          },
          ["175760050156549537223"] = {
            key = "175760050156549537223",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1200.2105263157894, y = 337.36842105263156},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80001022,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_01_02_Aote",
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 211001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 211001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
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
