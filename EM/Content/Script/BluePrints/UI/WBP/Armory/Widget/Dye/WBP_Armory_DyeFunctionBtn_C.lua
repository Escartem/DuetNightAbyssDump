require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  if self.Panel_Name and CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.Panel_Name:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if self.Btn_Area and self.Btn_Area.HoverAnimName then
      self.Btn_Area.HoverAnimName = ""
    end
  end
end

function M:BindEvents(Obj, Events)
  Events = Events or {}
  self.Obj = Obj
  self._OnClicked = Events.OnClicked
  self._OnPressed = Events.OnPressed
  self._OnReleased = Events.OnReleased
  self._OnAddedToFocusPath = Events.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Events.OnRemovedFromFocusPath
  self:PlayAnimation(self.Normal)
end

function M:OnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  if self._OnClicked then
    self._OnClicked(self.Obj)
  end
end

function M:OnPressed()
  if self._OnPressed then
    self._OnPressed(self.Obj)
  end
end

function M:OnReleased()
  if self._OnReleased then
    self._OnReleased(self.Obj)
  end
end

function M:SetForbidden(bForbidden)
  self.Btn_Area:SetForbidden(bForbidden)
  self:StopAllAnimations()
  if bForbidden then
    self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Btn_Area:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_PlayHoverInForbid:SetVisibility(UIConst.VisibilityOp.Visible)
    self:PlayAnimation(self.Forbidden)
  else
    self:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Btn_Area:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Btn_PlayHoverInForbid:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:PlayAnimation(self.Normal)
  end
  if bForbidden and not self.InitBtn_PlayHoverInForbid then
    self.InitBtn_PlayHoverInForbid = true
    self.Btn_PlayHoverInForbid.OnHovered:Add(self, self.PlayAnimationHover)
    self.Btn_PlayHoverInForbid.OnUnhovered:Add(self, self.PlayAnimationUnHover)
  elseif not bForbidden and self.InitBtn_PlayHoverInForbid then
    self.InitBtn_PlayHoverInForbid = false
    self.Btn_PlayHoverInForbid.OnHovered:Remove(self, self.PlayAnimationHover)
    self.Btn_PlayHoverInForbid.OnUnhovered:Remove(self, self.PlayAnimationUnHover)
  end
end

function M:PlayAnimationHover()
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:PlayAnimationUnHover()
  self:StopAllAnimations()
  self:PlayAnimation(self.UnHover)
end

function M:GetForbidden()
  return self.Btn_Area:GetForbidden()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Btn_Area)
end

function M:OnAddedToFocusPath(InFocusEvent)
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Obj, self)
  end
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Obj, self)
  end
end

return M
