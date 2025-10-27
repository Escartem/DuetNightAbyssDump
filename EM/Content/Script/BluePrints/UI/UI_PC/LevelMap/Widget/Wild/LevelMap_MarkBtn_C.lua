require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
end

function M:OnAddedToFocusPath(MyGeometry, InFocusEvent)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self.Btn.OnClicked:Broadcast()
    self:PlayAnimation(self.Click)
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

function M:OnRemovedFromFocusPath(MyGeometry, InFocusEvent)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:PlayAnimation(self.Normal)
  end
  return UWidgetBlueprintLibrary.Unhandled()
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  return self.Parent:OnKeyDown(MyGeometry, InKeyEvent)
end

return M
