local T = {}
T.RT_1 = {QuestId = 11010107}
T.RT_2 = {
  QuestStart = T.RT_1
}
T.RT_3 = {QuestId = 11010108}
T.RT_4 = {
  QuestUnstart = T.RT_3
}
T.RT_5 = {
  T.RT_2,
  T.RT_4
}
T.RT_6 = {
  And = T.RT_5
}
T.RT_7 = {QuestId = 11010305}
T.RT_8 = {
  QuestStart = T.RT_7
}
T.RT_9 = {QuestId = 11010306}
T.RT_10 = {
  QuestUnstart = T.RT_9
}
T.RT_11 = {
  T.RT_8,
  T.RT_10
}
T.RT_12 = {
  And = T.RT_11
}
T.RT_13 = {QuestId = 11010109}
T.RT_14 = {
  QuestStart = T.RT_13
}
T.RT_15 = {QuestId = 11010301}
T.RT_16 = {
  QuestUnstart = T.RT_15
}
T.RT_17 = {
  T.RT_14,
  T.RT_16
}
T.RT_18 = {
  And = T.RT_17
}
T.RT_19 = {QuestId = 10030104}
T.RT_20 = {
  QuestStart = T.RT_19
}
T.RT_21 = {QuestId = 10030105}
T.RT_22 = {
  QuestUnstart = T.RT_21
}
T.RT_23 = {
  T.RT_20,
  T.RT_22
}
T.RT_24 = {
  And = T.RT_23
}
T.RT_25 = {QuestId = 20021200}
T.RT_26 = {
  QuestFinish = T.RT_25
}
T.RT_27 = {TalkTriggerId = 510033}
T.RT_28 = {
  ImprUncomp = T.RT_27
}
T.RT_29 = {TalkTriggerId = 510016}
T.RT_30 = {QuestChainId = 100208}
T.RT_31 = {
  QuestChainFinish = T.RT_30
}
T.RT_32 = {TalkTriggerId = 510022}
T.RT_33 = {QuestId = 20021004}
T.RT_34 = {
  QuestFinish = T.RT_33
}
T.RT_35 = {TalkTriggerId = 510023}
T.RT_36 = {
  ImprComp = T.RT_35
}
T.RT_37 = {QuestId = 20020309}
T.RT_38 = {
  QuestFinish = T.RT_37
}
T.RT_39 = {QuestChainId = 200205}
T.RT_40 = {QuestId = 20020608}
T.RT_41 = {
  QuestFinish = T.RT_40
}
T.RT_42 = {QuestId = 20020706}
T.RT_43 = {
  QuestFinish = T.RT_42
}
T.RT_44 = {QuestId = 20021301}
T.RT_45 = {
  QuestFinish = T.RT_44
}
T.RT_46 = {TalkTriggerId = 510102}
T.RT_47 = {
  ImprComp = T.RT_46
}
T.RT_48 = {TalkTriggerId = 510103}
T.RT_49 = {
  ImprComp = T.RT_48
}
T.RT_50 = {QuestChainId = 100307}
T.RT_51 = {
  QuestChainFinish = T.RT_50
}
T.RT_52 = {TalkTriggerId = 510104}
T.RT_53 = {
  ImprComp = T.RT_52
}
T.RT_54 = {QuestChainId = 100204}
T.RT_55 = {
  QuestChainFinish = T.RT_54
}
T.RT_56 = {ExploreGroupId = 7013098}
T.RT_57 = {
  ExploreGroupInActive = T.RT_56
}
T.RT_58 = {
  ExploreGroupComp = T.RT_56
}
T.RT_59 = {ExploreGroupId = 7013101}
T.RT_60 = {
  ExploreGroupComp = T.RT_59
}
T.RT_61 = {QuestChainId = 110109}
T.RT_62 = {QuestChainId = 100306}
T.RT_63 = {
  QuestChainUnFinish = T.RT_62
}
T.RT_64 = {
  QuestChainFinish = T.RT_62
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("TalkTrigger", {
  [-1] = {
    DialogueId = 10010111,
    TalkTriggerId = -1,
    TalkType = "ForgingGuide"
  },
  [105] = {
    StoryLinePath = "105.story",
    TalkId = 105,
    TalkTriggerId = 105
  },
  [107] = {
    StoryLinePath = "107.story",
    TalkId = 107,
    TalkTriggerId = 107,
    Type = "Impression"
  },
  [1001] = {
    StoryLinePath = "Common/LeaveHintTrigger.story",
    TalkId = 1001,
    TalkTriggerId = 1001
  },
  [1002] = {
    DialogueId = 10012502,
    TalkTriggerId = 1002,
    TalkType = "SpecialQuestFail"
  },
  [3001] = {
    DialogueId = 90000001,
    TalkTriggerId = 3001,
    TalkType = "ForgingGuide"
  },
  [10101] = {
    DialogueId = 60140001,
    TalkTriggerId = 10101,
    TalkType = "AudioOnly"
  },
  [10102] = {
    DialogueId = 60140002,
    TalkTriggerId = 10102,
    TalkType = "AudioOnly"
  },
  [10103] = {
    DialogueId = 60140003,
    TalkTriggerId = 10103,
    TalkType = "AudioOnly"
  },
  [10104] = {
    DialogueId = 60140004,
    TalkTriggerId = 10104,
    TalkType = "AudioOnly"
  },
  [10105] = {
    DialogueId = 60140005,
    TalkTriggerId = 10105,
    TalkType = "AudioOnly"
  },
  [10106] = {
    DialogueId = 60140006,
    TalkTriggerId = 10106,
    TalkType = "AudioOnly"
  },
  [10201] = {
    DialogueId = 60140201,
    TalkTriggerId = 10201,
    TalkType = "AudioOnly"
  },
  [10202] = {
    DialogueId = 60140202,
    TalkTriggerId = 10202,
    TalkType = "AudioOnly"
  },
  [10203] = {
    DialogueId = 60140203,
    TalkTriggerId = 10203,
    TalkType = "AudioOnly"
  },
  [10204] = {
    DialogueId = 60140204,
    TalkTriggerId = 10204,
    TalkType = "AudioOnly"
  },
  [10205] = {
    DialogueId = 60140205,
    TalkTriggerId = 10205,
    TalkType = "AudioOnly"
  },
  [10206] = {
    DialogueId = 60140206,
    TalkTriggerId = 10206,
    TalkType = "AudioOnly"
  },
  [10207] = {
    DialogueId = 60140207,
    TalkTriggerId = 10207,
    TalkType = "AudioOnly"
  },
  [20101] = {
    DialogueId = 60140001,
    TalkTriggerId = 20101,
    TalkType = "Boss"
  },
  [20102] = {
    DialogueId = 60140002,
    TalkTriggerId = 20102,
    TalkType = "Boss"
  },
  [20103] = {
    DialogueId = 60140003,
    TalkTriggerId = 20103,
    TalkType = "Boss"
  },
  [20104] = {
    DialogueId = 60140004,
    TalkTriggerId = 20104,
    TalkType = "Boss"
  },
  [20105] = {
    DialogueId = 60140005,
    TalkTriggerId = 20105,
    TalkType = "Boss"
  },
  [20106] = {
    DialogueId = 60140006,
    TalkTriggerId = 20106,
    TalkType = "Boss"
  },
  [20201] = {
    DialogueId = 60140201,
    TalkTriggerId = 20201,
    TalkType = "Boss"
  },
  [20202] = {
    DialogueId = 60140202,
    TalkTriggerId = 20202,
    TalkType = "Boss"
  },
  [20203] = {
    DialogueId = 60140203,
    TalkTriggerId = 20203,
    TalkType = "Boss"
  },
  [20204] = {
    DialogueId = 60140204,
    TalkTriggerId = 20204,
    TalkType = "Boss"
  },
  [20205] = {
    DialogueId = 60140205,
    TalkTriggerId = 20205,
    TalkType = "Boss"
  },
  [20206] = {
    DialogueId = 60140206,
    TalkTriggerId = 20206,
    TalkType = "Boss"
  },
  [20207] = {
    DialogueId = 60140207,
    TalkTriggerId = 20207,
    TalkType = "Boss"
  },
  [20301] = {
    DialogueId = 60149001,
    TalkTriggerId = 20301,
    TalkType = "UnimportGuide"
  },
  [20302] = {
    DialogueId = 60149002,
    TalkTriggerId = 20302,
    TalkType = "UnimportGuide"
  },
  [20303] = {
    DialogueId = 60149003,
    TalkTriggerId = 20303,
    TalkType = "UnimportGuide"
  },
  [20304] = {
    DialogueId = 60149004,
    TalkTriggerId = 20304,
    TalkType = "UnimportGuide"
  },
  [20305] = {
    DialogueId = 60149005,
    TalkTriggerId = 20305,
    TalkType = "UnimportGuide"
  },
  [20306] = {
    DialogueId = 60149006,
    TalkTriggerId = 20306,
    TalkType = "UnimportGuide"
  },
  [20307] = {
    DialogueId = 60149007,
    TalkTriggerId = 20307,
    TalkType = "UnimportGuide"
  },
  [20308] = {
    DialogueId = 60149008,
    TalkTriggerId = 20308,
    TalkType = "UnimportGuide"
  },
  [20309] = {
    DialogueId = 60149009,
    TalkTriggerId = 20309,
    TalkType = "UnimportGuide"
  },
  [20310] = {
    DialogueId = 60149010,
    TalkTriggerId = 20310,
    TalkType = "UnimportGuide"
  },
  [20311] = {
    DialogueId = 60149011,
    TalkTriggerId = 20311,
    TalkType = "UnimportGuide"
  },
  [20312] = {
    DialogueId = 60149012,
    TalkTriggerId = 20312,
    TalkType = "UnimportGuide"
  },
  [20313] = {
    DialogueId = 60149013,
    TalkTriggerId = 20313,
    TalkType = "UnimportGuide"
  },
  [20314] = {
    DialogueId = 60149014,
    TalkTriggerId = 20314,
    TalkType = "UnimportGuide"
  },
  [20315] = {
    DialogueId = 60149015,
    TalkTriggerId = 20315,
    TalkType = "UnimportGuide"
  },
  [20401] = {
    DialogueId = 60140401,
    TalkTriggerId = 20401,
    TalkType = "Boss"
  },
  [20402] = {
    DialogueId = 60140402,
    TalkTriggerId = 20402,
    TalkType = "Boss"
  },
  [20403] = {
    DialogueId = 60140403,
    TalkTriggerId = 20403,
    TalkType = "Boss"
  },
  [20404] = {
    DialogueId = 60140404,
    TalkTriggerId = 20404,
    TalkType = "Boss"
  },
  [20405] = {
    DialogueId = 60140405,
    TalkTriggerId = 20405,
    TalkType = "Boss"
  },
  [20406] = {
    DialogueId = 60140406,
    TalkTriggerId = 20406,
    TalkType = "Boss"
  },
  [20407] = {
    DialogueId = 60140407,
    TalkTriggerId = 20407,
    TalkType = "Boss"
  },
  [20408] = {
    DialogueId = 60140408,
    TalkTriggerId = 20408,
    TalkType = "Boss"
  },
  [20409] = {
    DialogueId = 60140409,
    TalkTriggerId = 20409,
    TalkType = "Boss"
  },
  [20501] = {
    DialogueId = 60140501,
    TalkTriggerId = 20501,
    TalkType = "Boss"
  },
  [20502] = {
    DialogueId = 60140502,
    TalkTriggerId = 20502,
    TalkType = "Boss"
  },
  [20503] = {
    DialogueId = 60140503,
    TalkTriggerId = 20503,
    TalkType = "Boss"
  },
  [20504] = {
    DialogueId = 60140504,
    TalkTriggerId = 20504,
    TalkType = "Boss"
  },
  [20505] = {
    DialogueId = 60140505,
    TalkTriggerId = 20505,
    TalkType = "Boss"
  },
  [20506] = {
    DialogueId = 60140506,
    TalkTriggerId = 20506,
    TalkType = "Boss"
  },
  [20507] = {
    DialogueId = 60140507,
    TalkTriggerId = 20507,
    TalkType = "Boss"
  },
  [20508] = {
    DialogueId = 60140508,
    TalkTriggerId = 20508,
    TalkType = "Boss"
  },
  [20601] = {
    DialogueId = 60150001,
    TalkTriggerId = 20601,
    TalkType = "AudioOnly"
  },
  [20602] = {
    DialogueId = 60150002,
    TalkTriggerId = 20602,
    TalkType = "AudioOnly"
  },
  [20603] = {
    DialogueId = 60150003,
    TalkTriggerId = 20603,
    TalkType = "AudioOnly"
  },
  [20604] = {
    DialogueId = 60150004,
    TalkTriggerId = 20604,
    TalkType = "AudioOnly"
  },
  [20605] = {
    DialogueId = 60150005,
    TalkTriggerId = 20605,
    TalkType = "AudioOnly"
  },
  [20606] = {
    DialogueId = 60150006,
    TalkTriggerId = 20606,
    TalkType = "AudioOnly"
  },
  [20701] = {
    DialogueId = 60160001,
    TalkTriggerId = 20701,
    TalkType = "UnimportGuide"
  },
  [20702] = {
    DialogueId = 60160002,
    TalkTriggerId = 20702,
    TalkType = "UnimportGuide"
  },
  [20703] = {
    DialogueId = 60160003,
    TalkTriggerId = 20703,
    TalkType = "UnimportGuide"
  },
  [20704] = {
    DialogueId = 60160004,
    TalkTriggerId = 20704,
    TalkType = "UnimportGuide"
  },
  [20705] = {
    DialogueId = 60160005,
    TalkTriggerId = 20705,
    TalkType = "UnimportGuide"
  },
  [20801] = {
    DialogueId = 60170001,
    TalkTriggerId = 20801,
    TalkType = "Boss"
  },
  [20802] = {
    DialogueId = 60170002,
    TalkTriggerId = 20802,
    TalkType = "Boss"
  },
  [20803] = {
    DialogueId = 60170003,
    TalkTriggerId = 20803,
    TalkType = "Boss"
  },
  [100125] = {
    StoryLinePath = "Common/100125.story",
    TalkId = 100125,
    TalkTriggerId = 100125
  },
  [100142] = {
    StoryLinePath = "Other/100142.story",
    TalkTriggerId = 100142
  },
  [100143] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/AogeTraceEnlik.story",
    TalkId = 100143,
    TalkTriggerId = 100143,
    TriggerCondition = {
      And = {
        {
          QuestStart = {QuestId = 10020652}
        },
        {
          QuestUnstart = {QuestId = 10020604}
        }
      }
    }
  },
  [100144] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/EnlikeIcelake.story",
    TalkId = 100144,
    TalkTriggerId = 100144,
    TriggerCondition = {
      And = {
        {
          QuestStart = {QuestId = 10020608}
        },
        {
          QuestUnstart = {QuestId = 10020611}
        }
      }
    }
  },
  [100295] = {TalkId = 100295, TalkTriggerId = 100295},
  [101043] = {
    StoryLinePath = "Other/101043.story",
    TalkTriggerId = 101043
  },
  [101050] = {
    DialogueId = 10105001,
    TalkTriggerId = 101050,
    TalkType = "Guide"
  },
  [101051] = {
    DialogueId = 10105101,
    TalkTriggerId = 101051,
    TalkType = "Guide"
  },
  [101052] = {
    DialogueId = 10105201,
    TalkId = 101052,
    TalkTriggerId = 101052,
    TalkType = "Guide"
  },
  [101120] = {
    DialogueId = 10112001,
    TalkTriggerId = 101120,
    TalkType = "Guide"
  },
  [101180] = {
    StoryLinePath = "Other/101180.story",
    TalkId = 101180,
    TalkTriggerId = 101180
  },
  [110118] = {
    StoryLinePath = "Impression/EX01Fort/Gossip/Kajia1.story",
    TalkId = 110118,
    TalkTriggerId = 110118,
    TriggerCondition = {
      And = {
        {
          QuestStart = {QuestId = 11010510}
        },
        {
          QuestUnstart = {QuestId = 11010521}
        }
      }
    }
  },
  [110119] = {
    StoryLinePath = "Impression/EX01Fort/Gossip/LaiAng.story",
    TalkId = 110119,
    TalkTriggerId = 110119,
    TriggerCondition = {
      QuestFinish = {QuestId = 11010508}
    }
  },
  [110120] = {
    StoryLinePath = "Impression/EX01Fort/Task/impression09.story",
    TalkId = 110120,
    TalkTriggerId = 110120,
    TriggerCondition = T.RT_6,
    Type = "Impression"
  },
  [110121] = {
    StoryLinePath = "Impression/EX01Fort/Task/impression10.story",
    TalkId = 110121,
    TalkTriggerId = 110121,
    TriggerCondition = T.RT_6,
    Type = "Impression"
  },
  [110122] = {
    StoryLinePath = "Impression/EX01Fort/Task/impression03.story",
    TalkTriggerId = 110122,
    TriggerCondition = {
      And = {
        {
          QuestStart = {QuestId = 11010516}
        },
        {
          QuestUnstart = {QuestId = 11010517}
        }
      }
    },
    Type = "Impression"
  },
  [110123] = {
    StoryLinePath = "Impression/EX01Fort/Gossip/AwaTalk1.story",
    TalkId = 110123,
    TalkTriggerId = 110123,
    TriggerCondition = T.RT_12
  },
  [110124] = {
    StoryLinePath = "Impression/EX01Fort/Gossip/AwaTalk2.story",
    TalkId = 110124,
    TalkTriggerId = 110124,
    TriggerCondition = {
      QuestStart = {QuestId = 11010511}
    }
  },
  [110125] = {
    StoryLinePath = "Impression/EX01Fort/Gossip/Monica1.story",
    TalkId = 110125,
    TalkTriggerId = 110125,
    TriggerCondition = T.RT_12
  },
  [110126] = {
    StoryLinePath = "Impression/EX01Fort/Gossip/HurtBubble01.story",
    TalkId = 110126,
    TalkTriggerId = 110126,
    TriggerCondition = T.RT_18
  },
  [110127] = {
    StoryLinePath = "Impression/EX01Fort/Gossip/HurtBubble02.story",
    TalkId = 110127,
    TalkTriggerId = 110127,
    TriggerCondition = T.RT_18
  },
  [110128] = {
    StoryLinePath = "TalkGossip/110128_Dafu.story",
    TalkId = 110128,
    TalkTriggerId = 110128,
    TriggerCondition = T.RT_6
  },
  [110129] = {
    StoryLinePath = "Impression/EX01Fort/Gossip/SoldierBubble01.story",
    TalkId = 110129,
    TalkTriggerId = 110129,
    TriggerCondition = T.RT_6
  },
  [110130] = {
    StoryLinePath = "Impression/EX01Fort/Gossip/SoldierBubble02.story",
    TalkId = 110130,
    TalkTriggerId = 110130,
    TriggerCondition = T.RT_6
  },
  [110131] = {
    StoryLinePath = "Impression/EX01Fort/Gossip/SoldierBubble03.story",
    TalkId = 110131,
    TalkTriggerId = 110131,
    TriggerCondition = T.RT_6
  },
  [110132] = {
    StoryLinePath = "Impression/EX01Fort/Gossip/MonikaWeike.story",
    TalkId = 110132,
    TalkTriggerId = 110132,
    TriggerCondition = {
      VarEqual = {
        Name = "Weike110103",
        Value = 1
      }
    }
  },
  [110133] = {
    StoryLinePath = "Impression/EX01Fort/Gossip/SoldierBubble04.story",
    TalkId = 110133,
    TalkTriggerId = 110133,
    TriggerCondition = T.RT_6
  },
  [110134] = {
    StoryLinePath = "Impression/EX01Fort/Gossip/SoldierBubble05.story",
    TalkId = 110134,
    TalkTriggerId = 110134,
    TriggerCondition = T.RT_6
  },
  [110135] = {
    StoryLinePath = "Impression/EX01Fort/Gossip/SoldierBubble06.story",
    TalkId = 110135,
    TalkTriggerId = 110135,
    TriggerCondition = T.RT_6
  },
  [110136] = {
    StoryLinePath = "Impression/EX01Fort/Gossip/DafuLinshi.story",
    TalkId = 110136,
    TalkTriggerId = 110136,
    TriggerCondition = {
      And = {
        {
          QuestStart = T.RT_15
        },
        {
          QuestUnstart = {QuestId = 11010308}
        }
      }
    }
  },
  [200008] = {
    StoryLinePath = "TalkGossip/AfterQuest/200102_1_End.story",
    TalkId = 200008,
    TalkTriggerId = 200008,
    TriggerCondition = {
      QuestFinish = {QuestId = 20010201}
    }
  },
  [200009] = {
    StoryLinePath = "TalkGossip/AfterQuest/200102_2_End.story",
    TalkId = 200009,
    TalkTriggerId = 200009,
    TriggerCondition = {
      And = {
        {
          QuestChainFinish = {QuestChainId = 200102}
        },
        {
          QuestUnstart = {QuestId = 10020607}
        }
      }
    }
  },
  [200010] = {
    StoryLinePath = "Impression/IceLakeCity/200104_1_End.story",
    TalkId = 200010,
    TalkTriggerId = 200010,
    TriggerCondition = {
      QuestChainFinish = {QuestChainId = 200104}
    }
  },
  [200011] = {
    StoryLinePath = "Impression/IceLakeCity/200103_End.story",
    TalkId = 200011,
    TalkTriggerId = 200011,
    TriggerCondition = {
      And = {
        {
          QuestChainFinish = {QuestChainId = 200103}
        },
        {
          QuestUnstart = {QuestId = 10020302}
        }
      }
    }
  },
  [300100] = {
    StoryLinePath = "BubbleTalk/10030001.story",
    TalkId = 300100,
    TalkTriggerId = 300100,
    TriggerCondition = T.RT_24
  },
  [300101] = {
    StoryLinePath = "BubbleTalk/10030001.story",
    TalkId = 300101,
    TalkTriggerId = 300101,
    TriggerCondition = T.RT_24
  },
  [300102] = {
    StoryLinePath = "BubbleTalk/10030001.story",
    TalkId = 300102,
    TalkTriggerId = 300102,
    TriggerCondition = T.RT_24
  },
  [300103] = {
    StoryLinePath = "BubbleTalk/10030001.story",
    TalkId = 300103,
    TalkTriggerId = 300103,
    TriggerCondition = T.RT_24
  },
  [300104] = {
    StoryLinePath = "BubbleTalk/10030001.story",
    TalkId = 300104,
    TalkTriggerId = 300104,
    TriggerCondition = T.RT_24
  },
  [300105] = {
    StoryLinePath = "BubbleTalk/10030001.story",
    TalkId = 300105,
    TalkTriggerId = 300105,
    TriggerCondition = T.RT_24
  },
  [300106] = {
    StoryLinePath = "BubbleTalk/10030510.story",
    TalkId = 300106,
    TalkTriggerId = 300106,
    TriggerCondition = {
      QuestFinish = {QuestId = 10030398}
    }
  },
  [300107] = {
    StoryLinePath = "BubbleTalk/10030511.story",
    TalkId = 300107,
    TalkTriggerId = 300107
  },
  [300108] = {
    StoryLinePath = "BubbleTalk/10030512.story",
    TalkId = 300108,
    TalkTriggerId = 300108
  },
  [300109] = {
    StoryLinePath = "BubbleTalk/10030001.story",
    TalkId = 300109,
    TalkTriggerId = 300109
  },
  [300110] = {
    StoryLinePath = "BubbleTalk/10030001.story",
    TalkId = 300110,
    TalkTriggerId = 300110
  },
  [300111] = {
    StoryLinePath = "BubbleTalk/10030001.story",
    TalkId = 300111,
    TalkTriggerId = 300111
  },
  [300112] = {
    StoryLinePath = "BubbleTalk/10030001.story",
    TalkId = 300112,
    TalkTriggerId = 300112
  },
  [300113] = {
    StoryLinePath = "BubbleTalk/10030001.story",
    TalkId = 300113,
    TalkTriggerId = 300113
  },
  [500001] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500001.story",
    TalkId = 500001,
    TalkTriggerId = 500001,
    TriggerCondition = T.RT_26
  },
  [500002] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500002.story",
    TalkId = 500002,
    TalkTriggerId = 500002
  },
  [500003] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500003.story",
    TalkId = 500003,
    TalkTriggerId = 500003
  },
  [500004] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500004.story",
    TalkId = 500004,
    TalkTriggerId = 500004,
    TriggerCondition = {
      ImprUncomp = {TalkTriggerId = 510008}
    }
  },
  [500005] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500005.story",
    TalkId = 500005,
    TalkTriggerId = 500005
  },
  [500006] = {TalkId = 500006, TalkTriggerId = 500006},
  [500007] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500007.story",
    TalkId = 500007,
    TalkTriggerId = 500007
  },
  [500008] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500008.story",
    TalkId = 500008,
    TalkTriggerId = 500008
  },
  [500009] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500009.story",
    TalkId = 500009,
    TalkTriggerId = 500009
  },
  [500010] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500010.story",
    TalkId = 500010,
    TalkTriggerId = 500010
  },
  [500011] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500011.story",
    TalkId = 500011,
    TalkTriggerId = 500011
  },
  [500012] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500012.story",
    TalkId = 500012,
    TalkTriggerId = 500012
  },
  [500013] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500013.story",
    TalkId = 500013,
    TalkTriggerId = 500013,
    TriggerCondition = {
      VarEqual = {Name = "XiAoStage", Value = 0}
    }
  },
  [500014] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500014.story",
    TalkId = 500014,
    TalkTriggerId = 500014,
    TriggerCondition = {
      VarEqual = {Name = "XiAoStage", Value = 1}
    }
  },
  [500015] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500015.story",
    TalkId = 500015,
    TalkTriggerId = 500015
  },
  [500016] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500016.story",
    TalkId = 500016,
    TalkTriggerId = 500016
  },
  [500017] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500017.story",
    TalkId = 500017,
    TalkTriggerId = 500017
  },
  [500018] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500018.story",
    TalkId = 500018,
    TalkTriggerId = 500018,
    TriggerCondition = T.RT_28
  },
  [500019] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500019.story",
    TalkId = 500019,
    TalkTriggerId = 500019
  },
  [500020] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500020.story",
    TalkId = 500020,
    TalkTriggerId = 500020
  },
  [500021] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500021.story",
    TalkId = 500021,
    TalkTriggerId = 500021
  },
  [500022] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500022.story",
    TalkId = 500022,
    TalkTriggerId = 500022,
    TriggerCondition = {
      QuestFinish = {QuestId = 20020104}
    }
  },
  [500023] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500023.story",
    TalkId = 500023,
    TalkTriggerId = 500023
  },
  [500024] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500024.story",
    TalkId = 500024,
    TalkTriggerId = 500024
  },
  [500025] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500025.story",
    TalkId = 500025,
    TalkTriggerId = 500025
  },
  [500026] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500026.story",
    TalkId = 500026,
    TalkTriggerId = 500026
  },
  [500027] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500027.story",
    TalkId = 500027,
    TalkTriggerId = 500027,
    TriggerCondition = {
      VarEqual = {Name = "DaDunStage", Value = 0}
    }
  },
  [500028] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500028.story",
    TalkId = 500028,
    TalkTriggerId = 500028,
    TriggerCondition = {
      ImprUncomp = T.RT_29
    }
  },
  [500029] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500029.story",
    TalkId = 500029,
    TalkTriggerId = 500029
  },
  [500030] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500030.story",
    TalkId = 500030,
    TalkTriggerId = 500030
  },
  [500031] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500031.story",
    TalkId = 500031,
    TalkTriggerId = 500031
  },
  [500032] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500032.story",
    TalkId = 500032,
    TalkTriggerId = 500032
  },
  [500033] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500033.story",
    TalkId = 500033,
    TalkTriggerId = 500033
  },
  [500034] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500034.story",
    TalkId = 500034,
    TalkTriggerId = 500034
  },
  [500035] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500035.story",
    TalkId = 500035,
    TalkTriggerId = 500035
  },
  [500036] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500036.story",
    TalkId = 500036,
    TalkTriggerId = 500036
  },
  [500037] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500037.story",
    TalkId = 500037,
    TalkTriggerId = 500037,
    TriggerCondition = T.RT_28
  },
  [500038] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500038.story",
    TalkId = 500038,
    TalkTriggerId = 500038
  },
  [500039] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500039.story",
    TalkId = 500039,
    TalkTriggerId = 500039
  },
  [500040] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500040.story",
    TalkId = 500040,
    TalkTriggerId = 500040
  },
  [500041] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500041.story",
    TalkId = 500041,
    TalkTriggerId = 500041,
    TriggerCondition = {
      ImprUncomp = {TalkTriggerId = 510018}
    }
  },
  [500042] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500042.story",
    TalkId = 500042,
    TalkTriggerId = 500042
  },
  [500043] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500043.story",
    TalkId = 500043,
    TalkTriggerId = 500043,
    TriggerCondition = T.RT_31
  },
  [500044] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500044.story",
    TalkId = 500044,
    TalkTriggerId = 500044
  },
  [500045] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500045.story",
    TalkId = 500045,
    TalkTriggerId = 500045
  },
  [500046] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500046.story",
    TalkId = 500046,
    TalkTriggerId = 500046
  },
  [500047] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500047.story",
    TalkId = 500047,
    TalkTriggerId = 500047,
    TriggerCondition = {
      ImprUncomp = {TalkTriggerId = 510020}
    }
  },
  [500048] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500048.story",
    TalkId = 500048,
    TalkTriggerId = 500048,
    TriggerCondition = {
      ImprComp = T.RT_32
    }
  },
  [500049] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500049.story",
    TalkId = 500049,
    TalkTriggerId = 500049,
    TriggerCondition = {
      ImprUncomp = {TalkTriggerId = 510053}
    }
  },
  [500050] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500050.story",
    TalkId = 500050,
    TalkTriggerId = 500050,
    TriggerCondition = {
      ImprUncomp = {TalkTriggerId = 510042}
    }
  },
  [500051] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500051.story",
    TalkId = 500051,
    TalkTriggerId = 500051,
    TriggerCondition = T.RT_34
  },
  [500052] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500052.story",
    TalkId = 500052,
    TalkTriggerId = 500052
  },
  [500053] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500053.story",
    TalkId = 500053,
    TalkTriggerId = 500053,
    TriggerCondition = {
      ImprUncomp = {TalkTriggerId = 510070}
    }
  },
  [500054] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500054.story",
    TalkId = 500054,
    TalkTriggerId = 500054
  },
  [500055] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500055.story",
    TalkId = 500055,
    TalkTriggerId = 500055
  },
  [500056] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500056.story",
    TalkId = 500056,
    TalkTriggerId = 500056
  },
  [500057] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500057.story",
    TalkId = 500057,
    TalkTriggerId = 500057,
    TriggerCondition = {
      VarEqual = {Name = "XiAoStage", Value = 2}
    }
  },
  [500058] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500058.story",
    TalkId = 500058,
    TalkTriggerId = 500058,
    TriggerCondition = {
      VarEqual = {Name = "DaDunStage", Value = 1}
    }
  },
  [500059] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/500059.story",
    TalkId = 500059,
    TalkTriggerId = 500059
  },
  [500080] = {
    StoryLinePath = "Impression/IceLakeCity/500080_Hesite.story",
    TalkId = 500080,
    TalkTriggerId = 500080,
    Type = "Impression"
  },
  [510002] = {
    StoryLinePath = "Impression/IceLakeCity/510002_XilinFuren.story",
    TalkId = 510002,
    TalkTriggerId = 510002,
    TriggerCondition = {
      QuestChainStart = {QuestChainId = 200201}
    },
    Type = "Impression"
  },
  [510005] = {
    StoryLinePath = "Impression/IceLakeCity/510005_Aiersha_2.story",
    TalkId = 510005,
    TalkTriggerId = 510005,
    TriggerCondition = {
      QuestFinish = {QuestId = 20020306}
    },
    Type = "Impression"
  },
  [510007] = {
    RewardId = 4000003,
    StoryLinePath = "Impression/IceLakeCity/510007_Alice_1.story",
    TalkId = 510007,
    TalkTriggerId = 510007,
    TriggerCondition = {
      QuestFinish = {QuestId = 20020313}
    },
    Type = "Impression"
  },
  [510009] = {
    TalkId = 510009,
    TalkTriggerId = 510009,
    TriggerCondition = {
      QuestChainFinish = {QuestChainId = 100201}
    },
    Type = "Impression"
  },
  [510010] = {
    StoryLinePath = "Impression/IceLakeCity/510010_Jiexika.story",
    TalkId = 510010,
    TalkTriggerId = 510010,
    TriggerCondition = {
      QuestFinish = {QuestId = 20020202}
    },
    Type = "Impression"
  },
  [510011] = {
    RewardId = 4000002,
    StoryLinePath = "Impression/IceLakeCity/510011_Alice_Mading_1.story",
    TalkId = 510011,
    TalkTriggerId = 510011,
    TriggerCondition = {
      QuestStart = {QuestId = 20020305}
    },
    Type = "Impression"
  },
  [510012] = {
    StoryLinePath = "Impression/IceLakeCity/510012_Kenong.story",
    TalkId = 510012,
    TalkTriggerId = 510012,
    Type = "Impression"
  },
  [510014] = {
    StoryLinePath = "Impression/IceLakeCity/510014_Sangni.story",
    TalkId = 510014,
    TalkTriggerId = 510014,
    Type = "Impression"
  },
  [510015] = {
    TalkId = 510015,
    TalkTriggerId = 510015,
    Type = "Impression"
  },
  [510016] = {
    StoryLinePath = "Impression/IceLakeCity/510016_Yagebu.story",
    TalkId = 510016,
    TalkTriggerId = 510016,
    Type = "Impression"
  },
  [510017] = {
    StoryLinePath = "Impression/IceLakeCity/510017_Dadun.story",
    TalkId = 510017,
    TalkTriggerId = 510017,
    Type = "Impression"
  },
  [510019] = {
    StoryLinePath = "Impression/IceLakeCity/510019_Wells_Quarrel.story",
    TalkId = 5100182,
    TalkTriggerId = 510019,
    TriggerCondition = {
      QuestFinish = {QuestId = 20020403}
    },
    Type = "Impression"
  },
  [510022] = {
    StoryLinePath = "Impression/IceLakeCity/510022_Blue_2.story",
    TalkId = 5100192,
    TalkTriggerId = 510022,
    TriggerCondition = {
      QuestFinish = {QuestId = 20020510}
    },
    Type = "Impression"
  },
  [510026] = {
    StoryLinePath = "Impression/IceLakeCity/510026_Kaiwen_1.story",
    TalkId = 510026,
    TalkTriggerId = 510026,
    TriggerCondition = T.RT_26,
    Type = "Impression"
  },
  [510029] = {
    StoryLinePath = "Impression/IceLakeCity/510029_Kami_1.story",
    TalkId = 510029,
    TalkTriggerId = 510029,
    TriggerCondition = {
      QuestStart = {QuestId = 20020600}
    },
    Type = "Impression"
  },
  [510030] = {
    StoryLinePath = "Impression/IceLakeCity/510030_Bake_1.story",
    TalkId = 510030,
    TalkTriggerId = 510030,
    TriggerCondition = {
      QuestChainStart = {QuestChainId = 200206}
    },
    Type = "Impression"
  },
  [510033] = {
    StoryLinePath = "Impression/IceLakeCity/510033_Anuo_1.story",
    TalkId = 510033,
    TalkTriggerId = 510033,
    TriggerCondition = {
      QuestFinish = {QuestId = 20020606}
    },
    Type = "Impression"
  },
  [510035] = {
    StoryLinePath = "Impression/IceLakeCity/510035_Aima_1.story",
    TalkId = 510035,
    TalkTriggerId = 510035,
    TriggerCondition = {
      QuestChainStart = {QuestChainId = 200207}
    },
    Type = "Impression"
  },
  [510036] = {
    StoryLinePath = "Impression/IceLakeCity/510036_Beilinda_1.story",
    TalkId = 510036,
    TalkTriggerId = 510036,
    TriggerCondition = {
      QuestFinish = {QuestId = 20020703}
    },
    Type = "Impression"
  },
  [510037] = {
    RewardId = 4000004,
    StoryLinePath = "Impression/IceLakeCity/510037_Beilinda_2.story",
    TalkId = 510037,
    TalkTriggerId = 510037,
    TriggerCondition = {
      QuestFinish = {QuestId = 20020705}
    },
    Type = "Impression"
  },
  [510039] = {
    StoryLinePath = "Impression/IceLakeCity/510039_Faye_2.story",
    TalkId = 510039,
    TalkTriggerId = 510039,
    TriggerCondition = {
      QuestFinish = {QuestId = 20021101}
    },
    Type = "Impression"
  },
  [510041] = {
    RewardId = 4000006,
    StoryLinePath = "Impression/IceLakeCity/510041_Faye_3.story",
    TalkId = 510041,
    TalkTriggerId = 510041,
    TriggerCondition = {
      QuestFinish = {QuestId = 20021104}
    },
    Type = "Impression"
  },
  [510042] = {
    StoryLinePath = "Impression/IceLakeCity/510042_Heerluo.story",
    TalkId = 510042,
    TalkTriggerId = 510042,
    TriggerCondition = {
      QuestFinish = {QuestId = 20021007}
    },
    Type = "Impression"
  },
  [510050] = {
    StoryLinePath = "Impression/IceLakeCity/510050_Laina.story",
    TalkId = 510050,
    TalkTriggerId = 510050,
    TriggerCondition = {
      And = {
        T.RT_31,
        T.RT_45
      }
    },
    Type = "Impression"
  },
  [510058] = {
    StoryLinePath = "Impression/IceLakeCity/510058_dean.story",
    TalkId = 510058,
    TalkTriggerId = 510058,
    TriggerCondition = {
      QuestChainFinish = {QuestChainId = 100202}
    },
    Type = "Impression"
  },
  [510070] = {
    StoryLinePath = "Impression/IceLakeCity/510070_Liande.story",
    TalkId = 510070,
    TalkTriggerId = 510070,
    TriggerCondition = {
      QuestFinish = {QuestId = 20021901}
    },
    Type = "Impression"
  },
  [510075] = {
    StoryLinePath = "Impression/IceLakeCity/510075_Xueli1.story",
    TalkId = 510075,
    TalkTriggerId = 510075,
    TriggerCondition = {
      QuestFinish = {QuestId = 20022105}
    },
    Type = "Impression"
  },
  [510076] = {
    StoryLinePath = "Impression/IceLakeCity/510076_Xueli2.story",
    TalkId = 510076,
    TalkTriggerId = 510076,
    TriggerCondition = {
      QuestFinish = {QuestId = 20022102}
    },
    Type = "Impression"
  },
  [510080] = {
    StoryLinePath = "Impression/IceLakeCity/510079_Dadun_EndTalk.story",
    TalkId = 510080,
    TalkTriggerId = 510080,
    TriggerCondition = {
      QuestChainFinish = {QuestChainId = 200222}
    }
  },
  [510096] = {
    StoryLinePath = "Impression/IceLakeCity/510096_Lars.story",
    TalkId = 510096,
    TalkTriggerId = 510096,
    TriggerCondition = {
      QuestStart = {QuestId = 20023100}
    }
  },
  [510102] = {
    StoryLinePath = "Impression/IceLakeCity/510102_Liliko_1.story",
    TalkId = 510102,
    TalkTriggerId = 510102,
    Type = "Impression"
  },
  [510103] = {
    StoryLinePath = "Impression/IceLakeCity/510103_Liliko_2.story",
    TalkId = 510103,
    TalkTriggerId = 510103,
    TriggerCondition = {
      And = {
        T.RT_47,
        T.RT_31
      }
    },
    Type = "Impression"
  },
  [510104] = {
    StoryLinePath = "Impression/IceLakeCity/510104_Liliko_3.story",
    TalkId = 510104,
    TalkTriggerId = 510104,
    TriggerCondition = {
      And = {
        T.RT_49,
        T.RT_51
      }
    },
    Type = "Impression"
  },
  [510105] = {
    StoryLinePath = "Impression/IceLakeCity/510105_Kaiwen.story",
    TalkId = 510105,
    TalkTriggerId = 510105,
    Type = "Impression"
  },
  [510106] = {
    StoryLinePath = "Impression/IceLakeCity/510106_Jimu.story",
    TalkId = 510106,
    TalkTriggerId = 510106,
    Type = "Impression"
  },
  [510107] = {
    StoryLinePath = "Impression/IceLakeCity/510107_Beiguanjiaojiao.story",
    TalkId = 510107,
    TalkTriggerId = 510107,
    Type = "Impression"
  },
  [510108] = {
    StoryLinePath = "Impression/IceLakeCity/510108_Daixi.story",
    TalkId = 510108,
    TalkTriggerId = 510108,
    Type = "Impression"
  },
  [510109] = {
    StoryLinePath = "Impression/IceLakeCity/510109_Walun.story",
    TalkId = 510109,
    TalkTriggerId = 510109,
    Type = "Impression"
  },
  [510110] = {
    StoryLinePath = "Impression/IceLakeCity/510110_Halan.story",
    TalkId = 510110,
    TalkTriggerId = 510110,
    Type = "Impression"
  },
  [510111] = {
    StoryLinePath = "Impression/IceLakeCity/510111_Kongkongjiaojiao.story",
    TalkId = 510111,
    TalkTriggerId = 510111,
    Type = "Impression"
  },
  [510112] = {
    StoryLinePath = "Impression/IceLakeCity/510112_Ailisha.story",
    TalkId = 510112,
    TalkTriggerId = 510112,
    TriggerCondition = T.RT_55,
    Type = "Impression"
  },
  [510113] = {
    StoryLinePath = "Impression/IceLakeCity/510113_Miya.story",
    TalkId = 510113,
    TalkTriggerId = 510113,
    TriggerCondition = T.RT_55,
    Type = "Impression"
  },
  [510114] = {
    StoryLinePath = "Impression/IceLakeCity/510114_Yinyudeshaonian.story",
    TalkId = 510114,
    TalkTriggerId = 510114,
    TriggerCondition = T.RT_55,
    Type = "Impression"
  },
  [510115] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/510115.story",
    TalkId = 510115,
    TalkTriggerId = 510115
  },
  [510116] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/510116.story",
    TalkId = 510116,
    TalkTriggerId = 510116
  },
  [510117] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/510117.story",
    TalkId = 510117,
    TalkTriggerId = 510117
  },
  [510118] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/510118.story",
    TalkId = 510118,
    TalkTriggerId = 510118
  },
  [510119] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/510119.story",
    TalkId = 510119,
    TalkTriggerId = 510119
  },
  [510120] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/510120.story",
    TalkId = 510120,
    TalkTriggerId = 510120
  },
  [510122] = {
    StoryLinePath = "Impression/IceLakeCity/510122_Cat.story",
    TalkId = 510122,
    TalkTriggerId = 510122,
    Type = "Impression"
  },
  [600101] = {
    DialogueId = 60010101,
    TalkTriggerId = 600101,
    TalkType = "Guide"
  },
  [600102] = {
    DialogueId = 60010201,
    TalkTriggerId = 600102,
    TalkType = "Guide"
  },
  [600103] = {
    DialogueId = 60010301,
    TalkTriggerId = 600103,
    TalkType = "Guide"
  },
  [600104] = {
    DialogueId = 60010401,
    TalkTriggerId = 600104,
    TalkType = "Guide"
  },
  [600105] = {
    DialogueId = 60010501,
    TalkTriggerId = 600105,
    TalkType = "Guide"
  },
  [600106] = {
    DialogueId = 60010601,
    TalkTriggerId = 600106,
    TalkType = "Guide"
  },
  [600107] = {
    DialogueId = 60010701,
    TalkTriggerId = 600107,
    TalkType = "Guide"
  },
  [600201] = {
    DialogueId = 60020101,
    TalkTriggerId = 600201,
    TalkType = "Guide"
  },
  [600202] = {
    DialogueId = 60020201,
    TalkTriggerId = 600202,
    TalkType = "Guide"
  },
  [600203] = {
    DialogueId = 60020301,
    TalkTriggerId = 600203,
    TalkType = "Guide"
  },
  [600204] = {
    DialogueId = 60020401,
    TalkTriggerId = 600204,
    TalkType = "Guide"
  },
  [600205] = {
    DialogueId = 60020501,
    TalkTriggerId = 600205,
    TalkType = "Guide"
  },
  [600206] = {
    DialogueId = 60020601,
    TalkTriggerId = 600206,
    TalkType = "Guide"
  },
  [600207] = {
    DialogueId = 60020701,
    TalkTriggerId = 600207,
    TalkType = "Guide"
  },
  [600208] = {
    DialogueId = 60020801,
    TalkTriggerId = 600208,
    TalkType = "Guide"
  },
  [600209] = {
    DialogueId = 60020901,
    TalkTriggerId = 600209,
    TalkType = "Guide"
  },
  [600301] = {
    DialogueId = 60030101,
    TalkTriggerId = 600301,
    TalkType = "Guide"
  },
  [600302] = {
    DialogueId = 60030201,
    TalkTriggerId = 600302,
    TalkType = "Guide"
  },
  [600303] = {
    DialogueId = 60030301,
    TalkTriggerId = 600303,
    TalkType = "Guide"
  },
  [600304] = {
    DialogueId = 60030401,
    TalkTriggerId = 600304,
    TalkType = "Guide"
  },
  [600305] = {
    DialogueId = 60030501,
    TalkTriggerId = 600305,
    TalkType = "Guide"
  },
  [600306] = {
    DialogueId = 60030601,
    TalkTriggerId = 600306,
    TalkType = "Guide"
  },
  [600307] = {
    DialogueId = 60030701,
    TalkTriggerId = 600307,
    TalkType = "Guide"
  },
  [600308] = {
    DialogueId = 60030801,
    TalkTriggerId = 600308,
    TalkType = "Guide"
  },
  [600309] = {
    DialogueId = 60030901,
    TalkTriggerId = 600309,
    TalkType = "Guide"
  },
  [600310] = {
    DialogueId = 60031001,
    TalkTriggerId = 600310,
    TalkType = "Guide"
  },
  [600311] = {
    DialogueId = 60031101,
    TalkTriggerId = 600311,
    TalkType = "Guide"
  },
  [600312] = {
    DialogueId = 60031201,
    TalkTriggerId = 600312,
    TalkType = "Guide"
  },
  [600401] = {
    DialogueId = 60040101,
    TalkTriggerId = 600401,
    TalkType = "Guide"
  },
  [600402] = {
    DialogueId = 60040201,
    TalkTriggerId = 600402,
    TalkType = "Guide"
  },
  [600403] = {
    DialogueId = 60040301,
    TalkTriggerId = 600403,
    TalkType = "Guide"
  },
  [600404] = {
    DialogueId = 60040401,
    TalkTriggerId = 600404,
    TalkType = "Guide"
  },
  [600405] = {
    DialogueId = 60040501,
    TalkTriggerId = 600405,
    TalkType = "Guide"
  },
  [600406] = {
    DialogueId = 60040601,
    TalkTriggerId = 600406,
    TalkType = "Guide"
  },
  [600407] = {
    DialogueId = 60040701,
    TalkTriggerId = 600407,
    TalkType = "Guide"
  },
  [600408] = {
    DialogueId = 60040801,
    TalkTriggerId = 600408,
    TalkType = "Guide"
  },
  [600501] = {
    DialogueId = 60050101,
    TalkTriggerId = 600501,
    TalkType = "Guide"
  },
  [600502] = {
    DialogueId = 60050201,
    TalkTriggerId = 600502,
    TalkType = "Guide"
  },
  [600601] = {
    DialogueId = 60060101,
    TalkTriggerId = 600601,
    TalkType = "Guide"
  },
  [600602] = {
    DialogueId = 60060201,
    TalkTriggerId = 600602,
    TalkType = "Guide"
  },
  [600603] = {
    DialogueId = 60060301,
    TalkTriggerId = 600603,
    TalkType = "Guide"
  },
  [600604] = {
    DialogueId = 60060401,
    TalkTriggerId = 600604,
    TalkType = "Guide"
  },
  [600605] = {
    DialogueId = 60060501,
    TalkTriggerId = 600605,
    TalkType = "Guide"
  },
  [600606] = {
    DialogueId = 60060601,
    TalkTriggerId = 600606,
    TalkType = "Guide"
  },
  [600607] = {
    DialogueId = 60060701,
    TalkTriggerId = 600607,
    TalkType = "Guide"
  },
  [600608] = {
    DialogueId = 60060801,
    TalkTriggerId = 600608,
    TalkType = "Guide"
  },
  [600609] = {
    DialogueId = 60060901,
    TalkTriggerId = 600609,
    TalkType = "Guide"
  },
  [601101] = {
    DialogueId = 60110101,
    TalkTriggerId = 601101,
    TalkType = "Guide"
  },
  [601102] = {
    DialogueId = 60110201,
    TalkTriggerId = 601102,
    TalkType = "Guide"
  },
  [601103] = {
    DialogueId = 60110301,
    TalkTriggerId = 601103,
    TalkType = "Guide"
  },
  [601105] = {
    DialogueId = 60110501,
    TalkTriggerId = 601105,
    TalkType = "Guide"
  },
  [601106] = {
    DialogueId = 60110601,
    TalkTriggerId = 601106,
    TalkType = "Guide"
  },
  [601107] = {
    DialogueId = 60110701,
    TalkTriggerId = 601107,
    TalkType = "Guide"
  },
  [601201] = {
    DialogueId = 60120101,
    TalkTriggerId = 601201,
    TalkType = "Guide"
  },
  [601202] = {
    DialogueId = 60120201,
    TalkTriggerId = 601202,
    TalkType = "Guide"
  },
  [601203] = {
    DialogueId = 60120301,
    TalkTriggerId = 601203,
    TalkType = "Guide"
  },
  [601204] = {
    DialogueId = 60120401,
    TalkTriggerId = 601204,
    TalkType = "Guide"
  },
  [601205] = {
    DialogueId = 60120501,
    TalkTriggerId = 601205,
    TalkType = "Guide"
  },
  [601206] = {
    DialogueId = 60120601,
    TalkTriggerId = 601206,
    TalkType = "Guide"
  },
  [601301] = {
    DialogueId = 60130101,
    TalkTriggerId = 601301,
    TalkType = "Guide"
  },
  [601302] = {
    DialogueId = 60130201,
    TalkTriggerId = 601302,
    TalkType = "Guide"
  },
  [601303] = {
    DialogueId = 60130301,
    TalkTriggerId = 601303,
    TalkType = "Guide"
  },
  [601304] = {
    DialogueId = 60130401,
    TalkTriggerId = 601304,
    TalkType = "Guide"
  },
  [601305] = {
    DialogueId = 60130501,
    TalkTriggerId = 601305,
    TalkType = "Guide"
  },
  [601306] = {
    DialogueId = 60130601,
    TalkTriggerId = 601306,
    TalkType = "Guide"
  },
  [601307] = {
    DialogueId = 60130701,
    TalkTriggerId = 601307,
    TalkType = "Guide"
  },
  [601308] = {
    DialogueId = 60130801,
    TalkTriggerId = 601308,
    TalkType = "Guide"
  },
  [602001] = {
    DialogueId = 60200101,
    TalkTriggerId = 602001,
    TalkType = "Guide"
  },
  [602002] = {
    DialogueId = 60200201,
    TalkTriggerId = 602002,
    TalkType = "Guide"
  },
  [602003] = {
    DialogueId = 60200301,
    TalkTriggerId = 602003,
    TalkType = "Guide"
  },
  [602004] = {
    DialogueId = 60200401,
    TalkTriggerId = 602004,
    TalkType = "Guide"
  },
  [602005] = {
    DialogueId = 60200501,
    TalkTriggerId = 602005,
    TalkType = "Guide"
  },
  [602101] = {
    DialogueId = 60210101,
    TalkTriggerId = 602101,
    TalkType = "Guide"
  },
  [602102] = {
    DialogueId = 60210201,
    TalkTriggerId = 602102,
    TalkType = "Guide"
  },
  [602103] = {
    DialogueId = 60210301,
    TalkTriggerId = 602103,
    TalkType = "Guide"
  },
  [602201] = {
    DialogueId = 60220101,
    TalkTriggerId = 602201,
    TalkType = "Guide"
  },
  [602202] = {
    DialogueId = 60220201,
    TalkTriggerId = 602202,
    TalkType = "Guide"
  },
  [602203] = {
    DialogueId = 60220301,
    TalkTriggerId = 602203,
    TalkType = "Guide"
  },
  [602204] = {
    DialogueId = 60220401,
    TalkTriggerId = 602204,
    TalkType = "Guide"
  },
  [602205] = {
    DialogueId = 60220501,
    TalkTriggerId = 602205,
    TalkType = "Guide"
  },
  [602206] = {
    DialogueId = 60220601,
    TalkTriggerId = 602206,
    TalkType = "Guide"
  },
  [602207] = {
    DialogueId = 60220701,
    TalkTriggerId = 602207,
    TalkType = "Guide"
  },
  [602208] = {
    DialogueId = 60220801,
    TalkTriggerId = 602208,
    TalkType = "Guide"
  },
  [602209] = {
    DialogueId = 60220901,
    TalkTriggerId = 602209,
    TalkType = "Guide"
  },
  [602210] = {
    DialogueId = 60221001,
    TalkTriggerId = 602210,
    TalkType = "Guide"
  },
  [602211] = {
    DialogueId = 60221101,
    TalkTriggerId = 602211,
    TalkType = "Guide"
  },
  [602212] = {
    DialogueId = 60221201,
    TalkTriggerId = 602212,
    TalkType = "Guide"
  },
  [602213] = {
    DialogueId = 60221301,
    TalkTriggerId = 602213,
    TalkType = "Guide"
  },
  [602214] = {
    DialogueId = 60221401,
    TalkTriggerId = 602214,
    TalkType = "Guide"
  },
  [602215] = {
    DialogueId = 60221501,
    TalkTriggerId = 602215,
    TalkType = "Guide"
  },
  [602216] = {
    DialogueId = 60221601,
    TalkTriggerId = 602216,
    TalkType = "Guide"
  },
  [602301] = {
    DialogueId = 60230101,
    TalkTriggerId = 602301,
    TalkType = "Guide"
  },
  [602302] = {
    DialogueId = 60230201,
    TalkTriggerId = 602302,
    TalkType = "Guide"
  },
  [602303] = {
    DialogueId = 60230301,
    TalkTriggerId = 602303,
    TalkType = "Guide"
  },
  [602304] = {
    DialogueId = 60230401,
    TalkTriggerId = 602304,
    TalkType = "Guide"
  },
  [603001] = {
    DialogueId = 60300101,
    TalkTriggerId = 603001,
    TalkType = "Guide"
  },
  [608001] = {
    DialogueId = 60800101,
    TalkTriggerId = 608001,
    TalkType = "Guide"
  },
  [699901] = {
    StoryLinePath = "Rogue/Test_1.story",
    TalkId = 699901,
    TalkTriggerId = 699901
  },
  [699902] = {
    StoryLinePath = "Rogue/Test_2.story",
    TalkId = 699902,
    TalkTriggerId = 699902
  },
  [699903] = {
    StoryLinePath = "Rogue/Test_3.story",
    TalkId = 699903,
    TalkTriggerId = 699903
  },
  [699991] = {
    StoryLinePath = "Rogue/699991_Shop_1_Bubble.story",
    TalkId = 699991,
    TalkTriggerId = 699991
  },
  [699992] = {
    StoryLinePath = "Rogue/699992_Shop_1.story",
    TalkId = 699992,
    TalkTriggerId = 699992
  },
  [700001] = {
    DialogueId = 10038101,
    TalkTriggerId = 700001,
    TalkType = "Black"
  },
  [700101] = {
    StoryLinePath = "Observe/Village.story",
    TalkId = 700101,
    TalkTriggerId = 700101
  },
  [700102] = {
    StoryLinePath = "Observe/Village.story",
    TalkId = 700102,
    TalkTriggerId = 700102
  },
  [700103] = {
    StoryLinePath = "Observe/Village.story",
    TalkId = 700103,
    TalkTriggerId = 700103
  },
  [700104] = {
    StoryLinePath = "Observe/Village.story",
    TalkId = 700104,
    TalkTriggerId = 700104
  },
  [700105] = {
    StoryLinePath = "Observe/Village.story",
    TalkId = 700105,
    TalkTriggerId = 700105
  },
  [700106] = {
    StoryLinePath = "Observe/Village.story",
    TalkId = 700106,
    TalkTriggerId = 700106
  },
  [700107] = {
    StoryLinePath = "Observe/Village.story",
    TalkId = 700107,
    TalkTriggerId = 700107
  },
  [700108] = {
    StoryLinePath = "Observe/Village.story",
    TalkId = 700108,
    TalkTriggerId = 700108
  },
  [700109] = {
    StoryLinePath = "Observe/Village.story",
    TalkId = 700109,
    TalkTriggerId = 700109
  },
  [700110] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700110,
    TalkTriggerId = 700110
  },
  [700111] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700111,
    TalkTriggerId = 700111
  },
  [700112] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700112,
    TalkTriggerId = 700112
  },
  [700113] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700113,
    TalkTriggerId = 700113
  },
  [700114] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700114,
    TalkTriggerId = 700114
  },
  [700115] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700115,
    TalkTriggerId = 700115
  },
  [700116] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700116,
    TalkTriggerId = 700116
  },
  [700117] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700117,
    TalkTriggerId = 700117
  },
  [700118] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700118,
    TalkTriggerId = 700118
  },
  [700119] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700119,
    TalkTriggerId = 700119
  },
  [700120] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700120,
    TalkTriggerId = 700120
  },
  [700121] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700121,
    TalkTriggerId = 700121
  },
  [700122] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700122,
    TalkTriggerId = 700122
  },
  [700123] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700123,
    TalkTriggerId = 700123
  },
  [700124] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700124,
    TalkTriggerId = 700124
  },
  [700125] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700125,
    TalkTriggerId = 700125
  },
  [700126] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700126,
    TalkTriggerId = 700126
  },
  [700127] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700127,
    TalkTriggerId = 700127
  },
  [700128] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700128,
    TalkTriggerId = 700128
  },
  [700129] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700129,
    TalkTriggerId = 700129
  },
  [700130] = {
    StoryLinePath = "Observe/IceLakeCity_1.story",
    TalkId = 700130,
    TalkTriggerId = 700130
  },
  [700131] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700131,
    TalkTriggerId = 700131
  },
  [700132] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700132,
    TalkTriggerId = 700132
  },
  [700133] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700133,
    TalkTriggerId = 700133
  },
  [700134] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700134,
    TalkTriggerId = 700134
  },
  [700135] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700135,
    TalkTriggerId = 700135
  },
  [700136] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700136,
    TalkTriggerId = 700136
  },
  [700137] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700137,
    TalkTriggerId = 700137
  },
  [700138] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700138,
    TalkTriggerId = 700138
  },
  [700139] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700139,
    TalkTriggerId = 700139
  },
  [700140] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700140,
    TalkTriggerId = 700140
  },
  [700141] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700141,
    TalkTriggerId = 700141
  },
  [700142] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700142,
    TalkTriggerId = 700142
  },
  [700143] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700143,
    TalkTriggerId = 700143
  },
  [700144] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700144,
    TalkTriggerId = 700144
  },
  [700145] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700145,
    TalkTriggerId = 700145
  },
  [700146] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700146,
    TalkTriggerId = 700146
  },
  [700147] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700147,
    TalkTriggerId = 700147
  },
  [700148] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700148,
    TalkTriggerId = 700148
  },
  [700149] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700149,
    TalkTriggerId = 700149
  },
  [700150] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700150,
    TalkTriggerId = 700150
  },
  [700151] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700151,
    TalkTriggerId = 700151
  },
  [700152] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700152,
    TalkTriggerId = 700152
  },
  [700153] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700153,
    TalkTriggerId = 700153
  },
  [700154] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700154,
    TalkTriggerId = 700154
  },
  [700155] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700155,
    TalkTriggerId = 700155
  },
  [700156] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700156,
    TalkTriggerId = 700156
  },
  [700157] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700157,
    TalkTriggerId = 700157
  },
  [700158] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700158,
    TalkTriggerId = 700158
  },
  [700159] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700159,
    TalkTriggerId = 700159
  },
  [700160] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700160,
    TalkTriggerId = 700160
  },
  [700161] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700161,
    TalkTriggerId = 700161
  },
  [700162] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700162,
    TalkTriggerId = 700162
  },
  [700163] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700163,
    TalkTriggerId = 700163
  },
  [700164] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700164,
    TalkTriggerId = 700164
  },
  [700165] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700165,
    TalkTriggerId = 700165
  },
  [700166] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700166,
    TalkTriggerId = 700166
  },
  [700167] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700167,
    TalkTriggerId = 700167
  },
  [700168] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700168,
    TalkTriggerId = 700168
  },
  [700169] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700169,
    TalkTriggerId = 700169
  },
  [700170] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700170,
    TalkTriggerId = 700170
  },
  [700171] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700171,
    TalkTriggerId = 700171
  },
  [700172] = {
    StoryLinePath = "Observe/EX01.story",
    TalkId = 700172,
    TalkTriggerId = 700172
  },
  [700173] = {
    StoryLinePath = "Observe/EX01.story",
    TalkId = 700173,
    TalkTriggerId = 700173
  },
  [700174] = {
    StoryLinePath = "Observe/EX01.story",
    TalkId = 700174,
    TalkTriggerId = 700174
  },
  [700175] = {
    StoryLinePath = "Observe/EX01.story",
    TalkId = 700175,
    TalkTriggerId = 700175
  },
  [700176] = {
    StoryLinePath = "Observe/EX01.story",
    TalkId = 700176,
    TalkTriggerId = 700176
  },
  [700177] = {
    StoryLinePath = "Observe/EX01.story",
    TalkId = 700177,
    TalkTriggerId = 700177
  },
  [700178] = {
    StoryLinePath = "Observe/EX01.story",
    TalkId = 700178,
    TalkTriggerId = 700178
  },
  [700179] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700179,
    TalkTriggerId = 700179
  },
  [700180] = {
    StoryLinePath = "Observe/EX01.story",
    TalkId = 700180,
    TalkTriggerId = 700180
  },
  [700181] = {
    StoryLinePath = "Observe/IceLake.story",
    TalkId = 700181,
    TalkTriggerId = 700181
  },
  [700182] = {
    StoryLinePath = "Observe/IceLake.story",
    TalkId = 700182,
    TalkTriggerId = 700182
  },
  [700200] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700200,
    TalkTriggerId = 700200
  },
  [700300] = {
    StoryLinePath = "Observe/IceLakeCity_2.story",
    TalkId = 700300,
    TalkTriggerId = 700300
  },
  [710005] = {
    StoryLinePath = "DynStory/Talk.story",
    TalkId = 710005,
    TalkTriggerId = 710005
  },
  [720000] = {
    StoryLinePath = "Explore/A_PanTalk_Prologue.story",
    TalkId = 710000,
    TalkTriggerId = 720000
  },
  [720002] = {
    StoryLinePath = "Explore/A_PanTalk_Prologue.story",
    TalkId = 720002,
    TalkTriggerId = 720002
  },
  [720003] = {
    StoryLinePath = "Explore/A_PanTalk_Prologue.story",
    TalkId = 720003,
    TalkTriggerId = 720003
  },
  [720004] = {
    StoryLinePath = "Explore/A_PanTalk_Prologue.story",
    TalkId = 720004,
    TalkTriggerId = 720004
  },
  [720005] = {
    StoryLinePath = "Explore/A_PanTalk_Prologue.story",
    TalkId = 720005,
    TalkTriggerId = 720005
  },
  [720006] = {
    StoryLinePath = "Explore/A_PanTalk_EX01.story",
    TalkId = 720006,
    TalkTriggerId = 720006
  },
  [720007] = {
    StoryLinePath = "Explore/A_PanTalk_EX01.story",
    TalkId = 720007,
    TalkTriggerId = 720007
  },
  [720008] = {
    StoryLinePath = "Explore/A_PanTalk_EX01.story",
    TalkId = 720008,
    TalkTriggerId = 720008
  },
  [720009] = {
    StoryLinePath = "Explore/A_PanTalk_EX01.story",
    TalkId = 720009,
    TalkTriggerId = 720009
  },
  [720010] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720010,
    TalkTriggerId = 720010
  },
  [720011] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720011,
    TalkTriggerId = 720011
  },
  [720012] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720012,
    TalkTriggerId = 720012
  },
  [720013] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720013,
    TalkTriggerId = 720013
  },
  [720014] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720014,
    TalkTriggerId = 720014
  },
  [720015] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720015,
    TalkTriggerId = 720015
  },
  [720016] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720016,
    TalkTriggerId = 720016
  },
  [720017] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720017,
    TalkTriggerId = 720017
  },
  [720018] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720018,
    TalkTriggerId = 720018
  },
  [720019] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720019,
    TalkTriggerId = 720019
  },
  [720020] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720020,
    TalkTriggerId = 720020
  },
  [720021] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720021,
    TalkTriggerId = 720021
  },
  [720022] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720022,
    TalkTriggerId = 720022
  },
  [720023] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720023,
    TalkTriggerId = 720023
  },
  [720024] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720024,
    TalkTriggerId = 720024
  },
  [720025] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720025,
    TalkTriggerId = 720025
  },
  [720026] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720026,
    TalkTriggerId = 720026
  },
  [720027] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720027,
    TalkTriggerId = 720027
  },
  [720028] = {
    StoryLinePath = "Explore/A_PanTalk_Icelake.story",
    TalkId = 720028,
    TalkTriggerId = 720028
  },
  [720029] = {
    StoryLinePath = "Explore/A_PanTalk_Sew.story",
    TalkId = 720029,
    TalkTriggerId = 720029
  },
  [720030] = {
    StoryLinePath = "Explore/A_PanTalk_Sew.story",
    TalkId = 720030,
    TalkTriggerId = 720030
  },
  [720031] = {
    StoryLinePath = "Explore/A_PanTalk_EX01.story",
    TalkId = 720031,
    TalkTriggerId = 720031
  },
  [720032] = {
    StoryLinePath = "Explore/A_PanTalk_EX01.story",
    TalkId = 720032,
    TalkTriggerId = 720032
  },
  [720033] = {
    StoryLinePath = "Explore/A_PanTalk_EX01.story",
    TalkId = 720033,
    TalkTriggerId = 720033
  },
  [720034] = {
    RewardId = 3011,
    StoryLinePath = "Explore/A_PanTalk_EX01.story",
    TalkId = 720034,
    TalkTriggerId = 720034,
    Type = "Impression"
  },
  [720035] = {
    StoryLinePath = "Explore/A_PanTalk_EX01.story",
    TalkId = 720035,
    TalkTriggerId = 720035
  },
  [720036] = {
    StoryLinePath = "Explore/A_PanTalk_EX01.story",
    TalkId = 720036,
    TalkTriggerId = 720036
  },
  [720037] = {
    RewardId = 3011,
    StoryLinePath = "Explore/A_PanTalk_EX01.story",
    TalkId = 720037,
    TalkTriggerId = 720037,
    Type = "Impression"
  },
  [720038] = {
    StoryLinePath = "Explore/A_PanTalk_Prologue.story",
    TalkId = 720038,
    TalkTriggerId = 720038
  },
  [720039] = {
    StoryLinePath = "Explore/A_PanTalk_Prologue.story",
    TalkId = 720039,
    TalkTriggerId = 720039
  },
  [720040] = {
    StoryLinePath = "Explore/A_PanTalk_KuangKeng.story",
    TalkId = 720040,
    TalkTriggerId = 720040
  },
  [720041] = {
    StoryLinePath = "Explore/A_PanTalk_KuangKeng.story",
    TalkId = 720041,
    TalkTriggerId = 720041
  },
  [720042] = {
    StoryLinePath = "Explore/A_PanTalk_KuangKeng.story",
    TalkId = 720042,
    TalkTriggerId = 720042
  },
  [720043] = {
    StoryLinePath = "Explore/A_PanTalk_Sew.story",
    TalkId = 720043,
    TalkTriggerId = 720043
  },
  [720044] = {
    StoryLinePath = "Explore/A_PanTalk_Sew.story",
    TalkId = 720044,
    TalkTriggerId = 720044
  },
  [720045] = {
    StoryLinePath = "Explore/A_PanTalk_Sew.story",
    TalkId = 720045,
    TalkTriggerId = 720045
  },
  [720046] = {
    StoryLinePath = "Explore/A_PanTalk_Sew.story",
    TalkId = 720046,
    TalkTriggerId = 720046
  },
  [730006] = {
    DialogueId = 73000601,
    TalkTriggerId = 730006,
    TalkType = "Guide"
  },
  [730007] = {
    DialogueId = 73000701,
    TalkTriggerId = 730007,
    TalkType = "Guide"
  },
  [730008] = {
    DialogueId = 73000801,
    TalkTriggerId = 730008,
    TalkType = "Guide"
  },
  [730009] = {
    DialogueId = 73000901,
    TalkTriggerId = 730009,
    TalkType = "Guide"
  },
  [730010] = {
    DialogueId = 73001001,
    TalkTriggerId = 730010,
    TalkType = "Guide"
  },
  [830001] = {
    StoryLinePath = "Explore/ExploreGroup.story",
    TalkId = 830001,
    TalkTriggerId = 830001
  },
  [830002] = {
    StoryLinePath = "Explore/ExploreGroup.story",
    TalkId = 830002,
    TalkTriggerId = 830002
  },
  [830003] = {
    StoryLinePath = "Explore/ExploreGroup.story",
    TalkId = 830003,
    TalkTriggerId = 830003
  },
  [830004] = {
    StoryLinePath = "Explore/ExploreGroup.story",
    TalkId = 830004,
    TalkTriggerId = 830004
  },
  [830005] = {
    StoryLinePath = "Explore/ExploreGroup.story",
    TalkId = 830005,
    TalkTriggerId = 830005
  },
  [830006] = {
    StoryLinePath = "Explore/ExploreGroup.story",
    TalkId = 830006,
    TalkTriggerId = 830006
  },
  [830007] = {
    StoryLinePath = "Explore/ExploreGroup.story",
    TalkId = 830007,
    TalkTriggerId = 830007
  },
  [830008] = {
    StoryLinePath = "Explore/ExploreGroup.story",
    TalkId = 830008,
    TalkTriggerId = 830008
  },
  [830009] = {
    StoryLinePath = "Explore/ExploreGroup.story",
    TalkId = 830009,
    TalkTriggerId = 830009
  },
  [830010] = {
    StoryLinePath = "Explore/ExploreGroup.story",
    TalkId = 830010,
    TalkTriggerId = 830010
  },
  [830011] = {
    StoryLinePath = "Explore/ExploreGroup.story",
    TalkId = 830011,
    TalkTriggerId = 830011
  },
  [830012] = {
    StoryLinePath = "Explore/ExploreGroup.story",
    TalkId = 830012,
    TalkTriggerId = 830012
  },
  [830013] = {
    StoryLinePath = "Explore/ExploreGroup.story",
    TalkId = 830013,
    TalkTriggerId = 830013
  },
  [830014] = {
    StoryLinePath = "Explore/ExploreGroup.story",
    TalkId = 830014,
    TalkTriggerId = 830014
  },
  [900101] = {
    StoryLinePath = "TalkGossip/900101_Duanzao_Bubble.story",
    TalkId = 900101,
    TalkTriggerId = 900101
  },
  [900102] = {
    StoryLinePath = "TalkGossip/900102_Duanzao.story",
    TalkId = 900102,
    TalkTriggerId = 900102
  },
  [900201] = {
    StoryLinePath = "TalkGossip/900201_Shangdian_Bubble.story",
    TalkId = 900201,
    TalkTriggerId = 900201
  },
  [900202] = {
    StoryLinePath = "TalkGossip/900202_Shangdian.story",
    TalkId = 900202,
    TalkTriggerId = 900202
  },
  [900301] = {
    StoryLinePath = "TalkGossip/900301_Heitao.story",
    TalkId = 900301,
    TalkTriggerId = 900301
  },
  [900401] = {
    StoryLinePath = "TalkGossip/900401_Shuimu.story",
    TalkId = 900401,
    TalkTriggerId = 900401
  },
  [900501] = {
    StoryLinePath = "TalkGossip/900501_Zhangyu.story",
    TalkId = 900501,
    TalkTriggerId = 900501
  },
  [900601] = {
    StoryLinePath = "TalkGossip/900601_Haier.story",
    TalkId = 900601,
    TalkTriggerId = 900601
  },
  [900701] = {
    StoryLinePath = "TalkGossip/900701_Yuming.story",
    TalkId = 900701,
    TalkTriggerId = 900701
  },
  [900801] = {
    StoryLinePath = "TalkGossip/900801_Landi.story",
    TalkId = 900801,
    TalkTriggerId = 900801
  },
  [900901] = {
    StoryLinePath = "TalkGossip/900901_Xibi.story",
    TalkId = 900901,
    TalkTriggerId = 900901
  },
  [901001] = {
    StoryLinePath = "TalkGossip/901001_Saiqi.story",
    TalkId = 901001,
    TalkTriggerId = 901001
  },
  [901101] = {
    StoryLinePath = "TalkGossip/901101_Baiheng.story",
    TalkId = 901101,
    TalkTriggerId = 901101
  },
  [901201] = {
    StoryLinePath = "TalkGossip/901201_Songlu.story",
    TalkId = 901201,
    TalkTriggerId = 901201
  },
  [901301] = {
    StoryLinePath = "TalkGossip/901301_Linen.story",
    TalkId = 901301,
    TalkTriggerId = 901301
  },
  [901401] = {
    StoryLinePath = "TalkGossip/901401_Xier.story",
    TalkId = 901401,
    TalkTriggerId = 901401
  },
  [901501] = {
    StoryLinePath = "TalkGossip/901501_Feina.story",
    TalkId = 901501,
    TalkTriggerId = 901501
  },
  [901601] = {
    StoryLinePath = "TalkGossip/901601_Aote.story",
    TalkId = 901601,
    TalkTriggerId = 901601
  },
  [901701] = {
    StoryLinePath = "TalkGossip/901701_Maer.story",
    TalkId = 901701,
    TalkTriggerId = 901701
  },
  [901801] = {
    StoryLinePath = "TalkGossip/901801_Yeer.story",
    TalkId = 901801,
    TalkTriggerId = 901801
  },
  [901901] = {
    StoryLinePath = "TalkGossip/901901_James.story",
    TalkId = 901901,
    TalkTriggerId = 901901
  },
  [902001] = {
    StoryLinePath = "TalkGossip/902001_Jack.story",
    TalkId = 902001,
    TalkTriggerId = 902001
  },
  [902101] = {
    StoryLinePath = "TalkGossip/902101_Emily.story",
    TalkId = 902101,
    TalkTriggerId = 902101
  },
  [902501] = {
    StoryLinePath = "TalkGossip/902501_Nifu.story",
    TalkId = 902501,
    TalkTriggerId = 902501
  },
  [902601] = {
    StoryLinePath = "TalkGossip/902601_Zhiliu.story",
    TalkId = 902601,
    TalkTriggerId = 902601
  },
  [902701] = {
    StoryLinePath = "TalkGossip/902701_Kezhou.story",
    TalkId = 902701,
    TalkTriggerId = 902701
  },
  [902901] = {
    StoryLinePath = "TalkGossip/902901_Baonu.story",
    TalkId = 902901,
    TalkTriggerId = 902901
  },
  [910101] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/HeitaoIdleBubble.story",
    TalkId = 910101,
    TalkTriggerId = 910101
  },
  [910102] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/ShuimuIdleBubble.story",
    TalkId = 910102,
    TalkTriggerId = 910102
  },
  [910103] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/ZhangyuIdleBubble.story",
    TalkId = 910103,
    TalkTriggerId = 910103
  },
  [910104] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/HaierIdleBubble.story",
    TalkId = 910104,
    TalkTriggerId = 910104
  },
  [910105] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/YumingIdleBubble.story",
    TalkId = 910105,
    TalkTriggerId = 910105
  },
  [910106] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/LandiIdleBubble.story",
    TalkId = 910106,
    TalkTriggerId = 910106
  },
  [910107] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/XibiIdleBubble.story",
    TalkId = 910107,
    TalkTriggerId = 910107
  },
  [910108] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/SaiqiIdleBubble.story",
    TalkId = 910108,
    TalkTriggerId = 910108
  },
  [910109] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/FushuIdleBubble.story",
    TalkId = 910109,
    TalkTriggerId = 910109
  },
  [910110] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/SongluIdleBubble.story",
    TalkId = 910110,
    TalkTriggerId = 910110
  },
  [910111] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/LinenIdleBubble.story",
    TalkId = 910111,
    TalkTriggerId = 910111
  },
  [910112] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/XierIdleBubble.story",
    TalkId = 910112,
    TalkTriggerId = 910112
  },
  [910113] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/FeinaIdleBubble.story",
    TalkId = 910113,
    TalkTriggerId = 910113
  },
  [910114] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/AoteIdleBubble.story",
    TalkId = 910114,
    TalkTriggerId = 910114
  },
  [910115] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/MaerIdleBubble.story",
    TalkId = 910115,
    TalkTriggerId = 910115
  },
  [910116] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/YeerIdleBubble.story",
    TalkId = 910116,
    TalkTriggerId = 910116
  },
  [910117] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/DafuIdleBubble.story",
    TalkId = 910117,
    TalkTriggerId = 910117
  },
  [910118] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/TuosiIdleBubble.story",
    TalkId = 910118,
    TalkTriggerId = 910118
  },
  [910119] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/LiseIdleBubble.story",
    TalkId = 910119,
    TalkTriggerId = 910119
  },
  [910120] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/NifuIdleBubble.story",
    TalkId = 910120,
    TalkTriggerId = 910120
  },
  [910121] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/ZhiliuIdleBubble.story",
    TalkId = 910121,
    TalkTriggerId = 910121
  },
  [910122] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/KezhouIdleBubble.story",
    TalkId = 910122,
    TalkTriggerId = 910122
  },
  [910123] = {
    StoryLinePath = "TalkGossip/LongIdleBubble/BaonuIdleBubble.story",
    TalkId = 910123,
    TalkTriggerId = 910123
  },
  [920101] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/HeitaoDafu.story",
    TalkId = 920101,
    TalkTriggerId = 920101
  },
  [920102] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/HeitaoSonglu.story",
    TalkId = 920102,
    TalkTriggerId = 920102
  },
  [920103] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/HeitaoXibi.story",
    TalkId = 920103,
    TalkTriggerId = 920103
  },
  [920104] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/HeitaoAote.story",
    TalkId = 920104,
    TalkTriggerId = 920104
  },
  [920105] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/ShuimuHaier.story",
    TalkId = 920105,
    TalkTriggerId = 920105
  },
  [920106] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/ShuimuZhangyu.story",
    TalkId = 920106,
    TalkTriggerId = 920106
  },
  [920107] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/ShuimuKaaosi.story",
    TalkId = 920107,
    TalkTriggerId = 920107
  },
  [920108] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/ZhangyuHaier.story",
    TalkId = 920108,
    TalkTriggerId = 920108
  },
  [920109] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/ZhangyuShuimu.story",
    TalkId = 920109,
    TalkTriggerId = 920109
  },
  [920110] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/ZhangyuBaonu.story",
    TalkId = 920110,
    TalkTriggerId = 920110
  },
  [920111] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/HaierXibi.story",
    TalkId = 920111,
    TalkTriggerId = 920111
  },
  [920112] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/HaierShuimu.story",
    TalkId = 920112,
    TalkTriggerId = 920112
  },
  [920113] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/HaierLandi.story",
    TalkId = 920113,
    TalkTriggerId = 920113
  },
  [920114] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/YumingAote.story",
    TalkId = 920114,
    TalkTriggerId = 920114
  },
  [920115] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/YumingKezhou.story",
    TalkId = 920115,
    TalkTriggerId = 920115
  },
  [920116] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/YumingHaier.story",
    TalkId = 920116,
    TalkTriggerId = 920116
  },
  [920117] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/LandiXibi.story",
    TalkId = 920117,
    TalkTriggerId = 920117
  },
  [920118] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/LandiLinen.story",
    TalkId = 920118,
    TalkTriggerId = 920118
  },
  [920119] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/LandiHeitao.story",
    TalkId = 920119,
    TalkTriggerId = 920119
  },
  [920120] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/XibiDafu.story",
    TalkId = 920120,
    TalkTriggerId = 920120
  },
  [920121] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/XibiAiliu.story",
    TalkId = 920121,
    TalkTriggerId = 920121
  },
  [920122] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/XibiWeijier.story",
    TalkId = 920122,
    TalkTriggerId = 920122
  },
  [920123] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/XibiAote.story",
    TalkId = 920123,
    TalkTriggerId = 920123
  },
  [920124] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/XibiLandi.story",
    TalkId = 920124,
    TalkTriggerId = 920124
  },
  [920125] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/SaiqiAote.story",
    TalkId = 920125,
    TalkTriggerId = 920125
  },
  [920126] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/SaiqiKami.story",
    TalkId = 920126,
    TalkTriggerId = 920126
  },
  [920127] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/SaiqiSonglu.story",
    TalkId = 920127,
    TalkTriggerId = 920127
  },
  [920128] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/FushuLandi.story",
    TalkId = 920128,
    TalkTriggerId = 920128
  },
  [920129] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/FushuZhiliu.story",
    TalkId = 920129,
    TalkTriggerId = 920129
  },
  [920130] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/FushuYeer.story",
    TalkId = 920130,
    TalkTriggerId = 920130
  },
  [920131] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/SongluMaer.story",
    TalkId = 920131,
    TalkTriggerId = 920131
  },
  [920132] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/SongluLinen.story",
    TalkId = 920132,
    TalkTriggerId = 920132
  },
  [920133] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/SongluBaonu.story",
    TalkId = 920133,
    TalkTriggerId = 920133
  },
  [920134] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/LinenLandi.story",
    TalkId = 920134,
    TalkTriggerId = 920134
  },
  [920135] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/LinenXibi.story",
    TalkId = 920135,
    TalkTriggerId = 920135
  },
  [920136] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/LinenLise.story",
    TalkId = 920136,
    TalkTriggerId = 920136
  },
  [920137] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/XierSaiqi.story",
    TalkId = 920137,
    TalkTriggerId = 920137
  },
  [920138] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/XierBaonu.story",
    TalkId = 920138,
    TalkTriggerId = 920138
  },
  [920139] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/XierMaer.story",
    TalkId = 920139,
    TalkTriggerId = 920139
  },
  [920140] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/FeinaAote.story",
    TalkId = 920140,
    TalkTriggerId = 920140
  },
  [920141] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/FeinaSonglu.story",
    TalkId = 920141,
    TalkTriggerId = 920141
  },
  [920142] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/FeinaBaonu.story",
    TalkId = 920142,
    TalkTriggerId = 920142
  },
  [920143] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/FeinaTaer.story",
    TalkId = 920143,
    TalkTriggerId = 920143
  },
  [920144] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/AoteFeina.story",
    TalkId = 920144,
    TalkTriggerId = 920144
  },
  [920145] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/AoteSaiqi.story",
    TalkId = 920145,
    TalkTriggerId = 920145
  },
  [920146] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/AoteKami.story",
    TalkId = 920146,
    TalkTriggerId = 920146
  },
  [920147] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/AoteAiliu.story",
    TalkId = 920147,
    TalkTriggerId = 920147
  },
  [920148] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/MaerXier.story",
    TalkId = 920148,
    TalkTriggerId = 920148
  },
  [920149] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/MaerFeina.story",
    TalkId = 920149,
    TalkTriggerId = 920149
  },
  [920150] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/MaerHaier.story",
    TalkId = 920150,
    TalkTriggerId = 920150
  },
  [920151] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/MaerLinen.story",
    TalkId = 920151,
    TalkTriggerId = 920151
  },
  [920152] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/MaerKami.story",
    TalkId = 920152,
    TalkTriggerId = 920152
  },
  [920153] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/YeerTuosi.story",
    TalkId = 920153,
    TalkTriggerId = 920153
  },
  [920154] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/YeerSonglu.story",
    TalkId = 920154,
    TalkTriggerId = 920154
  },
  [920155] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/YeerHaier.story",
    TalkId = 920155,
    TalkTriggerId = 920155
  },
  [920156] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/DafuFushu.story",
    TalkId = 920156,
    TalkTriggerId = 920156
  },
  [920157] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/DafuHaier.story",
    TalkId = 920157,
    TalkTriggerId = 920157
  },
  [920158] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/DafuXibi.story",
    TalkId = 920158,
    TalkTriggerId = 920158
  },
  [920159] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/DafuTuosi.story",
    TalkId = 920159,
    TalkTriggerId = 920159
  },
  [920160] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/TuosiLise.story",
    TalkId = 920160,
    TalkTriggerId = 920160
  },
  [920161] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/TuosiFeina.story",
    TalkId = 920161,
    TalkTriggerId = 920161
  },
  [920162] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/TuosiLilikou.story",
    TalkId = 920162,
    TalkTriggerId = 920162
  },
  [920163] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/TuosiZhangyu.story",
    TalkId = 920163,
    TalkTriggerId = 920163
  },
  [920164] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/TuosiMojing.story",
    TalkId = 920164,
    TalkTriggerId = 920164
  },
  [920165] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/LiseXier.story",
    TalkId = 920165,
    TalkTriggerId = 920165
  },
  [920166] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/LiseLandi.story",
    TalkId = 920166,
    TalkTriggerId = 920166
  },
  [920167] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/LiseLilikou.story",
    TalkId = 920167,
    TalkTriggerId = 920167
  },
  [920168] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/NifuAote.story",
    TalkId = 920168,
    TalkTriggerId = 920168
  },
  [920169] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/NifuFushu.story",
    TalkId = 920169,
    TalkTriggerId = 920169
  },
  [920170] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/NifuAiliu.story",
    TalkId = 920170,
    TalkTriggerId = 920170
  },
  [920171] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/NifuYilin.story",
    TalkId = 920171,
    TalkTriggerId = 920171
  },
  [920172] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/ZhiliuShuimu.story",
    TalkId = 920172,
    TalkTriggerId = 920172
  },
  [920173] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/ZhiliuKezhou.story",
    TalkId = 920173,
    TalkTriggerId = 920173
  },
  [920174] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/ZhiliuKami.story",
    TalkId = 920174,
    TalkTriggerId = 920174
  },
  [920175] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/KezhouXier.story",
    TalkId = 920175,
    TalkTriggerId = 920175
  },
  [920176] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/KezhouYuming.story",
    TalkId = 920176,
    TalkTriggerId = 920176
  },
  [920177] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/KezhouBaonu.story",
    TalkId = 920177,
    TalkTriggerId = 920177
  },
  [920178] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/BaonuTanlan.story",
    TalkId = 920178,
    TalkTriggerId = 920178
  },
  [920179] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/BaonuZhangyu.story",
    TalkId = 920179,
    TalkTriggerId = 920179
  },
  [920180] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/BaonuLinen.story",
    TalkId = 920180,
    TalkTriggerId = 920180
  },
  [920181] = {
    StoryLinePath = "TalkGossip/EasterEggBubble/BaonuTaer.story",
    TalkId = 920181,
    TalkTriggerId = 920181
  },
  [5100032] = {
    StoryLinePath = "Impression/IceLakeCity/510003_XilinFuren_1_EndTalk.story",
    TalkId = 5100032,
    TalkTriggerId = 5100032,
    TriggerCondition = T.RT_36
  },
  [5100042] = {
    StoryLinePath = "Impression/IceLakeCity/510004_Aiersha_EndTalk.story",
    TalkId = 5100042,
    TalkTriggerId = 5100042,
    TriggerCondition = {
      And = {
        {
          QuestFinish = {QuestId = 20020300}
        },
        {
          QuestChainUnFinish = {QuestChainId = 200203}
        }
      }
    }
  },
  [5100043] = {
    StoryLinePath = "Impression/IceLakeCity/510004_Aiersha_EndTalk2.story",
    TalkId = 5100043,
    TalkTriggerId = 5100043,
    TriggerCondition = T.RT_38
  },
  [5100072] = {
    StoryLinePath = "Impression/IceLakeCity/510007_Alice_EndTalk.story",
    TalkId = 5100072,
    TalkTriggerId = 5100072,
    TriggerCondition = {
      ImprComp = {TalkTriggerId = 510007}
    }
  },
  [5100082] = {
    StoryLinePath = "Impression/IceLakeCity/510008_Alice_EndTalk_1.story",
    TalkId = 5100082,
    TalkTriggerId = 5100082,
    TriggerCondition = {
      QuestFinish = {QuestId = 20020310}
    }
  },
  [5100083] = {
    StoryLinePath = "Impression/IceLakeCity/510008_Alice_EndTalk_2.story",
    TalkId = 5100083,
    TalkTriggerId = 5100083,
    TriggerCondition = T.RT_38
  },
  [5100092] = {
    TalkId = 5100092,
    TalkTriggerId = 5100092,
    TriggerCondition = {
      ImprComp = {TalkTriggerId = 510009}
    }
  },
  [5100102] = {
    StoryLinePath = "Impression/IceLakeCity/510010_Jiexika_EndTalk.story",
    TalkId = 5100102,
    TalkTriggerId = 5100102,
    TriggerCondition = {
      ImprComp = {TalkTriggerId = 510010}
    }
  },
  [5100122] = {
    StoryLinePath = "Impression/IceLakeCity/510012_Kenong_EndTalk.story",
    TalkId = 5100122,
    TalkTriggerId = 5100122,
    TriggerCondition = {
      ImprComp = {TalkTriggerId = 510012}
    }
  },
  [5100142] = {
    StoryLinePath = "Impression/IceLakeCity/510014_Sangni_EndTalk.story",
    TalkId = 5100142,
    TalkTriggerId = 5100142,
    TriggerCondition = {
      ImprComp = {TalkTriggerId = 510014}
    }
  },
  [5100152] = {
    TalkId = 5100152,
    TalkTriggerId = 5100152,
    TriggerCondition = {
      ImprComp = {TalkTriggerId = 510015}
    }
  },
  [5100162] = {
    StoryLinePath = "Impression/IceLakeCity/510016_Yagebu_EndTalk.story",
    TalkId = 5100162,
    TalkTriggerId = 5100162,
    TriggerCondition = {
      ImprComp = T.RT_29
    }
  },
  [5100172] = {
    StoryLinePath = "Impression/IceLakeCity/510017_Dadun_EndTalk.story",
    TalkId = 5100172,
    TalkTriggerId = 5100172
  },
  [5100192] = {
    StoryLinePath = "Impression/IceLakeCity/510019_Wells_End.story",
    TalkId = 5100183,
    TalkTriggerId = 5100192,
    TriggerCondition = {
      QuestFinish = {QuestId = 20020405}
    }
  },
  [5100202] = {
    StoryLinePath = "Impression/IceLakeCity/510020_Blue_1_End.story",
    TalkId = 5100193,
    TalkTriggerId = 5100202,
    TriggerCondition = {
      And = {
        {
          ImprUncomp = T.RT_32
        },
        {
          QuestChainStart = T.RT_39
        }
      }
    }
  },
  [5100222] = {
    StoryLinePath = "Impression/IceLakeCity/510022_Blue_2_End.story",
    TalkId = 5100194,
    TalkTriggerId = 5100222,
    TriggerCondition = {
      QuestChainFinish = T.RT_39
    }
  },
  [5100232] = {
    StoryLinePath = "Impression/IceLakeCity/510023_Shali_EndTalk.story",
    TalkId = 5100232,
    TalkTriggerId = 5100232,
    TriggerCondition = T.RT_36
  },
  [5100341] = {
    StoryLinePath = "Impression/IceLakeCity/510034_Anuo_EndTalk.story",
    TalkId = 5100341,
    TalkTriggerId = 5100341,
    TriggerCondition = T.RT_41
  },
  [5100342] = {
    StoryLinePath = "Impression/IceLakeCity/510034_Bake_EndTalk.story",
    TalkId = 5100342,
    TalkTriggerId = 5100342,
    TriggerCondition = T.RT_41
  },
  [5100371] = {
    StoryLinePath = "Impression/IceLakeCity/510037_Aima_EndTalk.story",
    TalkId = 5100371,
    TalkTriggerId = 5100371,
    TriggerCondition = T.RT_43
  },
  [5100372] = {
    StoryLinePath = "Impression/IceLakeCity/510037_Beilinda_EndTalk.story",
    TalkId = 5100372,
    TalkTriggerId = 5100372,
    TriggerCondition = T.RT_43
  },
  [5100411] = {
    StoryLinePath = "Impression/IceLakeCity/510041_Faye_EndTalk.story",
    TalkId = 5100411,
    TalkTriggerId = 5100411,
    TriggerCondition = {
      QuestFinish = {QuestId = 20021105}
    }
  },
  [5100421] = {
    StoryLinePath = "Impression/IceLakeCity/510042_Heerluo_EndTalk.story",
    TalkId = 5100421,
    TalkTriggerId = 5100421,
    TriggerCondition = T.RT_34
  },
  [5100491] = {
    StoryLinePath = "Impression/IceLakeCity/510049_Luna_EndTalk.story",
    TalkId = 5100491,
    TalkTriggerId = 5100491,
    TriggerCondition = {
      QuestFinish = {QuestId = 20020901}
    }
  },
  [5100501] = {
    StoryLinePath = "Impression/IceLakeCity/510050_Laina_EndTalk.story",
    TalkId = 5100501,
    TalkTriggerId = 5100501,
    TriggerCondition = {
      QuestFinish = {QuestId = 20020803}
    }
  },
  [5100511] = {
    StoryLinePath = "Impression/IceLakeCity/510051_Maer_EndTalk.story",
    TalkId = 5100511,
    TalkTriggerId = 5100511,
    TriggerCondition = T.RT_45
  },
  [5100521] = {
    StoryLinePath = "Impression/IceLakeCity/510052_Maer_EndTalk.story",
    TalkId = 5100521,
    TalkTriggerId = 5100521,
    TriggerCondition = {
      QuestChainFinish = {QuestChainId = 200213}
    }
  },
  [5100531] = {
    StoryLinePath = "Impression/IceLakeCity/510053_Makusi_EndTalk.story",
    TalkId = 5100531,
    TalkTriggerId = 5100531,
    TriggerCondition = {
      QuestFinish = {QuestId = 20021500}
    }
  },
  [5100551] = {
    StoryLinePath = "Impression/IceLakeCity/510055_Makusi_EndTalk.story",
    TalkId = 5100551,
    TalkTriggerId = 5100551,
    TriggerCondition = {
      QuestFinish = {QuestId = 20021504}
    }
  },
  [5100591] = {
    StoryLinePath = "Impression/IceLakeCity/510059_Sanxiongdi_EndTalk.story",
    TalkId = 510059,
    TalkTriggerId = 5100591,
    TriggerCondition = {
      QuestChainFinish = {QuestChainId = 200216}
    }
  },
  [5100671] = {
    StoryLinePath = "Impression/IceLakeCity/510067_Waiter_EndTalk.story",
    TalkId = 5100671,
    TalkTriggerId = 5100671,
    TriggerCondition = {
      QuestChainFinish = {QuestChainId = 200220}
    }
  },
  [5100681] = {
    StoryLinePath = "Impression/IceLakeCity/510068_Nifu_EndTalk.story",
    TalkId = 5100681,
    TalkTriggerId = 5100681,
    TriggerCondition = {
      QuestChainFinish = {QuestChainId = 200218}
    }
  },
  [5100711] = {
    StoryLinePath = "Impression/IceLakeCity/510071_Jiexi_EndTalk.story",
    TalkId = 5100711,
    TalkTriggerId = 5100711,
    TriggerCondition = {
      QuestChainFinish = {QuestChainId = 200219}
    }
  },
  [5101022] = {
    StoryLinePath = "Impression/IceLakeCity/510102_Liliko_1_EndTalk.story",
    TalkId = 5101022,
    TalkTriggerId = 5101022,
    TriggerCondition = {
      And = {
        T.RT_47,
        {
          QuestChainUnFinish = T.RT_30
        }
      }
    }
  },
  [5101023] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/510102.story",
    TalkId = 5101023,
    TalkTriggerId = 5101023,
    TriggerCondition = {
      ImprUncomp = T.RT_46
    }
  },
  [5101032] = {
    StoryLinePath = "Impression/IceLakeCity/510103_Liliko_2_EndTalk.story",
    TalkId = 5101032,
    TalkTriggerId = 5101032,
    TriggerCondition = {
      And = {
        T.RT_49,
        {
          QuestChainUnFinish = T.RT_50
        }
      }
    }
  },
  [5101033] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/510103.story",
    TalkId = 5101033,
    TalkTriggerId = 5101033,
    TriggerCondition = {
      And = {
        T.RT_47,
        T.RT_31,
        {
          ImprUncomp = T.RT_48
        }
      }
    }
  },
  [5101042] = {
    StoryLinePath = "Impression/IceLakeCity/510104_Liliko_3_EndTalk.story",
    TalkId = 5101042,
    TalkTriggerId = 5101042,
    TriggerCondition = T.RT_53
  },
  [5101043] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/510104.story",
    TalkId = 5101043,
    TalkTriggerId = 5101043,
    TriggerCondition = {
      And = {
        T.RT_49,
        T.RT_51,
        {
          ImprUncomp = T.RT_52
        }
      }
    }
  },
  [5101044] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/5101044.story",
    TalkId = 5101044,
    TalkTriggerId = 5101044,
    TriggerCondition = T.RT_53
  },
  [5101052] = {
    StoryLinePath = "Impression/IceLakeCity/510105_Kaiwen_EndTalk.story",
    TalkId = 5101052,
    TalkTriggerId = 5101052,
    TriggerCondition = {
      ImprComp = {TalkTriggerId = 510105}
    }
  },
  [5101062] = {
    StoryLinePath = "Impression/IceLakeCity/510106_Jimu_EndTalk.story",
    TalkId = 5101062,
    TalkTriggerId = 5101062,
    TriggerCondition = {
      ImprComp = {TalkTriggerId = 510106}
    }
  },
  [5101072] = {
    StoryLinePath = "Impression/IceLakeCity/510107_Beiguanjiaojiao_EndTalk.story",
    TalkId = 5101072,
    TalkTriggerId = 5101072,
    TriggerCondition = {
      ImprComp = {TalkTriggerId = 510107}
    }
  },
  [5101082] = {
    StoryLinePath = "Impression/IceLakeCity/510108_Daixi_EndTalk.story",
    TalkId = 5101082,
    TalkTriggerId = 5101082,
    TriggerCondition = {
      ImprComp = {TalkTriggerId = 510108}
    }
  },
  [5101092] = {
    StoryLinePath = "Impression/IceLakeCity/510109_Walun_EndTalk.story",
    TalkId = 5101092,
    TalkTriggerId = 5101092,
    TriggerCondition = {
      ImprComp = {TalkTriggerId = 510109}
    }
  },
  [5101102] = {
    StoryLinePath = "Impression/IceLakeCity/510110_Halan_EndTalk.story",
    TalkId = 5101102,
    TalkTriggerId = 5101102,
    TriggerCondition = {
      ImprComp = {TalkTriggerId = 510110}
    }
  },
  [8200011] = {
    StoryLinePath = "Explore/Laser.story",
    TalkId = 8200011,
    TalkTriggerId = 8200011,
    Type = "Impression"
  },
  [8200012] = {
    StoryLinePath = "Explore/Laser.story",
    TalkId = 8200012,
    TalkTriggerId = 8200012,
    TriggerCondition = {
      And = {
        {
          ImprComp = {TalkTriggerId = 8200011}
        },
        T.RT_57
      }
    }
  },
  [8200013] = {
    StoryLinePath = "Explore/Laser.story",
    TalkId = 8200013,
    TalkTriggerId = 8200013
  },
  [8200014] = {
    StoryLinePath = "Explore/Laser.story",
    TalkId = 8200014,
    TalkTriggerId = 8200014
  },
  [8200021] = {
    StoryLinePath = "Explore/Laser.story",
    TalkId = 8200021,
    TalkTriggerId = 8200021,
    TriggerCondition = T.RT_58,
    Type = "Impression"
  },
  [8200022] = {
    StoryLinePath = "Explore/Laser.story",
    TalkId = 8200022,
    TalkTriggerId = 8200022,
    TriggerCondition = {
      And = {
        {
          ImprComp = {TalkTriggerId = 8200021}
        },
        T.RT_58,
        {
          ExploreGroupInActive = T.RT_59
        }
      }
    }
  },
  [8200023] = {
    StoryLinePath = "Explore/Laser.story",
    TalkId = 8200023,
    TalkTriggerId = 8200023
  },
  [8200024] = {
    StoryLinePath = "Explore/Laser.story",
    TalkId = 8200024,
    TalkTriggerId = 8200024
  },
  [8200031] = {
    StoryLinePath = "Explore/Laser.story",
    TalkId = 8200031,
    TalkTriggerId = 8200031,
    TriggerCondition = T.RT_60,
    Type = "Impression"
  },
  [8200032] = {
    StoryLinePath = "Explore/Laser.story",
    TalkId = 8200032,
    TalkTriggerId = 8200032,
    TriggerCondition = {
      And = {
        {
          ImprComp = {TalkTriggerId = 8200031}
        },
        T.RT_60,
        {
          ExploreGroupInActive = {ExploreGroupId = 7013100}
        }
      }
    }
  },
  [8200033] = {
    StoryLinePath = "Explore/Laser.story",
    TalkId = 8200033,
    TalkTriggerId = 8200033,
    Type = "Impression"
  },
  [8200034] = {
    StoryLinePath = "Explore/Laser.story",
    TalkId = 8200034,
    TalkTriggerId = 8200034
  },
  [8200042] = {
    StoryLinePath = "Explore/Laser.story",
    TalkId = 8200042,
    TalkTriggerId = 8200042,
    TriggerCondition = {
      And = {
        {
          ImprComp = {TalkTriggerId = 8200033}
        },
        T.RT_57
      }
    }
  },
  [9022011] = {
    StoryLinePath = "TalkGossip/902201_Dafu_B4Ex01.story",
    TalkId = 9022011,
    TalkTriggerId = 9022011,
    TriggerCondition = {
      QuestChainUnFinish = T.RT_61
    }
  },
  [9022012] = {
    StoryLinePath = "TalkGossip/902201_Dafu_AFTEx01.story",
    TalkId = 9022012,
    TalkTriggerId = 9022012,
    TriggerCondition = {
      QuestChainFinish = T.RT_61
    }
  },
  [9023011] = {
    StoryLinePath = "TalkGossip/902301_Tuosi_B4Ch02.story",
    TalkId = 9023011,
    TalkTriggerId = 9023011,
    TriggerCondition = T.RT_63
  },
  [9023012] = {
    StoryLinePath = "TalkGossip/902301_Tuosi_AFTCh02.story",
    TalkId = 9023012,
    TalkTriggerId = 9023012,
    TriggerCondition = T.RT_64
  },
  [9024011] = {
    StoryLinePath = "TalkGossip/902401_Lise_B4Ch02.story",
    TalkId = 9024011,
    TalkTriggerId = 9024011,
    TriggerCondition = T.RT_63
  },
  [9024012] = {
    StoryLinePath = "TalkGossip/902401_Lise_AFTCh02.story",
    TalkId = 9024012,
    TalkTriggerId = 9024012,
    TriggerCondition = T.RT_64
  },
  [10010104] = {
    StoryLinePath = "Common/10010104.story",
    TalkId = 10010104,
    TalkTriggerId = 10010104
  },
  [10032501] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/10032501.story",
    TalkId = 10032501,
    TalkTriggerId = 10032501
  },
  [10032601] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/10032601.story",
    TalkId = 10032601,
    TalkTriggerId = 10032601
  },
  [10032701] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/10032701.story",
    TalkId = 10032701,
    TalkTriggerId = 10032701
  },
  [10032801] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/10032801.story",
    TalkId = 10032801,
    TalkTriggerId = 10032801
  },
  [10032901] = {
    StoryLinePath = "Impression/IceLakeCity/Gossip/10032901.story",
    TalkId = 10032901,
    TalkTriggerId = 10032901
  },
  [10122401] = {
    DialogueId = 10122401,
    TalkTriggerId = 10122401,
    TalkType = "Guide"
  },
  [10122402] = {
    DialogueId = 10122402,
    TalkTriggerId = 10122402,
    TalkType = "Guide"
  },
  [10122701] = {
    DialogueId = 10122701,
    TalkTriggerId = 10122701,
    TalkType = "Guide"
  },
  [74114700] = {
    StoryLinePath = "QuestTest/FacialTest.story",
    TalkTriggerId = 74114700
  },
  [74114701] = {
    StoryLinePath = "QuestTest/74114701.story",
    TalkTriggerId = 74114701
  },
  [74114702] = {
    StoryLinePath = "QuestTest/74114702.story",
    TalkTriggerId = 74114702
  },
  [74114703] = {
    StoryLinePath = "QuestTest/74114703.story",
    TalkTriggerId = 74114703
  },
  [74114704] = {
    StoryLinePath = "QuestTest/74114704.story",
    TalkTriggerId = 74114704
  },
  [74114705] = {
    StoryLinePath = "QuestTest/74114705.story",
    TalkTriggerId = 74114705
  },
  [74114706] = {
    StoryLinePath = "QuestTest/74114706.story",
    TalkTriggerId = 74114706
  },
  [74114707] = {
    StoryLinePath = "QuestTest/74114707.story",
    TalkTriggerId = 74114707
  },
  [74114708] = {
    StoryLinePath = "QuestTest/74114708.story",
    TalkTriggerId = 74114708
  },
  [74114709] = {
    StoryLinePath = "QuestTest/74114709.story",
    TalkTriggerId = 74114709
  },
  [74114710] = {
    StoryLinePath = "QuestTest/74114710.story",
    TalkTriggerId = 74114710
  },
  [74114711] = {
    StoryLinePath = "QuestTest/74114711.story",
    TalkTriggerId = 74114711
  },
  [74114712] = {
    StoryLinePath = "QuestTest/74114712.story",
    TalkTriggerId = 74114712
  },
  [74114713] = {
    StoryLinePath = "QuestTest/74114713.story",
    TalkTriggerId = 74114713
  },
  [74114714] = {
    StoryLinePath = "QuestTest/74114714.story",
    TalkTriggerId = 74114714
  },
  [74114715] = {
    StoryLinePath = "QuestTest/74114715.story",
    TalkTriggerId = 74114715
  },
  [74114716] = {
    StoryLinePath = "QuestTest/74114716.story",
    TalkTriggerId = 74114716
  },
  [74114717] = {
    StoryLinePath = "QuestTest/74114717.story",
    TalkTriggerId = 74114717
  },
  [74114718] = {
    StoryLinePath = "QuestTest/74114718.story",
    TalkTriggerId = 74114718
  },
  [74114719] = {
    StoryLinePath = "QuestTest/74114719.story",
    TalkTriggerId = 74114719
  },
  [74114720] = {
    StoryLinePath = "QuestTest/74114720.story",
    TalkTriggerId = 74114720
  },
  [74114721] = {
    StoryLinePath = "QuestTest/74114721.story",
    TalkTriggerId = 74114721
  },
  [74114722] = {
    StoryLinePath = "QuestTest/74114722.story",
    TalkTriggerId = 74114722
  },
  [74114723] = {
    StoryLinePath = "QuestTest/74114723.story",
    TalkTriggerId = 74114723
  },
  [74114724] = {
    StoryLinePath = "QuestTest/74114724.story",
    TalkTriggerId = 74114724
  },
  [74114725] = {
    StoryLinePath = "QuestTest/74114725.story",
    TalkTriggerId = 74114725
  },
  [74114726] = {
    StoryLinePath = "QuestTest/74114726.story",
    TalkTriggerId = 74114726
  },
  [74114727] = {
    StoryLinePath = "QuestTest/74114727.story",
    TalkTriggerId = 74114727
  },
  [74114728] = {
    StoryLinePath = "QuestTest/74114728.story",
    TalkTriggerId = 74114728
  },
  [74114729] = {
    StoryLinePath = "QuestTest/74114729.story",
    TalkTriggerId = 74114729,
    Type = "Impression"
  },
  [74114730] = {
    StoryLinePath = "QuestTest/74114730.story",
    TalkTriggerId = 74114730,
    Type = "Impression"
  },
  [74114731] = {
    StoryLinePath = "QuestTest/74114731.story",
    TalkTriggerId = 74114731
  },
  [74114732] = {
    StoryLinePath = "QuestTest/74114732.story",
    TalkTriggerId = 74114732
  },
  [74114733] = {
    StoryLinePath = "QuestTest/74114733.story",
    TalkTriggerId = 74114733
  },
  [74114734] = {
    StoryLinePath = "QuestTest/74114734.story",
    TalkTriggerId = 74114734
  },
  [74114735] = {
    StoryLinePath = "QuestTest/74114735.story",
    TalkTriggerId = 74114735
  },
  [74114736] = {
    StoryLinePath = "QuestTest/74114736.story",
    TalkTriggerId = 74114736
  },
  [74114737] = {
    StoryLinePath = "QuestTest/74114737.story",
    TalkTriggerId = 74114737
  },
  [74114738] = {
    StoryLinePath = "QuestTest/74114738.story",
    TalkTriggerId = 74114738
  },
  [74114739] = {
    StoryLinePath = "QuestTest/74114739.story",
    TalkTriggerId = 74114739
  },
  [74114740] = {
    StoryLinePath = "QuestTest/74114740.story",
    TalkTriggerId = 74114740
  },
  [74114741] = {
    StoryLinePath = "QuestTest/74114741.story",
    TalkTriggerId = 74114741
  },
  [74114742] = {
    StoryLinePath = "QuestTest/74114742.story",
    TalkTriggerId = 74114742
  },
  [74114743] = {
    StoryLinePath = "QuestTest/74114743.story",
    TalkTriggerId = 74114743
  },
  [74114744] = {
    StoryLinePath = "QuestTest/74114744.story",
    TalkTriggerId = 74114744
  },
  [75000002] = {
    StoryLinePath = "QuestTest/75000002.story",
    TalkTriggerId = 75000002
  },
  [76000014] = {
    StoryLinePath = "QuestTest/FacialTest_LNM.story",
    TalkTriggerId = 76000014
  },
  [76000015] = {
    StoryLinePath = "QuestTest/FacialTest_LNF.story",
    TalkTriggerId = 76000015
  },
  [76000016] = {
    StoryLinePath = "QuestTest/FacialTest_ZNM.story",
    TalkTriggerId = 76000016
  },
  [76000017] = {
    StoryLinePath = "QuestTest/FacialTest_ZNF.story",
    TalkTriggerId = 76000017
  },
  [76000018] = {
    StoryLinePath = "QuestTest/FacialTest_QNM.story",
    TalkTriggerId = 76000018
  },
  [76000019] = {
    StoryLinePath = "QuestTest/FacialTest_QNF.story",
    TalkTriggerId = 76000019
  },
  [76000020] = {
    StoryLinePath = "QuestTest/FacialTest_YN.story",
    TalkTriggerId = 76000020
  },
  [80001001] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_01_Intro.story",
    TalkId = 80001001,
    TalkTriggerId = 80001001
  },
  [80001004] = {
    DialogueId = 80001004,
    TalkTriggerId = 80001004,
    TalkType = "Guide"
  },
  [80001005] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_01.story",
    TalkId = 80001005,
    TalkTriggerId = 80001005
  },
  [80001007] = {
    DialogueId = 80001007,
    TalkTriggerId = 80001007,
    TalkType = "Guide"
  },
  [80001008] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_02.story",
    TalkId = 80001008,
    TalkTriggerId = 80001008
  },
  [80001010] = {
    DialogueId = 80001010,
    TalkTriggerId = 80001010,
    TalkType = "Guide"
  },
  [80001011] = {
    DialogueId = 80001011,
    TalkTriggerId = 80001011,
    TalkType = "Guide"
  },
  [80001012] = {
    DialogueId = 80001012,
    TalkTriggerId = 80001012,
    TalkType = "Guide"
  },
  [80001013] = {
    DialogueId = 80001013,
    TalkTriggerId = 80001013,
    TalkType = "Guide"
  },
  [80001014] = {
    DialogueId = 80001014,
    TalkTriggerId = 80001014,
    TalkType = "Guide"
  },
  [80001015] = {
    DialogueId = 80001015,
    TalkTriggerId = 80001015,
    TalkType = "Guide"
  },
  [80001017] = {
    DialogueId = 80001017,
    TalkTriggerId = 80001017,
    TalkType = "Guide"
  },
  [80001018] = {
    DialogueId = 80001018,
    TalkTriggerId = 80001018,
    TalkType = "Guide"
  },
  [80001019] = {
    DialogueId = 80001019,
    TalkTriggerId = 80001019,
    TalkType = "Guide"
  },
  [80001021] = {
    DialogueId = 80001021,
    TalkTriggerId = 80001021,
    TalkType = "Guide"
  },
  [80001022] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_01_Aote.story",
    TalkTriggerId = 80001022
  },
  [80001024] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_01_Feather.story",
    TalkId = 80001024,
    TalkTriggerId = 80001024
  },
  [80002001] = {
    DialogueId = 80002001,
    TalkTriggerId = 80002001,
    TalkType = "Guide"
  },
  [80002003] = {
    DialogueId = 80002003,
    TalkTriggerId = 80002003,
    TalkType = "Guide"
  },
  [80002004] = {
    DialogueId = 80002004,
    TalkTriggerId = 80002004,
    TalkType = "Guide"
  },
  [80002005] = {
    DialogueId = 80002005,
    TalkTriggerId = 80002005,
    TalkType = "Guide"
  },
  [80002006] = {
    DialogueId = 80002006,
    TalkTriggerId = 80002006,
    TalkType = "Guide"
  },
  [80002007] = {
    DialogueId = 80002007,
    TalkTriggerId = 80002007,
    TalkType = "Guide"
  },
  [80002008] = {
    DialogueId = 80002008,
    TalkTriggerId = 80002008,
    TalkType = "Guide"
  },
  [80002009] = {
    DialogueId = 80002009,
    TalkTriggerId = 80002009,
    TalkType = "Guide"
  },
  [80002010] = {
    DialogueId = 80002010,
    TalkTriggerId = 80002010,
    TalkType = "Guide"
  },
  [80002012] = {
    DialogueId = 80002012,
    TalkTriggerId = 80002012,
    TalkType = "Guide"
  },
  [80002013] = {
    DialogueId = 80002013,
    TalkTriggerId = 80002013,
    TalkType = "Guide"
  },
  [80002014] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_02_Unicorn.story",
    TalkTriggerId = 80002014
  },
  [80002016] = {
    DialogueId = 80002016,
    TalkTriggerId = 80002016,
    TalkType = "Guide"
  },
  [80002017] = {
    DialogueId = 80002017,
    TalkTriggerId = 80002017,
    TalkType = "Guide"
  },
  [80002018] = {
    DialogueId = 80002018,
    TalkTriggerId = 80002018,
    TalkType = "Guide"
  },
  [80002019] = {
    DialogueId = 80002019,
    TalkTriggerId = 80002019,
    TalkType = "Guide"
  },
  [80002020] = {
    DialogueId = 80002020,
    TalkTriggerId = 80002020,
    TalkType = "Guide"
  },
  [80002021] = {
    DialogueId = 80002021,
    TalkTriggerId = 80002021,
    TalkType = "Guide"
  },
  [80002022] = {
    DialogueId = 80002022,
    TalkTriggerId = 80002022,
    TalkType = "Guide"
  },
  [80002023] = {
    DialogueId = 80002023,
    TalkTriggerId = 80002023,
    TalkType = "Guide"
  },
  [80002024] = {
    DialogueId = 80002024,
    TalkTriggerId = 80002024,
    TalkType = "Guide"
  },
  [80002025] = {
    DialogueId = 80002025,
    TalkTriggerId = 80002025,
    TalkType = "Guide"
  },
  [80002027] = {
    DialogueId = 80002027,
    TalkTriggerId = 80002027,
    TalkType = "Guide"
  },
  [80002029] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_02_Feather.story",
    TalkTriggerId = 80002029
  },
  [80003100] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_031_Init.story",
    TalkTriggerId = 80003100
  },
  [80003101] = {
    DialogueId = 80003101,
    TalkTriggerId = 80003101,
    TalkType = "Guide"
  },
  [80003102] = {
    DialogueId = 80003102,
    TalkTriggerId = 80003102,
    TalkType = "Guide"
  },
  [80003103] = {
    DialogueId = 80003103,
    TalkTriggerId = 80003103,
    TalkType = "Guide"
  },
  [80003104] = {
    DialogueId = 80003104,
    TalkTriggerId = 80003104,
    TalkType = "Guide"
  },
  [80003105] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_04.story",
    TalkTriggerId = 80003105
  },
  [80003106] = {
    DialogueId = 80003106,
    TalkTriggerId = 80003106,
    TalkType = "Guide"
  },
  [80003107] = {
    DialogueId = 80003107,
    TalkTriggerId = 80003107,
    TalkType = "Guide"
  },
  [80003108] = {
    DialogueId = 80003108,
    TalkTriggerId = 80003108,
    TalkType = "Guide"
  },
  [80003109] = {
    DialogueId = 80003109,
    TalkTriggerId = 80003109,
    TalkType = "Guide"
  },
  [80003110] = {
    DialogueId = 80003110,
    TalkTriggerId = 80003110,
    TalkType = "Guide"
  },
  [80003111] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_06.story",
    TalkTriggerId = 80003111
  },
  [80003112] = {
    DialogueId = 80003112,
    TalkTriggerId = 80003112,
    TalkType = "Guide"
  },
  [80003113] = {
    DialogueId = 80003113,
    TalkTriggerId = 80003113,
    TalkType = "Guide"
  },
  [80003114] = {
    DialogueId = 80003114,
    TalkTriggerId = 80003114,
    TalkType = "Guide"
  },
  [80003115] = {
    DialogueId = 80003115,
    TalkTriggerId = 80003115,
    TalkType = "Guide"
  },
  [80003116] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_031_Boat.story",
    TalkTriggerId = 80003116
  },
  [80003117] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_031_Feather.story",
    TalkTriggerId = 80003117
  },
  [80003200] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_032_InitBoat.story",
    TalkTriggerId = 80003200
  },
  [80003201] = {
    DialogueId = 80003201,
    TalkTriggerId = 80003201,
    TalkType = "Guide"
  },
  [80003202] = {
    DialogueId = 80003202,
    TalkTriggerId = 80003202,
    TalkType = "Guide"
  },
  [80003203] = {
    DialogueId = 80003203,
    TalkTriggerId = 80003203,
    TalkType = "Guide"
  },
  [80003204] = {
    DialogueId = 80003204,
    TalkTriggerId = 80003204,
    TalkType = "Guide"
  },
  [80003205] = {
    DialogueId = 80003205,
    TalkTriggerId = 80003205,
    TalkType = "Guide"
  },
  [80003206] = {
    DialogueId = 80003206,
    TalkTriggerId = 80003206,
    TalkType = "Guide"
  },
  [80003207] = {
    DialogueId = 80003207,
    TalkTriggerId = 80003207,
    TalkType = "Guide"
  },
  [80003208] = {
    DialogueId = 80003208,
    TalkTriggerId = 80003208,
    TalkType = "Guide"
  },
  [80003209] = {
    DialogueId = 80003209,
    TalkTriggerId = 80003209,
    TalkType = "Guide"
  },
  [80003210] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_032_Hehua.story",
    TalkTriggerId = 80003210
  },
  [80003211] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_032_Tengman.story",
    TalkTriggerId = 80003211
  },
  [80003212] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_032_Boat.story",
    TalkTriggerId = 80003212
  },
  [80003213] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_032_Shizhu.story",
    TalkTriggerId = 80003213
  },
  [80003214] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_032_Feather.story",
    TalkTriggerId = 80003214
  },
  [80004101] = {
    DialogueId = 80004101,
    TalkTriggerId = 80004101,
    TalkType = "Guide"
  },
  [80004102] = {
    DialogueId = 80004102,
    TalkTriggerId = 80004102,
    TalkType = "Guide"
  },
  [80004103] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_07.story",
    TalkId = 80004103,
    TalkTriggerId = 80004103
  },
  [80004104] = {
    DialogueId = 80004104,
    TalkTriggerId = 80004104,
    TalkType = "Guide"
  },
  [80004105] = {
    DialogueId = 80004105,
    TalkTriggerId = 80004105,
    TalkType = "Guide"
  },
  [80004106] = {
    DialogueId = 80004106,
    TalkTriggerId = 80004106,
    TalkType = "Guide"
  },
  [80004107] = {
    DialogueId = 80004107,
    TalkTriggerId = 80004107,
    TalkType = "Guide"
  },
  [80004108] = {
    DialogueId = 80004108,
    TalkTriggerId = 80004108,
    TalkType = "Guide"
  },
  [80004109] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_08.story",
    TalkId = 80004109,
    TalkTriggerId = 80004109
  },
  [80004110] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_041_Feather.story",
    TalkTriggerId = 80004110
  },
  [80004201] = {
    DialogueId = 80004201,
    TalkTriggerId = 80004201,
    TalkType = "Guide"
  },
  [80004202] = {
    DialogueId = 80004202,
    TalkTriggerId = 80004202,
    TalkType = "Guide"
  },
  [80004203] = {
    DialogueId = 80004203,
    TalkTriggerId = 80004203,
    TalkType = "Guide"
  },
  [80004204] = {
    DialogueId = 80004204,
    TalkTriggerId = 80004204,
    TalkType = "Guide"
  },
  [80004205] = {
    DialogueId = 80004205,
    TalkTriggerId = 80004205,
    TalkType = "Guide"
  },
  [80004206] = {
    DialogueId = 80004206,
    TalkTriggerId = 80004206,
    TalkType = "Guide"
  },
  [80004207] = {
    DialogueId = 80004207,
    TalkTriggerId = 80004207,
    TalkType = "Guide"
  },
  [80004208] = {
    DialogueId = 80004208,
    TalkTriggerId = 80004208,
    TalkType = "Guide"
  },
  [80004209] = {
    DialogueId = 80004209,
    TalkTriggerId = 80004209,
    TalkType = "Guide"
  },
  [80004210] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_042_Zhanzhuang.story",
    TalkId = 80004210,
    TalkTriggerId = 80004210
  },
  [80004211] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_042_Zhanzhuang.story",
    TalkId = 80004211,
    TalkTriggerId = 80004211
  },
  [80004212] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_042_Zhanzhuang.story",
    TalkId = 80004212,
    TalkTriggerId = 80004212
  },
  [80004213] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_042_End.story",
    TalkTriggerId = 80004213
  },
  [80004214] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_042_Feather.story",
    TalkTriggerId = 80004214
  },
  [80004250] = {
    DialogueId = 80004250,
    TalkTriggerId = 80004250,
    TalkType = "Guide"
  },
  [80004251] = {
    DialogueId = 80004251,
    TalkTriggerId = 80004251,
    TalkType = "Guide"
  },
  [80004252] = {
    DialogueId = 80004252,
    TalkTriggerId = 80004252,
    TalkType = "Guide"
  },
  [80004253] = {
    DialogueId = 80004253,
    TalkTriggerId = 80004253,
    TalkType = "Guide"
  },
  [80004254] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_05.story",
    TalkTriggerId = 80004254
  },
  [80004255] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_09.story",
    TalkTriggerId = 80004255
  },
  [80004256] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_10.story",
    TalkTriggerId = 80004256
  },
  [80004257] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_11.story",
    TalkTriggerId = 80004257
  },
  [80004258] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_12.story",
    TalkTriggerId = 80004258
  },
  [80004259] = {
    StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_03.story",
    TalkTriggerId = 80004259
  },
  [88888801] = {
    StoryLinePath = "Explore/Home_Cat.story",
    TalkId = 88888801,
    TalkTriggerId = 88888801,
    TriggerCondition = {
      ImprComp = {TalkTriggerId = 510122}
    }
  }
})
