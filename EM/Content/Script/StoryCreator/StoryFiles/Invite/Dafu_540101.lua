return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17485895644492377835",
      startPort = "StoryStart",
      endStory = "17485895692412378020",
      endPort = "In"
    },
    {
      startStory = "17485895692412378020",
      startPort = "Success",
      endStory = "17485895644492377838",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17485895644492377835"] = {
      isStoryNode = true,
      key = "17485895644492377835",
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
    ["17485895644492377838"] = {
      isStoryNode = true,
      key = "17485895644492377838",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1668, y = 308},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17485895692412378020"] = {
      isStoryNode = true,
      key = "17485895692412378020",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1236, y = 290},
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
            startQuest = "17485895692412378021",
            startPort = "QuestStart",
            endQuest = "17528091580996737669",
            endPort = "In"
          },
          {
            startQuest = "17528091580996737669",
            startPort = "Out",
            endQuest = "1750407801048324213",
            endPort = "In"
          },
          {
            startQuest = "17485895692412378021",
            startPort = "QuestStart",
            endQuest = "17528091580996737670",
            endPort = "In"
          },
          {
            startQuest = "17528091580996737670",
            startPort = "Out",
            endQuest = "1750407826687324597",
            endPort = "In"
          },
          {
            startQuest = "17528091580996737670",
            startPort = "Out",
            endQuest = "17600798070921869320",
            endPort = "In"
          },
          {
            startQuest = "1750407826687324597",
            startPort = "Out",
            endQuest = "17600798369941869768",
            endPort = "In"
          },
          {
            startQuest = "17600798369941869768",
            startPort = "Out",
            endQuest = "17485895692412378024",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17485895692412378021"] = {
            key = "17485895692412378021",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17485895692412378024"] = {
            key = "17485895692412378024",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2220, y = 306},
            propsData = {ModeType = 0}
          },
          ["17485895692412378027"] = {
            key = "17485895692412378027",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2092, y = 528},
            propsData = {}
          },
          ["1750407801048324213"] = {
            key = "1750407801048324213",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1607.0588235294117, y = 127.29411764705881},
            propsData = {
              ModeType = 1,
              Id = 101110,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1750407826687324597"] = {
            key = "1750407826687324597",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1554, y = 308},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80180101,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_540101",
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
                  TalkActorId = 790045,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790059,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790045},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790059}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17528091580996737669"] = {
            key = "17528091580996737669",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1189.3341503267973, y = 116.34640522875816},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17528091580996737670"] = {
            key = "17528091580996737670",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1194.4452614379086, y = 364.1241830065359},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 101110,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17600798070921869320"] = {
            key = "17600798070921869320",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1556, y = 494.0000000000001},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/0036_story_renweidaozu",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["17600798369941869768"] = {
            key = "17600798369941869768",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1876, y = 312},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 1,
              SoundType = 0
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
