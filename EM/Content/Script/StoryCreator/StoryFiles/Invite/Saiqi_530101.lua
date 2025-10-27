return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630101541341786",
      startPort = "StoryStart",
      endStory = "1721630101541341788",
      endPort = "In"
    },
    {
      startStory = "1721630101541341788",
      startPort = "Success",
      endStory = "1721630101541341787",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630101541341786"] = {
      isStoryNode = true,
      key = "1721630101541341786",
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
    ["1721630101541341787"] = {
      isStoryNode = true,
      key = "1721630101541341787",
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
    ["1721630101541341788"] = {
      isStoryNode = true,
      key = "1721630101541341788",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1101.5252525252527, y = 288.44444444444446},
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
            startQuest = "1721630101541341792",
            startPort = "Out",
            endQuest = "1725259218859203924",
            endPort = "In"
          },
          {
            startQuest = "1725259218859203924",
            startPort = "Out",
            endQuest = "1721630101541341790",
            endPort = "Success"
          },
          {
            startQuest = "1721630101541341789",
            startPort = "QuestStart",
            endQuest = "17528093812529303958",
            endPort = "In"
          },
          {
            startQuest = "17528093812529303958",
            startPort = "Out",
            endQuest = "1737629695367748437",
            endPort = "In"
          },
          {
            startQuest = "1721630101541341789",
            startPort = "QuestStart",
            endQuest = "17528093812529303959",
            endPort = "In"
          },
          {
            startQuest = "17528093812529303959",
            startPort = "Out",
            endQuest = "1721630101541341792",
            endPort = "In"
          },
          {
            startQuest = "17528093812529303959",
            startPort = "Out",
            endQuest = "1725259200699203740",
            endPort = "In"
          }
        },
        nodeData = {
          ["1721630101541341789"] = {
            key = "1721630101541341789",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 504.9655172413793, y = 302},
            propsData = {ModeType = 0}
          },
          ["1721630101541341790"] = {
            key = "1721630101541341790",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1636.464285714286, y = 279.85714285714283},
            propsData = {ModeType = 0}
          },
          ["1721630101541341791"] = {
            key = "1721630101541341791",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1572.0000000000002, y = 434.5},
            propsData = {}
          },
          ["1721630101541341792"] = {
            key = "1721630101541341792",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1079.3599878382488, y = 287.07230330056404},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80080101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_530101",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = true,
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
                  TalkActorId = 790001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790003,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790004,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790001},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790002},
                {TalkActorType = "Npc", TalkActorId = 790003},
                {TalkActorType = "Npc", TalkActorId = 790004}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1725259200699203740"] = {
            key = "1725259200699203740",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1082.3448275862074, y = 432.9655172413797},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt02/0044_story_first_meet_saiqi_loop",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["1725259218859203924"] = {
            key = "1725259218859203924",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1350.916256157636, y = 280.10837438423675},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 1,
              SoundType = 0
            }
          },
          ["1737629695367748437"] = {
            key = "1737629695367748437",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1080.7586206896551, y = 138.68965517241378},
            propsData = {
              ModeType = 1,
              Id = 101106,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17528093812529303958"] = {
            key = "17528093812529303958",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 799.4444444444443, y = 130.11111111111111},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17528093812529303959"] = {
            key = "17528093812529303959",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 808.8314176245211, y = 315.88888888888886},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101106,
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
