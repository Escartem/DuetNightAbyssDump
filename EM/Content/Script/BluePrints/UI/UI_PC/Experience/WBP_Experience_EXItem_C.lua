require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Avatar = GWorld:GetAvatar()
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Entry = self
  self.MainPlayerChar = 0
  local IdTable = {}
  if 1 == Content.ID then
    for _, CharInfo in pairs(DataMgr.Char) do
      if not CharInfo.IsNotOpen and CharInfo.CollectRewardExp then
        if CharInfo.GenderTag then
          if CharInfo.GenderTag == self.Avatar.Sex then
            table.insert(IdTable, CharInfo.CharId)
            self.MainPlayerChar = self.MainPlayerChar + 1
          end
        else
          table.insert(IdTable, CharInfo.CharId)
        end
      end
    end
  elseif 2 == Content.ID then
    for _, WeaponInfo in pairs(DataMgr.Weapon) do
      if not WeaponInfo.IsNotOpen and WeaponInfo.CollectRewardExp then
        table.insert(IdTable, WeaponInfo.WeaponId)
      end
    end
  elseif 3 == Content.ID then
    local GUIDTable = {}
    for _, PetInfo in pairs(DataMgr.Pet) do
      if PetInfo.GUID and PetInfo.CollectRewardExp then
        GUIDTable[PetInfo.GUID] = 1
      end
    end
    for GUID, _ in pairs(GUIDTable) do
      table.insert(IdTable, GUID)
    end
  elseif 4 == Content.ID then
    for _, ModInfo in pairs(DataMgr.Mod) do
      if not ModInfo.IsNotOpen and ModInfo.CollectRewardExp then
        table.insert(IdTable, ModInfo.Id)
      end
    end
  elseif 5 == Content.ID then
  end
  local PlayerExpSubSource = {}
  for _, SubSourceInfo in pairs(DataMgr.PlayerExpSubSource) do
    if SubSourceInfo.Source == Content.ID then
      table.insert(PlayerExpSubSource, SubSourceInfo)
    end
  end
  table.sort(PlayerExpSubSource, function(a, b)
    return a.Sequence > b.Sequence
  end)
  local SumCollectRewardExp = 0
  local SumCanGetRewardExp = 0
  self.List_Attr:ClearListItems()
  for Index, SubSourceInfo in pairs(PlayerExpSubSource) do
    local SubContent = NewObject(UIUtils.GetCommonItemContentClass())
    if 5 ~= SubSourceInfo.Source then
      local Data = DataMgr[SubSourceInfo.Key]
      local CanGetRewardExp = 0
      for _, Id in pairs(IdTable) do
        local Info = Data[Id]
        if Info then
          CanGetRewardExp = CanGetRewardExp + self:GetCanGetRewardExp(Info, SubSourceInfo.Key)
        end
      end
      SumCanGetRewardExp = SumCanGetRewardExp + CanGetRewardExp
      SubContent.CanGetRewardExp = CanGetRewardExp
    else
      SubContent.CanGetRewardExp = nil
      SumCanGetRewardExp = nil
    end
    local CollectRewardExp = 0
    if Content.CollectRewardExpRecord[SubSourceInfo.Key] then
      CollectRewardExp = Content.CollectRewardExpRecord[SubSourceInfo.Key].Exp
    end
    SumCollectRewardExp = SumCollectRewardExp + CollectRewardExp
    SubContent.CollectRewardExp = CollectRewardExp
    SubContent.ID = SubSourceInfo.ID
    SubContent.SubSourceName = SubSourceInfo.SubSourceName
    if "Char" == SubSourceInfo.Key or "Weapon" == SubSourceInfo.Key or "Pet" == SubSourceInfo.Key or "Mod" == SubSourceInfo.Key then
      SubContent.TotalNum = #IdTable
      SubContent.CurNum = 0
      if Content.CollectRewardExpRecord[SubSourceInfo.Key] then
        SubContent.CurNum = Content.CollectRewardExpRecord[SubSourceInfo.Key].Count
      end
      if "Char" == SubSourceInfo.Key then
        SubContent.TotalNum = SubContent.TotalNum - (self.MainPlayerChar or 0)
      end
    else
      SubContent.TotalNum = nil
      SubContent.CurNum = nil
    end
    self.List_Attr:AddItem(SubContent)
  end
  self.Text_Describe_Title:SetText(GText(Content.SourceName))
  self.Text_TitleNum:SetText(SumCollectRewardExp)
  if SumCanGetRewardExp then
    self.Text_TitleNum_All:SetText("/" .. SumCanGetRewardExp)
    self.Text_TitleNum_All:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Text_TitleNum_All:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:GetCanGetRewardExp(Info, Key)
  local CollectRewardExp = 0
  if type(Info) == "table" then
    if Info.CollectRewardExp then
      if "WeaponCardLevel" == Key then
        if Info.CardLevelMax then
          return Info.CollectRewardExp * Info.CardLevelMax
        else
          return Info.CollectRewardExp
        end
      else
        return Info.CollectRewardExp
      end
    else
      for _, SubInfo in pairs(Info) do
        CollectRewardExp = CollectRewardExp + self:GetCanGetRewardExp(SubInfo, Key)
      end
    end
  end
  return CollectRewardExp
end

return M
