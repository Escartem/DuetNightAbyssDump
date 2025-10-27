require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Init(Parent, TabId, Title, IsSelected)
  self.Parent = Parent
  self.TabId = TabId
  self.Text_TabNormal:SetText(Title)
  self.Text_TabSelect:SetText(Title)
  self.IsClick = false
  if IsSelected then
    self.IsClick = true
    self.WS_Tab:SetActiveWidgetIndex(1)
  else
    self.WS_Tab:SetActiveWidgetIndex(0)
  end
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
end

function M:OnBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
  if self.IsClick then
    return
  end
  self.IsClick = true
  self:PlayAnimation(self.Click)
  self.Parent:OnMailListTabClicked(self.TabId, 1)
end

function M:OnBtnPressed()
  if self.IsClick then
    return
  end
  self:PlayAnimation(self.Press)
end

function M:OnBtnHovered()
  if self.IsClick then
    return
  end
  self:PlayAnimation(self.Hover)
end

function M:ChangeIsSelected(IsSelected)
  if IsSelected then
    self.IsClick = true
    self.WS_Tab:SetActiveWidgetIndex(1)
  else
    self.IsClick = false
    self.WS_Tab:SetActiveWidgetIndex(0)
  end
end

function M:OnBtnUnhovered()
  if self.IsClick then
    return
  end
  self:PlayAnimationReverse(self.Hover)
end

return M
