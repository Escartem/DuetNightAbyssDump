return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1704175979462219658",
      startPort = "StoryStart",
      endStory = "1704175979462219660",
      endPort = "In"
    },
    {
      startStory = "1704175979462219660",
      startPort = "Success",
      endStory = "1704175979462219659",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1704175979462219658"] = {
      isStoryNode = true,
      key = "1704175979462219658",
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
    ["1704175979462219659"] = {
      isStoryNode = true,
      key = "1704175979462219659",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1628, y = 352},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1704175979462219660"] = {
      isStoryNode = true,
      key = "1704175979462219660",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1248, y = 344},
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
        bIsNotifyGameMode = false,
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
            startQuest = "1704175979462219661",
            startPort = "QuestStart",
            endQuest = "1704175979462219665",
            endPort = "In"
          },
          {
            startQuest = "1704175979462219665",
            startPort = "Branch_1",
            endQuest = "1704175979462219664",
            endPort = "In"
          },
          {
            startQuest = "1704175979462219664",
            startPort = "Out",
            endQuest = "1704175979462219662",
            endPort = "Success"
          },
          {
            startQuest = "1704175979462219665",
            startPort = "Branch_2",
            endQuest = "1704175979462219666",
            endPort = "In"
          },
          {
            startQuest = "1704175979462219666",
            startPort = "Out",
            endQuest = "1704175979462219662",
            endPort = "Success"
          },
          {
            startQuest = "1704175979462219665",
            startPort = "Branch_3",
            endQuest = "1704175979463219673",
            endPort = "In"
          },
          {
            startQuest = "1704175979462219665",
            startPort = "Branch_4",
            endQuest = "1704175979463219672",
            endPort = "In"
          },
          {
            startQuest = "1704175979462219665",
            startPort = "Branch_5",
            endQuest = "1704175979462219671",
            endPort = "In"
          },
          {
            startQuest = "1704175979462219665",
            startPort = "Branch_6",
            endQuest = "1704175979462219670",
            endPort = "In"
          },
          {
            startQuest = "1704175979462219665",
            startPort = "Branch_7",
            endQuest = "1704175979462219669",
            endPort = "In"
          },
          {
            startQuest = "1704175979462219665",
            startPort = "Branch_8",
            endQuest = "1704175979462219668",
            endPort = "In"
          },
          {
            startQuest = "1704175979462219665",
            startPort = "Branch_9",
            endQuest = "1704175979462219667",
            endPort = "In"
          },
          {
            startQuest = "1704175979463219673",
            startPort = "Out",
            endQuest = "1704175979462219662",
            endPort = "Success"
          },
          {
            startQuest = "1704175979463219672",
            startPort = "Out",
            endQuest = "1704175979462219662",
            endPort = "Success"
          },
          {
            startQuest = "1704175979462219671",
            startPort = "Out",
            endQuest = "1704175979462219662",
            endPort = "Success"
          },
          {
            startQuest = "1704175979462219670",
            startPort = "Out",
            endQuest = "1704175979462219662",
            endPort = "Success"
          },
          {
            startQuest = "1704175979462219669",
            startPort = "Out",
            endQuest = "1704175979462219662",
            endPort = "Success"
          },
          {
            startQuest = "1704175979462219668",
            startPort = "Out",
            endQuest = "1704175979462219662",
            endPort = "Success"
          },
          {
            startQuest = "1704175979462219667",
            startPort = "Out",
            endQuest = "1704175979462219662",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1704175979462219661"] = {
            key = "1704175979462219661",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 778.75, y = 410},
            propsData = {ModeType = 0}
          },
          ["1704175979462219662"] = {
            key = "1704175979462219662",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2577.5, y = 457.08333333333337},
            propsData = {ModeType = 0}
          },
          ["1704175979462219663"] = {
            key = "1704175979462219663",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2308.3333333333335, y = 1045},
            propsData = {}
          },
          ["1704175979462219664"] = {
            key = "1704175979462219664",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1460.5231900452486, y = 274.6244343891403},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 70010101,
              FlowAssetPath = "",
              TalkType = "NoIntFixSimple",
              TalkStageName = "Stage_700101",
              BlendInTime = 1.5,
              BlendOutTime = 1.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = false,
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
                }
              },
              RemoveTalkActors = {
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
          ["1704175979462219665"] = {
            key = "1704175979462219665",
            type = "BranchTriggerNode",
            name = "\232\167\166\229\143\145\229\136\134\230\148\175\232\138\130\231\130\185",
            pos = {x = 1094, y = 363.49999999999994},
            propsData = {
              Branches = {
                700101,
                700102,
                700103,
                700104,
                700105,
                700106,
                700107,
                700108,
                700109
              }
            }
          },
          ["1704175979462219666"] = {
            key = "1704175979462219666",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1744.497549019608, y = 278.4705882352939},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 70010201,
              FlowAssetPath = "",
              TalkType = "NoIntFixSimple",
              TalkStageName = "Stage_700102",
              BlendInTime = 1.5,
              BlendOutTime = 1.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = false,
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
                }
              },
              RemoveTalkActors = {
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
          ["1704175979462219667"] = {
            key = "1704175979462219667",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2021.3333333333335, y = 642.6740196078433},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 70010901,
              FlowAssetPath = "",
              TalkType = "NoIntFixSimple",
              TalkStageName = "Stage_700109",
              BlendInTime = 1.5,
              BlendOutTime = 1.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = false,
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
                }
              },
              RemoveTalkActors = {
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
          ["1704175979462219668"] = {
            key = "1704175979462219668",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1746.6666666666667, y = 629.4387254901962},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 70010801,
              FlowAssetPath = "",
              TalkType = "NoIntFixSimple",
              TalkStageName = "Stage_700108",
              BlendInTime = 1.5,
              BlendOutTime = 1.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = false,
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
                }
              },
              RemoveTalkActors = {
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
          ["1704175979462219669"] = {
            key = "1704175979462219669",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1464.9705411010557, y = 617.7300420168069},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 70010701,
              FlowAssetPath = "",
              TalkType = "NoIntFixSimple",
              TalkStageName = "Stage_700107",
              BlendInTime = 1.5,
              BlendOutTime = 1.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = false,
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
                }
              },
              RemoveTalkActors = {
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
          ["1704175979462219670"] = {
            key = "1704175979462219670",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2024.7077205882354, y = 470.6102941176473},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 70010601,
              FlowAssetPath = "",
              TalkType = "NoIntFixSimple",
              TalkStageName = "Stage_700106",
              BlendInTime = 1.5,
              BlendOutTime = 1.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = false,
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
                }
              },
              RemoveTalkActors = {
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
          ["1704175979462219671"] = {
            key = "1704175979462219671",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1749.7910539215686, y = 454.97794117647084},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 70010501,
              FlowAssetPath = "",
              TalkType = "NoIntFixSimple",
              TalkStageName = "Stage_700105",
              BlendInTime = 1.5,
              BlendOutTime = 1.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = false,
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
                }
              },
              RemoveTalkActors = {
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
          ["1704175979463219672"] = {
            key = "1704175979463219672",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1460.3731617647059, y = 437.8799019607843},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 70010401,
              FlowAssetPath = "",
              TalkType = "NoIntFixSimple",
              TalkStageName = "Stage_700104",
              BlendInTime = 1.5,
              BlendOutTime = 1.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = false,
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
                }
              },
              RemoveTalkActors = {
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
          ["1704175979463219673"] = {
            key = "1704175979463219673",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 2023.8176804812833, y = 283.01715686274486},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 70010301,
              FlowAssetPath = "",
              TalkType = "NoIntFixSimple",
              TalkStageName = "Stage_700103",
              BlendInTime = 0.3,
              BlendOutTime = 0.3,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = false,
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
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
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
