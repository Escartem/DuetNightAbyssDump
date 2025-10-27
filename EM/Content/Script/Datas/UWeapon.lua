local T = {}
T.RT_1 = {
  -1,
  -1,
  -1,
  -1
}
T.RT_2 = {
  0,
  0,
  0,
  0
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("UWeapon", {
  [110101] = {
    BigIcon = "/Game/UI/Texture/Dynamic/Image/Bust/Weapon/T_Bust_Baonu_WP.T_Bust_Baonu_WP",
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/Gacha/Weapon/T_Gacha_Broadsword_Baonu.T_Gacha_Broadsword_Baonu",
    Icon = "/Game/UI/Texture/Dynamic/Image/Head/Weapon/T_Head_Heitao_WP.T_Head_Heitao_WP",
    ModSlot = T.RT_1,
    ModSlotUnlock = T.RT_2,
    WeaponDescribe = "UI_WEAPON_DESC_110101",
    WeaponId = 110101,
    WeaponMaxLevel = 80,
    WeaponName = "UI_WEAPON_NAME_110101",
    WeaponRarity = 5,
    WeaponValue = -1
  },
  [110301] = {
    BigIcon = "/Game/UI/Texture/Dynamic/Image/Bust/Weapon/T_Bust_Baonu_WP.T_Bust_Baonu_WP",
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/Gacha/Weapon/T_Gacha_Broadsword_Baonu.T_Gacha_Broadsword_Baonu",
    Icon = "/Game/UI/Texture/Dynamic/Image/Head/Weapon/T_Head_Heitao_WP.T_Head_Heitao_WP",
    IsInvisible = true,
    ModSlot = T.RT_1,
    ModSlotUnlock = T.RT_2,
    WeaponDescribe = "UI_WEAPON_DESC_110301",
    WeaponId = 110301,
    WeaponMaxLevel = 80,
    WeaponName = "UI_WEAPON_NAME_110301",
    WeaponRarity = 5,
    WeaponValue = -1
  },
  [110302] = {
    BigIcon = "/Game/UI/Texture/Dynamic/Image/Bust/Weapon/T_Bust_Baonu_WP.T_Bust_Baonu_WP",
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/Gacha/Weapon/T_Gacha_Broadsword_Baonu.T_Gacha_Broadsword_Baonu",
    Icon = "/Game/UI/Texture/Dynamic/Image/Head/Weapon/T_Head_Heitao_WP.T_Head_Heitao_WP",
    IsInvisible = true,
    ModSlot = T.RT_1,
    ModSlotUnlock = T.RT_2,
    WeaponDescribe = "UI_WEAPON_DESC_110301",
    WeaponId = 110302,
    WeaponMaxLevel = 80,
    WeaponName = "UI_WEAPON_NAME_110301",
    WeaponRarity = 5,
    WeaponValue = -1
  },
  [150101] = {
    BigIcon = "/Game/UI/Texture/Dynamic/Image/Bust/Weapon/T_Bust_Baonu_WP.T_Bust_Baonu_WP",
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/Gacha/Weapon/T_Gacha_Broadsword_Baonu.T_Gacha_Broadsword_Baonu",
    Icon = "/Game/UI/Texture/Dynamic/Image/Head/Weapon/T_Head_Baonu_WP.T_Head_Baonu_WP",
    ModSlot = T.RT_1,
    ModSlotUnlock = T.RT_2,
    WeaponDescribe = "UI_WEAPON_DESC_150101",
    WeaponId = 150101,
    WeaponMaxLevel = 80,
    WeaponName = "UI_WEAPON_NAME_150101",
    WeaponRarity = 5,
    WeaponValue = -1
  },
  [150301] = {
    BigIcon = "/Game/UI/Texture/Dynamic/Image/Bust/Weapon/T_Bust_Baonu_WP.T_Bust_Baonu_WP",
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/Gacha/Weapon/T_Gacha_Broadsword_Baonu.T_Gacha_Broadsword_Baonu",
    Icon = "/Game/UI/Texture/Dynamic/Image/Head/Weapon/T_Head_Heitao_WP.T_Head_Heitao_WP",
    IsInvisible = true,
    ModSlot = T.RT_1,
    ModSlotUnlock = T.RT_2,
    WeaponDescribe = "UI_WEAPON_DESC_150301",
    WeaponId = 150301,
    WeaponMaxLevel = 80,
    WeaponName = "UI_WEAPON_NAME_150301",
    WeaponRarity = 5,
    WeaponValue = -1
  },
  [150302] = {
    BigIcon = "/Game/UI/Texture/Dynamic/Image/Bust/Weapon/T_Bust_Baonu_WP.T_Bust_Baonu_WP",
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/Gacha/Weapon/T_Gacha_Broadsword_Baonu.T_Gacha_Broadsword_Baonu",
    Icon = "/Game/UI/Texture/Dynamic/Image/Head/Weapon/T_Head_Heitao_WP.T_Head_Heitao_WP",
    IsInvisible = true,
    ModSlot = T.RT_1,
    ModSlotUnlock = T.RT_2,
    WeaponDescribe = "UI_WEAPON_DESC_150302",
    WeaponId = 150302,
    WeaponMaxLevel = 80,
    WeaponName = "UI_WEAPON_NAME_150302",
    WeaponRarity = 5,
    WeaponValue = -1
  },
  [150303] = {
    BigIcon = "/Game/UI/Texture/Dynamic/Image/Bust/Weapon/T_Bust_Baonu_WP.T_Bust_Baonu_WP",
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/Gacha/Weapon/T_Gacha_Broadsword_Baonu.T_Gacha_Broadsword_Baonu",
    Icon = "/Game/UI/Texture/Dynamic/Image/Head/Weapon/T_Head_Heitao_WP.T_Head_Heitao_WP",
    IsInvisible = true,
    ModSlot = T.RT_1,
    ModSlotUnlock = T.RT_2,
    WeaponDescribe = "UI_WEAPON_DESC_150303",
    WeaponId = 150303,
    WeaponMaxLevel = 80,
    WeaponName = "UI_WEAPON_NAME_150303",
    WeaponRarity = 5,
    WeaponValue = -1
  },
  [150304] = {
    BigIcon = "/Game/UI/Texture/Dynamic/Image/Bust/Weapon/T_Bust_Baonu_WP.T_Bust_Baonu_WP",
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/Gacha/Weapon/T_Gacha_Broadsword_Baonu.T_Gacha_Broadsword_Baonu",
    Icon = "/Game/UI/Texture/Dynamic/Image/Head/Weapon/T_Head_Heitao_WP.T_Head_Heitao_WP",
    IsInvisible = true,
    ModSlot = T.RT_1,
    ModSlotUnlock = T.RT_2,
    WeaponDescribe = "UI_WEAPON_DESC_150304",
    WeaponId = 150304,
    WeaponMaxLevel = 80,
    WeaponName = "UI_WEAPON_NAME_150304",
    WeaponRarity = 5,
    WeaponValue = -1
  },
  [150401] = {
    BigIcon = "/Game/UI/Texture/Dynamic/Image/Bust/Weapon/T_Bust_Baonu_WP.T_Bust_Baonu_WP",
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/Gacha/Weapon/T_Gacha_Broadsword_Baonu.T_Gacha_Broadsword_Baonu",
    Icon = "/Game/UI/Texture/Dynamic/Image/Head/Weapon/T_Head_Heitao_WP.T_Head_Heitao_WP",
    ModSlot = T.RT_1,
    ModSlotUnlock = T.RT_2,
    WeaponDescribe = "UI_WEAPON_DESC_150304",
    WeaponId = 150401,
    WeaponMaxLevel = 80,
    WeaponName = "UI_WEAPON_NAME_150304",
    WeaponRarity = 5,
    WeaponValue = -1
  },
  [150402] = {
    BigIcon = "/Game/UI/Texture/Dynamic/Image/Bust/Weapon/T_Bust_Baonu_WP.T_Bust_Baonu_WP",
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/Gacha/Weapon/T_Gacha_Broadsword_Baonu.T_Gacha_Broadsword_Baonu",
    Icon = "/Game/UI/Texture/Dynamic/Image/Head/Weapon/T_Head_Heitao_WP.T_Head_Heitao_WP",
    IsInvisible = true,
    ModSlot = T.RT_1,
    ModSlotUnlock = T.RT_2,
    WeaponDescribe = "UI_WEAPON_DESC_150304",
    WeaponId = 150402,
    WeaponMaxLevel = 80,
    WeaponName = "UI_WEAPON_NAME_150304",
    WeaponRarity = 5,
    WeaponValue = -1
  },
  [150403] = {
    BigIcon = "/Game/UI/Texture/Dynamic/Image/Bust/Weapon/T_Bust_Baonu_WP.T_Bust_Baonu_WP",
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/Gacha/Weapon/T_Gacha_Broadsword_Baonu.T_Gacha_Broadsword_Baonu",
    Icon = "/Game/UI/Texture/Dynamic/Image/Head/Weapon/T_Head_Heitao_WP.T_Head_Heitao_WP",
    IsInvisible = true,
    ModSlot = T.RT_1,
    ModSlotUnlock = T.RT_2,
    WeaponDescribe = "UI_WEAPON_DESC_150304",
    WeaponId = 150403,
    WeaponMaxLevel = 80,
    WeaponName = "UI_WEAPON_NAME_150304",
    WeaponRarity = 5,
    WeaponValue = -1
  },
  [310101] = {
    BigIcon = "/Game/UI/Texture/Dynamic/Image/Bust/Weapon/T_Bust_Baonu_WP.T_Bust_Baonu_WP",
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/Gacha/Weapon/T_Gacha_Broadsword_Baonu.T_Gacha_Broadsword_Baonu",
    Icon = "/Game/UI/Texture/Dynamic/Image/Head/Weapon/T_Head_Linen_WP.T_Head_Linen_WP",
    ModSlot = T.RT_1,
    ModSlotUnlock = T.RT_2,
    WeaponDescribe = "UI_WEAPON_DESC_310101",
    WeaponId = 310101,
    WeaponMaxLevel = 80,
    WeaponName = "UI_WEAPON_NAME_310101",
    WeaponRarity = 5,
    WeaponValue = -1
  },
  [510101] = {
    BigIcon = "/Game/UI/Texture/Dynamic/Image/Bust/Weapon/T_Bust_Baonu_WP.T_Bust_Baonu_WP",
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/Gacha/Weapon/T_Gacha_Broadsword_Baonu.T_Gacha_Broadsword_Baonu",
    Icon = "/Game/UI/Texture/Dynamic/Image/Head/Weapon/T_Head_Heitao_WP.T_Head_Heitao_WP",
    IsInvisible = true,
    ModSlot = T.RT_1,
    ModSlotUnlock = T.RT_2,
    WeaponDescribe = "UI_WEAPON_DESC_510101",
    WeaponId = 510101,
    WeaponMaxLevel = 80,
    WeaponName = "UI_WEAPON_NAME_510101",
    WeaponRarity = 5,
    WeaponValue = -1
  },
  [530101] = {
    BigIcon = "/Game/UI/Texture/Dynamic/Image/Bust/Weapon/T_Bust_Baonu_WP.T_Bust_Baonu_WP",
    GachaIcon = "/Game/UI/Texture/Dynamic/Image/Gacha/Weapon/T_Gacha_Broadsword_Baonu.T_Gacha_Broadsword_Baonu",
    Icon = "/Game/UI/Texture/Dynamic/Image/Head/Weapon/T_Head_Saiqi_WP.T_Head_Saiqi_WP",
    ModSlot = T.RT_1,
    ModSlotUnlock = T.RT_2,
    WeaponDescribe = "UI_WEAPON_DESC_530101",
    WeaponId = 530101,
    WeaponMaxLevel = 80,
    WeaponName = "UI_WEAPON_NAME_530101",
    WeaponRarity = 5,
    WeaponValue = -1
  }
})
