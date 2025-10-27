local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ForgeTab", {
  [1] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_All.T_Tab_All",
    ProductType = "All",
    Sequence = 80,
    TabDefaultSlot = 999,
    TabId = 1,
    TabName = "UI_TAB_NAME_ALL"
  },
  [2] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Forging.T_Tab_Forging",
    ProductType = "Forging",
    Sequence = 20,
    TabDefaultSlot = 999,
    TabId = 2,
    TabName = "UI_TAB_NAME_FORGING"
  },
  [3] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_WaitForge.T_Tab_WaitForge",
    ProductType = "Ready",
    Sequence = 30,
    TabDefaultSlot = 999,
    TabId = 3,
    TabName = "UI_TAB_NAME_READY"
  },
  [4] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Weapon.T_Tab_Weapon",
    ProductType = "Weapon",
    Sequence = 70,
    TabDefaultSlot = 999,
    TabId = 4,
    TabName = "UI_SHOP_SUBTAB_NAME_WEAPON"
  },
  [5] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Mod.T_Tab_Mod",
    ProductType = "Mod",
    Sequence = 60,
    TabDefaultSlot = 999,
    TabId = 5,
    TabName = "UI_SHOP_SUBTAB_NAME_MOD"
  },
  [6] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_ShopResource.T_Tab_ShopResource",
    ProductType = "Resource",
    Sequence = 50,
    TabDefaultSlot = 999,
    TabId = 6,
    TabName = "UI_TAB_NAME_RESOURCE"
  },
  [7] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_ShopClothes.T_Tab_ShopClothes",
    ProductType = "CharAccessory",
    Sequence = 40,
    TabDefaultSlot = 999,
    TabId = 7,
    TabName = "UI_TAB_NAME_CHARACCESSORY"
  }
})
