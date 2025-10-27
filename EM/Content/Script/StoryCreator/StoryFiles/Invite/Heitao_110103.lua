return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630101526341476",
      startPort = "StoryStart",
      endStory = "1721630101526341478",
      endPort = "In"
    },
    {
      startStory = "1721630101526341478",
      startPort = "Success",
      endStory = "1721630101526341477",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630101526341476"] = {
      isStoryNode = true,
      key = "1721630101526341476",
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
    ["1721630101526341477"] = {
      isStoryNode = true,
      key = "1721630101526341477",
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
    ["1721630101526341478"] = {
      isStoryNode = true,
      key = "1721630101526341478",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1102.888888888889, y = 288.44444444444446},
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
            startQuest = "1721630101526341482",
            startPort = "Out",
            endQuest = "17209304064722577",
            endPort = "In"
          },
          {
            startQuest = "17209304064722577",
            startPort = "Out",
            endQuest = "1725258873412198285",
            endPort = "In"
          },
          {
            startQuest = "1725258873412198285",
            startPort = "Out",
            endQuest = "1721630101526341480",
            endPort = "Success"
          },
          {
            startQuest = "1721630101526341479",
            startPort = "QuestStart",
            endQuest = "1752808772170643120",
            endPort = "In"
          },
          {
            startQuest = "1752808772170643120",
            startPort = "Out",
            endQuest = "17376226805315977954",
            endPort = "In"
          },
          {
            startQuest = "1721630101526341479",
            startPort = "QuestStart",
            endQuest = "1752808772170643121",
            endPort = "In"
          },
          {
            startQuest = "1752808772170643121",
            startPort = "Out",
            endQuest = "1721630101526341482",
            endPort = "In"
          }
        },
        nodeData = {
          ["17209304064722577"] = {
            key = "17209304064722577",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1251.7350427350432, y = 283.95726495726507},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80040314,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_11010302",
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
          ["1721630101526341479"] = {
            key = "1721630101526341479",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 404.66819221967967, y = 145.27100359594638},
            propsData = {ModeType = 0}
          },
          ["1721630101526341480"] = {
            key = "1721630101526341480",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1747.6071428571431, y = 275.9206349206349},
            propsData = {ModeType = 0}
          },
          ["1721630101526341481"] = {
            key = "1721630101526341481",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1688.0000000000002, y = 770.5},
            propsData = {}
          },
          ["1721630101526341482"] = {
            key = "1721630101526341482",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 959.3599878382488, y = 282.6278588561196},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80040301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_11010301",
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
          ["1725258853360197968"] = {
            key = "1725258853360197968",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 956.6305418719217, y = 441.5369458128082},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/0026_maintheme_website",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["1725258873412198285"] = {
            key = "1725258873412198285",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1500.9162561576359, y = 275.8226600985225},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 1,
              SoundType = 0
            }
          },
          ["17376226805315977954"] = {
            key = "17376226805315977954",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1004.3707093821511, y = 44.032036613272325},
            propsData = {
              ModeType = 1,
              Id = 100101,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1752808772170643120"] = {
            key = "1752808772170643120",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 687.9707602339181, y = 43.90058479532169},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["1752808772170643121"] = {
            key = "1752808772170643121",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 690.6608187134502, y = 290.0994152046784},
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
