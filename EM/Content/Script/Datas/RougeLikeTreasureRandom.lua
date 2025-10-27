local T = {}
T.RT_1 = {
  2,
  3,
  10304,
  10305,
  10310
}
T.RT_2 = {1}
T.RT_3 = {
  2,
  10304,
  10305,
  10310
}
T.RT_4 = {2}
T.RT_5 = {3}
T.RT_6 = {1, 2}
T.RT_7 = {2, 3}
T.RT_8 = {
  1,
  2,
  3
}
T.RT_9 = {
  2,
  3,
  4,
  10211,
  102,
  10108,
  10304,
  10305,
  10310
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RougeLikeTreasureRandom", {
  [-1] = {TreasureRandom = -1},
  [1] = {
    ExcludeGroup = T.RT_1,
    RandomType = 1,
    TreasureRandom = 1,
    TreasureRarity = T.RT_2
  },
  [2] = {
    ExcludeGroup = T.RT_1,
    RandomType = 1,
    TreasureRandom = 2,
    TreasureRarity = T.RT_4
  },
  [3] = {
    ExcludeGroup = T.RT_1,
    RandomType = 1,
    TreasureRandom = 3,
    TreasureRarity = T.RT_5
  },
  [4] = {
    ExcludeGroup = T.RT_1,
    RandomType = 1,
    TreasureRandom = 4,
    TreasureRarity = T.RT_6
  },
  [5] = {
    ExcludeGroup = T.RT_1,
    RandomType = 1,
    TreasureRandom = 5,
    TreasureRarity = T.RT_7
  },
  [6] = {
    ExcludeGroup = T.RT_1,
    RandomType = 1,
    TreasureRandom = 6,
    TreasureRarity = T.RT_8
  },
  [7] = {
    ExcludeGroup = T.RT_1,
    RandomType = 1,
    TreasureRandom = 7,
    TreasureRarity = T.RT_8
  },
  [8] = {
    ExcludeGroup = T.RT_1,
    RandomType = 1,
    TreasureRandom = 8,
    TreasureRarity = T.RT_8
  },
  [9] = {
    ExcludeGroup = T.RT_1,
    RandomType = 1,
    TreasureRandom = 9,
    TreasureRarity = T.RT_8
  },
  [10] = {
    ExcludeGroup = T.RT_3,
    RandomType = 2,
    TreasureRandom = 10,
    TreasureRarity = T.RT_2
  },
  [11] = {
    ExcludeGroup = T.RT_3,
    RandomType = 2,
    TreasureRandom = 11,
    TreasureRarity = T.RT_4
  },
  [12] = {
    ExcludeGroup = T.RT_3,
    RandomType = 2,
    TreasureRandom = 12,
    TreasureRarity = T.RT_5
  },
  [13] = {
    ExcludeGroup = T.RT_3,
    RandomType = 2,
    TreasureRandom = 13,
    TreasureRarity = T.RT_6
  },
  [14] = {
    ExcludeGroup = T.RT_3,
    RandomType = 2,
    TreasureRandom = 14,
    TreasureRarity = T.RT_7
  },
  [15] = {
    ExcludeGroup = T.RT_3,
    RandomType = 2,
    TreasureRandom = 15,
    TreasureRarity = T.RT_8
  },
  [16] = {
    ExcludeGroup = T.RT_3,
    RandomType = 2,
    TreasureRandom = 16,
    TreasureRarity = T.RT_8
  },
  [17] = {
    ExcludeGroup = T.RT_3,
    RandomType = 2,
    TreasureRandom = 17,
    TreasureRarity = T.RT_8
  },
  [18] = {
    ExcludeGroup = T.RT_3,
    RandomType = 2,
    TreasureRandom = 18,
    TreasureRarity = T.RT_8
  },
  [19] = {
    Designated = 10308,
    ExcludeGroup = T.RT_1,
    RandomType = 3,
    TreasureRandom = 19,
    TreasureRarity = T.RT_8
  },
  [20] = {
    LimitGroup = {
      2,
      4,
      10108,
      10308,
      10309,
      101,
      103,
      104
    },
    RandomType = 2,
    TreasureRandom = 20,
    TreasureRarity = T.RT_8
  },
  [21] = {
    ExcludeGroup = T.RT_9,
    RandomType = 1,
    TreasureRandom = 21,
    TreasureRarity = T.RT_6
  },
  [22] = {
    ExcludeGroup = T.RT_9,
    RandomType = 1,
    TreasureRandom = 22,
    TreasureRarity = T.RT_8
  },
  [23] = {
    ExcludeGroup = T.RT_9,
    RandomType = 1,
    TreasureRandom = 23,
    TreasureRarity = T.RT_7
  },
  [24] = {
    ExcludeGroup = T.RT_9,
    RandomType = 1,
    TreasureRandom = 24,
    TreasureRarity = T.RT_5
  },
  [25] = {
    LimitGroup = {10108},
    RandomType = 1,
    TreasureRandom = 25,
    TreasureRarity = T.RT_8
  },
  [26] = {
    LimitGroup = {103},
    RandomType = 1,
    TreasureRandom = 26,
    TreasureRarity = T.RT_8
  },
  [27] = {
    LimitGroup = {10310},
    RandomType = 2,
    TreasureRandom = 27,
    TreasureRarity = T.RT_5
  }
})
