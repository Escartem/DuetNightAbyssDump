require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  Content.Widget = self
  self:SetIcon(Content.Icon or Content.IconPath, 0)
  self:StopAllAnimations()
  self:FlushAnimations()
  self.IsSelected = Content.IsSelected
  self:SetIsSelected(Content.IsSelected)
  self:SetReddot(Content.IsNew, Content.Upgradeable)
end

function M:SetIcon(Icon, SwitcherIdx)
  SwitcherIdx = SwitcherIdx or 0
  self.WidgetSwitcher_Head:SetActiveWidgetIndex(SwitcherIdx)
  local ImgWidget = self.WidgetSwitcher_Head:GetChildAt(SwitcherIdx)
  local IconDynaMaterial = ImgWidget:GetDynamicMaterial()
  if IconDynaMaterial then
    if type(Icon) == "string" then
      IconDynaMaterial:SetTextureParameterValue("IconMap", LoadObject(Icon))
    else
      IconDynaMaterial:SetTextureParameterValue("IconMap", Icon)
    end
  end
end

function M:SetReddot(ShowNew, ShowReddot)
  if ShowNew then
    self.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if ShowReddot then
      self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.Widget = nil
  end
end

function M:SetIsSelected(IsSelected)
  self.IsSelected = IsSelected
  if IsSelected then
    self:StopAllAnimations()
    self:PlayAnimation(self.Click)
  else
    self:StopAnimation(self.Click)
    self:PlayAnimation(self.Normal)
  end
  self:FlushAnimations()
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  if self.IsSelected then
    return
  end
  self:PlayAnimationForward(self.Hover)
end

function M:OnMouseLeave(MouseEvent)
  if self.IsSelected then
    return
  end
  self:StopAnimation(self.Press)
  self:PlayAnimationReverse(self.Hover)
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  if self.IsSelected then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  self:PlayAnimation(self.Press)
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  if self.IsSelected then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  if self:IsHovered() then
    self:OnMouseEnter()
  else
    self:PlayAnimation(self.Normal)
  end
  AudioManager(self):PlayItemSound(self, self.Content.UnitId, "Click", self.Content.Type)
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnTouchStarted(MyGeometry, InTouchEvent)
  return self:OnMouseButtonDown(MyGeometry, InTouchEvent)
end

function M:OnTouchEnded(MyGeometry, InTouchEvent)
  return self:OnMouseButtonUp(MyGeometry, InTouchEvent)
end

function M:OnRemovedFromFocusPath(MyGeometry, InTouchEvent)
  return self:OnMouseButtonUp(MyGeometry, InTouchEvent)
end

return M
