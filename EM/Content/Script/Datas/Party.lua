local T = {}
T.RT_1 = {
  0,
  180,
  360
}
T.RT_2 = {
  500,
  1000,
  2000,
  3000
}
T.RT_3 = {
  7101,
  7102,
  7103
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Party", {
  [70000] = {
    DungeonId = 70000,
    RatingRange = T.RT_1,
    RespawnRule = 0,
    RewardCoin = T.RT_2,
    RewardId = T.RT_3
  },
  [70101] = {
    DungeonId = 70101,
    RatingRange = T.RT_1,
    RespawnRule = 0,
    RewardCoin = T.RT_2,
    RewardId = T.RT_3,
    SucRule = "Parkour"
  },
  [70102] = {
    DungeonId = 70102,
    RatingRange = T.RT_1,
    RespawnRule = 0,
    RewardCoin = T.RT_2,
    RewardId = T.RT_3,
    SucRule = "Parkour"
  },
  [70201] = {
    DungeonId = 70201,
    RespawnRule = 1,
    RewardCoin = T.RT_2,
    RewardId = T.RT_3
  },
  [70202] = {
    DungeonId = 70202,
    RespawnRule = 0,
    RewardCoin = T.RT_2,
    RewardId = T.RT_3
  },
  [70301] = {DungeonId = 70301, RespawnRule = 0}
})
