return {
  storyName = "\231\144\179\230\129\169\231\156\139\230\157\191\229\168\152",
  storyDescription = "",
  lineData = {
    {
      startStory = "17141991239623246304",
      startPort = "StoryStart",
      endStory = "17141991239633246306",
      endPort = "In"
    },
    {
      startStory = "17141991239633246306",
      startPort = "Success",
      endStory = "17141991239633246305",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17141991239623246304"] = {
      isStoryNode = true,
      key = "17141991239623246304",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 204.44444444444446, y = 121.11111111111111},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991239633246305"] = {
      isStoryNode = true,
      key = "17141991239633246305",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 712.7434484063724, y = 123.14870709394418},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["17141991239633246306"] = {
      isStoryNode = true,
      key = "17141991239633246306",
      type = "StoryNode",
      name = "\229\165\165\231\137\185\232\181\155\229\190\183\231\156\139\230\157\191\229\168\152",
      pos = {x = 459.42082861958863, y = 106.98909265171791},
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
        bIsNotifyGameMode = false,
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
            startQuest = "17141991239633246309",
            startPort = "QuestStart",
            endQuest = "17141991239633246307",
            endPort = "In"
          },
          {
            startQuest = "17141991239633246307",
            startPort = "Out",
            endQuest = "17141991239633246312",
            endPort = "In"
          },
          {
            startQuest = "17141991239633246308",
            startPort = "Out",
            endQuest = "17141991239633246310",
            endPort = "Success"
          },
          {
            startQuest = "17141991239633246312",
            startPort = "Out",
            endQuest = "17141991239633246308",
            endPort = "In"
          }
        },
        nodeData = {
          ["17141991239633246307"] = {
            key = "17141991239633246307",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 67.08048099364657, y = 130.6975057409552},
            propsData = {
              NpcInfos = {
                {NpcId = 85102, NpcPose = "Idle"}
              }
            }
          },
          ["17141991239633246308"] = {
            key = "17141991239633246308",
            type = "SetNpcPoseNode",
            name = "\232\174\190\231\189\174Npc\229\167\191\230\128\129",
            pos = {x = 690.9826936834094, y = 128.48942917049703},
            propsData = {
              NpcInfos = {
                {NpcId = 85102, NpcPose = "Seating"}
              }
            }
          },
          ["17141991239633246309"] = {
            key = "17141991239633246309",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -187.38046131775178, y = 129.06707889209355},
            propsData = {ModeType = 0}
          },
          ["17141991239633246310"] = {
            key = "17141991239633246310",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1028.8235294117646, y = 134.7058823529412},
            propsData = {ModeType = 0}
          },
          ["17141991239633246311"] = {
            key = "17141991239633246311",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1028.8235294117646, y = 306.47058823529414},
            propsData = {}
          },
          ["17141991239633246312"] = {
            key = "17141991239633246312",
            type = "TalkNode",
            name = "90130001",
            pos = {x = 371.8143575432278, y = 126.20682806079849},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 90160001,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 1,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "BlendOut",
              BlendEaseExp = 2,
              UseProceduralCamera = true,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              ShowSkipButton = false,
              ShowAutoPlayButton = false,
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
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 85102,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 85102}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
