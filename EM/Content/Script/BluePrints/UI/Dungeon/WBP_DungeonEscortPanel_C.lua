require("UnLua")
local M = Class({
  "BluePrints.UI.Dungeon.WBP_EscortPanelBase_C"
})

function M:HideSelfAndSubWidget()
  self:SetVisibility(ESlateVisibility.Collapsed)
  self.Panel_Progress:SetVisibility(ESlateVisibility.Collapsed)
  self.Panel_SpeedUp:SetVisibility(ESlateVisibility.Collapsed)
  self.Panel_Slowest:SetVisibility(ESlateVisibility.Collapsed)
  self.Panel_Fastest:SetVisibility(ESlateVisibility.Collapsed)
  self.Panel_SlowDown:SetVisibility(ESlateVisibility.Collapsed)
end

function M:ShowSelfAndSubWidget()
  self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Panel_Progress:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function M:InitText()
  self.Text_Fastest:SetText(GText("DUNGEON_HIJACK_109"))
  self.Text_Slowest:SetText(GText("DUNGEON_HIJACK_108"))
  self.Text_SpeedUp:SetText(GText("DUNGEON_HIJACK_110"))
  self.Text_SlowDown:SetText(GText("DUNGEON_HIJACK_111"))
end

function M:OnPanelChange()
  self:StopAnimation(self.Fastest)
  self:StopAnimation(self.SlowDown)
  self:StopAnimation(self.SpeedUp)
end

function M:UpdateHp(Percent)
end

function M:UpdateLength(Percent)
  self.Bar_Progress:SetPercent(Percent)
end

return M
