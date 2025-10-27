local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ImpressionResource", {
  [1011] = {
    Count = 1,
    RegionId = 1011,
    ResourceId = 3001
  },
  [1041] = {
    Count = 1,
    RegionId = 1041,
    ResourceId = 3001
  }
})
