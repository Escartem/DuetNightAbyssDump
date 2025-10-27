local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BagTab", {
  [2] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Mod",
    Sequence = 90,
    TabDefaultSlot = 999,
    TabId = 2,
    TabName = "UI_BAG_SUBTAB_NAME_MOD"
  },
  [3] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_ShopResource",
    Sequence = 100,
    TabDefaultSlot = 999,
    TabId = 3,
    TabName = "UI_BAG_SUBTAB_NAME_RESOURCE"
  },
  [4] = {
    HideSell = true,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Task",
    Sequence = 60,
    TabDefaultSlot = 999,
    TabId = 4,
    TabName = "UI_BAG_SUBTAB_NAME_TASK"
  },
  [5] = {
    HideSell = true,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Reading",
    Sequence = 50,
    TabDefaultSlot = 999,
    TabId = 5,
    TabName = "UI_BAG_SUBTAB_NAME_READ"
  },
  [6] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Angling00",
    Sequence = 65,
    TabDefaultSlot = 999,
    TabId = 6,
    TabName = "UI_BAG_SUBTAB_NAME_FISH"
  },
  [7] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Consumable",
    Sequence = 45,
    TabDefaultSlot = 999,
    TabId = 7,
    TabName = "UI_BAG_SUBTAB_NAME_CONSUMABLE"
  },
  [101] = {
    HideSell = true,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_CloseIn_Weapons.T_Tab_CloseIn_Weapons",
    Sequence = 80,
    TabDefaultSlot = 999,
    TabId = 101,
    TabName = "UI_BAG_SUBTAB_NAME_MELEEWEAPON"
  },
  [102] = {
    HideSell = true,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_RangedWeapon.T_Tab_RangedWeapon",
    Sequence = 70,
    TabDefaultSlot = 999,
    TabId = 102,
    TabName = "UI_BAG_SUBTAB_NAME_RNAGEWEAPON"
  }
})
