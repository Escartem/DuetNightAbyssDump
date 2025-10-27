return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17168856550291",
      startPort = "StoryStart",
      endStory = "1716886477404117245",
      endPort = "In"
    },
    {
      startStory = "1716886477404117245",
      startPort = "Success",
      endStory = "17168856550295",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17168856550291"] = {
      isStoryNode = true,
      key = "17168856550291",
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
    ["17168856550295"] = {
      isStoryNode = true,
      key = "17168856550295",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2156, y = 312},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1716886477404117245"] = {
      isStoryNode = true,
      key = "1716886477404117245",
      type = "StoryNode",
      name = "\230\181\183\230\187\169\230\156\168\230\161\182",
      pos = {x = 1502, y = 308},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "DynQuest_VillageMuTong_Des",
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
        bIsDynamicEvent = true,
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
            startQuest = "1716886477404117246",
            startPort = "QuestStart",
            endQuest = "1716888064673118078",
            endPort = "In"
          },
          {
            startQuest = "17212054148203146",
            startPort = "Out",
            endQuest = "17212054148203147",
            endPort = "In"
          },
          {
            startQuest = "17212055560456185",
            startPort = "Out",
            endQuest = "17212055560456186",
            endPort = "In"
          },
          {
            startQuest = "17212055621486389",
            startPort = "Out",
            endQuest = "17212055621486390",
            endPort = "In"
          },
          {
            startQuest = "17212055621486390",
            startPort = "Out",
            endQuest = "17169626862871645",
            endPort = "In"
          },
          {
            startQuest = "1716886477404117246",
            startPort = "QuestStart",
            endQuest = "17212054148203146",
            endPort = "In"
          },
          {
            startQuest = "1716886477404117246",
            startPort = "QuestStart",
            endQuest = "17212055560456185",
            endPort = "In"
          },
          {
            startQuest = "1716886477404117246",
            startPort = "QuestStart",
            endQuest = "17212055621486389",
            endPort = "In"
          },
          {
            startQuest = "17169626862871645",
            startPort = "Out",
            endQuest = "1716886477404117249",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1716886477404117246"] = {
            key = "1716886477404117246",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1716886477404117249"] = {
            key = "1716886477404117249",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2907.5154061624653, y = 820.7983193277312},
            propsData = {ModeType = 0}
          },
          ["1716886477404117252"] = {
            key = "1716886477404117252",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3465.714285714286, y = 764.2857142857143},
            propsData = {}
          },
          ["1716888064673118078"] = {
            key = "1716888064673118078",
            type = "TalkNode",
            name = "\229\188\128\232\189\166\230\181\183\230\187\169\230\156\168\230\161\182",
            pos = {x = 1206, y = 146},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000601,
              FlowAssetPath = "",
              TalkType = "UnimportGuide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17169626862871645"] = {
            key = "17169626862871645",
            type = "DynamicQuestSuccessNode",
            name = "\229\138\168\230\128\129\228\187\187\229\138\161\228\184\187\229\138\168\230\136\144\229\138\159",
            pos = {x = 2578.0975969335104, y = 819.2843874391864},
            propsData = {
              DialogueId = 0,
              UseTalkFadeOut = false,
              TalkFadeOutTime = 0
            }
          },
          ["17212054148203146"] = {
            key = "17212054148203146",
            type = "PickUpNode",
            name = "\232\167\130\229\175\159\230\156\168\230\161\1822",
            pos = {x = 1584.2458736354956, y = 388.6736822875604},
            propsData = {
              bActiveEnable = false,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 80001,
              UnitCount = 1,
              bGuideUIEnable = false,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["17212054148203147"] = {
            key = "17212054148203147",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1915.8604247190867, y = 381.73560179220453},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000612,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17212055560456185"] = {
            key = "17212055560456185",
            type = "PickUpNode",
            name = "\232\167\130\229\175\159\230\156\168\230\161\1821",
            pos = {x = 1571.6551795088744, y = 604.2525697235413},
            propsData = {
              bActiveEnable = false,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 80001,
              UnitCount = 2,
              bGuideUIEnable = false,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["17212055560456186"] = {
            key = "17212055560456186",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1930.9276253293078, y = 591.5776471229224},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000613,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17212055621486389"] = {
            key = "17212055621486389",
            type = "PickUpNode",
            name = "\232\167\130\229\175\159\230\156\168\230\161\1821",
            pos = {x = 1562.6025479299271, y = 835.9367802498574},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {
                1590155,
                1590156,
                1590195
              },
              QuestPickupId = -1,
              UnitId = 80001,
              UnitCount = 3,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "",
              IsUseCount = false
            }
          },
          ["17212055621486390"] = {
            key = "17212055621486390",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1926.1907832240447, y = 822.8408050176594},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000615,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
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
              TalkActors = {},
              RemoveTalkActors = {},
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
