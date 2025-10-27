return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17396068168221",
      startPort = "StoryStart",
      endStory = "173960682489147",
      endPort = "In"
    },
    {
      startStory = "173960682489147",
      startPort = "Success",
      endStory = "1739606840055474",
      endPort = "In"
    },
    {
      startStory = "1739606840055474",
      startPort = "Success",
      endStory = "17396068168225",
      endPort = "StoryEnd"
    }
  },
  storyNodeData = {
    ["17396068168221"] = {
      isStoryNode = true,
      key = "17396068168221",
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
    ["17396068168225"] = {
      isStoryNode = true,
      key = "17396068168225",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 1689.9999999999998, y = 296.89655172413796},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["173960682489147"] = {
      isStoryNode = true,
      key = "173960682489147",
      type = "StoryNode",
      name = "\231\172\172\228\184\128\230\179\162\231\139\188\231\129\181",
      pos = {x = 1100.4137931034484, y = 288.62068965517244},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_14",
        QuestDeatil = "Content_120102_14",
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
            startQuest = "173960682489152",
            startPort = "QuestStart",
            endQuest = "173960682489255",
            endPort = "In"
          },
          {
            startQuest = "175101606958112567064",
            startPort = "Out",
            endQuest = "175102198956813231727",
            endPort = "In"
          },
          {
            startQuest = "175102198956813231727",
            startPort = "Out",
            endQuest = "173968224552714631398",
            endPort = "In"
          },
          {
            startQuest = "175102198956813231727",
            startPort = "Out",
            endQuest = "1750854042718845",
            endPort = "In"
          },
          {
            startQuest = "173960682489255",
            startPort = "Out",
            endQuest = "17508545760191765",
            endPort = "In"
          },
          {
            startQuest = "17508545760191765",
            startPort = "Out",
            endQuest = "173960682489254",
            endPort = "Fail"
          },
          {
            startQuest = "1750854042718845",
            startPort = "Out",
            endQuest = "173960682489258",
            endPort = "In"
          },
          {
            startQuest = "173960682489258",
            startPort = "Out",
            endQuest = "173960682489253",
            endPort = "Success"
          },
          {
            startQuest = "173960682489152",
            startPort = "QuestStart",
            endQuest = "175101606958112567064",
            endPort = "In"
          }
        },
        nodeData = {
          ["173960682489152"] = {
            key = "173960682489152",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3523.231005750356, y = 826.1651978912043},
            propsData = {ModeType = 0}
          },
          ["173960682489253"] = {
            key = "173960682489253",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 5138.573468070758, y = 842.5242115719806},
            propsData = {ModeType = 0}
          },
          ["173960682489254"] = {
            key = "173960682489254",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4619.177320181506, y = 1047.752557194727},
            propsData = {}
          },
          ["173960682489255"] = {
            key = "173960682489255",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 3945.7505310242727, y = 942.8670329804363},
            propsData = {}
          },
          ["173960682489257"] = {
            key = "173960682489257",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 4642.718677033806, y = 331.09201985399585},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {2040023}
            }
          },
          ["173960682489258"] = {
            key = "173960682489258",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 4788.818693218533, y = 822.4619784999074},
            propsData = {
              KillMonsterType = "Nums",
              MonsterNeedNums = 30,
              IsShow = true,
              GuideType = "P",
              GuideName = "SpecialQuestPoint_SQ02Start"
            }
          },
          ["173960682489260"] = {
            key = "173960682489260",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 3696.246362976399, y = 508.4985154543407},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_CavSpecialQuest"
            }
          },
          ["173968224552714631398"] = {
            key = "173968224552714631398",
            type = "TalkNode",
            name = "\229\188\128\232\189\166 -\229\146\140\231\133\156\230\152\142\228\186\164\232\176\136",
            pos = {x = 4750.4104893104595, y = 578.576969083548},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 12011901,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["1750854042718845"] = {
            key = "1750854042718845",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 4457.375751879698, y = 798.8948393711553},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "East01CavSQCreateMonster",
              UnitId = -1
            }
          },
          ["17508545760191765"] = {
            key = "17508545760191765",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = 4323.13364661654, y = 1029.2662679425841},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "East01CavSQDestoryMonster",
              UnitId = -1
            }
          },
          ["175101606958112567064"] = {
            key = "175101606958112567064",
            type = "AsyncSetActorLocationAndRotationNode",
            name = "\229\188\130\230\173\165\232\174\190\231\189\174\231\142\169\229\174\182\228\189\141\231\189\174\230\151\139\232\189\172",
            pos = {x = 3910.86842105263, y = 669.8157894736842},
            propsData = {
              UnitId = 0,
              NewTargetPointName = "SpecialQuestPoint_SQ02Start",
              FadeIn = false,
              FadeOut = true,
              bResetCamera = false,
              bForceAsyncLoading = false,
              IsWhite = false
            }
          },
          ["175102198956813231727"] = {
            key = "175102198956813231727",
            type = "CreatePhantomNode",
            name = "\229\143\172\229\148\164/\233\148\128\230\175\129\229\137\167\230\131\133\233\173\133\229\189\177",
            pos = {x = 4402.005263157895, y = 623.2157894736841},
            propsData = {
              IsCreate = true,
              IsClearOtherPhantom = false,
              IsSync = false,
              StaticCreatorIdList = {2040042}
            }
          },
          ["17512753791521417"] = {
            key = "17512753791521417",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 3215.0153508771928, y = 575.251547987616},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2040044,
              GuideType = "M",
              GuidePointName = "QuestPoint_CavSpecialQuest"
            }
          }
        },
        commentData = {}
      }
    },
    ["1739606840055474"] = {
      isStoryNode = true,
      key = "1739606840055474",
      type = "StoryNode",
      name = "\231\172\172\228\186\140\230\179\162\231\139\188\231\129\181",
      pos = {x = 1377.8207714324656, y = 287.0601841936175},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_120102_14",
        QuestDeatil = "Content_120102_14",
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
            startQuest = "1739606840056479",
            startPort = "QuestStart",
            endQuest = "1739606840056482",
            endPort = "In"
          },
          {
            startQuest = "1739606840056484",
            startPort = "Out",
            endQuest = "1739606840056485",
            endPort = "In"
          },
          {
            startQuest = "1739606840056485",
            startPort = "Out",
            endQuest = "1739606840056487",
            endPort = "In"
          },
          {
            startQuest = "1739606840056482",
            startPort = "Out",
            endQuest = "1751275689799661592",
            endPort = "In"
          },
          {
            startQuest = "1751275689799661592",
            startPort = "Out",
            endQuest = "1739606840056481",
            endPort = "Fail"
          },
          {
            startQuest = "1739606840056479",
            startPort = "QuestStart",
            endQuest = "1739606840056484",
            endPort = "In"
          }
        },
        nodeData = {
          ["1739606840056479"] = {
            key = "1739606840056479",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 3184.2054465142705, y = 493.6654228124818},
            propsData = {ModeType = 0}
          },
          ["1739606840056480"] = {
            key = "1739606840056480",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 4605.443902238675, y = 435.3126933673273},
            propsData = {ModeType = 0}
          },
          ["1739606840056481"] = {
            key = "1739606840056481",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 4317.718432463141, y = 785.230241341945},
            propsData = {}
          },
          ["1739606840056482"] = {
            key = "1739606840056482",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 3539.6217153954553, y = 719.3415526128508},
            propsData = {}
          },
          ["1739606840056484"] = {
            key = "1739606840056484",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3554.7497243342596, y = 409.9391152033677},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = true,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2040024,
                2040025,
                2040023
              }
            }
          },
          ["1739606840056485"] = {
            key = "1739606840056485",
            type = "KillMonsterNode",
            name = "\229\135\187\230\157\128\230\128\170\231\137\169",
            pos = {x = 3961.832301466746, y = 404.4178551566992},
            propsData = {
              KillMonsterType = "Id",
              MonsterNeedNums = 2,
              IsShow = false,
              GuideType = "P",
              GuideName = "",
              IsShowMonsterGuide = true,
              StaticCreatorIdList = {
                2040024,
                2040025,
                2040023
              }
            }
          },
          ["1739606840056487"] = {
            key = "1739606840056487",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 4306.809174304929, y = 409.7290299377143},
            propsData = {}
          },
          ["173960984147919983850"] = {
            key = "173960984147919983850",
            type = "GoToRegionNode",
            name = "\232\191\155\229\133\165\228\184\156\229\155\189\229\140\186\229\159\159\230\163\128\230\181\139",
            pos = {x = 3495.530075187969, y = 64.67395762132605},
            propsData = {
              RegionType = 1,
              IsEnter = "Enter",
              RegionId = 104103,
              bGuideUIEnable = true,
              GuideType = "P",
              GuideName = "QuestPoint_CavSpecialQuest"
            }
          },
          ["1751275662722660980"] = {
            key = "1751275662722660980",
            type = "GoToNode",
            name = "\229\137\141\229\190\128",
            pos = {x = 3060.8421052631575, y = 148.00000000000006},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 2040044,
              GuideType = "M",
              GuidePointName = "QuestPoint_CavSpecialQuest"
            }
          },
          ["1751275689799661592"] = {
            key = "1751275689799661592",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 3867.368421052631, y = 753.1578947368422},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {
                2040024,
                2040025,
                2040023
              }
            }
          }
        },
        commentData = {}
      }
    }
  },
  commentData = {}
}
