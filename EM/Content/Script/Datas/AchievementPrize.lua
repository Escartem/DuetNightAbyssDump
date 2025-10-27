local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("AchievementPrize", {
  [10] = {AchievementPointCount = 10, RewardId = 110203},
  [20] = {AchievementPointCount = 20, RewardId = 110204},
  [30] = {AchievementPointCount = 30, RewardId = 110205},
  [40] = {AchievementPointCount = 40, RewardId = 110206},
  [50] = {AchievementPointCount = 50, RewardId = 110207}
})
