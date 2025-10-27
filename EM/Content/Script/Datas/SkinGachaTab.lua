local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SkinGachaTab", {
  [1] = {
    GachaId = {9001},
    Icon = "/Game/UI/Texture/Dynamic/Image/Gacha/Banner/T_Gacha_PoolBanner_Normal01.T_Gacha_PoolBanner_Normal01",
    ReddotNode = "Gacha_Normal",
    Sequence = 2,
    TabId = 1,
    TabName = "UI_SkinGacha_Normal"
  },
  [2] = {
    GachaId = {9002},
    Icon = "/Game/UI/Texture/Dynamic/Image/Gacha/Banner/T_Gacha_PoolBanner_Saiqi01.T_Gacha_PoolBanner_Saiqi01",
    ReddotNode = "Gacha_Special",
    Sequence = 1,
    TabId = 2,
    TabName = "UI_SkinGacha_Special"
  }
})
