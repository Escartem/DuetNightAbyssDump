local T = {}
T.RT_1 = {20, 40}
T.RT_2 = {80, 100}
T.RT_3 = {50, 120}
T.RT_4 = {50, 150}
T.RT_5 = {60, 240}
T.RT_6 = {3, 15}
T.RT_7 = {15, 30}
T.RT_8 = {
  10,
  5,
  3
}
T.RT_9 = {
  15,
  5,
  3
}
T.RT_10 = {5, 20}
T.RT_11 = {3, 8}
T.RT_12 = {100, 300}
T.RT_13 = {20, 45}
T.RT_14 = {4, 9}
T.RT_15 = {
  120,
  5,
  1
}
T.RT_16 = {
  240,
  5,
  1
}
T.RT_17 = {100, 200}
T.RT_18 = {
  500,
  5,
  20
}
T.RT_19 = {50, 100}
T.RT_20 = {
  120,
  5,
  10
}
T.RT_21 = {
  240,
  5,
  10
}
T.RT_22 = {8, 15}
T.RT_23 = {
  70,
  5,
  1
}
T.RT_24 = {
  105,
  5,
  1
}
T.RT_25 = {4, 10}
T.RT_26 = {
  500,
  5,
  40
}
T.RT_27 = {20, 50}
T.RT_28 = {70, 150}
T.RT_29 = {20, 35}
T.RT_30 = {
  40,
  5,
  3
}
T.RT_31 = {
  60,
  5,
  3
}
T.RT_32 = {120, 300}
T.RT_33 = {
  500,
  5,
  36
}
T.RT_34 = {3, 10}
T.RT_35 = {3, 5}
T.RT_36 = {
  70,
  5,
  0
}
T.RT_37 = {
  105,
  5,
  0
}
T.RT_38 = {30, 50}
T.RT_39 = {
  120,
  5,
  4
}
T.RT_40 = {
  240,
  5,
  4
}
T.RT_41 = {200, 400}
T.RT_42 = {7, 15}
T.RT_43 = {
  70,
  5,
  4
}
T.RT_44 = {
  105,
  5,
  4
}
T.RT_45 = {10, 20}
T.RT_46 = {
  120,
  5,
  2
}
T.RT_47 = {
  240,
  5,
  2
}
T.RT_48 = {10, 25}
T.RT_49 = {
  500,
  5,
  3
}
T.RT_50 = {50, 80}
T.RT_51 = {13, 16}
T.RT_52 = {5, 10}
T.RT_53 = {200, 250}
T.RT_54 = {
  500,
  5,
  10
}
T.RT_55 = {15, 25}
T.RT_56 = {8, 10}
T.RT_57 = {10, 17}
T.RT_58 = {500, 560}
T.RT_59 = {
  500,
  5,
  12
}
T.RT_60 = {6, 20}
T.RT_61 = {10, 15}
T.RT_62 = {
  500,
  5,
  4
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Fish", {
  [1101] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 1101,
    FishLength = T.RT_1,
    FishLevel = 2,
    FishMoveId = 202,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_Normal_1",
    PriceOnWeight = {
      20,
      5,
      4
    },
    ResourceId = 5011010,
    VariationFishId = {110101},
    VariationProb = 0.2
  },
  [1102] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 1102,
    FishLength = T.RT_2,
    FishLevel = 1,
    FishMoveId = 203,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_Normal_2",
    PriceOnWeight = {
      10,
      5,
      4
    },
    ResourceId = 5011020,
    VariationFishId = {110201},
    VariationProb = 0.2
  },
  [1103] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 1103,
    FishLength = T.RT_3,
    FishLevel = 1,
    FishMoveId = 103,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_Normal_3",
    PriceOnWeight = {
      10,
      5,
      14
    },
    ResourceId = 5011030,
    VariationFishId = {110301},
    VariationProb = 0.2
  },
  [1201] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 1201,
    FishLength = T.RT_4,
    FishLevel = 1,
    FishMoveId = 101,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_Normal_1",
    PriceOnWeight = {
      10,
      5,
      20
    },
    ResourceId = 5012010,
    VariationFishId = {120101},
    VariationProb = 0.2
  },
  [1202] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 1202,
    FishLength = T.RT_5,
    FishLevel = 1,
    FishMoveId = 102,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_Normal_2",
    PriceOnWeight = {
      10,
      5,
      36
    },
    ResourceId = 5012020,
    VariationFishId = {120201},
    VariationProb = 0.2
  },
  [1203] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 1203,
    FishLength = T.RT_6,
    FishLevel = 1,
    FishMoveId = 201,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_Normal_3",
    PriceOnWeight = {
      10,
      5,
      2
    },
    ResourceId = 5012030,
    VariationFishId = {120301},
    VariationProb = 0.2
  },
  [1301] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 1301,
    FishLength = T.RT_6,
    FishLevel = 2,
    FishMoveId = 204,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Normal_1",
    PriceOnWeight = {
      20,
      5,
      2
    },
    ResourceId = 5013010,
    VariationFishId = {130101},
    VariationProb = 0.2
  },
  [1302] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 1302,
    FishLength = T.RT_7,
    FishLevel = 1,
    FishMoveId = 205,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_East_3",
    PriceOnWeight = T.RT_8,
    ResourceId = 5013020,
    VariationFishId = {130201},
    VariationProb = 0.2
  },
  [1303] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 1303,
    FishLength = T.RT_10,
    FishLevel = 1,
    FishMoveId = 104,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Normal_3",
    PriceOnWeight = T.RT_8,
    ResourceId = 5013030,
    VariationFishId = {130301},
    VariationProb = 0.2
  },
  [2101] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2101,
    FishLength = T.RT_11,
    FishLevel = 2,
    FishMoveId = 304,
    FishSmall2BigMinLength = 6.5,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_Village_1",
    PriceOnWeight = {
      20,
      5,
      1
    },
    ResourceId = 5021010,
    Small2BigFishId = 2104,
    VariationFishId = {210101},
    VariationProb = 0.2
  },
  [2102] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2102,
    FishLength = T.RT_12,
    FishLevel = 3,
    FishMoveId = 208,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_Village_2",
    PriceOnWeight = {
      40,
      5,
      40
    },
    ResourceId = 5021020,
    VariationFishId = {210201},
    VariationProb = 0.2
  },
  [2103] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2103,
    FishLength = T.RT_13,
    FishLevel = 4,
    FishMoveId = 209,
    FishSmall2BigMinLength = 36.25,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_Village_4",
    PriceOnWeight = {
      70,
      5,
      5
    },
    ResourceId = 5021030,
    Small2BigFishId = 2105,
    VariationFishId = {210301},
    VariationProb = 0.2
  },
  [2104] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2104,
    FishLength = T.RT_14,
    FishLevel = 5,
    FishMoveId = 404,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_Village_3",
    PriceOnWeight = T.RT_15,
    ResourceId = 5021040,
    VariationFishId = {210401},
    VariationProb = 0.1
  },
  [2105] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2105,
    FishLength = T.RT_17,
    FishLevel = 6,
    FishMoveId = 603,
    FishType = 3,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_Village_5",
    PriceOnWeight = T.RT_18,
    ResourceId = 5021050,
    VariationFishId = {210501},
    VariationProb = 0.1
  },
  [2201] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2201,
    FishLength = T.RT_19,
    FishLevel = 5,
    FishMoveId = 402,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_East_1",
    PriceOnWeight = T.RT_20,
    ResourceId = 5022010,
    VariationFishId = {220101},
    VariationProb = 0.1
  },
  [2202] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2202,
    FishLength = T.RT_22,
    FishLevel = 4,
    FishMoveId = 302,
    FishSmall2BigMinLength = 12.2,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_East_2",
    PriceOnWeight = T.RT_23,
    ResourceId = 5022020,
    Small2BigFishId = 2201,
    VariationFishId = {220201},
    VariationProb = 0.2
  },
  [2203] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2203,
    FishLength = T.RT_4,
    FishLevel = 5,
    FishMoveId = 303,
    FishSmall2BigMinLength = 105,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_East_4",
    PriceOnWeight = {
      120,
      5,
      20
    },
    ResourceId = 5022030,
    Small2BigFishId = 2205,
    VariationFishId = {220301},
    VariationProb = 0.2
  },
  [2204] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2204,
    FishLength = T.RT_25,
    FishLevel = 4,
    FishMoveId = 403,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_East_3",
    PriceOnWeight = T.RT_23,
    ResourceId = 5022040,
    VariationFishId = {220401},
    VariationProb = 0.2
  },
  [2205] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2205,
    FishLength = T.RT_12,
    FishLevel = 6,
    FishMoveId = 602,
    FishType = 3,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_East_5",
    PriceOnWeight = T.RT_26,
    ResourceId = 5022050,
    VariationFishId = {220501},
    VariationProb = 0.1
  },
  [2301] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2301,
    FishLength = T.RT_27,
    FishLevel = 2,
    FishMoveId = 206,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_IceLake_3",
    PriceOnWeight = {
      20,
      5,
      6
    },
    ResourceId = 5023010,
    VariationFishId = {230101},
    VariationProb = 0.2
  },
  [2302] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2302,
    FishLength = T.RT_3,
    FishLevel = 2,
    FishMoveId = 207,
    FishSmall2BigMinLength = 95.5,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_IceLake_2",
    PriceOnWeight = {
      20,
      5,
      14
    },
    ResourceId = 5023020,
    Small2BigFishId = 2304,
    VariationFishId = {230201},
    VariationProb = 0.2
  },
  [2303] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2303,
    FishLength = T.RT_28,
    FishLevel = 3,
    FishMoveId = 301,
    FishSmall2BigMinLength = 118,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_IceLake_4",
    PriceOnWeight = {
      40,
      5,
      16
    },
    ResourceId = 5023030,
    Small2BigFishId = 2305,
    VariationFishId = {230301},
    VariationProb = 0.2
  },
  [2304] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2304,
    FishLength = T.RT_29,
    FishLevel = 3,
    FishMoveId = 401,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_IceLake_1",
    PriceOnWeight = T.RT_30,
    ResourceId = 5023040,
    VariationFishId = {230401},
    VariationProb = 0.1
  },
  [2305] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2305,
    FishLength = T.RT_32,
    FishLevel = 6,
    FishMoveId = 601,
    FishType = 3,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_IceLake_5",
    PriceOnWeight = T.RT_33,
    ResourceId = 5023050,
    VariationFishId = {230501},
    VariationProb = 0.1
  },
  [2401] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2401,
    FishLength = T.RT_34,
    FishLevel = 4,
    FishMoveId = 305,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_East_1",
    PriceOnWeight = T.RT_23,
    ResourceId = 5024010,
    VariationFishId = {240101},
    VariationProb = 0.2
  },
  [2402] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2402,
    FishLength = T.RT_35,
    FishLevel = 4,
    FishMoveId = 405,
    FishSmall2BigMinLength = 4.2,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_East_2",
    PriceOnWeight = T.RT_36,
    ResourceId = 5024020,
    Small2BigFishId = 2404,
    VariationFishId = {240201},
    VariationProb = 0.2
  },
  [2403] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2403,
    FishLength = T.RT_38,
    FishLevel = 5,
    FishMoveId = 501,
    FishSmall2BigMinLength = 41,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_East_4",
    PriceOnWeight = T.RT_39,
    ResourceId = 5024030,
    Small2BigFishId = 2405,
    VariationFishId = {240301},
    VariationProb = 0.2
  },
  [2404] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2404,
    FishLength = T.RT_38,
    FishLevel = 5,
    FishMoveId = 502,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_East_3",
    PriceOnWeight = T.RT_39,
    ResourceId = 5024040,
    VariationFishId = {240401},
    VariationProb = 0.1
  },
  [2405] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2405,
    FishLength = T.RT_41,
    FishLevel = 6,
    FishMoveId = 604,
    FishType = 3,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_East_5",
    PriceOnWeight = T.RT_26,
    ResourceId = 5024050,
    VariationFishId = {240501},
    VariationProb = 0.1
  },
  [2501] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2501,
    FishLength = T.RT_42,
    FishLevel = 3,
    FishMoveId = 406,
    FishSmall2BigMinLength = 12.2,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_1",
    PriceOnWeight = {
      40,
      5,
      1
    },
    ResourceId = 5025010,
    Small2BigFishId = 2504,
    VariationFishId = {250101},
    VariationProb = 0.2
  },
  [2502] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2502,
    FishLength = T.RT_38,
    FishLevel = 4,
    FishMoveId = 306,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_2",
    PriceOnWeight = T.RT_43,
    ResourceId = 5025020,
    VariationFishId = {250201},
    VariationProb = 0.2
  },
  [2503] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2503,
    FishLength = T.RT_45,
    FishLevel = 5,
    FishMoveId = 503,
    FishSmall2BigMinLength = 15.5,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_4",
    PriceOnWeight = T.RT_46,
    ResourceId = 5025030,
    Small2BigFishId = 2505,
    VariationFishId = {250301},
    VariationProb = 0.2
  },
  [2504] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2504,
    FishLength = T.RT_19,
    FishLevel = 5,
    FishMoveId = 504,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_3",
    PriceOnWeight = T.RT_20,
    ResourceId = 5025040,
    VariationFishId = {250401},
    VariationProb = 0.1
  },
  [2505] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2505,
    FishLength = T.RT_48,
    FishLevel = 6,
    FishMoveId = 605,
    FishType = 3,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_5",
    PriceOnWeight = T.RT_49,
    ResourceId = 5025050,
    VariationFishId = {250501},
    VariationProb = 0.1
  },
  [2601] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2601,
    FishLength = T.RT_50,
    FishLevel = 3,
    FishMoveId = 105,
    FishSmall2BigMinLength = 68,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_1",
    PriceOnWeight = {
      40,
      5,
      6
    },
    ResourceId = 5026010,
    Small2BigFishId = 2605,
    VariationFishId = {260101},
    VariationProb = 0.2
  },
  [2602] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2602,
    FishLength = T.RT_51,
    FishLevel = 4,
    FishMoveId = 210,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_2",
    PriceOnWeight = T.RT_36,
    ResourceId = 5026020,
    VariationFishId = {260201},
    VariationProb = 0.2
  },
  [2603] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2603,
    FishLength = T.RT_52,
    FishLevel = 5,
    FishMoveId = 307,
    FishSmall2BigMinLength = 8,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_4",
    PriceOnWeight = T.RT_15,
    ResourceId = 5026030,
    Small2BigFishId = 2604,
    VariationFishId = {260301},
    VariationProb = 0.2
  },
  [2604] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2604,
    FishLength = T.RT_45,
    FishLevel = 5,
    FishMoveId = 407,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_3",
    PriceOnWeight = T.RT_46,
    ResourceId = 5026040,
    VariationFishId = {260401},
    VariationProb = 0.1
  },
  [2605] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2605,
    FishLength = T.RT_53,
    FishLevel = 6,
    FishMoveId = 606,
    FishType = 3,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_5",
    PriceOnWeight = T.RT_54,
    ResourceId = 5026050,
    VariationFishId = {260501},
    VariationProb = 0.1
  },
  [2701] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2701,
    FishLength = T.RT_55,
    FishLevel = 3,
    FishMoveId = 211,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_1",
    PriceOnWeight = {
      40,
      5,
      2
    },
    ResourceId = 5027010,
    VariationFishId = {270101},
    VariationProb = 0.2
  },
  [2702] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2702,
    FishLength = T.RT_1,
    FishLevel = 4,
    FishMoveId = 308,
    FishSmall2BigMinLength = 32,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_2",
    PriceOnWeight = T.RT_43,
    ResourceId = 5027020,
    Small2BigFishId = 2705,
    VariationFishId = {270201},
    VariationProb = 0.2
  },
  [2703] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2703,
    FishLength = T.RT_56,
    FishLevel = 5,
    FishMoveId = 408,
    FishSmall2BigMinLength = 9.2,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_4",
    PriceOnWeight = {
      120,
      5,
      0
    },
    ResourceId = 5027030,
    Small2BigFishId = 2704,
    VariationFishId = {270301},
    VariationProb = 0.2
  },
  [2704] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2704,
    FishLength = T.RT_57,
    FishLevel = 5,
    FishMoveId = 505,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_3",
    PriceOnWeight = T.RT_15,
    ResourceId = 5027040,
    VariationFishId = {270401},
    VariationProb = 0.1
  },
  [2705] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2705,
    FishLength = T.RT_58,
    FishLevel = 6,
    FishMoveId = 607,
    FishType = 3,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_5",
    PriceOnWeight = T.RT_59,
    ResourceId = 5027050,
    VariationFishId = {270501},
    VariationProb = 0.1
  },
  [2801] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2801,
    FishLength = T.RT_7,
    FishLevel = 3,
    FishMoveId = 106,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_1",
    PriceOnWeight = T.RT_30,
    ResourceId = 5028010,
    VariationFishId = {280101},
    VariationProb = 0.2
  },
  [2802] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2802,
    FishLength = T.RT_60,
    FishLevel = 4,
    FishMoveId = 309,
    FishSmall2BigMinLength = 14.4,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_2",
    PriceOnWeight = {
      70,
      5,
      2
    },
    ResourceId = 5028020,
    Small2BigFishId = 2805,
    VariationFishId = {280201},
    VariationProb = 0.2
  },
  [2803] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2803,
    FishLength = T.RT_52,
    FishLevel = 5,
    FishMoveId = 409,
    FishSmall2BigMinLength = 8,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_4",
    PriceOnWeight = T.RT_15,
    ResourceId = 5028030,
    Small2BigFishId = 2804,
    VariationFishId = {280301},
    VariationProb = 0.2
  },
  [2804] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2804,
    FishLength = T.RT_61,
    FishLevel = 5,
    FishMoveId = 506,
    FishType = 1,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_3",
    PriceOnWeight = T.RT_15,
    ResourceId = 5028040,
    VariationFishId = {280401},
    VariationProb = 0.1
  },
  [2805] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 2805,
    FishLength = T.RT_38,
    FishLevel = 6,
    FishMoveId = 608,
    FishType = 3,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_5",
    PriceOnWeight = T.RT_62,
    ResourceId = 5028050,
    VariationFishId = {280501},
    VariationProb = 0.1
  },
  [110101] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 110101,
    FishLength = T.RT_1,
    FishLevel = 2,
    FishMoveId = 202,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_Normal_1_1",
    PriceOnWeight = {
      30,
      5,
      4
    },
    ResourceId = 5011011
  },
  [110201] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 110201,
    FishLength = T.RT_2,
    FishLevel = 1,
    FishMoveId = 203,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_Normal_2_1",
    PriceOnWeight = {
      15,
      5,
      4
    },
    ResourceId = 5011021
  },
  [110301] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 110301,
    FishLength = T.RT_3,
    FishLevel = 1,
    FishMoveId = 103,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_Normal_3_1",
    PriceOnWeight = {
      15,
      5,
      14
    },
    ResourceId = 5011031
  },
  [120101] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 120101,
    FishLength = T.RT_4,
    FishLevel = 1,
    FishMoveId = 101,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_Normal_1_1",
    PriceOnWeight = {
      15,
      5,
      20
    },
    ResourceId = 5012011
  },
  [120201] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 120201,
    FishLength = T.RT_5,
    FishLevel = 1,
    FishMoveId = 102,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_Normal_2_1",
    PriceOnWeight = {
      15,
      5,
      36
    },
    ResourceId = 5012021
  },
  [120301] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 120301,
    FishLength = T.RT_6,
    FishLevel = 1,
    FishMoveId = 201,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_Normal_3_1",
    PriceOnWeight = {
      15,
      5,
      2
    },
    ResourceId = 5012031
  },
  [130101] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 130101,
    FishLength = T.RT_6,
    FishLevel = 2,
    FishMoveId = 204,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Normal_1_1",
    PriceOnWeight = {
      30,
      5,
      2
    },
    ResourceId = 5013011
  },
  [130201] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 130201,
    FishLength = T.RT_7,
    FishLevel = 1,
    FishMoveId = 205,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_East_3_1",
    PriceOnWeight = T.RT_9,
    ResourceId = 5013021
  },
  [130301] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 130301,
    FishLength = T.RT_10,
    FishLevel = 1,
    FishMoveId = 104,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Normal_3_1",
    PriceOnWeight = T.RT_9,
    ResourceId = 5013031
  },
  [210101] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 210101,
    FishLength = T.RT_11,
    FishLevel = 2,
    FishMoveId = 304,
    FishSmall2BigMinLength = 6.5,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_Village_1_1",
    PriceOnWeight = {
      30,
      5,
      1
    },
    ResourceId = 5021011,
    Small2BigFishId = 210401
  },
  [210201] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 210201,
    FishLength = T.RT_12,
    FishLevel = 3,
    FishMoveId = 208,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_Village_2_1",
    PriceOnWeight = {
      60,
      5,
      40
    },
    ResourceId = 5021021
  },
  [210301] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 210301,
    FishLength = T.RT_13,
    FishLevel = 4,
    FishMoveId = 209,
    FishSmall2BigMinLength = 36.25,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_Village_4_1",
    PriceOnWeight = {
      105,
      5,
      5
    },
    ResourceId = 5021031,
    Small2BigFishId = 210501
  },
  [210401] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 210401,
    FishLength = T.RT_14,
    FishLevel = 5,
    FishMoveId = 404,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_Village_3_1",
    PriceOnWeight = T.RT_16,
    ResourceId = 5021041
  },
  [210501] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 210501,
    FishLength = T.RT_17,
    FishLevel = 6,
    FishMoveId = 603,
    FishType = 4,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_Village_5_1",
    PriceOnWeight = T.RT_18,
    ResourceId = 5021051
  },
  [220101] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 220101,
    FishLength = T.RT_19,
    FishLevel = 5,
    FishMoveId = 402,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_East_1_1",
    PriceOnWeight = T.RT_21,
    ResourceId = 5022011
  },
  [220201] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 220201,
    FishLength = T.RT_22,
    FishLevel = 4,
    FishMoveId = 302,
    FishSmall2BigMinLength = 12.2,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_East_2_1",
    PriceOnWeight = T.RT_24,
    ResourceId = 5022021,
    Small2BigFishId = 220101
  },
  [220301] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 220301,
    FishLength = T.RT_4,
    FishLevel = 5,
    FishMoveId = 303,
    FishSmall2BigMinLength = 105,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_East_4_1",
    PriceOnWeight = {
      240,
      5,
      20
    },
    ResourceId = 5022031,
    Small2BigFishId = 220501
  },
  [220401] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 220401,
    FishLength = T.RT_25,
    FishLevel = 4,
    FishMoveId = 403,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_East_3_1",
    PriceOnWeight = T.RT_24,
    ResourceId = 5022041
  },
  [220501] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 220501,
    FishLength = T.RT_12,
    FishLevel = 6,
    FishMoveId = 602,
    FishType = 4,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_Sea_East_5_1",
    PriceOnWeight = T.RT_26,
    ResourceId = 5022051
  },
  [230101] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 230101,
    FishLength = T.RT_27,
    FishLevel = 2,
    FishMoveId = 206,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_IceLake_3_1",
    PriceOnWeight = {
      30,
      5,
      6
    },
    ResourceId = 5023011
  },
  [230201] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 230201,
    FishLength = T.RT_3,
    FishLevel = 2,
    FishMoveId = 207,
    FishSmall2BigMinLength = 95.5,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_IceLake_2_1",
    PriceOnWeight = {
      30,
      5,
      14
    },
    ResourceId = 5023021,
    Small2BigFishId = 230401
  },
  [230301] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 230301,
    FishLength = T.RT_28,
    FishLevel = 3,
    FishMoveId = 301,
    FishSmall2BigMinLength = 118,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_IceLake_4_1",
    PriceOnWeight = {
      60,
      5,
      16
    },
    ResourceId = 5023031,
    Small2BigFishId = 230501
  },
  [230401] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 230401,
    FishLength = T.RT_29,
    FishLevel = 3,
    FishMoveId = 401,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_IceLake_1_1",
    PriceOnWeight = T.RT_31,
    ResourceId = 5023041
  },
  [230501] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 230501,
    FishLength = T.RT_32,
    FishLevel = 6,
    FishMoveId = 601,
    FishType = 4,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_IceLake_5_1",
    PriceOnWeight = T.RT_33,
    ResourceId = 5023051
  },
  [240101] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 240101,
    FishLength = T.RT_34,
    FishLevel = 4,
    FishMoveId = 305,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_East_1_1",
    PriceOnWeight = T.RT_24,
    ResourceId = 5024011
  },
  [240201] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 240201,
    FishLength = T.RT_35,
    FishLevel = 4,
    FishMoveId = 405,
    FishSmall2BigMinLength = 4.2,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_East_2_1",
    PriceOnWeight = T.RT_37,
    ResourceId = 5024021,
    Small2BigFishId = 240401
  },
  [240301] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 240301,
    FishLength = T.RT_38,
    FishLevel = 5,
    FishMoveId = 501,
    FishSmall2BigMinLength = 41,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_East_4_1",
    PriceOnWeight = T.RT_40,
    ResourceId = 5024031,
    Small2BigFishId = 240501
  },
  [240401] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 240401,
    FishLength = T.RT_38,
    FishLevel = 5,
    FishMoveId = 502,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_East_3_1",
    PriceOnWeight = T.RT_40,
    ResourceId = 5024041
  },
  [240501] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 240501,
    FishLength = T.RT_41,
    FishLevel = 6,
    FishMoveId = 604,
    FishType = 4,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_FreshWater_East_5_1",
    PriceOnWeight = T.RT_26,
    ResourceId = 5024051
  },
  [250101] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 250101,
    FishLength = T.RT_42,
    FishLevel = 3,
    FishMoveId = 406,
    FishSmall2BigMinLength = 12.2,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_1_1",
    PriceOnWeight = {
      60,
      5,
      1
    },
    ResourceId = 5025011,
    Small2BigFishId = 250401
  },
  [250201] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 250201,
    FishLength = T.RT_38,
    FishLevel = 4,
    FishMoveId = 306,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_2_1",
    PriceOnWeight = T.RT_44,
    ResourceId = 5025021
  },
  [250301] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 250301,
    FishLength = T.RT_45,
    FishLevel = 5,
    FishMoveId = 503,
    FishSmall2BigMinLength = 15.5,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_4_1",
    PriceOnWeight = T.RT_47,
    ResourceId = 5025031,
    Small2BigFishId = 250501
  },
  [250401] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 250401,
    FishLength = T.RT_19,
    FishLevel = 5,
    FishMoveId = 504,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_3_1",
    PriceOnWeight = T.RT_21,
    ResourceId = 5025041
  },
  [250501] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 250501,
    FishLength = T.RT_48,
    FishLevel = 6,
    FishMoveId = 605,
    FishType = 4,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_5_1",
    PriceOnWeight = T.RT_49,
    ResourceId = 5025051
  },
  [260101] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 260101,
    FishLength = T.RT_50,
    FishLevel = 3,
    FishMoveId = 105,
    FishSmall2BigMinLength = 68,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_1_1",
    PriceOnWeight = {
      60,
      5,
      6
    },
    ResourceId = 5026011,
    Small2BigFishId = 260501
  },
  [260201] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 260201,
    FishLength = T.RT_51,
    FishLevel = 4,
    FishMoveId = 210,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_2_1",
    PriceOnWeight = T.RT_37,
    ResourceId = 5026021
  },
  [260301] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 260301,
    FishLength = T.RT_52,
    FishLevel = 5,
    FishMoveId = 307,
    FishSmall2BigMinLength = 8,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_4_1",
    PriceOnWeight = T.RT_16,
    ResourceId = 5026031,
    Small2BigFishId = 260401
  },
  [260401] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 260401,
    FishLength = T.RT_45,
    FishLevel = 5,
    FishMoveId = 407,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_3_1",
    PriceOnWeight = T.RT_47,
    ResourceId = 5026041
  },
  [260501] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 260501,
    FishLength = T.RT_53,
    FishLevel = 6,
    FishMoveId = 606,
    FishType = 4,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_5_1",
    PriceOnWeight = T.RT_54,
    ResourceId = 5026051
  },
  [270101] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 270101,
    FishLength = T.RT_55,
    FishLevel = 3,
    FishMoveId = 211,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_1_1",
    PriceOnWeight = {
      60,
      5,
      2
    },
    ResourceId = 5027011
  },
  [270201] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 270201,
    FishLength = T.RT_1,
    FishLevel = 4,
    FishMoveId = 308,
    FishSmall2BigMinLength = 32,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_2_1",
    PriceOnWeight = T.RT_44,
    ResourceId = 5027021,
    Small2BigFishId = 270501
  },
  [270301] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 270301,
    FishLength = T.RT_56,
    FishLevel = 5,
    FishMoveId = 408,
    FishSmall2BigMinLength = 9.2,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_4_1",
    PriceOnWeight = {
      240,
      5,
      0
    },
    ResourceId = 5027031,
    Small2BigFishId = 270401
  },
  [270401] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 270401,
    FishLength = T.RT_57,
    FishLevel = 5,
    FishMoveId = 505,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_3_1",
    PriceOnWeight = T.RT_16,
    ResourceId = 5027041
  },
  [270501] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 270501,
    FishLength = T.RT_58,
    FishLevel = 6,
    FishMoveId = 607,
    FishType = 4,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_5_1",
    PriceOnWeight = T.RT_59,
    ResourceId = 5027051
  },
  [280101] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 280101,
    FishLength = T.RT_7,
    FishLevel = 3,
    FishMoveId = 106,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_1_1",
    PriceOnWeight = T.RT_31,
    ResourceId = 5028011
  },
  [280201] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 280201,
    FishLength = T.RT_60,
    FishLevel = 4,
    FishMoveId = 309,
    FishSmall2BigMinLength = 14.4,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_2_1",
    PriceOnWeight = {
      105,
      5,
      2
    },
    ResourceId = 5028021,
    Small2BigFishId = 280501
  },
  [280301] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 280301,
    FishLength = T.RT_52,
    FishLevel = 5,
    FishMoveId = 409,
    FishSmall2BigMinLength = 8,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_4_1",
    PriceOnWeight = T.RT_16,
    ResourceId = 5028031,
    Small2BigFishId = 280401
  },
  [280401] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 280401,
    FishLength = T.RT_61,
    FishLevel = 5,
    FishMoveId = 506,
    FishType = 2,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_3_1",
    PriceOnWeight = T.RT_16,
    ResourceId = 5028041
  },
  [280501] = {
    FishGetDuration = 10,
    FishHookDuration = 5,
    FishHookOffset = 1.5,
    FishId = 280501,
    FishLength = T.RT_38,
    FishLevel = 6,
    FishMoveId = 608,
    FishType = 4,
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/AngLingFish/T_Fish_DirtyWater_Sew_5_1",
    PriceOnWeight = T.RT_62,
    ResourceId = 5028051
  }
})
