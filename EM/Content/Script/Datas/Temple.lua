local T = {}
T.RT_1 = {7104}
T.RT_2 = {
  7104,
  7102,
  7103
}
T.RT_3 = {
  0,
  40,
  70
}
T.RT_4 = {
  0,
  120,
  210
}
T.RT_5 = {
  0,
  120,
  240
}
T.RT_6 = {
  0,
  20,
  35
}
T.RT_7 = {
  0,
  60,
  120
}
T.RT_8 = {
  3000,
  5000,
  7000
}
T.RT_9 = {
  2000,
  3000,
  4000
}
T.RT_10 = {
  30,
  50,
  80
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Temple", {
  [21] = {
    DungeonId = 21,
    RewardId = T.RT_1,
    SucRule = "Time",
    UIHideCombo = 1
  },
  [22] = {
    DungeonId = 22,
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1
  },
  [23] = {
    DungeonId = 23,
    RewardId = T.RT_2,
    SucRule = "Time",
    UIHideCombo = 1
  },
  [27] = {
    DungeonId = 27,
    RewardId = T.RT_2,
    SucRule = "Time",
    UIHideCombo = 1
  },
  [39] = {
    DungeonId = 39,
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1
  },
  [40] = {
    DungeonId = 40,
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1
  },
  [41] = {
    DungeonId = 41,
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1
  },
  [42] = {
    DungeonId = 42,
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1
  },
  [44] = {
    DungeonId = 44,
    RatingRange = T.RT_3,
    RewardId = T.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1
  },
  [45] = {
    DungeonId = 45,
    RatingRange = T.RT_4,
    RewardId = T.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1
  },
  [46] = {
    DungeonId = 46,
    RatingRange = T.RT_4,
    RewardId = T.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1
  },
  [47] = {
    DungeonId = 47,
    RatingRange = T.RT_3,
    RewardId = T.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1
  },
  [48] = {
    DungeonId = 48,
    RatingRange = T.RT_5,
    RewardId = T.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1
  },
  [49] = {
    DungeonId = 49,
    RatingRange = T.RT_5,
    RewardId = T.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1
  },
  [80000] = {
    DungeonId = 80000,
    RatingRange = T.RT_6,
    RewardId = T.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1
  },
  [80101] = {
    DungeonId = 80101,
    RatingRange = T.RT_6,
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1
  },
  [80102] = {
    DungeonId = 80102,
    RatingRange = {
      0,
      40,
      55
    },
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1
  },
  [80201] = {
    DungeonId = 80201,
    RatingRange = {
      0,
      15,
      25
    },
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1
  },
  [80202] = {
    DungeonId = 80202,
    RatingRange = {
      0,
      22,
      44
    },
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1
  },
  [80301] = {
    DungeonId = 80301,
    RatingRange = {
      0,
      90,
      180
    },
    RewardId = T.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1
  },
  [80302] = {
    DungeonId = 80302,
    RatingRange = {
      0,
      1620,
      1710
    },
    RewardId = T.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1,
    UIShowType = 1
  },
  [80401] = {
    DungeonId = 80401,
    RatingRange = {
      1000,
      2500,
      3500
    },
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
    UIHideFailCond = 1
  },
  [80402] = {
    DungeonId = 80402,
    RatingRange = {
      2000,
      3500,
      4500
    },
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
    UIHideFailCond = 1
  },
  [80403] = {
    DungeonId = 80403,
    RatingRange = {
      5000,
      7500,
      8500
    },
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
    UIHideFailCond = 1
  },
  [80404] = {
    DungeonId = 80404,
    RatingRange = {
      4500,
      6000,
      7500
    },
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
    UIHideFailCond = 1
  },
  [80501] = {
    DungeonId = 80501,
    RatingRange = T.RT_7,
    RewardId = T.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1
  },
  [80502] = {
    DungeonId = 80502,
    RatingRange = {
      0,
      1620,
      1740
    },
    RewardId = T.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1,
    UIShowType = 1
  },
  [80601] = {
    DungeonId = 80601,
    RatingRange = T.RT_7,
    RewardId = T.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1
  },
  [80602] = {
    DungeonId = 80602,
    RatingRange = T.RT_7,
    RewardId = T.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1
  },
  [80701] = {
    DungeonId = 80701,
    RewardId = T.RT_1,
    SucRule = "Time",
    UIHideCombo = 1
  },
  [80702] = {
    DungeonId = 80702,
    RewardId = T.RT_1,
    SucRule = "Time",
    UIHideCombo = 1
  },
  [80703] = {
    DungeonId = 80703,
    RewardId = T.RT_1,
    SucRule = "Time",
    UIHideCombo = 1
  },
  [80704] = {
    DungeonId = 80704,
    RewardId = T.RT_1,
    SucRule = "Time",
    UIHideCombo = 1,
    UIShowType = 1
  },
  [80705] = {
    DungeonId = 80705,
    RewardId = T.RT_1,
    SucRule = "Time",
    UIHideCombo = 1,
    UIShowType = 1
  },
  [80801] = {
    DungeonId = 80801,
    RatingRange = {
      1000,
      2000,
      3000
    },
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
    UIHideFailCond = 1
  },
  [80802] = {
    DungeonId = 80802,
    RatingRange = {
      1000,
      3000,
      5000
    },
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
    UIHideFailCond = 1
  },
  [80803] = {
    DungeonId = 80803,
    RatingRange = T.RT_8,
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
    UIHideFailCond = 1
  },
  [80804] = {
    DungeonId = 80804,
    RatingRange = T.RT_8,
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
    UIHideFailCond = 1
  },
  [80901] = {
    DungeonId = 80901,
    RatingRange = {
      10,
      20,
      40
    },
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1
  },
  [80902] = {
    DungeonId = 80902,
    RatingRange = {
      5,
      15,
      25
    },
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
    UIHideDes = 1
  },
  [80903] = {
    DungeonId = 80903,
    RatingRange = {
      10,
      25,
      40
    },
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
    UIHideDes = 1
  },
  [81001] = {
    DungeonId = 81001,
    RatingRange = {
      100,
      150,
      200
    },
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1
  },
  [81002] = {
    DungeonId = 81002,
    RatingRange = {
      80,
      160,
      240
    },
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1
  },
  [81003] = {
    DungeonId = 81003,
    RatingRange = {
      0,
      1650,
      1740
    },
    RewardId = T.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1,
    UIShowType = 1
  },
  [81101] = {
    DungeonId = 81101,
    RatingRange = T.RT_5,
    RewardId = T.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1
  },
  [81102] = {
    DungeonId = 81102,
    RatingRange = T.RT_5,
    RewardId = T.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1
  },
  [81103] = {
    DungeonId = 81103,
    RatingRange = T.RT_5,
    RewardId = T.RT_2,
    SucRule = "CountDown",
    UIHideCombo = 1
  },
  [81201] = {
    DungeonId = 81201,
    RatingRange = T.RT_9,
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
    UIHideFailCond = 1
  },
  [81202] = {
    DungeonId = 81202,
    RatingRange = T.RT_9,
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
    UIHideFailCond = 1
  },
  [81203] = {
    DungeonId = 81203,
    RatingRange = {
      2000,
      4000,
      6000
    },
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
    UIHideFailCond = 1
  },
  [81204] = {
    DungeonId = 81204,
    RatingRange = {4000},
    RewardId = T.RT_1,
    SucRule = "Score",
    UIHideCombo = 1,
    UIHideFailCond = 1
  },
  [81301] = {
    DungeonId = 81301,
    RatingRange = T.RT_10,
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1
  },
  [81401] = {
    DungeonId = 81401,
    RatingRange = T.RT_10,
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1
  },
  [81501] = {
    DungeonId = 81501,
    RatingRange = {
      500,
      1500,
      2500
    },
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
    UIHideFailCond = 1
  },
  [81502] = {
    DungeonId = 81502,
    RatingRange = {
      1000,
      2500,
      4000
    },
    RewardId = T.RT_2,
    SucRule = "Score",
    UIHideCombo = 1,
    UIHideFailCond = 1
  }
})
