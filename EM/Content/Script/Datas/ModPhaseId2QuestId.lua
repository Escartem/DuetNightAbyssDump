local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ModPhaseId2QuestId", {
  [1] = {
    [1] = 1,
    [2] = 2,
    [3] = 3,
    [4] = 4,
    [5] = 5
  },
  [2] = {
    [1] = 6,
    [2] = 7,
    [3] = 8,
    [4] = 9,
    [5] = 10
  },
  [3] = {
    [1] = 11,
    [2] = 12,
    [3] = 13,
    [4] = 14
  }
})
