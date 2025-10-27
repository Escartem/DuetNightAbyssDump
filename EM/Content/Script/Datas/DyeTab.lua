local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DyeTab", {
  [1] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Attr",
    TabId = 1,
    Text = "UI_Armory_Attribute"
  },
  [2] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_WeaponCardlevel",
    TabId = 2,
    Text = "UI_WeaponStrength_Strengthen"
  }
})
