return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "175760593860752323881",
      startPort = "StoryStart",
      endStory = "175760593860752323883",
      endPort = "In"
    },
    {
      startStory = "175760593860752323883",
      startPort = "Success",
      endStory = "175760593860752323882",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["175760593860752323881"] = {
      isStoryNode = true,
      key = "175760593860752323881",
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
    ["175760593860752323882"] = {
      isStoryNode = true,
      key = "175760593860752323882",
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
    ["175760593860752323883"] = {
      isStoryNode = true,
      key = "175760593860752323883",
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
            startQuest = "175760593860752323884",
            startPort = "QuestStart",
            endQuest = "175760593860752323887",
            endPort = "In"
          },
          {
            startQuest = "175760593860752323887",
            startPort = "Out",
            endQuest = "175760593860752323885",
            endPort = "Success"
          }
        },
        nodeData = {
          ["175760593860752323884"] = {
            key = "175760593860752323884",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 816, y = 322},
            propsData = {ModeType = 0}
          },
          ["175760593860752323885"] = {
            key = "175760593860752323885",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1618, y = 324},
            propsData = {ModeType = 0}
          },
          ["175760593860752323886"] = {
            key = "175760593860752323886",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1656, y = 662},
            propsData = {}
          },
          ["175760593860752323887"] = {
            key = "175760593860752323887",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1220.2105263157894, y = 311.36842105263156},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80002014,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Feina_02_Unicorn",
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
