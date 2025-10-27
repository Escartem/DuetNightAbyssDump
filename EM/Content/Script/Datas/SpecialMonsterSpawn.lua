local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SpecialMonsterSpawn", {
  [1] = {
    Condition = 1000401,
    Id = 1,
    SpawnLocation = "Local",
    SpawnProbability = 0.1,
    SpecialmonsterCD = 10,
    UnitId = 9500051,
    WeeklyLimit = 7
  },
  [2] = {
    Condition = 1000401,
    Id = 2,
    SpawnLocation = "Local",
    SpawnProbability = 0.1,
    SpecialmonsterCD = 10,
    UnitId = 7007051,
    WeeklyLimit = 7
  },
  [3] = {
    Condition = 1000401,
    Id = 3,
    SpawnLocation = "Offvision:1000",
    SpawnProbability = 0.1,
    SpecialmonsterCD = 10,
    UnitId = 6004051,
    WeeklyLimit = 7
  }
})
