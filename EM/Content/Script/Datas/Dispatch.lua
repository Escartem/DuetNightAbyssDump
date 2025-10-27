local T = {}
T.RT_1 = {Battle = 1}
T.RT_2 = {1, 29}
T.RT_3 = {30, 39}
T.RT_4 = {Battle = 2}
T.RT_5 = {40, 49}
T.RT_6 = {50, 59}
T.RT_7 = {Collect = 1}
T.RT_8 = {Morality = 1}
T.RT_9 = {Empathy = 1}
T.RT_10 = {Morality = 2}
T.RT_11 = {Chaos = 1}
T.RT_12 = {Chaos = 2}
T.RT_13 = {Battle = 3}
T.RT_14 = {Benefit = 1}
T.RT_15 = {Benefit = 2}
T.RT_16 = {Empathy = 2}
T.RT_17 = {60, 65}
T.RT_18 = {207005}
T.RT_19 = {Wisdom = 2}
T.RT_20 = {Wisdom = 3}
T.RT_21 = {Collect = 3}
T.RT_22 = {Collect = 2}
T.RT_23 = {Chaos = 3}
T.RT_24 = {Wisdom = 1}
T.RT_25 = {Collect = 4}
T.RT_26 = {Fish = 3}
T.RT_27 = {Fish = 4}
T.RT_28 = {Benefit = 3}
T.RT_29 = {Benefit = 4}
T.RT_30 = {Chaos = 4}
T.RT_31 = {Collect = 5}
T.RT_32 = {Mine = 3}
T.RT_33 = {Pet = 5}
T.RT_34 = {Pet = 3}
T.RT_35 = {Pet = 2}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Dispatch", {
  [100101] = {
    DispatchCD = 300,
    DispatchCondition = 89001,
    DispatchDemand = T.RT_1,
    DispatchId = 100101,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 100101,
    PlayerLevel = T.RT_2,
    Rarity = 1,
    RegionId = 1001,
    RewardId = {
      40001,
      40002,
      40003,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100102] = {
    DispatchCD = 300,
    DispatchCondition = 89001,
    DispatchDemand = T.RT_1,
    DispatchId = 100102,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 100102,
    PlayerLevel = T.RT_3,
    Rarity = 1,
    RegionId = 1001,
    RewardId = {
      40004,
      40005,
      40006,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100203] = {
    DispatchCD = 300,
    DispatchCondition = 89002,
    DispatchDemand = T.RT_4,
    DispatchId = 100203,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 100203,
    PlayerLevel = T.RT_5,
    Rarity = 1,
    RegionId = 1001,
    RewardId = {
      40007,
      40008,
      40009,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100204] = {
    DispatchCD = 300,
    DispatchCondition = 89002,
    DispatchDemand = T.RT_4,
    DispatchId = 100204,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 100204,
    PlayerLevel = T.RT_6,
    Rarity = 1,
    RegionId = 1001,
    RewardId = {
      40010,
      40011,
      40012,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100301] = {
    DispatchCD = 300,
    DispatchCondition = 89003,
    DispatchDemand = T.RT_7,
    DispatchId = 100301,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 100301,
    PlayerLevel = T.RT_2,
    Rarity = 1,
    RegionId = 1001,
    RewardId = {
      40013,
      40014,
      40015,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100302] = {
    DispatchCD = 300,
    DispatchCondition = 89003,
    DispatchDemand = T.RT_7,
    DispatchId = 100302,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 100302,
    PlayerLevel = T.RT_3,
    Rarity = 1,
    RegionId = 1001,
    RewardId = {
      40016,
      40017,
      40018,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100401] = {
    DispatchCD = 300,
    DispatchCondition = 89004,
    DispatchDemand = T.RT_7,
    DispatchId = 100401,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 100401,
    PlayerLevel = T.RT_2,
    Rarity = 1,
    RegionId = 1001,
    RewardId = {
      40019,
      40020,
      40021,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100402] = {
    DispatchCD = 300,
    DispatchCondition = 89004,
    DispatchDemand = T.RT_7,
    DispatchId = 100402,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 100402,
    PlayerLevel = T.RT_3,
    Rarity = 1,
    RegionId = 1001,
    RewardId = {
      40022,
      40023,
      40024,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100501] = {
    DispatchCD = 300,
    DispatchCondition = 89005,
    DispatchDemand = T.RT_1,
    DispatchId = 100501,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 100501,
    PlayerLevel = T.RT_2,
    Rarity = 1,
    RegionId = 1001,
    RewardId = {
      40025,
      40026,
      40027,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100502] = {
    DispatchCD = 300,
    DispatchCondition = 89005,
    DispatchDemand = T.RT_1,
    DispatchId = 100502,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 100502,
    PlayerLevel = T.RT_3,
    Rarity = 1,
    RegionId = 1001,
    RewardId = {
      40028,
      40029,
      40030,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100503] = {
    DispatchCD = 300,
    DispatchCondition = 89005,
    DispatchDemand = T.RT_4,
    DispatchId = 100503,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 100503,
    ExcId = {105203},
    PlayerLevel = T.RT_5,
    Rarity = 1,
    RegionId = 1001,
    RewardId = {
      40031,
      40032,
      40033,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100621] = {
    DispatchCD = 300,
    DispatchCondition = 89006,
    DispatchDemand = T.RT_8,
    DispatchId = 100621,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 100621,
    ExcId = {100641},
    PlayerLevel = T.RT_2,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40037,
      40038,
      40039,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100622] = {
    DispatchCD = 300,
    DispatchCondition = 89006,
    DispatchDemand = T.RT_8,
    DispatchId = 100622,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 100622,
    ExcId = {100642},
    PlayerLevel = T.RT_3,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40043,
      40044,
      40045,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100641] = {
    DispatchCD = 300,
    DispatchCondition = 89006,
    DispatchDemand = T.RT_9,
    DispatchId = 100641,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 100641,
    ExcId = {100621},
    PlayerLevel = T.RT_2,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40034,
      40035,
      40036,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100642] = {
    DispatchCD = 300,
    DispatchCondition = 89006,
    DispatchDemand = T.RT_9,
    DispatchId = 100642,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 100642,
    ExcId = {100622},
    PlayerLevel = T.RT_3,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40040,
      40041,
      40042,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100921] = {
    DispatchCD = 300,
    DispatchCondition = 89009,
    DispatchDemand = T.RT_8,
    DispatchId = 100921,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 100921,
    ExcId = {
      100951,
      101241,
      101211
    },
    PlayerLevel = T.RT_2,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40064,
      40065,
      40066,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100922] = {
    DispatchCD = 300,
    DispatchCondition = 89009,
    DispatchDemand = T.RT_8,
    DispatchId = 100922,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 100922,
    ExcId = {
      100952,
      101242,
      101212
    },
    PlayerLevel = T.RT_3,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40070,
      40071,
      40072,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100923] = {
    DispatchCD = 300,
    DispatchCondition = 89009,
    DispatchDemand = T.RT_10,
    DispatchId = 100923,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 100923,
    ExcId = {
      100953,
      101243,
      101213
    },
    PlayerLevel = T.RT_5,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40076,
      40077,
      40078,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100951] = {
    DispatchCD = 300,
    DispatchCondition = 89009,
    DispatchDemand = T.RT_11,
    DispatchId = 100951,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 100951,
    ExcId = {
      100921,
      101241,
      101211
    },
    PlayerLevel = T.RT_2,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40061,
      40062,
      40063,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100952] = {
    DispatchCD = 300,
    DispatchCondition = 89009,
    DispatchDemand = T.RT_11,
    DispatchId = 100952,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 100952,
    ExcId = {
      100922,
      101242,
      101212
    },
    PlayerLevel = T.RT_3,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40067,
      40068,
      40069,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [100953] = {
    DispatchCD = 300,
    DispatchCondition = 89009,
    DispatchDemand = T.RT_12,
    DispatchId = 100953,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 100953,
    ExcId = {
      100923,
      101243,
      101213
    },
    PlayerLevel = T.RT_5,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40073,
      40074,
      40075,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [101100] = {
    DispatchCD = 300,
    DispatchCondition = 4330,
    DispatchDemand = T.RT_13,
    DispatchId = 101100,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 101100,
    ExcId = {102524, 102534},
    PlayerLevel = {1, 65},
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40097,
      40098,
      40099,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [101211] = {
    DispatchCD = 300,
    DispatchCondition = 89012,
    DispatchDemand = T.RT_14,
    DispatchId = 101211,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 101211,
    ExcId = {
      101241,
      100951,
      100921
    },
    PlayerLevel = T.RT_2,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40103,
      40104,
      40105,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [101212] = {
    DispatchCD = 300,
    DispatchCondition = 89012,
    DispatchDemand = T.RT_14,
    DispatchId = 101212,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 101212,
    ExcId = {
      101242,
      100952,
      100922
    },
    PlayerLevel = T.RT_3,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40109,
      40110,
      40111,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [101213] = {
    DispatchCD = 300,
    DispatchCondition = 89012,
    DispatchDemand = T.RT_15,
    DispatchId = 101213,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 101213,
    ExcId = {
      101243,
      100953,
      100923
    },
    PlayerLevel = T.RT_5,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40115,
      40116,
      40117,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [101241] = {
    DispatchCD = 300,
    DispatchCondition = 89012,
    DispatchDemand = T.RT_9,
    DispatchId = 101241,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 101241,
    ExcId = {
      101211,
      100951,
      100921
    },
    PlayerLevel = T.RT_2,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40100,
      40101,
      40102,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [101242] = {
    DispatchCD = 300,
    DispatchCondition = 89012,
    DispatchDemand = T.RT_9,
    DispatchId = 101242,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 101242,
    ExcId = {
      101212,
      100952,
      100922
    },
    PlayerLevel = T.RT_3,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40106,
      40107,
      40108,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [101243] = {
    DispatchCD = 300,
    DispatchCondition = 89012,
    DispatchDemand = T.RT_16,
    DispatchId = 101243,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 101243,
    ExcId = {
      101213,
      100953,
      100923
    },
    PlayerLevel = T.RT_5,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40112,
      40113,
      40114,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [101313] = {
    DispatchCD = 300,
    DispatchCondition = 89013,
    DispatchDemand = T.RT_15,
    DispatchId = 101313,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 101313,
    ExcId = {101323},
    PlayerLevel = T.RT_5,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40118,
      40119,
      40120,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [101323] = {
    DispatchCD = 300,
    DispatchCondition = 89013,
    DispatchDemand = T.RT_10,
    DispatchId = 101323,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 101323,
    ExcId = {101313},
    PlayerLevel = T.RT_5,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40121,
      40122,
      40123,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [101405] = {
    DispatchCD = 300,
    DispatchCondition = 89014,
    DispatchDemand = T.RT_13,
    DispatchId = 101405,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 101405,
    ExcId = {307105},
    PlayerLevel = T.RT_17,
    Rarity = 1,
    RegionId = 1013,
    RewardId = {
      40124,
      40125,
      40126,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [101705] = {
    DispatchCD = 300,
    DispatchCondition = 89017,
    DispatchDemand = T.RT_13,
    DispatchId = 101705,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 101705,
    ExcId = {
      306305,
      202405,
      102905,
      304705
    },
    PlayerLevel = T.RT_17,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40133,
      40134,
      40135,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [102005] = {
    DispatchCD = 300,
    DispatchCondition = 89020,
    DispatchDemand = T.RT_13,
    DispatchId = 102005,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 102005,
    ExcId = {
      302705,
      207345,
      207315,
      207355
    },
    PlayerLevel = T.RT_17,
    Rarity = 1,
    RegionId = 1013,
    RewardId = {
      40145,
      40146,
      40147,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [102205] = {
    DispatchCD = 300,
    DispatchCondition = 89022,
    DispatchDemand = T.RT_13,
    DispatchId = 102205,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 102205,
    ExcId = T.RT_18,
    PlayerLevel = T.RT_17,
    Rarity = 1,
    RegionId = 1017,
    RewardId = {
      40154,
      40155,
      40156,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [102305] = {
    DispatchCD = 300,
    DispatchCondition = 89023,
    DispatchDemand = T.RT_13,
    DispatchId = 102305,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 102305,
    PlayerLevel = T.RT_17,
    Rarity = 1,
    RegionId = 1017,
    RewardId = {
      40157,
      40158,
      40159,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [102524] = {
    DispatchCD = 300,
    DispatchCondition = 89025,
    DispatchDemand = T.RT_10,
    DispatchId = 102524,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 102524,
    ExcId = {102534, 101104},
    PlayerLevel = T.RT_6,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40163,
      40164,
      40165,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [102525] = {
    DispatchCD = 300,
    DispatchCondition = 89025,
    DispatchDemand = {Morality = 3},
    DispatchId = 102525,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 102525,
    ExcId = {102535},
    PlayerLevel = T.RT_17,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40169,
      40170,
      40171,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [102534] = {
    DispatchCD = 300,
    DispatchCondition = 89025,
    DispatchDemand = T.RT_19,
    DispatchId = 102534,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 102534,
    ExcId = {102524, 101104},
    PlayerLevel = T.RT_6,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40166,
      40167,
      40168,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [102535] = {
    DispatchCD = 300,
    DispatchCondition = 89025,
    DispatchDemand = T.RT_20,
    DispatchId = 102535,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 102535,
    ExcId = {102525},
    PlayerLevel = T.RT_17,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40172,
      40173,
      40174,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [102905] = {
    DispatchCD = 300,
    DispatchCondition = 89029,
    DispatchDemand = T.RT_21,
    DispatchId = 102905,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 102905,
    ExcId = {101705, 304705},
    PlayerLevel = T.RT_17,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40187,
      40188,
      40189,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [104004] = {
    DispatchCD = 300,
    DispatchCondition = 89040,
    DispatchDemand = T.RT_4,
    DispatchId = 104004,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 104004,
    PlayerLevel = T.RT_6,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40232,
      40233,
      40234,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [104524] = {
    DispatchCD = 300,
    DispatchCondition = 89045,
    DispatchDemand = T.RT_10,
    DispatchId = 104524,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 104524,
    ExcId = {104554},
    PlayerLevel = T.RT_6,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40241,
      40242,
      40243,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [104554] = {
    DispatchCD = 300,
    DispatchCondition = 89045,
    DispatchDemand = T.RT_12,
    DispatchId = 104554,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 104554,
    ExcId = {104524},
    PlayerLevel = T.RT_6,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40238,
      40239,
      40240,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [104804] = {
    DispatchCD = 300,
    DispatchCondition = 89048,
    DispatchDemand = T.RT_4,
    DispatchId = 104804,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 104804,
    PlayerLevel = T.RT_6,
    Rarity = 1,
    RegionId = 1021,
    RewardId = {
      40250,
      40251,
      40252,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [105004] = {
    DispatchCD = 300,
    DispatchCondition = 89050,
    DispatchDemand = T.RT_4,
    DispatchId = 105004,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 105004,
    PlayerLevel = T.RT_6,
    Rarity = 1,
    RegionId = 1001,
    RewardId = {
      40253,
      40254,
      40255,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [105203] = {
    DispatchCD = 300,
    DispatchCondition = 89052,
    DispatchDemand = T.RT_4,
    DispatchId = 105203,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 105203,
    ExcId = {100503},
    PlayerLevel = T.RT_5,
    Rarity = 1,
    RegionId = 1001,
    RewardId = {
      40259,
      40260,
      40261,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [105204] = {
    DispatchCD = 300,
    DispatchCondition = 89052,
    DispatchDemand = T.RT_4,
    DispatchId = 105204,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 105204,
    PlayerLevel = T.RT_6,
    Rarity = 1,
    RegionId = 1001,
    RewardId = {
      40262,
      40263,
      40264,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [105904] = {
    DispatchCD = 300,
    DispatchCondition = 89059,
    DispatchDemand = T.RT_22,
    DispatchId = 105904,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 105904,
    PlayerLevel = T.RT_6,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40289,
      40290,
      40291,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [105905] = {
    DispatchCD = 300,
    DispatchCondition = 89059,
    DispatchDemand = T.RT_21,
    DispatchId = 105905,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 105905,
    PlayerLevel = T.RT_17,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40292,
      40293,
      40294,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [106543] = {
    DispatchCD = 300,
    DispatchCondition = 89065,
    DispatchDemand = T.RT_16,
    DispatchId = 106543,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 106543,
    ExcId = {
      106553,
      201053,
      201033
    },
    PlayerLevel = T.RT_5,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40322,
      40323,
      40324,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [106544] = {
    DispatchCD = 300,
    DispatchCondition = 89065,
    DispatchDemand = T.RT_16,
    DispatchId = 106544,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 106544,
    ExcId = {106554},
    PlayerLevel = T.RT_6,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40328,
      40329,
      40330,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [106553] = {
    DispatchCD = 300,
    DispatchCondition = 89065,
    DispatchDemand = T.RT_12,
    DispatchId = 106553,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 106553,
    ExcId = {
      106543,
      201053,
      201033
    },
    PlayerLevel = T.RT_5,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40325,
      40326,
      40327,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [106554] = {
    DispatchCD = 300,
    DispatchCondition = 89065,
    DispatchDemand = T.RT_12,
    DispatchId = 106554,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 106554,
    ExcId = {106544},
    PlayerLevel = T.RT_6,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40331,
      40332,
      40333,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [106635] = {
    DispatchCD = 300,
    DispatchCondition = 89066,
    DispatchDemand = T.RT_20,
    DispatchId = 106635,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 106635,
    ExcId = {106655},
    PlayerLevel = T.RT_17,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40334,
      40335,
      40336,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [106655] = {
    DispatchCD = 300,
    DispatchCondition = 89066,
    DispatchDemand = T.RT_23,
    DispatchId = 106655,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 106655,
    ExcId = {106635},
    PlayerLevel = T.RT_17,
    Rarity = 1,
    RegionId = 1011,
    RewardId = {
      40337,
      40338,
      40339,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [108103] = {
    DispatchCD = 300,
    DispatchCondition = 89081,
    DispatchDemand = T.RT_22,
    DispatchId = 108103,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 108103,
    PlayerLevel = T.RT_5,
    Rarity = 1,
    RegionId = 1017,
    RewardId = {
      40433,
      40434,
      40435,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [200701] = {
    DispatchCD = 450,
    DispatchCondition = 89007,
    DispatchDemand = T.RT_7,
    DispatchId = 200701,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 200701,
    ExcId = {201051, 201031},
    PlayerLevel = T.RT_2,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40046,
      40047,
      40048,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [200702] = {
    DispatchCD = 450,
    DispatchCondition = 89007,
    DispatchDemand = T.RT_22,
    DispatchId = 200702,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 200702,
    ExcId = {
      201052,
      201032,
      301802
    },
    PlayerLevel = T.RT_3,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40049,
      40050,
      40051,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [200801] = {
    DispatchCD = 450,
    DispatchCondition = 89008,
    DispatchDemand = T.RT_7,
    DispatchId = 200801,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 200801,
    PlayerLevel = T.RT_2,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40052,
      40053,
      40054,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [200802] = {
    DispatchCD = 450,
    DispatchCondition = 89008,
    DispatchDemand = T.RT_22,
    DispatchId = 200802,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 200802,
    PlayerLevel = T.RT_3,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40055,
      40056,
      40057,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [200803] = {
    DispatchCD = 450,
    DispatchCondition = 89008,
    DispatchDemand = T.RT_22,
    DispatchId = 200803,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 200803,
    PlayerLevel = T.RT_5,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40058,
      40059,
      40060,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [201031] = {
    DispatchCD = 450,
    DispatchCondition = 89010,
    DispatchDemand = T.RT_24,
    DispatchId = 201031,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 201031,
    ExcId = {200701, 201051},
    PlayerLevel = T.RT_2,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40082,
      40083,
      40084,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [201032] = {
    DispatchCD = 450,
    DispatchCondition = 89010,
    DispatchDemand = T.RT_19,
    DispatchId = 201032,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 201032,
    ExcId = {
      201052,
      200702,
      301802
    },
    PlayerLevel = T.RT_3,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40088,
      40089,
      40090,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [201033] = {
    DispatchCD = 450,
    DispatchCondition = 89010,
    DispatchDemand = T.RT_19,
    DispatchId = 201033,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 201033,
    ExcId = {
      201053,
      301803,
      106543,
      106553
    },
    PlayerLevel = T.RT_5,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40094,
      40095,
      40096,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [201051] = {
    DispatchCD = 450,
    DispatchCondition = 89010,
    DispatchDemand = T.RT_11,
    DispatchId = 201051,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 201051,
    ExcId = {200701, 201031},
    PlayerLevel = T.RT_2,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40079,
      40080,
      40081,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [201052] = {
    DispatchCD = 450,
    DispatchCondition = 89010,
    DispatchDemand = T.RT_12,
    DispatchId = 201052,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 201052,
    ExcId = {
      201032,
      200702,
      301802
    },
    PlayerLevel = T.RT_3,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40085,
      40086,
      40087,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [201053] = {
    DispatchCD = 450,
    DispatchCondition = 89010,
    DispatchDemand = T.RT_12,
    DispatchId = 201053,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 201053,
    ExcId = {
      201033,
      301803,
      106543,
      106553
    },
    PlayerLevel = T.RT_5,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40091,
      40092,
      40093,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [201503] = {
    DispatchCD = 450,
    DispatchCondition = 89015,
    DispatchDemand = T.RT_4,
    DispatchId = 201503,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 201503,
    PlayerLevel = T.RT_5,
    Rarity = 2,
    RegionId = 1001,
    RewardId = {
      40127,
      40128,
      40129,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [201504] = {
    DispatchCD = 450,
    DispatchCondition = 89015,
    DispatchDemand = T.RT_13,
    DispatchId = 201504,
    DispatchPerson = 2,
    DispatchType = "Battle",
    DispatchUIId = 201504,
    PlayerLevel = T.RT_6,
    Rarity = 2,
    RegionId = 1001,
    RewardId = {
      40130,
      40131,
      40132,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [202123] = {
    DispatchCD = 450,
    DispatchCondition = 89021,
    DispatchDemand = T.RT_10,
    DispatchId = 202123,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 202123,
    ExcId = {202143},
    PlayerLevel = T.RT_5,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40151,
      40152,
      40153,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [202143] = {
    DispatchCD = 450,
    DispatchCondition = 89021,
    DispatchDemand = T.RT_16,
    DispatchId = 202143,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 202143,
    ExcId = {202123},
    PlayerLevel = T.RT_5,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40148,
      40149,
      40150,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [202405] = {
    DispatchCD = 450,
    DispatchCondition = 89024,
    DispatchDemand = T.RT_25,
    DispatchId = 202405,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 202405,
    ExcId = {306305, 101705},
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40160,
      40161,
      40162,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [203205] = {
    DispatchCD = 450,
    DispatchCondition = 89032,
    DispatchDemand = T.RT_25,
    DispatchId = 203205,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 203205,
    ExcId = T.RT_18,
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1017,
    RewardId = {
      40202,
      40203,
      40204,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [203305] = {
    DispatchCD = 450,
    DispatchCondition = 89033,
    DispatchDemand = T.RT_25,
    DispatchId = 203305,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 203305,
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1001,
    RewardId = {
      40205,
      40206,
      40207,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [203704] = {
    DispatchCD = 450,
    DispatchCondition = 89037,
    DispatchDemand = T.RT_21,
    DispatchId = 203704,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 203704,
    PlayerLevel = T.RT_6,
    Rarity = 2,
    RegionId = 1013,
    RewardId = {
      40223,
      40224,
      40225,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [203705] = {
    DispatchCD = 450,
    DispatchCondition = 89037,
    DispatchDemand = T.RT_25,
    DispatchId = 203705,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 203705,
    ExcId = {302705},
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1013,
    RewardId = {
      40226,
      40227,
      40228,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [204405] = {
    DispatchCD = 450,
    DispatchCondition = 89044,
    DispatchDemand = T.RT_25,
    DispatchId = 204405,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 204405,
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40235,
      40236,
      40237,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [205105] = {
    DispatchCD = 450,
    DispatchCondition = 89051,
    DispatchDemand = T.RT_25,
    DispatchId = 205105,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 205105,
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1001,
    RewardId = {
      40256,
      40257,
      40258,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [205405] = {
    DispatchCD = 450,
    DispatchCondition = 89054,
    DispatchDemand = T.RT_25,
    DispatchId = 205405,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 205405,
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1001,
    RewardId = {
      40268,
      40269,
      40270,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [205705] = {
    DispatchCD = 450,
    DispatchCondition = 89057,
    DispatchDemand = T.RT_25,
    DispatchId = 205705,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 205705,
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1021,
    RewardId = {
      40280,
      40281,
      40282,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [206004] = {
    DispatchCD = 450,
    DispatchCondition = 89060,
    DispatchDemand = T.RT_26,
    DispatchId = 206004,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 206004,
    PlayerLevel = T.RT_6,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40295,
      40296,
      40297,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [206005] = {
    DispatchCD = 450,
    DispatchCondition = 89060,
    DispatchDemand = T.RT_27,
    DispatchId = 206005,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 206005,
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40298,
      40299,
      40300,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [206434] = {
    DispatchCD = 450,
    DispatchCondition = 89064,
    DispatchDemand = T.RT_20,
    DispatchId = 206434,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 206434,
    ExcId = {206444},
    PlayerLevel = T.RT_6,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40319,
      40320,
      40321,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [206444] = {
    DispatchCD = 450,
    DispatchCondition = 89064,
    DispatchDemand = {Empathy = 3},
    DispatchId = 206444,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 206444,
    ExcId = {206434},
    PlayerLevel = T.RT_6,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40316,
      40317,
      40318,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [206711] = {
    DispatchCD = 450,
    DispatchCondition = 89067,
    DispatchDemand = T.RT_14,
    DispatchId = 206711,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 206711,
    ExcId = {206731},
    PlayerLevel = T.RT_2,
    Rarity = 2,
    RegionId = 1017,
    RewardId = {
      40340,
      40341,
      40342,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [206712] = {
    DispatchCD = 450,
    DispatchCondition = 89067,
    DispatchDemand = T.RT_15,
    DispatchId = 206712,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 206712,
    ExcId = {206732},
    PlayerLevel = T.RT_3,
    Rarity = 2,
    RegionId = 1017,
    RewardId = {
      40346,
      40347,
      40348,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [206713] = {
    DispatchCD = 450,
    DispatchCondition = 89067,
    DispatchDemand = T.RT_15,
    DispatchId = 206713,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 206713,
    ExcId = {206733},
    PlayerLevel = T.RT_5,
    Rarity = 2,
    RegionId = 1017,
    RewardId = {
      40352,
      40353,
      40354,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [206731] = {
    DispatchCD = 450,
    DispatchCondition = 89067,
    DispatchDemand = T.RT_24,
    DispatchId = 206731,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 206731,
    ExcId = {206711},
    PlayerLevel = T.RT_2,
    Rarity = 2,
    RegionId = 1017,
    RewardId = {
      40343,
      40344,
      40345,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [206732] = {
    DispatchCD = 450,
    DispatchCondition = 89067,
    DispatchDemand = T.RT_19,
    DispatchId = 206732,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 206732,
    ExcId = {206712},
    PlayerLevel = T.RT_3,
    Rarity = 2,
    RegionId = 1017,
    RewardId = {
      40349,
      40350,
      40351,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [206733] = {
    DispatchCD = 450,
    DispatchCondition = 89067,
    DispatchDemand = T.RT_19,
    DispatchId = 206733,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 206733,
    ExcId = {206713},
    PlayerLevel = T.RT_5,
    Rarity = 2,
    RegionId = 1017,
    RewardId = {
      40355,
      40356,
      40357,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [206905] = {
    DispatchCD = 450,
    DispatchCondition = 89069,
    DispatchDemand = T.RT_27,
    DispatchId = 206905,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 206905,
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1017,
    RewardId = {
      40361,
      40362,
      40363,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [207005] = {
    DispatchCD = 450,
    DispatchCondition = 89070,
    DispatchDemand = T.RT_27,
    DispatchId = 207005,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 207005,
    ExcId = {102205, 203205},
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1017,
    RewardId = {
      40364,
      40365,
      40366,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [207213] = {
    DispatchCD = 450,
    DispatchCondition = 89072,
    DispatchDemand = T.RT_15,
    DispatchId = 207213,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 207213,
    ExcId = {207233},
    PlayerLevel = T.RT_5,
    Rarity = 2,
    RegionId = 1013,
    RewardId = {
      40373,
      40374,
      40375,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [207214] = {
    DispatchCD = 450,
    DispatchCondition = 89072,
    DispatchDemand = T.RT_28,
    DispatchId = 207214,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 207214,
    ExcId = {207234},
    PlayerLevel = T.RT_6,
    Rarity = 2,
    RegionId = 1013,
    RewardId = {
      40379,
      40380,
      40381,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [207233] = {
    DispatchCD = 450,
    DispatchCondition = 89072,
    DispatchDemand = T.RT_19,
    DispatchId = 207233,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 207233,
    ExcId = {207213},
    PlayerLevel = T.RT_5,
    Rarity = 2,
    RegionId = 1013,
    RewardId = {
      40370,
      40371,
      40372,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [207234] = {
    DispatchCD = 450,
    DispatchCondition = 89072,
    DispatchDemand = T.RT_20,
    DispatchId = 207234,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 207234,
    ExcId = {207214},
    PlayerLevel = T.RT_6,
    Rarity = 2,
    RegionId = 1013,
    RewardId = {
      40376,
      40377,
      40378,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [207315] = {
    DispatchCD = 450,
    DispatchCondition = 89073,
    DispatchDemand = T.RT_29,
    DispatchId = 207315,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 207315,
    ExcId = {
      102005,
      207345,
      207355
    },
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1013,
    RewardId = {
      40385,
      40386,
      40387,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [207345] = {
    DispatchCD = 450,
    DispatchCondition = 89073,
    DispatchDemand = {Empathy = 4},
    DispatchId = 207345,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 207345,
    ExcId = {
      102005,
      207315,
      207355
    },
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1013,
    RewardId = {
      40382,
      40383,
      40384,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [207355] = {
    DispatchCD = 450,
    DispatchCondition = 89073,
    DispatchDemand = T.RT_30,
    DispatchId = 207355,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 207355,
    ExcId = {
      102005,
      207315,
      207345
    },
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1013,
    RewardId = {
      40388,
      40389,
      40390,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [207614] = {
    DispatchCD = 450,
    DispatchCondition = 89076,
    DispatchDemand = T.RT_28,
    DispatchId = 207614,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 207614,
    ExcId = {207654},
    PlayerLevel = T.RT_6,
    Rarity = 2,
    RegionId = 1013,
    RewardId = {
      40403,
      40404,
      40405,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [207615] = {
    DispatchCD = 450,
    DispatchCondition = 89076,
    DispatchDemand = T.RT_29,
    DispatchId = 207615,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 207615,
    ExcId = {207655, 307105},
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1013,
    RewardId = {
      40409,
      40410,
      40411,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [207654] = {
    DispatchCD = 450,
    DispatchCondition = 89076,
    DispatchDemand = T.RT_23,
    DispatchId = 207654,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 207654,
    ExcId = {207614},
    PlayerLevel = T.RT_6,
    Rarity = 2,
    RegionId = 1013,
    RewardId = {
      40406,
      40407,
      40408,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [207655] = {
    DispatchCD = 450,
    DispatchCondition = 89076,
    DispatchDemand = T.RT_30,
    DispatchId = 207655,
    DispatchPerson = 2,
    DispatchType = "Social",
    DispatchUIId = 207655,
    ExcId = {207615, 307105},
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1013,
    RewardId = {
      40412,
      40413,
      40414,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [207704] = {
    DispatchCD = 450,
    DispatchCondition = 89077,
    DispatchDemand = T.RT_26,
    DispatchId = 207704,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 207704,
    PlayerLevel = T.RT_6,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40415,
      40416,
      40417,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [207705] = {
    DispatchCD = 450,
    DispatchCondition = 89077,
    DispatchDemand = T.RT_27,
    DispatchId = 207705,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 207705,
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40418,
      40419,
      40420,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [207804] = {
    DispatchCD = 450,
    DispatchCondition = 89078,
    DispatchDemand = T.RT_26,
    DispatchId = 207804,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 207804,
    PlayerLevel = T.RT_6,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40421,
      40422,
      40423,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [207805] = {
    DispatchCD = 450,
    DispatchCondition = 89078,
    DispatchDemand = T.RT_27,
    DispatchId = 207805,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 207805,
    PlayerLevel = T.RT_17,
    Rarity = 2,
    RegionId = 1011,
    RewardId = {
      40424,
      40425,
      40426,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [207903] = {
    DispatchCD = 450,
    DispatchCondition = 89079,
    DispatchDemand = T.RT_22,
    DispatchId = 207903,
    DispatchPerson = 2,
    DispatchType = "Collect",
    DispatchUIId = 207903,
    PlayerLevel = T.RT_5,
    Rarity = 2,
    RegionId = 1017,
    RewardId = {
      40427,
      40428,
      40429,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [301802] = {
    DispatchCD = 600,
    DispatchCondition = 89018,
    DispatchDemand = T.RT_4,
    DispatchId = 301802,
    DispatchPerson = 3,
    DispatchType = "Battle",
    DispatchUIId = 301802,
    ExcId = {
      200702,
      201052,
      201032
    },
    PlayerLevel = T.RT_3,
    Rarity = 3,
    RegionId = 1011,
    RewardId = {
      40136,
      40137,
      40138,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [301803] = {
    DispatchCD = 600,
    DispatchCondition = 89018,
    DispatchDemand = T.RT_13,
    DispatchId = 301803,
    DispatchPerson = 3,
    DispatchType = "Battle",
    DispatchUIId = 301803,
    ExcId = {201053, 201033},
    PlayerLevel = T.RT_5,
    Rarity = 3,
    RegionId = 1011,
    RewardId = {
      40139,
      40140,
      40141,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [301804] = {
    DispatchCD = 600,
    DispatchCondition = 89018,
    DispatchDemand = T.RT_13,
    DispatchId = 301804,
    DispatchPerson = 3,
    DispatchType = "Battle",
    DispatchUIId = 301804,
    PlayerLevel = T.RT_6,
    Rarity = 3,
    RegionId = 1011,
    RewardId = {
      40142,
      40143,
      40144,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [302605] = {
    DispatchCD = 600,
    DispatchCondition = 89026,
    DispatchDemand = T.RT_31,
    DispatchId = 302605,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 302605,
    PlayerLevel = T.RT_17,
    Rarity = 3,
    RegionId = 1011,
    RewardId = {
      40175,
      40176,
      40177,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [302705] = {
    DispatchCD = 600,
    DispatchCondition = 89027,
    DispatchDemand = T.RT_31,
    DispatchId = 302705,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 302705,
    ExcId = {203705, 102005},
    PlayerLevel = T.RT_17,
    Rarity = 3,
    RegionId = 1013,
    RewardId = {
      40178,
      40179,
      40180,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [302802] = {
    DispatchCD = 600,
    DispatchCondition = 89028,
    DispatchDemand = T.RT_22,
    DispatchId = 302802,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 302802,
    PlayerLevel = T.RT_3,
    Rarity = 3,
    RegionId = 1013,
    RewardId = {
      40181,
      40182,
      40183,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [302803] = {
    DispatchCD = 600,
    DispatchCondition = 89028,
    DispatchDemand = T.RT_21,
    DispatchId = 302803,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 302803,
    PlayerLevel = T.RT_5,
    Rarity = 3,
    RegionId = 1013,
    RewardId = {
      40184,
      40185,
      40186,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [303003] = {
    DispatchCD = 600,
    DispatchCondition = 89030,
    DispatchDemand = T.RT_21,
    DispatchId = 303003,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 303003,
    PlayerLevel = T.RT_5,
    Rarity = 3,
    RegionId = 1017,
    RewardId = {
      40190,
      40191,
      40192,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [303004] = {
    DispatchCD = 600,
    DispatchCondition = 89030,
    DispatchDemand = T.RT_21,
    DispatchId = 303004,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 303004,
    PlayerLevel = T.RT_6,
    Rarity = 3,
    RegionId = 1017,
    RewardId = {
      40193,
      40194,
      40195,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [303103] = {
    DispatchCD = 600,
    DispatchCondition = 89031,
    DispatchDemand = T.RT_32,
    DispatchId = 303103,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 303103,
    ExcId = {307403},
    PlayerLevel = T.RT_5,
    Rarity = 3,
    RegionId = 1013,
    RewardId = {
      40196,
      40197,
      40198,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [303104] = {
    DispatchCD = 600,
    DispatchCondition = 89031,
    DispatchDemand = T.RT_32,
    DispatchId = 303104,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 303104,
    PlayerLevel = T.RT_6,
    Rarity = 3,
    RegionId = 1013,
    RewardId = {
      40199,
      40200,
      40201,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [303402] = {
    DispatchCD = 600,
    DispatchCondition = 89034,
    DispatchDemand = T.RT_4,
    DispatchId = 303402,
    DispatchPerson = 3,
    DispatchType = "Battle",
    DispatchUIId = 303402,
    PlayerLevel = T.RT_3,
    Rarity = 3,
    RegionId = 1021,
    RewardId = {
      40208,
      40209,
      40210,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [303403] = {
    DispatchCD = 600,
    DispatchCondition = 89034,
    DispatchDemand = T.RT_13,
    DispatchId = 303403,
    DispatchPerson = 3,
    DispatchType = "Battle",
    DispatchUIId = 303403,
    PlayerLevel = T.RT_5,
    Rarity = 3,
    RegionId = 1021,
    RewardId = {
      40211,
      40212,
      40213,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [303502] = {
    DispatchCD = 600,
    DispatchCondition = 89035,
    DispatchDemand = T.RT_4,
    DispatchId = 303502,
    DispatchPerson = 3,
    DispatchType = "Battle",
    DispatchUIId = 303502,
    PlayerLevel = T.RT_3,
    Rarity = 3,
    RegionId = 1021,
    RewardId = {
      40214,
      40215,
      40216,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [303503] = {
    DispatchCD = 600,
    DispatchCondition = 89035,
    DispatchDemand = T.RT_13,
    DispatchId = 303503,
    DispatchPerson = 3,
    DispatchType = "Battle",
    DispatchUIId = 303503,
    PlayerLevel = T.RT_5,
    Rarity = 3,
    RegionId = 1021,
    RewardId = {
      40217,
      40218,
      40219,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [303504] = {
    DispatchCD = 600,
    DispatchCondition = 89035,
    DispatchDemand = T.RT_13,
    DispatchId = 303504,
    DispatchPerson = 3,
    DispatchType = "Battle",
    DispatchUIId = 303504,
    PlayerLevel = T.RT_6,
    Rarity = 3,
    RegionId = 1021,
    RewardId = {
      40220,
      40221,
      40222,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [303805] = {
    DispatchCD = 600,
    DispatchCondition = 89038,
    DispatchDemand = T.RT_33,
    DispatchId = 303805,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 303805,
    PlayerLevel = T.RT_17,
    Rarity = 3,
    RegionId = 1011,
    RewardId = {
      40229,
      40230,
      40231,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [304604] = {
    DispatchCD = 600,
    DispatchCondition = 89046,
    DispatchDemand = T.RT_13,
    DispatchId = 304604,
    DispatchPerson = 3,
    DispatchType = "Battle",
    DispatchUIId = 304604,
    ExcId = {305604},
    PlayerLevel = T.RT_6,
    Rarity = 3,
    RegionId = 1021,
    RewardId = {
      40244,
      40245,
      40246,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [304705] = {
    DispatchCD = 600,
    DispatchCondition = 89047,
    DispatchDemand = T.RT_31,
    DispatchId = 304705,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 304705,
    ExcId = {
      101705,
      102905,
      202405
    },
    PlayerLevel = T.RT_17,
    Rarity = 3,
    RegionId = 1011,
    RewardId = {
      40247,
      40248,
      40249,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [305304] = {
    DispatchCD = 600,
    DispatchCondition = 89053,
    DispatchDemand = T.RT_34,
    DispatchId = 305304,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 305304,
    PlayerLevel = T.RT_6,
    Rarity = 3,
    RegionId = 1001,
    RewardId = {
      40265,
      40266,
      40267,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [305503] = {
    DispatchCD = 600,
    DispatchCondition = 89055,
    DispatchDemand = T.RT_34,
    DispatchId = 305503,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 305503,
    PlayerLevel = T.RT_5,
    Rarity = 3,
    RegionId = 1021,
    RewardId = {
      40271,
      40272,
      40273,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [305604] = {
    DispatchCD = 600,
    DispatchCondition = 89056,
    DispatchDemand = T.RT_21,
    DispatchId = 305604,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 305604,
    ExcId = {304604},
    PlayerLevel = T.RT_6,
    Rarity = 3,
    RegionId = 1021,
    RewardId = {
      40274,
      40275,
      40276,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [305605] = {
    DispatchCD = 600,
    DispatchCondition = 89056,
    DispatchDemand = T.RT_31,
    DispatchId = 305605,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 305605,
    PlayerLevel = T.RT_17,
    Rarity = 3,
    RegionId = 1021,
    RewardId = {
      40277,
      40278,
      40279,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [305804] = {
    DispatchCD = 600,
    DispatchCondition = 89058,
    DispatchDemand = T.RT_21,
    DispatchId = 305804,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 305804,
    PlayerLevel = T.RT_6,
    Rarity = 3,
    RegionId = 1021,
    RewardId = {
      40283,
      40284,
      40285,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [305805] = {
    DispatchCD = 600,
    DispatchCondition = 89058,
    DispatchDemand = T.RT_31,
    DispatchId = 305805,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 305805,
    PlayerLevel = T.RT_17,
    Rarity = 3,
    RegionId = 1021,
    RewardId = {
      40286,
      40287,
      40288,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [306105] = {
    DispatchCD = 600,
    DispatchCondition = 89061,
    DispatchDemand = T.RT_33,
    DispatchId = 306105,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 306105,
    PlayerLevel = T.RT_17,
    Rarity = 3,
    RegionId = 1011,
    RewardId = {
      40301,
      40302,
      40303,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [306204] = {
    DispatchCD = 600,
    DispatchCondition = 89062,
    DispatchDemand = T.RT_21,
    DispatchId = 306204,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 306204,
    PlayerLevel = T.RT_6,
    Rarity = 3,
    RegionId = 1011,
    RewardId = {
      40304,
      40305,
      40306,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [306205] = {
    DispatchCD = 600,
    DispatchCondition = 89062,
    DispatchDemand = T.RT_31,
    DispatchId = 306205,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 306205,
    PlayerLevel = T.RT_17,
    Rarity = 3,
    RegionId = 1011,
    RewardId = {
      40307,
      40308,
      40309,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [306304] = {
    DispatchCD = 600,
    DispatchCondition = 89063,
    DispatchDemand = T.RT_34,
    DispatchId = 306304,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 306304,
    PlayerLevel = T.RT_6,
    Rarity = 3,
    RegionId = 1011,
    RewardId = {
      40310,
      40311,
      40312,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [306305] = {
    DispatchCD = 600,
    DispatchCondition = 89063,
    DispatchDemand = T.RT_33,
    DispatchId = 306305,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 306305,
    ExcId = {202405, 101705},
    PlayerLevel = T.RT_17,
    Rarity = 3,
    RegionId = 1011,
    RewardId = {
      40313,
      40314,
      40315,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [306802] = {
    DispatchCD = 600,
    DispatchCondition = 89068,
    DispatchDemand = T.RT_35,
    DispatchId = 306802,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 306802,
    PlayerLevel = T.RT_3,
    Rarity = 3,
    RegionId = 1017,
    RewardId = {
      40358,
      40359,
      40360,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [307105] = {
    DispatchCD = 600,
    DispatchCondition = 89071,
    DispatchDemand = T.RT_33,
    DispatchId = 307105,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 307105,
    ExcId = {
      101405,
      207615,
      207655
    },
    PlayerLevel = T.RT_17,
    Rarity = 3,
    RegionId = 1013,
    RewardId = {
      40367,
      40368,
      40369,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [307402] = {
    DispatchCD = 600,
    DispatchCondition = 89074,
    DispatchDemand = T.RT_35,
    DispatchId = 307402,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 307402,
    PlayerLevel = T.RT_3,
    Rarity = 3,
    RegionId = 1013,
    RewardId = {
      40391,
      40392,
      40393,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [307403] = {
    DispatchCD = 600,
    DispatchCondition = 89074,
    DispatchDemand = T.RT_34,
    DispatchId = 307403,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 307403,
    ExcId = {303103},
    PlayerLevel = T.RT_5,
    Rarity = 3,
    RegionId = 1013,
    RewardId = {
      40394,
      40395,
      40396,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [307504] = {
    DispatchCD = 600,
    DispatchCondition = 89075,
    DispatchDemand = T.RT_34,
    DispatchId = 307504,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 307504,
    PlayerLevel = T.RT_6,
    Rarity = 3,
    RegionId = 1017,
    RewardId = {
      40397,
      40398,
      40399,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [307505] = {
    DispatchCD = 600,
    DispatchCondition = 89075,
    DispatchDemand = T.RT_33,
    DispatchId = 307505,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 307505,
    PlayerLevel = T.RT_17,
    Rarity = 3,
    RegionId = 1017,
    RewardId = {
      40400,
      40401,
      40402,
      40000
    },
    Ttk = 600,
    Weight = 1
  },
  [308005] = {
    DispatchCD = 600,
    DispatchCondition = 89080,
    DispatchDemand = T.RT_31,
    DispatchId = 308005,
    DispatchPerson = 3,
    DispatchType = "Collect",
    DispatchUIId = 308005,
    PlayerLevel = T.RT_17,
    Rarity = 3,
    RegionId = 1017,
    RewardId = {
      40430,
      40431,
      40432,
      40000
    },
    Ttk = 600,
    Weight = 1
  }
})
