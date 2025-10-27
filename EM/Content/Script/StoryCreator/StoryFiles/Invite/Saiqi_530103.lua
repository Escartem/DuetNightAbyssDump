return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630101556341963",
      startPort = "StoryStart",
      endStory = "1721630101556341965",
      endPort = "In"
    },
    {
      startStory = "1721630101556341965",
      startPort = "Success",
      endStory = "1721630101556341964",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1721630101556341963"] = {
      isStoryNode = true,
      key = "1721630101556341963",
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
    ["1721630101556341964"] = {
      isStoryNode = true,
      key = "1721630101556341964",
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
    ["1721630101556341965"] = {
      isStoryNode = true,
      key = "1721630101556341965",
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
            startQuest = "1721630101556341969",
            startPort = "Out",
            endQuest = "1725259056093201851",
            endPort = "In"
          },
          {
            startQuest = "1725259056093201851",
            startPort = "Out",
            endQuest = "1721630101556341967",
            endPort = "Success"
          },
          {
            startQuest = "1721630101556341966",
            startPort = "QuestStart",
            endQuest = "17528094827333848960",
            endPort = "In"
          },
          {
            startQuest = "17528094827333848960",
            startPort = "Out",
            endQuest = "17376298130442990109",
            endPort = "In"
          },
          {
            startQuest = "1721630101556341966",
            startPort = "QuestStart",
            endQuest = "17528094827333848961",
            endPort = "In"
          },
          {
            startQuest = "17528094827333848961",
            startPort = "Out",
            endQuest = "1721630101556341969",
            endPort = "In"
          },
          {
            startQuest = "17528094827333848961",
            startPort = "Out",
            endQuest = "1725259036826201498",
            endPort = "In"
          }
        },
        nodeData = {
          ["1721630101556341966"] = {
            key = "1721630101556341966",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 538.9189189189188, y = 296.7567567567567},
            propsData = {ModeType = 0}
          },
          ["1721630101556341967"] = {
            key = "1721630101556341967",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1643.6071428571431, y = 282.7142857142857},
            propsData = {ModeType = 0}
          },
          ["1721630101556341968"] = {
            key = "1721630101556341968",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1606.2857142857144, y = 438.7857142857143},
            propsData = {}
          },
          ["1721630101556341969"] = {
            key = "1721630101556341969",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1077.5952819558959, y = 287.07230330056404},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80080301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_530103",
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
                  TalkActorId = 790004,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 790005,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 790004},
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 790005}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1725259036826201498"] = {
            key = "1725259036826201498",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1078.059113300493, y = 448.6798029556653},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt02/0039_story_saiqi_see_flower",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["1725259056093201851"] = {
            key = "1725259056093201851",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1355.2019704433503, y = 282.9655172413796},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 1,
              SoundType = 0
            }
          },
          ["17376298130442990109"] = {
            key = "17376298130442990109",
            type = "SkipRegionNode",
            name = "\232\183\168\229\140\186\229\159\159\228\188\160\233\128\129\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174",
            pos = {x = 1085.9189189189187, y = 132.96314496314483},
            propsData = {
              ModeType = 1,
              Id = 101106,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["17528094827333848960"] = {
            key = "17528094827333848960",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 801.9616858237548, y = 115.62835249042143},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 210101,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17528094827333848961"] = {
            key = "17528094827333848961",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 796.0383141762453, y = 308.3716475095785},
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
