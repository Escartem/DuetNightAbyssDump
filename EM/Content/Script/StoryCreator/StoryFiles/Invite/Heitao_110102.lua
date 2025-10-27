return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630101518341332",
      startPort = "StoryStart",
      endStory = "1721630101518341334",
      endPort = "In"
    },
    {
      startStory = "1721630101518341334",
      startPort = "Success",
      endStory = "1721630101518341333",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630101518341332"] = {
      isStoryNode = true,
      key = "1721630101518341332",
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
    ["1721630101518341333"] = {
      isStoryNode = true,
      key = "1721630101518341333",
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
    ["1721630101518341334"] = {
      isStoryNode = true,
      key = "1721630101518341334",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1105.031746031746, y = 288.44444444444446},
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
            startQuest = "1721630101518341338",
            startPort = "Out",
            endQuest = "1725258685194196651",
            endPort = "In"
          },
          {
            startQuest = "1725258685194196651",
            startPort = "Out",
            endQuest = "1721630101518341336",
            endPort = "Success"
          },
          {
            startQuest = "1721630101518341335",
            startPort = "QuestStart",
            endQuest = "17528087283061474",
            endPort = "In"
          },
          {
            startQuest = "17528087283061474",
            startPort = "Out",
            endQuest = "17376226554635230691",
            endPort = "In"
          },
          {
            startQuest = "1721630101518341335",
            startPort = "QuestStart",
            endQuest = "17528087283061475",
            endPort = "In"
          },
          {
            startQuest = "17528087283061475",
            startPort = "Out",
            endQuest = "1721630101518341338",
            endPort = "In"
          },
          {
            startQuest = "17528087283061475",
            startPort = "Out",
            endQuest = "1725258573710195956",
            endPort = "In"
          }
        },
        nodeData = {
          ["1721630101518341335"] = {
            key = "1721630101518341335",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 441.6083916083916, y = 164.95004995004993},
            propsData = {ModeType = 0}
          },
          ["1721630101518341336"] = {
            key = "1721630101518341336",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1580.7500000000002, y = 277},
            propsData = {ModeType = 0}
          },
          ["1721630101518341337"] = {
            key = "1721630101518341337",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1572.0000000000002, y = 434.5},
            propsData = {}
          },
          ["1721630101518341338"] = {
            key = "1721630101518341338",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1005.7885592668201, y = 267.07230330056404},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80040201,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_110102",
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
                  TalkActorId = 790007,
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
                {TalkActorType = "Npc", TalkActorId = 790007},
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
          ["1725258573710195956"] = {
            key = "1725258573710195956",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 986.6305418719215, y = 427.251231527094},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/0016_judian",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["1725258685194196651"] = {
            key = "1725258685194196651",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1269.4876847290643, y = 274.39408866995115},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 1,
              SoundType = 0
            }
          },
          ["17376226554635230691"] = {
            key = "17376226554635230691",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1015.6293706293703, y = 28.811188811188877},
            propsData = {
              ModeType = 1,
              Id = 100101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17528087283061474"] = {
            key = "17528087283061474",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 721.7688591601636, y = 29.124489037532612},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17528087283061475"] = {
            key = "17528087283061475",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 722.8799702712747, y = 276.9022668153103},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 100101,
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
