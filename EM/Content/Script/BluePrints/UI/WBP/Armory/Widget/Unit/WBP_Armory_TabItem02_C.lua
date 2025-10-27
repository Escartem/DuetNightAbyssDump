require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Owner = Content.Owner
  self._OnAddedToFocusPath = Content.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Content.OnRemovedFromFocusPath
  self._OnFocusReceived = Content.OnFocusReceived
  self._OnFocusLost = Content.OnFocusLost
  self._OnKeyDown = Content.OnKeyDown
  Content.Widget = self
  self:SetText(Content.Text)
  self:SetNumber(Content.Number)
  self:SetIcon(Content.Icon or Content.IconPath)
  self.IsSelected = Content.IsSelected
  self:SetIsSelected(Content.IsSelected)
  self:SetReddot(Content.IsNew, Content.Upgradeable or Content.Unlockable)
  self:SetIsMaxLevel(Content.IsMaxLevel)
  self:ShowShadow(Content.bShadowed)
end

function M:ShowShadow(bShow)
  if bShow then
    self.Img_Shadow:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Img_Shadow:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.UI = nil
  end
end

function M:SetText(Text)
  self.TextBlock_Name:SetText(Text)
end

function M:SetNumber(Number)
  if Number then
    self.TextBlock_Num:SetText(Number)
    self.Panel_Num:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Panel_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SetIcon(Icon)
  if Icon then
    self.Image_Icon:SetBrushResourceObject(LoadObject(Icon))
  end
end

function M:SetIsMaxLevel(IsMaxLevel)
  if IsMaxLevel then
    self:SetMaxLevelColor()
  else
    self:SetNormalColor()
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

function M:OnKeyDown(MyGeometry, InKeyEvent)
  if self._OnKeyDown then
    return self._OnKeyDown(self.Owner, MyGeometry, InKeyEvent)
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnAddedToFocusPath(InFocusEvent)
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Owner, self.Content)
  end
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Owner, self.Content)
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self._OnFocusReceived then
    self._OnFocusReceived(self.Owner, self.Content)
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnFocusLost()
  if self._OnFocusLost then
    self._OnFocusLost(self.Owner, self.Content)
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
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnTouchStarted(MyGeometry, InTouchEvent)
  return UIUtils.Unhandled
end

function M:OnTouchEnded(MyGeometry, InTouchEvent)
  return UIUtils.Unhandled
end

return M
