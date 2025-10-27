local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ArmoryTab", {
  [1] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Role",
    TabId = 1,
    Text = "UI_Armory_Char"
  },
  [2] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_CloseIn_Weapons",
    TabId = 2,
    Text = "UI_Armory_Meleeweapon"
  },
  [3] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_RangedWeapon",
    TabId = 3,
    Text = "UI_Armory_Longrange"
  },
  [4] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_UWeapon",
    TabId = 4,
    Text = "UI_Armory_Signatureweapon"
  },
  [5] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Pet",
    TabId = 5,
    Text = "MAIN_UI_PET"
  },
  [6] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_WheelDisc",
    TabId = 6,
    Text = "UI_Armory_BattleBag"
  }
})
