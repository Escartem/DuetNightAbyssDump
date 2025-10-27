require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Btn_Click.OnClicked:Add(self, self.SetClickState)
  self.Btn_Click.OnPressed:Add(self, self.SetPressState)
  self.Btn_Click.OnHovered:Add(self, self.SetHoverState)
  self.Btn_Click.OnUnhovered:Add(self, self.SetNormalState)
  self.bIsFocusable = true
end

function M:Init(Parent, TraceId, IsLock)
  self.Parent = Parent
  self.TraceId = TraceId
  self.IsLock = IsLock
  self.IsClick = false
  self.Text_TraceAbilityTitle:SetText(GText("UI_ROOT_" .. self.TraceId))
  self:SetReddotState(false)
end

function M:SetNormalState()
  if self.IsClick then
    return
  end
  self:StopAllAnimations()
  if self.IsLock then
    self:PlayAnimation(self.Locked_Normal)
  else
    self:PlayAnimation(self.UnLocked_Normal)
  end
end

function M:SetClickState()
  if self.IsClick then
    return
  end
  self.IsClick = true
  self:StopAllAnimations()
  if self.IsLock then
    self:PlayAnimation(self.Locked_Click)
  else
    self:PlayAnimation(self.UnLocked_Click)
  end
  self:SetReddotState(false)
  self.Parent:OnClickTraceItem(self.TraceId)
end

function M:SetHoverState()
  if self.IsClick then
    return
  end
  self:StopAllAnimations()
  if self.IsLock then
    self:PlayAnimation(self.Locked_Hover)
  else
    self:PlayAnimation(self.UnLocked_Hover)
  end
end

function M:SetPressState()
  if self.IsClick then
    return
  end
  self:StopAllAnimations()
  if self.IsLock then
    self:PlayAnimation(self.Locked_Press)
  else
    self:PlayAnimation(self.UnLocked_Press)
  end
end

function M:SetReddotState(IsShow)
  if IsShow then
    self.Common_Item_Subsize_Reddot_PC:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Common_Item_Subsize_Reddot_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:PlayUnLockAnim()
  self:PlayAnimation(self.UnLock)
  self.IsLock = false
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Btn_Click)
end

return M
