local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("QTEPosition", {
  [1] = {
    OffsetX = 150,
    OffsetY = -400,
    PositionId = 1
  },
  [2] = {
    OffsetX = 350,
    OffsetY = 200,
    PositionId = 2
  }
})
