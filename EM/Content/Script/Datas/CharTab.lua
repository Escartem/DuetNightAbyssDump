local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CharTab", {
  [1] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Attr",
    TabId = 1,
    Text = "UI_Armory_Attribute"
  },
  [2] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Skill",
    TabId = 2,
    Text = "UI_Armory_Skill"
  },
  [3] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_CardLevel",
    TabId = 3,
    Text = "UI_Armory_Trace"
  },
  [4] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_ShopClothes",
    TabId = 4,
    Text = "UI_Armory_Appearance"
  },
  [5] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Data",
    TabId = 5,
    Text = "UI_Armory_Information"
  }
})
