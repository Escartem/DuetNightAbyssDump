local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Monitor", {
  [1] = {
    MonitorId = 1,
    MonitorType = "Resource",
    SourceType = 0,
    SubId = 100,
    TimeInterval = 1,
    Value = 50000
  },
  [2] = {
    MonitorId = 2,
    MonitorType = "Resource",
    SourceType = 0,
    SubId = 100,
    TimeInterval = 60,
    Value = 200000
  },
  [3] = {
    MonitorId = 3,
    MonitorType = "Resource",
    SourceType = 0,
    SubId = 100,
    TimeInterval = 1440,
    Value = 1000000
  },
  [4] = {
    MonitorId = 4,
    MonitorType = "Resource",
    SourceType = 0,
    SubId = 102,
    TimeInterval = 60,
    Value = 50000
  },
  [5] = {
    MonitorId = 5,
    MonitorType = "Resource",
    SourceType = 0,
    SubId = 110,
    TimeInterval = 60,
    Value = 10000
  },
  [6] = {
    MonitorId = 6,
    MonitorType = "Resource",
    SourceType = 0,
    SubId = 111,
    TimeInterval = 60,
    Value = 10000
  },
  [7] = {
    MonitorId = 7,
    MonitorType = "Resource",
    SourceType = 0,
    SubId = 201,
    TimeInterval = 60,
    Value = 100
  },
  [8] = {
    MonitorId = 8,
    MonitorType = "Resource",
    SourceType = 0,
    SubId = 202,
    TimeInterval = 60,
    Value = 100
  },
  [9] = {
    MonitorId = 9,
    MonitorType = "Resource",
    SourceType = 0,
    SubId = 204,
    TimeInterval = 60,
    Value = 100
  },
  [10] = {
    MonitorId = 10,
    MonitorType = "Resource",
    SourceType = 0,
    SubId = 211,
    TimeInterval = 1,
    Value = 2000
  },
  [11] = {
    MonitorId = 11,
    MonitorType = "Resource",
    SourceType = 0,
    SubId = 211,
    TimeInterval = 60,
    Value = 7500
  },
  [12] = {
    MonitorId = 12,
    MonitorType = "Resource",
    SourceType = 0,
    SubId = 211,
    TimeInterval = 1440,
    Value = 100000
  },
  [10001] = {
    MonitorId = 10001,
    MonitorType = "reward",
    SourceType = 0,
    SubId = 10600101,
    TimeInterval = 1440,
    Value = 1
  },
  [10002] = {
    MonitorId = 10002,
    MonitorType = "reward",
    SourceType = 0,
    SubId = 10600102,
    TimeInterval = 1440,
    Value = 1
  },
  [10003] = {
    MonitorId = 10003,
    MonitorType = "reward",
    SourceType = 0,
    SubId = 10600103,
    TimeInterval = 1440,
    Value = 1
  },
  [10004] = {
    MonitorId = 10004,
    MonitorType = "reward",
    SourceType = 0,
    SubId = 10600104,
    TimeInterval = 1440,
    Value = 1
  }
})
