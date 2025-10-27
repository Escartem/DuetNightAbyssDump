local T = {}
T.RT_1 = {1}
T.RT_2 = {2}
T.RT_3 = {3}
T.RT_4 = {1, 2}
T.RT_5 = {2, 3}
T.RT_6 = {
  1,
  2,
  3
}
T.RT_7 = {4}
T.RT_8 = {6}
T.RT_9 = {5}
T.RT_10 = {7}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RougeLikeBlessingRandom", {
  [-1] = {BlessingRandom = -1},
  [1] = {
    BlessingRandom = 1,
    BlessingRarity = T.RT_1,
    RandomType = 1
  },
  [2] = {
    BlessingRandom = 2,
    BlessingRarity = T.RT_2,
    RandomType = 1
  },
  [3] = {
    BlessingRandom = 3,
    BlessingRarity = T.RT_3,
    RandomType = 1
  },
  [4] = {
    BlessingRandom = 4,
    BlessingRarity = T.RT_4,
    RandomType = 1
  },
  [5] = {
    BlessingRandom = 5,
    BlessingRarity = T.RT_5,
    RandomType = 1
  },
  [6] = {
    BlessingRandom = 6,
    BlessingRarity = T.RT_6,
    RandomType = 1
  },
  [7] = {
    BlessingRandom = 7,
    BlessingRarity = T.RT_6,
    LimitGroup = T.RT_1,
    RandomType = 1
  },
  [8] = {
    BlessingRandom = 8,
    BlessingRarity = T.RT_6,
    LimitGroup = T.RT_2,
    RandomType = 1
  },
  [9] = {
    BlessingRandom = 9,
    BlessingRarity = T.RT_6,
    LimitGroup = T.RT_3,
    RandomType = 1
  },
  [10] = {
    BlessingRandom = 10,
    BlessingRarity = T.RT_1,
    RandomType = 2
  },
  [11] = {
    BlessingRandom = 11,
    BlessingRarity = T.RT_2,
    RandomType = 2
  },
  [12] = {
    BlessingRandom = 12,
    BlessingRarity = T.RT_3,
    RandomType = 2
  },
  [13] = {
    BlessingRandom = 13,
    BlessingRarity = T.RT_4,
    RandomType = 2
  },
  [14] = {
    BlessingRandom = 14,
    BlessingRarity = T.RT_5,
    RandomType = 2
  },
  [15] = {
    BlessingRandom = 15,
    BlessingRarity = T.RT_6,
    RandomType = 2
  },
  [16] = {
    BlessingRandom = 16,
    BlessingRarity = T.RT_6,
    LimitGroup = T.RT_1,
    RandomType = 2
  },
  [17] = {
    BlessingRandom = 17,
    BlessingRarity = T.RT_6,
    LimitGroup = T.RT_2,
    RandomType = 2
  },
  [18] = {
    BlessingRandom = 18,
    BlessingRarity = T.RT_6,
    LimitGroup = T.RT_3,
    RandomType = 2
  },
  [19] = {
    BlessingRandom = 19,
    BlessingRarity = T.RT_6,
    LimitGroup = T.RT_7,
    RandomType = 2
  },
  [20] = {
    BlessingRandom = 20,
    BlessingRarity = T.RT_6,
    LimitGroup = T.RT_8,
    RandomType = 2
  },
  [21] = {
    BlessingRandom = 21,
    BlessingRarity = T.RT_4,
    LimitGroup = T.RT_1,
    RandomType = 1
  },
  [22] = {
    BlessingRandom = 22,
    BlessingRarity = T.RT_4,
    LimitGroup = T.RT_2,
    RandomType = 1
  },
  [23] = {
    BlessingRandom = 23,
    BlessingRarity = T.RT_4,
    LimitGroup = T.RT_3,
    RandomType = 1
  },
  [24] = {
    BlessingRandom = 24,
    BlessingRarity = T.RT_4,
    LimitGroup = T.RT_7,
    RandomType = 1
  },
  [25] = {
    BlessingRandom = 25,
    BlessingRarity = T.RT_4,
    LimitGroup = T.RT_9,
    RandomType = 1
  },
  [26] = {
    BlessingRandom = 26,
    BlessingRarity = T.RT_4,
    LimitGroup = T.RT_8,
    RandomType = 1
  },
  [27] = {
    BlessingRandom = 27,
    BlessingRarity = T.RT_4,
    LimitGroup = T.RT_10,
    RandomType = 1
  },
  [28] = {
    BlessingRandom = 28,
    BlessingRarity = T.RT_6,
    LimitGroup = T.RT_9,
    RandomType = 2
  },
  [29] = {
    BlessingRandom = 29,
    BlessingRarity = T.RT_6,
    LimitGroup = T.RT_10,
    RandomType = 2
  }
})
