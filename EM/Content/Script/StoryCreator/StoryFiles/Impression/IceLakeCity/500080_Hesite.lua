return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1744974240131817021",
      startPort = "StoryStart",
      endStory = "1744974243188817100",
      endPort = "In"
    },
    {
      startStory = "1744974243188817100",
      startPort = "Success",
      endStory = "1744974240131817024",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1744974240131817021"] = {
      isStoryNode = true,
      key = "1744974240131817021",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 1246, y = 446},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1744974240131817024"] = {
      isStoryNode = true,
      key = "1744974240131817024",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2038, y = 472},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1744974243188817100"] = {
      isStoryNode = true,
      key = "1744974243188817100",
      type = "StoryNode",
      name = "\229\141\176\232\177\161\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1604, y = 426},
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
            startQuest = "1744974256747817626",
            startPort = "Fail",
            endQuest = "1744974243188817107",
            endPort = "Fail"
          },
          {
            startQuest = "1744974256747817626",
            startPort = "Out",
            endQuest = "17452218175945962874",
            endPort = "In"
          },
          {
            startQuest = "17452218175945962874",
            startPort = "Out",
            endQuest = "1744974243188817104",
            endPort = "Success"
          },
          {
            startQuest = "1744974243188817101",
            startPort = "QuestStart",
            endQuest = "17452218305035963294",
            endPort = "In"
          },
          {
            startQuest = "17452218305035963294",
            startPort = "false",
            endQuest = "1744974256747817626",
            endPort = "In"
          },
          {
            startQuest = "17452218305035963294",
            startPort = "true",
            endQuest = "17452218629535963797",
            endPort = "In"
          },
          {
            startQuest = "17452218629535963797",
            startPort = "Out",
            endQuest = "1744974243188817104",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1744974243188817101"] = {
            key = "1744974243188817101",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 857.3684210526317, y = 432.31578947368416},
            propsData = {ModeType = 0}
          },
          ["1744974243188817104"] = {
            key = "1744974243188817104",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2234, y = 312},
            propsData = {ModeType = 0}
          },
          ["1744974243188817107"] = {
            key = "1744974243188817107",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2066.9473684210525, y = 618.6315789473684},
            propsData = {}
          },
          ["1744974256747817626"] = {
            key = "1744974256747817626",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1521.578947368421, y = 420.42105263157896},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51009301,
              FlowAssetPath = "",
              TalkType = "Impression",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "BlendOut",
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
              TalkActors = {},
              RemoveTalkActors = {},
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "Player",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17452218175945962874"] = {
            key = "17452218175945962874",
            type = "SetVarNode",
            name = "\232\174\190\231\189\174\229\143\152\233\135\143\229\128\188",
            pos = {x = 1811.0526315789473, y = 419.2631578947368},
            propsData = {
              VarName = "Hesite500080",
              VarValue = 1
            }
          },
          ["17452218305035963294"] = {
            key = "17452218305035963294",
            type = "ExecuteBlueprintFunctionCheckVarNode",
            name = "\230\137\167\232\161\140\229\143\152\233\135\143\230\163\128\230\181\139\229\135\189\230\149\176",
            pos = {x = 1198.421052631579, y = 400.31578947368416},
            propsData = {
              FunctionName = "Equal",
              VarName = "Hesite500080",
              Duration = 0,
              VarInfos = {
                {VarName = "Value", VarValue = "1"}
              }
            }
          },
          ["17452218629535963797"] = {
            key = "17452218629535963797",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 1533.1578947368419, y = 234.5263157894737},
            propsData = {
              IsNpcNode = false,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 51009377,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "BlendIn",
              OutType = "BlendOut",
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
              TalkActors = {},
              RemoveTalkActors = {},
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
