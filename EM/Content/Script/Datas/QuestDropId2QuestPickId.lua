local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("QuestDropId2QuestPickId", {
  [30007] = {
    [1] = 1
  },
  [30008] = {
    [1] = 2
  },
  [30009] = {
    [1] = 3
  }
})
