local T = {}
T.RT_1 = {
  [1] = 40,
  [2] = 40,
  [3] = 40,
  [4] = 15,
  [5] = 15,
  [6] = 10,
  [7] = 0,
  [8] = 0
}
T.RT_2 = {
  [1] = 1201,
  [2] = 1202,
  [3] = 1203,
  [4] = 2301,
  [5] = 2302,
  [6] = 2303,
  [7] = 2304,
  [8] = 2305
}
T.RT_3 = {
  2501,
  2502,
  2503,
  2504,
  2505
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("FishingSpot", {
  [10010101] = {
    ConditionId = 20021501,
    FishCountLimit = 100,
    FishId = {
      [1] = 1101,
      [2] = 1102,
      [3] = 1103,
      [4] = 2101,
      [5] = 2102,
      [6] = 2103,
      [7] = 2104,
      [8] = 2105
    },
    FishWeight = T.RT_1,
    FishingSpotId = 10010101,
    FishingSpotName = "FishingSpot_Name_10010101",
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Angling01.T_Tab_Angling01",
    LimitDeviation = 0,
    RegionPointId = 2814,
    ReplenishDay = 24,
    ShowFishId = {
      2101,
      2102,
      2103,
      2104,
      2105
    },
    ShowInFishMap = true,
    WaterType = 1
  },
  [10030401] = {
    FishCountLimit = 3,
    FishId = T.RT_2,
    FishWeight = T.RT_1,
    FishingSpotId = 10030401,
    FishingSpotName = "FishingSpot_Name_10110301",
    LimitDeviation = 0,
    RegionPointId = 2815,
    ReplenishDay = 1,
    ShowFishId = T.RT_3,
    ShowInFishMap = false,
    WaterType = 2
  },
  [10030402] = {
    FishCountLimit = 3,
    FishId = T.RT_2,
    FishWeight = T.RT_1,
    FishingSpotId = 10030402,
    FishingSpotName = "FishingSpot_Name_10110301",
    LimitDeviation = 0,
    RegionPointId = 2815,
    ReplenishDay = 1,
    ShowFishId = T.RT_3,
    ShowInFishMap = false,
    WaterType = 2
  },
  [10110301] = {
    ConditionId = 20021501,
    FishCountLimit = 100,
    FishId = T.RT_2,
    FishWeight = T.RT_1,
    FishingSpotId = 10110301,
    FishingSpotName = "FishingSpot_Name_10110301",
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Angling02.T_Tab_Angling02",
    LimitDeviation = 0,
    RegionPointId = 2815,
    ReplenishDay = 24,
    ShowFishId = {
      2301,
      2302,
      2303,
      2304,
      2305
    },
    ShowInFishMap = true,
    WaterType = 2
  },
  [10110391] = {
    FishCountLimit = 1,
    FishId = T.RT_2,
    FishWeight = T.RT_1,
    FishingSpotId = 10110391,
    FishingSpotName = "FishingSpot_Name_10110301",
    LimitDeviation = 0,
    RegionPointId = 2815,
    ReplenishDay = 1,
    ShowFishId = T.RT_3,
    ShowInFishMap = false,
    WaterType = 2
  },
  [10110392] = {
    FishCountLimit = 1,
    FishId = T.RT_2,
    FishWeight = T.RT_1,
    FishingSpotId = 10110392,
    FishingSpotName = "FishingSpot_Name_10110301",
    LimitDeviation = 0,
    RegionPointId = 2815,
    ReplenishDay = 1,
    ShowFishId = T.RT_3,
    ShowInFishMap = false,
    WaterType = 2
  },
  [10110393] = {
    FishCountLimit = 1,
    FishId = T.RT_2,
    FishWeight = T.RT_1,
    FishingSpotId = 10110393,
    FishingSpotName = "FishingSpot_Name_10110301",
    LimitDeviation = 0,
    RegionPointId = 2815,
    ReplenishDay = 1,
    ShowFishId = T.RT_3,
    ShowInFishMap = false,
    WaterType = 2
  },
  [10170101] = {
    ConditionId = 20021501,
    FishCountLimit = 100,
    FishId = {
      [1] = 1301,
      [2] = 1302,
      [3] = 1303,
      [4] = 2501,
      [5] = 2502,
      [6] = 2503,
      [7] = 2504,
      [8] = 2505
    },
    FishWeight = T.RT_1,
    FishingSpotId = 10170101,
    FishingSpotName = "FishingSpot_Name_10170101",
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Angling03.T_Tab_Angling03",
    LimitDeviation = 0,
    RegionPointId = 2816,
    ReplenishDay = 24,
    ShowFishId = T.RT_3,
    ShowInFishMap = true,
    WaterType = 3
  },
  [20021501] = {
    FishCountLimit = 3,
    FishId = {
      [1] = 2301
    },
    FishWeight = {
      [1] = 1
    },
    FishingSpotId = 20021501,
    FishingSpotName = "FishingSpot_Name_10110301",
    LimitDeviation = 0,
    RegionPointId = 2815,
    ReplenishDay = 1,
    ShowFishId = {2301},
    ShowInFishMap = false,
    WaterType = 2
  }
})
