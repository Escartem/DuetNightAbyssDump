local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.GamePadBtn.ParentWidget = self
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
end

function M:FocusLost()
  self.IsFocus = false
  if not UIUtils.IsGamepadInput() then
    return
  end
  self:StopAnimation(self.GamePad_Hover)
  self:PlayAnimationReverse(self.GamePad_Hover)
end

function M:FocusReceived(MyGeometry, InFocusEvent)
  self.IsFocus = true
  if not UIUtils.IsGamepadInput() then
    return
  end
  self:StopAnimation(self.GamePad_Hover)
  self:PlayAnimation(self.GamePad_Hover)
end

function M:UpdateGameInputDevice()
  if not UIUtils.IsGamepadInput() then
    self:StopAnimation(self.GamePad_Hover)
    self.Bg:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif self.IsFocus then
    self.Bg:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:StopAnimation(self.GamePad_Hover)
    self:PlayAnimation(self.GamePad_Hover)
  end
end

return M
