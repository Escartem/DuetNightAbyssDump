require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.SoundFunc = nil
  self.HoverSoundFunc = nil
  self.SoundFuncReceiver = self
end

function M:Init(ConfigData)
  self.CurrentTab = nil
  self.ConfigData = ConfigData
  self.ChildWidgetName = ConfigData.ChildWidgetName
  self.SoundFunc = ConfigData.SoundFunc or self.PlayClickSound
  self.HoverSoundFunc = ConfigData.HoverSoundFunc
  self.SoundFuncReceiver = ConfigData.SoundFuncReceiver or self
  self.DeviceTypeByPlatformName = ConfigData.PlatformName or CommonUtils.GetDeviceTypeByPlatformName(self)
  self:UpdateTabs(self.ConfigData.Tabs or {})
end

function M:UpdateTabs(Tabs)
  self.Tabs = Tabs
  self.ScrollBox_Tab:ClearChildren()
  for i = 1, #Tabs do
    local Child = UIManager(self):_CreateWidgetNew(self.ChildWidgetName or "TabSubIconTextItem")
    self.ScrollBox_Tab:AddChild(Child)
    Child:Update(i, Tabs[i], self.DeviceTypeByPlatformName)
    Child:BindEventOnSwitchOn(self, self.OnTabSwitchOn)
    Child:BindSoundFunc(self.SoundFunc, self.SoundFuncReceiver)
    Child:BindHoverSoundFunc(self.HoverSoundFunc, self.SoundFuncReceiver)
  end
  if #Tabs <= 1 then
    self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self:InitNavigationRules()
end

function M:OnTabSwitchOn(TabWidget)
  if TabWidget and self.Tabs[TabWidget.Idx] then
    if self.CurrentTab and TabWidget.Idx ~= self.CurrentTab then
      self.ScrollBox_Tab:GetChildAt(self.CurrentTab - 1):SetSwitchOn(false)
    end
    self.CurrentTab = TabWidget.Idx
  end
  if self.EventTabSelected then
    self.EventTabSelected(self.ObjTabSelected, TabWidget)
  end
  if type(self.ScrollBox_Tab.SetSelectItemIndex) == "function" then
    self.ScrollBox_Tab:SetSelectItemIndex(self.CurrentTab - 1)
  end
end

function M:BindEventOnTabSelected(Obj, Event)
  self.ObjTabSelected = Obj
  self.EventTabSelected = Event
end

function M:SelectTab(Idx)
  if self.Tabs[Idx] then
    self.ScrollBox_Tab:GetChildAt(math.max(Idx - 1, 0)):SetSwitchOn(true)
  end
end

function M:TabToUp()
  if self.CurrentTab and self.CurrentTab - 1 >= 1 then
    UIUtils.PlayCommonBtnSe(self)
    self.ScrollBox_Tab:GetChildAt(self.CurrentTab - 2):SetSwitchOn(true, true)
  end
end

function M:TabToDown()
  if self.CurrentTab and self.CurrentTab + 1 <= #self.Tabs then
    UIUtils.PlayCommonBtnSe(self)
    self.ScrollBox_Tab:GetChildAt(self.CurrentTab):SetSwitchOn(true, true)
  end
end

function M:UnLockTabByIndex(bUnLock, TabIndex)
  local AllItemCount = self.ScrollBox_Tab:GetChildrenCount()
  if nil ~= TabIndex then
    for i = 1, AllItemCount do
      local Child = self.ScrollBox_Tab:GetChildAt(i - 1)
      if TabIndex == Child.Idx then
        Child:SetLockInfo(bUnLock)
        break
      end
    end
  else
    for i = 1, AllItemCount do
      local Child = self.ScrollBox_Tab:GetChildAt(i - 1)
      Child:SetLockInfo(bUnLock)
    end
  end
end

function M:UpdateReddots()
  for _, Tab in pairs(self.Tabs) do
    if IsValid(Tab.UI) and Tab.UI.SetReddot then
      Tab.UI:SetReddot(Tab.Upgradeable, Tab.OtherReddot)
    end
  end
end

function M:ShowTabRedDot(Idx, IsNew, Upgradeable, OhterReddot)
  if self.Tabs[Idx] then
    local TabWidget = self.ScrollBox_Tab:GetChildAt(math.max(Idx - 1, 0))
    TabWidget:SetReddot(IsNew, Upgradeable, OhterReddot)
  end
end

function M:ShowTabRedDotByTabId(TabId, IsNew, Upgradeable, OhterReddot)
  local AllItemCount = self.ScrollBox_Tab:GetChildrenCount()
  for i = 1, AllItemCount do
    local TabWidget = self.ScrollBox_Tab:GetChildAt(i - 1)
    if TabId == TabWidget:GetTabId() then
      TabWidget:SetReddot(IsNew, Upgradeable, OhterReddot)
      break
    end
  end
end

function M:PlayClickSound()
  UIUtils.PlayCommonBtnSe(self)
end

function M:Handle_KeyEventOnPC(InKeyName)
  local IsEventHandled = true
  if InKeyName == UE4.EKeys.W.KeyName then
    self:TabToUp()
  elseif InKeyName == UE4.EKeys.S.KeyName then
    self:TabToDown()
  else
    IsEventHandled = false
  end
  return IsEventHandled
end

function M:Handle_KeyEventOnGamePad(InKeyName)
  local IsEventHandled = true
  if InKeyName == UIConst.GamePadKey.LeftTriggerThreshold then
    self:TabToUp()
  elseif InKeyName == UIConst.GamePadKey.RightTriggerThreshold then
    self:TabToDown()
  else
    IsEventHandled = false
  end
  return IsEventHandled
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  local Widget = self.ScrollBox_Tab:GetChildAt(0)
  if Widget then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), Widget)
  end
  return UIUtils.Unhandled
end

function M:InitNavigationRules()
  local Widgets = self.ScrollBox_Tab:GetAllChildren():ToTable()
  for index, Widget in ipairs(Widgets) do
    local LastWidgt = Widgets[index - 1]
    if LastWidgt then
      local function OnNavigateUp()
        self.ScrollBox_Tab:ScrollWidgetIntoView(LastWidgt)
        
        return LastWidgt
      end
      
      Widget:SetNavigationRuleCustom(EUINavigation.Up, OnNavigateUp)
    else
      Widget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Escape)
    end
    local NextWidget = Widgets[index + 1]
    if NextWidget then
      local function OnNavigateDown()
        self.ScrollBox_Tab:ScrollWidgetIntoView(NextWidget)
        
        return NextWidget
      end
      
      Widget:SetNavigationRuleCustom(EUINavigation.Down, OnNavigateDown)
    else
      Widget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Escape)
    end
  end
end

return M
