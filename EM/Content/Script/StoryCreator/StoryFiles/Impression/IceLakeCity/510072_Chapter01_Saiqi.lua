return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1722247846475210109",
      startPort = "StoryStart",
      endStory = "1722247851478210231",
      endPort = "In"
    },
    {
      startStory = "1722247851478210231",
      startPort = "Success",
      endStory = "1722247846476210112",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1722247846475210109"] = {
      isStoryNode = true,
      key = "1722247846475210109",
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
    ["1722247846476210112"] = {
      isStoryNode = true,
      key = "1722247846476210112",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1867.5, y = 300},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1722247851478210231"] = {
      isStoryNode = true,
      key = "1722247851478210231",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\231\179\187\231\187\159\232\138\130\231\130\185",
      pos = {x = 1370.2822509152288, y = 273.85606685650663},
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
            startQuest = "1722247858820210644",
            startPort = "Option_1",
            endQuest = "1722247858820210645",
            endPort = "In"
          },
          {
            startQuest = "1722247858820210644",
            startPort = "Option_2",
            endQuest = "1722247858820210646",
            endPort = "In"
          },
          {
            startQuest = "1722247851478210232",
            startPort = "QuestStart",
            endQuest = "1722247858820210644",
            endPort = "In"
          },
          {
            startQuest = "1722247858820210645",
            startPort = "Out",
            endQuest = "1722247851478210234",
            endPort = "Success"
          },
          {
            startQuest = "1722247858820210646",
            startPort = "Out",
            endQuest = "1722247851478210234",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1722247851478210232"] = {
            key = "1722247851478210232",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1722247851478210234"] = {
            key = "1722247851478210234",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1976.6666666666665, y = 275},
            propsData = {ModeType = 0}
          },
          ["1722247851478210236"] = {
            key = "1722247851478210236",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1722247858820210644"] = {
            key = "1722247858820210644",
            type = "TalkNode",
            name = "\229\144\145\232\181\155\231\144\170\230\137\147\230\142\162\230\182\136\230\129\175\239\188\136\228\184\180\230\151\182\239\188\137",
            pos = {x = 1183.1758984985368, y = 264.7825097776423},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10107001,
              FlowAssetPath = "",
              TalkType = "QuestImpression",
              TalkStageName = "Stage_101070",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "BlendOut",
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200006,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200006}
              },
              OptionType = "plus",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              PlusOptions = {
                {
                  OptionText = "101070031",
                  PlusId = 1009,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                },
                {
                  OptionText = "101070032",
                  PlusId = 1010,
                  OverrideBlend = false,
                  OverrideOutype = "FadeOut",
                  OverrideOutTime = 0
                }
              },
              OverrideFailBlend = false
            }
          },
          ["1722247858820210645"] = {
            key = "1722247858820210645",
            type = "TalkNode",
            name = "\229\144\145\232\181\155\231\144\170\230\137\147\230\142\162\230\182\136\230\129\175\239\188\136\228\184\180\230\151\182\239\188\137",
            pos = {x = 1532.388603331921, y = 248.3203525707924},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10107004,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101070",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200006,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200006}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1722247858820210646"] = {
            key = "1722247858820210646",
            type = "TalkNode",
            name = "\229\144\145\232\181\155\231\144\170\230\137\147\230\142\162\230\182\136\230\129\175\239\188\136\228\184\180\230\151\182\239\188\137",
            pos = {x = 1526.6028890462069, y = 406.89178114222096},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10107006,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101070",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200006,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200006}
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
