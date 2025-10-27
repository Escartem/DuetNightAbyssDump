local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("GachaProbability", {
  [1001] = {
    ProbabilityGold = 30,
    ProbabilityId = 1001,
    ProbabilityPurple = 510,
    ShowGetStar5Times = 90
  },
  [2001] = {
    ProbabilityGold = 60,
    ProbabilityId = 2001,
    ProbabilityPurple = 510,
    ShowGetStar5Times = 90
  },
  [3001] = {
    ProbabilityGold = 80,
    ProbabilityId = 3001,
    ProbabilityPurple = 660,
    ShowGetStar5Times = 80
  },
  [9996] = {
    ProbabilityGold = 80,
    ProbabilityId = 9996,
    ProbabilityPurple = 660,
    ShowGetStar5Times = 80
  },
  [9997] = {
    ProbabilityGold = 60,
    ProbabilityId = 9997,
    ProbabilityPurple = 510
  },
  [9998] = {
    ProbabilityGold = 10000,
    ProbabilityId = 9998,
    ProbabilityPurple = 0
  },
  [9999] = {
    ProbabilityGold = 30,
    ProbabilityId = 9999,
    ProbabilityPurple = 510,
    ShowGetStar5Times = 90
  }
})
