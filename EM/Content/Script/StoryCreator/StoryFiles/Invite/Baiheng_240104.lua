return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17506649380591308852",
      startPort = "StoryStart",
      endStory = "17506649424361308924",
      endPort = "In"
    },
    {
      startStory = "17506649424361308924",
      startPort = "Success",
      endStory = "17506649380591308855",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17506649380591308852"] = {
      isStoryNode = true,
      key = "17506649380591308852",
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
    ["17506649380591308855"] = {
      isStoryNode = true,
      key = "17506649380591308855",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1606, y = 300},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17506649424361308924"] = {
      isStoryNode = true,
      key = "17506649424361308924",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1202, y = 270},
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
            startQuest = "17506649424361308933",
            startPort = "Out",
            endQuest = "17506649424361308934",
            endPort = "In"
          },
          {
            startQuest = "17506649424361308934",
            startPort = "Out",
            endQuest = "17506649600931309431",
            endPort = "In"
          },
          {
            startQuest = "17506649600931309431",
            startPort = "Out",
            endQuest = "17506649424361308930",
            endPort = "Success"
          },
          {
            startQuest = "17506649424361308929",
            startPort = "QuestStart",
            endQuest = "17528091064516096311",
            endPort = "In"
          },
          {
            startQuest = "17528091064516096311",
            startPort = "Out",
            endQuest = "17506649424361308932",
            endPort = "In"
          },
          {
            startQuest = "17506649424361308929",
            startPort = "QuestStart",
            endQuest = "17528091064516096312",
            endPort = "In"
          },
          {
            startQuest = "17528091064516096312",
            startPort = "Out",
            endQuest = "17506649424361308933",
            endPort = "In"
          }
        },
        nodeData = {
          ["17506649424361308929"] = {
            key = "17506649424361308929",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17506649424361308930"] = {
            key = "17506649424361308930",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2284, y = 296},
            propsData = {ModeType = 0}
          },
          ["17506649424361308931"] = {
            key = "17506649424361308931",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2092, y = 528},
            propsData = {}
          },
          ["17506649424361308932"] = {
            key = "17506649424361308932",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1404, y = 104},
            propsData = {
              ModeType = 1,
              Id = 104106,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17506649424361308933"] = {
            key = "17506649424361308933",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1404, y = 278},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80200301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_200401a",
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
                  TalkActorId = 790054,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790008,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790054},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790008}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17506649424361308934"] = {
            key = "17506649424361308934",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1686, y = 278},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80200324,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_200401b",
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
                  TalkActorId = 790053,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790008,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790053},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790008}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17506649600931309431"] = {
            key = "17506649600931309431",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1960.75, y = 279.125},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80200344,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_200401c",
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
                  TalkActorId = 790053,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790008,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790053},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790008}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17528091064516096311"] = {
            key = "17528091064516096311",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1105.4444444444443, y = 96.11111111111111},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17528091064516096312"] = {
            key = "17528091064516096312",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1110.5555555555557, y = 343.88888888888886},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104106,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
