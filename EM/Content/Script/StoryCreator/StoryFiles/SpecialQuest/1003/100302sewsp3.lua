return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1732783210910571729",
      startPort = "StoryStart",
      endStory = "1732783210910571731",
      endPort = "In"
    },
    {
      startStory = "1732783210910571731",
      startPort = "Success",
      endStory = "1732783210910571730",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["1732783210910571729"] = {
      isStoryNode = true,
      key = "1732783210910571729",
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
    ["1732783210910571730"] = {
      isStoryNode = true,
      key = "1732783210910571730",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1766.4999999999998, y = 303},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1732783210910571731"] = {
      isStoryNode = true,
      key = "1732783210910571731",
      type = "StoryNode",
      name = "\228\184\139\230\176\180\233\129\147boss",
      pos = {x = 1273.7133200133198, y = 281.8240426240422},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10030209",
        QuestDeatil = "QuestDesc_10030209",
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
            startQuest = "17308902087824166012",
            startPort = "Out",
            endQuest = "17308903482564168437",
            endPort = "In"
          },
          {
            startQuest = "17308903482564168437",
            startPort = "Out",
            endQuest = "17308903579024168935",
            endPort = "In"
          },
          {
            startQuest = "17308903579024168935",
            startPort = "Out",
            endQuest = "17308903720954169649",
            endPort = "In"
          },
          {
            startQuest = "17308903720954169649",
            startPort = "Out",
            endQuest = "17308903775164170013",
            endPort = "In"
          },
          {
            startQuest = "17308903775164170013",
            startPort = "Out",
            endQuest = "17308904867064172351",
            endPort = "In"
          },
          {
            startQuest = "17308904867064172351",
            startPort = "Out",
            endQuest = "17308904980594172707",
            endPort = "In"
          },
          {
            startQuest = "17308904980594172707",
            startPort = "Out",
            endQuest = "17358863503323200",
            endPort = "In"
          },
          {
            startQuest = "17358863503323200",
            startPort = "Out",
            endQuest = "17358863549883498",
            endPort = "In"
          },
          {
            startQuest = "1732783210910571732",
            startPort = "QuestStart",
            endQuest = "17401223494776958",
            endPort = "In"
          },
          {
            startQuest = "1732783210910571736",
            startPort = "Out",
            endQuest = "17418570819691558755",
            endPort = "In"
          },
          {
            startQuest = "17418570819691558755",
            startPort = "Out",
            endQuest = "1732783210910571734",
            endPort = "Fail"
          },
          {
            startQuest = "17401223999679220",
            startPort = "Out",
            endQuest = "17428831955541046971",
            endPort = "In"
          },
          {
            startQuest = "17428831955541046971",
            startPort = "Out",
            endQuest = "17308902904724166983",
            endPort = "In"
          },
          {
            startQuest = "1732783210910571732",
            startPort = "QuestStart",
            endQuest = "1732783210910571736",
            endPort = "In"
          },
          {
            startQuest = "17401223999679220",
            startPort = "Out",
            endQuest = "17308902087824166012",
            endPort = "In"
          },
          {
            startQuest = "17401223999679220",
            startPort = "Out",
            endQuest = "17485146243129308614",
            endPort = "In"
          },
          {
            startQuest = "17401223494776958",
            startPort = "Out",
            endQuest = "17485210385975016",
            endPort = "In"
          },
          {
            startQuest = "17485210385975016",
            startPort = "Out",
            endQuest = "17401223999679220",
            endPort = "In"
          },
          {
            startQuest = "17308902904724166983",
            startPort = "Out",
            endQuest = "1748521099473586818",
            endPort = "In"
          },
          {
            startQuest = "1748521099473586818",
            startPort = "Out",
            endQuest = "17401222698385862",
            endPort = "In"
          },
          {
            startQuest = "17401222698385862",
            startPort = "Out",
            endQuest = "1749197726996757",
            endPort = "In"
          },
          {
            startQuest = "1749197726996757",
            startPort = "Out",
            endQuest = "1732783210910571735",
            endPort = "In"
          }
        },
        nodeData = {
          ["17308902087824166012"] = {
            key = "17308902087824166012",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -2153.4585197052656, y = 30.713247639874567},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033312,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17308902904724166983"] = {
            key = "17308902904724166983",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = -1394.6585197052655, y = 266.846580973208},
            propsData = {
              SendMessage = "",
              FinishCondition = "cp2sew2bossfinish"
            }
          },
          ["17308903482564168437"] = {
            key = "17308903482564168437",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -1849.6156625624096, y = 38.04658097320814},
            propsData = {WaitTime = 7}
          },
          ["17308903579024168935"] = {
            key = "17308903579024168935",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -1508.8544462245668, y = 24.7132476398747},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033315,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17308903720954169649"] = {
            key = "17308903720954169649",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -1186.266350986473, y = 35.37991430654137},
            propsData = {WaitTime = 7}
          },
          ["17308903775164170013"] = {
            key = "17308903775164170013",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -832.9524094842183, y = 11.379914306541423},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033319,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17308904867064172351"] = {
            key = "17308904867064172351",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -515.9250285318383, y = 21.226068152695433},
            propsData = {WaitTime = 7}
          },
          ["17308904980594172707"] = {
            key = "17308904980594172707",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = -192.06805778071077, y = 1.2260681526954111},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033323,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1732783210910571732"] = {
            key = "1732783210910571732",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -2944.4655843674846, y = 304.2587136722017},
            propsData = {ModeType = 0}
          },
          ["1732783210910571733"] = {
            key = "1732783210910571733",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 394.0226740683004, y = 278.305339872731},
            propsData = {ModeType = 0}
          },
          ["1732783210910571734"] = {
            key = "1732783210910571734",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -745.7473337740754, y = 972.0666065629039},
            propsData = {}
          },
          ["1732783210910571735"] = {
            key = "1732783210910571735",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = -216.76246230549503, y = 278.13582351600894},
            propsData = {}
          },
          ["1732783210910571736"] = {
            key = "1732783210910571736",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = -2284.559500355164, y = 910.1605216249175},
            propsData = {}
          },
          ["1732783210910571738"] = {
            key = "1732783210910571738",
            type = "WaitingMechanismEnterStateNode",
            name = "\231\173\137\229\190\133\230\156\186\229\133\179\232\191\155\229\133\165\231\138\182\230\128\129",
            pos = {x = -1463.3176470588246, y = -343.3627450980389},
            propsData = {
              CreateType = 0,
              CreateId = 0,
              StateId = 0,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["1732783210910571739"] = {
            key = "1732783210910571739",
            type = "SwitchMechanismStateNode",
            name = "\229\136\135\230\141\162\230\156\186\229\133\179\231\138\182\230\128\129",
            pos = {x = -1135.1607843137263, y = -335.44117647058795},
            propsData = {
              StaticCreatorIdList = {0},
              ManualItemIdList = {0},
              StateId = 0,
              QuestId = 0
            }
          },
          ["1732783210910571741"] = {
            key = "1732783210910571741",
            type = "PlayerCameraSightNode",
            name = "\232\167\134\231\186\191\229\136\164\230\150\173",
            pos = {x = -2114.9675792731528, y = -147.12822657218777},
            propsData = {
              TargetPointName = "",
              KeepSightTime = 0,
              ECameraAxisLockType = "None",
              Speed = 1
            }
          },
          ["17358863503323200"] = {
            key = "17358863503323200",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 206.4990241956181, y = 15.999999999999897},
            propsData = {WaitTime = 7}
          },
          ["17358863549883498"] = {
            key = "17358863549883498",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 587.8461538461526, y = 6.76923076923061},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10033325,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17401222698385862"] = {
            key = "17401222698385862",
            type = "TalkNode",
            name = "\232\191\135\229\156\186",
            pos = {x = -1017.9999999999991, y = 269.9999999999999},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0103/OBT0103_SC003/SQ_OBT0103_SC003",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["17401223494776958"] = {
            key = "17401223494776958",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -2438, y = 248.39999999999952},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "cp2sew2bossstart",
              UnitId = -1
            }
          },
          ["17401223999679220"] = {
            key = "17401223999679220",
            type = "TalkNode",
            name = "\232\191\135\229\156\186",
            pos = {x = -2052.3999999999996, y = 249.59999999999997},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0103/OBT0103_SC002/SQ_OBT0103_SC002_A",
              BlendInTime = 0,
              BlendOutTime = 0,
              InType = "FadeIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              ShowSkipButton = true,
              ShowReviewButton = true,
              ShowWikiButton = true,
              PauseGameGlobal = true,
              HideNpcs = false,
              HideMonsters = true,
              HideAllBattleEntity = true,
              HideEffectCreature = true,
              DisableNpcOptimization = false,
              DoNotReceiveCharacterShadow = false,
              BeginNewTargetPointName = "",
              EndNewTargetPointName = "",
              CameraLookAtTartgetPoint = "",
              RestoreStand = false,
              TalkActors = {
                {
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0}
              },
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              OverrideFailBlend = false
            }
          },
          ["17418570819691558755"] = {
            key = "17418570819691558755",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -1519.4285714285713, y = 969.7142857142856},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "100302sewsp3restart",
              UnitId = -1
            }
          },
          ["17428831955541046971"] = {
            key = "17428831955541046971",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = -1712, y = 264},
            propsData = {
              NewDescription = "QuestName_100302sp301",
              NewDetail = "QuestDesc_100302sp301",
              SubTaskTargetIndex = 0
            }
          },
          ["17485146243129308614"] = {
            key = "17485146243129308614",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = -1713.337662337662, y = 424.0000000000001},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt02/0060_boss_ex01_lizhanzhe_loop",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101701},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["17485210385975016"] = {
            key = "17485210385975016",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = -2232.8571428571427, y = 494.2857142857146},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt03/0074_story_encounter_with_blues",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101701},
              ClientRelatedRegionId = {},
              bStoreToServer = false
            }
          },
          ["1748521099473586818"] = {
            key = "1748521099473586818",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = -1026.6688311688315, y = 447.1428571428572},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/mute",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {101701},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["1749197726996757"] = {
            key = "1749197726996757",
            type = "CommonBlackFadeInOutNode",
            name = "\233\128\154\231\148\168\233\187\145\229\177\143\230\183\161\229\133\165\230\183\161\229\135\186\232\138\130\231\130\185",
            pos = {x = -686, y = 270},
            propsData = {FadeTime = 0, FadeType = "FadeIn"}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
