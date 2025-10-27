local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("WeaponTag", {
  Abstract = {WeaponTag = "Abstract"},
  Almighty = {
    WeaponTag = "Almighty",
    WeaponTagTextmap = "WeaponType_Almighty"
  },
  Bow = {
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/WeaponType/T_Gacha_WeaponType_Bow.T_Gacha_WeaponType_Bow",
    GachaSpine = "/Game/UI/WBP/Gacha/Widget/CampAni/WBP_Gacha_CampAni_Bow.WBP_Gacha_CampAni_Bow",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_WeaponType_Bow.T_Armory_WeaponType_Bow",
    ImageType = 2,
    WeaponTag = "Bow",
    WeaponTagTextmap = "WeaponType_Bow",
    WeaponTagfilter = "RangedType"
  },
  Bow01 = {WeaponTag = "Bow01"},
  Bow02 = {WeaponTag = "Bow02"},
  Cannon = {
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/WeaponType/T_Gacha_WeaponType_Cannon.T_Gacha_WeaponType_Cannon",
    GachaSpine = "/Game/UI/WBP/Gacha/Widget/CampAni/WBP_Gacha_CampAni_Cannon.WBP_Gacha_CampAni_Cannon",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_WeaponType_Cannon.T_Armory_WeaponType_Cannon",
    ImageType = 1,
    WeaponTag = "Cannon",
    WeaponTagTextmap = "WeaponType_Cannon",
    WeaponTagfilter = "RangedType"
  },
  Claymore = {
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/WeaponType/T_Gacha_WeaponType_Claymore.T_Gacha_WeaponType_Claymore",
    GachaSpine = "/Game/UI/WBP/Gacha/Widget/CampAni/WBP_Gacha_CampAni_Claymore.WBP_Gacha_CampAni_Claymore",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_WeaponType_Claymore.T_Armory_WeaponType_Claymore",
    ImageType = 0,
    WeaponTag = "Claymore",
    WeaponTagTextmap = "WeaponType_Claymore",
    WeaponTagfilter = "MeleeType"
  },
  Condemn = {WeaponTag = "Condemn"},
  Crossbow = {
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/WeaponType/T_Gacha_WeaponType_Crossbow.T_Gacha_WeaponType_Crossbow",
    GachaSpine = "/Game/UI/WBP/Gacha/Widget/CampAni/WBP_Gacha_CampAni_Crossbow.WBP_Gacha_CampAni_Crossbow",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_WeaponType_Crossbow.T_Armory_WeaponType_Crossbow",
    ImageType = 2,
    WeaponTag = "Crossbow",
    WeaponTagTextmap = "WeaponType_Crossbow",
    WeaponTagfilter = "RangedType"
  },
  Dualblade = {
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/WeaponType/T_Gacha_WeaponType_Dualblade.T_Gacha_WeaponType_Dualblade",
    GachaSpine = "/Game/UI/WBP/Gacha/Widget/CampAni/WBP_Gacha_CampAni_DoubleSwords.WBP_Gacha_CampAni_DoubleSwords",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_WeaponType_Dualblade.T_Armory_WeaponType_Dualblade",
    ImageType = 1,
    WeaponTag = "Dualblade",
    WeaponTagTextmap = "WeaponType_Dualblade",
    WeaponTagfilter = "MeleeType"
  },
  Katana = {
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/WeaponType/T_Gacha_WeaponType_Katana.T_Gacha_WeaponType_Katana",
    GachaSpine = "/Game/UI/WBP/Gacha/Widget/CampAni/WBP_Gacha_CampAni_Katana.WBP_Gacha_CampAni_Katana",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_WeaponType_Katana.T_Armory_WeaponType_Katana",
    ImageType = 1,
    WeaponTag = "Katana",
    WeaponTagTextmap = "WeaponType_Katana",
    WeaponTagfilter = "MeleeType"
  },
  Machinegun = {
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/WeaponType/T_Gacha_WeaponType_Machinegun.T_Gacha_WeaponType_Machinegun",
    GachaSpine = "/Game/UI/WBP/Gacha/Widget/CampAni/WBP_Gacha_CampAni_Machinegun.WBP_Gacha_CampAni_Machinegun",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_WeaponType_Machinegun.T_Armory_WeaponType_Machinegun",
    ImageType = 2,
    WeaponTag = "Machinegun",
    WeaponTagTextmap = "WeaponType_Machinegun",
    WeaponTagfilter = "RangedType"
  },
  Melee = {WeaponTag = "Melee"},
  Mon = {WeaponTag = "Mon"},
  MonBlade = {WeaponTag = "MonBlade"},
  MonDual = {WeaponTag = "MonDual", WeaponTagFloat = 3},
  MonGun = {WeaponTag = "MonGun", WeaponTagFloat = 1},
  MonSingle = {WeaponTag = "MonSingle", WeaponTagFloat = 2},
  Pistol = {
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/WeaponType/T_Gacha_WeaponType_Pistol.T_Gacha_WeaponType_Pistol",
    GachaSpine = "/Game/UI/WBP/Gacha/Widget/CampAni/WBP_Gacha_CampAni_Singlegun.WBP_Gacha_CampAni_Singlegun",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_WeaponType_Pistol.T_Armory_WeaponType_Pistol",
    ImageType = 2,
    WeaponTag = "Pistol",
    WeaponTagTextmap = "WeaponType_Pistol",
    WeaponTagfilter = "RangedType"
  },
  Polearm = {
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/WeaponType/T_Gacha_WeaponType_Polearm.T_Gacha_WeaponType_Polearm",
    GachaSpine = "/Game/UI/WBP/Gacha/Widget/CampAni/WBP_Gacha_CampAni_Polearm.WBP_Gacha_CampAni_Polearm",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_WeaponType_Polearm.T_Armory_WeaponType_Polearm",
    ImageType = 0,
    WeaponTag = "Polearm",
    WeaponTagTextmap = "WeaponType_Polearm",
    WeaponTagfilter = "MeleeType"
  },
  Ranged = {WeaponTag = "Ranged"},
  Shotgun = {
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/WeaponType/T_Gacha_WeaponType_Shotgun.T_Gacha_WeaponType_Shotgun",
    GachaSpine = "/Game/UI/WBP/Gacha/Widget/CampAni/WBP_Gacha_CampAni_Shotgun.WBP_Gacha_CampAni_Shotgun",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_WeaponType_Shotgun.T_Armory_WeaponType_Shotgun",
    ImageType = 2,
    WeaponTag = "Shotgun",
    WeaponTagTextmap = "WeaponType_Shotgun",
    WeaponTagfilter = "RangedType"
  },
  Sword = {
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/WeaponType/T_Gacha_WeaponType_Sword.T_Gacha_WeaponType_Sword",
    GachaSpine = "/Game/UI/WBP/Gacha/Widget/CampAni/WBP_Gacha_CampAni_Sword.WBP_Gacha_CampAni_Sword",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_WeaponType_Sword.T_Armory_WeaponType_Sword",
    ImageType = 1,
    WeaponTag = "Sword",
    WeaponTagTextmap = "WeaponType_Sword",
    WeaponTagfilter = "MeleeType"
  },
  Swordwhip = {
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/WeaponType/T_Gacha_WeaponType_Swordwhip.T_Gacha_WeaponType_Swordwhip",
    GachaSpine = "/Game/UI/WBP/Gacha/Widget/CampAni/WBP_Gacha_CampAni_Swordwhip.WBP_Gacha_CampAni_Swordwhip",
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_WeaponType_Swordwhip.T_Armory_WeaponType_Swordwhip",
    ImageType = 1,
    WeaponTag = "Swordwhip",
    WeaponTagTextmap = "WeaponType_Swordwhip",
    WeaponTagfilter = "MeleeType"
  },
  Ultra = {WeaponTag = "Ultra"}
})
