local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ShowCaseTab", {
  [1] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Role",
    TabId = 1,
    TabName = "UI_PersonInfo_ShowCase_Char"
  },
  [2] = {
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Weapon",
    TabId = 2,
    TabName = "UI_PersonInfo_ShowCase_Weapon"
  }
})
