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
  self.ChildWidgetBPPath = ConfigData.ChildWidgetBPPath
  self.SoundFunc = ConfigData.SoundFunc or self.PlayClickSound
  self.HoverSoundFunc = ConfigData.HoverSoundFunc
  self.SoundFuncReceiver = ConfigData.SoundFuncReceiver or self
  self.LeftKeyName = ConfigData.LeftKey or UE4.EKeys.A.KeyName
  self.RightKeyName = ConfigData.RightKey or UE4.EKeys.D.KeyName
  self.LeftGamePadKeyName = ConfigData.LeftGamePadKey or "LeftTriggerThreshold"
  self.RightGamePadKeyName = ConfigData.RightGamePadKey or "RightTriggerThreshold"
  self.DeviceTypeByPlatformName = ConfigData.PlatformName or CommonUtils.GetDeviceTypeByPlatformName(self)
  if self.DeviceTypeByPlatformName == CommonConst.CLIENT_DEVICE_TYPE.MOBILE or ConfigData.LeftKey == "NotShow" then
    self.Key_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.DeviceTypeByPlatformName == CommonConst.CLIENT_DEVICE_TYPE.MOBILE or ConfigData.LeftKey == "NotShow" then
    self.Key_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:UpdateTabs(self.ConfigData.Tabs or {})
  self:RefreshBaseInfo()
end

function M:UpdateTabs(Tabs)
  self.Tabs = Tabs
  self.List_Tab:ClearChildren()
  for i = 1, #Tabs do
    local Child
    if self.ChildWidgetBPPath then
      Child = UIManager(self):CreateWidget(self.ChildWidgetBPPath)
    else
      Child = UIManager(self):_CreateWidgetNew(self.ChildWidgetName or "TabSubTextItem")
    end
    self.List_Tab:AddChild(Child)
    if self.bUserTabItemSize and type(Child.SetFitSize) == "function" then
      Child:SetFitSize(self.TabItem_Size)
    else
      local SizeStruct = FSlateChildSize()
      SizeStruct.Value = 1.0
      Child.Slot:SetSize(SizeStruct)
    end
    Child:Update(i, Tabs[i], self.DeviceTypeByPlatformName)
    Child:BindEventOnSwitchOn(self, self.OnTabSwitchOn)
    Child:BindSoundFunc(self.SoundFunc, self.SoundFuncReceiver)
    Child:BindHoverSoundFunc(self.HoverSoundFunc, self.SoundFuncReceiver)
  end
  if self.DeviceTypeByPlatformName == CommonConst.CLIENT_DEVICE_TYPE.PC then
    if #Tabs <= 1 then
      self.Key_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Key_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Key_Left:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.Key_Right:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
end

function M:RefreshBaseInfo()
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if IsValid(GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(GameInputModeSubsystem:GetCurrentInputType())
    GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  if self.DeviceTypeByPlatformName == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
    self.Key_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self:UpdateUIStyleInPlatform(self.CurInputDeviceType == ECommonInputType.Gamepad)
    self:UpdateHotKeyInfo(CurGamepadName)
  end
end

function M:UpdateUIStyleInPlatform(IsUseGamePad, bIsNotRegerate)
  if not bIsNotRegerate then
    if IsUseGamePad then
      self:CreateHotKeyAndAddToParent(self.Key_Left, "Img", self.LeftGamePadKeyName)
      self:CreateHotKeyAndAddToParent(self.Key_Right, "Img", self.RightGamePadKeyName)
    else
      self:CreateHotKeyAndAddToParent(self.Key_Left, "Text", self.LeftKeyName)
      self:CreateHotKeyAndAddToParent(self.Key_Right, "Text", self.RightKeyName)
    end
  end
  if self.CurInputDeviceType == ECommonInputType.Gamepad and not IsUseGamePad then
    self.Key_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Key_Left:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Key_Right:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:UpdateHotKeyInfo(CurGamepadName)
end

function M:CreateHotKeyAndAddToParent(PanelWidget, KeyType, KeyContent)
  PanelWidget:ClearChildren()
  local HotKeyWidget
  if "Img" == KeyType then
    HotKeyWidget = UIManager(self):CreateWidget("/Game/UI/WBP/Common/Key/WBP_Com_KeyImg.WBP_Com_KeyImg", false)
  else
    HotKeyWidget = UIManager(self):CreateWidget("/Game/UI/WBP/Common/Key/WBP_Com_KeyText.WBP_Com_KeyText", false)
    HotKeyWidget.IsButton = false
  end
  if nil ~= HotKeyWidget then
    if "Img" == KeyType then
      HotKeyWidget:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = UIConst.GamePadImgKey[KeyContent]
          }
        }
      })
    else
      HotKeyWidget:CreateCommonKey({
        KeyInfoList = {
          {Type = "Text", Text = KeyContent}
        }
      })
    end
  end
  PanelWidget:AddChildToOverlay(HotKeyWidget)
end

function M:OnTabSwitchOn(TabWidget)
  if TabWidget and self.Tabs[TabWidget.Idx] then
    if self.CurrentTab and TabWidget.Idx ~= self.CurrentTab then
      local PrevTabWidget = self.List_Tab:GetChildAt(self.CurrentTab - 1)
      if PrevTabWidget then
        PrevTabWidget:SetSwitchOn(false)
      end
    end
    self.CurrentTab = TabWidget.Idx
  end
  if self.EventTabSelected then
    self.EventTabSelected(self.ObjTabSelected, TabWidget, self.Tabs[self.CurrentTab])
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

function M:ClickTab(Idx)
  if self.Tabs[Idx] then
    self:PlayClickSound()
    self:SelectTab(Idx)
  end
end

function M:GetCurrentTabIndex()
  return self.CurrentTab
end

function M:TabToLeft()
  if self.CurrentTab and self.CurrentTab - 1 >= 1 then
    self.SoundFunc(self.SoundFuncReceiver, self.CurrentTab - 1)
    local ChildWidget = self.List_Tab:GetChildAt(self.CurrentTab - 2)
    ChildWidget:SetSwitchOn(true, true)
    if self.EMScrollBox_0 then
      self.EMScrollBox_0:ScrollWidgetIntoView(ChildWidget)
    end
  end
end

function M:TabToRight()
  if self.CurrentTab and self.CurrentTab + 1 <= #self.Tabs then
    self.SoundFunc(self.SoundFuncReceiver, self.CurrentTab + 1)
    local ChildWidget = self.List_Tab:GetChildAt(self.CurrentTab)
    ChildWidget:SetSwitchOn(true, true)
    if self.EMScrollBox_0 then
      self.EMScrollBox_0:ScrollWidgetIntoView(ChildWidget)
    end
  end
end

function M:UnLockTabByIndex(bUnLock, TabIndex)
  local AllItemCount = self.List_Tab:GetChildrenCount()
  if nil ~= TabIndex then
    for i = 1, AllItemCount do
      local Child = self.List_Tab:GetChildAt(i - 1)
      if TabIndex == Child.Idx then
        Child:SetLockInfo(bUnLock)
        break
      end
    end
  else
    for i = 1, AllItemCount do
      local Child = self.List_Tab:GetChildAt(i - 1)
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
    local TabWidget = self.List_Tab:GetChildAt(math.max(Idx - 1, 0))
    TabWidget:SetReddot(IsNew, Upgradeable, OhterReddot)
  end
end

function M:ShowTabRedDotByTabId(TabId, IsNew, Upgradeable, OhterReddot)
  local AllItemCount = self.List_Tab:GetChildrenCount()
  for i = 1, AllItemCount do
    local TabWidget = self.List_Tab:GetChildAt(i - 1)
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
  if InKeyName == self.LeftKeyName then
    self:TabToLeft()
  elseif InKeyName == self.RightKeyName then
    self:TabToRight()
  else
    IsEventHandled = false
  end
  return IsEventHandled
end

function M:Handle_KeyEventOnGamePad(InKeyName)
  local IsEventHandled = true
  if InKeyName == UIConst.GamePadKey[self.LeftGamePadKeyName] then
    self:TabToLeft()
  elseif InKeyName == UIConst.GamePadKey[self.RightGamePadKeyName] then
    self:TabToRight()
  else
    IsEventHandled = false
  end
  return IsEventHandled
end

return M
