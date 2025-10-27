local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SigilWeaponTab", {
  [1] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_CloseIn_Weapons.T_Tab_CloseIn_Weapons",
    TabId = 1,
    Text = "UI_SigilWeaponTab_Meele"
  },
  [2] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_RangedWeapon.T_Tab_RangedWeapon",
    TabId = 2,
    Text = "UI_SigilWeaponTab_Ranged"
  }
})
