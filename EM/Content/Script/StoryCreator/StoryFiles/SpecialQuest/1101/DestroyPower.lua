return {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1721630102382394083",
      startPort = "Success",
      endStory = "17248279740025829633",
      endPort = "In"
    },
    {
      startStory = "17248279740025829633",
      startPort = "Success",
      endStory = "17247634655935255717",
      endPort = "In"
    },
    {
      startStory = "17247634655935255717",
      startPort = "Success",
      endStory = "17248282020885833240",
      endPort = "In"
    },
    {
      startStory = "17248282020885833240",
      startPort = "Success",
      endStory = "17247634659615255876",
      endPort = "In"
    },
    {
      startStory = "17247634659615255876",
      startPort = "Success",
      endStory = "17248282039195833373",
      endPort = "In"
    },
    {
      startStory = "17248282039195833373",
      startPort = "Success",
      endStory = "17247634663805256044",
      endPort = "In"
    },
    {
      startStory = "17247634663805256044",
      startPort = "Success",
      endStory = "1721630102382394082",
      endPort = "StoryEnd"
    },
    {
      startStory = "1721630102382394081",
      startPort = "StoryStart",
      endStory = "17552626048232131414",
      endPort = "In"
    },
    {
      startStory = "17552626048232131414",
      startPort = "Success",
      endStory = "1721630102382394083",
      endPort = "In"
    }
  },
  storyNodeData = {
    ["1721630102382394081"] = {
      isStoryNode = true,
      key = "1721630102382394081",
      type = "StoryStartNode",
      name = "StoryStart",
      pos = {x = 321.3793103448275, y = 367.58620689655174},
      propsData = {QuestChainId = 0},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721630102382394082"] = {
      isStoryNode = true,
      key = "1721630102382394082",
      type = "StoryEndNode",
      name = "StoryEnd",
      pos = {x = 2505.602226720647, y = 360.7945344129556},
      propsData = {},
      questNodeData = {
        lineData = {},
        nodeData = {},
        commentData = {}
      }
    },
    ["1721630102382394083"] = {
      isStoryNode = true,
      key = "1721630102382394083",
      type = "StoryNode",
      name = "\231\160\180\229\157\143\231\172\172\228\184\128\228\184\170\232\131\189\230\186\144",
      pos = {x = 1091.4194084625778, y = 359.1540098036422},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110106_1_1",
        QuestDeatil = "Content_110106_1",
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
            startQuest = "1721630102382394084",
            startPort = "QuestStart",
            endQuest = "1721630102382394089",
            endPort = "In"
          },
          {
            startQuest = "1720930161204575159",
            startPort = "Out",
            endQuest = "1721630102382394086",
            endPort = "Fail"
          },
          {
            startQuest = "17205081348952087890",
            startPort = "Out",
            endQuest = "1721630102382394085",
            endPort = "Success"
          },
          {
            startQuest = "1721630102382394089",
            startPort = "Out",
            endQuest = "17252788117954718363",
            endPort = "In"
          },
          {
            startQuest = "17252788117954718363",
            startPort = "Out",
            endQuest = "1720930161204575159",
            endPort = "In"
          },
          {
            startQuest = "1721630102382394084",
            startPort = "QuestStart",
            endQuest = "17247671114715636985",
            endPort = "In"
          },
          {
            startQuest = "17247671114715636985",
            startPort = "Out",
            endQuest = "17205081348952087890",
            endPort = "In"
          }
        },
        nodeData = {
          ["17205081348952087890"] = {
            key = "17205081348952087890",
            type = "BossBattleFinishNode",
            name = "\230\149\153\229\173\166\230\156\186\229\133\179\229\136\135\230\141\162\230\136\144\229\138\159",
            pos = {x = 209.72308397310377, y = -342.3849365825514},
            propsData = {
              SendMessage = "",
              FinishCondition = "JiDianQi_1_On"
            }
          },
          ["1720930161204575159"] = {
            key = "1720930161204575159",
            type = "SendMessageNode",
            name = "\229\188\149\230\147\142\228\184\139\229\177\130\229\164\177\232\180\165",
            pos = {x = 419.7079509253268, y = 35.191045499347766},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EngineeDownFail",
              UnitId = -1
            }
          },
          ["1721630102382394084"] = {
            key = "1721630102382394084",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -383.679639439507, y = -96.67156527682785},
            propsData = {ModeType = 0}
          },
          ["1721630102382394085"] = {
            key = "1721630102382394085",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 593.0504962126315, y = -150.35393084839444},
            propsData = {ModeType = 0}
          },
          ["1721630102382394086"] = {
            key = "1721630102382394086",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 676.5542800852402, y = 38.70848425702776},
            propsData = {}
          },
          ["1721630102382394089"] = {
            key = "1721630102382394089",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = -110.97121732514422, y = 32.451817621694886},
            propsData = {}
          },
          ["17247671114715636985"] = {
            key = "17247671114715636985",
            type = "SendMessageNode",
            name = "\229\143\145\233\128\129\230\182\136\230\129\175",
            pos = {x = -104.31213963405422, y = -316.67756119549085},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EngineeStart",
              UnitId = -1
            }
          },
          ["17252788117954718363"] = {
            key = "17252788117954718363",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 143.09608305285724, y = 34.17689015726128},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "BP_NengyuanTarget1"
            }
          }
        },
        commentData = {}
      }
    },
    ["17243128605581638049"] = {
      isStoryNode = true,
      key = "17243128605581638049",
      type = "StoryNode",
      name = "\233\128\131\231\166\187\229\138\168\229\138\155\229\174\164",
      pos = {x = 2190.2317825278137, y = 138.04725953024274},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110106_2",
        QuestDeatil = "Content_110106_1",
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
            startQuest = "17243128605581638050",
            startPort = "QuestStart",
            endQuest = "17243128692261638606",
            endPort = "In"
          },
          {
            startQuest = "17243130306291642610",
            startPort = "Out",
            endQuest = "17243130306291642611",
            endPort = "In"
          },
          {
            startQuest = "17243128605581638050",
            startPort = "QuestStart",
            endQuest = "17243130306291642610",
            endPort = "In"
          },
          {
            startQuest = "17243130306291642611",
            startPort = "Out",
            endQuest = "17243128605581638056",
            endPort = "Fail"
          },
          {
            startQuest = "17243128692261638606",
            startPort = "Out",
            endQuest = "17262257709999296529",
            endPort = "In"
          }
        },
        nodeData = {
          ["17243128605581638050"] = {
            key = "17243128605581638050",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 848.9473684210526, y = 399.4736842105263},
            propsData = {ModeType = 0}
          },
          ["17243128605581638053"] = {
            key = "17243128605581638053",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2287.1687840290383, y = 401.59709618874774},
            propsData = {ModeType = 0}
          },
          ["17243128605581638056"] = {
            key = "17243128605581638056",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 2010.5263157894735, y = 693.6842105263158},
            propsData = {}
          },
          ["17243128692261638606"] = {
            key = "17243128692261638606",
            type = "GoToNode",
            name = "GOTO - \231\166\187\229\188\128\232\191\153\233\135\140",
            pos = {x = 1287.8881763423597, y = 400.188613256461},
            propsData = {
              GuideUIEnable = true,
              StaticCreatorId = 1111010605,
              GuideType = "M",
              GuidePointName = "questpoint1111010605"
            }
          },
          ["17243130306291642610"] = {
            key = "17243130306291642610",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1179.9751218765637, y = 794.9418145517258},
            propsData = {}
          },
          ["17243130306291642611"] = {
            key = "17243130306291642611",
            type = "SendMessageNode",
            name = "\229\188\149\230\147\142\228\184\139\229\177\130\229\164\177\232\180\165",
            pos = {x = 1470.8648164428241, y = 802.2025735298571},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EngineeDownFail",
              UnitId = -1
            }
          },
          ["17262257709999296529"] = {
            key = "17262257709999296529",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1523.627112851677, y = 111.6933435928723},
            propsData = {
              SoundStateType = 3,
              SoundPriority = 0,
              SoundType = 0
            }
          }
        },
        commentData = {}
      }
    },
    ["17247634655935255717"] = {
      isStoryNode = true,
      key = "17247634655935255717",
      type = "StoryNode",
      name = "\231\160\180\229\157\143\231\172\172\228\186\140\228\184\170\232\131\189\230\186\144",
      pos = {x = 1379.9731802499393, y = 362.7165242189063},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110106_1_3",
        QuestDeatil = "Content_110106_1",
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
            startQuest = "17247634655975255746",
            startPort = "QuestStart",
            endQuest = "17247634655975255751",
            endPort = "In"
          },
          {
            startQuest = "17247634655975255751",
            startPort = "Out",
            endQuest = "17247634655945255736",
            endPort = "In"
          },
          {
            startQuest = "17247634655945255736",
            startPort = "Out",
            endQuest = "17247634655975255748",
            endPort = "Fail"
          },
          {
            startQuest = "17247634655975255751",
            startPort = "Out",
            endQuest = "17252788259414718904",
            endPort = "In"
          },
          {
            startQuest = "17247634655975255746",
            startPort = "QuestStart",
            endQuest = "17253323291847833643",
            endPort = "In"
          },
          {
            startQuest = "17247634655975255746",
            startPort = "QuestStart",
            endQuest = "17248301266056199323",
            endPort = "In"
          },
          {
            startQuest = "17248301266056199323",
            startPort = "Out",
            endQuest = "17247634655975255747",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17247634655945255736"] = {
            key = "17247634655945255736",
            type = "SendMessageNode",
            name = "\229\188\149\230\147\142\228\184\139\229\177\130\229\164\177\232\180\165",
            pos = {x = 248.79490744706618, y = 459.75855122017106},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EngineeDownFail",
              UnitId = -1
            }
          },
          ["17247634655975255746"] = {
            key = "17247634655975255746",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -314.04383116883037, y = 430.48538961038963},
            propsData = {ModeType = 0}
          },
          ["17247634655975255747"] = {
            key = "17247634655975255747",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 820.4222457445641, y = 283.92815777236655},
            propsData = {ModeType = 0}
          },
          ["17247634655975255748"] = {
            key = "17247634655975255748",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 545.6641199021744, y = 458.69704260943},
            propsData = {}
          },
          ["17247634655975255751"] = {
            key = "17247634655975255751",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = -1.2481051969975567, y = 452.76303043633976},
            propsData = {}
          },
          ["17248301266056199323"] = {
            key = "17248301266056199323",
            type = "WaitingMechanismEnterStateNode",
            name = "\233\157\158\230\149\153\229\173\166\231\172\172\228\184\128\228\184\170\230\156\186\229\133\179\230\137\147\229\174\140",
            pos = {x = 240.10152457608297, y = 270.3924057758301},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1640094,
              StateId = 111023,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17252788259414718904"] = {
            key = "17252788259414718904",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 268.0960830528574, y = 591.1768901572606},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "BP_NengyuanTarget2"
            }
          },
          ["17253323291847833643"] = {
            key = "17253323291847833643",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 155.3505679785801, y = -126.34630366843336},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11017604,
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
    ["17247634659615255876"] = {
      isStoryNode = true,
      key = "17247634659615255876",
      type = "StoryNode",
      name = "\231\160\180\229\157\143\231\172\172\228\184\137\228\184\170\232\131\189\230\186\144",
      pos = {x = 1662.4033044735415, y = 364.7165242189063},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110106_1_4",
        QuestDeatil = "Content_110106_1",
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
            startQuest = "17247634659645255905",
            startPort = "QuestStart",
            endQuest = "17247634659645255910",
            endPort = "In"
          },
          {
            startQuest = "17247634659645255910",
            startPort = "Out",
            endQuest = "17247634659645255895",
            endPort = "In"
          },
          {
            startQuest = "17247634659645255895",
            startPort = "Out",
            endQuest = "17247634659645255907",
            endPort = "Fail"
          },
          {
            startQuest = "17247634659645255895",
            startPort = "Out",
            endQuest = "17252788336704719184",
            endPort = "In"
          },
          {
            startQuest = "17247634659645255905",
            startPort = "QuestStart",
            endQuest = "17253323177727833260",
            endPort = "In"
          },
          {
            startQuest = "17247634659645255905",
            startPort = "QuestStart",
            endQuest = "17248301469956199810",
            endPort = "In"
          },
          {
            startQuest = "17248301469956199810",
            startPort = "Out",
            endQuest = "17247634659645255906",
            endPort = "Success"
          }
        },
        nodeData = {
          ["17247634659645255895"] = {
            key = "17247634659645255895",
            type = "SendMessageNode",
            name = "\229\188\149\230\147\142\228\184\139\229\177\130\229\164\177\232\180\165",
            pos = {x = 610.4788487581437, y = 579.3829959637435},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EngineeDownFail",
              UnitId = -1
            }
          },
          ["17247634659645255905"] = {
            key = "17247634659645255905",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -314.04383116883037, y = 430.48538961038963},
            propsData = {ModeType = 0}
          },
          ["17247634659645255906"] = {
            key = "17247634659645255906",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 913.8466511412938, y = 347.59907527860486},
            propsData = {ModeType = 0}
          },
          ["17247634659645255907"] = {
            key = "17247634659645255907",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 950.0805958747136, y = 664.2348000465007},
            propsData = {}
          },
          ["17247634659645255910"] = {
            key = "17247634659645255910",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 361.9420953683538, y = 575.2505792316015},
            propsData = {}
          },
          ["17248301469956199810"] = {
            key = "17248301469956199810",
            type = "WaitingMechanismEnterStateNode",
            name = "\233\157\158\230\149\153\229\173\166\231\172\172\228\186\140\228\184\170\230\156\186\229\133\179\230\137\147\229\174\140",
            pos = {x = 351.655370729928, y = 370.59240577582995},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1640093,
              StateId = 111023,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17252788336704719184"] = {
            key = "17252788336704719184",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 826.0960830528562, y = 816.1768901572601},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "BP_NengyuanTarget3"
            }
          },
          ["17253323177727833260"] = {
            key = "17253323177727833260",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 912.4934251214346, y = 42.22512490299462},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11017607,
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
    ["17247634663805256044"] = {
      isStoryNode = true,
      key = "17247634663805256044",
      type = "StoryNode",
      name = "\231\160\180\229\157\143\231\172\172\229\155\155\228\184\170\232\131\189\230\186\144",
      pos = {x = 1949.9494671209627, y = 367.601875709521},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110106_1_6",
        QuestDeatil = "Content_110106_1",
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
            startQuest = "17247634663805256073",
            startPort = "QuestStart",
            endQuest = "17247634663815256078",
            endPort = "In"
          },
          {
            startQuest = "17247634663815256078",
            startPort = "Out",
            endQuest = "17247634663805256063",
            endPort = "In"
          },
          {
            startQuest = "17247634663805256073",
            startPort = "QuestStart",
            endQuest = "17247634663815256079",
            endPort = "In"
          },
          {
            startQuest = "17247634663805256063",
            startPort = "Out",
            endQuest = "17252788429864719521",
            endPort = "In"
          },
          {
            startQuest = "17346080623062323",
            startPort = "Out",
            endQuest = "17346080623062325",
            endPort = "In"
          },
          {
            startQuest = "17252788429864719521",
            startPort = "Out",
            endQuest = "17247634663805256075",
            endPort = "Fail"
          },
          {
            startQuest = "17247634663805256073",
            startPort = "QuestStart",
            endQuest = "17253323079847832962",
            endPort = "In"
          },
          {
            startQuest = "17346893968734087576",
            startPort = "Out",
            endQuest = "17346080623062323",
            endPort = "In"
          },
          {
            startQuest = "17367527752172827676",
            startPort = "Out",
            endQuest = "17349500147233416380",
            endPort = "In"
          },
          {
            startQuest = "17247634663815256079",
            startPort = "Out",
            endQuest = "17367527752172827676",
            endPort = "In"
          },
          {
            startQuest = "17247634663815256079",
            startPort = "Out",
            endQuest = "17420242267625720691",
            endPort = "In"
          },
          {
            startQuest = "17247634663815256079",
            startPort = "Out",
            endQuest = "17427995388211459",
            endPort = "In"
          },
          {
            startQuest = "17427995388211459",
            startPort = "Out",
            endQuest = "17247634663805256062",
            endPort = "In"
          }
        },
        nodeData = {
          ["17247634663805256062"] = {
            key = "17247634663805256062",
            type = "TalkNode",
            name = "\230\156\136\233\171\147\232\136\177\229\141\179\229\176\134\230\141\159\230\175\129",
            pos = {x = 692.0498755219461, y = 701.881374893708},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11017612,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Communicator",
              OverrideFailBlend = false
            }
          },
          ["17247634663805256063"] = {
            key = "17247634663805256063",
            type = "SendMessageNode",
            name = "\229\188\149\230\147\142\228\184\139\229\177\130\229\164\177\232\180\165",
            pos = {x = 452.24820472187315, y = 869.1365416507929},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EngineeDownFail",
              UnitId = -1
            }
          },
          ["17247634663805256073"] = {
            key = "17247634663805256073",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = -314.04383116883037, y = 430.48538961038963},
            propsData = {ModeType = 0}
          },
          ["17247634663805256074"] = {
            key = "17247634663805256074",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1148.9880853431132, y = 531.5523645993259},
            propsData = {ModeType = 0}
          },
          ["17247634663805256075"] = {
            key = "17247634663805256075",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 993.7169595110772, y = 879.6893455010461},
            propsData = {}
          },
          ["17247634663815256078"] = {
            key = "17247634663815256078",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 193.4336089698419, y = 866.2631344513176},
            propsData = {}
          },
          ["17247634663815256079"] = {
            key = "17247634663815256079",
            type = "BossBattleFinishNode",
            name = "\230\136\144\229\138\159\229\155\158\232\176\131",
            pos = {x = 190.24720769216117, y = 516.1136013045892},
            propsData = {
              SendMessage = "",
              FinishCondition = "JiDianQi_4_On"
            }
          },
          ["17252788429864719521"] = {
            key = "17252788429864719521",
            type = "ShowOrHideTaskIndicatorNode",
            name = "\230\152\190\231\164\186/\233\154\144\232\151\143\228\187\187\229\138\161\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185",
            pos = {x = 724.3688103255837, y = 876.904162884533},
            propsData = {
              IsShow = false,
              GuideType = "P",
              GuideName = "BP_NengyuanTarget4"
            }
          },
          ["17253323079847832962"] = {
            key = "17253323079847832962",
            type = "TalkNode",
            name = "\229\175\185\232\175\157\232\138\130\231\130\185",
            pos = {x = 191.00274189162087, y = 302.2251249029953},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11017610,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Normal",
              OverrideFailBlend = false
            }
          },
          ["17346080623062323"] = {
            key = "17346080623062323",
            type = "TalkNode",
            name = "\232\191\135\229\156\186-SC005-\231\136\134\231\130\184\233\128\131\231\148\159",
            pos = {x = 1307.6275907637234, y = 1116.2553058460837},
            propsData = {
              IsNpcNode = false,
              TalkType = "Cinematic",
              TalkStageName = "",
              ShowFilePath = "/Game/Asset/Cinematics/Sequences/EX01/EX01_SC005/EX01_SC005",
              BlendInTime = 1,
              BlendOutTime = 1,
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
              EndNewTargetPointName = "pNanzhuEscape",
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
          ["17346080623062325"] = {
            key = "17346080623062325",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1579.5448309063408, y = 1116.1796469930607},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt02/0057_scene_ex01_prepare.0057_scene_ex01_prepare'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {102101},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17346893968734087576"] = {
            key = "17346893968734087576",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 898.959275207551, y = 1146.061249095732},
            propsData = {WaitTime = 2}
          },
          ["17349500147233416380"] = {
            key = "17349500147233416380",
            type = "SpecialQuestSuccessNode",
            name = "\230\136\144\229\138\159\229\174\140\230\136\144\231\137\185\230\174\138\228\187\187\229\138\161",
            pos = {x = 863.6554663367322, y = 549.8253340862037},
            propsData = {}
          },
          ["17367527752172827676"] = {
            key = "17367527752172827676",
            type = "BossBattleFinishNode",
            name = "\229\174\140\230\136\144BOSS\230\136\152\233\152\182\230\174\181",
            pos = {x = 531.8566388069701, y = 533.7895874540943},
            propsData = {
              SendMessage = "",
              FinishCondition = "EngineDownSucc"
            }
          },
          ["17420242267625720691"] = {
            key = "17420242267625720691",
            type = "TalkNode",
            name = "\230\156\136\233\171\147\232\136\177\229\141\179\229\176\134\230\141\159\230\175\129",
            pos = {x = 488.88176964149517, y = 345.1294177472668},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11017611,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Communicator",
              OverrideFailBlend = false
            }
          },
          ["17427995388211459"] = {
            key = "17427995388211459",
            type = "WaitOfTimeNode",
            name = "\229\187\182\232\191\159\231\173\137\229\190\133",
            pos = {x = 375.4096109839817, y = 711.8993135011442},
            propsData = {WaitTime = 8}
          }
        },
        commentData = {}
      }
    },
    ["17248279740025829633"] = {
      isStoryNode = true,
      key = "17248279740025829633",
      type = "StoryNode",
      name = "\231\173\137\229\190\133",
      pos = {x = 1248.3079918547596, y = 590.500874080059},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110106_1_7",
        QuestDeatil = "Content_110106_1",
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
            startQuest = "17248281677165831854",
            startPort = "Out",
            endQuest = "17248279740035829637",
            endPort = "Success"
          },
          {
            startQuest = "17248279740035829634",
            startPort = "QuestStart",
            endQuest = "17248281677165831854",
            endPort = "In"
          },
          {
            startQuest = "17248281852085832531",
            startPort = "Out",
            endQuest = "17248281852085832532",
            endPort = "In"
          },
          {
            startQuest = "17248279740035829634",
            startPort = "QuestStart",
            endQuest = "17248281852085832531",
            endPort = "In"
          },
          {
            startQuest = "17248281852085832532",
            startPort = "Out",
            endQuest = "17248279740035829640",
            endPort = "Fail"
          },
          {
            startQuest = "17248279740035829634",
            startPort = "QuestStart",
            endQuest = "17362385560204170",
            endPort = "In"
          }
        },
        nodeData = {
          ["17248279740035829634"] = {
            key = "17248279740035829634",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 544.4000000000004, y = 306},
            propsData = {ModeType = 0}
          },
          ["17248279740035829637"] = {
            key = "17248279740035829637",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1503.9393939394, y = 278.38383838383845},
            propsData = {ModeType = 0}
          },
          ["17248279740035829640"] = {
            key = "17248279740035829640",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1512.2222222222279, y = 477.67676767676835},
            propsData = {}
          },
          ["17248281677165831854"] = {
            key = "17248281677165831854",
            type = "WaitingMechanismEnterStateNode",
            name = "\233\157\158\230\149\153\229\173\166\231\172\172\228\184\128\228\184\170\230\156\186\229\133\179\229\143\175\230\137\147",
            pos = {x = 1035.6520549109512, y = 275.9104342122739},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1640094,
              StateId = 111022,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17248281852085832531"] = {
            key = "17248281852085832531",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1027.2701776157603, y = 470.46781861872506},
            propsData = {}
          },
          ["17248281852085832532"] = {
            key = "17248281852085832532",
            type = "SendMessageNode",
            name = "\229\188\149\230\147\142\228\184\139\229\177\130\229\164\177\232\180\165",
            pos = {x = 1277.313190259824, y = 477.46333940255636},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EngineeDownFail",
              UnitId = -1
            }
          },
          ["17362385560204170"] = {
            key = "17362385560204170",
            type = "TalkNode",
            name = "\233\128\144\228\184\170\232\167\163\233\148\129\229\177\143\233\154\156",
            pos = {x = 942.7363377957088, y = 70.77944862155417},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11017602,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Communicator",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17248282020885833240"] = {
      isStoryNode = true,
      key = "17248282020885833240",
      type = "StoryNode",
      name = "\231\173\137\229\190\133",
      pos = {x = 1557.236128382236, y = 581.5316608819854},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110106_1_8",
        QuestDeatil = "Content_110106_1",
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
            startQuest = "17248282020885833248",
            startPort = "Out",
            endQuest = "17248282020885833249",
            endPort = "In"
          },
          {
            startQuest = "17248282020885833244",
            startPort = "QuestStart",
            endQuest = "17248282020885833248",
            endPort = "In"
          },
          {
            startQuest = "17248282020885833249",
            startPort = "Out",
            endQuest = "17248282020885833246",
            endPort = "Fail"
          },
          {
            startQuest = "17248282020885833244",
            startPort = "QuestStart",
            endQuest = "17248282213535833932",
            endPort = "In"
          },
          {
            startQuest = "17248282213535833932",
            startPort = "Out",
            endQuest = "17248282020885833245",
            endPort = "Success"
          },
          {
            startQuest = "17248282020885833244",
            startPort = "QuestStart",
            endQuest = "17362385643734500",
            endPort = "In"
          }
        },
        nodeData = {
          ["17248282020885833244"] = {
            key = "17248282020885833244",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17248282020885833245"] = {
            key = "17248282020885833245",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1292.828282828289, y = 261.7171717171718},
            propsData = {ModeType = 0}
          },
          ["17248282020885833246"] = {
            key = "17248282020885833246",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1512.2222222222279, y = 477.67676767676835},
            propsData = {}
          },
          ["17248282020885833248"] = {
            key = "17248282020885833248",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1027.2701776157603, y = 470.46781861872506},
            propsData = {}
          },
          ["17248282020885833249"] = {
            key = "17248282020885833249",
            type = "SendMessageNode",
            name = "\229\188\149\230\147\142\228\184\139\229\177\130\229\164\177\232\180\165",
            pos = {x = 1277.313190259824, y = 477.46333940255636},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EngineeDownFail",
              UnitId = -1
            }
          },
          ["17248282213535833932"] = {
            key = "17248282213535833932",
            type = "WaitingMechanismEnterStateNode",
            name = "\233\157\158\230\149\153\229\173\166\231\172\172\228\186\140\228\184\170\230\156\186\229\133\179\229\143\175\230\137\147",
            pos = {x = 1028.704382350491, y = 267.2100234550855},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1640093,
              StateId = 111022,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17362385643734500"] = {
            key = "17362385643734500",
            type = "TalkNode",
            name = "\232\191\152\230\156\137\228\184\164\228\184\170\232\166\129\229\164\132\231\144\134",
            pos = {x = 1069.532335907336, y = -20.43388030888019},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11017605,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Communicator",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17248282039195833373"] = {
      isStoryNode = true,
      key = "17248282039195833373",
      type = "StoryNode",
      name = "\231\173\137\229\190\133",
      pos = {x = 1837.9361283822357, y = 590.6322456773071},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110106_1_9",
        QuestDeatil = "Content_110106_1",
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
            startQuest = "17248282039205833381",
            startPort = "Out",
            endQuest = "17248282039205833382",
            endPort = "In"
          },
          {
            startQuest = "17248282039205833377",
            startPort = "QuestStart",
            endQuest = "17248282039205833381",
            endPort = "In"
          },
          {
            startQuest = "17248282039205833382",
            startPort = "Out",
            endQuest = "17248282039205833379",
            endPort = "Fail"
          },
          {
            startQuest = "17248282502085834845",
            startPort = "Out",
            endQuest = "17248282039205833378",
            endPort = "Success"
          },
          {
            startQuest = "17248282039205833377",
            startPort = "QuestStart",
            endQuest = "17248282502085834845",
            endPort = "In"
          },
          {
            startQuest = "17248282039205833377",
            startPort = "QuestStart",
            endQuest = "17362385739674908",
            endPort = "In"
          }
        },
        nodeData = {
          ["17248282039205833377"] = {
            key = "17248282039205833377",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17248282039205833378"] = {
            key = "17248282039205833378",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 1503.9393939394, y = 278.38383838383845},
            propsData = {ModeType = 0}
          },
          ["17248282039205833379"] = {
            key = "17248282039205833379",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1512.2222222222279, y = 477.67676767676835},
            propsData = {}
          },
          ["17248282039205833381"] = {
            key = "17248282039205833381",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 1027.2701776157603, y = 470.46781861872506},
            propsData = {}
          },
          ["17248282039205833382"] = {
            key = "17248282039205833382",
            type = "SendMessageNode",
            name = "\229\188\149\230\147\142\228\184\139\229\177\130\229\164\177\232\180\165",
            pos = {x = 1277.313190259824, y = 477.46333940255636},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EngineeDownFail",
              UnitId = -1
            }
          },
          ["17248282502085834845"] = {
            key = "17248282502085834845",
            type = "WaitingMechanismEnterStateNode",
            name = "\230\156\128\229\144\142\228\184\128\228\184\170\230\156\186\229\133\179\229\143\175\230\137\147",
            pos = {x = 1063.4027950489033, y = 286.1878012328633},
            propsData = {
              CreateType = "StaticCreator",
              CreateId = 1640092,
              StateId = 111022,
              IsGuideEnable = false,
              GuidePointName = ""
            }
          },
          ["17362385739674908"] = {
            key = "17362385739674908",
            type = "TalkNode",
            name = "\232\191\152\230\156\137\230\156\128\229\144\142\228\184\128\228\184\170",
            pos = {x = 1116, y = 31.999999999999943},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11017608,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Communicator",
              OverrideFailBlend = false
            }
          }
        },
        commentData = {}
      }
    },
    ["17552626048232131414"] = {
      isStoryNode = true,
      key = "17552626048232131414",
      type = "StoryNode",
      name = "\228\187\187\229\138\161\232\138\130\231\130\185",
      pos = {x = 656.0952380952381, y = 380.4821428571429},
      propsData = {
        QuestId = 0,
        QuestDescriptionComment = "",
        QuestDescription = "Description_110106_1",
        QuestDeatil = "Content_110106_1",
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
            startQuest = "17552626061712131501",
            startPort = "Out",
            endQuest = "17552626061712131502",
            endPort = "In"
          },
          {
            startQuest = "17552626061712131502",
            startPort = "Out",
            endQuest = "17552626061712131503",
            endPort = "In"
          },
          {
            startQuest = "17552626061712131503",
            startPort = "Out",
            endQuest = "17552626061712131504",
            endPort = "In"
          },
          {
            startQuest = "17552626061712131500",
            startPort = "Out",
            endQuest = "17552626061712131506",
            endPort = "In"
          },
          {
            startQuest = "17552626061712131504",
            startPort = "Out",
            endQuest = "17552626061712131505",
            endPort = "In"
          },
          {
            startQuest = "17552626048232131415",
            startPort = "QuestStart",
            endQuest = "17552626061712131501",
            endPort = "In"
          },
          {
            startQuest = "17552626048232131415",
            startPort = "QuestStart",
            endQuest = "17552626061712131500",
            endPort = "In"
          },
          {
            startQuest = "17552626048232131415",
            startPort = "QuestStart",
            endQuest = "17552626061712131498",
            endPort = "In"
          },
          {
            startQuest = "17552626061712131498",
            startPort = "Out",
            endQuest = "17552626048652131421",
            endPort = "Fail"
          },
          {
            startQuest = "17552626061712131506",
            startPort = "Out",
            endQuest = "17552626048652131418",
            endPort = "Success"
          },
          {
            startQuest = "17552626061712131505",
            startPort = "Out",
            endQuest = "17552626061712131499",
            endPort = "In"
          }
        },
        nodeData = {
          ["17552626048232131415"] = {
            key = "17552626048232131415",
            type = "QuestStartNode",
            name = "QuestStart",
            pos = {x = 342, y = 302},
            propsData = {ModeType = 0}
          },
          ["17552626048652131418"] = {
            key = "17552626048652131418",
            type = "QuestSuccessNode",
            name = "QuestSuccess",
            pos = {x = 2800, y = 300},
            propsData = {ModeType = 0}
          },
          ["17552626048652131421"] = {
            key = "17552626048652131421",
            type = "QuestFailNode",
            name = "QuestFail",
            pos = {x = 1593.076923076923, y = 829.2307692307693},
            propsData = {}
          },
          ["17552626061712131498"] = {
            key = "17552626061712131498",
            type = "WaitingSpecialQuestFailNode",
            name = "\231\173\137\229\190\133\231\137\185\230\174\138\228\187\187\229\138\161\229\164\177\232\180\165",
            pos = {x = 904.1644676197977, y = 780.5995011115704},
            propsData = {}
          },
          ["17552626061712131499"] = {
            key = "17552626061712131499",
            type = "SendMessageNode",
            name = "\230\137\147\229\188\128\228\186\149\231\155\150",
            pos = {x = 2319.161006930982, y = 160.40253345044755},
            propsData = {
              MessageType = "GameMode",
              MessageContent = "EngineUpFinish",
              UnitId = -1
            }
          },
          ["17552626061712131500"] = {
            key = "17552626061712131500",
            type = "GoToNode",
            name = "GOTO - \229\137\141\229\190\128\229\134\133\233\131\168",
            pos = {x = 931.045305664419, y = 367.4979985184261},
            propsData = {
              GuideUIEnable = false,
              StaticCreatorId = 1111010507,
              GuideType = "M",
              GuidePointName = "questpoint1111010507"
            }
          },
          ["17552626061712131501"] = {
            key = "17552626061712131501",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 840.3024080239227, y = 123.01340211423627},
            propsData = {
              ActiveEnable = true,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1640409}
            }
          },
          ["17552626061712131502"] = {
            key = "17552626061712131502",
            type = "PickUpNode",
            name = "\230\139\190\229\143\150\231\137\169\229\147\129",
            pos = {x = 1088.9305238596994, y = 115.40049888842982},
            propsData = {
              bActiveEnable = true,
              StaticCreatorIdList = {},
              QuestPickupId = -1,
              UnitId = 11006,
              UnitCount = 1,
              bGuideUIEnable = true,
              GuideType = "P",
              GuidePointName = "BP_XiaChengMen",
              IsUseCount = false
            }
          },
          ["17552626061712131503"] = {
            key = "17552626061712131503",
            type = "ChangeStaticCreatorNode",
            name = "\233\148\128\230\175\129\231\187\180\229\133\139\233\129\151\231\137\169",
            pos = {x = 1374.6374979481468, y = 130.52319979391933},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1640563}
            }
          },
          ["17552626061712131504"] = {
            key = "17552626061712131504",
            type = "ChangeStaticCreatorNode",
            name = "\231\148\159\230\136\144/\233\148\128\230\175\129\232\138\130\231\130\185",
            pos = {x = 1611.646870013546, y = 158.95633015393852},
            propsData = {
              ActiveEnable = false,
              EnableBlackScreenSync = false,
              EnableFadeIn = false,
              EnableFadeOut = false,
              NewTargetPointName = "",
              StaticCreatorIdList = {1640409}
            }
          },
          ["17552626061712131505"] = {
            key = "17552626061712131505",
            type = "PlayOrStopBGMNode",
            name = "BGM\232\138\130\231\130\185",
            pos = {x = 1968.7279667353482, y = 158.78632206787023},
            propsData = {
              SoundStateType = 0,
              SoundPriority = 0,
              SoundType = 0,
              SoundPath = "event:/bgm/cbt02/FMODEvent'/Game/Asset/Audio/FMOD/Events/bgm/cbt02/0061_scene_ex01_escape.0061_scene_ex01_escape'",
              ParamKey = "",
              ParamValue = 0,
              RelatedRegionId = {102101},
              ClientRelatedRegionId = {},
              bStoreToServer = true
            }
          },
          ["17552626061712131506"] = {
            key = "17552626061712131506",
            type = "TalkNode",
            name = "\229\174\140\230\136\144\230\137\128\230\156\137\229\188\128\232\189\166\231\154\132\229\175\185\232\175\157",
            pos = {x = 2171.697591976077, y = 338.76756202282036},
            propsData = {
              IsNpcNode = false,
              FirstDialogueId = 11017601,
              FlowAssetPath = "",
              TalkType = "Guide",
              bIsStandalone = true,
              GuideMeshIndexList = {},
              IsPlayStartSound = false,
              GuideTalkStyle = "Communicator",
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
