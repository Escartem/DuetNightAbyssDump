local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ForgeSTab", {
  [1] = {
    Id = 1,
    ProductType = "Weapon_All",
    Sequence = 90,
    TabDefaultSlot = 999,
    TabId = 4,
    TabName = "UI_TAB_NAME_ALL"
  },
  [2] = {
    Id = 2,
    ProductType = "Weapon_Melee",
    Sequence = 80,
    TabDefaultSlot = 999,
    TabId = 4,
    TabName = "UI_Armory_Meleeweapon"
  },
  [3] = {
    Id = 3,
    ProductType = "Weapon_Ranged",
    Sequence = 70,
    TabDefaultSlot = 999,
    TabId = 4,
    TabName = "UI_Armory_Longrange"
  },
  [4] = {
    Id = 4,
    ProductType = "Mod_All",
    Sequence = 90,
    TabDefaultSlot = 999,
    TabId = 5,
    TabName = "UI_TAB_NAME_ALL"
  },
  [5] = {
    Id = 5,
    ProductType = "Mod_Char",
    Sequence = 80,
    TabDefaultSlot = 999,
    TabId = 5,
    TabName = "UI_Armory_Char"
  },
  [6] = {
    Id = 6,
    ProductType = "Mod_MeleeWeapon",
    Sequence = 70,
    TabDefaultSlot = 999,
    TabId = 5,
    TabName = "UI_Armory_Meleeweapon"
  },
  [7] = {
    Id = 7,
    ProductType = "Mod_RangedWeapon",
    Sequence = 60,
    TabDefaultSlot = 999,
    TabId = 5,
    TabName = "UI_Armory_Longrange"
  },
  [8] = {
    Id = 8,
    ProductType = "Mod_UltraWeapon",
    Sequence = 50,
    TabDefaultSlot = 999,
    TabId = 5,
    TabName = "UI_Armory_Signatureweapon"
  },
  [9] = {
    Id = 9,
    ProductType = "Resource_All",
    Sequence = 90,
    TabDefaultSlot = 999,
    TabId = 6,
    TabName = "UI_TAB_NAME_ALL"
  },
  [10] = {
    Id = 10,
    ProductType = "Resource_Consume",
    Sequence = 80,
    TabDefaultSlot = 999,
    TabId = 6,
    TabName = "Draft_Resource_Consume"
  },
  [11] = {
    Id = 11,
    ProductType = "Resource_Education",
    Sequence = 70,
    TabDefaultSlot = 999,
    TabId = 6,
    TabName = "Draft_Resource_Education"
  },
  [12] = {
    Id = 12,
    ProductType = "Resource_Combat",
    Sequence = 60,
    TabDefaultSlot = 999,
    TabId = 6,
    TabName = "Draft_Resource_Combat"
  },
  [14] = {
    Id = 14,
    ProductType = "Accessory_All",
    Sequence = 90,
    TabDefaultSlot = 999,
    TabId = 7,
    TabName = "UI_TAB_NAME_ALL"
  },
  [15] = {
    Id = 15,
    ProductType = "Accessory_Head",
    Sequence = 80,
    TabDefaultSlot = 999,
    TabId = 7,
    TabName = "UI_Dress_Head"
  },
  [16] = {
    Id = 16,
    ProductType = "Accessory_Face",
    Sequence = 70,
    TabDefaultSlot = 999,
    TabId = 7,
    TabName = "UI_Dress_Face"
  },
  [17] = {
    Id = 17,
    ProductType = "Accessory_Waist",
    Sequence = 60,
    TabDefaultSlot = 999,
    TabId = 7,
    TabName = "UI_Dress_Waist"
  },
  [18] = {
    Id = 18,
    ProductType = "Accessory_Back",
    Sequence = 50,
    TabDefaultSlot = 999,
    TabId = 7,
    TabName = "UI_Dress_Back"
  }
})
