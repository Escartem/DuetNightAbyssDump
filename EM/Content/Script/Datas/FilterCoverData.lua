local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("FilterCoverData", {
  [1] = {
    CoverLineCheck = {
      CenterLineEnable = false,
      LineHeight = 100,
      OffsetLineEnable = true
    },
    FilterCoverDataId = 1,
    MaxAngleList = {
      0,
      75,
      90
    },
    MaxDis = 1200,
    MaxNearNum = 3,
    MaxZ = 300,
    MinAngleList = {
      -90,
      -75,
      0
    },
    MinDis = 100
  }
})
