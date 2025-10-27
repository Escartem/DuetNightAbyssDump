return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1732783210618497244",
      startPort = "StoryStart",
      endStory = "1732783210618497246",
      endPort = "In"
    },
    {
      startStory = "1732783210618497246",
      startPort = "Success",
      endStory = "1732783210618497245",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1732783210618497244"] = {
      isStoryNode = true,
      key = "1732783210618497244",
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
    ["1732783210618497245"] = {
      isStoryNode = true,
      key = "1732783210618497245",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1435.111111111111, y = 298.44444444444446},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783210618497246"] = {
      isStoryNode = true,
      key = "1732783210618497246",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1102.888888888889, y = 287.015873015873},
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
            startQuest = "1732783210618497251",
            startPort = "Out",
            endQuest = "1732783210618497252",
            endPort = "In"
          },
          {
            startQuest = "1732783210618497252",
            startPort = "Out",
            endQuest = "1732783210618497247",
            endPort = "In"
          },
          {
            startQuest = "1732783210618497247",
            startPort = "Out",
            endQuest = "1725259487689205407",
            endPort = "In"
          },
          {
            startQuest = "1725259487689205407",
            startPort = "Out",
            endQuest = "1732783210618497249",
            endPort = "Success"
          },
          {
            startQuest = "1732783210618497248",
            startPort = "QuestStart",
            endQuest = "17528195305987062385",
            endPort = "In"
          },
          {
            startQuest = "17528195305987062385",
            startPort = "Out",
            endQuest = "17376302675843737566",
            endPort = "In"
          },
          {
            startQuest = "1732783210618497248",
            startPort = "QuestStart",
            endQuest = "17528195341177062429",
            endPort = "In"
          },
          {
            startQuest = "17528195341177062429",
            startPort = "Out",
            endQuest = "1732783210618497251",
            endPort = "In"
          },
          {
            startQuest = "17528195341177062429",
            startPort = "Out",
            endQuest = "1725259468464205017",
            endPort = "In"
          }
        },
        nodeData = {
          ["1725259468464205017"] = {
            key = "1725259468464205017",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 605.1157635467983, y = 438.2364532019708},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt02/0043_story_empire",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["1725259487689205407"] = {
            key = "1725259487689205407",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1318.7733990147788, y = 283.67980295566537},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 1,
              SoundType = 0
            }
          },
          ["1732783210618497247"] = {
            key = "1732783210618497247",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1081.240654882644, y = 272.94124891335855},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80070128,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_43010101",
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
                  TalkActorId = 790013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790014,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790013},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790014}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1732783210618497248"] = {
            key = "1732783210618497248",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 34.2586206896552, y = 243.23973727422},
            propsData = {ModeType = 0}
          },
          ["1732783210618497249"] = {
            key = "1732783210618497249",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1605.0209359605915, y = 279.83689107827036},
            propsData = {ModeType = 0}
          },
          ["1732783210618497250"] = {
            key = "1732783210618497250",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1604.984126984127, y = 441.4523809523809},
            propsData = {}
          },
          ["1732783210618497251"] = {
            key = "1732783210618497251",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 596.7340984020144, y = 272.1007169648804},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80070101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_43010101",
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
                  TalkActorId = 790013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790014,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790013},
                {TalkActorType = "Npc", TalkActorId = 790014}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1732783210618497252"] = {
            key = "1732783210618497252",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 839.461426391954, y = 271.50570282771093},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80070116,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_43010102",
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
                  TalkActorId = 790016,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790015,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790013,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790015},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790016},
                {TalkActorType = "Npc", TalkActorId = 790013}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17376302675843737566"] = {
            key = "17376302675843737566",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 604.5329153605014, y = 94.91536050156735},
            propsData = {
              ModeType = 1,
              Id = 101104,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17528195305987062385"] = {
            key = "17528195305987062385",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 323.33559536021454, y = 75.99274047186918},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17528195341177062429"] = {
            key = "17528195341177062429",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 324.3700781188352, y = 271.5099818511797},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101104,
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
