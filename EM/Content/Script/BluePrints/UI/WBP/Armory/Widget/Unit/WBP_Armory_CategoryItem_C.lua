require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  self.Content = Content
  Content.UI = self
  self:SetIcon(Content.Icon)
  self:FlushAnimations()
  self.IsSelected = Content.IsSelected
  self:SetIsSelected(Content.IsSelected)
  self:ShowRecommend(Content.bShowRecommend)
  self.Owner = Content.Owner
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.UI = nil
  end
end

function M:SetIcon(Icon)
  if type(Icon) == "string" then
    self.Image_Attribute:SetBrushResourceObject(LoadObject(Icon))
  else
    self.Image_Attribute:SetBrushResourceObject(Icon)
  end
end

function M:ShowRecommend(bShowRecommend)
  if bShowRecommend then
    self.Tag_Recommend:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Tag_Recommend:SetVisibility(UIConst.VisibilityOp.Collapsed)
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
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  if self.IsSelected then
    return
  end
  self:StopAnimation(self.UnHover)
  self:PlayAnimation(self.Hover)
end

function M:OnMouseLeave(MouseEvent)
  if self.IsSelected then
    return
  end
  self:StopAnimation(self.Press)
  self:StopAnimation(self.Hover)
  self:PlayAnimation(self.UnHover)
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
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnTouchStarted(MyGeometry, InTouchEvent)
  return UIUtils.Unhandled
end

function M:OnTouchEnded(MyGeometry, InTouchEvent)
  return UIUtils.Unhandled
end

function M:OnFocusReceived()
  if self.Owner then
    if self.Owner.IsFromListContent and self.Owner.CurFilterItem then
      self.Owner.CurFilterItem.UI:SetFocus()
      self.Owner.EMListView_Filter:BP_SetSelectedItem(self.Owner.CurFilterItem)
      self.Owner.IsFromListContent = false
    else
      self.Owner.CurFilterItem = self.Content
      self.Owner:OnFilterListItemClicked(self.Content)
    end
  end
  return UIUtils.Unhandled
end

return M
