local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("AbyssLock2Id", {
  [1012] = {
    [1] = 1013
  },
  [1014] = {
    [1] = 1015
  },
  [9991] = {
    [1] = 1012,
    [2] = 1014
  }
})
