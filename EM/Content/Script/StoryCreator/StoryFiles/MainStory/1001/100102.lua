return {
  storyName = "\232\128\129\229\164\180\231\142\175",
  storyDescription = "",
  lineData = {
    {
      startStory = "story_1686552484572412",
      startPort = "Success",
      endStory = "story_16868180016481293",
      endPort = "In"
    },
    {
      startStory = "story_16868180016481293",
      startPort = "Success",
      endStory = "story_16868180169661313",
      endPort = "In"
    },
    {
      startStory = "story_16868180169661313",
      startPort = "Success",
      endStory = "story_16868180231871329",
      endPort = "In"
    },
    {
      startStory = "story_16868180231871329",
      startPort = "Success",
      endStory = "story_16868180292491345",
      endPort = "In"
    },
    {
      startStory = "story_16868180432221385",
      startPort = "Success",
      endStory = "story_16868180488441401",
      endPort = "In"
    },
    {
      startStory = "story_1686819708760859",
      startPort = "Success",
      endStory = "story_1686819708761890",
      endPort = "In"
    },
    {
      startStory = "story_1686819708761890",
      startPort = "Success",
      endStory = "story_1686552484572412",
      endPort = "In"
    },
    {
      startStory = "story_1684737182557546",
      startPort = "StoryStart",
      endStory = "story_1686819708762921",
      endPort = "In"
    },
    {
      startStory = "story_1686819708762921",
      startPort = "Success",
      endStory = "story_1686819708760859",
      endPort = "In"
    },
    {
      startStory = "story_16868180362901369",
      startPort = "Success",
      endStory = "story_16868180432221385",
      endPort = "In"
    },
    {
      startStory = "story_16868180292491345",
      startPort = "Success",
      endStory = "story_16868180362901369",
      endPort = "In"
    },
    {
      startStory = "story_16868180488441401",
      startPort = "Success",
      endStory = "story_1684737182557548",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    story_1684737182557546 = {
      isStoryNode = true,
      key = "story_1684737182557546",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 90.06446792724459, y = -47.43936908944136},
      propsData = {QuestChainId = 100102},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_1684737182557548 = {
      isStoryNode = true,
      key = "story_1684737182557548",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1372.029435185054, y = 366.55241043622783},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    story_1686552484572412 = {
      isStoryNode = true,
      key = "story_1686552484572412",
      type = "StoryNode",
      name = "\229\157\144\231\148\181\230\162\175",
      pos = {x = 1578.3794896961374, y = -50.00517597210094},
      propsData = {
        QuestId = 10010205,
        QuestDescriptionComment = "\228\185\152\229\157\144\229\141\135\233\153\141\230\156\186",
        QuestDescription = "Description_100102_3",
        QuestDeatil = "Description_100102_3",
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
        SubRegionId = 100101,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_Elevator"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "quest_1686551516406624",
            startPort = "Out",
            endQuest = "quest_16854152113881139",
            endPort = "In"
          },
          {
            startQuest = "quest_1686551516406624",
            startPort = "Out",
            endQuest = "quest_1686551807213630",
            endPort = "In"
          },
          {
            startQuest = "quest_1685414919094944",
            startPort = "QuestStart",
            endQuest = "quest_16914040798541069",
            endPort = "In"
          },
          {
            startQuest = "17412489702022323",
            startPort = "Out",
            endQuest = "quest_1685414919094946",
            endPort = "Success"
          },
          {
            startQuest = "17412489878792871",
            startPort = "Out",
            endQuest = "17412564309913344325",
            endPort = "In"
          },
          {
            startQuest = "17412489831942729",
            startPort = "Out",
            endQuest = "17412564309913344325",
            endPort = "In"
          },
          {
            startQuest = "quest_1686551807213630",
            startPort = "Out",
            endQuest = "174532525150225441258",
            endPort = "In"
          },
          {
            startQuest = "quest_1685414919094944",
            startPort = "QuestStart",
            endQuest = "quest_1686551516406624",
            endPort = "In"
          },
          {
            startQuest = "174532525150225441258",
            startPort = "Out",
            endQuest = "17412489702022323",
            endPort = "In"
          }
        },
        nodeData = {
          quest_1685414919094944 = {
            key = "quest_1685414919094944",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100, y = 140},
            propsData = {ModeType = 0}
          },
          quest_1685414919094946 = {
            key = "quest_1685414919094946",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1733.5979020979014, y = 194.52505827505826},
            propsData = {ModeType = 0}
          },
          quest_1685414919094948 = {
            key = "quest_1685414919094948",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1502.6363636363635, y = 502.3636363636363},
            propsData = {}
          },
          quest_16854152113881139 = {
            key = "quest_16854152113881139",
            type = "TalkNode",
            name = "\232\142\178\229\166\136-100114-\228\187\165\229\137\141\230\156\137\233\163\158\232\137\135",
            pos = {x = 740.8189096723995, y = -224.93998944326225},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10011401,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = true,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          quest_1686551516406624 = {
            key = "quest_1686551516406624",
            type = "ElevatorNode",
            name = "\228\184\142\231\148\181\230\162\175\228\186\164\228\186\146",
            pos = {x = 612.5901985702582, y = 152.87245697330394},
            propsData = {
              bGuideUIEnable = true,
              GuideType = "P",
              GuideDisplayName = "QuestPoint_Elevator",
              ElevatorId = 990102,
              ElevatorState = "StartUp"
            }
          },
          quest_1686551807213630 = {
            key = "quest_1686551807213630",
            type = "ElevatorNode",
            name = "\231\148\181\230\162\175\229\129\156\228\186\134",
            pos = {x = 861.4105942087972, y = 148.2651218818116},
            propsData = {
              bGuideUIEnable = false,
              GuideType = "P",
              GuideDisplayName = "",
              ElevatorId = 990102,
              ElevatorState = "StopUp"
            }
          },
          quest_16914040798541069 = {
            key = "quest_16914040798541069",
            type = "TalkNode",
            name = "\232\142\178\229\166\136-100113-\229\137\145\230\152\175\233\146\165\229\140\153",
            pos = {x = 452.1192574423042, y = -212.48139685276848},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10011301,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = true,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17412489702022323"] = {
            key = "17412489702022323",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1442.496336440164, y = 181.20120084102595},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 100102,
              bGuideUIEnable = false,
              GuideType = "P",
              GuideName = "QuestPoint_BalconyDoor"
            }
          },
          ["17412489831942729"] = {
            key = "17412489831942729",
            type = "GoToNode",
            name = "\229\166\130\230\158\156\229\155\158\230\157\145\229\186\132",
            pos = {x = 1043.4108592100858, y = -287.43545882592},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1590276,
              GuideType = "M",
              GuidePointName = "Mechanism_10010205_1590276"
            }
          },
          ["17412489878792871"] = {
            key = "17412489878792871",
            type = "GoToNode",
            name = "\229\166\130\230\158\156\229\157\144\231\148\181\230\162\175\228\184\139\229\142\187\228\186\134",
            pos = {x = 1039.6519988325936, y = -10.483096040394585},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1590275,
              GuideType = "M",
              GuidePointName = "Mechanism_10010205back2_1590275"
            }
          },
          ["17412564309913344325"] = {
            key = "17412564309913344325",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = 1423.993516495104, y = -9.53891485343675},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 100102,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_BalconyDoor"
            }
          },
          ["174532525150225441258"] = {
            key = "174532525150225441258",
            type = "CreatePhantomNode",
            name = "\233\148\128\230\175\129\229\165\179\228\184\187",
            pos = {x = 1133.366988650339, y = 194.5361161635543},
            propsData = {
              IsCreate = false,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1590287}
            }
          },
          ["174532525150225441259"] = {
            key = "174532525150225441259",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164\229\165\179\228\184\187",
            pos = {x = 1256.6266182751906, y = 404.7142219027069},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = true,
              StaticCreatorIdList = {1570202}
            }
          }
        },
        commentData = {}
      }
    },
    story_16868180016481293 = {
      isStoryNode = true,
      key = "story_16868180016481293",
      type = "StoryNode",
      name = "\229\188\128\233\151\168",
      pos = {x = 447.55338514801537, y = 127.85814070296688},
      propsData = {
        QuestId = 10010206,
        QuestDescriptionComment = "\230\137\147\229\188\128\233\129\151\232\191\185\231\154\132\233\151\168",
        QuestDescription = "Description_100102_4",
        QuestDeatil = "Description_100102_4",
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
        SubRegionId = 100102,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_BalconyDoor"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "quest_1694142034518801",
            startPort = "Out",
            endQuest = "quest_1694142034518804",
            endPort = "In"
          },
          {
            startQuest = "quest_1694142034518804",
            startPort = "Out",
            endQuest = "quest_16854164796112223",
            endPort = "Success"
          },
          {
            startQuest = "1711443008024154935",
            startPort = "Out",
            endQuest = "quest_1694142034518801",
            endPort = "In"
          },
          {
            startQuest = "quest_16854169581542267",
            startPort = "Out",
            endQuest = "17431308007446445",
            endPort = "In"
          },
          {
            startQuest = "17431308007446445",
            startPort = "Out",
            endQuest = "1711443008024154935",
            endPort = "In"
          },
          {
            startQuest = "17467728893823654485",
            startPort = "Out",
            endQuest = "1744376515788811992",
            endPort = "In"
          },
          {
            startQuest = "quest_16854164796112221",
            startPort = "QuestStart",
            endQuest = "17564516884403532",
            endPort = "In"
          },
          {
            startQuest = "17564516884403532",
            startPort = "Out",
            endQuest = "17467728893823654485",
            endPort = "In"
          },
          {
            startQuest = "quest_16854164796112221",
            startPort = "QuestStart",
            endQuest = "quest_16854169581542267",
            endPort = "In"
          }
        },
        nodeData = {
          quest_16854164796112221 = {
            key = "quest_16854164796112221",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -122.43421052631578, y = 224.67105263157893},
            propsData = {ModeType = 0}
          },
          quest_16854164796112223 = {
            key = "quest_16854164796112223",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1722, y = 141.5},
            propsData = {ModeType = 0}
          },
          quest_16854164796112225 = {
            key = "quest_16854164796112225",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          quest_16854169581542267 = {
            key = "quest_16854169581542267",
            type = "MiniGameOpenGateNode",
            name = "\229\174\140\230\136\144\229\188\128\233\151\168\229\176\143\230\184\184\230\136\143",
            pos = {x = 196.8793921199949, y = 234.863932699886},
            propsData = {
              StaticCreatorId = 9902011,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_BalconyDoor"
            }
          },
          quest_1694142034518801 = {
            key = "quest_1694142034518801",
            type = "PlayOrStopBGMNode",
            name = "BGM - nvshenxiang - end",
            pos = {x = 1193.6720364779553, y = 160.65339231663097},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          quest_1694142034518804 = {
            key = "quest_1694142034518804",
            type = "PlayOrStopBGMNode",
            name = "BGM - shendianyiji - start",
            pos = {x = 1419.163649902168, y = 161.63224376312115},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "/Game/Asset/Audio/FMOD/Events/bgm/cbt01/0006_atmos_shendianyiji",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["1711443008024154935"] = {
            key = "1711443008024154935",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144\231\142\175\229\162\131\230\128\170",
            pos = {x = 925.9851177404272, y = 155.82940388458132},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                990296,
                990297,
                990298,
                990299,
                990287,
                990288,
                1570182,
                1570183,
                1570184,
                1570185
              }
            }
          },
          ["17431308007446445"] = {
            key = "17431308007446445",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 680.6052585469158, y = 169.38859287264484},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Prologue_Balcony_EnterBuilding",
              UnitId = -1
            }
          },
          ["1744376515788811992"] = {
            key = "1744376515788811992",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = 774.9411376286121, y = 17.75974562484595},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17467728893823654485"] = {
            key = "17467728893823654485",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 444.7642857142857, y = 19.06044941900202},
            propsData = {WaitTime = 2}
          },
          ["17564516884403532"] = {
            key = "17564516884403532",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164\229\165\179\228\184\187",
            pos = {x = 136.03211986238114, y = 49.45440587955011},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {1570202}
            }
          }
        },
        commentData = {}
      }
    },
    story_16868180169661313 = {
      isStoryNode = true,
      key = "story_16868180169661313",
      type = "StoryNode",
      name = "\229\164\167\231\128\145\229\184\131",
      pos = {x = 749.8317915205463, y = 129.02910158621964},
      propsData = {
        QuestId = 10010207,
        QuestDescriptionComment = "\230\142\162\231\180\162\233\129\151\232\191\185\239\188\140\229\175\187\230\137\190\233\163\158\232\137\135",
        QuestDescription = "Description_100102_5",
        QuestDeatil = "Description_100102_5",
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
        SubRegionId = 100102,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "QuestTrigger10402"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "quest_168542892951987",
            startPort = "Out",
            endQuest = "169865654809636140",
            endPort = "In"
          },
          {
            startQuest = "169873912560565582",
            startPort = "Out",
            endQuest = "1704175979086184660",
            endPort = "Success"
          },
          {
            startQuest = "quest_168542892951987",
            startPort = "Out",
            endQuest = "169873912560565582",
            endPort = "In"
          },
          {
            startQuest = "1704175979086184659",
            startPort = "QuestStart",
            endQuest = "quest_168542892951987",
            endPort = "In"
          },
          {
            startQuest = "1704175979086184659",
            startPort = "QuestStart",
            endQuest = "17467729004913654959",
            endPort = "In"
          },
          {
            startQuest = "17467729004913654959",
            startPort = "Out",
            endQuest = "1744376519719812178",
            endPort = "In"
          }
        },
        nodeData = {
          quest_168542892951987 = {
            key = "quest_168542892951987",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 692.4033613445379, y = 156.56302521008405},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010402,
              GuideType = "M",
              GuidePointName = "QuestTrigger10402"
            }
          },
          ["169865654809636140"] = {
            key = "169865654809636140",
            type = "TalkNode",
            name = "\232\142\178\229\166\136-100125-\232\191\153\228\186\155\230\174\139\233\170\184",
            pos = {x = 881.9106884859212, y = 342.9582559339535},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10025801,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = true,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["169873912560565582"] = {
            key = "169873912560565582",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1687.413012477717, y = 142.2598930481285},
            propsData = {WaitTime = 0.5}
          },
          ["1704175979086184659"] = {
            key = "1704175979086184659",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100, y = 140},
            propsData = {ModeType = 0}
          },
          ["1704175979086184660"] = {
            key = "1704175979086184660",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2042.4545454545455, y = 128.27272727272728},
            propsData = {ModeType = 0}
          },
          ["1704175979086184661"] = {
            key = "1704175979086184661",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1696, y = 637},
            propsData = {}
          },
          ["1744376519719812178"] = {
            key = "1744376519719812178",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = 566.1266711217972, y = 330.2514923530641},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17467729004913654959"] = {
            key = "17467729004913654959",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 301.32668067226894, y = 345.211229946524},
            propsData = {WaitTime = 2}
          }
        },
        commentData = {}
      }
    },
    story_16868180231871329 = {
      isStoryNode = true,
      key = "story_16868180231871329",
      type = "StoryNode",
      name = "\229\176\143\231\128\145\229\184\131",
      pos = {x = 1033.348896808633, y = 138.45897103356995},
      propsData = {
        QuestId = 10010208,
        QuestDescriptionComment = "\230\142\162\231\180\162\233\129\151\232\191\185\239\188\140\229\175\187\230\137\190\233\163\158\232\137\135",
        QuestDescription = "Description_100102_5",
        QuestDeatil = "Description_100102_5",
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
        SubRegionId = 100102,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "QuestTrigger10403"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1701831031991126429",
            startPort = "Out",
            endQuest = "1704175979086184663",
            endPort = "Success"
          },
          {
            startQuest = "quest_168542915316494",
            startPort = "Out",
            endQuest = "1711443359318160400",
            endPort = "In"
          },
          {
            startQuest = "1711443359318160400",
            startPort = "Out",
            endQuest = "1701831031991126429",
            endPort = "In"
          },
          {
            startQuest = "1704175979086184662",
            startPort = "QuestStart",
            endQuest = "17467729128063655509",
            endPort = "In"
          },
          {
            startQuest = "1704175979086184662",
            startPort = "QuestStart",
            endQuest = "quest_168542915316494",
            endPort = "In"
          },
          {
            startQuest = "17467729128063655509",
            startPort = "Out",
            endQuest = "1744376525014812407",
            endPort = "In"
          }
        },
        nodeData = {
          quest_168542915316494 = {
            key = "quest_168542915316494",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 386.7360248447205, y = 59.596273291925456},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010403,
              GuideType = "M",
              GuidePointName = "QuestTrigger10403"
            }
          },
          ["1701831031991126429"] = {
            key = "1701831031991126429",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 908.6579261554805, y = 73.51002680736757},
            propsData = {WaitTime = 0.5}
          },
          ["1704175979086184662"] = {
            key = "1704175979086184662",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -129.56521739130437, y = -0.8695652173913118},
            propsData = {ModeType = 0}
          },
          ["1704175979086184663"] = {
            key = "1704175979086184663",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1183.5465838509313, y = 65.27018633540371},
            propsData = {ModeType = 0}
          },
          ["1704175979086184664"] = {
            key = "1704175979086184664",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1272, y = 441},
            propsData = {}
          },
          ["1711443359318160400"] = {
            key = "1711443359318160400",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144 \233\128\131\232\183\145\230\128\170",
            pos = {x = 655.1279748832842, y = 61.54368959886705},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                990294,
                1570180,
                1570181
              }
            }
          },
          ["1744376525014812407"] = {
            key = "1744376525014812407",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = 364.05880874263454, y = 216.35385397075083},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17467729128063655509"] = {
            key = "17467729128063655509",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 89.48880105401878, y = 199.1616161616162},
            propsData = {WaitTime = 2}
          }
        },
        commentData = {}
      }
    },
    story_16868180292491345 = {
      isStoryNode = true,
      key = "story_16868180292491345",
      type = "StoryNode",
      name = "\231\148\159\230\180\187\229\140\186",
      pos = {x = 1326.3492445025574, y = 128.51269070955624},
      propsData = {
        QuestId = 10010209,
        QuestDescriptionComment = "\230\142\162\231\180\162\233\129\151\232\191\185\239\188\140\229\175\187\230\137\190\233\163\158\232\137\135",
        QuestDescription = "Description_100102_5",
        QuestDeatil = "Description_100102_5",
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
        SubRegionId = 100102,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "Mechanism_prologue10010209_1570179"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1704175979086184668",
            startPort = "Out",
            endQuest = "quest_1685429387391115",
            endPort = "In"
          },
          {
            startQuest = "quest_1685429578952108",
            startPort = "Out",
            endQuest = "1704175979086184666",
            endPort = "Success"
          },
          {
            startQuest = "1704175979086184668",
            startPort = "Out",
            endQuest = "quest_1685429578952108",
            endPort = "In"
          },
          {
            startQuest = "174297784963712938",
            startPort = "Out",
            endQuest = "1704175979086184668",
            endPort = "In"
          },
          {
            startQuest = "1704175979086184665",
            startPort = "QuestStart",
            endQuest = "17467729264903656092",
            endPort = "In"
          },
          {
            startQuest = "17467729264903656092",
            startPort = "Out",
            endQuest = "1744376531231812669",
            endPort = "In"
          },
          {
            startQuest = "1704175979086184665",
            startPort = "QuestStart",
            endQuest = "174297784963712938",
            endPort = "In"
          }
        },
        nodeData = {
          quest_1685429387391115 = {
            key = "quest_1685429387391115",
            type = "TalkNode",
            name = "\232\142\178\229\166\136-100124-\229\165\189\229\131\143\230\156\137\228\186\186\231\148\159\230\180\187\232\191\135",
            pos = {x = 1130.7656571486277, y = 306.77777777777777},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10012401,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = true,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          quest_1685429578952108 = {
            key = "quest_1685429578952108",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1132.2608695652175, y = 162.8695652173913},
            propsData = {WaitTime = 1}
          },
          ["1704175979086184665"] = {
            key = "1704175979086184665",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -26.428571428571445, y = 138.92857142857142},
            propsData = {ModeType = 0}
          },
          ["1704175979086184666"] = {
            key = "1704175979086184666",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1464.3478260869565, y = 169.3913043478261},
            propsData = {ModeType = 0}
          },
          ["1704175979086184667"] = {
            key = "1704175979086184667",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1272, y = 441},
            propsData = {}
          },
          ["1704175979086184668"] = {
            key = "1704175979086184668",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 839.8809523809523, y = 159.3730158730159},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010404,
              GuideType = "M",
              GuidePointName = "QuestTrigger10404"
            }
          },
          ["174297784963712938"] = {
            key = "174297784963712938",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 552.9537941633531, y = 167.0048786997319},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1570179,
              GuideType = "M",
              GuidePointName = "Mechanism_prologue10010209_1570179"
            }
          },
          ["1744376531231812669"] = {
            key = "1744376531231812669",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = 455.24516478634337, y = 346.51024375655203},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17467729264903656092"] = {
            key = "17467729264903656092",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 167.81600474436024, y = 339.46807434660974},
            propsData = {WaitTime = 2}
          }
        },
        commentData = {}
      }
    },
    story_16868180362901369 = {
      isStoryNode = true,
      key = "story_16868180362901369",
      type = "StoryNode",
      name = "\229\174\158\233\170\140\229\174\164",
      pos = {x = 488.6449081330725, y = 332.7901916828714},
      propsData = {
        QuestId = 10010210,
        QuestDescriptionComment = "\230\142\162\231\180\162\233\129\151\232\191\185\239\188\140\229\175\187\230\137\190\233\163\158\232\137\135",
        QuestDescription = "Description_100102_5",
        QuestDeatil = "Description_100102_5",
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
        SubRegionId = 100102,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "QuestTrigger10410"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "17169632764697495",
            startPort = "Out",
            endQuest = "17169634146479280",
            endPort = "In"
          },
          {
            startQuest = "17169634146479280",
            startPort = "Out",
            endQuest = "17169632764697495",
            endPort = "In"
          },
          {
            startQuest = "1730210615257819276",
            startPort = "Out",
            endQuest = "1730210608449819020",
            endPort = "In"
          },
          {
            startQuest = "1730210608449819020",
            startPort = "Out",
            endQuest = "1704175979086184670",
            endPort = "Success"
          },
          {
            startQuest = "quest_1685429793340114",
            startPort = "Out",
            endQuest = "17431312410818770",
            endPort = "In"
          },
          {
            startQuest = "17431312410818770",
            startPort = "Out",
            endQuest = "1730210615257819276",
            endPort = "In"
          },
          {
            startQuest = "1704175979086184669",
            startPort = "QuestStart",
            endQuest = "quest_1685429793340114",
            endPort = "In"
          },
          {
            startQuest = "1704175979086184669",
            startPort = "QuestStart",
            endQuest = "17467729394983656671",
            endPort = "In"
          },
          {
            startQuest = "17467729394983656671",
            startPort = "Out",
            endQuest = "1744376538618812988",
            endPort = "In"
          }
        },
        nodeData = {
          quest_1685429793340114 = {
            key = "quest_1685429793340114",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = -303.8645933014355, y = 234.57628458498027},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010410,
              GuideType = "M",
              GuidePointName = "QuestTrigger10410"
            }
          },
          ["1704175979086184669"] = {
            key = "1704175979086184669",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -636.3636363636363, y = 223.86363636363635},
            propsData = {ModeType = 0}
          },
          ["1704175979086184670"] = {
            key = "1704175979086184670",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 706.3636363636364, y = 214.28229665071774},
            propsData = {ModeType = 0}
          },
          ["1704175979086184671"] = {
            key = "1704175979086184671",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 429.47368421052624, y = 507.36842105263156},
            propsData = {}
          },
          ["17169632764697495"] = {
            key = "17169632764697495",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = -340.8393369788105, y = 491.34842788790155},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010405,
              GuideType = "P",
              GuidePointName = "QuestArea_Mod"
            }
          },
          ["17169634146479280"] = {
            key = "17169634146479280",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = -350.91660970608314, y = 676.8029733424471},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010410,
              GuideType = "P",
              GuidePointName = "QuestArea_Mod2"
            }
          },
          ["1730210608449819020"] = {
            key = "1730210608449819020",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 446.28619752168623, y = 219.46915283083865},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                990292,
                990293,
                990295,
                990290,
                990289,
                1570186,
                1570187,
                1570188,
                1570189,
                1570190,
                1570191
              }
            }
          },
          ["1730210615257819276"] = {
            key = "1730210615257819276",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 227.76945111020342, y = 224.6844638356234},
            propsData = {WaitTime = 0.5}
          },
          ["17431312410818770"] = {
            key = "17431312410818770",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -27.77043544690619, y = 243.84151142974653},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "Prologue_Balcony_FinishSearch",
              UnitId = -1
            }
          },
          ["1744376538618812988"] = {
            key = "1744376538618812988",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = -130.36107916292522, y = 43.58692551074655},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17467729394983656671"] = {
            key = "17467729394983656671",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -424.9390848282155, y = 45.00438596491216},
            propsData = {WaitTime = 2}
          }
        },
        commentData = {}
      }
    },
    story_16868180432221385 = {
      isStoryNode = true,
      key = "story_16868180432221385",
      type = "StoryNode",
      name = "\229\142\187\232\128\129\229\164\180\231\142\175\231\154\132\232\183\175\228\184\138",
      pos = {x = 763.2461655833488, y = 347.867489165591},
      propsData = {
        QuestId = 10010212,
        QuestDescriptionComment = "\230\142\162\231\180\162\233\129\151\232\191\185\239\188\140\229\175\187\230\137\190\233\163\158\232\137\135",
        QuestDescription = "Description_100102_5",
        QuestDeatil = "Description_100102_5",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = false,
        bIsNotifyGameMode = false,
        bIsStartChapter = false,
        bIsEndChapter = false,
        bIsShowOnComplete = true,
        bIsPlayBlackScreenOnComplete = true,
        bIsPlayBlackScreenOnFail = false,
        bIsDynamicEvent = false,
        ResurgencePoint = "",
        bUseQuestCoordinate = false,
        bDeadTriggerQuestFail = false,
        IsFairyLand = false,
        SubRegionId = 100102,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "QuestTrigger10406"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1704175979086184675",
            startPort = "Out",
            endQuest = "quest_1689153085423343",
            endPort = "In"
          },
          {
            startQuest = "quest_1689153085423343",
            startPort = "Out",
            endQuest = "1704175979086184673",
            endPort = "Success"
          },
          {
            startQuest = "1704175979086184672",
            startPort = "QuestStart",
            endQuest = "1704175979086184675",
            endPort = "In"
          },
          {
            startQuest = "1704175979086184672",
            startPort = "QuestStart",
            endQuest = "17467729504283657123",
            endPort = "In"
          },
          {
            startQuest = "17467729504283657123",
            startPort = "Out",
            endQuest = "1744376542621813165",
            endPort = "In"
          }
        },
        nodeData = {
          quest_1689153085423343 = {
            key = "quest_1689153085423343",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 1335.0448187440588, y = 171.3149632823418},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010407,
              GuideType = "M",
              GuidePointName = "QuestTrigger10407"
            }
          },
          quest_1694078148115388 = {
            key = "quest_1694078148115388",
            type = "PlayOrStopBGMNode",
            name = "BGM - shendianyiji - end",
            pos = {x = 1123.1774642999287, y = -193.57129110824516},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["1704175979086184672"] = {
            key = "1704175979086184672",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100, y = 140},
            propsData = {ModeType = 0}
          },
          ["1704175979086184673"] = {
            key = "1704175979086184673",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1738.5714285714287, y = 155.71428571428572},
            propsData = {ModeType = 0}
          },
          ["1704175979086184674"] = {
            key = "1704175979086184674",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1918.5714285714287, y = 457.14285714285717},
            propsData = {}
          },
          ["1704175979086184675"] = {
            key = "1704175979086184675",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 876.8887634105026, y = 193.34760022586107},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010406,
              GuideType = "M",
              GuidePointName = "QuestTrigger10406"
            }
          },
          ["1744376542621813165"] = {
            key = "1744376542621813165",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = 802.2425868908441, y = -48.212367531757536},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17467729504283657123"] = {
            key = "17467729504283657123",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 472.9151329097358, y = -70.08964500433754},
            propsData = {WaitTime = 2}
          }
        },
        commentData = {}
      }
    },
    story_16868180488441401 = {
      isStoryNode = true,
      key = "story_16868180488441401",
      type = "StoryNode",
      name = "\232\128\129\229\164\180\231\142\175",
      pos = {x = 1036.7138072152475, y = 351.31681763295825},
      propsData = {
        QuestId = 10010213,
        QuestDescriptionComment = "\230\138\181\229\190\161\230\157\165\232\162\173\231\154\132\230\128\170\231\137\169",
        QuestDescription = "Description_100102_6",
        QuestDeatil = "Description_100102_6",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
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
        SubRegionId = 100102,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "QuestTrigger10407"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "quest_1685957264216604",
            startPort = "Out",
            endQuest = "1704175979086184677",
            endPort = "Success"
          },
          {
            startQuest = "quest_1685430628064166",
            startPort = "Out",
            endQuest = "quest_16865518980041057",
            endPort = "In"
          },
          {
            startQuest = "quest_1686030192733221",
            startPort = "Out",
            endQuest = "quest_1685430628064166",
            endPort = "In"
          },
          {
            startQuest = "quest_1685430644485170",
            startPort = "Out",
            endQuest = "quest_1685430767238182",
            endPort = "In"
          },
          {
            startQuest = "quest_16865518980041057",
            startPort = "Out",
            endQuest = "quest_1685430644485170",
            endPort = "In"
          },
          {
            startQuest = "1711443205890158570",
            startPort = "Out",
            endQuest = "quest_1686030192733221",
            endPort = "In"
          },
          {
            startQuest = "quest_1685430767238182",
            startPort = "Out",
            endQuest = "17127191468945459",
            endPort = "In"
          },
          {
            startQuest = "17127191468945459",
            startPort = "Out",
            endQuest = "quest_1685957255699600",
            endPort = "In"
          },
          {
            startQuest = "171288961639097235",
            startPort = "Out",
            endQuest = "1711443205890158570",
            endPort = "In"
          },
          {
            startQuest = "17170601443551252762",
            startPort = "Mobile",
            endQuest = "17170601365251252349",
            endPort = "In"
          },
          {
            startQuest = "17175011977001846830",
            startPort = "Out",
            endQuest = "quest_1685957264216604",
            endPort = "In"
          },
          {
            startQuest = "quest_1685430644485170",
            startPort = "Out",
            endQuest = "17170601443551252762",
            endPort = "Input"
          },
          {
            startQuest = "17170601443551252762",
            startPort = "PC",
            endQuest = "17175011664751719936",
            endPort = "In"
          },
          {
            startQuest = "17175011664751719936",
            startPort = "Out",
            endQuest = "quest_16891498957331960",
            endPort = "In"
          },
          {
            startQuest = "17170601365251252349",
            startPort = "Out",
            endQuest = "17200930945351666752",
            endPort = "In"
          },
          {
            startQuest = "quest_16891498957331960",
            startPort = "Out",
            endQuest = "1717498107654938483",
            endPort = "In"
          },
          {
            startQuest = "17200930945351666752",
            startPort = "Out",
            endQuest = "1717498107654938483",
            endPort = "In"
          },
          {
            startQuest = "1704175979086184676",
            startPort = "QuestStart",
            endQuest = "171288961639097234",
            endPort = "In"
          },
          {
            startQuest = "17127191468945459",
            startPort = "Out",
            endQuest = "17467043185217960",
            endPort = "In"
          },
          {
            startQuest = "17467043185217960",
            startPort = "Out",
            endQuest = "17467081271732318",
            endPort = "In"
          },
          {
            startQuest = "17467081271732318",
            startPort = "Out",
            endQuest = "17175011977001846830",
            endPort = "In"
          },
          {
            startQuest = "171288961639097234",
            startPort = "Out",
            endQuest = "171288961639097235",
            endPort = "In"
          },
          {
            startQuest = "17467729637063657615",
            startPort = "Out",
            endQuest = "1744376547245813386",
            endPort = "In"
          },
          {
            startQuest = "171288961639097234",
            startPort = "Out",
            endQuest = "17467729637063657615",
            endPort = "In"
          }
        },
        nodeData = {
          quest_1685430628064166 = {
            key = "quest_1685430628064166",
            type = "ActivePlayerSkillsNode",
            name = "\230\191\128\230\180\187/\229\164\177\230\149\136 \231\142\169\229\174\182\230\138\128\232\131\189",
            pos = {x = 702.0750988142292, y = 113.13833992094862},
            propsData = {
              PlayerId = 0,
              bActiveEnable = true,
              ActiveType = "Lock",
              SkillNameList = {"Skill1"}
            }
          },
          quest_1685430644485170 = {
            key = "quest_1685430644485170",
            type = "ShowOrHideUINode",
            name = "\230\152\190\231\164\186\230\136\150\233\154\144\232\151\143UI-\230\152\190\231\164\186\232\147\157",
            pos = {x = 1219.3289281765678, y = 117.52710292625717},
            propsData = {
              Function = "HideUIInScreen",
              UIParam = "EnergySkill",
              ActionParam = "None",
              ShowOrHide = false
            }
          },
          quest_1685430740009178 = {
            key = "quest_1685430740009178",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1791.9125797827649, y = 470.6614350229931},
            propsData = {WaitTime = 48}
          },
          quest_1685430767238182 = {
            key = "quest_1685430767238182",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175-LaotouhuanStart",
            pos = {x = 1679.5601994232954, y = 126.43393137237034},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "LaotouhuanStart",
              UnitId = -1
            }
          },
          quest_1685957255699600 = {
            key = "quest_1685957255699600",
            type = "TalkNode",
            name = "\232\142\178\229\166\136-100193-\231\167\189\229\133\189\232\191\152\229\156\168\230\182\140\231\142\176",
            pos = {x = 2570.489765250772, y = 308.3565524873816},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10019301,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = true,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          quest_1685957264216604 = {
            key = "quest_1685957264216604",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 3430.873302377351, y = 19.406132163606337},
            propsData = {WaitTime = 0.5}
          },
          quest_1686030192733221 = {
            key = "quest_1686030192733221",
            type = "ForbidWeaponByWeaponTagNode",
            name = "\231\166\129\231\148\168/\229\144\175\231\148\168\230\173\166\229\153\168\232\138\130\231\130\185",
            pos = {x = 450.9935801691329, y = 113.25523576637556},
            propsData = {
              WeaponTags = {"Ultra"},
              bForbid = false,
              ForbidTag = "ForbidDefault",
              bHidewhenForbid = true
            }
          },
          quest_16865518980041057 = {
            key = "quest_16865518980041057",
            type = "SetPlayerStatusNode",
            name = "\232\174\190\231\189\174\231\142\169\229\174\182\231\138\182\230\128\129",
            pos = {x = 958.1289212181739, y = 112.05024634321465},
            propsData = {
              HPPercent = -1,
              ESPercent = -1,
              SPPercent = 1,
              BuffList = {},
              RecoverPlayer = false
            }
          },
          quest_16891498957331960 = {
            key = "quest_16891498957331960",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 1979.2256671758746, y = -287.2824743235048},
            propsData = {
              MessageId = 200008,
              SkillNameList = {"Skill1"},
              LastTime = -1,
              bIsForceTouch = false,
              bIsTimeDilation = false,
              HighLightUIPath = "",
              UICompName = "",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              ForbidSuccessAnim = false,
              IsNotForceRelease = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          quest_16940703816133006 = {
            key = "quest_16940703816133006",
            type = "PlayOrStopBGMNode",
            name = "BGM - 07- start",
            pos = {x = 1049.5299346823188, y = -291.6025228479763},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "/Game/Asset/Audio/FMOD/Events/bgm/chaper_prologue_temp/07",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["1704175979086184676"] = {
            key = "1704175979086184676",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -652.7272727272727, y = 108.9090909090909},
            propsData = {ModeType = 0}
          },
          ["1704175979086184677"] = {
            key = "1704175979086184677",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 3678.653942663438, y = 7.650160481647987},
            propsData = {ModeType = 0}
          },
          ["1704175979086184678"] = {
            key = "1704175979086184678",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2324, y = 554},
            propsData = {}
          },
          ["1711443205890158570"] = {
            key = "1711443205890158570",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \231\178\190\232\139\177\231\139\153\229\135\187\229\176\143\230\128\170",
            pos = {x = 173.4851177404273, y = 115.32940388458132},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                990201,
                990202,
                1570192,
                1570193,
                1570194,
                1570195,
                1570196
              }
            }
          },
          ["17127191468945459"] = {
            key = "17127191468945459",
            type = "BossBattleFinishNode",
            name = "Gamemode\233\128\187\232\190\145\229\174\140\230\136\144",
            pos = {x = 1992.0213267125034, y = 130.34052711993917},
            propsData = {
              SendMessage = "",
              FinishCondition = "LaotouhuanSuccess"
            }
          },
          ["171288961639097234"] = {
            key = "171288961639097234",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100179-\232\128\129\229\164\180\231\142\175-SC06",
            pos = {x = -402.34323651314673, y = 100.19391119852},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC006/SQ_OBT0100_SC006",
              InType = "BlendIn",
              OutType = "BlendOut",
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
              EndNewTargetPointName = "QuestPoint_Balcony2",
              CameraLookAtTartgetPoint = "QuestPoint_Balcony1",
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
          ["171288961639097235"] = {
            key = "171288961639097235",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\128\170\231\137\169",
            pos = {x = -83.08883177173237, y = 107.32273902706966},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = true,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1570064,
                1570065,
                1570066,
                1570067,
                1570068,
                1570069,
                1570070,
                1570071,
                1570072
              }
            }
          },
          ["17170601365251252349"] = {
            key = "17170601365251252349",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 1729.8112005652627, y = -42.38657080793332},
            propsData = {
              MessageId = 200008,
              SkillNameList = {"Skill1"},
              LastTime = -1,
              bIsForceTouch = false,
              bIsTimeDilation = false,
              HighLightUIPath = "BattleMain.Char_Skill.Skill.CharSkill_1",
              UICompName = "Button_Area",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              ForbidSuccessAnim = false,
              IsNotForceRelease = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17170601443551252762"] = {
            key = "17170601443551252762",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 1456.2332784873406, y = -60.573515442246446},
            propsData = {}
          },
          ["1717498107654938483"] = {
            key = "1717498107654938483",
            type = "ShowOrHideUINode",
            name = "\229\183\166\228\190\167\230\160\143-E\230\138\128\232\131\189",
            pos = {x = 2337.4097619268614, y = -121.72005557485701},
            propsData = {
              Function = "SetContinuedPCGuideVisibility",
              UIParam = "None",
              ActionParam = "Skill1",
              ShowOrHide = false
            }
          },
          ["17175011664751719936"] = {
            key = "17175011664751719936",
            type = "HighlightButtonNode",
            name = "HighlightButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1705.0716704577471, y = -285.1237825884853},
            propsData = {ShowEnable = true, SkillType = "Skill1"}
          },
          ["17175011977001846830"] = {
            key = "17175011977001846830",
            type = "HighlightButtonNode",
            name = "HighlightButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 3067.261349200058, y = 24.98723358832057},
            propsData = {ShowEnable = false, SkillType = "Skill1"}
          },
          ["17200930945351666752"] = {
            key = "17200930945351666752",
            type = "HighlightButtonNode",
            name = "HighlightButton\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 1996.662241752357, y = -44.836938676780036},
            propsData = {ShowEnable = true, SkillType = "Skill1"}
          },
          ["1744376547245813386"] = {
            key = "1744376547245813386",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = 63.207412748591565, y = 328.6881521844609},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17467043185217960"] = {
            key = "17467043185217960",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 2675.5253725410025, y = 47.152290165078085},
            propsData = {WaitTime = 1}
          },
          ["17467081271732318"] = {
            key = "17467081271732318",
            type = "ShowGuideToastNode",
            name = "Toast\230\152\190\231\164\186/\233\154\144\232\151\143\228\191\161\230\129\175",
            pos = {x = 3122.629705236911, y = -116.033445071433},
            propsData = {
              ShowEnable = false,
              MessageId = 200008,
              MessageNote = "",
              LastTime = -1,
              Style = "Normal"
            }
          },
          ["17467729637063657615"] = {
            key = "17467729637063657615",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -169.63824496321354, y = 318.31482882040757},
            propsData = {WaitTime = 2}
          }
        },
        commentData = {}
      }
    },
    story_16868180547101465 = {
      isStoryNode = true,
      key = "story_16868180547101465",
      type = "StoryNode",
      name = "\229\142\187\228\186\145\230\181\183\231\154\132\232\183\175\228\184\138",
      pos = {x = 1265.5709125637113, y = 587.268444786459},
      propsData = {
        QuestId = 10010214,
        QuestDescriptionComment = "\230\142\162\231\180\162\233\129\151\232\191\185\239\188\140\229\175\187\230\137\190\233\163\158\232\137\135",
        QuestDescription = "Description_100102_5",
        QuestDeatil = "Description_100102_5",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = false,
        bIsEndQuest = true,
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
        SubRegionId = 100102,
        StoryGuideType = "Mechanism",
        StoryGuidePointName = "QuestTrigger10408"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "1704175979086184682",
            startPort = "Out",
            endQuest = "1704175979086184680",
            endPort = "Success"
          },
          {
            startQuest = "169864990345913157",
            startPort = "BeginOverlap",
            endQuest = "169864989929312442",
            endPort = "In"
          },
          {
            startQuest = "169864989929312442",
            startPort = "Out",
            endQuest = "169864990345913157",
            endPort = "Input"
          },
          {
            startQuest = "169864990345913157",
            startPort = "EndOverlap",
            endQuest = "169864992959615442",
            endPort = "In"
          },
          {
            startQuest = "169864992959615442",
            startPort = "Out",
            endQuest = "169864990345913157",
            endPort = "Input"
          },
          {
            startQuest = "1704175979086184679",
            startPort = "QuestStart",
            endQuest = "17467729787223658220",
            endPort = "In"
          },
          {
            startQuest = "17467729787223658220",
            startPort = "Out",
            endQuest = "1744376552096813624",
            endPort = "In"
          },
          {
            startQuest = "1704175979086184679",
            startPort = "QuestStart",
            endQuest = "1704175979086184682",
            endPort = "In"
          }
        },
        nodeData = {
          quest_16940705207083010 = {
            key = "quest_16940705207083010",
            type = "PlayOrStopBGMNode",
            name = "BGM - 07- end",
            pos = {x = 938.5157705701503, y = -48.740444841493115},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "/Game/Asset/Audio/FMOD/Events/bgm/chaper_prologue_temp/07",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["169864989929312442"] = {
            key = "169864989929312442",
            type = "PlayOrStopBGMNode",
            name = "BGM - shendianyiji - pause",
            pos = {x = 883.683447749809, y = -174.20630861039947},
            propsData = {SoundStateType = 1, SoundType = 0}
          },
          ["169864990345913157"] = {
            key = "169864990345913157",
            type = "CollisionBoxNode",
            name = "\232\167\166\229\143\145\231\155\146\232\138\130\231\130\185",
            pos = {x = 582.0167810831423, y = -137.53964194373287},
            propsData = {StaticCreatorId = 1110010412}
          },
          ["169864992959615442"] = {
            key = "169864992959615442",
            type = "PlayOrStopBGMNode",
            name = "BGM - shendianyiji - pause",
            pos = {x = 887.0167810831424, y = -55.872975277066175},
            propsData = {SoundStateType = 2, SoundType = 0}
          },
          ["1704175979086184679"] = {
            key = "1704175979086184679",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 96.6909079249669, y = 140},
            propsData = {ModeType = 0}
          },
          ["1704175979086184680"] = {
            key = "1704175979086184680",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1245, y = 265},
            propsData = {ModeType = 0}
          },
          ["1704175979086184681"] = {
            key = "1704175979086184681",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["1704175979086184682"] = {
            key = "1704175979086184682",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 599.2752227232174, y = 171.92054877871857},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010408,
              GuideType = "M",
              GuidePointName = "QuestTrigger10408"
            }
          },
          ["1744376552096813624"] = {
            key = "1744376552096813624",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = 761.1109670578431, y = 367.41909230625373},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17467729787223658220"] = {
            key = "17467729787223658220",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 482.8047077922078, y = 345.01428571428573},
            propsData = {WaitTime = 2}
          }
        },
        commentData = {
          ["169864997677917995"] = {
            key = "169864997677917995",
            name = "\229\140\186\229\159\159\230\154\130\229\129\156bgm\230\146\173\230\148\190",
            position = {x = 535.3501144164759, y = -255.87297527706622},
            size = {width = 633.3333333333331, height = 325.00000000000006}
          }
        }
      }
    },
    story_1686819708760859 = {
      isStoryNode = true,
      key = "story_1686819708760859",
      type = "StoryNode",
      name = "\229\137\141\229\190\128\229\165\179\231\165\158\229\131\143",
      pos = {x = 965.9339207919182, y = -56.89334183927072},
      propsData = {
        QuestId = 10010203,
        QuestDescriptionComment = "\229\137\141\229\190\128\229\177\177\228\184\138\231\154\132\233\129\151\232\191\185",
        QuestDescription = "Description_100102_1",
        QuestDeatil = "Description_100102_1",
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
        SubRegionId = 100101,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestTrigger0302"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "quest_16847372760411810",
            startPort = "Out",
            endQuest = "quest_16847374762822171",
            endPort = "In"
          },
          {
            startQuest = "quest_16847374762822174",
            startPort = "Out",
            endQuest = "quest_1684737101796540",
            endPort = "Success"
          },
          {
            startQuest = "quest_16847374762822171",
            startPort = "Out",
            endQuest = "quest_16940700911492987",
            endPort = "In"
          },
          {
            startQuest = "quest_1684737101795538",
            startPort = "QuestStart",
            endQuest = "16986530942004862",
            endPort = "In"
          },
          {
            startQuest = "16986530942004862",
            startPort = "Out",
            endQuest = "1708483821118196494",
            endPort = "In"
          },
          {
            startQuest = "quest_16940700911492987",
            startPort = "Out",
            endQuest = "quest_16847374762822174",
            endPort = "In"
          },
          {
            startQuest = "quest_1684737101795538",
            startPort = "QuestStart",
            endQuest = "quest_16847372760411810",
            endPort = "In"
          },
          {
            startQuest = "quest_1684737101795538",
            startPort = "QuestStart",
            endQuest = "17467728362873652311",
            endPort = "In"
          },
          {
            startQuest = "17467728362873652311",
            startPort = "Out",
            endQuest = "1744376499587811277",
            endPort = "In"
          }
        },
        nodeData = {
          quest_1684737101795538 = {
            key = "quest_1684737101795538",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 100, y = 140},
            propsData = {ModeType = 0}
          },
          quest_1684737101796540 = {
            key = "quest_1684737101796540",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1636.5572830931408, y = 144.91656778066408},
            propsData = {ModeType = 0}
          },
          quest_1684737101796542 = {
            key = "quest_1684737101796542",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1827.5333500985646, y = 321.7576814382754},
            propsData = {}
          },
          quest_16847372760411810 = {
            key = "quest_16847372760411810",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 517.1770626601312, y = 103.3777376410201},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010302,
              GuideType = "M",
              GuidePointName = "QuestTrigger0302"
            }
          },
          quest_16847374762822171 = {
            key = "quest_16847374762822171",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 733.3771135329746, y = 131.77115827956789},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "DiaoxiangStart",
              UnitId = -1
            }
          },
          quest_16847374762822174 = {
            key = "quest_16847374762822174",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100111-SC05-\229\165\179\231\165\158\229\131\143",
            pos = {x = 1358.9564042808481, y = 141.12919845465456},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC005/SQ_OBT0100_SC005",
              BlendOutTime = 0.5,
              InType = "BlendIn",
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
              CameraLookAtTartgetPoint = "QuestPoint_Dx",
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
          quest_16940700784452983 = {
            key = "quest_16940700784452983",
            type = "PlayOrStopBGMNode",
            name = "BGM - huishou - end",
            pos = {x = 768.7981807543492, y = 372.4708845641829},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          quest_16940700911492987 = {
            key = "quest_16940700911492987",
            type = "PlayOrStopBGMNode",
            name = "BGM - nvshenxiang - start",
            pos = {x = 1038.312825659689, y = 144.64050633664135},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "/Game/Asset/Audio/FMOD/Events/bgm/cbt01/0005_story_nvshenxiang",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["16986530942004861"] = {
            key = "16986530942004861",
            type = "PlayOrStopBGMNode",
            name = "BGM - huishou - end",
            pos = {x = 465.39733362983577, y = -299.5671255281451},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          },
          ["16986530942004862"] = {
            key = "16986530942004862",
            type = "GoToNode",
            name = "\229\129\156\230\173\162\233\159\179\228\185\144",
            pos = {x = 461.41886831703744, y = -100.12252964426882},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1110010306,
              GuideType = "M",
              GuidePointName = "SoundTrigger0306"
            }
          },
          ["1708483821118196494"] = {
            key = "1708483821118196494",
            type = "PlayOrStopBGMNode",
            name = "BGM - huishou - end(MUTE)",
            pos = {x = 750.8891326869777, y = -115.24158387418989},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/mute.mute'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["1744376499587811277"] = {
            key = "1744376499587811277",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = 500.3769017320358, y = 372.19781264211747},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17467728362873652311"] = {
            key = "17467728362873652311",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 260.1675258774209, y = 355.3484940846263},
            propsData = {WaitTime = 2}
          }
        },
        commentData = {}
      }
    },
    story_1686819708761890 = {
      isStoryNode = true,
      key = "story_1686819708761890",
      type = "StoryNode",
      name = "\230\143\146\229\137\145",
      pos = {x = 1331.4538089821742, y = -54.646540629810424},
      propsData = {
        QuestId = 10010204,
        QuestDescriptionComment = "\232\176\131\230\159\165\233\155\149\229\131\143",
        QuestDescription = "Description_100102_2",
        QuestDeatil = "Description_100102_2",
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
        SubRegionId = 100101,
        StoryGuideType = "Point",
        StoryGuidePointName = "QuestPoint_Dx"
      },
      questNodeData = {
        lineData = {
          {
            startQuest = "quest_16847375699692188",
            startPort = "Out",
            endQuest = "quest_16847376214122192",
            endPort = "In"
          },
          {
            startQuest = "quest_16847376813872196",
            startPort = "Out",
            endQuest = "quest_16847377106572200",
            endPort = "In"
          },
          {
            startQuest = "quest_16847377106572200",
            startPort = "Out",
            endQuest = "quest_16847373013951821",
            endPort = "Success"
          },
          {
            startQuest = "quest_16847376214122192",
            startPort = "Out",
            endQuest = "quest_16847376813872196",
            endPort = "In"
          },
          {
            startQuest = "1702027810496417086",
            startPort = "Out",
            endQuest = "quest_16847375699692188",
            endPort = "In"
          },
          {
            startQuest = "quest_16847373013951819",
            startPort = "QuestStart",
            endQuest = "17467728524073652999",
            endPort = "In"
          },
          {
            startQuest = "17467728524073652999",
            startPort = "Out",
            endQuest = "1744376504558811494",
            endPort = "In"
          },
          {
            startQuest = "quest_16847373013951819",
            startPort = "QuestStart",
            endQuest = "1702027810496417086",
            endPort = "In"
          }
        },
        nodeData = {
          quest_16847373013951819 = {
            key = "quest_16847373013951819",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -483, y = 123.75},
            propsData = {ModeType = 0}
          },
          quest_16847373013951821 = {
            key = "quest_16847373013951821",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1735.1683677730684, y = 136.68776946798494},
            propsData = {ModeType = 0}
          },
          quest_16847373013951823 = {
            key = "quest_16847373013951823",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1740.688751993094, y = 404.036456952291},
            propsData = {}
          },
          quest_16847375699692188 = {
            key = "quest_16847375699692188",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 193.62720887980578, y = 119.18315416782843},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1210010301},
              QuestPickupId = -1,
              UnitId = 10004,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "QuestPoint_Dx",
              IsUseCount = false
            }
          },
          quest_16847376214122192 = {
            key = "quest_16847376214122192",
            type = "SendMessageNode",
            name = "\229\165\179\231\165\158\229\131\143\229\188\128\233\151\168",
            pos = {x = 478.6122465791001, y = 122.80308049081634},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "KaimenStart",
              UnitId = -1
            }
          },
          quest_16847376813872196 = {
            key = "quest_16847376813872196",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-100112-SC13-\230\143\146\229\137\145",
            pos = {x = 719.750884937047, y = 112.61945755189161},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Story/OBT01/OBT0100/OBT0100_SC013/SQ_OBT0100_SC013",
              BlendInTime = 0,
              BlendOutTime = 0.5,
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
          quest_16847377106572200 = {
            key = "quest_16847377106572200",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1022.2279371119249, y = 108.2056941317333},
            propsData = {WaitTime = 1}
          },
          ["1702027810496417086"] = {
            key = "1702027810496417086",
            type = "SendMessageNode",
            name = "\229\165\179\231\165\158\229\131\143\229\133\179\233\151\168",
            pos = {x = -87.83669007973631, y = 126.5095536211823},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "GuanmenStart",
              UnitId = -1
            }
          },
          ["1744376504558811494"] = {
            key = "1744376504558811494",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = 18.431520189498002, y = 315.8635523656751},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17467728524073652999"] = {
            key = "17467728524073652999",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -241.50041862185782, y = 321.84019803285173},
            propsData = {WaitTime = 2}
          }
        },
        commentData = {}
      }
    },
    story_1686819708762921 = {
      isStoryNode = true,
      key = "story_1686819708762921",
      type = "StoryNode",
      name = "\228\184\138\229\177\177",
      pos = {x = 458.8116680400097, y = -61.471333858045},
      propsData = {
        QuestId = 10010201,
        QuestDescriptionComment = "\229\137\141\229\190\128\229\177\177\228\184\138\231\154\132\233\129\151\232\191\185",
        QuestDescription = "Description_100102_1",
        QuestDeatil = "Description_100102_1",
        TaskRegionReName = "",
        TaskSubRegionReName = "",
        RecommendLevel = -1,
        bIsStartQuest = true,
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
            startQuest = "170289614076316599",
            startPort = "Out",
            endQuest = "170289617795517541",
            endPort = "In"
          },
          {
            startQuest = "quest_1690960764375363",
            startPort = "Out",
            endQuest = "1704175979086184684",
            endPort = "Success"
          },
          {
            startQuest = "quest_1690959608480361",
            startPort = "Out",
            endQuest = "1704175979086184684",
            endPort = "Success"
          },
          {
            startQuest = "17170600238981247480",
            startPort = "Out",
            endQuest = "17170600238981247481",
            endPort = "In"
          },
          {
            startQuest = "17170600301111247753",
            startPort = "PC",
            endQuest = "170289614076316599",
            endPort = "In"
          },
          {
            startQuest = "17170600301111247753",
            startPort = "Mobile",
            endQuest = "17170600238981247480",
            endPort = "In"
          },
          {
            startQuest = "17235385891486619537",
            startPort = "Out",
            endQuest = "17235385891486619538",
            endPort = "In"
          },
          {
            startQuest = "17235385891486619538",
            startPort = "Out",
            endQuest = "17235385891476619536",
            endPort = "In"
          },
          {
            startQuest = "173435068786011295",
            startPort = "Out",
            endQuest = "173435784055611101",
            endPort = "In"
          },
          {
            startQuest = "quest_16908882752531321",
            startPort = "Out",
            endQuest = "173435068786011295",
            endPort = "In"
          },
          {
            startQuest = "173435068786011295",
            startPort = "Out",
            endQuest = "17346896033428109",
            endPort = "In"
          },
          {
            startQuest = "173435784055611101",
            startPort = "Out",
            endQuest = "17346896291518649",
            endPort = "Input_3"
          },
          {
            startQuest = "1704175979086184686",
            startPort = "Out",
            endQuest = "17346896291518649",
            endPort = "Input_1"
          },
          {
            startQuest = "quest_1690958875951347",
            startPort = "Out",
            endQuest = "17435929167622449313",
            endPort = "In"
          },
          {
            startQuest = "17435929167622449313",
            startPort = "Out",
            endQuest = "quest_1690959608480361",
            endPort = "In"
          },
          {
            startQuest = "quest_1690959449974356",
            startPort = "Out",
            endQuest = "17435929457952449592",
            endPort = "In"
          },
          {
            startQuest = "17435929457952449592",
            startPort = "Out",
            endQuest = "quest_1690960764375363",
            endPort = "In"
          },
          {
            startQuest = "quest_16908882752531321",
            startPort = "Out",
            endQuest = "quest_1684737069161529",
            endPort = "In"
          },
          {
            startQuest = "quest_16908882752531321",
            startPort = "Out",
            endQuest = "17170600301111247753",
            endPort = "Input"
          },
          {
            startQuest = "17429932522737328551",
            startPort = "Out",
            endQuest = "17235385891486619537",
            endPort = "In"
          },
          {
            startQuest = "17429932522737328551",
            startPort = "Out",
            endQuest = "17467728222583651753",
            endPort = "In"
          },
          {
            startQuest = "17467728222583651753",
            startPort = "Out",
            endQuest = "17431454273235710488",
            endPort = "In"
          },
          {
            startQuest = "17346896033428109",
            startPort = "Out",
            endQuest = "1751466427925963385",
            endPort = "In"
          },
          {
            startQuest = "1751466427925963385",
            startPort = "Out",
            endQuest = "17346896291518649",
            endPort = "Input_2"
          },
          {
            startQuest = "17346896291518649",
            startPort = "Out",
            endQuest = "quest_1690958875951347",
            endPort = "In"
          },
          {
            startQuest = "17346896291518649",
            startPort = "Out",
            endQuest = "quest_1690959449974356",
            endPort = "In"
          },
          {
            startQuest = "175472818974711358",
            startPort = "Out",
            endQuest = "175472822683011634",
            endPort = "In"
          },
          {
            startQuest = "175472822683011634",
            startPort = "Out",
            endQuest = "175472823494711811",
            endPort = "In"
          },
          {
            startQuest = "17443614161745543",
            startPort = "Out",
            endQuest = "17429932522737328551",
            endPort = "In"
          },
          {
            startQuest = "17581636270592253",
            startPort = "Out",
            endQuest = "17581133578452248",
            endPort = "In"
          },
          {
            startQuest = "17581133578452248",
            startPort = "Out",
            endQuest = "17443614161745543",
            endPort = "In"
          },
          {
            startQuest = "1704175979086184683",
            startPort = "QuestStart",
            endQuest = "17581636270592253",
            endPort = "In"
          },
          {
            startQuest = "175472823494711811",
            startPort = "Out",
            endQuest = "17586252408736647",
            endPort = "In"
          },
          {
            startQuest = "17235385891476619536",
            startPort = "Out",
            endQuest = "quest_16908882752531321",
            endPort = "In"
          },
          {
            startQuest = "173435068786011295",
            startPort = "Out",
            endQuest = "175472818974711358",
            endPort = "In"
          },
          {
            startQuest = "175472823494711811",
            startPort = "Out",
            endQuest = "1704175979086184686",
            endPort = "In"
          }
        },
        nodeData = {
          quest_1684737069161529 = {
            key = "quest_1684737069161529",
            type = "TalkNode",
            name = "\232\142\178\229\166\136-100110-\228\184\138\229\177\177",
            pos = {x = 1143.7752417915935, y = -379.57115790605945},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 10011001,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          quest_16908882752531321 = {
            key = "quest_16908882752531321",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 671.5546775248223, y = -190.1860383445361},
            propsData = {WaitTime = 1}
          },
          quest_1690958875951347 = {
            key = "quest_1690958875951347",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 80.27842092817309, y = 682.274046109693},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010303,
              GuideType = "M",
              GuidePointName = "QuestTrigger0303"
            }
          },
          quest_1690959449974356 = {
            key = "quest_1690959449974356",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 79.50400083105524, y = 861.5484592219409},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1110010305,
              GuideType = "M",
              GuidePointName = "QuestTrigger0305"
            }
          },
          quest_1690959608480361 = {
            key = "quest_1690959608480361",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\156\186\229\133\179",
            pos = {x = 635.8484512231519, y = 705.7970690045307},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1110010305}
            }
          },
          quest_1690960764375363 = {
            key = "quest_1690960764375363",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\156\186\229\133\179",
            pos = {x = 644.4752831153289, y = 852.0468406523203},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1110010303}
            }
          },
          ["170289614076316599"] = {
            key = "170289614076316599",
            type = "ShowGuideToastNode",
            name = "\232\191\156\231\168\139\229\176\132\229\135\187",
            pos = {x = 458.68677193156964, y = -740.0874178580127},
            propsData = {
              ShowEnable = true,
              MessageId = 200007,
              MessageNote = "\232\191\156\231\168\139\229\176\132\229\135\187",
              LastTime = 7,
              Style = "Normal"
            }
          },
          ["170289617795517541"] = {
            key = "170289617795517541",
            type = "ShowGuideToastNode",
            name = "\228\184\138\229\173\144\229\188\185",
            pos = {x = 700.3399789396149, y = -701.1500932176519},
            propsData = {
              ShowEnable = true,
              MessageId = 200020,
              MessageNote = "\228\184\138\229\173\144\229\188\185",
              LastTime = 7,
              Style = "Normal"
            }
          },
          ["1704175979086184683"] = {
            key = "1704175979086184683",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -957.6562130270395, y = -164.3807254464443},
            propsData = {ModeType = 0}
          },
          ["1704175979086184684"] = {
            key = "1704175979086184684",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 982.8061222698025, y = 789.5842133910132},
            propsData = {ModeType = 0}
          },
          ["1704175979086184685"] = {
            key = "1704175979086184685",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = -604.6201108321382, y = 1325.5816458127133},
            propsData = {}
          },
          ["1704175979086184686"] = {
            key = "1704175979086184686",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 2362.9913456948802, y = -288.5916027798239},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010304,
              GuideType = "M",
              GuidePointName = "QuestTrigger0304"
            }
          },
          ["17170600238981247480"] = {
            key = "17170600238981247480",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 440.22282345306417, y = -586.128090572111},
            propsData = {
              MessageId = 200007,
              SkillNameList = {"Fire"},
              LastTime = 7,
              bIsForceTouch = false,
              bIsTimeDilation = false,
              HighLightUIPath = "BattleMain.Char_Skill.AtkRanged",
              UICompName = "Image_Main",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              ForbidSuccessAnim = false,
              IsNotForceRelease = false,
              UICompSizeOffset = {X = -50, Y = -50},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17170600238981247481"] = {
            key = "17170600238981247481",
            type = "ShowGuideNode",
            name = "\230\152\190\231\164\186\229\188\149\229\175\188\239\188\136\230\148\175\230\140\129\230\137\167\232\161\140\230\147\141\228\189\156\229\144\142\232\135\170\229\138\168\229\133\179\233\151\173/\229\188\186\229\136\182\229\188\149\229\175\188\239\188\137",
            pos = {x = 717.5253157109644, y = -573.0090699658987},
            propsData = {
              MessageId = 200020,
              SkillNameList = {
                "ChargeBullet"
              },
              LastTime = 7,
              bIsForceTouch = false,
              bIsTimeDilation = false,
              HighLightUIPath = "BattleMain.Char_Skill.Bullet",
              UICompName = "Button_Area",
              UIShape = "Square",
              IsForbidInAnim = false,
              IsForbidOutAnim = false,
              ForbidSuccessAnim = false,
              IsNotForceRelease = false,
              UICompSizeOffset = {X = 0, Y = 0},
              UICompLocOffset = {X = 0, Y = 0},
              MessageParentLoc = "HighLightUI",
              MessageLoc = "Up",
              MessageLocOffset = {X = 0, Y = 0}
            }
          },
          ["17170600301111247753"] = {
            key = "17170600301111247753",
            type = "PlatformJudgmentNode",
            name = "PC/\230\137\139\230\156\186\229\185\179\229\143\176\229\136\164\230\150\173",
            pos = {x = 215.20246599058146, y = -563.3012919227315},
            propsData = {}
          },
          ["17235385891476619536"] = {
            key = "17235385891476619536",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 369.7610602984144, y = -174.7096088755507},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "ShangshanStart",
              UnitId = -1
            }
          },
          ["17235385891486619537"] = {
            key = "17235385891486619537",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\128\170\231\137\169",
            pos = {x = -160.95066794342418, y = -164.0235833291338},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                990130,
                990131,
                990132,
                990133,
                990134,
                990135,
                990136,
                990137
              }
            }
          },
          ["17235385891486619538"] = {
            key = "17235385891486619538",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129 \230\128\170\231\137\169",
            pos = {x = 101.68017321927948, y = -171.18834296902995},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                990141,
                990143,
                990144
              }
            }
          },
          ["173435068786011295"] = {
            key = "173435068786011295",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1145.5987298596397, y = -222.16858582510744},
            propsData = {
              NewDescription = "Description_100102_11",
              NewDetail = "Description_100102_11",
              SubTaskTargetIndex = 0
            }
          },
          ["1734350927309927681"] = {
            key = "1734350927309927681",
            type = "ToggleShowNewMonsterPanelNode",
            name = "\229\136\135\230\141\162\230\150\176\230\128\170\231\137\169\233\157\162\230\157\191\230\152\190\231\164\186",
            pos = {x = -1066.227607806518, y = 1221.1198994810009},
            propsData = {Enable = true}
          },
          ["173435784055611101"] = {
            key = "173435784055611101",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1506.7985579412416, y = 164.42352901858985},
            propsData = {WaitTime = 20}
          },
          ["17346896033428109"] = {
            key = "17346896033428109",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 1450.9551665061078, y = -16.035458646908992},
            propsData = {
              KillMonsterType = "Nums",
              MonsterNeedNums = 10,
              IsShow = false,
              GuideType = "P",
              GuideName = ""
            }
          },
          ["17346896291518649"] = {
            key = "17346896291518649",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 2361.566774348521, y = 11.545525229895503},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          },
          ["17429932522737328551"] = {
            key = "17429932522737328551",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164\229\165\179\228\184\187",
            pos = {x = -428.73188490938503, y = -158.2716595239076},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = true,
              StaticCreatorIdList = {1590287}
            }
          },
          ["17431454273235710488"] = {
            key = "17431454273235710488",
            type = "SetPhantomStatusNode",
            name = "\232\174\190\231\189\174\233\173\133\229\189\177Buff",
            pos = {x = -139.62171794502768, y = -341.1010195983594},
            propsData = {
              PhantomRoleId = 111,
              BuffList = {
                {
                  Id = 903,
                  LastTime = -1,
                  Value = -1
                }
              }
            }
          },
          ["17435929167622449313"] = {
            key = "17435929167622449313",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 355.82462561414627, y = 702.7448354775006},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1590289,
                1590290,
                1590291,
                1590292,
                1590293,
                1590294,
                1590295
              }
            }
          },
          ["17435929457952449592"] = {
            key = "17435929457952449592",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 360.0865786712311, y = 863.1418218582598},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                1590289,
                1590290,
                1590291,
                1590292,
                1590293,
                1590294,
                1590295
              }
            }
          },
          ["17443614161745543"] = {
            key = "17443614161745543",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = -669.7494425382168, y = -153.8760161587304},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1590296,
              GuideType = "M",
              GuidePointName = "Mechanism_10010201StartBox_1590296"
            }
          },
          ["17467728222583651753"] = {
            key = "17467728222583651753",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = -414.07491911276014, y = -327.3631919563081},
            propsData = {WaitTime = 2}
          },
          ["1751466427925963385"] = {
            key = "1751466427925963385",
            type = "UpdateTaskBarAndTaskMainNode",
            name = "\230\155\180\230\150\176\228\187\187\229\138\161\231\155\174\230\160\135\232\138\130\231\130\185",
            pos = {x = 1806.3721908192344, y = 15.471821420323778},
            propsData = {
              NewDescription = "Description_100102_1",
              NewDetail = "Description_100102_1",
              SubTaskTargetIndex = 0
            }
          },
          ["175472818974711358"] = {
            key = "175472818974711358",
            type = "GoToNode",
            name = "\233\146\169\233\148\129\228\184\139",
            pos = {x = 1492.1775926562268, y = -307.415698109224},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1590329,
              GuideType = "M",
              GuidePointName = "Mechanism_gousuoBOX_1590329"
            }
          },
          ["175472822683011634"] = {
            key = "175472822683011634",
            type = "CameraLookAtNode",
            name = "CameraLookAt",
            pos = {x = 1759.969931365904, y = -307.50642391567595},
            propsData = {
              TargetType = "Point",
              PointName = "Mechanism_Hook_1590311",
              ActorId = 0,
              Duration = 1,
              EasingFunc = 4,
              bDisableUserInput = true
            }
          },
          ["175472823494711811"] = {
            key = "175472823494711811",
            type = "ShowGuideMainNode",
            name = "\230\152\190\231\164\186\229\155\190\230\150\135\229\188\149\229\175\188",
            pos = {x = 2030.9679152368715, y = -294.26045617374035},
            propsData = {GuideId = 81}
          },
          ["17581133578452248"] = {
            key = "17581133578452248",
            type = "SetPlayerStatusNode",
            name = "\232\174\190\231\189\174\231\142\169\229\174\182\231\138\182\230\128\129",
            pos = {x = -595.8958753990416, y = 46.061235414846756},
            propsData = {
              HPPercent = -1,
              ESPercent = -1,
              SPPercent = -1,
              BuffList = {
                {
                  Id = 310,
                  LastTime = -1,
                  Value = -1
                }
              },
              RecoverPlayer = false
            }
          },
          ["17581636270592253"] = {
            key = "17581636270592253",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\229\140\186\229\159\159",
            pos = {x = -833.6954509101666, y = 33.43214840319111},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 100101,
              bGuideUIEnable = true,
              GuideType = "M",
              GuideName = "Mechanism_10010201StartBox_1590296"
            }
          },
          ["17586252408736647"] = {
            key = "17586252408736647",
            type = "MSDKUploadNode",
            name = "\230\181\183\229\164\150\229\184\130\229\156\186SDK\229\159\139\231\130\185\228\184\138\230\138\165",
            pos = {x = 2034.4893071582699, y = -436.3236600860441},
            propsData = {
              EventName = "grapplepoints_active"
            }
          }
        },
        commentData = {
          ["1751466282874960425"] = {
            key = "1751466282874960425",
            name = "\229\176\132\229\135\187\229\188\149\229\175\188",
            position = {x = 179.78183147706477, y = -824.9763773807898},
            size = {width = 870.0000000000002, height = 417.7777777777779}
          },
          ["1758700939922939941"] = {
            key = "1758700939922939941",
            name = "\233\146\169\233\148\129\229\188\149\229\175\188",
            position = {x = 1454.5841982692564, y = -546.3488245638969},
            size = {width = 853.5252904989748, height = 394.07995255518506}
          }
        }
      }
    },
    ["1720342877572855991"] = {
      isStoryNode = true,
      key = "1720342877572855991",
      type = "StoryNode",
      name = "\232\142\183\229\190\151MOD",
      pos = {x = 458.2450215797226, y = 603.3827622342997},
      propsData = {
        QuestId = 10010211,
        QuestDescriptionComment = "\230\142\162\231\180\162\233\129\151\232\191\185\239\188\140\229\175\187\230\137\190\233\163\158\232\137\135",
        QuestDescription = "Description_100102_5",
        QuestDeatil = "Description_100102_5",
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
            startQuest = "1720342877572856002",
            startPort = "Out",
            endQuest = "1720342877572856003",
            endPort = "In"
          },
          {
            startQuest = "1720342877572856003",
            startPort = "Out",
            endQuest = "1720342877572856002",
            endPort = "In"
          },
          {
            startQuest = "1720342877573856006",
            startPort = "Out",
            endQuest = "1720342877573856009",
            endPort = "Input_1"
          },
          {
            startQuest = "1720342877573856007",
            startPort = "Out",
            endQuest = "1720342877573856009",
            endPort = "Input_2"
          },
          {
            startQuest = "1720342877573856008",
            startPort = "Out",
            endQuest = "1720342877573856009",
            endPort = "Input_3"
          },
          {
            startQuest = "1720342877573856009",
            startPort = "Out",
            endQuest = "1720342877572856001",
            endPort = "Branch_1"
          },
          {
            startQuest = "1720342877572856001",
            startPort = "Out",
            endQuest = "1720342877572856005",
            endPort = "In"
          },
          {
            startQuest = "1720342877572856004",
            startPort = "Out",
            endQuest = "1720342877572856000",
            endPort = "In"
          },
          {
            startQuest = "1720342877572856000",
            startPort = "Out",
            endQuest = "1720342877573856006",
            endPort = "Input"
          },
          {
            startQuest = "1720342877572856000",
            startPort = "Out",
            endQuest = "1720342877573856007",
            endPort = "Input"
          },
          {
            startQuest = "1720342877572856000",
            startPort = "Out",
            endQuest = "1720342877573856008",
            endPort = "Input"
          },
          {
            startQuest = "1720342877572855995",
            startPort = "QuestStart",
            endQuest = "1720342877572856004",
            endPort = "In"
          },
          {
            startQuest = "1720342877572856005",
            startPort = "Out",
            endQuest = "1730210634800819928",
            endPort = "In"
          },
          {
            startQuest = "1730210634800819928",
            startPort = "Out",
            endQuest = "1720342877572855996",
            endPort = "Success"
          }
        },
        nodeData = {
          ["1720342877572855995"] = {
            key = "1720342877572855995",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -744.0305308726358, y = 180.98029163818637},
            propsData = {ModeType = 0}
          },
          ["1720342877572855996"] = {
            key = "1720342877572855996",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1486.3636363636363, y = 149.54545454545456},
            propsData = {ModeType = 0}
          },
          ["1720342877572855997"] = {
            key = "1720342877572855997",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1500, y = 340},
            propsData = {}
          },
          ["1720342877572855999"] = {
            key = "1720342877572855999",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 284.0138053661242, y = -69.20478720924571},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {1570073},
              QuestPickupId = -1,
              UnitId = 30007,
              UnitCount = 1,
              bGuideUIEnable = false,
              GuideType = "P",
              GuidePointName = "QuestArea_Mod",
              IsUseCount = false
            }
          },
          ["1720342877572856000"] = {
            key = "1720342877572856000",
            type = "BranchQuestStartNode",
            name = "\229\173\144\228\187\187\229\138\161\229\188\128\229\167\139\232\138\130\231\130\185",
            pos = {x = -128.1388319283053, y = 181.8534783929521},
            propsData = {
              AllQuestOptions = {
                {
                  IsNeedFinish = false,
                  BranchQuestName = "Description_100102_5_1",
                  TargetBranchQuestKey = "1720342877573856006"
                }
              },
              IsSetCountInfo = false,
              IsDifftation = false
            }
          },
          ["1720342877572856001"] = {
            key = "1720342877572856001",
            type = "CheckBranchQuestFinishedNode",
            name = "\229\173\144\228\187\187\229\138\161\231\187\147\230\157\159\232\138\130\231\130\185",
            pos = {x = 716.0530872636136, y = 154.9847915242652},
            propsData = {
              InputBranchQuestNumber = 1,
              BranchQuestFinishOptions = {
                {IsNeedFinish = true}
              }
            }
          },
          ["1720342877572856002"] = {
            key = "1720342877572856002",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = -340.8393369788105, y = 488.44520208144996},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010405,
              GuideType = "P",
              GuidePointName = "QuestArea_Mod"
            }
          },
          ["1720342877572856003"] = {
            key = "1720342877572856003",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = -350.91660970608314, y = 676.8029733424471},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1110010410,
              GuideType = "P",
              GuidePointName = "QuestArea_Mod2"
            }
          },
          ["1720342877572856004"] = {
            key = "1720342877572856004",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = -413.47220002220035, y = 199.4310762594825},
            propsData = {
              IsShow = true,
              GuideType = "P",
              GuideName = "QuestArea_Mod"
            }
          },
          ["1720342877572856005"] = {
            key = "1720342877572856005",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 969.3515734265732, y = 163.82231002571626},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "QuestArea_Mod"
            }
          },
          ["1720342877573856006"] = {
            key = "1720342877573856006",
            type = "ResourceCollectNode",
            name = "\232\142\183\229\190\151Resource\233\129\147\229\133\183",
            pos = {x = 208.45082487097963, y = 122.98516253417864},
            propsData = {
              ResourceType = "Mod",
              ResourceId = 32004,
              NeedCount = 1,
              bUseBagCount = true,
              bGuideUIEnable = false,
              GuideType = "P",
              GuidePointName = "QuestArea_Mod"
            }
          },
          ["1720342877573856007"] = {
            key = "1720342877573856007",
            type = "ResourceCollectNode",
            name = "\232\142\183\229\190\151Resource\233\129\147\229\133\183",
            pos = {x = 202.54173396188867, y = 264.8033443523606},
            propsData = {
              ResourceType = "Mod",
              ResourceId = 31502,
              NeedCount = 1,
              bUseBagCount = true,
              bGuideUIEnable = false,
              GuideType = "P",
              GuidePointName = "QuestArea_Mod"
            }
          },
          ["1720342877573856008"] = {
            key = "1720342877573856008",
            type = "ResourceCollectNode",
            name = "\232\142\183\229\190\151Resource\233\129\147\229\133\183",
            pos = {x = 207.99627941643402, y = 410.71243526145145},
            propsData = {
              ResourceType = "Mod",
              ResourceId = 33201,
              NeedCount = 1,
              bUseBagCount = true,
              bGuideUIEnable = false,
              GuideType = "P",
              GuidePointName = "QuestArea_Mod"
            }
          },
          ["1720342877573856009"] = {
            key = "1720342877573856009",
            type = "WaitQuestFinishedNode",
            name = "\231\173\137\229\190\133\228\187\187\229\138\161\229\174\140\230\136\144",
            pos = {x = 489.35991578007025, y = 131.16698071599683},
            propsData = {ListenCount = 3, NeedFinishCount = 3}
          },
          ["1730210634800819928"] = {
            key = "1730210634800819928",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 1235.4728003925, y = 156.35910498394873},
            propsData = {WaitTime = 1.5}
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
