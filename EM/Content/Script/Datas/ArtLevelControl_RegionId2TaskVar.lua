local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ArtLevelControl_RegionId2TaskVar", {
  [1011] = {
    [1] = "IQ1003",
    [2] = "IQ1002",
    [3] = "IQ100303",
    [4] = "IQ10030498"
  },
  [1017] = {
    [1] = "IQ100304"
  },
  [1019] = {
    [1] = "IQ100306",
    [2] = "IQ10030601",
    [3] = "BH_Thea_Online"
  },
  [1021] = {
    [1] = "IQ110103",
    [2] = "IQ110107",
    [3] = "NPC110108",
    [4] = "LinshiNPC110101",
    [5] = "NengYuanNPC110105",
    [6] = "ShenWenNPC110105",
    [7] = "XimengNPC110105"
  },
  [1041] = {
    [1] = "DaFengBaoXiang200303",
    [2] = "ZhuXingMuXiang200302",
    [3] = "ZhuXingMuXiang20030203"
  }
})
