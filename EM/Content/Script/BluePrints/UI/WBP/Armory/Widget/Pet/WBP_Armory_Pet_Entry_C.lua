require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Button_Area.OnClicked:Add(self, self.OnBtnClicked)
  self.Text_Empty:SetText(GText("UI_Pet_Affix_Without"))
end

function M:Init(Content)
  self.Content = Content
  Content.UI = self
  if Content.IsLocked then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(2)
  elseif Content.IsEmpty then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  else
    self.Pet_EntryTag:Init(Content)
    self.Text_Entry:SetText(Content.Name)
    self.Text_Desc:SetText(Content.Desc)
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    self:PlayAnimation(self.TextRefresh)
  end
  self.Owner = Content.Owner
  self._OnClicked = Content.OnClicked
  self:SetIsSelected(Content.IsSelected)
end

function M:OnBtnClicked()
  if self._OnClicked then
    self._OnClicked(self.Owner, self.Content, self)
  end
end

function M:SetIsSelected(IsSelected)
  if IsSelected then
    self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self:StopAnimation(self.Normal)
    self:PlayAnimation(self.Click)
  else
    self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self:StopAnimation(self.Click)
    self:PlayAnimation(self.Normal)
  end
  if self.Content then
    self.Content.IsSelected = IsSelected
  end
end

return M
