require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  M.Super.Construct(self)
  self.IsPC = CommonUtils.GetDeviceTypeByPlatformName(self) == "PC"
  self.Btn.OnClicked:Add(self, self.OnButClicked)
  self.Btn.OnPressed:Add(self, self.OnPressed)
  self.Btn.OnHovered:Add(self, self.OnHovered)
  self.Btn.OnUnhovered:Add(self, self.OnUnhovered)
  self.MenuAnchor.OnGetMenuContentEvent:Bind(self, self.OnGetMenuContent)
  self.MenuAnchor.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
  self:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
end

function M:OnMenuOpenChanged(bIsOpen)
  if not bIsOpen then
    self:StopAllAnimations()
    self:PlayAnimation(self.Normal)
    self.IsSelect = false
  end
end

function M:OnButClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  if not self.MenuAnchor:IsOpen() then
    self.MenuAnchor:Open(true)
  end
  if self.Parent then
    self.Parent:OnClickedCell(self)
  end
end

function M:OnCellUnSelect()
  if not self.IsSelect then
    return
  end
  self:StopAllAnimations()
  self.IsSelect = false
  self:PlayAnimation(self.Normal)
end

function M:SelectCell()
  self.IsSelect = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
end

function M:OnGetMenuContent(Anchor)
  self.DeputeEvent = UIManager(self):_CreateWidgetNew("DeputeEvent")
  self.DeputeEvent.Text_Event:SetText(GText(self.Des))
  return self.DeputeEvent
end

function M:Init(IconPath, Des, Parent, Index)
  self:PlayAnimation(self.Normal)
  self:SetIcon(IconPath)
  self.Des = Des
  self.Parent = Parent
  self.Index = Index
end

function M:SetIcon(IconPath)
  local IconObj = LoadObject(string.format("Texture2D'%s'", IconPath))
  self.Img_Event:SetBrushFromTexture(IconObj)
end

function M:OnPressed()
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnHovered()
  if self.IsSelect or not self.IsPC then
    return
  end
  if not self.MenuAnchor:IsOpen() and UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    self.MenuAnchor:Open(true)
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnUnhovered()
  if self.IsSelect or not self.IsPC then
    return
  end
  if self.MenuAnchor:IsOpen() and UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    self.MenuAnchor:Close()
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadDown(InKeyName)
  DebugPrint("SL OnGamePadDown is InKeyName", InKeyName)
  local IsEventHandled = false
  if "Gamepad_FaceButton_Right" == InKeyName and self.MenuAnchor:IsOpen() then
    self.MenuAnchor:Close()
    self:SetFocus()
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self.Parent:UpdatKeyDisplay("EventWidget")
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

return M
