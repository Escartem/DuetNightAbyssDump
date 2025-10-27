local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MonitorReward", {
  ["10600101_0_1440"] = 1,
  ["10600102_0_1440"] = 1,
  ["10600103_0_1440"] = 1,
  ["10600104_0_1440"] = 1
})
