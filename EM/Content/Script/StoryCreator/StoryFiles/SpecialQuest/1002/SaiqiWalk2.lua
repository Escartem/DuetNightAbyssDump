return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17549110221711124236",
      startPort = "StoryStart",
      endStory = "17217249814384819",
      endPort = "In"
    },
    {
      startStory = "17217249814384819",
      startPort = "Success",
      endStory = "17217252093746324",
      endPort = "In"
    },
    {
      startStory = "17217252093746324",
      startPort = "Success",
      endStory = "172172556495710133",
      endPort = "In"
    },
    {
      startStory = "172172556495710133",
      startPort = "Success",
      endStory = "17549110221711124237",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17217249814384819"] = {
      isStoryNode = true,
      key = "17217249814384819",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1178.8892747468806, y = 303.05709388874715},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020608",
        QuestDeatil = "QuestDesc_10020608",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = false,
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
            startQuest = "17217254284706903",
            startPort = "Out",
            endQuest = "17217254338577119",
            endPort = "In"
          },
          {
            startQuest = "17217249814384823",
            startPort = "QuestStart",
            endQuest = "17217255154538066",
            endPort = "In"
          },
          {
            startQuest = "17217255154538066",
            startPort = "Out",
            endQuest = "17217249814384825",
            endPort = "Fail"
          },
          {
            startQuest = "17258709858792671",
            startPort = "Out",
            endQuest = "17258709858792672",
            endPort = "In"
          },
          {
            startQuest = "17258709858792669",
            startPort = "Out",
            endQuest = "17258709858792670",
            endPort = "In"
          },
          {
            startQuest = "17258709858792670",
            startPort = "Out",
            endQuest = "17258709858792671",
            endPort = "In"
          },
          {
            startQuest = "17217249814384823",
            startPort = "QuestStart",
            endQuest = "17258709858792669",
            endPort = "In"
          },
          {
            startQuest = "17436720787643668700",
            startPort = "Out",
            endQuest = "17436721490443669418",
            endPort = "In"
          },
          {
            startQuest = "17436721490443669418",
            startPort = "Out",
            endQuest = "17436721431813669304",
            endPort = "In"
          },
          {
            startQuest = "17436722502454193342",
            startPort = "Out",
            endQuest = "17436722502454193344",
            endPort = "In"
          },
          {
            startQuest = "17436722502454193344",
            startPort = "Out",
            endQuest = "17436722502454193343",
            endPort = "In"
          },
          {
            startQuest = "17437434159242080",
            startPort = "Out",
            endQuest = "17437437824491316483",
            endPort = "In"
          },
          {
            startQuest = "17436721431813669304",
            startPort = "Out",
            endQuest = "17217254284706903",
            endPort = "In"
          },
          {
            startQuest = "17436721431813669304",
            startPort = "Out",
            endQuest = "17438537087324195660",
            endPort = "In"
          },
          {
            startQuest = "17439174403034199273",
            startPort = "Out",
            endQuest = "17439174403034199274",
            endPort = "In"
          },
          {
            startQuest = "17439174222074198959",
            startPort = "Out",
            endQuest = "17439174403034199273",
            endPort = "In"
          },
          {
            startQuest = "17217249814384823",
            startPort = "QuestStart",
            endQuest = "17436720787643668700",
            endPort = "In"
          },
          {
            startQuest = "17217249814384823",
            startPort = "QuestStart",
            endQuest = "17437434159242080",
            endPort = "In"
          },
          {
            startQuest = "17217249814384823",
            startPort = "QuestStart",
            endQuest = "17436722502454193342",
            endPort = "In"
          },
          {
            startQuest = "17217249814384823",
            startPort = "QuestStart",
            endQuest = "17439174222074198959",
            endPort = "In"
          },
          {
            startQuest = "17217254338577119",
            startPort = "Out",
            endQuest = "17217249814384824",
            endPort = "Success"
          },
          {
            startQuest = "17217249814384823",
            startPort = "QuestStart",
            endQuest = "17441076323088491818",
            endPort = "In"
          },
          {
            startQuest = "17438537087324195660",
            startPort = "Out",
            endQuest = "17437442618761842362",
            endPort = "In"
          }
        },
        nodeData = {
          ["17217249814384823"] = {
            key = "17217249814384823",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -937.5135500688558, y = 825.5167224080263},
            propsData = {ModeType = 0}
          },
          ["17217249814384824"] = {
            key = "17217249814384824",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1113.5172850604797, y = 881.6475972540045},
            propsData = {ModeType = 0}
          },
          ["17217249814384825"] = {
            key = "17217249814384825",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 115.43271221532285, y = 1447.4917184265012},
            propsData = {}
          },
          ["17217254284706903"] = {
            key = "17217254284706903",
            type = "GoToNode",
            name = "goto \229\134\176\230\185\150\229\135\186\229\143\145\231\130\185",
            pos = {x = 264.6900645008332, y = 856.3911268726631},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240028,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1240028"
            }
          },
          ["17217254338577119"] = {
            key = "17217254338577119",
            type = "TalkNode",
            name = "\230\136\145\229\165\189\229\131\143\229\144\172\229\136\176\230\177\189\231\172\155\229\163\176",
            pos = {x = 524.0333824731832, y = 865.6019563657508},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10109401,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101094",
              BlendInTime = 0.5,
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
                  TalkActorId = 100001,
                  TalkActorVisible = true
                },
                {
                  TalkActorType = "Npc",
                  TalkActorId = 200006,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200006}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17217255154538066"] = {
            key = "17217255154538066",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = -299.97698304933044, y = 1436.9940491763214},
            propsData = {}
          },
          ["17258705686772013"] = {
            key = "17258705686772013",
            type = "TalkNode",
            name = "\231\156\139\230\153\175\232\137\178",
            pos = {x = -840.7210410557185, y = 1012.3098973607036},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10124500,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_200044",
              BlendInTime = 0,
              BlendOutTime = 0.5,
              InType = "BlendIn",
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
              EndNewTargetPointName = "P200044Nvzhu",
              CameraLookAtTartgetPoint = "P1240651",
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
                  TalkActorId = 200006,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200006}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17258709858792669"] = {
            key = "17258709858792669",
            type = "ChangeRoleNode",
            name = "\229\136\135\230\141\162\232\167\146\232\137\178",
            pos = {x = -609.1934819117096, y = 528.4194651562252},
            propsData = {QuestRoleId = 1010101, IsPlayFX = false}
          },
          ["17258709858792670"] = {
            key = "17258709858792670",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = -361.6166256391412, y = 525.8118705005237},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = true
            }
          },
          ["17258709858792671"] = {
            key = "17258709858792671",
            type = "ForbidWeaponByWeaponTagNode",
            name = "\231\166\129\231\148\168/\229\144\175\231\148\168\230\173\166\229\153\168\232\138\130\231\130\185",
            pos = {x = -73.6217651575711, y = 524.7224521759183},
            propsData = {
              WeaponTags = {"Melee"},
              bForbid = true,
              ForbidTag = "ForbidDefault",
              bHidewhenForbid = true
            }
          },
          ["17258709858792672"] = {
            key = "17258709858792672",
            type = "ActivePlayerSkillsNode",
            name = "\229\133\179\233\151\173 \230\148\187\229\135\187\230\148\190\230\138\128\232\131\189",
            pos = {x = 151.45257282080084, y = 520.1835840449311},
            propsData = {
              PlayerId = 0,
              bActiveEnable = false,
              ActiveType = "Lock",
              SkillNameList = {
                "Attack",
                "Skill1",
                "Skill2",
                "Skill3",
                "FallAttack",
                "SlideAttack",
                "Fire",
                "Avoid",
                "HeavyAttack",
                "FireInAir"
              }
            }
          },
          ["17436702214852098941"] = {
            key = "17436702214852098941",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\188\149\229\175\188\231\148\168\231\154\132\232\157\180\232\157\182\229\146\140\232\138\177",
            pos = {x = -529.5717893217893, y = 656.4017266258649},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1240651,
                1240652,
                1240653,
                1240654,
                1240659
              }
            }
          },
          ["17436720787643668700"] = {
            key = "17436720787643668700",
            type = "GoToNode",
            name = "goto \230\185\150\232\190\185",
            pos = {x = -187.5479222899782, y = 824.1001393242773},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240655,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1240655"
            }
          },
          ["17436721431813669304"] = {
            key = "17436721431813669304",
            type = "TalkNode",
            name = "\231\156\139\230\153\175\232\137\178",
            pos = {x = -108.46401515151481, y = 892.3259690501072},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10124701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101247",
              BlendInTime = 0,
              BlendOutTime = 1.5,
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
              EndNewTargetPointName = "P101247Nvzhu1",
              CameraLookAtTartgetPoint = "P101247LookAt2",
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
                  TalkActorId = 200006,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200006}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17436721490443669418"] = {
            key = "17436721490443669418",
            type = "CameraLookAtNode",
            name = "\231\156\139\230\185\150",
            pos = {x = -143.83730158730134, y = 859.2466039707418},
            propsData = {
              TargetType = "Point",
              PointName = "P101247LookAt2",
              ActorId = 0,
              Duration = 1.2,
              EasingFunc = 4,
              bDisableUserInput = true
            }
          },
          ["17436722502454193342"] = {
            key = "17436722502454193342",
            type = "GoToNode",
            name = "goto \233\146\147\233\177\188\229\143\176",
            pos = {x = -165.3731674941952, y = 1138.9035303776682},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1240656,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1240028"
            }
          },
          ["17436722502454193343"] = {
            key = "17436722502454193343",
            type = "TalkNode",
            name = "\231\156\139\230\153\175\232\137\178",
            pos = {x = -84.79579630344425, y = 1198.3515823257203},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10124800,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101248",
              BlendInTime = 0,
              BlendOutTime = 0.5,
              InType = "BlendIn",
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
                  TalkActorId = 200006,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200006}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["17436722502454193344"] = {
            key = "17436722502454193344",
            type = "CameraLookAtNode",
            name = "\231\156\139\233\146\147\233\177\188",
            pos = {x = -127.44032456929612, y = 1170.4944394685772},
            propsData = {
              TargetType = "Point",
              PointName = "P101248LookAt",
              ActorId = 0,
              Duration = 0.75,
              EasingFunc = 4,
              bDisableUserInput = true
            }
          },
          ["17437434159242080"] = {
            key = "17437434159242080",
            type = "GoToNode",
            name = "goto \229\143\176\233\152\182",
            pos = {x = -476.38614509368756, y = 988.7953964194373},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1240657,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1240657"
            }
          },
          ["17437437824491316483"] = {
            key = "17437437824491316483",
            type = "TalkNode",
            name = "\232\191\153\232\190\185\231\154\132\231\167\175\233\155\170",
            pos = {x = -439.6228549978551, y = 1028.2453614328615},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10124601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17437441318671841935"] = {
            key = "17437441318671841935",
            type = "GoToNode",
            name = "goto \233\151\168",
            pos = {x = 178.05603758851458, y = 1175.7964224930495},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1240658,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1240028"
            }
          },
          ["17437442618761842362"] = {
            key = "17437442618761842362",
            type = "TalkNode",
            name = "\229\176\143\230\151\182\229\128\153\230\136\145",
            pos = {x = 176.55272457011537, y = 670.9546895133852},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10124901,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17438537087324195660"] = {
            key = "17438537087324195660",
            type = "TalkNode",
            name = "\232\191\153\232\190\185\231\154\132\231\167\175\233\155\170",
            pos = {x = -76.8586871280498, y = 663.4737671111684},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10124709,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = false,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17439174222074198959"] = {
            key = "17439174222074198959",
            type = "GoToNode",
            name = "goto \232\138\177",
            pos = {x = 488.38800390430833, y = 1131.4766963109357},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1240663,
              GuideType = "M",
              GuidePointName = "Mechanism_QuestTrigger_1240028"
            }
          },
          ["17439174403034199273"] = {
            key = "17439174403034199273",
            type = "CameraLookAtNode",
            name = "\231\156\139\232\138\177",
            pos = {x = 542.0657397713825, y = 1185.9856248823642},
            propsData = {
              TargetType = "Point",
              PointName = "P101250Flower2",
              ActorId = 0,
              Duration = 1,
              EasingFunc = 4,
              bDisableUserInput = true
            }
          },
          ["17439174403034199274"] = {
            key = "17439174403034199274",
            type = "TalkNode",
            name = "\231\156\139\230\153\175\232\137\178",
            pos = {x = 608.1477680372343, y = 1223.2177677395073},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10125001,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101250",
              BlendInTime = 0,
              BlendOutTime = 0.5,
              InType = "BlendIn",
              OutType = "FadeOut",
              ShowFadeDetail = false,
              BlendEaseExp = 2,
              UseProceduralCamera = false,
              ProceduralCameraId = 1,
              HideNpcs = false,
              HideMonsters = false,
              HideAllBattleEntity = false,
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
                  TalkActorId = 200006,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200006}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["174403946209911085261"] = {
            key = "174403946209911085261",
            type = "SendMessageNode",
            name = "\229\143\172\229\148\164\232\163\133\233\165\176npc",
            pos = {x = -847.852468787251, y = 611.3077837195484},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Icelake_SaiqiWalk",
              UnitId = -1
            }
          },
          ["174403947753111085547"] = {
            key = "174403947753111085547",
            type = "SendMessageNode",
            name = "\233\148\128\230\175\129\232\163\133\233\165\176npc",
            pos = {x = -457.1591379634858, y = 701.778798212302},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Chapter01_Icelake_SaiqiWalkCleanUp",
              UnitId = -1
            }
          },
          ["17441076323088491818"] = {
            key = "17441076323088491818",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\229\188\149\229\175\188\231\148\168\231\154\132\232\157\180\232\157\182\229\146\140\232\138\177",
            pos = {x = -434.27272727272737, y = 1198.0000000000002},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240659}
            }
          }
        },
        commentData = {}
      }
    },
    ["17217252093746324"] = {
      isStoryNode = true,
      key = "17217252093746324",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1505.2057678512992, y = 314.21590411876514},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020609",
        QuestDeatil = "QuestDesc_10020609",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = false,
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
            startQuest = "17217255028927777",
            startPort = "Out",
            endQuest = "17217255028927776",
            endPort = "In"
          },
          {
            startQuest = "17217255028927775",
            startPort = "Out",
            endQuest = "17217255028927779",
            endPort = "In"
          },
          {
            startQuest = "17217255028927775",
            startPort = "Out",
            endQuest = "17217255028927780",
            endPort = "In"
          },
          {
            startQuest = "17217252093746328",
            startPort = "QuestStart",
            endQuest = "17217255028927777",
            endPort = "In"
          },
          {
            startQuest = "17217252093746328",
            startPort = "QuestStart",
            endQuest = "17217255349168933",
            endPort = "In"
          },
          {
            startQuest = "17217255028927780",
            startPort = "Out",
            endQuest = "17217252093746329",
            endPort = "Success"
          },
          {
            startQuest = "17217255349168933",
            startPort = "Out",
            endQuest = "17217252093746330",
            endPort = "Fail"
          },
          {
            startQuest = "17217252093746328",
            startPort = "QuestStart",
            endQuest = "17258718663879929",
            endPort = "In"
          },
          {
            startQuest = "17217252093746328",
            startPort = "QuestStart",
            endQuest = "17259367185053524",
            endPort = "In"
          },
          {
            startQuest = "17259367185053524",
            startPort = "Out",
            endQuest = "17217255028927775",
            endPort = "In"
          },
          {
            startQuest = "17258718663879929",
            startPort = "Out",
            endQuest = "17551687990423975622",
            endPort = "In"
          },
          {
            startQuest = "17551687990423975622",
            startPort = "Out",
            endQuest = "17258718663879931",
            endPort = "In"
          }
        },
        nodeData = {
          ["17217252093746328"] = {
            key = "17217252093746328",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -585.2188132267506, y = 788.064090829079},
            propsData = {ModeType = 0}
          },
          ["17217252093746329"] = {
            key = "17217252093746329",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1000.7015500708314, y = 886.6967690966544},
            propsData = {ModeType = 0}
          },
          ["17217252093746330"] = {
            key = "17217252093746330",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1009.1827122153228, y = 1190.3488612836438},
            propsData = {}
          },
          ["17217255028927775"] = {
            key = "17217255028927775",
            type = "GoToNode",
            name = "\229\137\141\229\190\128\230\140\150\230\142\152\231\130\185\239\188\140\229\156\168\229\164\169\228\185\139\230\160\145\228\184\139",
            pos = {x = -15.392273387033583, y = 885.8307924137808},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1240031,
              GuideType = "M",
              GuidePointName = "P1240031"
            }
          },
          ["17217255028927776"] = {
            key = "17217255028927776",
            type = "TalkNode",
            name = "\233\130\163\230\152\175\228\184\128\228\184\170\229\177\177\230\180\158",
            pos = {x = 246.37537196433382, y = 688.2837026875374},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10109501,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17217255028927777"] = {
            key = "17217255028927777",
            type = "WaitOfTimeNode",
            name = "0.5",
            pos = {x = -21.555294309286637, y = 687.453159843412},
            propsData = {WaitTime = 0.5}
          },
          ["17217255028927779"] = {
            key = "17217255028927779",
            type = "TalkNode",
            name = "\230\136\145\228\187\172\229\136\176\228\186\134",
            pos = {x = 554.6876880185466, y = 761.6381409461281},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10109601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17217255028927780"] = {
            key = "17217255028927780",
            type = "WaitOfTimeNode",
            name = "0.5",
            pos = {x = 546.7955060282109, y = 907.0018463197019},
            propsData = {WaitTime = 0.5}
          },
          ["17217255349168933"] = {
            key = "17217255349168933",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = -145.16477428155792, y = 1177.1918532436737},
            propsData = {}
          },
          ["17258718663879929"] = {
            key = "17258718663879929",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144 \232\181\155\231\144\170AI3\229\143\183",
            pos = {x = -366.31613440073403, y = 563.8355688523145},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240395}
            }
          },
          ["17258718663879931"] = {
            key = "17258718663879931",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 318.57742311202304, y = 557.5554900887446},
            propsData = {
              MessageType = "BehaviorTree",
              MessageContent = "Follow",
              UnitId = 200006
            }
          },
          ["17259367185053524"] = {
            key = "17259367185053524",
            type = "ActivePlayerSkillsNode",
            name = "\229\133\179\233\151\173 \230\148\187\229\135\187\230\148\190\230\138\128\232\131\189",
            pos = {x = -256.31199235547047, y = 867.9125656951744},
            propsData = {
              PlayerId = 0,
              bActiveEnable = false,
              ActiveType = "Lock",
              SkillNameList = {
                "Jump",
                "Slide",
                "BulletJump"
              }
            }
          },
          ["17551687990423975622"] = {
            key = "17551687990423975622",
            type = "WaitOfTimeNode",
            name = "1",
            pos = {x = -35.622549628879725, y = 548.1408723975901},
            propsData = {WaitTime = 1}
          }
        },
        commentData = {}
      }
    },
    ["172172556495710133"] = {
      isStoryNode = true,
      key = "172172556495710133",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 1847.2885696944659, y = 312.7196251905468},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "QuestName_10020610",
        QuestDeatil = "QuestDesc_10020610",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = true,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = false,
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
            startQuest = "172172556495710137",
            startPort = "QuestStart",
            endQuest = "172172556495710145",
            endPort = "In"
          },
          {
            startQuest = "172172556495710145",
            startPort = "Out",
            endQuest = "172172556495710139",
            endPort = "Fail"
          },
          {
            startQuest = "17258711021197259",
            startPort = "Out",
            endQuest = "17258711021197260",
            endPort = "In"
          },
          {
            startQuest = "17258711021197260",
            startPort = "Out",
            endQuest = "17258711021197261",
            endPort = "In"
          },
          {
            startQuest = "17258711021197258",
            startPort = "Out",
            endQuest = "17258711021197259",
            endPort = "In"
          },
          {
            startQuest = "17258711021197261",
            startPort = "Out",
            endQuest = "172172563595711609",
            endPort = "In"
          },
          {
            startQuest = "172172561366010934",
            startPort = "Out",
            endQuest = "17258711021197258",
            endPort = "In"
          },
          {
            startQuest = "172172561366010933",
            startPort = "Out",
            endQuest = "172587198613111088",
            endPort = "In"
          },
          {
            startQuest = "172587198613111088",
            startPort = "Out",
            endQuest = "172172561366010934",
            endPort = "In"
          },
          {
            startQuest = "172172556495710137",
            startPort = "QuestStart",
            endQuest = "172172561366010933",
            endPort = "In"
          }
        },
        nodeData = {
          ["172172556495710137"] = {
            key = "172172556495710137",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -585.2188132267506, y = 788.064090829079},
            propsData = {ModeType = 0}
          },
          ["172172556495710138"] = {
            key = "172172556495710138",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1323.6427265414197, y = 817.8732396848898},
            propsData = {ModeType = 0}
          },
          ["172172556495710139"] = {
            key = "172172556495710139",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1312.7121239800288, y = 1144.4665083424673},
            propsData = {}
          },
          ["172172556495710145"] = {
            key = "172172556495710145",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 12.91214879536517, y = 1125.2687763205968},
            propsData = {}
          },
          ["172172561366010933"] = {
            key = "172172561366010933",
            type = "PickUpNode",
            name = "\230\140\150\229\156\159\239\188\136\230\151\167\233\133\141\231\189\174\239\188\137",
            pos = {x = -219.72585505099397, y = 697.8807802310143},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1240675},
              QuestPickupId = -1,
              UnitId = 10016,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_Dig",
              IsUseCount = false
            }
          },
          ["172172561366010934"] = {
            key = "172172561366010934",
            type = "TalkNode",
            name = "\230\140\150\229\136\176\228\186\134\239\188\136\232\189\172\229\141\176\232\177\161\239\188\137",
            pos = {x = 306.8913576412536, y = 692.5416330894377},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10109701,
              FlowAssetPath = "",
              TalkType = "FixSimple",
              TalkStageName = "Stage_101097",
              BlendInTime = 0.5,
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
              EndNewTargetPointName = "QuestPoint_SaiqiWalkStart",
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
                  TalkActorId = 200006,
                  TalkActorVisible = true
                }
              },
              RemoveTalkActors = {
                {TalkActorType = "Player", TalkActorId = 0},
                {TalkActorType = "Npc", TalkActorId = 100001},
                {TalkActorType = "Npc", TalkActorId = 200006}
              },
              OptionType = "normal",
              FreezeWorldComposition = false,
              bTravelFullLoadWorldComposition = false,
              SwitchToMaster = "None",
              NormalOptions = {},
              OverrideFailBlend = false
            }
          },
          ["172172563595711609"] = {
            key = "172172563595711609",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 909.6415108709366, y = 792.7196251905469},
            propsData = {}
          },
          ["17258711021197258"] = {
            key = "17258711021197258",
            type = "RestoreRoleNode",
            name = "\230\129\162\229\164\141\232\167\146\232\137\178",
            pos = {x = 587.0970112252596, y = 631.8350436675829},
            propsData = {}
          },
          ["17258711021197259"] = {
            key = "17258711021197259",
            type = "ActivePlayerSkillsNode",
            name = "\229\133\179\233\151\173 \230\148\187\229\135\187\230\148\190\230\138\128\232\131\189",
            pos = {x = 810.3358355588201, y = 633.6681947270498},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Lock",
              SkillNameList = {
                "Attack",
                "Skill1",
                "Skill2",
                "Skill3",
                "FallAttack",
                "SlideAttack",
                "Fire",
                "Avoid",
                "HeavyAttack",
                "FireInAir",
                "Slide",
                "Jump",
                "BulletJump"
              }
            }
          },
          ["17258711021197260"] = {
            key = "17258711021197260",
            type = "ForbidWeaponByWeaponTagNode",
            name = "\231\166\129\231\148\168/\229\144\175\231\148\168\230\173\166\229\153\168\232\138\130\231\130\185",
            pos = {x = 1047.1965327563594, y = 634.2925282882252},
            propsData = {
              WeaponTags = {"Melee"},
              bForbid = false,
              ForbidTag = "ForbidDefault",
              bHidewhenForbid = true
            }
          },
          ["17258711021197261"] = {
            key = "17258711021197261",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI",
            pos = {x = 1277.1803982074143, y = 636.160410877872},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          ["172587198613111088"] = {
            key = "172587198613111088",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144 \232\181\155\231\144\170AI3\229\143\183\229\146\140\230\140\150\229\156\159\231\169\186Npc",
            pos = {x = 50.070401553101995, y = 691.495451770452},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240395}
            }
          },
          ["17439122888222098163"] = {
            key = "17439122888222098163",
            type = "WaitImpressionTalkCompleteNode",
            name = "\231\173\137\229\190\133\229\141\176\232\177\161\229\175\185\232\175\157\229\174\140\230\136\144",
            pos = {x = -193.52898550724657, y = 366.66666666666663},
            propsData = {
              ImpressionTalkTriggerId = 500059,
              bShowGuide = false,
              GuideType = "P",
              NPCStaticCreaterName = "QuestPoint_Dig"
            }
          },
          ["17439139280532100017"] = {
            key = "17439139280532100017",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\230\140\150\229\156\159\231\169\186npc",
            pos = {x = 58.52785305181186, y = 375.8612836438924},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1240662}
            }
          },
          ["17439139459392100357"] = {
            key = "17439139459392100357",
            type = "WaitOfTimeNode",
            name = "\231\173\1371S\239\188\140\229\188\185\231\155\184\230\156\186\229\188\149\229\175\188",
            pos = {x = 328.1645962732918, y = 360.60248447204975},
            propsData = {WaitTime = 1}
          },
          ["17439205362498395563"] = {
            key = "17439205362498395563",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\229\188\128",
            pos = {x = 66.46663116992946, y = 926.7646224506794},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "QuestPoint_Dig"
            }
          },
          ["17439205476828395828"] = {
            key = "17439205476828395828",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\229\133\179",
            pos = {x = 329.7999645032628, y = 940.0979557840128},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "QuestPoint_Dig"
            }
          }
        },
        commentData = {}
      }
    },
    ["17549110221711124236"] = {
      isStoryNode = true,
      key = "17549110221711124236",
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
    ["17549110221711124237"] = {
      isStoryNode = true,
      key = "17549110221711124237",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2243.374613003096, y = 322.1981424148607},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    }
  },
  commentData = {}
}
