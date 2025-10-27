local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("AppearanceTab", {
  [1] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Attr",
    TabId = 1,
    Text = "UI_Armory_Appearance"
  },
  [2] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_WeaponCardlevel",
    TabId = 2,
    Text = "UI_Armory_Dress"
  }
})
