require("UnLua")
local M = Class({
  "BluePrints.UI.WBP.Team.View.WBP_Team_PlayerItem_Base"
})

function M:Construct()
  M.Super.Construct(self)
  UIManager(self):GetGameInputModeSubsystem().OnInputMethodChanged:Add(self, self.OnInputDeviceChange)
  self:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self:OnInputDeviceChange()
end

function M:OnInputDeviceChange()
  if TeamController:IsGamepad() then
    self.bIsFocusable = true
  elseif not TeamController:IsMobile() then
    self.bIsFocusable = false
  end
end

function M:Destruct()
  UIManager(self):GetGameInputModeSubsystem().OnInputMethodChanged:Remove(self, self.OnInputDeviceChange)
  self:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Escape)
  M.Super.Destruct(self)
end

function M:OnMenuOpenChanged(bOpen)
  self.Owner:OnMenuOpenChanged(bOpen)
  if bOpen then
    self.Owner.bOpenBtnList = true
    self.Owner.OpenedUid = self.Member.Uid
    return
  end
  if bOpen and self.bOpenMenu then
    return
  end
  self.Button_Area:SetChecked(false)
  self.Owner:SetFocus()
  self.Owner.bOpenBtnList = false
  self.Owner.OpenedUid = nil
end

return M
