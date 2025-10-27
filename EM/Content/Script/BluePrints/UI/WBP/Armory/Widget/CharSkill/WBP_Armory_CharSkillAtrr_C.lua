require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Button_Area.OnClicked:Add(self, self.OnBtnClicked)
  self.Text_Effect:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Owner = Content.Owner
  self.Content.Widget = self
  self._OnAddedToFocusPath = Content.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Content.OnRemovedFromFocusPath
  Content.UI = self
  if Content.bHideBtn then
    self.Button_Area:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Button_Area:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  self.Text_Attribute:SetText(Content.Name)
  self.Num_Attribute:SetText(Content.Value)
  self.WidgetSwitcher_Arrow:SetActiveWidgetIndex(Content.Style or 0)
  self.Text_Effect:SetText(Content.Desc)
  if 0 == self.WidgetSwitcher_Arrow:GetActiveWidgetIndex() then
    if self.Text_Effect:GetText() ~= "" and not Content.bHideArrow then
      self.WidgetSwitcher_Arrow:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.WidgetSwitcher_Arrow:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
  else
    self.WidgetSwitcher_Arrow:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self._OnBtnClicked = Content.OnBtnClicked
  self.Owner = Content.Owner
  self.IsShowDesc = Content.IsShowDesc
  self:ShowDesc(self.IsShowDesc, false)
end

function M:ShowDesc(bShow, NeedAnim)
  self.IsShowDesc = bShow
  if bShow and self.Text_Effect:GetText() ~= "" then
    self.Text_Effect:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Icon_Arrow:SetRenderTransformAngle(-180)
    if NeedAnim then
      self:PlayAnimation(self.Click)
    end
  else
    self.Text_Effect:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Icon_Arrow:SetRenderTransformAngle(0)
  end
end

function M:OnBtnClicked()
  if self._OnBtnClicked then
    self._OnBtnClicked(self.Owner, self.Content)
  end
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
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Button_Area)
end

return M
