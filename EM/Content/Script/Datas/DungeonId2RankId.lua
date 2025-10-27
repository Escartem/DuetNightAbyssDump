local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DungeonId2RankId", {
  [0] = {
    [1] = 1
  },
  [20002] = {
    [1] = 20002
  },
  [30002] = {
    [1] = 30002
  }
})
