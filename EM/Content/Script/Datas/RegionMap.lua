local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RegionMap", {
  [100] = {
    MainRegionMap = true,
    RegionId = 1001,
    RegionMapId = 100
  },
  [200] = {
    MainRegionMap = true,
    RegionId = 1011,
    RegionMapId = 200,
    RegionMapUnlockCondition = 26
  },
  [201] = {
    RegionId = 1017,
    RegionMapId = 201,
    RegionMapUnlockCondition = 312
  },
  [202] = {
    RegionId = 1013,
    RegionMapId = 202,
    RegionMapUnlockCondition = 314
  },
  [203] = {
    RegionId = 2101,
    RegionMapId = 203,
    RegionMapUnlockCondition = 27
  },
  [204] = {
    RegionId = 1019,
    RegionMapId = 204,
    RegionMapUnlockCondition = 317
  },
  [300] = {
    RegionId = 1021,
    RegionMapId = 300,
    RegionMapUnlockCondition = 11010103,
    UISubRegionType = "EX"
  }
})
