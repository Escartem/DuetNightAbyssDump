require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Init(LeftKey, RightKey, Tabs)
  if LeftKey then
    self.Key_Left:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = LeftKey}
      }
    })
    self.Key_Left:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Key_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if RightKey then
    self.Key_Right:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = RightKey}
      }
    })
    self.Key_Right:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Key_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.TabCount = self.VerticalBox:GetChildrenCount() - 2
  for i = 1, self.TabCount do
    local Child = self.VerticalBox:GetChildAt(i)
    Child:UnbindEventOnSwitchOn()
  end
  self:UpdataTabs(Tabs or {})
end

function M:UpdataTabs(Tabs)
  self.Tabs = Tabs
  for i = 1, self.TabCount do
    local Child = self.VerticalBox:GetChildAt(i)
    if Tabs[i] then
      Child:Update(i, Tabs[i])
      Child:BindEventOnSwitchOn(self, self.OnTabSwitchOn)
      Child:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      Child:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  if #Tabs <= 1 then
    self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:OnTabSwitchOn(TabWidget)
  if TabWidget and self.Tabs[TabWidget.Idx] then
    if self.CurrentTab and TabWidget.Idx ~= self.CurrentTab then
      self.VerticalBox:GetChildAt(self.CurrentTab):SetSwitchOn(false)
    end
    self.CurrentTab = TabWidget.Idx
  end
  if self.EventTabSelected then
    self.EventTabSelected(self.ObjTabSelected, TabWidget)
  end
end

function M:BindEventOnTabSelected(Obj, Event)
  self.ObjTabSelected = Obj
  self.EventTabSelected = Event
end

function M:SelectTab(Idx)
  if self.Tabs[Idx] then
    self.VerticalBox:GetChildAt(Idx):SetSwitchOn(true)
  end
end

function M:TabToLeft()
  if self.CurrentTab and self.CurrentTab - 1 >= 1 then
    UIUtils.PlayCommonBtnSe(self)
    self.VerticalBox:GetChildAt(self.CurrentTab - 1):SetSwitchOn(true)
  end
end

function M:TabToRight()
  if self.CurrentTab and self.CurrentTab + 1 <= #self.Tabs then
    UIUtils.PlayCommonBtnSe(self)
    self.VerticalBox:GetChildAt(self.CurrentTab + 1):SetSwitchOn(true)
  end
end

function M:PlayInAnim()
  self:PlayAnimation(self.In)
  return self.In:GetEndTime()
end

function M:PlayOutAnim()
  self:PlayAnimation(self.Out)
  return self.Out:GetEndTime()
end

return M
