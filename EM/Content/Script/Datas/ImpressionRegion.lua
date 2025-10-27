local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ImpressionRegion", {
  [1011] = {
    Icon = "/Game/UI/Texture/Dynamic/Image/Area/T_Area_01.T_Area_01",
    ImpressionRegionId = 1011,
    RegionId = {
      2101,
      1001,
      1011,
      1013,
      1014,
      1017,
      1018,
      1019,
      1021,
      1022,
      1031,
      1032
    },
    RegionPointId = 2612,
    UIName = "DimensionGraph_Hyper"
  },
  [1041] = {
    Icon = "/Game/UI/Texture/Dynamic/Image/Area/T_Area_05.T_Area_05",
    ImpressionRegionId = 1041,
    RegionId = {1041},
    RegionPointId = 2612,
    UIName = "DimensionGraph_East"
  }
})
