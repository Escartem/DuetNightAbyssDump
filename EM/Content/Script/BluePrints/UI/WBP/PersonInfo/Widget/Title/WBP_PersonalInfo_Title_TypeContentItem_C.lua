require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  if Content.IsNew then
    self.New:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if not Content or not Content.FrameId then
    self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    return
  end
  self.Content = Content
  Content.UI = self
  self.Btn_Area.OnClicked:Clear()
  self.Btn_Area.OnClicked:Add(Content.Father, function()
    Content.Father:OnItemClicked(Content)
  end)
  self:InitSelect()
  self:SetIsEquipped(Content.bEquipped)
  self.Title:ClearChildren()
  local Widget = UIManager(self):LoadTitleFrameWidget(Content.FrameId)
  if Widget then
    Widget.Text_Title:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Title:AddChildToOverlay(Widget)
  end
end

function M:OnAddedToFocusPath()
  ScreenPrint("OnAddedToFocusPath")
  self.Content.FocusEvent(self.Content.FocusEventObj, self.Content, self)
end

function M:InitSelect()
  if self.Content and self.Content.bSelect then
    self.Btn_Area:SetChecked(true)
    self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Btn_Area:SetChecked(false)
    self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:SetIsEquipped(bIsEquipped)
  if bIsEquipped then
    self:PlayAnimation(self.Select)
  elseif self.Content.bEquipped then
    self:PlayAnimationReverse(self.Select)
  end
  self.Content.bEquipped = bIsEquipped
end

function M:SetIsSelected(bIsSelect)
  self.Content.bSelect = bIsSelect
  if bIsSelect then
    if not self.Btn_Area:IsChecked() then
    end
    if self.Content.IsNew then
      self.Content.IsNew = false
      UIUtils.TrySubReddotCacheDetailNumber(self.Content.FrameId, "TitleFrame")
      self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Btn_Area:SetCheckedNoNotify(false)
    self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

return M
