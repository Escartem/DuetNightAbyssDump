require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Area.OnClicked:Add(self, self.OnClicked)
  self.Btn_Area.OnPressed:Add(self, self.OnPressed)
  self.Btn_Area.OnHovered:Add(self, self.OnHovered)
  self.Btn_Area.OnUnhovered:Add(self, self.OnUnhovered)
  self.Btn_Area.OnReleased:Add(self, self.OnReleased)
  self.Panel_Used:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.Panel_Save then
    self.Panel_Save:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Widget = self
  self.Owner = Content.Owner
  self._OnAddedToFocusPath = Content.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Content.OnRemovedFromFocusPath
  self:StopAllAnimations()
  self:FlushAnimations()
  self:SetColor(Content)
  self:SetIsSelected(Content.IsSelected)
  self:SetIsClicked(Content.IsClicked, 1000)
  if self.Owner.OpenPreviewDyeFromChat then
    self:SetIsSaveInDraft(false)
  else
    self:SetIsSaveInDraft(Content.IsSaveInDraft)
  end
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.Widget = nil
  end
end

function M:SetColor(Content)
  self.Color_Lump.Brush.TintColor.SpecifiedColor = Content.Color
end

function M:SetIsSelected(IsSelected)
  if IsSelected then
    self.Panel_Used:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Panel_Used:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SetIsSaveInDraft(IsSaveInDraft)
  if not self.Panel_Save then
    return
  end
  if IsSaveInDraft and self.Panel_Used:GetVisibility() == UIConst.VisibilityOp.Collapsed then
    self.Panel_Save:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Panel_Save:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnPressed()
  if self.Content.IsClicked then
    return
  end
  self:PlayAnimationForward(self.Press)
end

function M:SetIsClicked(IsClicked, Speed)
  if IsClicked then
    self:StopAllAnimations()
    self:PlayAnimation(self.Click, 0, 1, 0, Speed or 1)
  else
    self:StopAnimation(self.Click)
    self:FlushAnimations()
    self:PlayAnimation(self.Normal, 0, 1, 0)
  end
end

function M:OnHovered()
  if self.Content.Event_OnHovered then
    self.Content.Event_OnHovered(self.Content.Owner, self.Content)
  end
  if self.Content.IsClicked then
    return
  end
  self:PlayAnimationForward(self.Hover)
end

function M:OnUnhovered()
  if self.Content.Event_OnUnhovered then
    self.Content.Event_OnUnhovered(self.Content.Owner, self.Content)
  end
  if self.Content.IsClicked then
    return
  end
  self:PlayAnimationReverse(self.Hover)
end

function M:OnClicked()
  if self.Content.Event_OnClicked then
    self.Content.Event_OnClicked(self.Content.Owner, self.Content)
  end
  if self.OpenPreviewDyeFromChat then
    return
  end
  if self.Content.IsClicked then
    return
  end
  self.Content.IsClicked = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
end

function M:OnReleased()
  if self.Content.IsClicked then
    return
  end
  self:PlayAnimationReverse(self.Press)
end

function M:OnAddedToFocusPath()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Owner, self.Content)
  end
end

function M:OnRemovedFromFocusPath()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Owner, self.Content)
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Btn_Area)
end

return M
