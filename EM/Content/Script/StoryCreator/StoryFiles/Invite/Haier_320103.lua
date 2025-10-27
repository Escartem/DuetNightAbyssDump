return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17503210747521275115",
      startPort = "StoryStart",
      endStory = "17503210771921275162",
      endPort = "In"
    },
    {
      startStory = "17503210771921275162",
      startPort = "Success",
      endStory = "17503210747521275118",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17503210747521275115"] = {
      isStoryNode = true,
      key = "17503210747521275115",
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
    ["17503210747521275118"] = {
      isStoryNode = true,
      key = "17503210747521275118",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1604, y = 302},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17503210771921275162"] = {
      isStoryNode = true,
      key = "17503210771921275162",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1208, y = 294},
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
            startQuest = "17503210771921275167",
            startPort = "QuestStart",
            endQuest = "17503210771921275170",
            endPort = "In"
          },
          {
            startQuest = "17503210771921275170",
            startPort = "Out",
            endQuest = "1752050024188448",
            endPort = "In"
          },
          {
            startQuest = "1752050024188448",
            startPort = "Out",
            endQuest = "1752050026115490",
            endPort = "In"
          },
          {
            startQuest = "17503210771921275167",
            startPort = "QuestStart",
            endQuest = "176008100733412439287",
            endPort = "In"
          },
          {
            startQuest = "1752050026115490",
            startPort = "Out",
            endQuest = "176008103406612439826",
            endPort = "In"
          },
          {
            startQuest = "176008103406612439826",
            startPort = "Out",
            endQuest = "17503210771921275168",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17503210771921275167"] = {
            key = "17503210771921275167",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 353.3374384236454, y = 288.5451559934318},
            propsData = {ModeType = 0}
          },
          ["17503210771921275168"] = {
            key = "17503210771921275168",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1802.9899911502348, y = 297.73968462812275},
            propsData = {ModeType = 0}
          },
          ["17503210771921275169"] = {
            key = "17503210771921275169",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1034.3663663663665, y = 492.78828828828824},
            propsData = {}
          },
          ["17503210771921275170"] = {
            key = "17503210771921275170",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 687.4016424751705, y = 279.74522536287265},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80160301,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_Invite",
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
                  TalkActorId = 93201,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 93201},
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
          ["1752050024188448"] = {
            key = "1752050024188448",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 965.25, y = 279.25000000000006},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80160345,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = false,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {},
              RemoveTalkActors = {},
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["1752050026115490"] = {
            key = "1752050026115490",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1244, y = 278.00000000000006},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80160349,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_Invite",
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
                  TalkActorId = 93201,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 93201},
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
          ["176008100733412439287"] = {
            key = "176008100733412439287",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 725.3333333333333, y = 127.79131652661059},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt01/0018_scene_iceground",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["176008103406612439826"] = {
            key = "176008103406612439826",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1526.5833333333335, y = 294.0413165266106},
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
