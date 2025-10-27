local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("WeaponTypeContrast", {
  [101] = {
    ApplicationType = 101,
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/WeaponType/T_Gacha_WeaponType_Sword.T_Gacha_WeaponType_Sword",
    GachaSpine = "/Game/UI/WBP/Gacha/Widget/CampAni/WBP_Gacha_CampAni_Sword.WBP_Gacha_CampAni_Sword",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_WeaponType_Sword.T_Armory_WeaponType_Sword",
    ImageType = 1,
    WeaponTagTextmap = "WeaponType_Sword",
    WeaponTagfilter = "MeleeType"
  },
  [102] = {
    ApplicationType = 102,
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/WeaponType/T_Gacha_WeaponType_Claymore.T_Gacha_WeaponType_Claymore",
    GachaSpine = "/Game/UI/WBP/Gacha/Widget/CampAni/WBP_Gacha_CampAni_Claymore.WBP_Gacha_CampAni_Claymore",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_WeaponType_Claymore.T_Armory_WeaponType_Claymore",
    ImageType = 0,
    WeaponTagTextmap = "WeaponType_Polearm",
    WeaponTagfilter = "MeleeType"
  },
  [103] = {
    ApplicationType = 103,
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/WeaponType/T_Gacha_WeaponType_Polearm.T_Gacha_WeaponType_Polearm",
    GachaSpine = "/Game/UI/WBP/Gacha/Widget/CampAni/WBP_Gacha_CampAni_Polearm.WBP_Gacha_CampAni_Polearm",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_WeaponType_Polearm.T_Armory_WeaponType_Polearm",
    ImageType = 0,
    WeaponTagTextmap = "WeaponType_Claymore",
    WeaponTagfilter = "MeleeType"
  },
  [206] = {
    ApplicationType = 206,
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/WeaponType/T_Gacha_WeaponType_Bow.T_Gacha_WeaponType_Bow",
    GachaSpine = "/Game/UI/WBP/Gacha/Widget/CampAni/WBP_Gacha_CampAni_Bow.WBP_Gacha_CampAni_Bow",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_WeaponType_Bow.T_Armory_WeaponType_Bow",
    ImageType = 2,
    WeaponTagTextmap = "WeaponType_Bow",
    WeaponTagfilter = "RangedType"
  }
})
