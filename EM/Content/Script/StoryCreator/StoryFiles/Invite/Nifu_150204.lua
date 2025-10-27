return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17497082058151238881",
      startPort = "StoryStart",
      endStory = "17497082095911238931",
      endPort = "In"
    },
    {
      startStory = "17497082095911238931",
      startPort = "Success",
      endStory = "17497082058151238884",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17497082058151238881"] = {
      isStoryNode = true,
      key = "17497082058151238881",
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
    ["17497082058151238884"] = {
      isStoryNode = true,
      key = "17497082058151238884",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1612, y = 294},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17497082095911238931"] = {
      isStoryNode = true,
      key = "17497082095911238931",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1204, y = 290.00000000000006},
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
            startQuest = "17497082095921238936",
            startPort = "QuestStart",
            endQuest = "17497082095921238939",
            endPort = "In"
          },
          {
            startQuest = "17497082095921238936",
            startPort = "QuestStart",
            endQuest = "176008137938317415608",
            endPort = "In"
          },
          {
            startQuest = "17497082095921238939",
            startPort = "Out",
            endQuest = "176008138926217415924",
            endPort = "In"
          },
          {
            startQuest = "176008138926217415924",
            startPort = "Out",
            endQuest = "17497082095921238937",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17497082095921238936"] = {
            key = "17497082095921238936",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 353.3374384236454, y = 288.5451559934318},
            propsData = {ModeType = 0}
          },
          ["17497082095921238937"] = {
            key = "17497082095921238937",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1327.7352216748773, y = 292.1226053639847},
            propsData = {ModeType = 0}
          },
          ["17497082095921238938"] = {
            key = "17497082095921238938",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1553.5555555555557, y = 437.16666666666663},
            propsData = {}
          },
          ["17497082095921238939"] = {
            key = "17497082095921238939",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 681.7987012987002, y = 277.98051948051966},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 80170401,
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
                  TalkActorId = 91502,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 91502},
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
          ["176008137938317415608"] = {
            key = "176008137938317415608",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 684, y = 436},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 1,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0071_lise_secret",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {}
            }
          },
          ["176008138926217415924"] = {
            key = "176008138926217415924",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1010, y = 291.99999999999994},
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
