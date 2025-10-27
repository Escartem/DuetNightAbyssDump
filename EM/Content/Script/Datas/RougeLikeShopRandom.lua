local T = {}
T.RT_1 = {6, 7}
T.RT_2 = {1, 2}
T.RT_3 = {8, 10}
T.RT_4 = {2, 3}
T.RT_5 = {3, 4}
T.RT_6 = {7, 9}
T.RT_7 = {5, 6}
T.RT_8 = {
  1,
  2,
  3
}
T.RT_9 = {4, 5}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RougeLikeShopRandom", {
  [1] = {
    Blessing = T.RT_1,
    Rarity = T.RT_2,
    ShopRandom = 1,
    Treasure = T.RT_2
  },
  [2] = {
    Blessing = T.RT_7,
    Rarity = T.RT_2,
    ShopRandom = 2,
    Treasure = T.RT_4
  },
  [3] = {
    Blessing = {7, 8},
    Rarity = T.RT_2,
    ShopRandom = 3,
    Treasure = T.RT_4
  },
  [4] = {
    Blessing = T.RT_1,
    Rarity = T.RT_2,
    ShopRandom = 4,
    Treasure = T.RT_5
  },
  [5] = {
    Blessing = T.RT_3,
    Rarity = T.RT_8,
    ShopRandom = 5,
    Treasure = T.RT_5
  },
  [6] = {
    Blessing = T.RT_6,
    Rarity = T.RT_8,
    ShopRandom = 6,
    Treasure = T.RT_9
  },
  [7] = {
    Blessing = {10, 12},
    Rarity = T.RT_8,
    ShopRandom = 7,
    Treasure = T.RT_9
  },
  [8] = {
    Blessing = {9, 11},
    Rarity = T.RT_8,
    ShopRandom = 8,
    Treasure = T.RT_7
  },
  [101] = {
    Blessing = T.RT_3,
    Rarity = T.RT_4,
    ShopRandom = 101,
    Treasure = T.RT_5
  },
  [102] = {
    Blessing = T.RT_6,
    Rarity = {3},
    ShopRandom = 102,
    Treasure = T.RT_5
  },
  [201] = {
    Blessing = {9, 12},
    Item = {5, 7},
    Rarity = T.RT_8,
    ShopRandom = 201,
    Treasure = {4, 6}
  }
})
