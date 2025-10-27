local M = Class("BluePrints.UI.Settlement.WBP_DungeonSettlementReminder_C")

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
  local HeadLineText_Win = GText("UI_MISSION_COMPLETE")
  self.Text_Headline:SetText(HeadLineText_Win)
end

return M
