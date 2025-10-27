require("UnLua")
local UIUtils = require("Utils.UIUtils")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
local DispatchLevelEnum = {
  Perfect = 0,
  BigSuccess = 1,
  Success = 2,
  Fail,
  3
}

function M:OnListItemObjectSet(Content)
  Content.UI = self
  if Content.Level == DispatchLevelEnum.Perfect then
    local Path = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_Rank_SS.T_Map_Rank_SS")
    self.Icon_Rank:SetBrushResourceObject(Path)
    self.Text_Status:SetText(GText("UI_Disptach_Perfect"))
  elseif Content.Level == DispatchLevelEnum.BigSuccess then
    local Path = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_Rank_S.T_Map_Rank_S")
    self.Icon_Rank:SetBrushResourceObject(Path)
    self.Text_Status:SetText(GText("UI_Disptach_BigSuccess"))
  elseif Content.Level == DispatchLevelEnum.Success then
    local Path = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_Rank_A.T_Map_Rank_A")
    self.Icon_Rank:SetBrushResourceObject(Path)
    self.Text_Status:SetText(GText("UI_Disptach_Success"))
  else
    local Path = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_Rank_B.T_Map_Rank_B")
    self.Icon_Rank:SetBrushResourceObject(Path)
    self.Text_Status:SetText(GText("UI_Disptach_Fail"))
  end
  self:SetRewardList(Content.RewardId)
end

function M:SetRewardList(RewardId)
  if nil == RewardId then
    return
  end
  local RewardInfo = DataMgr.Reward[RewardId]
  if RewardInfo then
    local Ids = RewardInfo.Id or {}
    local RewardCount = RewardInfo.Count or {}
    local TableName = RewardInfo.Type or {}
    for i = 1, #Ids do
      local ItemId = Ids[i]
      local Count = RewardUtils:GetCount(RewardCount[i])
      local Icon = ItemUtils.GetItemIconPath(ItemId, TableName[i])
      local Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
      local ItemType = TableName[i]
      local RewardContent = NewObject(UIUtils.GetCommonItemContentClass())
      RewardContent.Id = ItemId
      RewardContent.Count = Count
      RewardContent.Icon = Icon
      RewardContent.Rarity = Rarity
      RewardContent.ItemType = ItemType
      RewardContent.IsShowDetails = true
      self.List_Reward:AddItem(RewardContent)
    end
  end
  self:AddTimer(0.01, function()
    local ListItemUIs = self.List_Reward:GetDisplayedEntryWidgets()
    local CurCount = ListItemUIs:Length()
    local Count = UIUtils.GetTileViewContentMaxCount(self.List_Reward)
    if CurCount <= Count then
      self.List_Reward:DisableScroll(true)
    else
      self.List_Reward:DisableScroll(false)
    end
    self.List_Reward:SetEmptyGridItemCount(0)
  end)
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self.List_Reward:NavigateToIndex(0)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.List_Reward)
end

return M
