local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PetTab", {
  [1] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Attr",
    TabId = 1,
    Text = "UI_Armory_Attribute"
  },
  [2] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Ability.T_Tab_Ability",
    TabId = 2,
    Text = "Pet_Affix"
  }
})
