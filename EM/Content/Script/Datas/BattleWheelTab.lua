local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("BattleWheelTab", {
  [1] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_All.T_Tab_All",
    TabId = 1
  },
  [2] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Item.T_Tab_Item",
    TabId = 2
  },
  [3] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Action.T_Tab_Action",
    TabId = 3
  },
  [4] = {
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Phantom.T_Tab_Phantom",
    TabId = 4
  }
})
