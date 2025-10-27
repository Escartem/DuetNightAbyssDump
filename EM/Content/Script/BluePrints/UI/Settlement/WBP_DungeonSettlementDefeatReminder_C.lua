local M = Class("BluePrints.UI.Settlement.WBP_DungeonSettlementReminder_C")

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
  local HeadLineText_Fail = GText("UI_MISSION_FAIL")
  self.Text_Headline:SetText(HeadLineText_Fail)
end

return M
