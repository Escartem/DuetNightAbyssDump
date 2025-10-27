return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17173985565071",
      startPort = "StoryStart",
      endStory = "1717398953280124605",
      endPort = "In"
    },
    {
      startStory = "1717398953280124605",
      startPort = "Success",
      endStory = "17173985565075",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17173985565071"] = {
      isStoryNode = true,
      key = "17173985565071",
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
    ["17173985565075"] = {
      isStoryNode = true,
      key = "17173985565075",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1782, y = 278},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1717398953280124605"] = {
      isStoryNode = true,
      key = "1717398953280124605",
      type = "StoryNode",
      name = "\229\138\168\230\128\129\228\186\139\228\187\182\231\139\172\231\171\139talk\232\138\130\231\130\185",
      pos = {x = 1338, y = 284},
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
            startQuest = "1717398953280124606",
            startPort = "QuestStart",
            endQuest = "1717399016962125819",
            endPort = "In"
          },
          {
            startQuest = "1717399016962125819",
            startPort = "Branch_1",
            endQuest = "1717399035434126024",
            endPort = "In"
          },
          {
            startQuest = "1717399035434126024",
            startPort = "Out",
            endQuest = "1717398953280124609",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1717398953280124606"] = {
            key = "1717398953280124606",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1717398953280124609"] = {
            key = "1717398953280124609",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["1717398953280124612"] = {
            key = "1717398953280124612",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2800, y = 700},
            propsData = {}
          },
          ["1717399016962125819"] = {
            key = "1717399016962125819",
            type = "BranchTriggerNode",
            name = "\232\167\166\229\143\145\229\136\134\230\148\175\232\138\130\231\130\185",
            pos = {x = 1128.3405572755416, y = 288.6563467492259},
            propsData = {
              Branches = {710005}
            }
          },
          ["1717399035434126024"] = {
            key = "1717399035434126024",
            type = "TalkNode",
            name = "\230\157\145\229\186\132\231\154\142\231\154\142\230\149\145\230\143\180\229\134\146\230\179\161",
            pos = {x = 1623.2631578947369, y = 251.09774436090225},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 71000502,
              FlowAssetPath = "",
              TalkType = "Bubble",
              BubblePlayType = "Once",
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              ShowSkipButton = true,
              ShowAutoPlayButton = true,
              ShowReviewButton = true,
              bBubblePlayCDEnable = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Npc",
                  TalkActorId = 800005,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Npc", TalkActorId = 800005}
              },
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
