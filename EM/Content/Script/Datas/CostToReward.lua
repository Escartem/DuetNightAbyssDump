local T = {}
T.RT_1 = {100208, 100212}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CostToReward", {
  [1] = {
    Conditions = T.RT_1,
    CostToReward = 40,
    EndTime = 1767240000,
    Id = 1,
    RewardId = 1,
    StartTime = 1704081600
  },
  [2] = {
    Conditions = T.RT_1,
    CostToReward = 60,
    EndTime = 1767240000,
    Id = 2,
    RewardId = 1,
    StartTime = 1704081600
  },
  [3] = {
    Conditions = T.RT_1,
    CostToReward = 60,
    EndTime = 1767240000,
    Id = 3,
    RewardId = 1,
    StartTime = 1704081600
  },
  [4] = {
    Conditions = T.RT_1,
    CostToReward = 100,
    EndTime = 1767240000,
    Id = 4,
    RewardId = 1,
    StartTime = 1704081600
  },
  [5] = {
    Conditions = T.RT_1,
    CostToReward = 100,
    EndTime = 1767240000,
    Id = 5,
    RewardId = 1,
    StartTime = 1704081600
  },
  [6] = {
    Conditions = T.RT_1,
    CostToReward = 150,
    EndTime = 1767240000,
    Id = 6,
    RewardId = 1,
    StartTime = 1704081600
  },
  [7] = {
    Conditions = T.RT_1,
    CostToReward = 150,
    EndTime = 1767240000,
    Id = 7,
    RewardId = 1,
    StartTime = 1704081600
  },
  [8] = {
    Conditions = T.RT_1,
    CostToReward = 200,
    EndTime = 1798776000,
    Id = 8,
    RewardId = 1,
    StartTime = 1767240000
  }
})
