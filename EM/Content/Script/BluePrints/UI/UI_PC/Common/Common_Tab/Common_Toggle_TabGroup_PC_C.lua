require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Init(ConfigData)
  self.CurrentTab = nil
  self.ConfigData = ConfigData
  self.ChildWidgetName = ConfigData.ChildWidgetName
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    if ConfigData.LeftKey then
      self.Btn_Text_PC_Left:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Text",
            Text = ConfigData.LeftKey
          }
        }
      })
      self.Btn_Text_PC_Left:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Btn_Text_PC_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    if ConfigData.RightKey then
      self.Btn_Text_PC_Right:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Text",
            Text = ConfigData.RightKey
          }
        }
      })
      self.Btn_Text_PC_Right:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Btn_Text_PC_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    self.Btn_Text_PC_Right:SetVisibility(ESlateVisibility.Collapsed)
    self.Btn_Text_PC_Left:SetVisibility(ESlateVisibility.Collapsed)
  end
  self:UpdateTabs(self.ConfigData.Tabs or {})
end

function M:UpdateTabs(Tabs)
  self.Tabs = Tabs
  self.List_Tab:ClearChildren()
  for i = 1, #Tabs do
    local Child = UIManager(self):_CreateWidgetNew(self.ChildWidgetName or "CommonToggleTabItem")
    self.List_Tab:AddChild(Child)
    Child:Update(i, Tabs[i])
    Child:BindEventOnSwitchOn(self, self.OnTabSwitchOn)
  end
  if #Tabs <= 1 then
    self.Btn_Text_PC_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_Text_PC_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnTabSwitchOn(TabWidget)
  if TabWidget and self.Tabs[TabWidget.Idx] then
    if self.CurrentTab and TabWidget.Idx ~= self.CurrentTab then
      self.List_Tab:GetChildAt(self.CurrentTab - 1):SetSwitchOn(false)
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
    self.List_Tab:GetChildAt(math.max(Idx - 1, 0)):SetSwitchOn(true)
  end
end

function M:TabToLeft()
  if self.CurrentTab and self.CurrentTab - 1 >= 1 then
    UIUtils.PlayCommonBtnSe(self)
    self.List_Tab:GetChildAt(self.CurrentTab - 2):SetSwitchOn(true, true)
  end
end

function M:TabToRight()
  if self.CurrentTab and self.CurrentTab + 1 <= #self.Tabs then
    UIUtils.PlayCommonBtnSe(self)
    self.List_Tab:GetChildAt(self.CurrentTab):SetSwitchOn(true, true)
  end
end

function M:UpdateReddots()
  for _, Tab in pairs(self.Tabs) do
    if IsValid(Tab.UI) and Tab.UI.SetReddot then
      Tab.UI:SetReddot(Tab.IsNew, Tab.Upgradeable, Tab.OtherReddot)
    end
  end
end

return M
