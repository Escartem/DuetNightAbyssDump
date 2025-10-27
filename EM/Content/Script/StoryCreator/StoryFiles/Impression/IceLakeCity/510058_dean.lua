return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17222361558114675",
      startPort = "StoryStart",
      endStory = "17222362744567460",
      endPort = "In"
    },
    {
      startStory = "17222362744567460",
      startPort = "Success",
      endStory = "17222361558114678",
      endPort = "StoryEnd"
    },
    {
      startStory = "17222362744567460",
      startPort = "Fail",
      endStory = "17222361558114678",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17222361558114675"] = {
      isStoryNode = true,
      key = "17222361558114675",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 800, y = 298.84615384615387},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17222361558114678"] = {
      isStoryNode = true,
      key = "17222361558114678",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1462.4242424242425, y = 313.78787878787875},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17222362744567460"] = {
      isStoryNode = true,
      key = "17222362744567460",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1126.9941727450464, y = 314.0541345250672},
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
            startQuest = "17222362744567461",
            startPort = "QuestStart",
            endQuest = "17222363001008202",
            endPort = "In"
          },
          {
            startQuest = "17222363001008202",
            startPort = "Option_1",
            endQuest = "17222363001008205",
            endPort = "In"
          },
          {
            startQuest = "17222363001008202",
            startPort = "Fail",
            endQuest = "17222362744577465",
            endPort = "Fail"
          },
          {
            startQuest = "17222363001008205",
            startPort = "Out",
            endQuest = "17222362744577463",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17222362744567461"] = {
            key = "17222362744567461",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 295.1019736842105, y = 198.68092105263156},
            propsData = {ModeType = 0}
          },
          ["17222362744577463"] = {
            key = "17222362744577463",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1381.8073610599924, y = 83.7732017982018},
            propsData = {ModeType = 0}
          },
          ["17222362744577465"] = {
            key = "17222362744577465",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 998.5861597567587, y = 360.8031442241969},
            propsData = {}
          },
          ["17222363001008202"] = {
            key = "17222363001008202",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 627.27903824129, y = 179.44204635798627},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51001301,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0.5,
              BlendOutTime = 2,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {
                {
                  OptionText = "510013062",
                  OverrideBlend = true,
                  OverrideOutype = "BlendOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["17222363001008205"] = {
            key = "17222363001008205",
            type = "TalkNode",
            name = "\232\191\170\230\129\169",
            pos = {x = 1004.5757697560136, y = 56.354184061889654},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 51001307,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_Dien",
              BlendInTime = 0,
              BlendOutTime = 2,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
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
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200003,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 700014,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200003},
                {TalkActorType = "Npc", TalkActorId = 700014}
              },
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlusOptions = {},
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
