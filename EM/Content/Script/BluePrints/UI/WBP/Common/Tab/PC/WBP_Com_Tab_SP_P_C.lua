require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")
local TabSelectStateEnum = {SelectTab = 1, SelectResource = 2}

function M:Construct()
  self.ClickSoundFunc = nil
  self.HoverSoundFunc = nil
  self.SoundFuncReceiverObj = nil
  self.ResourceBar:BindEvents(self, {
    OnAddedToFocusPath = self.OnResourceBarAddedToFocusPath,
    OnRemovedFromFocusPath = self.OnResourceBarRemovedFromFocusPath
  })
end

function M:BP_GetDesiredFocusTarget()
  local ChildWidget = self.ScrollBox_Tab:GetChildAt(self.CurrentTab)
  if IsValid(ChildWidget) then
    return ChildWidget
  end
  return nil
end

function M:Destruct()
  self:ClearListenEvent()
end

function M:Init(ConfigData, NotPlayInAnim)
  self.ConfigData = ConfigData
  self.BackCallback = ConfigData.BackCallback
  self.InfoCallback = ConfigData.InfoCallback
  self.OwnerPanel = ConfigData.OwnerPanel
  self.StyleName = ConfigData.StyleName or "Text"
  self.TitleName = ConfigData.TitleName
  self.OverridenTopResouces = ConfigData.OverridenTopResouces
  self.PopupInfoId = ConfigData.PopupInfoId
  self.ClickSoundFunc = ConfigData.SoundFunc or self.PlayClickSound
  self.HoverSoundFunc = ConfigData.HoverSoundFunc
  self.SoundFuncReceiverObj = ConfigData.SoundFuncReceiver or self
  self.LastFocusWidget = ConfigData.LastFocusWidget or self.OwnerPanel
  self.GetReplyOnBack = ConfigData.GetReplyOnBack
  self.DeviceTypeByPlatformName = ConfigData.PlatformName or CommonUtils.GetDeviceTypeByPlatformName(self)
  self.IconSignPath = ConfigData.IconSignPath
  self.CurrentTab = nil
  self.bEnableSelectTab = true
  self.CurSelectMode = TabSelectStateEnum.SelectTab
  self.CurInputDeviceType = nil
  self.bShowBubble = ConfigData.bShowBubble
  self.BottomKeyWidget = {}
  self:ResetDynamicNode()
  self:UpdateTabs(self.ConfigData.Tabs or {})
  self:RefreshBaseInfo()
  if NotPlayInAnim then
    self:StopAnimation(self.In)
  end
  self:InitListenEvent()
end

function M:InitListenEvent()
  EventManager:AddEvent(EventID.OnPropSetResources, self, self.OnPropSetResources)
  EventManager:AddEvent(EventID.OnChangeActionPoint, self, self.OnPropSetResources)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:ClearListenEvent()
  EventManager:RemoveEvent(EventID.OnPropSetResources, self)
  EventManager:RemoveEvent(EventID.OnChangeActionPoint, self)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self:UpdateTopRightTips()
  self:UpdateUIStyleInPlatform(self.CurInputDeviceType == ECommonInputType.Gamepad)
  self:UpdateHotKeyInfo(CurGamepadName)
end

function M:RefreshBaseInfo()
  self:FillWithBaseInfo()
  self:UpdateTopTitle()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  if self.IconSignPath then
    local IconSignTexture = LoadObject(self.IconSignPath)
    if IsValid(IconSignTexture) then
      self.Icon_Sign:SetBrushFromTexture(IconSignTexture)
    end
  end
end

function M:FillWithBaseInfo()
  local ResourceBarIcon = UIUtils.UtilsGetKeyIconPathInGamepad("RS", "Generic")
  self.ResourceBar:SetGamePadKeyImgByPath(ResourceBarIcon)
  self.ResourceBar:SetLastFocusWidget(self.LastFocusWidget)
  self.ResourceBar:SetGetReplyOnBack(self.GetReplyOnBack)
  local bAllowForbid = self.ConfigData.bAllowKeyForbid
  self.ResourceBar:InitGamePadTip({
    KeyInfo = {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Menu"}
      },
      Desc = GText("UI_GACHA_DESDETAIL"),
      bAllowForbid = bAllowForbid
    },
    ClickFuncObj = self,
    ClickFunc = self.OnInfoClick
  })
end

function M:OverrideTopResource(OverridenTopResouces, bIsRequestRefresh)
  self.OverridenTopResouces = OverridenTopResouces
  if bIsRequestRefresh then
    self.ResourceBar:ClearChildren()
    local SystemUIConfig = DataMgr.SystemUI[self.OwnerPanel.ConfigName or self.OwnerPanel.WidgetName] or {}
    local TopResource = self.OverridenTopResouces or SystemUIConfig.TabCoin
    self.ResourceBar:InitResourceBar(TopResource)
  end
end

function M:ResetDynamicNode()
  local DynamicNodeName = {
    Panel_Back = {NeedRemoveChild = true},
    Panel_Key = {
      ParentWidget = "Com_KeyTips",
      NeedRemoveChild = true
    }
  }
  for k, v in pairs(DynamicNodeName) do
    if v.ParentWidget ~= nil then
      local TargetWidget = self[v.ParentWidget]
      if nil ~= TargetWidget[k] then
        if v.NeedRemoveChild then
          TargetWidget[k]:ClearChildren()
        end
        TargetWidget[k]:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    elseif nil ~= self[k] then
      if v.NeedRemoveChild then
        self[k]:ClearChildren()
      end
      self[k]:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  self.ResourceBar:ClearChildren()
  
  local function CorrectTabLocation()
    local HBSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.HB)
    local HBPos = HBSlot:GetPosition()
    HBPos.X = 0
    HBSlot:SetPosition(HBPos)
  end
  
  if nil == self.ConfigData.DynamicNode then
    CorrectTabLocation()
    return
  end
  for i, v in ipairs(self.ConfigData.DynamicNode) do
    if "Back" == v then
      if not IsValid(self.BackWidget) then
        self.BackWidget = UIManager(self):CreateWidget("/Game/UI/WBP/Common/Tab/PC/WBP_Com_TabBack_P.WBP_Com_TabBack_P", false)
      end
      self.Panel_Back:AddChild(self.BackWidget)
      self.BackWidget.TextBlock_Back:SetText(GText("UI_BACK"))
      self.BackWidget.Btn_Back.OnClicked:Clear()
      self.BackWidget.Btn_Back.OnClicked:Add(self, self.OnReturnClick)
      self.Panel_Back:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    elseif "ResourceBar" == v then
      local SystemUIConfig = DataMgr.SystemUI[self.OwnerPanel.ConfigName or self.OwnerPanel.WidgetName] or {}
      local TopResource = self.OverridenTopResouces or SystemUIConfig.TabCoin
      self.ResourceBar:InitResourceBar(TopResource, self.bShowBubble)
    elseif "BottomKey" == v then
      for i, KeyInfo in ipairs(self.ConfigData.BottomKeyInfo) do
        local BottomKeyWidget = self.BottomKeyWidget[i]
        if not IsValid(BottomKeyWidget) then
          if KeyInfo.KeyInfoList and KeyInfo.KeyInfoList.SubKeyInfoList and not KeyInfo.Desc then
            if "Add" == KeyInfo.KeyInfoList[1].Type then
              BottomKeyWidget = UIManager(self):CreateWidget("/Game/UI/WBP/Common/Key/WBP_Com_KeyAdd.WBP_Com_KeyAdd_C", false)
            else
              BottomKeyWidget = UIManager(self):CreateWidget("/Game/UI/WBP/Common/Key/WBP_Com_KeyOr.WBP_Com_KeyOr_C", false)
            end
          else
            BottomKeyWidget = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
          end
          self.BottomKeyWidget[i] = BottomKeyWidget
        end
        self.Com_KeyTips.Panel_Key:AddChild(BottomKeyWidget)
      end
      self.Com_KeyTips.Panel_Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
  if not IsValid(self.BackWidget) then
    CorrectTabLocation()
  end
end

function M:SetBgRenderOpacity(Value)
  self.Bg_Bottom:SetRenderOpacity(Value)
  self.Bg_Top:SetRenderOpacity(Value)
end

function M:SetPopupInfoId(PopupInfoId, IsNeedRefresh)
  self.PopupInfoId = PopupInfoId
  if IsNeedRefresh then
    self:UpdateTopRightTips()
  end
end

function M:UpdateInfoBySelectTabItem(TabWidget)
  self:UpdateTopRightTips()
end

function M:UpdateResource()
  self.ResourceBar:UpdateResource()
end

function M:UpdateTopTitle(TitleName)
  self.TitleName = TitleName or self.TitleName
  if self.TitleName ~= nil then
    self.Text_Title:SetText(self.TitleName)
    self.Text_Title:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Text_Title:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:UpdateTopRightTips()
  local function RealUpdateTopRightTips()
    if self.PopupInfoId ~= nil or type(self.InfoCallback) == "function" then
      if self.CurInputDeviceType == ECommonInputType.Gamepad then
        self.ResourceBar:SwitchTipStyle(1)
      elseif self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
        self.ResourceBar:SwitchTipStyle(0)
      end
      self.ResourceBar:HideTip(false)
    else
      self.ResourceBar:HideTip(true)
    end
  end
  
  if self.PopupInfoId == nil and nil ~= self.OwnerPanel and type(self.OwnerPanel.GetUIConfigName) == "function" then
    local UIConfigName = self.OwnerPanel:GetUIConfigName()
    local SystemUIConfig = DataMgr.SystemUI[UIConfigName] or {}
    self.PopupInfoId = SystemUIConfig.PopupInfoId
  end
  RealUpdateTopRightTips()
end

function M:UpdateHotKeyInfo(CurGamepadName)
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:FillWithBottomKeyInfoList(true)
    local ResourceBarIcon = UIUtils.UtilsGetKeyIconPathInGamepad("RS", CurGamepadName)
    self.ResourceBar:SetGamePadKeyImgByPath(ResourceBarIcon)
    if self.ResourceBar:HasUserFocusedDescendants(self:GetOwningPlayer()) then
      self:EnterResourceSelectMode()
    end
  else
    self:FillWithBottomKeyInfoList(false)
    self:ExitResourceSelectMode()
  end
end

function M:UpdateUIStyleInPlatform(IsUseGamePad)
  local ActiveWidgetIndex = IsUseGamePad and 1 or 0
  self.ResourceBar:HideGamePadKey(not IsUseGamePad)
end

function M:CheckNeedHideChangeKey()
  local TabCount = self.Tabs and #self.Tabs or 0
  local IsNotShow = false
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    IsNotShow = self.ConfigData.GamePadLeftKey == "NotShow" or "NotShow" == self.ConfigData.GamePadRightKey
  else
    IsNotShow = "NotShow" == self.ConfigData.LeftKey or "NotShow" == self.ConfigData.RightKey
  end
  if IsNotShow or TabCount <= 1 then
    return true
  end
  return false
end

function M:FillWithBottomKeyInfoList(bIsGamePadKey)
  if bIsGamePadKey then
    for i, v in ipairs(self.BottomKeyWidget) do
      if IsValid(v) then
        local AllKeyInfoList = self.ConfigData.BottomKeyInfo[i]
        if not AllKeyInfoList.GamePadInfoList then
          v:SetVisibility(UE4.ESlateVisibility.Collapsed)
          goto lbl_71
        else
          v:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        end
        if AllKeyInfoList.GamePadInfoList.GamePadSubKeyInfoList then
          if AllKeyInfoList.Desc then
            v:CreateSubKeyDesc({
              KeyInfoList = AllKeyInfoList.GamePadInfoList.GamePadSubKeyInfoList,
              Desc = AllKeyInfoList.Desc,
              Type = AllKeyInfoList.GamePadInfoList[1].Type
            })
          else
            v:CreateCommonKey({
              KeyInfoList = AllKeyInfoList.GamePadInfoList.GamePadSubKeyInfoList
            })
          end
        else
          v:CreateCommonKey({
            KeyInfoList = AllKeyInfoList.GamePadInfoList,
            Desc = AllKeyInfoList.Desc,
            bLongPress = AllKeyInfoList.bLongPress,
            bSpecialLongPress = AllKeyInfoList.bSpecialLongPress
          })
        end
      end
      ::lbl_71::
    end
  else
    for i, v in ipairs(self.BottomKeyWidget) do
      if IsValid(v) then
        local AllKeyInfoList = self.ConfigData.BottomKeyInfo[i]
        if not AllKeyInfoList.KeyInfoList then
          v:SetVisibility(UE4.ESlateVisibility.Collapsed)
          goto lbl_141
        else
          v:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        end
        if AllKeyInfoList.KeyInfoList.SubKeyInfoList then
          if AllKeyInfoList.Desc then
            v:CreateSubKeyDesc({
              KeyInfoList = AllKeyInfoList.KeyInfoList.SubKeyInfoList,
              Desc = AllKeyInfoList.Desc,
              Type = AllKeyInfoList.KeyInfoList[1].Type
            })
          else
            v:CreateCommonKey({
              KeyInfoList = AllKeyInfoList.KeyInfoList.SubKeyInfoList
            })
          end
        else
          v:CreateCommonKey({
            KeyInfoList = AllKeyInfoList.KeyInfoList,
            Desc = AllKeyInfoList.Desc,
            bLongPress = AllKeyInfoList.bLongPress
          })
        end
      end
      ::lbl_141::
    end
  end
end

function M:UpdateTabs(Tabs)
  local function SortFunc(ComPareA, ComPareB)
    local IsALocked = ComPareA.IsLocked
    
    local IsBLocked = ComPareB.IsLocked
    if IsALocked == IsBLocked then
      local SortA = ComPareA.SortId
      local SortB = ComPareB.SortId
      if nil ~= SortA and nil ~= SortB then
        return SortA > SortB
      else
        local TabIdA = ComPareA.TabId or 1
        local TabIdB = ComPareB.TabId or 1
        return TabIdA < TabIdB
      end
    else
      return not IsALocked
    end
  end
  
  table.sort(Tabs, SortFunc)
  self.Tabs = Tabs
  self.ScrollBox_Tab:ClearChildren()
  for i = 0, #Tabs - 1 do
    local Child, TabItemClass
    TabItemClass = LoadClass("/Game/UI/WBP/Common/Tab/PC/WBP_Com_TabItem_SP_P.WBP_Com_TabItem_SP_P_C")
    if nil ~= TabItemClass then
      Child = UE4.UWidgetBlueprintLibrary.Create(self, TabItemClass)
      if IsValid(Child) then
        self.ScrollBox_Tab:AddChild(Child)
        Child:Update(i + 1, Tabs[i + 1])
        Child:BindEventOnSwitchOn(self, self.OnTabSwitchOn)
        Child:BindSoundFunc(self.ClickSoundFunc, self.SoundFuncReceiverObj)
        Child:BindHoverSoundFunc(self.HoverSoundFunc, self.SoundFuncReceiverObj)
      end
    end
  end
  for i = 0, #Tabs - 1 do
    local CurrentChild = self.ScrollBox_Tab:GetChildAt(i)
    if IsValid(CurrentChild) then
      if 0 == i then
        CurrentChild:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
      else
        local UpChild = self.ScrollBox_Tab:GetChildAt(i - 1)
        if IsValid(UpChild) then
          CurrentChild:SetNavigationRuleExplicit(EUINavigation.Up, UpChild)
        end
      end
      if i == #Tabs - 1 then
        CurrentChild:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
      else
        local DownChild = self.ScrollBox_Tab:GetChildAt(i + 1)
        if IsValid(DownChild) then
          CurrentChild:SetNavigationRuleExplicit(EUINavigation.Down, DownChild)
        end
      end
    end
  end
end

function M:OnReturnClick()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
  if type(self.BackCallback) == "function" then
    self.BackCallback(self.OwnerPanel)
  end
end

function M:OnInfoClick()
  if TeamController:IsTeamPopupBarOpenInGamepad() then
    return
  end
  if self.PopupInfoId ~= nil then
    local Params = {
      RightCallbackFunction = function()
        if type(self.InfoCallback) == "function" then
          self.InfoCallback(self.OwnerPanel)
        end
      end
    }
    UIManager(self):ShowCommonPopupUI(self.PopupInfoId, Params)
  elseif type(self.InfoCallback) == "function" then
    self.InfoCallback(self.OwnerPanel)
  end
end

function M:OnTabSwitchOn(TabWidget, CalledFromInputType)
  if TabWidget and self.Tabs[TabWidget.Idx] then
    if self.CurrentTab and TabWidget.Idx ~= self.CurrentTab then
      local CurSwitchChildWidget = self.ScrollBox_Tab:GetChildAt(self.CurrentTab - 1)
      if nil ~= CurSwitchChildWidget then
        CurSwitchChildWidget:SetSwitchOn(false)
      end
      local CurChildWidget = self.ScrollBox_Tab:GetChildAt(TabWidget.Idx - 1)
      self.ScrollBox_Tab:ScrollWidgetIntoView(CurChildWidget)
    end
    self.CurrentTab = TabWidget.Idx
    self:UpdateInfoBySelectTabItem(TabWidget)
  end
  if self.EventTabSelected then
    self.EventTabSelected(self.ObjTabSelected, TabWidget, self.Tabs[TabWidget.Idx])
  end
end

function M:BindEventOnTabSelected(Obj, Event)
  self.ObjTabSelected = Obj
  self.EventTabSelected = Event
end

function M:ClickTab(Idx)
  if self.Tabs[Idx] then
    local ChildWidget = self.ScrollBox_Tab:GetChildAt(math.max(Idx - 1, 0))
    ChildWidget:Btn_Click()
    self.ScrollBox_Tab:ScrollWidgetIntoView(ChildWidget)
  end
end

function M:SelectTab(Idx)
  if self.Tabs[Idx] then
    local ChildWidget = self.ScrollBox_Tab:GetChildAt(math.max(Idx - 1, 0))
    ChildWidget:SetSwitchOn(true)
    self.ScrollBox_Tab:ScrollWidgetIntoView(ChildWidget)
  end
end

function M:SelectTabById(TabId)
  local AllItemCount = self.ScrollBox_Tab:GetChildrenCount()
  for i = 1, AllItemCount do
    local ChildWidget = self.ScrollBox_Tab:GetChildAt(i - 1)
    if TabId == ChildWidget:GetTabId() then
      ChildWidget:SetSwitchOn(true)
      self.ScrollBox_Tab:ScrollWidgetIntoView(ChildWidget)
      break
    end
  end
end

function M:TabToUp()
  if not self.bEnableSelectTab then
    return
  end
  if self.CurrentTab and self.CurrentTab - 1 >= 1 then
    for i = self.CurrentTab - 1, 1, -1 do
      local ChildWidget = self.ScrollBox_Tab:GetChildAt(i - 1)
      if nil ~= ChildWidget then
        if ChildWidget:IsTabLocked() then
          ChildWidget:SetSwitchOn(false, false)
          break
        end
        ChildWidget:SetSwitchOn(true, true)
        self.ScrollBox_Tab:ScrollWidgetIntoView(ChildWidget)
        self.ClickSoundFunc(self.SoundFuncReceiverObj, i)
        break
      end
    end
  end
end

function M:TabToDown()
  if not self.bEnableSelectTab then
    return
  end
  if self.CurrentTab and self.CurrentTab + 1 <= #self.Tabs then
    for i = self.CurrentTab, #self.Tabs - 1 do
      local ChildWidget = self.ScrollBox_Tab:GetChildAt(i)
      if nil ~= ChildWidget then
        if ChildWidget:IsTabLocked() then
          ChildWidget:SetSwitchOn(false, false)
          break
        end
        ChildWidget:SetSwitchOn(true, true)
        self.ScrollBox_Tab:ScrollWidgetIntoView(ChildWidget)
        self.ClickSoundFunc(self.SoundFuncReceiverObj, i + 1)
        break
      end
    end
  end
end

function M:EnableTabByIndex(bEnable, TabIndex)
  self.bEnableSelectTab = bEnable
  local AllItemCount = self.ScrollBox_Tab:GetChildrenCount()
  if nil ~= TabIndex then
    for i = 1, AllItemCount do
      local Child = self.ScrollBox_Tab:GetChildAt(i - 1)
      if TabIndex == Child.Idx then
        Child:SetClickEnable(bEnable)
        break
      end
    end
  else
    for i = 1, AllItemCount do
      local Child = self.ScrollBox_Tab:GetChildAt(i - 1)
      Child:SetClickEnable(bEnable)
    end
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

function M:PlayInAnim()
  if self.In == nil then
    return -1
  end
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
  return self.In:GetEndTime()
end

function M:PlayOutAnim()
  if self.Out == nil then
    return -1
  end
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
  return self.Out:GetEndTime()
end

function M:PlayTabInAnim()
  self:StopAnimation(self.Panel_Tab_Out)
  self:PlayAnimation(self.Panel_Tab_In)
end

function M:PlayTabOutAnim()
  self:StopAnimation(self.Panel_Tab_In)
  self:PlayAnimation(self.Panel_Tab_Out)
end

function M:SetBackBtnAttrColor(AttrName)
  AttrName = AttrName or "Fire"
  if self.BackWidget then
    local img = LoadObject("/Game/UI/UI_PC/Common/Material/Noise/MI_Common_Noise_" .. AttrName .. ".MI_Common_Noise_" .. AttrName)
    self.BackWidget.VX_BackWave:SetBrushFromMaterial(img)
  end
end

function M:OnPropSetResources(ResourceId, OldValue)
  self.ResourceBar:OnPropSetResources(ResourceId, OldValue)
end

function M:PlayClickSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
end

function M:UpdateReddots()
  for _, Tab in pairs(self.Tabs) do
    if IsValid(Tab.UI) and Tab.UI.SetReddot then
      Tab.UI:SetReddot(Tab.IsNew, Tab.Upgradeable, Tab.OtherReddot)
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

function M:Handle_KeyEventOnPC(InKeyName)
  local IsEventHandled = true
  if InKeyName == UE4.EKeys.Escape.KeyName then
    self:OnReturnClick()
  else
    IsEventHandled = false
  end
  return IsEventHandled
end

function M:Handle_KeyEventOnGamePad(InKeyName)
  local IsEventHandled = true
  if InKeyName == UIConst.GamePadKey.FaceButtonRight then
    self:OnReturnClick()
  elseif InKeyName == UIConst.GamePadKey.RightThumb then
    self.ResourceBar:FocusToResource()
  elseif InKeyName == UIConst.GamePadKey.SpecialRight then
    self:OnInfoClick()
  else
    IsEventHandled = false
  end
  return IsEventHandled
end

function M:ClickToLeftOnGamePad(OpType)
  self:TabToLeft()
end

function M:ClickToRightOnGamePad(OpType)
  self:TabToRight()
end

function M:OnResourceBarAddedToFocusPath()
  self:EnterResourceSelectMode()
end

function M:OnResourceBarRemovedFromFocusPath()
  self:ExitResourceSelectMode()
end

function M:EnterViewSingleMode(TitleName)
  local TabInfo = self.Tabs[self.CurrentTab]
  if not TabInfo then
    return
  end
  self.IsInViewSingleMode = true
  if TitleName then
    self.Title_Tab:SetText(TitleName .. " / " .. TabInfo.Text)
  else
    self.Title_Tab:SetText(self.TitleName .. " / " .. TabInfo.Text)
  end
  self.ResourceBar:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:LeaveViewSingleMode()
  self.IsInViewSingleMode = false
  self.Text_Title:SetText(self.TitleName)
  self.ResourceBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:EnterResourceSelectMode()
end

function M:ExitResourceSelectMode()
end

function M:SetSingleBottomKeyInfo(BottomKeyWidget, SingleKeyInfo)
  if SingleKeyInfo.KeyInfoList == nil and nil == SingleKeyInfo.GamePadInfoList then
    BottomKeyWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    if SingleKeyInfo.GamePadInfoList then
      if SingleKeyInfo.GamePadInfoList.GamePadSubKeyInfoList then
        if SingleKeyInfo.Desc then
          BottomKeyWidget:CreateSubKeyDesc({
            KeyInfoList = SingleKeyInfo.GamePadInfoList.GamePadSubKeyInfoList,
            Desc = SingleKeyInfo.Desc,
            Type = SingleKeyInfo.GamePadInfoList[1].Type
          })
        else
          BottomKeyWidget:CreateCommonKey({
            KeyInfoList = SingleKeyInfo.GamePadInfoList.GamePadSubKeyInfoList
          })
        end
      else
        BottomKeyWidget:CreateCommonKey({
          KeyInfoList = SingleKeyInfo.GamePadInfoList,
          Desc = SingleKeyInfo.Desc
        })
      end
      BottomKeyWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      BottomKeyWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  elseif SingleKeyInfo.KeyInfoList then
    if SingleKeyInfo.KeyInfoList.SubKeyInfoList then
      if SingleKeyInfo.Desc then
        BottomKeyWidget:CreateSubKeyDesc({
          KeyInfoList = SingleKeyInfo.KeyInfoList.SubKeyInfoList,
          Desc = SingleKeyInfo.Desc,
          Type = SingleKeyInfo.KeyInfoList[1].Type
        })
      else
        BottomKeyWidget:CreateCommonKey({
          KeyInfoList = SingleKeyInfo.KeyInfoList.SubKeyInfoList
        })
      end
    else
      BottomKeyWidget:CreateCommonKey({
        KeyInfoList = SingleKeyInfo.KeyInfoList,
        Desc = SingleKeyInfo.Desc
      })
    end
    BottomKeyWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    BottomKeyWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:UpdateSingleBottomKeyInfo(SubKeyIndex, SingleKeyInfo)
  self.ConfigData.BottomKeyInfo[SubKeyIndex] = SingleKeyInfo
  local BottomKeyWidget = self.BottomKeyWidget[SubKeyIndex]
  if nil ~= BottomKeyWidget then
    if nil == SingleKeyInfo then
      BottomKeyWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self:SetSingleBottomKeyInfo(BottomKeyWidget, SingleKeyInfo)
    end
  else
    BottomKeyWidget = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
    self.BottomKeyWidget[SubKeyIndex] = BottomKeyWidget
    self.Com_KeyTips.Panel_Key:AddChild(BottomKeyWidget)
    self:SetSingleBottomKeyInfo(BottomKeyWidget, SingleKeyInfo)
  end
end

function M:SetSingleBottomKeyInfoVisibility(SubKeyIndex, VisibilityOp)
  local BottomKeyWidget = self.BottomKeyWidget[SubKeyIndex]
  if BottomKeyWidget then
    BottomKeyWidget:SetVisibility(VisibilityOp)
  end
end

function M:UpdateBottomKeyInfo(BottomKeyInfo)
  self.ConfigData.BottomKeyInfo = BottomKeyInfo
  for i, KeyInfo in ipairs(BottomKeyInfo) do
    local BottomKeyWidget = self.BottomKeyWidget[i]
    if not IsValid(BottomKeyWidget) then
      BottomKeyWidget = UIManager(self):_CreateWidgetNew("ComKeyTextDesc")
      self.BottomKeyWidget[i] = BottomKeyWidget
      self.Com_KeyTips.Panel_Key:AddChild(BottomKeyWidget)
    else
      BottomKeyWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
  for i = #BottomKeyInfo + 1, #self.BottomKeyWidget do
    local BottomKeyWidget = self.BottomKeyWidget[i]
    if IsValid(BottomKeyWidget) then
      BottomKeyWidget:RemoveFromParent()
    end
    self.BottomKeyWidget[i] = nil
  end
  self.Com_KeyTips.Panel_Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:UpdateHotKeyInfo(self.CurInputDeviceType)
end

function M:UpdateBottomKeyInfo_Quick(Infos)
  local BottomKeyInfos = {}
  for Index, Info in ipairs(Infos) do
    local BottomKeyInfo = {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = Info[1]
        }
      },
      Desc = Info[2]
    }
    table.insert(BottomKeyInfos, BottomKeyInfo)
  end
  self:UpdateBottomKeyInfo(BottomKeyInfos)
end

function M:SetBottomKeyInfoVisible(bVisible)
  if bVisible then
    self.Com_KeyTips.Panel_Key:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Com_KeyTips.Panel_Key:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:SetResourceAddVisibleByResocurceId(ResourceId, bVisible)
  self.ResourceBar:SetResourceBarVisibility(ResourceId, bVisible)
end

function M:SetResourceAddVisibleByIndex(Index, bVisible)
  self.ResourceBar:SetResourceBarVisibilityByIndex(Index, bVisible)
end

return M
