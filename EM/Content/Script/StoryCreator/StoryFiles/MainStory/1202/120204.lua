return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1742891256142717334",
      startPort = "Success",
      endStory = "1742891256142717335",
      endPort = "In"
    },
    {
      startStory = "1742891256142717335",
      startPort = "Success",
      endStory = "1742891256142717336",
      endPort = "In"
    },
    {
      startStory = "1742891256142717336",
      startPort = "Success",
      endStory = "1742891256142717337",
      endPort = "In"
    },
    {
      startStory = "1742891256142717337",
      startPort = "Success",
      endStory = "1742891256142717338",
      endPort = "In"
    },
    {
      startStory = "1742891256142717338",
      startPort = "Success",
      endStory = "1742891256142717339",
      endPort = "In"
    },
    {
      startStory = "1742891256142717339",
      startPort = "Success",
      endStory = "1742891256142717340",
      endPort = "In"
    },
    {
      startStory = "1742891256142717340",
      startPort = "Success",
      endStory = "1742891256142717341",
      endPort = "In"
    },
    {
      startStory = "1742891256142717341",
      startPort = "Success",
      endStory = "1742891256142717342",
      endPort = "In"
    },
    {
      startStory = "1742891256142717342",
      startPort = "Success",
      endStory = "1742891256142717343",
      endPort = "In"
    },
    {
      startStory = "1742891256142717343",
      startPort = "Success",
      endStory = "1742891256142717344",
      endPort = "In"
    },
    {
      startStory = "1742891256142717344",
      startPort = "Success",
      endStory = "1742891256142717345",
      endPort = "In"
    },
    {
      startStory = "1742891256142717345",
      startPort = "Success",
      endStory = "1742891256142717346",
      endPort = "In"
    },
    {
      startStory = "1742891256142717346",
      startPort = "Success",
      endStory = "1742891256142717347",
      endPort = "In"
    },
    {
      startStory = "1742891256142717350",
      startPort = "Success",
      endStory = "1742891256142717352",
      endPort = "StoryEnd"
    },
    {
      startStory = "1742891256142717351",
      startPort = "StoryStart",
      endStory = "1742891256142717353",
      endPort = "In"
    },
    {
      startStory = "1742891256142717353",
      startPort = "Success",
      endStory = "1742891256142717349",
      endPort = "In"
    },
    {
      startStory = "1742891256142717347",
      startPort = "Success",
      endStory = "1742891256142717348",
      endPort = "In"
    },
    {
      startStory = "1742891256142717349",
      startPort = "Success",
      endStory = "1742891256142717350",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1742891256142717334"] = {
      isStoryNode = true,
      key = "1742891256142717334",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\229\140\187\233\166\134",
      pos = {x = 1671.812206374556, y = 711.0847935029403},
      propsData = {
        QuestId = 12020401,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_1",
        QuestDeatil = "Content_120204_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
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
            startQuest = "1742891256142717355",
            startPort = "QuestStart",
            endQuest = "1742891256142717358",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717358",
            startPort = "Out",
            endQuest = "1742891256142717359",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717359",
            startPort = "Out",
            endQuest = "1742891256142717356",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256142717355"] = {
            key = "1742891256142717355",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256142717356"] = {
            key = "1742891256142717356",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2784.5257008798526, y = 423.78146067110936},
            propsData = {ModeType = 0}
          },
          ["1742891256142717357"] = {
            key = "1742891256142717357",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256142717358"] = {
            key = "1742891256142717358",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\140\187\233\166\134",
            pos = {x = 2245.3712392922844, y = 442.6881745519737},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930089,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020401"
            }
          },
          ["1742891256142717359"] = {
            key = "1742891256142717359",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\140\187\233\166\134",
            pos = {x = 2507.121239292284, y = 430.4738888376881},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717335"] = {
      isStoryNode = true,
      key = "1742891256142717335",
      type = "StoryNode",
      name = "\229\137\141\229\142\187\230\149\178\233\151\168",
      pos = {x = 1920.5363984674334, y = 709.8817258037648},
      propsData = {
        QuestId = 12020402,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_2",
        QuestDeatil = "Content_120204_2",
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
            startQuest = "1742891256142717360",
            startPort = "QuestStart",
            endQuest = "1742891256142717363",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717363",
            startPort = "Out",
            endQuest = "1742891256142717364",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717364",
            startPort = "Out",
            endQuest = "1742891256142717365",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717365",
            startPort = "Out",
            endQuest = "1742891256142717366",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717366",
            startPort = "Out",
            endQuest = "1742891256142717361",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256142717360"] = {
            key = "1742891256142717360",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256142717361"] = {
            key = "1742891256142717361",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3574.8705284660596, y = 424.81594342973005},
            propsData = {ModeType = 0}
          },
          ["1742891256142717362"] = {
            key = "1742891256142717362",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256142717363"] = {
            key = "1742891256142717363",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2218.2758620689665, y = 442.8319173746459},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12020402"
            }
          },
          ["1742891256142717364"] = {
            key = "1742891256142717364",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\149\178\233\151\168\231\130\185",
            pos = {x = 2473.7931034482763, y = 444.90088289188736},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930090}
            }
          },
          ["1742891256142717365"] = {
            key = "1742891256142717365",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\149\178\233\151\168",
            pos = {x = 2746.8965517241386, y = 433.52157254705975},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210015,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_KnockDoor_1930090",
              DelayShowGuideTime = 0,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_19",
              BlendInTime = 1,
              BlendOutTime = 1,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210015,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210015}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256142717366"] = {
            key = "1742891256142717366",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\149\178\233\151\168\231\130\185",
            pos = {x = 3063.4482758620697, y = 425.2457104780942},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930090}
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717336"] = {
      isStoryNode = true,
      key = "1742891256142717336",
      type = "StoryNode",
      name = "\229\175\187\230\137\190\230\137\182\231\150\143",
      pos = {x = 2173.908045977011, y = 708.8472430451441},
      propsData = {
        QuestId = 12020403,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_3",
        QuestDeatil = "Content_120204_3",
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
            startQuest = "1742891256142717367",
            startPort = "QuestStart",
            endQuest = "1742891256142717370",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717370",
            startPort = "Out",
            endQuest = "1742891256142717372",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717372",
            startPort = "Out",
            endQuest = "1742891256142717371",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717371",
            startPort = "Out",
            endQuest = "1742891256142717373",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717373",
            startPort = "Out",
            endQuest = "1742891256142717368",
            endPort = "Success"
          },
          {
            startQuest = "1742891256142717370",
            startPort = "Out",
            endQuest = "1742891256142717374",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256142717367"] = {
            key = "1742891256142717367",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256142717368"] = {
            key = "1742891256142717368",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3434.2455284660596, y = 450.12844342973005},
            propsData = {ModeType = 0}
          },
          ["1742891256142717369"] = {
            key = "1742891256142717369",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256142717370"] = {
            key = "1742891256142717370",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2242.3572112753163, y = 444.2977424977989},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12020402"
            }
          },
          ["1742891256142717371"] = {
            key = "1742891256142717371",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\140\187\233\166\134\228\186\164\232\176\136",
            pos = {x = 2807.6697112753163, y = 432.1102424977987},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210013,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Fushu_1930093",
              DelayShowGuideTime = 0,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_20",
              BlendInTime = 1,
              BlendOutTime = 1,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210013,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210013}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256142717372"] = {
            key = "1742891256142717372",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\137\182\231\150\143",
            pos = {x = 2512.3572112753163, y = 444.2977424977988},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930093}
            }
          },
          ["1742891256142717373"] = {
            key = "1742891256142717373",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\137\182\231\150\143",
            pos = {x = 3096.4197112753163, y = 448.9852424977988},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930093}
            }
          },
          ["1742891256142717374"] = {
            key = "1742891256142717374",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \229\140\187\233\166\134",
            pos = {x = 2518.758420952736, y = 295.32596830425064},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717337"] = {
      isStoryNode = true,
      key = "1742891256142717337",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\230\185\150\229\191\131\229\178\155",
      pos = {x = 2427.2839431378793, y = 703.2112729637487},
      propsData = {
        QuestId = 12020404,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_4",
        QuestDeatil = "Content_120204_4",
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
            startQuest = "1742891256142717375",
            startPort = "QuestStart",
            endQuest = "1742891256142717378",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717378",
            startPort = "Out",
            endQuest = "1742891256142717379",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717378",
            startPort = "Out",
            endQuest = "1742891256142717380",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717380",
            startPort = "Out",
            endQuest = "1742891256142717381",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717381",
            startPort = "Out",
            endQuest = "1742891256142717376",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256142717375"] = {
            key = "1742891256142717375",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256142717376"] = {
            key = "1742891256142717376",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3219.801084021615, y = 436.7951100963967},
            propsData = {ModeType = 0}
          },
          ["1742891256142717377"] = {
            key = "1742891256142717377",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256142717378"] = {
            key = "1742891256142717378",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\185\150\229\191\131\229\178\155\229\133\165\229\143\163",
            pos = {x = 2219.5061653601015, y = 443.2112729637489},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930094,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020404"
            }
          },
          ["1742891256142717379"] = {
            key = "1742891256142717379",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\151\160\231\148\177\231\148\159\229\142\187\229\147\170\228\186\134",
            pos = {x = 2455.061720915657, y = 297.65571740819325},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742891256142717380"] = {
            key = "1742891256142717380",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\176\152\230\188\160\229\164\132",
            pos = {x = 2632.8394986934345, y = 442.1001618526376},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930095,
              GuideType = "P",
              GuidePointName = "QuestPoint_120204041"
            }
          },
          ["1742891256142717381"] = {
            key = "1742891256142717381",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\184\133\233\153\164\229\176\152\230\188\160",
            pos = {x = 2908.39505424899, y = 428.76682851930434},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717338"] = {
      isStoryNode = true,
      key = "1742891256142717338",
      type = "StoryNode",
      name = "\230\184\133\233\153\164\229\176\152\230\188\160",
      pos = {x = 2690.617276471213, y = 702.1001618526377},
      propsData = {
        QuestId = 12020405,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_5",
        QuestDeatil = "Content_120204_5",
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
            startQuest = "1742891256142717382",
            startPort = "QuestStart",
            endQuest = "1742891256142717385",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717385",
            startPort = "Out",
            endQuest = "1742891256142717386",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717386",
            startPort = "Out",
            endQuest = "1742891256142717387",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717387",
            startPort = "Out",
            endQuest = "1742891256142717383",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256142717382"] = {
            key = "1742891256142717382",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256142717383"] = {
            key = "1742891256142717383",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3108.6899729105044, y = 421.23955454084114},
            propsData = {ModeType = 0}
          },
          ["1742891256142717384"] = {
            key = "1742891256142717384",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256142717385"] = {
            key = "1742891256142717385",
            type = "GoToNode",
            name = "\230\184\133\233\153\164\229\176\152\230\188\160",
            pos = {x = 2219.5061653601015, y = 443.2112729637489},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930096,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020405"
            }
          },
          ["1742891256142717386"] = {
            key = "1742891256142717386",
            type = "TalkNode",
            name = "\229\140\186\229\159\159\231\142\169\230\179\149",
            pos = {x = 2497.195054248991, y = 429.8779396304154},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
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
          ["1742891256142717387"] = {
            key = "1742891256142717387",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\231\149\143\231\148\159\228\186\164\230\181\129",
            pos = {x = 2785.0617209156567, y = 429.8779396304155},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_21",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210016,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 210016},
                {TalkActorType = "Npc", TalkActorId = 210013},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717339"] = {
      isStoryNode = true,
      key = "1742891256142717339",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\165\173\229\143\176",
      pos = {x = 2950.6172764712123, y = 700.9890507415265},
      propsData = {
        QuestId = 12020406,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_6",
        QuestDeatil = "Content_120204_6",
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
            startQuest = "1742891256142717388",
            startPort = "QuestStart",
            endQuest = "1742891256142717391",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717392",
            startPort = "Out",
            endQuest = "1742891256142717389",
            endPort = "Success"
          },
          {
            startQuest = "1742891256142717391",
            startPort = "Out",
            endQuest = "1742891256142717392",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256142717388"] = {
            key = "1742891256142717388",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256142717389"] = {
            key = "1742891256142717389",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2777.5788617993935, y = 441.23955454084114},
            propsData = {ModeType = 0}
          },
          ["1742891256142717390"] = {
            key = "1742891256142717390",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256142717391"] = {
            key = "1742891256142717391",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\165\173\229\143\176",
            pos = {x = 2219.5061653601015, y = 443.2112729637489},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930100,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020406"
            }
          },
          ["1742891256142717392"] = {
            key = "1742891256142717392",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \231\149\143\231\148\159\229\155\158\229\174\182",
            pos = {x = 2491.728387582323, y = 430.9890507415266},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_22",
              BlendInTime = 1,
              BlendOutTime = 0.5,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210016,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 210016},
                {TalkActorType = "Npc", TalkActorId = 210013},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717340"] = {
      isStoryNode = true,
      key = "1742891256142717340",
      type = "StoryNode",
      name = "\229\175\187\230\137\190\231\172\172\228\186\140\229\143\170\230\151\160\231\148\177\231\148\159",
      pos = {x = 3225.061720915656, y = 697.6557174081931},
      propsData = {
        QuestId = 12020407,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_7",
        QuestDeatil = "Content_120204_7",
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
            startQuest = "1742891256142717393",
            startPort = "QuestStart",
            endQuest = "1742891256142717396",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717396",
            startPort = "Out",
            endQuest = "1742891256142717397",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717396",
            startPort = "Out",
            endQuest = "1742891256142717398",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717398",
            startPort = "Out",
            endQuest = "1742891256142717399",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717399",
            startPort = "Out",
            endQuest = "1742891256142717400",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717400",
            startPort = "Out",
            endQuest = "1742891256142717401",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717401",
            startPort = "Out",
            endQuest = "1742891256142717402",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717402",
            startPort = "Out",
            endQuest = "1742891256142717394",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256142717393"] = {
            key = "1742891256142717393",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 1940.3146853146854, y = 442.8671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256142717394"] = {
            key = "1742891256142717394",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3868.5312427517742, y = 432.549078350365},
            propsData = {ModeType = 0}
          },
          ["1742891256142717395"] = {
            key = "1742891256142717395",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256142717396"] = {
            key = "1742891256142717396",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\229\177\177\230\180\158",
            pos = {x = 2219.5061653601015, y = 442.1001618526378},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930104,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020407"
            }
          },
          ["1742891256142717397"] = {
            key = "1742891256142717397",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\151\160\231\148\177\231\148\159\231\154\132\229\163\176\233\159\179",
            pos = {x = 2470.3791812331183, y = 278.3700031224791},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742891256142717398"] = {
            key = "1742891256142717398",
            type = "GoToNode",
            name = "\232\191\155\229\133\165\229\177\177\230\180\158",
            pos = {x = 2548.1966415505785, y = 442.6953999478758},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930105,
              GuideType = "P",
              GuidePointName = "QuestPoint_120204071"
            }
          },
          ["1742891256142717399"] = {
            key = "1742891256142717399",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \232\191\155\232\161\140\232\176\131\233\166\153",
            pos = {x = 2821.410927264864, y = 429.8382570907329},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742891256142717400"] = {
            key = "1742891256142717400",
            type = "TalkNode",
            name = "\229\140\186\229\159\159\231\142\169\230\179\149",
            pos = {x = 3092.4823558362923, y = 433.14994540242117},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = 1,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
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
          ["1742891256142717401"] = {
            key = "1742891256142717401",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\230\151\160\231\148\177\231\148\159",
            pos = {x = 3363.5537844077207, y = 435.1953999478757},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930106}
            }
          },
          ["1742891256142717402"] = {
            key = "1742891256142717402",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \232\162\171\230\137\190\229\136\176\228\186\134",
            pos = {x = 3627.417420771357, y = 427.20838696086287},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717341"] = {
      isStoryNode = true,
      key = "1742891256142717341",
      type = "StoryNode",
      name = "\229\135\187\232\180\165\230\128\170\231\137\169",
      pos = {x = 3495.5472909012265, y = 696.1953999478757},
      propsData = {
        QuestId = 12020408,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_8",
        QuestDeatil = "Content_120204_8",
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
            startQuest = "1742891256142717403",
            startPort = "QuestStart",
            endQuest = "1742891256142717406",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717406",
            startPort = "Out",
            endQuest = "1742891256142717407",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717407",
            startPort = "Out",
            endQuest = "1742891256142717408",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717407",
            startPort = "Out",
            endQuest = "1742891256142717409",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717408",
            startPort = "Out",
            endQuest = "1742891256142717410",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717410",
            startPort = "Out",
            endQuest = "1742891256142717411",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717411",
            startPort = "Out",
            endQuest = "1742891256142717404",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256142717403"] = {
            key = "1742891256142717403",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2549.3146853146854, y = 450.3671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256142717404"] = {
            key = "1742891256142717404",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4329.642353862885, y = 449.2157450170317},
            propsData = {ModeType = 0}
          },
          ["1742891256142717405"] = {
            key = "1742891256142717405",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256142717406"] = {
            key = "1742891256142717406",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 2838.1122259661606, y = 451.98111423359006},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12020302"
            }
          },
          ["1742891256142717407"] = {
            key = "1742891256142717407",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3112.8556603095954, y = 452.6881849406608},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1930107,
                1930108,
                1930109,
                1930110
              }
            }
          },
          ["1742891256142717408"] = {
            key = "1742891256142717408",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 3423.9667714207058, y = 453.7992960517719},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 4,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                1930107,
                1930108,
                1930109,
                1930110
              }
            }
          },
          ["1742891256142717409"] = {
            key = "1742891256142717409",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\156\168\229\164\180\228\186\186",
            pos = {x = 3420.633438087373, y = 277.13262938510536},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742891256142717410"] = {
            key = "1742891256142717410",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\151\160\231\148\177\231\148\159",
            pos = {x = 3701.744549198484, y = 452.68818494066085},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930106}
            }
          },
          ["1742891256142717411"] = {
            key = "1742891256142717411",
            type = "TalkNode",
            name = "\231\172\172\228\186\140\229\143\170\230\151\160\231\148\177\231\148\159\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 3998.4112158651515, y = 441.57707382954965},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = 1,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
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
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717342"] = {
      isStoryNode = true,
      key = "1742891256142717342",
      type = "StoryNode",
      name = "\229\175\187\230\137\190\231\172\172\228\184\137\229\143\170\230\151\160\231\148\177\231\148\159",
      pos = {x = 1669.7692036376134, y = 880.4686208789913},
      propsData = {
        QuestId = 12020409,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_9",
        QuestDeatil = "Content_120204_9",
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
            startQuest = "1742891256142717415",
            startPort = "Out",
            endQuest = "1742891256142717416",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717412",
            startPort = "QuestStart",
            endQuest = "1742891256142717415",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717418",
            startPort = "Out",
            endQuest = "1742891256142717419",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717415",
            startPort = "Out",
            endQuest = "1742891256142717418",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717419",
            startPort = "Out",
            endQuest = "1742891256142717417",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717417",
            startPort = "Out",
            endQuest = "1742891256142717420",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717420",
            startPort = "Out",
            endQuest = "1742891256142717413",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256142717412"] = {
            key = "1742891256142717412",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3053.3146853146854, y = 515.1671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256142717413"] = {
            key = "1742891256142717413",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4645.242353862885, y = 506.81574501703165},
            propsData = {ModeType = 0}
          },
          ["1742891256142717414"] = {
            key = "1742891256142717414",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256142717415"] = {
            key = "1742891256142717415",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\159\179\231\162\145",
            pos = {x = 3318.435379128791, y = 514.7658791762493},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930111,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020409"
            }
          },
          ["1742891256142717416"] = {
            key = "1742891256142717416",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\159\165\231\156\139\231\159\179\231\162\145",
            pos = {x = 3550.3909346843466, y = 365.61032362069363},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1742891256142717417"] = {
            key = "1742891256142717417",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 4122.702045795458, y = 503.1881013984715},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210020,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_CheckStele_1930112",
              DelayShowGuideTime = 0,
              IsPlayerTurnToNPC = true,
              IsNPCTurnToPlayer = true,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FreeSimple",
              BlendInTime = 0.5,
              BlendOutTime = 0.5,
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
              SwitchToMaster = "None",
              PlayerSwitchEmoIdle = true,
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256142717418"] = {
            key = "1742891256142717418",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 3574.9764824698946, y = 513.6807198910899},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12020409"
            }
          },
          ["1742891256142717419"] = {
            key = "1742891256142717419",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3850.8737629671755, y = 515.5416367520068},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930112}
            }
          },
          ["1742891256142717420"] = {
            key = "1742891256142717420",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \230\151\160\231\148\177\231\148\159\232\166\129\231\142\169",
            pos = {x = 4375.902045795458, y = 497.18810139847136},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717343"] = {
      isStoryNode = true,
      key = "1742891256142717343",
      type = "StoryNode",
      name = "\230\137\190\229\136\176\231\172\172\228\184\137\229\143\170\230\151\160\231\148\177\231\148\159",
      pos = {x = 1923.1020457954592, y = 884.7881013984713},
      propsData = {
        QuestId = 12020410,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_10",
        QuestDeatil = "Content_120204_10",
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
            startQuest = "1742891256142717424",
            startPort = "Out",
            endQuest = "1742891256142717425",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717425",
            startPort = "Out",
            endQuest = "1742891256142717426",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717421",
            startPort = "QuestStart",
            endQuest = "1742891256142717424",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717426",
            startPort = "Out",
            endQuest = "1742891256142717422",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256142717421"] = {
            key = "1742891256142717421",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3053.3146853146854, y = 515.1671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256142717422"] = {
            key = "1742891256142717422",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4156.8048538628855, y = 515.2532450170316},
            propsData = {ModeType = 0}
          },
          ["1742891256142717423"] = {
            key = "1742891256142717423",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256142717424"] = {
            key = "1742891256142717424",
            type = "GoToNode",
            name = "\229\188\128\229\144\175\233\166\153\231\130\137",
            pos = {x = 3311.051540744952, y = 518.1184044287743},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930113,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020410"
            }
          },
          ["1742891256142717425"] = {
            key = "1742891256142717425",
            type = "TalkNode",
            name = "\229\140\186\229\159\159\231\142\169\230\179\149",
            pos = {x = 3589.940429633841, y = 504.7850710954408},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = 0,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
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
          ["1742891256142717426"] = {
            key = "1742891256142717426",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\231\172\172\228\184\137\229\143\170\230\151\160\231\148\177\231\148\159\228\186\164\230\181\129",
            pos = {x = 3876.6070963005072, y = 504.78507109544086},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_23",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210017,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 210017},
                {TalkActorType = "Npc", TalkActorId = 210013},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717344"] = {
      isStoryNode = true,
      key = "1742891256142717344",
      type = "StoryNode",
      name = "\232\191\148\229\155\158\231\165\173\229\143\176",
      pos = {x = 2170.2087766153463, y = 881.124242640596},
      propsData = {
        QuestId = 12020411,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_11",
        QuestDeatil = "Content_120204_11",
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
            startQuest = "1742891256142717427",
            startPort = "QuestStart",
            endQuest = "1742891256142717430",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717430",
            startPort = "Out",
            endQuest = "1742891256142717431",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717431",
            startPort = "Out",
            endQuest = "1742891256142717432",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717432",
            startPort = "Out",
            endQuest = "1742891256142717428",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256142717427"] = {
            key = "1742891256142717427",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3053.3146853146854, y = 515.1671328671328},
            propsData = {ModeType = 0}
          },
          ["1742891256142717428"] = {
            key = "1742891256142717428",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4156.8048538628855, y = 515.2532450170316},
            propsData = {ModeType = 0}
          },
          ["1742891256142717429"] = {
            key = "1742891256142717429",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256142717430"] = {
            key = "1742891256142717430",
            type = "GoToNode",
            name = "\232\191\148\229\155\158\231\165\173\229\143\176",
            pos = {x = 3311.051540744952, y = 518.1184044287743},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930100,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020406"
            }
          },
          ["1742891256142717431"] = {
            key = "1742891256142717431",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \233\155\134\233\189\144\230\151\160\231\148\177\231\148\159\228\186\134",
            pos = {x = 3604.5201397787687, y = 505.2695431451303},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_24",
              BlendInTime = 1,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210013},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256142717432"] = {
            key = "1742891256142717432",
            type = "TalkNode",
            name = "\232\191\135\229\156\186 - \230\151\160\231\148\177\231\148\159\232\129\154\232\144\189\229\143\152\229\140\150",
            pos = {x = 3884.1009171815704, y = 501.8154880243697},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 0,
              BlendOutTime = 1,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
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
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717345"] = {
      isStoryNode = true,
      key = "1742891256142717345",
      type = "StoryNode",
      name = "\229\146\140\230\151\160\231\148\177\231\148\159\233\149\191\232\128\129\229\175\185\232\175\157",
      pos = {x = 2426.5099846390167, y = 879.811059907834},
      propsData = {
        QuestId = 12020412,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_12",
        QuestDeatil = "Content_120204_12",
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
            startQuest = "1742891256142717436",
            startPort = "Out",
            endQuest = "1742891256142717437",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717433",
            startPort = "QuestStart",
            endQuest = "1742891256142717436",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717438",
            startPort = "Out",
            endQuest = "1742891256142717439",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717439",
            startPort = "Out",
            endQuest = "1742891256142717434",
            endPort = "Success"
          },
          {
            startQuest = "1742891256142717437",
            startPort = "Out",
            endQuest = "1742891256142717438",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256142717433"] = {
            key = "1742891256142717433",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 2922.171828171828, y = 516.8814185814184},
            propsData = {ModeType = 0}
          },
          ["1742891256142717434"] = {
            key = "1742891256142717434",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4435.392077450109, y = 519.6021393659261},
            propsData = {ModeType = 0}
          },
          ["1742891256142717435"] = {
            key = "1742891256142717435",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256142717436"] = {
            key = "1742891256142717436",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 3187.608329884326, y = 517.3206574997845},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12020412"
            }
          },
          ["1742891256142717437"] = {
            key = "1742891256142717437",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3509.791324667321, y = 520.8958600749871},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930122}
            }
          },
          ["1742891256142717438"] = {
            key = "1742891256142717438",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\233\149\191\232\128\129\230\151\160\231\148\177\231\148\159\229\175\185\232\175\157",
            pos = {x = 3890.5171349681314, y = 505.8327571151451},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 210018,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_ElderWuyousheng_1930122",
              DelayShowGuideTime = 0,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_25",
              BlendInTime = 1,
              BlendOutTime = 0.5,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210018,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 210018},
                {TalkActorType = "Npc", TalkActorId = 210013},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256142717439"] = {
            key = "1742891256142717439",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 4154.569744520741, y = 518.9039613955883},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930122}
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717346"] = {
      isStoryNode = true,
      key = "1742891256142717346",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\231\128\145\229\184\131",
      pos = {x = 2692.8189144748444, y = 879.0088051560296},
      propsData = {
        QuestId = 12020413,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_13",
        QuestDeatil = "Content_120204_13",
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
            startQuest = "1742891256142717443",
            startPort = "Out",
            endQuest = "1742891256142717444",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717440",
            startPort = "QuestStart",
            endQuest = "1742891256142717443",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717444",
            startPort = "Out",
            endQuest = "1742891256142717441",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256142717440"] = {
            key = "1742891256142717440",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3627.1856530566206, y = 483.231648996165},
            propsData = {ModeType = 0}
          },
          ["1742891256142717441"] = {
            key = "1742891256142717441",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4447.004980675916, y = 477.9892361401196},
            propsData = {ModeType = 0}
          },
          ["1742891256142717442"] = {
            key = "1742891256142717442",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 3953.71390273013, y = 788.3435935261493},
            propsData = {}
          },
          ["1742891256142717443"] = {
            key = "1742891256142717443",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\231\128\145\229\184\131\229\164\132",
            pos = {x = 3880.8228970187997, y = 483.6356271292751},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930126,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020413"
            }
          },
          ["1742891256142717444"] = {
            key = "1742891256142717444",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\188\128\229\167\139\233\135\135\233\155\134",
            pos = {x = 4165.581818633261, y = 471.754507781115},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_26",
              BlendInTime = 1,
              BlendOutTime = 0.5,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210013},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717347"] = {
      isStoryNode = true,
      key = "1742891256142717347",
      type = "StoryNode",
      name = "\233\135\135\233\155\134\229\191\152\229\191\167\232\141\137",
      pos = {x = 2954.963721462395, y = 880.2800328929828},
      propsData = {
        QuestId = 12020414,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_14",
        QuestDeatil = "Content_120204_14",
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
            startQuest = "1742891256142717448",
            startPort = "Out",
            endQuest = "1742891256142717449",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717445",
            startPort = "QuestStart",
            endQuest = "1742891256142717448",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717450",
            startPort = "Out",
            endQuest = "1742891256142717451",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717449",
            startPort = "Out",
            endQuest = "1742891256142717450",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717451",
            startPort = "Out",
            endQuest = "1742891256142717452",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717452",
            startPort = "Out",
            endQuest = "1742891256142717446",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256142717445"] = {
            key = "1742891256142717445",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3590.757081628049, y = 511.08879185330784},
            propsData = {ModeType = 0}
          },
          ["1742891256142717446"] = {
            key = "1742891256142717446",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 5234.381604052539, y = 512.2814439323273},
            propsData = {ModeType = 0}
          },
          ["1742891256142717447"] = {
            key = "1742891256142717447",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 5197.2853313015585, y = 683.1293078118636},
            propsData = {}
          },
          ["1742891256142717448"] = {
            key = "1742891256142717448",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 3854.175795499469, y = 510.98350303395307},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12020413"
            }
          },
          ["1742891256142717449"] = {
            key = "1742891256142717449",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\143\231\153\189\229\146\140\230\137\182\231\150\143",
            pos = {x = 4138.57307599675, y = 511.4872770377271},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930133, 1930130}
            }
          },
          ["1742891256142717450"] = {
            key = "1742891256142717450",
            type = "GoToNode",
            name = "\233\135\135\233\155\134\230\151\160\229\191\167\232\141\137",
            pos = {x = 4397.627163522411, y = 513.2931517821027},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1930132,
              GuideType = "P",
              GuidePointName = "QuestPoint_12020414"
            }
          },
          ["1742891256142717451"] = {
            key = "1742891256142717451",
            type = "TalkNode",
            name = "\229\140\186\229\159\159\231\142\169\230\179\149",
            pos = {x = 4676.5160524113, y = 499.95981844876917},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Black",
              BlendInTime = 1,
              BlendOutTime = 0.5,
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              ForceAutoPlay = true,
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
          ["1742891256142717452"] = {
            key = "1742891256142717452",
            type = "TalkNode",
            name = "\229\188\128\232\189\166- \228\189\160\232\191\135\230\157\165\229\149\138",
            pos = {x = 4955.5781014733475, y = 495.02908251803353},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717348"] = {
      isStoryNode = true,
      key = "1742891256142717348",
      type = "StoryNode",
      name = "\229\142\187\231\156\139\231\156\139\229\176\143\231\153\189\229\156\168\229\185\178\229\152\155",
      pos = {x = 3227.9906118833874, y = 879.4944163397865},
      propsData = {
        QuestId = 12020415,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_15",
        QuestDeatil = "Content_120204_15",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
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
            startQuest = "1742891256142717456",
            startPort = "Out",
            endQuest = "1742891256142717457",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717457",
            startPort = "Out",
            endQuest = "1742891256142717454",
            endPort = "Success"
          },
          {
            startQuest = "1742891256142717453",
            startPort = "QuestStart",
            endQuest = "1742891256142717458",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717458",
            startPort = "Out",
            endQuest = "1742891256142717456",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256142717453"] = {
            key = "1742891256142717453",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3992.0087830799544, y = 536.2073263360664},
            propsData = {ModeType = 0}
          },
          ["1742891256142717454"] = {
            key = "1742891256142717454",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 5205.623907008204, y = 516.41937496681},
            propsData = {
              ModeType = 1,
              Id = 104401,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1742891256142717455"] = {
            key = "1742891256142717455",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 5405.142474158701, y = 660.6293078118636},
            propsData = {}
          },
          ["1742891256142717456"] = {
            key = "1742891256142717456",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\146\140\229\176\143\231\153\189\229\175\185\232\175\157",
            pos = {x = 4628.100361580777, y = 525.1518531228077},
            propsData = {
              IsNpcNode = true,
              NpcNodeInteractiveName = "",
              NpcId = 200002,
              GuideUIEnable = true,
              GuideType = "N",
              GuidePointName = "Npc_Bai_1930133",
              DelayShowGuideTime = 0,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_27",
              BlendInTime = 1,
              BlendOutTime = -1,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200002}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256142717457"] = {
            key = "1742891256142717457",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \230\137\182\231\150\143\229\146\140\229\176\143\231\153\189\229\175\185\232\175\157",
            pos = {x = 4881.761854886233, y = 520.9908071254614},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_27",
              BlendInTime = -1,
              BlendOutTime = 1,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 210013},
                {TalkActorType = "Npc", TalkActorId = 200002}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["1742891256142717458"] = {
            key = "1742891256142717458",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\176\143\231\153\189\229\146\140\230\137\182\231\150\143",
            pos = {x = 4377.037593984962, y = 538.0526315789473},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1930133, 1930130}
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717349"] = {
      isStoryNode = true,
      key = "1742891256142717349",
      type = "StoryNode",
      name = "\230\137\182\231\150\143\229\137\175\230\156\172II",
      pos = {x = 3806.14922750916, y = 1057.494366984003},
      propsData = {
        QuestId = 12020419,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_16",
        QuestDeatil = "Content_120204_16",
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
        IsFairyLand = true,
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = "0"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256142717462",
            startPort = "Fail",
            endQuest = "1742891256142717463",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717462",
            startPort = "Success",
            endQuest = "1742891256142717460",
            endPort = "Success"
          },
          {
            startQuest = "1742891256142717463",
            startPort = "Out",
            endQuest = "1742891256142717461",
            endPort = "Fail"
          },
          {
            startQuest = "1742891256142717462",
            startPort = "PassiveFail",
            endQuest = "1742891256142717461",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1742891256142717459"] = {
            key = "1742891256142717459",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3919.2847381190672, y = 564.6857923145323},
            propsData = {ModeType = 0}
          },
          ["1742891256142717460"] = {
            key = "1742891256142717460",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4761.8308035599275, y = 476.07454738060306},
            propsData = {
              ModeType = 1,
              Id = 104101,
              StartIndex = 1,
              IsWhite = true
            }
          },
          ["1742891256142717461"] = {
            key = "1742891256142717461",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4755.975365405385, y = 750.3003953450201},
            propsData = {}
          },
          ["1742891256142717462"] = {
            key = "1742891256142717462",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 4493.312606597614, y = 549.8096665952737},
            propsData = {SpecialConfigId = 2002, BlackScreenImmediately = true}
          },
          ["1742891256142717463"] = {
            key = "1742891256142717463",
            type = "SkipRegionNode",
            name = "\233\128\129\229\155\158\229\185\187\229\162\131\229\164\150",
            pos = {x = 4757.654302370285, y = 615.0623973727421},
            propsData = {
              ModeType = 1,
              Id = 104101,
              StartIndex = 14,
              IsWhite = true
            }
          },
          ["1742891256142717464"] = {
            key = "1742891256142717464",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 4496.620879120879, y = 767.5164835164835},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717350"] = {
      isStoryNode = true,
      key = "1742891256142717350",
      type = "StoryNode",
      name = "\232\175\162\233\151\174\230\137\182\231\150\143",
      pos = {x = 4076.4473078492547, y = 1052.9887293380275},
      propsData = {
        QuestId = 12020421,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_17",
        QuestDeatil = "Content_120204_17",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
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
            startQuest = "1742891256142717466",
            startPort = "QuestStart",
            endQuest = "1742891256142717469",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717469",
            startPort = "Out",
            endQuest = "1742891256142717470",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717470",
            startPort = "Out",
            endQuest = "1742891256142717467",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1742891256142717466"] = {
            key = "1742891256142717466",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 4222.535098869428, y = 536.2073263360664},
            propsData = {ModeType = 0}
          },
          ["1742891256142717467"] = {
            key = "1742891256142717467",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 5092.546983931281, y = 531.41937496681},
            propsData = {ModeType = 0}
          },
          ["1742891256142717468"] = {
            key = "1742891256142717468",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 5405.142474158701, y = 660.6293078118636},
            propsData = {}
          },
          ["1742891256142717469"] = {
            key = "1742891256142717469",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 4540.622792206031, y = 543.7481643671699},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104101,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_12020413"
            }
          },
          ["1742891256142717470"] = {
            key = "1742891256142717470",
            type = "TalkNode",
            name = "\231\171\153\230\161\169 - \229\188\128\229\167\139\233\135\135\233\155\134",
            pos = {x = 4805.0924413308485, y = 539.6307300773221},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 0,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "East01_FixSimple_29",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
                  TalkActorType = "Player",
                  TalkActorId = 0,
                  TalkActorVisible = false
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200002,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 210013,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 100001,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 200002},
                {TalkActorType = "Npc", TalkActorId = 210013},
                {TalkActorType = "Npc", TalkActorId = 100001}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717351"] = {
      isStoryNode = true,
      key = "1742891256142717351",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 3284.6551557554562, y = 1067.6830798886272},
      propsData = {QuestChainId = 120204},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1742891256142717352"] = {
      isStoryNode = true,
      key = "1742891256142717352",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 4328.5696717333, y = 1071.170353191278},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1742891256142717353"] = {
      isStoryNode = true,
      key = "1742891256142717353",
      type = "StoryNode",
      name = "\230\137\182\231\150\143\229\137\175\230\156\172I",
      pos = {x = 3542.173608001194, y = 1056.354381250933},
      propsData = {
        QuestId = 12020418,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_18",
        QuestDeatil = "Content_120204_18",
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
        IsFairyLand = true,
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = "0"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256142717474",
            startPort = "Fail",
            endQuest = "1742891256143717475",
            endPort = "In"
          },
          {
            startQuest = "1742891256142717474",
            startPort = "Success",
            endQuest = "1742891256142717472",
            endPort = "Success"
          },
          {
            startQuest = "1742891256143717475",
            startPort = "Out",
            endQuest = "1742891256142717473",
            endPort = "Fail"
          },
          {
            startQuest = "1742891256142717474",
            startPort = "PassiveFail",
            endQuest = "1742891256142717473",
            endPort = "Fail"
          },
          {
            startQuest = "1742891256142717471",
            startPort = "QuestStart",
            endQuest = "1742891256142717474",
            endPort = "In"
          }
        },
        nodeData = {
          ["1742891256142717471"] = {
            key = "1742891256142717471",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 4217.00428186035, y = 561.5928972868547},
            propsData = {ModeType = 0}
          },
          ["1742891256142717472"] = {
            key = "1742891256142717472",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4761.8308035599275, y = 476.07454738060306},
            propsData = {
              ModeType = 1,
              Id = 104401,
              StartIndex = 1,
              IsWhite = false
            }
          },
          ["1742891256142717473"] = {
            key = "1742891256142717473",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4762.436903866923, y = 750.7619338065585},
            propsData = {}
          },
          ["1742891256142717474"] = {
            key = "1742891256142717474",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 4484.280117347733, y = 528.7418213969936},
            propsData = {SpecialConfigId = 2001, BlackScreenImmediately = true}
          },
          ["1742891256143717475"] = {
            key = "1742891256143717475",
            type = "SkipRegionNode",
            name = "\233\128\129\229\155\158\229\185\187\229\162\131\229\164\150",
            pos = {x = 4762.26968698567, y = 607.3700896804344},
            propsData = {
              ModeType = 1,
              Id = 104101,
              StartIndex = 14,
              IsWhite = true
            }
          }
        },
        commentData = {}
      }
    },
    ["1742891256142717354"] = {
      isStoryNode = true,
      key = "1742891256142717354",
      type = "StoryNode",
      name = "\230\137\182\231\150\143\229\137\175\230\156\172II\230\142\168\232\136\185\229\144\142",
      pos = {x = 3808.1351154566264, y = 1215.1487562780471},
      propsData = {
        QuestId = 12020420,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120204_16",
        QuestDeatil = "Content_120204_16",
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
        IsFairyLand = true,
        SubRegionId = 0,
        StoryGuideType = "Point",
        StoryGuidePointName = "0"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1742891256143717477",
            startPort = "QuestStart",
            endQuest = "1742891256143717480",
            endPort = "In"
          },
          {
            startQuest = "1742891256143717480",
            startPort = "Fail",
            endQuest = "1742891256143717481",
            endPort = "In"
          },
          {
            startQuest = "1742891256143717480",
            startPort = "Success",
            endQuest = "1742891256143717478",
            endPort = "Success"
          },
          {
            startQuest = "1742891256143717481",
            startPort = "Out",
            endQuest = "1742891256143717479",
            endPort = "Fail"
          },
          {
            startQuest = "1742891256143717480",
            startPort = "PassiveFail",
            endQuest = "1742891256143717482",
            endPort = "In"
          },
          {
            startQuest = "1742891256143717482",
            startPort = "Out",
            endQuest = "1742891256143717479",
            endPort = "Fail"
          }
        },
        nodeData = {
          ["1742891256143717477"] = {
            key = "1742891256143717477",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 4234.757321091651, y = 543.9851041138443},
            propsData = {ModeType = 0}
          },
          ["1742891256143717478"] = {
            key = "1742891256143717478",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4761.8308035599275, y = 476.07454738060306},
            propsData = {ModeType = 0}
          },
          ["1742891256143717479"] = {
            key = "1742891256143717479",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 5027.2864021946825, y = 616.1465491911739},
            propsData = {}
          },
          ["1742891256143717480"] = {
            key = "1742891256143717480",
            type = "WaitingSpecialQuestStartAndFinishNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\188\128\229\167\139\229\185\182\229\174\140\230\136\144",
            pos = {x = 4508.126271193887, y = 544.1264367816091},
            propsData = {SpecialConfigId = 2003, BlackScreenImmediately = false}
          },
          ["1742891256143717481"] = {
            key = "1742891256143717481",
            type = "SkipRegionNode",
            name = "\233\128\129\229\155\158\229\185\187\229\162\131\229\164\150",
            pos = {x = 4757.654302370285, y = 615.0623973727421},
            propsData = {
              ModeType = 1,
              Id = 104101,
              StartIndex = 14,
              IsWhite = true
            }
          },
          ["1742891256143717482"] = {
            key = "1742891256143717482",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 4765.269736842106, y = 756.0620300751879},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "",
              FadeIn = false,
              FadeOut = false,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
