require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_item.OnClicked:Add(self, self.OnBtnItemClicked)
  self.Btn_Item.OnHovered:Add(self, self.OnBtnItemHovered)
  self.Btn_Item.OnUnhovered:Add(self, self.OnBtnItemUnhovered)
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.ParentWidget = Content.ParentWidget
  self.Text_num_nor:SetText(Content.Index)
  self.Content.UI = self
  if Content.IsLock then
    self:PlayAnimation(self.Lock)
  else
    self:PlayAnimation(self.Lock_Normal)
  end
end

function M:OnBtnItemHovered()
  if self.ParentWidget.SelectedIndex == self.Content.Index then
    return
  end
  self:PlayAnimation(self.Hover)
end

function M:OnBtnItemUnhovered()
  if self.ParentWidget.SelectedIndex == self.Content.Index then
    return
  end
  self:PlayAnimation(self.Unhover)
end

function M:OnBtnItemClicked()
  self.ParentWidget:OnBtnItemClicked(self.Content.Index)
end

function M:StopAllRegularAnimations()
  self:StopAnimation(self.Hover)
  self:StopAnimation(self.Unhover)
  self:StopAnimation(self.Click)
  self:StopAnimation(self.Normal)
end

return M
