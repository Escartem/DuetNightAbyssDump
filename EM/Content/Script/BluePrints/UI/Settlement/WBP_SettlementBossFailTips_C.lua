require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.Btn_Go.OnClicked:Add(self, self.OnClicked)
  self.Btn_Go.OnPressed:Add(self, self.OnPressed)
  self.Controller:CreateGamepadKey("Y")
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self.CurInputDeviceType = self.GameInputModeSubsystem:GetCurrentInputType()
end

function M:OnListItemObjectSet(ListItemObject)
  ListItemObject.SelfWidget = self
  self.Info = ListItemObject
  self.Owner = self.Info.Owner
  self.Text_Tip:SetText(GText(self.Info.Title))
  self.WorldText_Tip:SetText(EnText(self.Info.Title))
  self.Text_Desc:SetText(GText(self.Info.Text))
  self.Icon:SetBrushResourceObject(self.Info.Icon)
  self.Text_Go:SetText(GText("UI_FailureTips_JumpText"))
  if not self.Info.JumpId then
    self.Panel_Button:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if 1 == self.Info.Index then
    if self.Owner then
      self.Owner.List_Tips:SetSelectedIndex(0)
    end
    self:SetFocus()
  end
  self:SetNormal()
end

function M:SetNormal()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:OnClicked()
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  if self.Info.JumpId and 0 ~= self.Info.JumpId then
    PageJumpUtils:JumpToTargetPageByJumpId(self.Info.JumpId)
  end
end

function M:OnPressed()
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnMouseLeave(MyGeometry, MouseEvent)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.UnHover)
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self:UpdateOnInputDeviceTypeChange()
end

function M:UpdateOnInputDeviceTypeChange()
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad then
    self.Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.Controller:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:OnFocusLost(InFocusEvent)
  self.Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

return M
