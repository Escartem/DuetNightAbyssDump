return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1732783210620497461",
      startPort = "StoryStart",
      endStory = "1732783210620497463",
      endPort = "In"
    },
    {
      startStory = "1732783210620497463",
      startPort = "Success",
      endStory = "1732783210620497462",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1732783210620497461"] = {
      isStoryNode = true,
      key = "1732783210620497461",
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
    ["1732783210620497462"] = {
      isStoryNode = true,
      key = "1732783210620497462",
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
    ["1732783210620497463"] = {
      isStoryNode = true,
      key = "1732783210620497463",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1102.888888888889, y = 286.3015873015873},
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
            startQuest = "1732783210620497467",
            startPort = "Out",
            endQuest = "1725259866861207360",
            endPort = "In"
          },
          {
            startQuest = "1725259866861207360",
            startPort = "Out",
            endQuest = "1732783210620497465",
            endPort = "Success"
          },
          {
            startQuest = "1732783210620497464",
            startPort = "QuestStart",
            endQuest = "17528198192148988710",
            endPort = "In"
          },
          {
            startQuest = "1732783210620497464",
            startPort = "QuestStart",
            endQuest = "17528198192148988711",
            endPort = "In"
          },
          {
            startQuest = "17528198192148988710",
            startPort = "Out",
            endQuest = "17376303437545979176",
            endPort = "In"
          },
          {
            startQuest = "17528198192148988711",
            startPort = "Out",
            endQuest = "1732783210620497467",
            endPort = "In"
          },
          {
            startQuest = "17528198192148988711",
            startPort = "Out",
            endQuest = "1725259862283207188",
            endPort = "In"
          }
        },
        nodeData = {
          ["1725259862283207188"] = {
            key = "1725259862283207188",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1080.0019704433503, y = 440.10837438423675},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["1725259866861207360"] = {
            key = "1725259866861207360",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1357.0305418719215, y = 276.27980295566533},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 1,
              SoundType = 0
            }
          },
          ["1732783210620497464"] = {
            key = "1732783210620497464",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 518, y = 295.09565217391304},
            propsData = {ModeType = 0}
          },
          ["1732783210620497465"] = {
            key = "1732783210620497465",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1646.8642857142859, y = 277.2285714285714},
            propsData = {ModeType = 0}
          },
          ["1732783210620497466"] = {
            key = "1732783210620497466",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1572.0000000000002, y = 434.5},
            propsData = {}
          },
          ["1732783210620497467"] = {
            key = "1732783210620497467",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1082.9599878382487, y = 275.07230330056404},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80070301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_430103",
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
                  TalkActorId = 790014,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790013,
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
          ["17376303437545979176"] = {
            key = "17376303437545979176",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1081.5478260869563, y = 136.7347826086956},
            propsData = {
              ModeType = 1,
              Id = 101104,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17528198192148988710"] = {
            key = "17528198192148988710",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 802.0831406499318, y = 169.74295918714677},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17528198192148988711"] = {
            key = "17528198192148988711",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 803.1176234085524, y = 365.2602005664573},
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
