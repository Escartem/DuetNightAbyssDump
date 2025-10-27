local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("FeinaEvent", {
  [1] = {
    Condition = 8013,
    DungeonId = {60001},
    DungeonName = "FeinaEvent_DungeonName_1",
    Id = 1,
    RewardNum = 3
  },
  [2] = {
    Condition = 8014,
    DungeonId = {60002},
    DungeonName = "FeinaEvent_DungeonName_2",
    Id = 2,
    RewardNum = 3
  },
  [3] = {
    Condition = 8015,
    DungeonId = {60003, 60004},
    DungeonName = "FeinaEvent_DungeonName_3",
    Id = 3,
    RewardNum = 6
  },
  [4] = {
    Condition = 8016,
    DungeonId = {60005, 60006},
    DungeonName = "FeinaEvent_DungeonName_4",
    Id = 4,
    RewardNum = 6
  }
})
