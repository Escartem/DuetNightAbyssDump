local T = {}
T.RT_1 = {
  DeliverType = 1,
  Id = 100104,
  IsWhite = false,
  StartIndex = 1
}
T.RT_2 = {}
T.RT_3 = {
  DeliverType = 1,
  Id = 101107,
  IsWhite = false,
  StartIndex = 1
}
T.RT_4 = {
  IsMultiQuest = false,
  SubRegionId = 0,
  nextQuestIds = T.RT_2
}
T.RT_5 = {
  IsMultiQuest = false,
  SubRegionId = 101107,
  nextQuestIds = T.RT_2
}
T.RT_6 = {
  DeliverType = 1,
  Id = 210101,
  IsWhite = false,
  StartIndex = 1
}
T.RT_7 = {
  DeliverType = 1,
  Id = 101101,
  IsWhite = false,
  StartIndex = 1
}
T.RT_8 = {
  IsMultiQuest = false,
  SubRegionId = 0,
  SuccQuestDeliver = T.RT_7,
  nextQuestIds = T.RT_2
}
T.RT_9 = {
  DeliverType = 1,
  Id = 101901,
  IsWhite = false,
  StartIndex = 1
}
T.RT_10 = {
  IsMultiQuest = false,
  SubRegionId = 102101,
  nextQuestIds = T.RT_2
}
T.RT_11 = {
  IsMultiQuest = false,
  SubRegionId = 102102,
  nextQuestIds = T.RT_2
}
T.RT_12 = {
  IsMultiQuest = false,
  SubRegionId = 101105,
  nextQuestIds = T.RT_2
}
T.RT_13 = {
  IsMultiQuest = false,
  SubRegionId = 101103,
  nextQuestIds = T.RT_2
}
T.RT_14 = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestIds = T.RT_2
}
T.RT_15 = {Success = 20020905}
T.RT_16 = {
  IsMultiQuest = false,
  SubRegionId = 101101,
  nextQuestId = 20020905,
  nextQuestIds = T.RT_15
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("STLExportQuestChain", {
  [100101] = {
    EndQuestId = 10010111,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100101,
    Quests = {
      [10010101] = {
        IsMultiQuest = false,
        SubRegionId = 100103,
        SuccQuestDeliver = T.RT_1,
        nextQuestId = 10010102,
        nextQuestIds = {Success = 10010102}
      },
      [10010102] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10010103,
        nextQuestIds = {Success = 10010103}
      },
      [10010103] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10010104,
        nextQuestIds = {Success = 10010104}
      },
      [10010104] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10010105,
        nextQuestIds = {Success = 10010105}
      },
      [10010105] = {
        IsMultiQuest = false,
        SubRegionId = 100101,
        nextQuestId = 10010106,
        nextQuestIds = {Success = 10010106}
      },
      [10010106] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10010107,
        nextQuestIds = {Success = 10010107}
      },
      [10010107] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10010108,
        nextQuestIds = {Success = 10010108}
      },
      [10010108] = {
        IsMultiQuest = false,
        SubRegionId = 100101,
        nextQuestId = 10010109,
        nextQuestIds = {Success = 10010109}
      },
      [10010109] = {
        IsMultiQuest = false,
        SubRegionId = 100101,
        nextQuestId = 10010110,
        nextQuestIds = {Success = 10010110}
      },
      [10010110] = {
        IsMultiQuest = false,
        SubRegionId = 100101,
        nextQuestId = 10010111,
        nextQuestIds = {Success = 10010111}
      },
      [10010111] = {
        IsMultiQuest = false,
        SubRegionId = 100101,
        nextQuestIds = T.RT_2
      }
    },
    StartQuestId = 10010101
  },
  [100102] = {
    EndQuestId = 10010213,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100102,
    Quests = {
      [10010201] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10010203,
        nextQuestIds = {Success = 10010203}
      },
      [10010203] = {
        IsMultiQuest = false,
        SubRegionId = 100101,
        nextQuestId = 10010204,
        nextQuestIds = {Success = 10010204}
      },
      [10010204] = {
        IsMultiQuest = false,
        SubRegionId = 100101,
        nextQuestId = 10010205,
        nextQuestIds = {Success = 10010205}
      },
      [10010205] = {
        IsMultiQuest = false,
        SubRegionId = 100101,
        nextQuestId = 10010206,
        nextQuestIds = {Success = 10010206}
      },
      [10010206] = {
        IsMultiQuest = false,
        SubRegionId = 100102,
        nextQuestId = 10010207,
        nextQuestIds = {Success = 10010207}
      },
      [10010207] = {
        IsMultiQuest = false,
        SubRegionId = 100102,
        nextQuestId = 10010208,
        nextQuestIds = {Success = 10010208}
      },
      [10010208] = {
        IsMultiQuest = false,
        SubRegionId = 100102,
        nextQuestId = 10010209,
        nextQuestIds = {Success = 10010209}
      },
      [10010209] = {
        IsMultiQuest = false,
        SubRegionId = 100102,
        nextQuestId = 10010210,
        nextQuestIds = {Success = 10010210}
      },
      [10010210] = {
        IsMultiQuest = false,
        SubRegionId = 100102,
        nextQuestId = 10010212,
        nextQuestIds = {Success = 10010212}
      },
      [10010212] = {
        IsMultiQuest = false,
        SubRegionId = 100102,
        nextQuestId = 10010213,
        nextQuestIds = {Success = 10010213}
      },
      [10010213] = {
        IsMultiQuest = false,
        SubRegionId = 100102,
        nextQuestIds = T.RT_2
      }
    },
    StartQuestId = 10010201
  },
  [100103] = {
    EndQuestId = 10010308,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100103,
    Quests = {
      [10010301] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10010302,
        nextQuestIds = {Success = 10010302}
      },
      [10010302] = {
        IsMultiQuest = false,
        SubRegionId = 100103,
        nextQuestId = 10010303,
        nextQuestIds = {Success = 10010303}
      },
      [10010303] = {
        IsMultiQuest = false,
        SubRegionId = 100103,
        nextQuestId = 10010304,
        nextQuestIds = {Success = 10010304}
      },
      [10010304] = {
        IsMultiQuest = false,
        SubRegionId = 100103,
        nextQuestId = 10010305,
        nextQuestIds = {Success = 10010305}
      },
      [10010305] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10010306,
        nextQuestIds = {Success = 10010306}
      },
      [10010306] = {
        IsMultiQuest = false,
        SubRegionId = 100103,
        nextQuestId = 10010310,
        nextQuestIds = {Success = 10010310}
      },
      [10010307] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        SuccQuestDeliver = T.RT_3,
        nextQuestId = 10010308,
        nextQuestIds = {Success = 10010308}
      },
      [10010308] = T.RT_4,
      [10010310] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10010307,
        nextQuestIds = {Success = 10010307}
      },
      [10010311] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10010312,
        nextQuestIds = {Success = 10010312}
      },
      [10010312] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10010301,
        nextQuestIds = {Success = 10010301}
      }
    },
    StartQuestId = 10010311
  },
  [100201] = {
    EndQuestId = 10020112,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100201,
    Quests = {
      [10020101] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020102,
        nextQuestIds = {Success = 10020102}
      },
      [10020102] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020103,
        nextQuestIds = {Success = 10020103}
      },
      [10020103] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 10020104,
        nextQuestIds = {Success = 10020104}
      },
      [10020104] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 10020105,
        nextQuestIds = {Success = 10020105}
      },
      [10020105] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020106,
        nextQuestIds = {Success = 10020106}
      },
      [10020106] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020107,
        nextQuestIds = {Success = 10020107}
      },
      [10020107] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020108,
        nextQuestIds = {Success = 10020108}
      },
      [10020108] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020111,
        nextQuestIds = {Success = 10020111}
      },
      [10020111] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020112,
        nextQuestIds = {Success = 10020112}
      },
      [10020112] = T.RT_4
    },
    StartQuestId = 10020101
  },
  [100202] = {
    EndQuestId = 10020223,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100202,
    Quests = {
      [10020201] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020202,
        nextQuestIds = {Success = 10020202}
      },
      [10020202] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020203,
        nextQuestIds = {Success = 10020203}
      },
      [10020203] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020204,
        nextQuestIds = {Success = 10020204}
      },
      [10020204] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020205,
        nextQuestIds = {Success = 10020205}
      },
      [10020205] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020206,
        nextQuestIds = {Success = 10020206}
      },
      [10020206] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020207,
        nextQuestIds = {Success = 10020207}
      },
      [10020207] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020208,
        nextQuestIds = {Success = 10020208}
      },
      [10020208] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020209,
        nextQuestIds = {Success = 10020209}
      },
      [10020209] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020210,
        nextQuestIds = {Success = 10020210}
      },
      [10020210] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020211,
        nextQuestIds = {Success = 10020211}
      },
      [10020211] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020215,
        nextQuestIds = {Success = 10020215}
      },
      [10020215] = {
        IsMultiQuest = false,
        SubRegionId = 101702,
        SuccQuestDeliver = T.RT_3,
        nextQuestId = 10020221,
        nextQuestIds = {Success = 10020221}
      },
      [10020221] = {
        IsMultiQuest = false,
        SubRegionId = 101107,
        nextQuestId = 10020222,
        nextQuestIds = {Success = 10020222}
      },
      [10020222] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020223,
        nextQuestIds = {Success = 10020223}
      },
      [10020223] = T.RT_5
    },
    StartQuestId = 10020201
  },
  [100203] = {
    EndQuestId = 10020316,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100203,
    Quests = {
      [10020301] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020302,
        nextQuestIds = {Success = 10020302}
      },
      [10020302] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020303,
        nextQuestIds = {Success = 10020303}
      },
      [10020303] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020304,
        nextQuestIds = {Success = 10020304}
      },
      [10020304] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020305,
        nextQuestIds = {Success = 10020305}
      },
      [10020305] = {
        IsMultiQuest = false,
        SubRegionId = 101301,
        nextQuestId = 10020308,
        nextQuestIds = {Success = 10020308}
      },
      [10020308] = {
        IsMultiQuest = false,
        SubRegionId = 101305,
        nextQuestId = 10020310,
        nextQuestIds = {Success = 10020310}
      },
      [10020310] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020311,
        nextQuestIds = {Success = 10020311}
      },
      [10020311] = {
        IsMultiQuest = false,
        SubRegionId = 101303,
        nextQuestId = 10020312,
        nextQuestIds = {Success = 10020312}
      },
      [10020312] = {
        IsMultiQuest = false,
        SubRegionId = 101304,
        nextQuestId = 10020313,
        nextQuestIds = {Success = 10020313}
      },
      [10020313] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020314,
        nextQuestIds = {Success = 10020314}
      },
      [10020314] = {
        IsMultiQuest = false,
        SubRegionId = 101304,
        SuccQuestDeliver = {
          DeliverType = 1,
          Id = 101103,
          IsWhite = false,
          StartIndex = 14
        },
        nextQuestId = 10020316,
        nextQuestIds = {Success = 10020316}
      },
      [10020316] = T.RT_4
    },
    StartQuestId = 10020301
  },
  [100204] = {
    EndQuestId = 10020412,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100204,
    Quests = {
      [10020401] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020402,
        nextQuestIds = {Success = 10020402}
      },
      [10020402] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020403,
        nextQuestIds = {Success = 10020403}
      },
      [10020403] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020404,
        nextQuestIds = {Success = 10020404}
      },
      [10020404] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 10020405,
        nextQuestIds = {Success = 10020405}
      },
      [10020405] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020406,
        nextQuestIds = {Success = 10020406}
      },
      [10020406] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020407,
        nextQuestIds = {Success = 10020407}
      },
      [10020407] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020408,
        nextQuestIds = {Success = 10020408}
      },
      [10020408] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020409,
        nextQuestIds = {Success = 10020409}
      },
      [10020409] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020410,
        nextQuestIds = {Success = 10020410}
      },
      [10020410] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        SuccQuestDeliver = {
          DeliverType = 1,
          Id = 101101,
          IsWhite = false,
          StartIndex = 8
        },
        nextQuestId = 10020412,
        nextQuestIds = {Success = 10020412}
      },
      [10020412] = T.RT_4
    },
    StartQuestId = 10020401
  },
  [100205] = {
    EndQuestId = 10020507,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100205,
    Quests = {
      [10020501] = {
        IsMultiQuest = false,
        TargetMode = {TargetCount = 1, TargetId = 10020301},
        nextQuestId = 10020502,
        nextQuestIds = {Success = 10020502}
      },
      [10020502] = {
        IsMultiQuest = false,
        StartQuestDeliver = {
          DeliverType = 1,
          Id = 101103,
          IsWhite = false,
          StartIndex = 8
        },
        SubRegionId = 0,
        nextQuestId = 10020503,
        nextQuestIds = {Success = 10020503}
      },
      [10020503] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020504,
        nextQuestIds = {Success = 10020504}
      },
      [10020504] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 10020505,
        nextQuestIds = {Success = 10020505}
      },
      [10020505] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 10020506,
        nextQuestIds = {Success = 10020506}
      },
      [10020506] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020507,
        nextQuestIds = {Success = 10020507}
      },
      [10020507] = T.RT_4
    },
    StartQuestId = 10020501
  },
  [100206] = {
    EndQuestId = 10020615,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100206,
    Quests = {
      [10020602] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020603,
        nextQuestIds = {Success = 10020603}
      },
      [10020603] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020604,
        nextQuestIds = {Success = 10020604}
      },
      [10020604] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020605,
        nextQuestIds = {Success = 10020605}
      },
      [10020605] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020606,
        nextQuestIds = {Success = 10020606}
      },
      [10020606] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020607,
        nextQuestIds = {Success = 10020607}
      },
      [10020607] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020608,
        nextQuestIds = {Success = 10020608}
      },
      [10020608] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 10020611,
        nextQuestIds = {Success = 10020611}
      },
      [10020611] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 10020612,
        nextQuestIds = {Success = 10020612}
      },
      [10020612] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020613,
        nextQuestIds = {Success = 10020613}
      },
      [10020613] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 10020615,
        nextQuestIds = {Success = 10020615}
      },
      [10020615] = T.RT_4,
      [10020651] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020652,
        nextQuestIds = {Success = 10020652}
      },
      [10020652] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 10020602,
        nextQuestIds = {Success = 10020602}
      }
    },
    StartQuestId = 10020651
  },
  [100207] = {
    EndQuestId = 10020709,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100207,
    Quests = {
      [10020701] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020702,
        nextQuestIds = {Success = 10020702}
      },
      [10020702] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020703,
        nextQuestIds = {Success = 10020703}
      },
      [10020703] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020704,
        nextQuestIds = {Success = 10020704}
      },
      [10020704] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020705,
        nextQuestIds = {Success = 10020705}
      },
      [10020705] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020706,
        nextQuestIds = {Success = 10020706}
      },
      [10020706] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 10020707,
        nextQuestIds = {Success = 10020707}
      },
      [10020707] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 10020710,
        nextQuestIds = {Success = 10020710}
      },
      [10020708] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 10020709,
        nextQuestIds = {Success = 10020709}
      },
      [10020709] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        SuccQuestDeliver = {
          DeliverType = 1,
          Id = 101401,
          IsWhite = true,
          StartIndex = 1
        },
        nextQuestIds = T.RT_2
      },
      [10020710] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 10020708,
        nextQuestIds = {Success = 10020708}
      }
    },
    StartQuestId = 10020701
  },
  [100208] = {
    EndQuestId = 10020810,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100208,
    Quests = {
      [10020801] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        SuccQuestDeliver = {
          DeliverType = 1,
          Id = 101401,
          IsWhite = false,
          StartIndex = 2
        },
        nextQuestId = 10020802,
        nextQuestIds = {Success = 10020802}
      },
      [10020802] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020803,
        nextQuestIds = {Success = 10020803}
      },
      [10020803] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        SuccQuestDeliver = {
          DeliverType = 1,
          Id = 101402,
          IsWhite = false,
          StartIndex = 2
        },
        nextQuestId = 10020804,
        nextQuestIds = {Success = 10020804}
      },
      [10020804] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        SuccQuestDeliver = {
          DeliverType = 1,
          Id = 101103,
          IsWhite = false,
          StartIndex = 2
        },
        nextQuestId = 10020806,
        nextQuestIds = {Success = 10020806}
      },
      [10020806] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020807,
        nextQuestIds = {Success = 10020807}
      },
      [10020807] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 10020808,
        nextQuestIds = {Success = 10020808}
      },
      [10020808] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10020809,
        nextQuestIds = {Success = 10020809}
      },
      [10020809] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        SuccQuestDeliver = T.RT_1,
        nextQuestId = 10020810,
        nextQuestIds = {Success = 10020810}
      },
      [10020810] = {
        IsMultiQuest = false,
        StartQuestDeliver = T.RT_1,
        SubRegionId = 0,
        SuccQuestDeliver = T.RT_6,
        nextQuestIds = T.RT_2
      }
    },
    StartQuestId = 10020801
  },
  [100301] = {
    EndQuestId = 10030116,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100301,
    Quests = {
      [10030101] = {
        IsMultiQuest = false,
        SubRegionId = 210101,
        nextQuestId = 10030103,
        nextQuestIds = {Success = 10030103}
      },
      [10030103] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030104,
        nextQuestIds = {Success = 10030104}
      },
      [10030104] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030105,
        nextQuestIds = {Success = 10030105}
      },
      [10030105] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030106,
        nextQuestIds = {Success = 10030106}
      },
      [10030106] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030107,
        nextQuestIds = {Success = 10030107}
      },
      [10030107] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030198,
        nextQuestIds = {Success = 10030198}
      },
      [10030108] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030109,
        nextQuestIds = {Success = 10030109}
      },
      [10030109] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030110,
        nextQuestIds = {Success = 10030110}
      },
      [10030110] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030111,
        nextQuestIds = {Success = 10030111}
      },
      [10030111] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030112,
        nextQuestIds = {Success = 10030112}
      },
      [10030112] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030113,
        nextQuestIds = {Success = 10030113}
      },
      [10030113] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030114,
        nextQuestIds = {Success = 10030114}
      },
      [10030114] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030115,
        nextQuestIds = {Success = 10030115}
      },
      [10030115] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030116,
        nextQuestIds = {Success = 10030116}
      },
      [10030116] = T.RT_4,
      [10030197] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 10030108,
        nextQuestIds = {Success = 10030108}
      },
      [10030198] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 10030197,
        nextQuestIds = {Success = 10030197}
      }
    },
    StartQuestId = 10030101
  },
  [100302] = {
    EndQuestId = 10030214,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100302,
    Quests = {
      [10030201] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030202,
        nextQuestIds = {Success = 10030202}
      },
      [10030202] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030203,
        nextQuestIds = {Success = 10030203}
      },
      [10030203] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030205,
        nextQuestIds = {Success = 10030205}
      },
      [10030205] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030206,
        nextQuestIds = {Success = 10030206}
      },
      [10030206] = {
        IsMultiQuest = false,
        SubRegionId = 101701,
        nextQuestId = 10030207,
        nextQuestIds = {Success = 10030207}
      },
      [10030207] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030208,
        nextQuestIds = {Success = 10030208}
      },
      [10030208] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030209,
        nextQuestIds = {Success = 10030209}
      },
      [10030209] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030214,
        nextQuestIds = {Success = 10030214}
      },
      [10030214] = T.RT_8,
      [10030299] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030201,
        nextQuestIds = {Success = 10030201}
      }
    },
    StartQuestId = 10030299
  },
  [100303] = {
    EndQuestId = 10030301,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100303,
    Quests = {
      [10030301] = T.RT_4,
      [10030394] = {
        IsMultiQuest = false,
        SubRegionId = 101108,
        nextQuestId = 10030301,
        nextQuestIds = {Success = 10030301}
      },
      [10030395] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030394,
        nextQuestIds = {Success = 10030394}
      },
      [10030396] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030395,
        nextQuestIds = {Success = 10030395}
      },
      [10030397] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030396,
        nextQuestIds = {Success = 10030396}
      },
      [10030398] = {
        IsMultiQuest = false,
        SubRegionId = 101110,
        nextQuestId = 10030397,
        nextQuestIds = {Success = 10030397}
      },
      [10030399] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 10030398,
        nextQuestIds = {Success = 10030398}
      }
    },
    StartQuestId = 10030399
  },
  [100304] = {
    EndQuestId = 10030405,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100304,
    Quests = {
      [10030401] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 10030402,
        nextQuestIds = {Success = 10030402}
      },
      [10030402] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030403,
        nextQuestIds = {Success = 10030403}
      },
      [10030403] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030404,
        nextQuestIds = {Success = 10030404}
      },
      [10030404] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030405,
        nextQuestIds = {Success = 10030405}
      },
      [10030405] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        SuccQuestDeliver = {
          DeliverType = 1,
          Id = 103201,
          IsWhite = false,
          StartIndex = 1
        },
        nextQuestIds = T.RT_2
      },
      [10030498] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 10030499,
        nextQuestIds = {Success = 10030499}
      },
      [10030499] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        SuccQuestDeliver = T.RT_7,
        nextQuestId = 10030401,
        nextQuestIds = {Success = 10030401}
      }
    },
    StartQuestId = 10030498
  },
  [100305] = {
    EndQuestId = 10030512,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100305,
    Quests = {
      [10030501] = {
        IsMultiQuest = false,
        SubRegionId = 103201,
        nextQuestId = 10030502,
        nextQuestIds = {Success = 10030502}
      },
      [10030502] = {
        IsMultiQuest = false,
        SubRegionId = 103201,
        nextQuestId = 10030503,
        nextQuestIds = {Success = 10030503}
      },
      [10030503] = {
        IsMultiQuest = false,
        SubRegionId = 103201,
        nextQuestId = 10030504,
        nextQuestIds = {Success = 10030504}
      },
      [10030504] = {
        IsMultiQuest = false,
        SubRegionId = 103201,
        nextQuestId = 10030505,
        nextQuestIds = {Success = 10030505}
      },
      [10030505] = {
        IsMultiQuest = false,
        SubRegionId = 103201,
        nextQuestId = 10030506,
        nextQuestIds = {Success = 10030506}
      },
      [10030506] = {
        IsMultiQuest = false,
        SubRegionId = 103201,
        nextQuestId = 10030507,
        nextQuestIds = {Success = 10030507}
      },
      [10030507] = {
        IsMultiQuest = false,
        SubRegionId = 103201,
        SuccQuestDeliver = {
          DeliverType = 1,
          Id = 101703,
          IsWhite = false,
          StartIndex = 1
        },
        nextQuestId = 10030508,
        nextQuestIds = {Success = 10030508}
      },
      [10030508] = {
        IsMultiQuest = false,
        SubRegionId = 101703,
        SuccQuestDeliver = {
          DeliverType = 1,
          Id = 101103,
          IsWhite = false,
          StartIndex = 1
        },
        nextQuestId = 10030509,
        nextQuestIds = {Success = 10030509}
      },
      [10030509] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 10030510,
        nextQuestIds = {Success = 10030510}
      },
      [10030510] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        SuccQuestDeliver = T.RT_9,
        nextQuestId = 10030511,
        nextQuestIds = {Success = 10030511}
      },
      [10030511] = {
        IsMultiQuest = false,
        SubRegionId = 101901,
        nextQuestId = 10030512,
        nextQuestIds = {Success = 10030512}
      },
      [10030512] = {
        IsMultiQuest = false,
        SubRegionId = 101901,
        nextQuestIds = T.RT_2
      }
    },
    StartQuestId = 10030501
  },
  [100306] = {
    EndQuestId = 10030601,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100306,
    Quests = {
      [10030601] = {
        IsMultiQuest = false,
        SubRegionId = 101901,
        SuccQuestDeliver = T.RT_7,
        nextQuestIds = T.RT_2
      }
    },
    StartQuestId = 10030601
  },
  [100307] = {
    EndQuestId = 10030702,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 100307,
    Quests = {
      [10030701] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 10030702,
        nextQuestIds = {Success = 10030702}
      },
      [10030702] = T.RT_8
    },
    StartQuestId = 10030701
  },
  [110101] = {
    EndQuestId = 11010109,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 110101,
    Quests = {
      [11010101] = {
        IsMultiQuest = false,
        SubRegionId = 100104,
        SuccQuestDeliver = {
          DeliverType = 1,
          Id = 102101,
          IsWhite = false,
          StartIndex = 1
        },
        nextQuestId = 11010104,
        nextQuestIds = {Success = 11010104}
      },
      [11010103] = {
        IsMultiQuest = false,
        SubRegionId = 210101,
        SuccQuestDeliver = T.RT_1,
        nextQuestId = 11010101,
        nextQuestIds = {Success = 11010101}
      },
      [11010104] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010106,
        nextQuestIds = {Success = 11010106}
      },
      [11010106] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010107,
        nextQuestIds = {Success = 11010107}
      },
      [11010107] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010108,
        nextQuestIds = {Success = 11010108}
      },
      [11010108] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010109,
        nextQuestIds = {Success = 11010109}
      },
      [11010109] = T.RT_10
    },
    StartQuestId = 11010103
  },
  [110103] = {
    EndQuestId = 11010308,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 110103,
    Quests = {
      [11010301] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010311,
        nextQuestIds = {Success = 11010311}
      },
      [11010303] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010312,
        nextQuestIds = {Success = 11010312}
      },
      [11010305] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010306,
        nextQuestIds = {Success = 11010306}
      },
      [11010306] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010309,
        nextQuestIds = {Success = 11010309}
      },
      [11010307] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010303,
        nextQuestIds = {Success = 11010303}
      },
      [11010308] = T.RT_10,
      [11010309] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010308,
        nextQuestIds = {Success = 11010308}
      },
      [11010311] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010314,
        nextQuestIds = {Success = 11010314}
      },
      [11010312] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010313,
        nextQuestIds = {Success = 11010313}
      },
      [11010313] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010305,
        nextQuestIds = {Success = 11010305}
      },
      [11010314] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010307,
        nextQuestIds = {Success = 11010307}
      }
    },
    StartQuestId = 11010301
  },
  [110105] = {
    EndQuestId = 11010516,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 110105,
    Quests = {
      [11010501] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010525,
        nextQuestIds = {Success = 11010525}
      },
      [11010502] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010520,
        nextQuestIds = {Success = 11010520}
      },
      [11010505] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010518,
        nextQuestIds = {Success = 11010518}
      },
      [11010507] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010509,
        nextQuestIds = {Success = 11010509}
      },
      [11010509] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010510,
        nextQuestIds = {Success = 11010510}
      },
      [11010510] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010521,
        nextQuestIds = {Success = 11010521}
      },
      [11010511] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010528,
        nextQuestIds = {Success = 11010528}
      },
      [11010512] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010513,
        nextQuestIds = {Success = 11010513}
      },
      [11010513] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010514,
        nextQuestIds = {Success = 11010514}
      },
      [11010514] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010519,
        nextQuestIds = {Success = 11010519}
      },
      [11010515] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010516,
        nextQuestIds = {Success = 11010516}
      },
      [11010516] = T.RT_11,
      [11010518] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010524,
        nextQuestIds = {Success = 11010524}
      },
      [11010519] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010515,
        nextQuestIds = {Success = 11010515}
      },
      [11010520] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010507,
        nextQuestIds = {Success = 11010507}
      },
      [11010521] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010522,
        nextQuestIds = {Success = 11010522}
      },
      [11010522] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010523,
        nextQuestIds = {Success = 11010523}
      },
      [11010523] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010526,
        nextQuestIds = {Success = 11010526}
      },
      [11010524] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010502,
        nextQuestIds = {Success = 11010502}
      },
      [11010525] = {
        IsMultiQuest = false,
        SubRegionId = 102101,
        nextQuestId = 11010505,
        nextQuestIds = {Success = 11010505}
      },
      [11010526] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010511,
        nextQuestIds = {Success = 11010511}
      },
      [11010527] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010529,
        nextQuestIds = {Success = 11010529}
      },
      [11010528] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010527,
        nextQuestIds = {Success = 11010527}
      },
      [11010529] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 11010512,
        nextQuestIds = {Success = 11010512}
      }
    },
    StartQuestId = 11010501
  },
  [110107] = {
    EndQuestId = 11010706,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 110107,
    Quests = {
      [11010702] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010705,
        nextQuestIds = {Success = 11010705}
      },
      [11010704] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010706,
        nextQuestIds = {Success = 11010706}
      },
      [11010705] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010704,
        nextQuestIds = {Success = 11010704}
      },
      [11010706] = T.RT_11
    },
    StartQuestId = 11010702
  },
  [110108] = {
    EndQuestId = 11010816,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 110108,
    Quests = {
      [11010801] = {
        IsMultiQuest = false,
        SubRegionId = 102103,
        nextQuestId = 11010802,
        nextQuestIds = {Success = 11010802}
      },
      [11010802] = {
        IsMultiQuest = false,
        SubRegionId = 102103,
        nextQuestId = 11010804,
        nextQuestIds = {Success = 11010804}
      },
      [11010804] = {
        IsMultiQuest = false,
        SubRegionId = 102103,
        SuccQuestDeliver = {
          DeliverType = 1,
          Id = 102104,
          IsWhite = false,
          StartIndex = 1
        },
        nextQuestId = 11010816,
        nextQuestIds = {Success = 11010816}
      },
      [11010808] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010809,
        nextQuestIds = {Success = 11010809}
      },
      [11010809] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010815,
        nextQuestIds = {Success = 11010815}
      },
      [11010810] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010813,
        nextQuestIds = {Success = 11010813}
      },
      [11010812] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010814,
        nextQuestIds = {Success = 11010814}
      },
      [11010813] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010812,
        nextQuestIds = {Success = 11010812}
      },
      [11010814] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        SuccQuestDeliver = {
          DeliverType = 1,
          Id = 102103,
          IsWhite = false,
          StartIndex = 1
        },
        nextQuestId = 11010801,
        nextQuestIds = {Success = 11010801}
      },
      [11010815] = {
        IsMultiQuest = false,
        SubRegionId = 102102,
        nextQuestId = 11010810,
        nextQuestIds = {Success = 11010810}
      },
      [11010816] = {
        IsMultiQuest = false,
        SubRegionId = 102104,
        nextQuestIds = T.RT_2
      }
    },
    StartQuestId = 11010808
  },
  [110109] = {
    EndQuestId = 11010909,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 110109,
    Quests = {
      [11010902] = {
        IsMultiQuest = false,
        SubRegionId = 102104,
        nextQuestId = 11010907,
        nextQuestIds = {Success = 11010907}
      },
      [11010903] = {
        IsMultiQuest = false,
        SubRegionId = 102104,
        nextQuestId = 11010904,
        nextQuestIds = {Success = 11010904}
      },
      [11010904] = {
        IsMultiQuest = false,
        SubRegionId = 102104,
        nextQuestId = 11010910,
        nextQuestIds = {Success = 11010910}
      },
      [11010905] = {
        IsMultiQuest = false,
        SubRegionId = 102104,
        nextQuestId = 11010906,
        nextQuestIds = {Success = 11010906}
      },
      [11010906] = {
        IsMultiQuest = false,
        SubRegionId = 102104,
        SuccQuestDeliver = T.RT_9,
        nextQuestId = 11010909,
        nextQuestIds = {Success = 11010909}
      },
      [11010907] = {
        IsMultiQuest = false,
        SubRegionId = 102104,
        nextQuestId = 11010908,
        nextQuestIds = {Success = 11010908}
      },
      [11010908] = {
        IsMultiQuest = false,
        SubRegionId = 102104,
        nextQuestId = 11010903,
        nextQuestIds = {Success = 11010903}
      },
      [11010909] = {
        IsMultiQuest = false,
        SubRegionId = 101901,
        SuccQuestDeliver = T.RT_6,
        nextQuestIds = T.RT_2
      },
      [11010910] = {
        IsMultiQuest = false,
        SubRegionId = 102104,
        nextQuestId = 11010905,
        nextQuestIds = {Success = 11010905}
      }
    },
    StartQuestId = 11010902
  },
  [120001] = {
    EndQuestId = 12000104,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 120001,
    Quests = {
      [12000101] = {
        IsMultiQuest = false,
        SubRegionId = 101107,
        nextQuestId = 12000102,
        nextQuestIds = {Success = 12000102}
      },
      [12000102] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12000103,
        nextQuestIds = {Success = 12000103}
      },
      [12000103] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12000104,
        nextQuestIds = {Success = 12000104}
      },
      [12000104] = T.RT_4
    },
    StartQuestId = 12000101
  },
  [120002] = {
    EndQuestId = 12000209,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 120002,
    Quests = {
      [12000201] = {
        IsMultiQuest = false,
        SubRegionId = 101901,
        nextQuestId = 12000202,
        nextQuestIds = {Success = 12000202}
      },
      [12000202] = {
        IsMultiQuest = false,
        SubRegionId = 101901,
        nextQuestId = 12000203,
        nextQuestIds = {Success = 12000203}
      },
      [12000203] = {
        IsMultiQuest = false,
        SubRegionId = 101901,
        nextQuestId = 12000204,
        nextQuestIds = {Success = 12000204}
      },
      [12000204] = {
        IsMultiQuest = false,
        SubRegionId = 101901,
        nextQuestId = 12000205,
        nextQuestIds = {Success = 12000205}
      },
      [12000205] = {
        IsMultiQuest = false,
        SubRegionId = 101901,
        nextQuestId = 12000206,
        nextQuestIds = {Success = 12000206}
      },
      [12000206] = {
        IsMultiQuest = false,
        SubRegionId = 101901,
        nextQuestId = 12000207,
        nextQuestIds = {Success = 12000207}
      },
      [12000207] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12000208,
        nextQuestIds = {Success = 12000208}
      },
      [12000208] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12000209,
        nextQuestIds = {Success = 12000209}
      },
      [12000209] = T.RT_5
    },
    StartQuestId = 12000201
  },
  [120111] = {
    EndQuestId = 12011109,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 120111,
    Quests = {
      [12011101] = {
        IsMultiQuest = false,
        SubRegionId = 101105,
        nextQuestId = 12011102,
        nextQuestIds = {Success = 12011102}
      },
      [12011102] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12011103,
        nextQuestIds = {Success = 12011103}
      },
      [12011103] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12011105,
        nextQuestIds = {Success = 12011105}
      },
      [12011105] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12011106,
        nextQuestIds = {Success = 12011106}
      },
      [12011106] = {
        IsMultiQuest = true,
        SubRegionId = 101101,
        nextQuestId = 12011107,
        nextQuestIds = {
          ["\229\174\140\230\136\144\229\137\175\230\156\172"] = 12011107,
          ["\230\156\170\229\174\140\230\136\144\229\137\175\230\156\172"] = 12011110
        }
      },
      [12011107] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12011108,
        nextQuestIds = {Success = 12011108}
      },
      [12011108] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12011109,
        nextQuestIds = {Success = 12011109}
      },
      [12011109] = T.RT_12,
      [12011110] = {
        IsMultiQuest = false,
        TargetMode = {TargetCount = 1, TargetId = 70151},
        nextQuestId = 12011107,
        nextQuestIds = {Success = 12011107}
      },
      [12011150] = {
        IsMultiQuest = false,
        SubRegionId = 101105,
        nextQuestId = 12011101,
        nextQuestIds = {Success = 12011101}
      }
    },
    StartQuestId = 12011150
  },
  [120112] = {
    EndQuestId = 12011207,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 120112,
    Quests = {
      [12011201] = {
        IsMultiQuest = false,
        SubRegionId = 101105,
        nextQuestId = 12011202,
        nextQuestIds = {Success = 12011202}
      },
      [12011202] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12011203,
        nextQuestIds = {Success = 12011203}
      },
      [12011203] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12011204,
        nextQuestIds = {Success = 12011204}
      },
      [12011204] = {
        IsMultiQuest = true,
        SubRegionId = 101101,
        nextQuestId = 12011205,
        nextQuestIds = {
          ["\229\174\140\230\136\144\229\137\175\230\156\172"] = 12011205,
          ["\230\156\170\229\174\140\230\136\144\229\137\175\230\156\172"] = 12011210
        }
      },
      [12011205] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12011206,
        nextQuestIds = {Success = 12011206}
      },
      [12011206] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12011207,
        nextQuestIds = {Success = 12011207}
      },
      [12011207] = T.RT_12,
      [12011210] = {
        IsMultiQuest = false,
        TargetMode = {TargetCount = 1, TargetId = 70152},
        nextQuestId = 12011205,
        nextQuestIds = {Success = 12011205}
      },
      [12011250] = {
        IsMultiQuest = false,
        SubRegionId = 101105,
        nextQuestId = 12011201,
        nextQuestIds = {Success = 12011201}
      }
    },
    StartQuestId = 12011250
  },
  [120113] = {
    EndQuestId = 12011308,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 120113,
    Quests = {
      [12011301] = {
        IsMultiQuest = false,
        SubRegionId = 101105,
        nextQuestId = 12011302,
        nextQuestIds = {Success = 12011302}
      },
      [12011302] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12011303,
        nextQuestIds = {Success = 12011303}
      },
      [12011303] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12011305,
        nextQuestIds = {Success = 12011305}
      },
      [12011305] = {
        IsMultiQuest = false,
        SubRegionId = 101105,
        nextQuestId = 12011306,
        nextQuestIds = {Success = 12011306}
      },
      [12011306] = {
        IsMultiQuest = true,
        SubRegionId = 101105,
        nextQuestId = 12011308,
        nextQuestIds = {
          ["\229\174\140\230\136\144\229\137\175\230\156\172"] = 12011308,
          ["\230\156\170\229\174\140\230\136\144\229\137\175\230\156\172"] = 12011307
        }
      },
      [12011307] = {
        IsMultiQuest = false,
        TargetMode = {TargetCount = 1, TargetId = 70153},
        nextQuestId = 12011308,
        nextQuestIds = {Success = 12011308}
      },
      [12011308] = T.RT_12,
      [12011350] = {
        IsMultiQuest = false,
        SubRegionId = 101105,
        nextQuestId = 12011301,
        nextQuestIds = {Success = 12011301}
      }
    },
    StartQuestId = 12011350
  },
  [120114] = {
    EndQuestId = 12011414,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 120114,
    Quests = {
      [12011401] = {
        IsMultiQuest = false,
        SubRegionId = 101105,
        nextQuestId = 12011403,
        nextQuestIds = {Success = 12011403}
      },
      [12011403] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12011404,
        nextQuestIds = {Success = 12011404}
      },
      [12011404] = {
        IsMultiQuest = false,
        SubRegionId = 101105,
        nextQuestId = 12011405,
        nextQuestIds = {Success = 12011405}
      },
      [12011405] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12011406,
        nextQuestIds = {Success = 12011406}
      },
      [12011406] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 12011407,
        nextQuestIds = {Success = 12011407}
      },
      [12011407] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 12011408,
        nextQuestIds = {Success = 12011408}
      },
      [12011408] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 12011409,
        nextQuestIds = {Success = 12011409}
      },
      [12011409] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 12011410,
        nextQuestIds = {Success = 12011410}
      },
      [12011410] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 12011411,
        nextQuestIds = {Success = 12011411}
      },
      [12011411] = {
        IsMultiQuest = false,
        SubRegionId = 101105,
        SuccQuestDeliver = {
          DeliverType = 1,
          Id = 101101,
          IsWhite = false,
          StartIndex = 4
        },
        nextQuestId = 12011415,
        nextQuestIds = {Success = 12011415}
      },
      [12011412] = {
        IsMultiQuest = false,
        SubRegionId = 101105,
        nextQuestId = 12011413,
        nextQuestIds = {Success = 12011413}
      },
      [12011413] = {
        IsMultiQuest = true,
        SubRegionId = 101105,
        nextQuestId = 12011414,
        nextQuestIds = {
          ["\229\174\140\230\136\144\229\137\175\230\156\172"] = 12011414,
          ["\230\156\170\229\174\140\230\136\144\229\137\175\230\156\172"] = 12011420
        }
      },
      [12011414] = T.RT_12,
      [12011415] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        SuccQuestDeliver = {
          DeliverType = 1,
          Id = 101105,
          IsWhite = false,
          StartIndex = 1
        },
        nextQuestId = 12011412,
        nextQuestIds = {Success = 12011412}
      },
      [12011420] = {
        IsMultiQuest = false,
        TargetMode = {TargetCount = 1, TargetId = 70154},
        nextQuestId = 12011414,
        nextQuestIds = {Success = 12011414}
      },
      [12011450] = {
        IsMultiQuest = false,
        SubRegionId = 101105,
        nextQuestId = 12011401,
        nextQuestIds = {Success = 12011401}
      }
    },
    StartQuestId = 12011450
  },
  [200101] = {
    EndQuestId = 20010105,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200101,
    Quests = {
      [20010101] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20010102,
        nextQuestIds = {Success = 20010102}
      },
      [20010102] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20010103,
        nextQuestIds = {Success = 20010103}
      },
      [20010103] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20010104,
        nextQuestIds = {Success = 20010104}
      },
      [20010104] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20010105,
        nextQuestIds = {Success = 20010105}
      },
      [20010105] = T.RT_4
    },
    StartQuestId = 20010101
  },
  [200102] = {
    EndQuestId = 20010205,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200102,
    Quests = {
      [20010201] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20010202,
        nextQuestIds = {Success = 20010202}
      },
      [20010202] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20010203,
        nextQuestIds = {Success = 20010203}
      },
      [20010203] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20010204,
        nextQuestIds = {Success = 20010204}
      },
      [20010204] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20010205,
        nextQuestIds = {Success = 20010205}
      },
      [20010205] = T.RT_4
    },
    StartQuestId = 20010201
  },
  [200103] = {
    EndQuestId = 20010306,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200103,
    Quests = {
      [20010301] = {
        IsMultiQuest = false,
        SubRegionId = 210101,
        nextQuestId = 20010302,
        nextQuestIds = {Success = 20010302}
      },
      [20010302] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20010303,
        nextQuestIds = {Success = 20010303}
      },
      [20010303] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20010304,
        nextQuestIds = {Success = 20010304}
      },
      [20010304] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20010305,
        nextQuestIds = {Success = 20010305}
      },
      [20010305] = {
        IsMultiQuest = false,
        TargetMode = {TargetCount = 1, TargetId = 1400401},
        nextQuestId = 20010306,
        nextQuestIds = {Success = 20010306}
      },
      [20010306] = T.RT_13
    },
    StartQuestId = 20010301
  },
  [200104] = {
    EndQuestId = 20010408,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200104,
    Quests = {
      [20010401] = {
        IsMultiQuest = false,
        SubRegionId = 101107,
        nextQuestId = 20010409,
        nextQuestIds = {Success = 20010409}
      },
      [20010402] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        SuccQuestDeliver = T.RT_3,
        nextQuestId = 20010403,
        nextQuestIds = {Success = 20010403}
      },
      [20010403] = {
        IsMultiQuest = false,
        SubRegionId = 101107,
        nextQuestId = 20010404,
        nextQuestIds = {Success = 20010404}
      },
      [20010404] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20010405,
        nextQuestIds = {Success = 20010405}
      },
      [20010405] = {
        IsMultiQuest = false,
        SubRegionId = 101702,
        nextQuestId = 20010406,
        nextQuestIds = {Success = 20010406}
      },
      [20010406] = {
        IsMultiQuest = false,
        SubRegionId = 101702,
        nextQuestId = 20010407,
        nextQuestIds = {Success = 20010407}
      },
      [20010407] = {
        IsMultiQuest = false,
        SubRegionId = 101702,
        nextQuestId = 20010410,
        nextQuestIds = {Success = 20010410}
      },
      [20010408] = T.RT_5,
      [20010409] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20010402,
        nextQuestIds = {Success = 20010402}
      },
      [20010410] = {
        IsMultiQuest = false,
        TargetMode = {TargetCount = 1, TargetId = 1400402},
        nextQuestId = 20010415,
        nextQuestIds = {Success = 20010415}
      },
      [20010415] = {
        IsMultiQuest = false,
        SubRegionId = 101702,
        SuccQuestDeliver = T.RT_3,
        nextQuestId = 20010408,
        nextQuestIds = {Success = 20010408}
      }
    },
    StartQuestId = 20010401
  },
  [200201] = {
    EndQuestIds = {
      [20020106] = true,
      [20020107] = true
    },
    HavePreQuest = true,
    IsMultiEndQuest = true,
    QuestChainId = 200201,
    Quests = {
      [20020100] = {
        IsMultiQuest = false,
        IsPreQuest = true,
        SubRegionId = 101101,
        nextQuestId = 20020102,
        nextQuestIds = {Success = 20020102}
      },
      [20020102] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20020104,
        nextQuestIds = {Success = 20020104}
      },
      [20020104] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20020105,
        nextQuestIds = {Success = 20020105}
      },
      [20020105] = {
        IsMultiQuest = true,
        SubRegionId = 0,
        nextQuestId = 20020106,
        nextQuestIds = {
          ["\227\128\144\229\136\134\230\148\1752.1\227\128\145\239\188\136\233\154\144\231\158\146\229\156\168\231\159\191\229\157\145\228\184\173\229\190\151\229\136\176\231\154\132\230\151\165\232\174\176\239\188\137"] = 20020106,
          ["\227\128\144\229\136\134\230\148\1752.2\227\128\145\239\188\136\228\186\164\229\135\186\229\156\168\231\159\191\229\157\145\228\184\173\229\190\151\229\136\176\231\154\132\230\151\165\232\174\176\239\188\137"] = 20020107
        }
      },
      [20020106] = T.RT_4,
      [20020107] = T.RT_4
    },
    StartQuestId = 20020100
  },
  [200203] = {
    EndQuestIds = {
      [20020309] = true,
      [20020310] = true
    },
    HavePreQuest = true,
    IsMultiEndQuest = true,
    QuestChainId = 200203,
    Quests = {
      [20020300] = {
        IsMultiQuest = false,
        IsPreQuest = true,
        SubRegionId = 101101,
        nextQuestId = 20020312,
        nextQuestIds = {Success = 20020312}
      },
      [20020302] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20020314,
        nextQuestIds = {Success = 20020314}
      },
      [20020303] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20020305,
        nextQuestIds = {Success = 20020305}
      },
      [20020305] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20020306,
        nextQuestIds = {Success = 20020306}
      },
      [20020306] = {
        IsMultiQuest = true,
        SubRegionId = 0,
        nextQuestId = 20020319,
        nextQuestIds = {
          ["\239\188\136\228\184\141\229\177\149\231\164\186\231\136\177\228\184\189\228\184\157\231\154\132\230\151\165\232\174\176\239\188\137222"] = 20020319,
          ["\239\188\136\229\177\149\231\164\186\231\136\177\228\184\189\228\184\157\231\154\132\230\151\165\232\174\176\239\188\137111"] = 20020320
        }
      },
      [20020309] = T.RT_4,
      [20020310] = T.RT_14,
      [20020312] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20020313,
        nextQuestIds = {Success = 20020313}
      },
      [20020313] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20020302,
        nextQuestIds = {Success = 20020302}
      },
      [20020314] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20020303,
        nextQuestIds = {Success = 20020303}
      },
      [20020319] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20020309,
        nextQuestIds = {Success = 20020309}
      },
      [20020320] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20020310,
        nextQuestIds = {Success = 20020310}
      }
    },
    StartQuestId = 20020300
  },
  [200204] = {
    EndQuestId = 20020405,
    HavePreQuest = true,
    IsMultiEndQuest = false,
    QuestChainId = 200204,
    Quests = {
      [20020400] = {
        IsMultiQuest = false,
        IsPreQuest = true,
        SubRegionId = 101107,
        nextQuestId = 20020403,
        nextQuestIds = {Success = 20020403}
      },
      [20020403] = {
        IsMultiQuest = false,
        TargetMode = {TargetCount = 1, TargetId = 20020401},
        nextQuestId = 20020404,
        nextQuestIds = {Success = 20020404}
      },
      [20020404] = {
        IsMultiQuest = false,
        SubRegionId = 101107,
        nextQuestId = 20020405,
        nextQuestIds = {Success = 20020405}
      },
      [20020405] = T.RT_5
    },
    StartQuestId = 20020400
  },
  [200205] = {
    EndQuestId = 20020506,
    HavePreQuest = true,
    IsMultiEndQuest = false,
    QuestChainId = 200205,
    Quests = {
      [20020501] = {
        IsMultiQuest = false,
        IsPreQuest = true,
        SubRegionId = 101101,
        nextQuestId = 20020503,
        nextQuestIds = {Success = 20020503}
      },
      [20020503] = {
        IsMultiQuest = false,
        SubRegionId = 100101,
        nextQuestId = 20020504,
        nextQuestIds = {Success = 20020504}
      },
      [20020504] = {
        IsMultiQuest = false,
        SubRegionId = 100101,
        nextQuestId = 20020505,
        nextQuestIds = {Success = 20020505}
      },
      [20020505] = {
        IsMultiQuest = false,
        SubRegionId = 100101,
        nextQuestId = 20020507,
        nextQuestIds = {Success = 20020507}
      },
      [20020506] = T.RT_14,
      [20020507] = {
        IsMultiQuest = false,
        SubRegionId = 100101,
        nextQuestId = 20020508,
        nextQuestIds = {Success = 20020508}
      },
      [20020508] = {
        IsMultiQuest = false,
        SubRegionId = 100101,
        nextQuestId = 20020512,
        nextQuestIds = {Success = 20020512}
      },
      [20020509] = {
        IsMultiQuest = false,
        SubRegionId = 100101,
        nextQuestId = 20020510,
        nextQuestIds = {Success = 20020510}
      },
      [20020510] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20020506,
        nextQuestIds = {Success = 20020506}
      },
      [20020512] = {
        IsMultiQuest = false,
        TargetMode = {TargetCount = 1, TargetId = 10119},
        nextQuestId = 20020509,
        nextQuestIds = {Success = 20020509}
      }
    },
    StartQuestId = 20020501
  },
  [200206] = {
    EndQuestId = 20020608,
    HavePreQuest = true,
    IsMultiEndQuest = false,
    QuestChainId = 200206,
    Quests = {
      [20020600] = {
        IsMultiQuest = false,
        IsPreQuest = true,
        SubRegionId = 101107,
        nextQuestId = 20020603,
        nextQuestIds = {Success = 20020603}
      },
      [20020603] = {
        IsMultiQuest = false,
        SubRegionId = 101107,
        nextQuestId = 20020605,
        nextQuestIds = {Success = 20020605}
      },
      [20020605] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20020609,
        nextQuestIds = {Success = 20020609}
      },
      [20020606] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20020607,
        nextQuestIds = {Success = 20020607}
      },
      [20020607] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20020608,
        nextQuestIds = {Success = 20020608}
      },
      [20020608] = T.RT_5,
      [20020609] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20020606,
        nextQuestIds = {Success = 20020606}
      }
    },
    StartQuestId = 20020600
  },
  [200207] = {
    EndQuestId = 20020706,
    HavePreQuest = true,
    IsMultiEndQuest = false,
    QuestChainId = 200207,
    Quests = {
      [20020700] = {
        IsMultiQuest = false,
        IsPreQuest = true,
        SubRegionId = 101101,
        nextQuestId = 20020702,
        nextQuestIds = {Success = 20020702}
      },
      [20020702] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20020703,
        nextQuestIds = {Success = 20020703}
      },
      [20020703] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20020704,
        nextQuestIds = {Success = 20020704}
      },
      [20020704] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20020705,
        nextQuestIds = {Success = 20020705}
      },
      [20020705] = {
        IsMultiQuest = false,
        SubRegionId = 101305,
        nextQuestId = 20020707,
        nextQuestIds = {Success = 20020707}
      },
      [20020706] = T.RT_14,
      [20020707] = {
        IsMultiQuest = false,
        SubRegionId = 101305,
        nextQuestId = 20020706,
        nextQuestIds = {Success = 20020706}
      }
    },
    StartQuestId = 20020700
  },
  [200208] = {
    EndQuestId = 20020803,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200208,
    Quests = {
      [20020802] = {
        IsMultiQuest = false,
        SubRegionId = 101106,
        nextQuestId = 20020803,
        nextQuestIds = {Success = 20020803}
      },
      [20020803] = {
        IsMultiQuest = false,
        SubRegionId = 101106,
        nextQuestIds = T.RT_2
      }
    },
    StartQuestId = 20020802
  },
  [200209] = {
    EndQuestId = 20020906,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200209,
    Quests = {
      [20020901] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20020902,
        nextQuestIds = {Success = 20020902}
      },
      [20020902] = {
        IsMultiQuest = true,
        SubRegionId = 101101,
        nextQuestId = 20020903,
        nextQuestIds = {
          ["\233\128\137\233\161\18512"] = 20020903,
          ["\233\128\137\233\161\1853"] = 20020904
        }
      },
      [20020903] = T.RT_16,
      [20020904] = T.RT_16,
      [20020905] = {
        IsMultiQuest = false,
        SubRegionId = 101106,
        nextQuestId = 20020906,
        nextQuestIds = {Success = 20020906}
      },
      [20020906] = T.RT_14
    },
    StartQuestId = 20020901
  },
  [200210] = {
    EndQuestId = 20021004,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200210,
    Quests = {
      [20021001] = {
        IsMultiQuest = false,
        SubRegionId = 101702,
        nextQuestId = 20021002,
        nextQuestIds = {Success = 20021002}
      },
      [20021002] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20021003,
        nextQuestIds = {Success = 20021003}
      },
      [20021003] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20021004,
        nextQuestIds = {Success = 20021004}
      },
      [20021004] = T.RT_13,
      [20021007] = {
        IsMultiQuest = false,
        SubRegionId = 101702,
        nextQuestId = 20021001,
        nextQuestIds = {Success = 20021001}
      }
    },
    StartQuestId = 20021007
  },
  [200211] = {
    EndQuestId = 20021105,
    HavePreQuest = true,
    IsMultiEndQuest = false,
    QuestChainId = 200211,
    Quests = {
      [20021100] = {
        IsMultiQuest = false,
        IsPreQuest = true,
        SubRegionId = 101101,
        nextQuestId = 20021101,
        nextQuestIds = {Success = 20021101}
      },
      [20021101] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20021102,
        nextQuestIds = {Success = 20021102}
      },
      [20021102] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20021103,
        nextQuestIds = {Success = 20021103}
      },
      [20021103] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20021104,
        nextQuestIds = {Success = 20021104}
      },
      [20021104] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20021105,
        nextQuestIds = {Success = 20021105}
      },
      [20021105] = T.RT_14
    },
    StartQuestId = 20021100
  },
  [200212] = {
    EndQuestIds = {
      [20021203] = true,
      [20021207] = true
    },
    HavePreQuest = true,
    IsMultiEndQuest = true,
    QuestChainId = 200212,
    Quests = {
      [20021200] = {
        IsMultiQuest = false,
        IsPreQuest = true,
        SubRegionId = 101101,
        nextQuestId = 20021205,
        nextQuestIds = {Success = 20021205}
      },
      [20021202] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20021203,
        nextQuestIds = {Success = 20021203}
      },
      [20021203] = T.RT_14,
      [20021205] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20021206,
        nextQuestIds = {Success = 20021206}
      },
      [20021206] = {
        IsMultiQuest = true,
        SubRegionId = 101103,
        nextQuestId = 20021207,
        nextQuestIds = {
          ["\229\136\134\230\148\1751"] = 20021207,
          ["\229\136\134\230\148\1752"] = 20021202
        }
      },
      [20021207] = T.RT_14
    },
    StartQuestId = 20021200
  },
  [200213] = {
    EndQuestId = 20021304,
    HavePreQuest = true,
    IsMultiEndQuest = false,
    QuestChainId = 200213,
    Quests = {
      [20021300] = {
        IsMultiQuest = false,
        IsPreQuest = true,
        SubRegionId = 101101,
        nextQuestId = 20021301,
        nextQuestIds = {Success = 20021301}
      },
      [20021301] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20021302,
        nextQuestIds = {Success = 20021302}
      },
      [20021302] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20021303,
        nextQuestIds = {Success = 20021303}
      },
      [20021303] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20021304,
        nextQuestIds = {Success = 20021304}
      },
      [20021304] = T.RT_14
    },
    StartQuestId = 20021300
  },
  [200215] = {
    EndQuestId = 20021508,
    HavePreQuest = true,
    IsMultiEndQuest = false,
    QuestChainId = 200215,
    Quests = {
      [20021500] = {
        IsMultiQuest = false,
        IsPreQuest = true,
        SubRegionId = 101103,
        nextQuestId = 20021501,
        nextQuestIds = {Success = 20021501}
      },
      [20021501] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20021510,
        nextQuestIds = {Success = 20021510}
      },
      [20021502] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20021503,
        nextQuestIds = {Success = 20021503}
      },
      [20021503] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20021504,
        nextQuestIds = {Success = 20021504}
      },
      [20021504] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20021509,
        nextQuestIds = {Success = 20021509}
      },
      [20021506] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20021507,
        nextQuestIds = {Success = 20021507}
      },
      [20021507] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20021508,
        nextQuestIds = {Success = 20021508}
      },
      [20021508] = T.RT_14,
      [20021509] = {
        IsMultiQuest = false,
        TargetMode = {TargetCount = 1, TargetId = 10115},
        nextQuestId = 20021506,
        nextQuestIds = {Success = 20021506}
      },
      [20021510] = {
        IsMultiQuest = false,
        TargetMode = {TargetCount = 1, TargetId = 10118},
        nextQuestId = 20021502,
        nextQuestIds = {Success = 20021502}
      }
    },
    StartQuestId = 20021500
  },
  [200216] = {
    EndQuestId = 20021604,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200216,
    Quests = {
      [20021601] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20021602,
        nextQuestIds = {Success = 20021602}
      },
      [20021602] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20021603,
        nextQuestIds = {Success = 20021603}
      },
      [20021603] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20021604,
        nextQuestIds = {Success = 20021604}
      },
      [20021604] = T.RT_13
    },
    StartQuestId = 20021601
  },
  [200219] = {
    EndQuestId = 20021906,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200219,
    Quests = {
      [20021901] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20021902,
        nextQuestIds = {Success = 20021902}
      },
      [20021902] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20021903,
        nextQuestIds = {Success = 20021903}
      },
      [20021903] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20021905,
        nextQuestIds = {Success = 20021905}
      },
      [20021904] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20021901,
        nextQuestIds = {Success = 20021901}
      },
      [20021905] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20021906,
        nextQuestIds = {Success = 20021906}
      },
      [20021906] = T.RT_13
    },
    StartQuestId = 20021904
  },
  [200220] = {
    EndQuestId = 20022009,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200220,
    Quests = {
      [20022002] = {
        IsMultiQuest = false,
        SubRegionId = 101107,
        nextQuestId = 20022004,
        nextQuestIds = {Success = 20022004}
      },
      [20022004] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20022005,
        nextQuestIds = {Success = 20022005}
      },
      [20022005] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20022006,
        nextQuestIds = {Success = 20022006}
      },
      [20022006] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20022007,
        nextQuestIds = {Success = 20022007}
      },
      [20022007] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20022008,
        nextQuestIds = {Success = 20022008}
      },
      [20022008] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20022009,
        nextQuestIds = {Success = 20022009}
      },
      [20022009] = T.RT_14
    },
    StartQuestId = 20022002
  },
  [200221] = {
    EndQuestId = 20022104,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200221,
    Quests = {
      [20022101] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20022102,
        nextQuestIds = {Success = 20022102}
      },
      [20022102] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20022103,
        nextQuestIds = {Success = 20022103}
      },
      [20022103] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20022104,
        nextQuestIds = {Success = 20022104}
      },
      [20022104] = T.RT_4,
      [20022105] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20022101,
        nextQuestIds = {Success = 20022101}
      }
    },
    StartQuestId = 20022105
  },
  [200222] = {
    EndQuestId = 20022205,
    HavePreQuest = true,
    IsMultiEndQuest = false,
    QuestChainId = 200222,
    Quests = {
      [20022200] = {
        IsMultiQuest = false,
        IsPreQuest = true,
        SubRegionId = 101101,
        nextQuestId = 20022202,
        nextQuestIds = {Success = 20022202}
      },
      [20022202] = {
        IsMultiQuest = false,
        SubRegionId = 101701,
        nextQuestId = 20022203,
        nextQuestIds = {Success = 20022203}
      },
      [20022203] = {
        IsMultiQuest = false,
        SubRegionId = 101701,
        nextQuestId = 20022204,
        nextQuestIds = {Success = 20022204}
      },
      [20022204] = {
        IsMultiQuest = false,
        SubRegionId = 101701,
        nextQuestId = 20022205,
        nextQuestIds = {Success = 20022205}
      },
      [20022205] = {
        IsMultiQuest = false,
        SubRegionId = 101701,
        nextQuestIds = T.RT_2
      }
    },
    StartQuestId = 20022200
  },
  [200223] = {
    EndQuestId = 20022301,
    HavePreQuest = true,
    IsMultiEndQuest = false,
    QuestChainId = 200223,
    Quests = {
      [20022300] = {
        IsMultiQuest = false,
        IsPreQuest = true,
        SubRegionId = 101101,
        nextQuestId = 20022301,
        nextQuestIds = {Success = 20022301}
      },
      [20022301] = T.RT_14
    },
    StartQuestId = 20022300
  },
  [200224] = {
    EndQuestId = 20022404,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200224,
    Quests = {
      [20022401] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20022402,
        nextQuestIds = {Success = 20022402}
      },
      [20022402] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20022403,
        nextQuestIds = {Success = 20022403}
      },
      [20022403] = {
        IsMultiQuest = false,
        SubRegionId = 101701,
        nextQuestId = 20022404,
        nextQuestIds = {Success = 20022404}
      },
      [20022404] = T.RT_14
    },
    StartQuestId = 20022401
  },
  [200225] = {
    EndQuestId = 20022504,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200225,
    Quests = {
      [20022501] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20022502,
        nextQuestIds = {Success = 20022502}
      },
      [20022502] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20022503,
        nextQuestIds = {Success = 20022503}
      },
      [20022503] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20022504,
        nextQuestIds = {Success = 20022504}
      },
      [20022504] = T.RT_14
    },
    StartQuestId = 20022501
  },
  [200227] = {
    EndQuestIds = {
      [20022702] = true,
      [20022703] = true
    },
    HavePreQuest = false,
    IsMultiEndQuest = true,
    QuestChainId = 200227,
    Quests = {
      [20022701] = {
        IsMultiQuest = true,
        SubRegionId = 101101,
        nextQuestId = 20022703,
        nextQuestIds = {
          ["\233\128\137\233\161\1851"] = 20022703,
          ["\233\128\137\233\161\1852"] = 20022702
        }
      },
      [20022702] = T.RT_14,
      [20022703] = T.RT_14
    },
    StartQuestId = 20022701
  },
  [200228] = {
    EndQuestId = 20022804,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200228,
    Quests = {
      [20022801] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20022802,
        nextQuestIds = {Success = 20022802}
      },
      [20022802] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20022803,
        nextQuestIds = {Success = 20022803}
      },
      [20022803] = {
        IsMultiQuest = false,
        TargetMode = {TargetCount = 1, TargetId = 20022803},
        nextQuestId = 20022804,
        nextQuestIds = {Success = 20022804}
      },
      [20022804] = T.RT_4
    },
    StartQuestId = 20022801
  },
  [200229] = {
    EndQuestId = 20022904,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200229,
    Quests = {
      [20022901] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20022902,
        nextQuestIds = {Success = 20022902}
      },
      [20022902] = {
        IsMultiQuest = false,
        SubRegionId = 0,
        nextQuestId = 20022903,
        nextQuestIds = {Success = 20022903}
      },
      [20022903] = {
        IsMultiQuest = false,
        TargetMode = {TargetCount = 1, TargetId = 2000101},
        nextQuestId = 20022904,
        nextQuestIds = {Success = 20022904}
      },
      [20022904] = T.RT_4
    },
    StartQuestId = 20022901
  },
  [200230] = {
    EndQuestId = 20023007,
    HavePreQuest = true,
    IsMultiEndQuest = false,
    QuestChainId = 200230,
    Quests = {
      [20023000] = {
        IsMultiQuest = false,
        IsPreQuest = true,
        SubRegionId = 101101,
        nextQuestId = 20023001,
        nextQuestIds = {Success = 20023001}
      },
      [20023001] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20023002,
        nextQuestIds = {Success = 20023002}
      },
      [20023002] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20023003,
        nextQuestIds = {Success = 20023003}
      },
      [20023003] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20023004,
        nextQuestIds = {Success = 20023004}
      },
      [20023004] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20023006,
        nextQuestIds = {Success = 20023006}
      },
      [20023006] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20023007,
        nextQuestIds = {Success = 20023007}
      },
      [20023007] = T.RT_14
    },
    StartQuestId = 20023000
  },
  [200231] = {
    EndQuestId = 20023108,
    HavePreQuest = true,
    IsMultiEndQuest = false,
    QuestChainId = 200231,
    Quests = {
      [20023100] = {
        IsMultiQuest = false,
        IsPreQuest = true,
        SubRegionId = 101101,
        nextQuestId = 20023101,
        nextQuestIds = {Success = 20023101}
      },
      [20023101] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20023102,
        nextQuestIds = {Success = 20023102}
      },
      [20023102] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20023103,
        nextQuestIds = {Success = 20023103}
      },
      [20023103] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20023105,
        nextQuestIds = {Success = 20023105}
      },
      [20023105] = {
        IsMultiQuest = false,
        SubRegionId = 101301,
        nextQuestId = 20023108,
        nextQuestIds = {Success = 20023108}
      },
      [20023108] = T.RT_14
    },
    StartQuestId = 20023100
  },
  [200232] = {
    EndQuestId = 20023205,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200232,
    Quests = {
      [20023201] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20023202,
        nextQuestIds = {Success = 20023202}
      },
      [20023202] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20023203,
        nextQuestIds = {Success = 20023203}
      },
      [20023203] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20023204,
        nextQuestIds = {Success = 20023204}
      },
      [20023204] = {
        IsMultiQuest = false,
        SubRegionId = 101107,
        nextQuestId = 20023205,
        nextQuestIds = {Success = 20023205}
      },
      [20023205] = T.RT_14
    },
    StartQuestId = 20023201
  },
  [200233] = {
    EndQuestIds = {
      [20023305] = true,
      [20023306] = true
    },
    HavePreQuest = false,
    IsMultiEndQuest = true,
    QuestChainId = 200233,
    Quests = {
      [20023301] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20023302,
        nextQuestIds = {Success = 20023302}
      },
      [20023302] = {
        IsMultiQuest = false,
        SubRegionId = 101103,
        nextQuestId = 20023304,
        nextQuestIds = {Success = 20023304}
      },
      [20023304] = {
        IsMultiQuest = true,
        SubRegionId = 101101,
        nextQuestId = 20023305,
        nextQuestIds = {
          ["\228\184\141\230\143\173\229\143\145"] = 20023305,
          ["\230\143\173\229\143\145"] = 20023306
        }
      },
      [20023305] = T.RT_14,
      [20023306] = T.RT_14
    },
    StartQuestId = 20023301
  },
  [200234] = {
    EndQuestId = 20023402,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200234,
    Quests = {
      [20023401] = {
        IsMultiQuest = false,
        SubRegionId = 101101,
        nextQuestId = 20023402,
        nextQuestIds = {Success = 20023402}
      },
      [20023402] = T.RT_14
    },
    StartQuestId = 20023401
  },
  [200235] = {
    EndQuestId = 20023502,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 200235,
    Quests = {
      [20023501] = {
        IsMultiQuest = false,
        TargetMode = {TargetCount = 1, TargetId = 50906},
        nextQuestId = 20023502,
        nextQuestIds = {Success = 20023502}
      },
      [20023502] = {
        IsMultiQuest = false,
        TargetMode = {TargetCount = 1, TargetId = 200235},
        nextQuestIds = T.RT_2
      }
    },
    StartQuestId = 20023501
  },
  [200236] = {
    EndQuestIds = {
      [20023602] = true,
      [20023604] = true
    },
    HavePreQuest = false,
    IsMultiEndQuest = true,
    QuestChainId = 200236,
    Quests = {
      [20023601] = {
        IsMultiQuest = false,
        TargetMode = {TargetCount = 1, TargetId = 20023601},
        nextQuestId = 20023603,
        nextQuestIds = {Success = 20023603}
      },
      [20023602] = {
        IsMultiQuest = false,
        TargetMode = {TargetCount = 1, TargetId = 20023603},
        nextQuestIds = T.RT_2
      },
      [20023603] = {
        IsMultiQuest = true,
        SubRegionId = 0,
        nextQuestId = 20023604,
        nextQuestIds = {
          ["\229\183\178\229\144\136\230\136\144"] = 20023604,
          ["\230\156\170\229\144\136\230\136\144"] = 20023602
        }
      },
      [20023604] = T.RT_4
    },
    StartQuestId = 20023601
  },
  [400101] = {
    EndQuestId = 4001011,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 400101,
    Quests = {
      [4001011] = T.RT_13
    },
    StartQuestId = 4001011
  },
  [400102] = {
    EndQuestId = 4001021,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 400102,
    Quests = {
      [4001021] = T.RT_13
    },
    StartQuestId = 4001021
  },
  [400103] = {
    EndQuestId = 4001031,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 400103,
    Quests = {
      [4001031] = T.RT_13
    },
    StartQuestId = 4001031
  },
  [400104] = {
    EndQuestId = 4001041,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 400104,
    Quests = {
      [4001041] = T.RT_13
    },
    StartQuestId = 4001041
  },
  [400105] = {
    EndQuestId = 4001051,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 400105,
    Quests = {
      [4001051] = T.RT_13
    },
    StartQuestId = 4001051
  },
  [400106] = {
    EndQuestId = 4001061,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 400106,
    Quests = {
      [4001061] = T.RT_13
    },
    StartQuestId = 4001061
  },
  [400107] = {
    EndQuestId = 4001071,
    HavePreQuest = false,
    IsMultiEndQuest = false,
    QuestChainId = 400107,
    Quests = {
      [4001071] = T.RT_13
    },
    StartQuestId = 4001071
  }
})
