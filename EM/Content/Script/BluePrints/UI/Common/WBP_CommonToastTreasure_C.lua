require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local ShowMessage, Duration = ...
  self.Panel_Main:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Toast:SetText(GText("UI_Explore_Treasure_Complete"))
  self.Text_Title:SetText(ShowMessage)
  if Duration > 0 then
    self:AddTimer(Duration, self.Close, false, 0, "TreasureToast", true)
  end
end

return M
