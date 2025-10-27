local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Maximum", {
  [1] = {
    MonitorId = 1,
    MonitorType = "Resource",
    SubId = 100,
    Value = 5000000
  },
  [2] = {
    MonitorId = 2,
    MonitorType = "Resource",
    SubId = 102,
    Value = 100000
  },
  [3] = {
    MonitorId = 3,
    MonitorType = "Resource",
    SubId = 110,
    Value = 50000
  },
  [4] = {
    MonitorId = 4,
    MonitorType = "Resource",
    SubId = 111,
    Value = 50000
  },
  [5] = {
    MonitorId = 5,
    MonitorType = "Resource",
    SubId = 201,
    Value = 500
  },
  [6] = {
    MonitorId = 6,
    MonitorType = "Resource",
    SubId = 202,
    Value = 500
  },
  [7] = {
    MonitorId = 7,
    MonitorType = "Resource",
    SubId = 204,
    Value = 500
  },
  [8] = {
    MonitorId = 8,
    MonitorType = "Resource",
    SubId = 211,
    Value = 100000
  }
})
