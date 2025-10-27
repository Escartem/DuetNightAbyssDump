local ForgeConst = {}
local ForgeSTabData = DataMgr.ForgeSTab
ForgeConst.DefaultForgeTargetMaxNum = 5
ForgeConst.TabType = {
  All = "All",
  Producing = "Forging",
  ToBeProduced = "Ready",
  Weapon = "Weapon",
  Mod = "Mod",
  Resource = "Resource",
  CharAccessory = "CharAccessory"
}
ForgeConst.SubTabType = {}
for Index, STabData in pairs(ForgeSTabData) do
  ForgeConst.SubTabType[STabData.ProductType] = STabData.Id
end
ForgeConst.TabType2SubTabType = {}
for Index, STabData in pairs(ForgeSTabData) do
  local TabData = DataMgr.ForgeTab[STabData.TabId]
  if TabData then
    local TabType = TabData.ProductType
    if TabType then
      ForgeConst.TabType2SubTabType[TabType] = ForgeConst.TabType2SubTabType[TabType] or {}
      table.insert(ForgeConst.TabType2SubTabType[TabType], STabData.Id)
    end
  end
end
for _, Data in pairs(ForgeConst.TabType2SubTabType) do
  table.sort(Data, function(a, b)
    return ForgeSTabData[a].Sequence > ForgeSTabData[b].Sequence
  end)
end
ForgeConst.SubTabTitleName = {}
for Index, STabData in pairs(ForgeSTabData) do
  ForgeConst.SubTabTitleName[STabData.Id] = STabData.TabName
end
ForgeConst.ProductType = {
  Weapon = 0,
  Mod = 1,
  Other = 2
}
ForgeConst.DraftState = {
  NotStarted = 0,
  InProgress = 1,
  Complete = 2
}
ForgeConst.PathItemDraftState = {
  CanProduce = 0,
  Producing = 1,
  ConditionsNotMet = 2,
  CantProduce = 3
}
ForgeConst.BottomKeyTypes = {
  BottomKey_Back = 0,
  BottomKey_Confirm = 1,
  BottomKey_SetTarget = 2,
  BottomKey_UnSetTarget = 3,
  BottomKey_ShowItem = 4,
  BottomKey_ShowDetails = 5,
  BottomKey_Keyboard_Esc = 6,
  BottomKey_Keyboard_Space = 7
}
ForgeConst.ControllerFSMStates = {
  NormalPage_NoFocus = 0,
  NormalPage_FocusItem = 1,
  NormalPage_ShowItem = 2,
  NormalPage_FocusSort = 3,
  PathPage_Normal = 4
}
ForgeConst.CompendiumTabType = {
  1,
  4,
  5,
  6,
  7
}
ForgeConst.NewdotNodeName = {
  Root = "ForgeNewdotRoot",
  [ForgeConst.TabType.All] = "ForgeNewdot_All",
  [ForgeConst.TabType.Producing] = "ForgeNewdot_Producing",
  [ForgeConst.TabType.ToBeProduced] = "ForgeNewdot_ToBeProduced",
  [ForgeConst.TabType.Weapon] = "ForgeNewdot_Weapon",
  [ForgeConst.TabType.Mod] = "ForgeNewdot_Mod",
  [ForgeConst.TabType.Resource] = "ForgeNewdot_Resource",
  [ForgeConst.TabType.CharAccessory] = "ForgeNewdot_CharAccessory"
}
for _, STabData in pairs(ForgeSTabData) do
  ForgeConst.NewdotNodeName[STabData.Id] = "ForgeNewdot_" .. STabData.ProductType
end
ForgeConst.ReddotNodeName = {
  Root = "ForgeReddotRoot",
  [ForgeConst.TabType.All] = "ForgeReddot_All",
  [ForgeConst.TabType.Producing] = "ForgeReddot_Producing",
  [ForgeConst.TabType.ToBeProduced] = "ForgeReddot_ToBeProduced",
  [ForgeConst.TabType.Weapon] = "ForgeReddot_Weapon",
  [ForgeConst.TabType.Mod] = "ForgeReddot_Mod",
  [ForgeConst.TabType.Resource] = "ForgeReddot_Resource",
  [ForgeConst.TabType.CharAccessory] = "ForgeReddot_CharAccessory"
}
for _, STabData in pairs(ForgeSTabData) do
  ForgeConst.ReddotNodeName[STabData.Id] = "ForgeReddot_" .. STabData.ProductType
end
return ForgeConst
