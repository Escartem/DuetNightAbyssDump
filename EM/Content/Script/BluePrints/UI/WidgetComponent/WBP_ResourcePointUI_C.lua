require("UnLua")
local WBP_ResourcePointUI_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_ResourcePointUI_C:InitConfig(Owner)
  self.StyleNodeName = "Blood_Shield"
  if Level == nil then
  end
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.BgWidget)
  self[self.StyleNodeName]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.RootWidget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.RootWidget:SetRenderOpacity(0.0)
  self.Owner = Owner
end

function WBP_ResourcePointUI_C:CheckIsShowByType(StyleNodeName)
  if nil == self[StyleNodeName] then
    return false
  end
  if not self.bCanShow then
    return true
  end
  return self.RootWidget:GetRenderOpacity() >= 1.0 and self[StyleNodeName]:GetRenderOpacity() >= 1.0 and self:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible
end

function WBP_ResourcePointUI_C:AdaptShieldBarAndBloodBar(ShieldTotalPercent, BloodTotalPercent, MaxBloodValue, NowBloodValue, MaxShieldValue, NowShieldValue, IsNeedShowBillboard)
end

function WBP_ResourcePointUI_C:ReceiveSetVisibility()
  self.Overridden.ReceiveSetVisibility(self)
end

return WBP_ResourcePointUI_C
