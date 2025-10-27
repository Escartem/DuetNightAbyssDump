local T = {}
T.RT_1 = {
  [1] = 0.2
}
T.RT_2 = {
  [1] = 2
}
T.RT_3 = {
  [1] = 4,
  [2] = 4
}
T.RT_4 = {
  [1] = 5,
  [2] = 5
}
T.RT_5 = {1}
T.RT_6 = {1, 6}
T.RT_7 = {
  [1] = 300
}
T.RT_8 = {
  [1] = 6
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RougeLikeServerBuild", {
  [1] = {
    Id = 1,
    Param = {
      [1] = 1
    },
    RoomCount = -1,
    ServerBuild = "MRTExtraTimes"
  },
  [2] = {
    Id = 2,
    Param = {
      [1] = 200
    },
    RoomCount = 0,
    ServerBuild = "GetToken"
  },
  [3] = {
    Id = 3,
    Param = {
      [1] = 0.8
    },
    RoomCount = -1,
    ServerBuild = "ShopDiscount"
  },
  [4] = {
    Id = 4,
    Param = T.RT_3,
    RoomCount = 0,
    ServerBuild = "GetBlessing"
  },
  [5] = {
    Id = 5,
    Param = T.RT_8,
    RoomCount = 0,
    ServerBuild = "ReplaceAllBlessing"
  },
  [6] = {
    Id = 6,
    Param = T.RT_8,
    RoomCount = 0,
    ServerBuild = "ReplaceAllTreasure"
  },
  [7] = {
    Id = 7,
    RoomCount = 3,
    RoomType = T.RT_6,
    ServerBuild = "DisableGetToken"
  },
  [8] = {
    Id = 8,
    RoomCount = 2,
    RoomType = T.RT_5,
    ServerBuild = "DisableGetToken"
  },
  [9] = {
    Id = 9,
    Param = T.RT_1,
    RoomCount = -1,
    ServerBuild = "EndPointsExtraRate"
  },
  [10] = {
    Id = 10,
    Param = T.RT_1,
    RoomCount = -1,
    ServerBuild = "TokenExtraRate"
  },
  [11] = {
    Id = 11,
    Param = {
      [1] = 13
    },
    RoomCount = 0,
    ServerBuild = "GetTreasure"
  },
  [12] = {
    Id = 12,
    Param = {
      [1] = 1.5
    },
    RoomCount = -1,
    ServerBuild = "ShopDiscount"
  },
  [13] = {
    Id = 13,
    Param = T.RT_2,
    RoomCount = -1,
    ServerBuild = "ChoiceNumber"
  },
  [14] = {
    Id = 14,
    RoomCount = -1,
    ServerBuild = "RandomChoice"
  },
  [15] = {
    Id = 15,
    Param = {
      [1] = 0,
      [2] = 1
    },
    RoomCount = -1,
    ServerBuild = "RefreshCost"
  },
  [16] = {
    Id = 16,
    Param = T.RT_3,
    RoomCount = 0,
    ServerBuild = "GetTreasure"
  },
  [17] = {
    Id = 17,
    Param = T.RT_4,
    RoomCount = 0,
    ServerBuild = "GetBlessing"
  },
  [18] = {
    Id = 18,
    Param = T.RT_4,
    RoomCount = 0,
    ServerBuild = "GetTreasure"
  },
  [19] = {
    Id = 19,
    Param = {
      [1] = 0.3
    },
    RoomCount = -1,
    ServerBuild = "EndPointsExtraRate"
  },
  [20] = {
    Id = 20,
    Param = T.RT_2,
    RoomCount = 4,
    ServerBuild = "RefreshRate"
  },
  [21] = {
    Id = 21,
    Param = {
      [1] = 1000,
      [2] = 500
    },
    RoomCount = -1,
    ServerBuild = "RecoverTimes"
  },
  [22] = {
    Id = 22,
    Param = {
      [1] = 1,
      [2] = T.RT_5
    },
    RoomCount = -1,
    RoomType = T.RT_6,
    ServerBuild = "MRTAutoUpgrade"
  },
  [23] = {
    Id = 23,
    Param = {
      [1] = "Mon.Strong",
      [2] = 3,
      [3] = 24
    },
    RoomCount = -1,
    ServerBuild = "KillMonster"
  },
  [24] = {
    Id = 24,
    Param = {
      [1] = 150
    },
    RoomCount = 0,
    ServerBuild = "GetToken"
  },
  [25] = {
    Id = 25,
    Param = {
      [1] = 50
    },
    RoomCount = -1,
    ServerBuild = "EffectByToken"
  },
  [26] = {
    Id = 26,
    Param = {
      [1] = "Blessing",
      [2] = 50
    },
    RoomCount = 0,
    ServerBuild = "GetTokenByAwardCount"
  },
  [27] = {
    Id = 27,
    Param = {
      [1] = "Blessing",
      [2] = {2, 3}
    },
    RoomCount = 2,
    RoomType = T.RT_6,
    ServerBuild = "MRTLimitRarity"
  },
  [28] = {
    Id = 28,
    Param = {
      [1] = 1.2
    },
    RoomCount = 4,
    ServerBuild = "ShopDiscount"
  },
  [29] = {
    Id = 29,
    Param = T.RT_7,
    RoomCount = 0,
    ServerBuild = "GetToken"
  },
  [30] = {
    Id = 30,
    Param = T.RT_2,
    RoomCount = 4,
    ServerBuild = "RefreshRate"
  },
  [31] = {
    Id = 31,
    Param = T.RT_7,
    RoomCount = 0,
    ServerBuild = "GetToken"
  },
  [32] = {
    Id = 32,
    RoomCount = 6,
    ServerBuild = "DisableGetToken"
  },
  [33] = {
    Id = 33,
    Param = {
      [1] = 1000
    },
    RoomCount = 0,
    ServerBuild = "GetToken"
  },
  [34] = {
    Id = 34,
    Param = {
      [1] = "Blessing",
      [2] = 1,
      [3] = 1
    },
    RoomCount = 0,
    ServerBuild = "GetGroupAwardByCount"
  },
  [35] = {
    Id = 35,
    Param = {
      [1] = 21
    },
    RoomCount = 0,
    ServerBuild = "GetBlessing"
  },
  [36] = {
    Id = 36,
    Param = {
      [1] = "Blessing",
      [2] = T.RT_5,
      [3] = 1.8
    },
    RoomCount = -1,
    ServerBuild = "GroupWeightRate"
  },
  [37] = {
    Id = 37,
    Param = {
      [1] = 22
    },
    RoomCount = 0,
    ServerBuild = "GetBlessing"
  },
  [38] = {
    Id = 38,
    Param = {
      [1] = "Blessing",
      [2] = {2},
      [3] = 1.8
    },
    RoomCount = -1,
    ServerBuild = "GroupWeightRate"
  },
  [39] = {
    Id = 39,
    Param = {
      [1] = 23
    },
    RoomCount = 0,
    ServerBuild = "GetBlessing"
  },
  [40] = {
    Id = 40,
    Param = {
      [1] = "Blessing",
      [2] = {3},
      [3] = 1.8
    },
    RoomCount = -1,
    ServerBuild = "GroupWeightRate"
  },
  [41] = {
    Id = 41,
    Param = {
      [1] = 24
    },
    RoomCount = 0,
    ServerBuild = "GetBlessing"
  },
  [42] = {
    Id = 42,
    Param = {
      [1] = "Blessing",
      [2] = {4},
      [3] = 1.8
    },
    RoomCount = -1,
    ServerBuild = "GroupWeightRate"
  },
  [43] = {
    Id = 43,
    Param = {
      [1] = 25
    },
    RoomCount = 0,
    ServerBuild = "GetBlessing"
  },
  [44] = {
    Id = 44,
    Param = {
      [1] = "Blessing",
      [2] = {5},
      [3] = 1.8
    },
    RoomCount = -1,
    ServerBuild = "GroupWeightRate"
  },
  [45] = {
    Id = 45,
    Param = {
      [1] = 26
    },
    RoomCount = 0,
    ServerBuild = "GetBlessing"
  },
  [46] = {
    Id = 46,
    Param = {
      [1] = "Blessing",
      [2] = {6},
      [3] = 1.8
    },
    RoomCount = -1,
    ServerBuild = "GroupWeightRate"
  },
  [47] = {
    Id = 47,
    Param = {
      [1] = 27
    },
    RoomCount = 0,
    ServerBuild = "GetBlessing"
  },
  [48] = {
    Id = 48,
    Param = {
      [1] = "Blessing",
      [2] = {7},
      [3] = 1.8
    },
    RoomCount = -1,
    ServerBuild = "GroupWeightRate"
  },
  [49] = {
    Id = 49,
    RoomCount = 1,
    ServerBuild = "Skip"
  },
  [50] = {
    Id = 50,
    RoomCount = 6,
    ServerBuild = "Skip"
  },
  [999] = {
    Id = 999,
    RoomCount = 1,
    ServerBuild = "DisableGetToken"
  }
})
