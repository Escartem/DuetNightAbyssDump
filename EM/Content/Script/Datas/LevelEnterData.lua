local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("LevelEnterData", {
  Damage = {
    CanPhantomShow = true,
    HighLightName = "UI_LevelFinish_HL_Damage",
    Icon = "Game/UI/Texture/Dynamic/Atlas/Settlement/T_Settlement_IconDisplay01.T_Settlement_IconDisplay01",
    Key = "Damage",
    Priority = 1,
    Type = 1
  },
  DamageSingle = {
    CanPhantomShow = true,
    HighLightName = "UI_LevelFinish_HL_DamageSingle",
    Icon = "Game/UI/Texture/Dynamic/Atlas/Settlement/T_Settlement_IconDisplay01.T_Settlement_IconDisplay01",
    Key = "DamageSingle",
    Priority = 5,
    Type = 1
  },
  Damaged = {
    CanPhantomShow = true,
    HighLightName = "UI_LevelFinish_HL_Damaged",
    Icon = "Game/UI/Texture/Dynamic/Atlas/Settlement/T_Settlement_IconDisplay02.T_Settlement_IconDisplay02",
    Key = "Damaged",
    Priority = 3,
    Type = 2
  },
  Destroy = {
    HighLightName = "UI_LevelFinish_HL_Destroy",
    Icon = "Game/UI/Texture/Dynamic/Atlas/Settlement/T_Settlement_IconDisplay04.T_Settlement_IconDisplay04",
    Key = "Destroy",
    Priority = 6,
    Type = 4
  },
  Heal = {
    CanPhantomShow = true,
    HighLightName = "UI_LevelFinish_HL_Heal",
    Icon = "Game/UI/Texture/Dynamic/Atlas/Settlement/T_Settlement_IconDisplay03.T_Settlement_IconDisplay03",
    Key = "Heal",
    Priority = 4,
    Type = 3
  },
  HitCount = {
    HighLightName = "UI_LevelFinish_HL_HitCount",
    Icon = "Game/UI/Texture/Dynamic/Atlas/Settlement/T_Settlement_IconDisplay04.T_Settlement_IconDisplay04",
    Key = "HitCount",
    Priority = 7,
    Type = 4
  },
  Kill = {
    CanPhantomShow = true,
    HighLightName = "UI_LevelFinish_HL_Kill",
    Icon = "Game/UI/Texture/Dynamic/Atlas/Settlement/T_Settlement_IconDisplay01.T_Settlement_IconDisplay01",
    Key = "Kill",
    Priority = 2,
    Type = 1
  }
})
