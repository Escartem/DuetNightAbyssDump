local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ConditionId2FishingSpotId", {
  [20021501] = {
    [1] = 10010101,
    [2] = 10110301,
    [3] = 10170101
  }
})
