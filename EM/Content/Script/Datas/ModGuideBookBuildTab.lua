local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ModGuideBookBuildTab", {
  [1] = {
    Name = "UI_Armory_Char",
    TabId = 1
  },
  [2] = {
    Name = "UI_BAG_Meleeweapon",
    TabId = 2
  },
  [3] = {
    Name = "UI_BAG_Longrange",
    TabId = 3
  }
})
