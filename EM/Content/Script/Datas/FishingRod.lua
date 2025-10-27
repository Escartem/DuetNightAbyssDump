local T = {}
T.RT_1 = {30101}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("FishingRod", {
  [101] = {
    AutoFishingLevel = 2,
    EffectCreatureId = T.RT_1,
    FishingRodId = 101,
    FishingRodLevel = 1,
    Length = 100,
    MaterialParam = 1,
    MaterialPath = "/Game/Asset/Char/Player/Common/Fishing/Materials/MI_Show_Fis.MI_Show_Fis",
    MeshResourceId = 601,
    ResourceId = 5110100
  },
  [102] = {
    AutoFishingLevel = 3,
    EffectCreatureId = T.RT_1,
    FishingRodId = 102,
    FishingRodLevel = 3,
    Length = 120,
    MaterialParam = 2,
    MaterialPath = "/Game/Asset/Char/Player/Common/Fishing/Materials/MI_Show_Fis.MI_Show_Fis",
    MeshResourceId = 601,
    ResourceId = 5110200
  },
  [103] = {
    AutoFishingLevel = 4,
    EffectCreatureId = T.RT_1,
    FishingRodId = 103,
    FishingRodLevel = 7,
    Length = 140,
    MaterialParam = 3,
    MaterialPath = "/Game/Asset/Char/Player/Common/Fishing/Materials/MI_Show_Fis.MI_Show_Fis",
    MeshResourceId = 601,
    ResourceId = 5110300
  },
  [104] = {
    AutoFishingLevel = 5,
    EffectCreatureId = T.RT_1,
    FishingRodId = 104,
    FishingRodLevel = 12,
    Length = 160,
    MaterialParam = 4,
    MaterialPath = "/Game/Asset/Char/Player/Common/Fishing/Materials/MI_Show_Fis.MI_Show_Fis",
    MeshResourceId = 601,
    ResourceId = 5110400
  },
  [105] = {
    AutoFishingLevel = 6,
    EffectCreatureId = T.RT_1,
    FishingRodId = 105,
    FishingRodLevel = 20,
    Length = 180,
    MaterialPath = "/Game/Asset/Char/Player/Common/Weapon/Common/Materials/MI_WPSkinCom01.MI_WPSkinCom01",
    MeshResourceId = 601,
    ResourceId = 5110500
  }
})
