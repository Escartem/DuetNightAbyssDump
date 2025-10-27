require("UnLua")
local M = Class()

function M:InitItemInfo(ItemType, ItemId, UnitId)
  local RewardInfo = DataMgr.Reward[ItemId]
  self.Panel_Describe:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_LongDescribe:SetVisibility(RewardInfo.DetailDes == nil and ESlateVisibility.Collapsed or ESlateVisibility.Visible)
  self.Text_LongDescribe:SetText(GText(RewardInfo.DetailDes))
  self.ParentWidget.Panel_Hold:SetVisibility(ESlateVisibility.Collapsed)
end

return M
