require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.BtnArea.OnClicked:Add(self, self.OnBtnClicked)
  self.BtnArea.OnHovered:Add(self, self.OnBtnHovered)
  self.BtnArea.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.BtnArea.OnPressed:Add(self, self.OnBtnPressed)
  self.BtnArea.OnReleased:Add(self, self.OnBtnReleased)
end

function M:Destruct()
  self.BtnArea.OnClicked:Remove(self, self.OnBtnClicked)
  self.BtnArea.OnHovered:Remove(self, self.OnBtnHovered)
  self.BtnArea.OnUnhovered:Remove(self, self.OnBtnUnhovered)
  self.BtnArea.OnPressed:Remove(self, self.OnBtnPressed)
  self.BtnArea.OnReleased:Remove(self, self.OnBtnReleased)
end

function M:OnBtnClicked()
  UIUtils.PlayCommonBtnSe(self)
  self:PlayAnimation(self.Click)
  if self.Obj.OnListItemClicked and self.Obj.Owner then
    self.Obj.OnListItemClicked(self.Obj.Owner, self.Obj)
  end
end

function M:OnBtnHovered()
  self:OnEntryHoveredChanged(true)
end

function M:OnBtnUnhovered()
  self:OnEntryHoveredChanged(false)
end

function M:OnBtnPressed()
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnBtnReleased()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:OnAnimationFinished(InAnim)
  if InAnim == self.Click then
    self:PlayAnimation(self.Normal)
  end
end

function M:OnListItemObjectSet(Obj)
  self.Obj = Obj
  self.Obj.Entry = self
  if self.Obj.IsLocked then
    self.Switch_Type:SetActiveWidgetIndex(1)
  else
    self.Switch_Type:SetActiveWidgetIndex(0)
  end
  self:SetText(GText(Obj.Text))
  self:PlayInAnim()
  if not Obj.OnListItemClicked and Obj.Owner then
    Obj.OnListItemClicked = Obj.Owner.OnListItemClicked
  end
end

function M:SetText(Text)
  self.Text_On:SetText(Text)
  self.Text_On_Select:SetText(Text)
end

function M:OnEntryHoveredChanged(IsHovered)
  if IsHovered then
    self:StopAnimation(self.Press)
    self:StopAnimation(self.UnHover)
    self:PlayAnimation(self.Hover)
  else
    self:StopAnimation(self.Press)
    self:StopAnimation(self.Hover)
    self:PlayAnimation(self.UnHover)
  end
end

function M:OnEntrySelectionChanged()
  local Speed = self.AnimationSpeed or 1
  self.IsSelected = self.Obj.IsSelected
  if self.IsSelected then
    self.Img_Chose:SetRenderOpacity(1)
    self.Text_Switch:SetActiveWidgetIndex(1)
  else
    self.Img_Chose:SetRenderOpacity(0)
    self.Text_Switch:SetActiveWidgetIndex(0)
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.BtnArea)
end

function M:GetInAnimTime()
  return 0
end

function M:GetOutAnimTime()
  return 0
end

function M:PlayInAnim()
  self.AnimationSpeed = 100
  self:OnEntrySelectionChanged()
  self.AnimationSpeed = 1
end

function M:PlayOutAnim()
end

return M
