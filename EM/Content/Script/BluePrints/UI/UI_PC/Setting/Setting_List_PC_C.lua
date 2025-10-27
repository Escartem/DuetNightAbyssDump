require("UnLua")
local S = Class("BluePrints.UI.BP_UIState_C")

function S:Construct()
  self.Super.Construct(self)
  self.GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem()
  self.ChangeKeyDialog = 100206
end

function S:BindEvents()
  self.Button_Area.OnClicked:Add(self, self.OnBtnAreaClicked)
  self.Button_Area.OnPressed:Add(self, self.OnBtnAreaPressed)
  self.Button_Area.OnHovered:Add(self, self.OnBtnAreaHovered)
  self.Button_Area.OnUnhovered:Add(self, self.OnBtnAreaUnhovered)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self.Button_Gamepad.OnClicked:Add(self, self.OnBtnGamepadClicked)
  self.Button_Gamepad.OnHovered:Clear()
  self.Button_Gamepad.OnHovered:Add(self, self.OnBtnGamepadHovered)
  self.Button_Gamepad.OnUnhovered:Clear()
  self.Button_Gamepad.OnUnhovered:Add(self, self.OnBtnGamepadUnhovered)
  self.List_Options.BP_OnItemIsHoveredChanged:Clear()
  self.List_Options.BP_OnItemIsHoveredChanged:Add(self, self.OnItemIsHoverChanged)
end

function S:Init(Parent, TabName, RegionIndex, RegionName, IsInit)
  rawset(self, "Parent", Parent)
  rawset(self, "TabType", TabName)
  rawset(self, "RegionIndex", RegionIndex)
  rawset(self, "RegionDefaultFold", false)
  rawset(self, "BanHover", false)
  rawset(self, "Parent", Parent)
  if "Other" == TabName then
    self.Panel_Title:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Text_Title:SetText(GText(RegionName))
    self.Panel_Title:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if self.Parent.Platform ~= "PC" then
    self.BanHover = true
  end
  self:BindEvents()
  if IsInit then
    self:InitListOptions()
  end
  self:InitFoldState()
  self:SetNavigationRuleCustomBoundary(UE4.EUINavigation.Up, {
    self,
    self.OnNavigateUp
  })
  self:SetNavigationRuleCustomBoundary(UE4.EUINavigation.Down, {
    self,
    self.OnNavigateDown
  })
  self.Button_Gamepad:SetNavigationRuleCustom(UE4.EUINavigation.Down, {
    self,
    function()
      if self.IsListFolded then
        return self:OnNavigateDown()
      end
      local NumItems = self.List_Options:GetNumItems()
      if NumItems <= 0 then
        return self:OnNavigateDown()
      else
        local Entry = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Options, 0)
        if Entry then
          return Entry:GetFirstWidgetToNavigate()
        else
          return self:OnNavigateDown()
        end
      end
      return nil
    end
  })
  self:RefreshOpInfoByInputDevice(UIUtils.UtilsGetCurrentInputType(), UIUtils.UtilsGetCurrentGamepadName(), IsInit)
end

function S:OnItemIsHoverChanged(Item, bIsHovered)
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    local Entry = Item.SelfWidget
    if Entry then
      Entry:Gamepad_SetHovered(bIsHovered)
    end
  end
end

function S:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName, IsInit)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self:UpdateUIStyleInPlatform(self.CurInputDeviceType == ECommonInputType.Gamepad)
  if self.TabType ~= "Key" and self.OptionData and not IsInit then
    local IsReInit
    for i = 0, #self.OptionData do
      local Entry = self.OptionData[i]
      local OptionConfig = DataMgr.Option[Entry and Entry.Cache or ""]
      if OptionConfig then
        if OptionConfig.HideOnKeyboard then
          IsReInit = true
        end
        if OptionConfig.HideOnGamePad then
          IsReInit = true
        end
      end
    end
    if IsReInit then
      local OffSet = self.Parent.GetScrollOffset and self.Parent:GetScrollOffset()
      self:InitListOptions()
      if self.Parent.ScrollToOffset and self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
        self.Parent:ScrollToOffset(OffSet)
      end
    end
  end
end

function S:UpdateUIStyleInPlatform(IsGamepad)
  if IsGamepad then
    self.Button_Gamepad:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Button_Unfold:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  else
    self.Button_Gamepad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Button_Unfold:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function S:OnNavigateUp()
  local NextWidget = self.Parent:OnSettingUINavigateUp(self, self.RegionIndex)
  return NextWidget
end

function S:OnNavigateDown()
  local NextWidget = self.Parent:OnSettingUINavigateDown(self, self.RegionIndex)
  return NextWidget
end

function S:GetFirstWidgetToNavigate()
  if self.Panel_Title:GetVisibility() == UE4.ESlateVisibility.Collapsed then
    local Entry = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Options, 0)
    return Entry:GetFirstWidgetToNavigate()
  else
    return self.Button_Gamepad
  end
end

function S:GetLastWidgetToNavigate()
  if self.IsListFolded then
    return self.Button_Gamepad
  end
  local LastItemIndex = self.List_Options:GetNumItems() - 1
  if LastItemIndex < 0 then
    return self.Button_Gamepad
  end
  local Entry = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Options, LastItemIndex)
  if Entry then
    return Entry:GetLastWidgetToNavigate()
  else
    return self.Button_Gamepad
  end
end

function S:OnBtnGamepadClicked()
  self:OnBtnAreaClicked()
end

function S:OnBtnGamepadHovered()
  self:AddTimer(0.02, function()
    DebugPrint("Tianyi@ OnBtnGamepadHovered")
    self:StopAnimation(self.Title_Gamepad_Select)
    self:PlayAnimationForward(self.Title_Gamepad_Select)
    self.Parent:OnGamepadFocusPanelTitle()
  end)
end

function S:OnBtnGamepadUnhovered()
  self:StopAnimation(self.Title_Gamepad_Select)
  self:PlayAnimationReverse(self.Title_Gamepad_Select)
end

function S:OnBtnAreaClicked()
  self.Parent:ClearSettingListUnfoldState()
  self.Parent:SetSettingUnfoldListPC(false)
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  if self.IsListFolded then
    self.IsListFolded = false
    self:StopAnimation(self.Fold)
    self:PlayAnimation(self.Unfold)
  else
    self.IsListFolded = true
    self:StopAnimation(self.Unfold)
    self:PlayAnimation(self.Fold)
  end
  self.Parent:UpdateEmptyGridCount()
end

function S:OnBtnAreaPressed()
  if self.BanHover then
    return
  end
  self:PlayAnimation(self.Press)
end

function S:OnBtnAreaHovered()
  if self.BanHover then
    return
  end
  self:PlayAnimation(self.Hover)
end

function S:OnBtnAreaUnhovered()
  if self.BanHover then
    return
  end
  self:PlayAnimation(self.Unhover)
end

function S:OnMouseButtonDown(MyGeometry, InKeyEvent)
  if UE4.UKismetInputLibrary.PointerEvent_IsMouseButtonDown(InKeyEvent, UE4.EKeys.LeftMouseButton) then
    self.Parent:OnClickAllLeftMouseButton()
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function S:OnKeyDown(MyGeometry, InKeyEvent)
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function S:IsVisibleOfHideConfig(Cache)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  local CurrentInputType = GameInputModeSubsystem:GetCurrentInputType()
  local OptionConfig = DataMgr.Option[Cache]
  local Visible = 0
  if OptionConfig then
    if OptionConfig.HideOnKeyboard then
      Visible = Visible + CurrentInputType ~= ECommonInputType.Gamepad and 1 or 0
    end
    if OptionConfig.HideOnGamePad then
      Visible = Visible + CurrentInputType == ECommonInputType.Gamepad and 1 or 0
    end
  end
  return 0 == Visible
end

function S:InitListOptions()
  self.List_Options:ClearListItems()
  if self.TabType == "Key" then
    if 1 == self.RegionIndex then
      EventManager:RemoveEvent(EventID.OnUpdateActionMapping, self)
      EventManager:AddEvent(EventID.OnUpdateActionMapping, self, self.OnUpdateEngineActionMapping)
    end
    self:InitKeyListOptions(self.RegionIndex)
  else
    local OptionData = {}
    for key, value in pairs(DataMgr.Option2Tag[self.TabType .. self.Parent.Platform]) do
      local OptionInfo = DataMgr.Option[value]
      local Region = OptionInfo.Region
      if Region and Region == self.RegionIndex and self.Parent:CheckOptionSpecialHide(value, OptionInfo.SpecialHide) then
        self.RegionDefaultFold = OptionInfo.RegionDefaultFold
        table.insert(OptionData, {
          Cache = value,
          SortId = OptionInfo.SortId
        })
      end
    end
    self.OptionCount = #OptionData
    if 0 == self.OptionCount then
      self:SetVisibility(UE4.ESlateVisibility.Collapsed)
      return
    end
    table.sort(OptionData, function(Data1, Data2)
      return Data1.SortId < Data2.SortId
    end)
    self.OptionData = OptionData
    for _, value in ipairs(OptionData) do
      local Visible = self:IsVisibleOfHideConfig(value.Cache)
      if Visible then
        local OptionContent = NewObject(UIUtils.GetCommonItemContentClass())
        OptionContent.Cache = value.Cache
        OptionContent.ParentWidget = self
        
        function OptionContent.UpdateBottomKeyFunc(Params)
          self.Parent:UpdateBottomKey(Params)
        end
        
        function OptionContent.OnItemNavigateUp(Item, Widget)
          return self:OnItemNavigateUp(Item, Widget)
        end
        
        function OptionContent.OnItemNavigateDown(Item, Widget)
          return self:OnItemNavigateDown(Item, Widget)
        end
        
        self.List_Options:AddItem(OptionContent)
      end
    end
    self.List_Options:DisableScroll(true)
    self.List_Options:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function S:OnItemNavigateDown(Item, Widget)
  local TotalNum = self.List_Options:GetNumItems()
  local CurrentItemIndex = self.List_Options:GetIndexForItem(Item)
  if TotalNum <= CurrentItemIndex + 1 then
    return self:OnNavigateDown()
  else
    local NextEntry = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Options, CurrentItemIndex + 1)
    if NextEntry then
      return NextEntry:GetFirstWidgetToNavigate()
    end
    return nil
  end
end

function S:OnItemNavigateUp(Item, Widget)
  local CurrentItemIndex = self.List_Options:GetIndexForItem(Item)
  if CurrentItemIndex <= 0 then
    if self.Button_Gamepad:GetVisibility() == UE4.ESlateVisibility.Visible then
      return self.Button_Gamepad
    else
      return self:OnNavigateUp()
    end
  else
    local NextEntry = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Options, CurrentItemIndex - 1)
    if NextEntry then
      return NextEntry:GetLastWidgetToNavigate()
    end
    return nil
  end
end

function S:InitFoldState()
  if self.RegionDefaultFold then
    self:PlayAnimation(self.Fold_Normal)
    self.IsListFolded = true
  else
    self:PlayAnimation(self.Unfold_Normal)
    self.IsListFolded = false
  end
end

function S:GetCurrentStateGrideCount()
  if self.IsListFolded then
    return 1
  else
    local Count = 0
    if self.TabType == "Key" then
      Count = self.List_Options:GetNumItems()
    else
      for key, value in pairs(DataMgr.Option2Tag[self.TabType .. self.Parent.Platform]) do
        local OptionInfo = DataMgr.Option[value]
        local Region = OptionInfo.Region
        if Region and Region == self.RegionIndex and self.Parent:CheckOptionSpecialHide(value, OptionInfo.SpecialHide) then
          if OptionInfo.SubOptionName then
            Count = Count + 2
          else
            Count = Count + 1
          end
        end
      end
    end
    if self.TabType == "Other" then
      return Count
    else
      if 0 == Count then
        return Count
      end
      return Count + 1
    end
  end
end

function S:SetEmptyGrid(Parent, Nums)
  self.Parent = Parent
  self.Panel_Title:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.List_Options:ClearListItems()
  for i = 1, Nums do
    local OptionContent = NewObject(UIUtils.GetCommonItemContentClass())
    OptionContent.Cache = "Empty"
    OptionContent.ParentWidget = self
    self.List_Options:AddItem(OptionContent)
  end
  self.List_Options:DisableScroll(true)
  self.List_Options:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
end

function S:RestoreDefaultListSet()
  for i = 0, self.List_Options:GetNumItems() - 1 do
    local Item = self.List_Options:GetItemAt(i)
    if Item and Item.SelfWidget and Item.SelfWidget.RestoreDefaultOptionSet then
      Item.SelfWidget:RestoreDefaultOptionSet()
    end
  end
end

function S:SaveListSetting()
  for i = 0, self.List_Options:GetNumItems() - 1 do
    local Item = self.List_Options:GetItemAt(i)
    if Item and Item.SelfWidget and Item.SelfWidget.SaveOptionSetting then
      Item.SelfWidget:SaveOptionSetting()
    end
  end
end

function S:RestoreListOldValueSet()
  for i = 0, self.List_Options:GetNumItems() - 1 do
    local Item = self.List_Options:GetItemAt(i)
    if Item and Item.SelfWidget and Item.SelfWidget.RestoreOldValueOptionSet then
      Item.SelfWidget:RestoreOldValueOptionSet()
    end
  end
end

function S:InitKeySettingParameter()
  self.IsCanChanged = false
  self.HasBeenChanged = false
  self.OldActionMappings = {}
  self.NewActionMappingKeyName = {}
  self.KeyMappingAction = {}
  self.ActionMappingKey = {}
  self.AllKeyMappingAction = {}
  self.AllActionMappingKey = {}
  self.SelectKeyContent = nil
  self.InputSetting = nil
  self.ContentIndexWithAction = {}
end

function S:InitKeyListOptions(RegionIndex)
  self:InitKeySettingParameter()
  self.List_Options:ClearListItems()
  local KeyData = DataMgr.KeyboardMap
  self.KeyCanChanged = {}
  self.KeyIsActionMapping = {}
  self.KeyRemain = {}
  for ActionName, Data in pairs(KeyData) do
    if not Data.IsShowInSetting then
    elseif Data.CanChanged then
      table.insert(self.KeyCanChanged, Data)
      self.AllActionMappingKey[ActionName] = Data.Key
      self.ActionMappingKey[ActionName] = Data.Key
    elseif Data.IsActionMapping then
      table.insert(self.KeyIsActionMapping, Data)
      self.AllActionMappingKey[ActionName] = Data.Key
    else
      table.insert(self.KeyRemain, Data)
      self.AllActionMappingKey[ActionName] = Data.Key
    end
  end
  self.ContentId = 1
  if 1 == RegionIndex then
    self:GetEngineActionMapping()
    self:AddKeyOptionContentItem(self.KeyCanChanged)
  else
    self:AddKeyOptionContentItem(self.KeyIsActionMapping)
    self:AddKeyOptionContentItem(self.KeyRemain)
  end
end

function S:AddKeyOptionContentItem(KeyTable)
  table.sort(KeyTable, function(a, b)
    if a.SortId and b.SortId then
      return a.SortId < b.SortId
    else
      return a < b
    end
  end)
  for idx, Data in ipairs(KeyTable) do
    local KeyOptionContent = NewObject(UIUtils.GetCommonItemContentClass())
    KeyOptionContent.Index = self.ContentId
    KeyOptionContent.Cache = "Click"
    self.ContentIndexWithAction[Data.ActionName] = self.ContentId - 1
    self.ContentId = self.ContentId + 1
    KeyOptionContent.ActionName = Data.ActionName
    KeyOptionContent.ActionNameText = GText(Data.ActionNameText)
    local KeyName = Data.Key
    if self.ActionMappingKey[Data.ActionName] then
      KeyName = self.ActionMappingKey[Data.ActionName]
    end
    KeyOptionContent.Key = KeyName
    KeyOptionContent.KeyText = CommonUtils:GetKeyText(KeyName)
    if Data.CanChanged then
      KeyOptionContent.IsCanChanged = Data.CanChanged
    else
      KeyOptionContent.IsCanChanged = false
    end
    KeyOptionContent.ParentWidget = self
    
    function KeyOptionContent.UpdateBottomKeyFunc(Params)
      self.Parent:UpdateBottomKey(Params)
    end
    
    function KeyOptionContent.OnItemNavigateUp(Item, Widget)
      return self:OnItemNavigateUp(Item, Widget)
    end
    
    function KeyOptionContent.OnItemNavigateDown(Item, Widget)
      return self:OnItemNavigateDown(Item, Widget)
    end
    
    self.List_Options:AddItem(KeyOptionContent)
  end
  self.List_Options:DisableScroll(true)
  self.List_Options:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
end

function S:GetEngineActionMapping()
  self.InputSetting = UE4.UInputSettings.GetInputSettings()
  local ActionMappings = self.InputSetting.ActionMappings:ToTable()
  self.OldActionMappings = {}
  for k, v in ipairs(ActionMappings) do
    local Res = string.find(v.Key.KeyName, "Gamepad")
    local Res2 = string.find(v.ActionName, "Talk")
    if nil == Res2 and nil == Res and DataMgr.KeyboardMap[v.ActionName] then
      self.OldActionMappings[v.ActionName] = v
      self.AllActionMappingKey[v.ActionName] = v.Key.KeyName
      if self.ActionMappingKey[v.ActionName] then
        self.ActionMappingKey[v.ActionName] = v.Key.KeyName
      end
    end
  end
  local AxisMappings = self.InputSetting.AxisMappings:ToTable()
  for k, v in ipairs(AxisMappings) do
    local Res = string.find(v.Key.KeyName, "Gamepad")
    local Res2 = string.find(v.AxisName, "Talk")
    if nil == Res2 and nil == Res and DataMgr.AxisName2ActionName[v.AxisName] then
      local Scale = tostring(v.Scale)
      local ActionName = DataMgr.AxisName2ActionName[v.AxisName][Scale]
      if ActionName then
        self.OldActionMappings[ActionName] = v
        self.AllActionMappingKey[ActionName] = v.Key.KeyName
        if self.ActionMappingKey[ActionName] then
          self.ActionMappingKey[ActionName] = v.Key.KeyName
        end
      end
    end
  end
  self:CheckAvatar()
  self:InitKeyMappingAction()
end

function S:OnUpdateKeyMappingTable(NewKeyName, IsNeedSwitch)
  if 2 == self.RegionIndex then
    return
  end
  local ConflictAction = ""
  local ConflictKey = ""
  if IsNeedSwitch then
    self.NewActionMappingKeyName[self.SelectKeyContent.ActionName] = NewKeyName
    ConflictAction = self.AllKeyMappingAction[NewKeyName]
    ConflictKey = self.SelectKeyContent.Key
    self.NewActionMappingKeyName[self.AllKeyMappingAction[NewKeyName]] = self.SelectKeyContent.Key
    local TempActionName = self.AllKeyMappingAction[NewKeyName]
    self.AllKeyMappingAction[NewKeyName] = self.SelectKeyContent.ActionName
    self.AllKeyMappingAction[self.SelectKeyContent.Key] = TempActionName
    self.KeyMappingAction[NewKeyName] = self.AllKeyMappingAction[NewKeyName]
    self.KeyMappingAction[self.SelectKeyContent.Key] = self.AllKeyMappingAction[self.SelectKeyContent.Key]
    self.ActionMappingKey[self.KeyMappingAction[NewKeyName]] = NewKeyName
    self.ActionMappingKey[self.KeyMappingAction[self.SelectKeyContent.Key]] = self.SelectKeyContent.Key
    self.AllActionMappingKey[self.KeyMappingAction[NewKeyName]] = NewKeyName
    self.AllActionMappingKey[self.KeyMappingAction[self.SelectKeyContent.Key]] = self.SelectKeyContent.Key
  else
    self.NewActionMappingKeyName[self.SelectKeyContent.ActionName] = NewKeyName
    self.AllKeyMappingAction[self.SelectKeyContent.Key] = nil
    self.KeyMappingAction[self.SelectKeyContent.Key] = nil
    self.AllKeyMappingAction[NewKeyName] = self.SelectKeyContent.ActionName
    self.KeyMappingAction[NewKeyName] = self.AllKeyMappingAction[NewKeyName]
    self.ActionMappingKey[self.KeyMappingAction[NewKeyName]] = NewKeyName
    self.AllActionMappingKey[self.KeyMappingAction[NewKeyName]] = NewKeyName
  end
  self:InitKeyMappingAction()
  self:CheckNewActionMappingKeyName()
  if IsNeedSwitch then
    self.SelectKeyContent.ClickWidget:ChangeKeyText(NewKeyName)
    local ConflictContent = self.List_Options:GetItemAt(self.ContentIndexWithAction[ConflictAction])
    ConflictContent.ClickWidget:ChangeKeyText(ConflictKey)
  else
    self.SelectKeyContent.ClickWidget:ChangeKeyText(NewKeyName)
  end
  self.IsCanChanged = false
end

function S:CheckNewActionMappingKeyName()
  if 2 == self.RegionIndex then
    return
  end
  local Avatar = GWorld:GetAvatar()
  local IsDifferent = false
  if Avatar and Avatar.ActionMapping then
    for ActionName, KeyName in pairs(self.NewActionMappingKeyName) do
      if Avatar.ActionMapping[ActionName] ~= KeyName then
        IsDifferent = true
      end
    end
  end
  if IsDifferent then
    self.Parent.HasBeenChanged = true
    self.HasBeenChanged = true
    self.Parent:UpdateKeyboardBottonKey()
  else
    self.Parent.HasBeenChanged = false
    self.HasBeenChanged = false
    self.NewActionMappingKeyName = {}
    self.Parent:UpdateKeyboardBottonKey()
  end
end

function S:CheckAvatar()
  if self.ActionMappingKey.Jump == nil then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar and 0 == Avatar.ActionMapping:Length() then
    self.Parent:BlockAllUIInput(true)
    Avatar:UpdateActionMapping(self.ActionMappingKey)
  end
end

function S:InitKeyMappingAction()
  if 2 == self.RegionIndex then
    return
  end
  self.AllKeyMappingAction = {}
  self.KeyMappingAction = {}
  for ActionName, KeyName in pairs(self.AllActionMappingKey) do
    self.AllKeyMappingAction[KeyName] = ActionName
  end
  for ActionName, KeyName in pairs(self.ActionMappingKey) do
    self.KeyMappingAction[KeyName] = ActionName
  end
end

function S:OnClickListOption(Content)
  UIUtils.PlayCommonBtnSe(self)
  self.SelectKeyContent = Content
  if self.SelectKeyContent.IsCanChanged then
    local SelectKeyContent = {}
    SelectKeyContent.ActionName = self.SelectKeyContent.ActionName
    SelectKeyContent.ActionNameText = self.SelectKeyContent.ActionNameText
    SelectKeyContent.Key = self.AllActionMappingKey[self.SelectKeyContent.ActionName]
    SelectKeyContent.KeyText = CommonUtils:GetKeyText(SelectKeyContent.Key)
    local Params = {}
    Params.StateName = "Set"
    Params.ActionNameText = self.SelectKeyContent.ActionNameText
    Params.OldKeyText = CommonUtils:GetKeyText(SelectKeyContent.Key)
    Params.OldKey = SelectKeyContent.Key
    Params.LeftCallbackObj = self
    Params.LeftCallbackFunction = self.CancelChangeKey
    Params.RightCallbackObj = self
    Params.RightCallbackFunction = self.ConfirmChangeKey
    Params.OnKeyDownCallbackObj = self
    Params.OnKeyDownCallbackFunction = self.OnKeyDownCallbackFunction
    Params.OnMouseDownCallbackObj = self
    Params.OnMouseDownCallbackFunction = self.OnMouseDownCallbackFunction
    Params.ForbidRightBtn = true
    Params.Tips = {
      [1] = GText("UI_COMMONPOP_TEXT_100033_2")
    }
    self.PopupUI = UIManager(self):ShowCommonPopupUI(self.ChangeKeyDialog, Params, self.Parent)
    if self.PopupUI then
      self.PopupUI.CloseMask:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    UIManager(self):ShowUITip("CommonToastMain", GText("UI_OPTION_ChangeForbidden"))
  end
end

function S:OnMouseDownCallbackFunction(MyGeometry, InKeyEvent)
  local NewKeyName
  if UE4.UKismetInputLibrary.PointerEvent_IsMouseButtonDown(InKeyEvent, UE4.EKeys.LeftMouseButton) then
    NewKeyName = "LeftMouseButton"
    self:OnKeyDownCallbackFunction(NewKeyName)
  elseif UE4.UKismetInputLibrary.PointerEvent_IsMouseButtonDown(InKeyEvent, UE4.EKeys.RightMouseButton) then
    NewKeyName = "RightMouseButton"
    self:OnKeyDownCallbackFunction(NewKeyName)
  end
end

function S:OnKeyDownCallbackFunction(NewKeyName)
  if UE4.UKismetStringLibrary.StartsWith(NewKeyName, "GamePad") then
    return
  end
  self.ConflictKeyName = nil
  local KeyData = DataMgr.KeyboardText
  local Params = {}
  Params.OldKeyText = CommonUtils:GetKeyText(self.SelectKeyContent.Key)
  Params.LeftCallbackObj = self
  Params.LeftCallbackFunction = self.CancelChangeKey
  Params.RightCallbackObj = self
  Params.RightCallbackFunction = self.ConfirmChangeKey
  Params.OnKeyDownCallbackObj = self
  Params.StateName = "Set"
  Params.OnKeyDownCallbackFunction = self.OnKeyDownCallbackFunction
  Params.OnMouseDownCallbackObj = self
  Params.OnMouseDownCallbackFunction = self.OnMouseDownCallbackFunction
  Params.ActionNameText = self.SelectKeyContent.ActionNameText
  self.KeyIsChanged = true
  if NewKeyName == self.SelectKeyContent.Key then
    self.KeyIsChanged = false
    self.IsConflict = false
    Params.ForbidRightBtn = true
    Params.DialogItemIndex = 1
    Params.Tips = {
      [1] = GText("UI_COMMONPOP_TEXT_100033_2")
    }
    self:UpdateDialog(Params, 1)
    return
  end
  self.NewKeyName = NewKeyName
  self.IsConflict = false
  if nil == KeyData[NewKeyName] then
    self.KeyIsChanged = false
    Params.StateName = "ChangeSecond"
    Params.NewKeyText = NewKeyName
    Params.NewKey = NewKeyName
    Params.ForbidRightBtn = true
    Params.DialogItemIndex = 3
    Params.Tips = {
      [3] = GText("UI_OPTION_CanNotUseThisKey")
    }
    AudioManager(self):PlayUISound(self, "event:/ui/common/input_err", "", nil)
    self:UpdateDialog(Params, 3)
  elseif self.AllKeyMappingAction[NewKeyName] and DataMgr.KeyboardMap[self.AllKeyMappingAction[NewKeyName]] and nil == DataMgr.KeyboardMap[self.AllKeyMappingAction[NewKeyName]].CanChanged then
    self.KeyIsChanged = false
    Params.StateName = "ChangeSecond"
    Params.NewKeyText = CommonUtils:GetKeyText(NewKeyName)
    Params.NewKey = NewKeyName
    Params.DialogItemIndex = 3
    Params.Tips = {
      [3] = string.format(GText("UI_COMMONPOP_TEXT_100035"), GText(DataMgr.KeyboardMap[self.AllKeyMappingAction[NewKeyName]].ActionNameText))
    }
    Params.ForbidRightBtn = true
    AudioManager(self):PlayUISound(self, "event:/ui/common/input_err", "", nil)
    self:UpdateDialog(Params, 3)
  elseif self.KeyMappingAction[NewKeyName] and self.KeyMappingAction[self.SelectKeyContent.Key] and self.KeyMappingAction[NewKeyName] ~= self.KeyMappingAction[self.SelectKeyContent.Key] then
    self.ConflictKeyName = NewKeyName
    self.IsConflict = true
    Params.ForbidRightBtn = false
    Params.NewKeyText = CommonUtils:GetKeyText(NewKeyName)
    Params.NewKey = NewKeyName
    Params.StateName = "ChangeFirst"
    Params.DialogItemIndex = 2
    Params.Tips = {
      [2] = string.format(GText("UI_COMMONPOP_TEXT_100036"), GText(DataMgr.KeyboardMap[self.AllKeyMappingAction[NewKeyName]].ActionNameText))
    }
    AudioManager(self):PlayUISound(self, "event:/ui/common/err_action_warning", "", nil)
    self:UpdateDialog(Params, 2)
  else
    UIUtils.PlayCommonBtnSe(self)
    Params.StateName = "ChangeFirst"
    Params.NewKeyText = CommonUtils:GetKeyText(NewKeyName)
    Params.NewKey = NewKeyName
    Params.ForbidRightBtn = false
    Params.DialogItemIndex = 1
    Params.Tips = {
      [1] = GText("UI_COMMONPOP_TEXT_100034")
    }
    self:UpdateDialog(Params, 1)
  end
end

function S:UpdateDialog(Params)
  if not self.PopupUI then
    return
  end
  local ItemWidget = self.PopupUI:GetContentWidgetByName("ChangeKey")
  if ItemWidget and ItemWidget.UpdateState then
    ItemWidget:UpdateState(Params)
  end
  self.PopupUI:ForbidRightBtn(Params.ForbidRightBtn)
  self.PopupUI:BroadcastDialogEvent("UpdateDialogTipText", Params)
  self.PopupUI:HideDialogTip(1, false)
  self.PopupUI:HideDialogTip(2, false)
  self.PopupUI:HideDialogTip(3, false)
  self.PopupUI:ShowDialogTip(Params.DialogItemIndex, true)
  self.PopupUI.CloseMask:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function S:CancelChangeKey()
  self.KeyIsChanged = false
  self.IsConfirm = nil
end

function S:ConfirmChangeKey()
  if self.KeyIsChanged then
    self:OnUpdateKeyMappingTable(self.NewKeyName, self.IsConflict)
    self.KeyIsChanged = false
    self.IsConfirm = nil
  end
end

function S:OnUpdateEngineActionMapping(Ret, ActionMapping)
  self.Parent:BlockAllUIInput(false)
  if 2 == self.RegionIndex then
    return
  end
  if ErrorCode:Check(Ret) then
    local AddActionList = {}
    for ActionName, KeyName in pairs(ActionMapping) do
      if self.OldActionMappings[ActionName].Key.KeyName ~= KeyName then
        local ActionInfo = DataMgr.KeyboardMap[ActionName]
        if ActionInfo and ActionInfo.AxisActionName then
          local NewKey = UE4.EKeys[KeyName]
          if NewKey then
            self.InputSetting:RemoveAxisMapping(self.OldActionMappings[ActionName])
            local Scale = tonumber(ActionInfo.Scale)
            self.OldActionMappings[ActionName].Key = NewKey
            self.OldActionMappings[ActionName].Scale = Scale
            table.insert(AddActionList, self.OldActionMappings[ActionName])
            HeroUSDKSubsystem():UploadTrackLog_Lua("key_bindings", {
              key_bindings_info = {key_name = ActionName, key_binding = KeyName}
            })
          end
        else
          local NewKey = UE4.EKeys[KeyName]
          if NewKey then
            self.InputSetting:RemoveActionMapping(self.OldActionMappings[ActionName])
            self.OldActionMappings[ActionName].Key = NewKey
            self.InputSetting:AddActionMapping(self.OldActionMappings[ActionName])
            self.InputSetting:SaveKeyMappings()
            HeroUSDKSubsystem():UploadTrackLog_Lua("key_bindings", {
              key_bindings_info = {key_name = ActionName, key_binding = KeyName}
            })
          end
        end
      end
    end
    for _, value in pairs(AddActionList) do
      self.InputSetting:AddAxisMapping(value)
    end
    self.InputSetting:SaveKeyMappings()
    if self.HasBeenChanged then
      UIManager(self):ShowUITip("CommonToastMain", GText("UI_OPTION_ChangeKeySuccess"))
    end
    self.IsCanChanged = false
    self.HasBeenChanged = false
    self.NewActionMappingKeyName = {}
    EventManager:FireEvent(EventID.OnChangeKeyBoardSet)
  else
    UIManager(self):ShowUITip("CommonToastMain", GText("UI_OPTION_ChangeKeyFail"))
  end
  if self.Parent.AutoClose then
    self.Parent:CloseSelf()
  end
end

function S:SaveKeySetting()
  if 2 == self.RegionIndex then
    return
  end
  if self.ActionMappingKey.Jump == nil then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.Parent:BlockAllUIInput(true)
    Avatar:UpdateActionMapping(self.ActionMappingKey)
  end
end

function S:RestoreDefaultKeySet()
  if 2 == self.RegionIndex then
    return
  end
  local AddActionList = {}
  for ActionName, ActionMapping in pairs(self.OldActionMappings) do
    local DefaultKeyName
    local ActionInfo = DataMgr.KeyboardMap[ActionName]
    if ActionInfo then
      DefaultKeyName = ActionInfo.Key
    end
    if nil ~= DefaultKeyName and ActionMapping.Key.KeyName ~= DefaultKeyName then
      if ActionInfo.AxisActionName then
        local NewKey = UE4.EKeys[DefaultKeyName]
        if NewKey then
          self.InputSetting:RemoveAxisMapping(self.OldActionMappings[ActionName])
          local Scale = tonumber(ActionInfo.Scale)
          ActionMapping.Key = NewKey
          ActionMapping.Scale = Scale
          table.insert(AddActionList, self.OldActionMappings[ActionName])
          HeroUSDKSubsystem():UploadTrackLog_Lua("key_bindings", {
            key_bindings_info = {key_name = ActionName, key_binding = DefaultKeyName}
          })
        end
      else
        self.InputSetting:RemoveActionMapping(ActionMapping)
        local NewKey = UE4.EKeys[DefaultKeyName]
        if NewKey then
          ActionMapping.Key = NewKey
          self.InputSetting:AddActionMapping(ActionMapping)
          HeroUSDKSubsystem():UploadTrackLog_Lua("key_bindings", {
            key_bindings_info = {key_name = ActionName, key_binding = DefaultKeyName}
          })
        end
      end
    end
  end
  for _, value in pairs(AddActionList) do
    self.InputSetting:AddAxisMapping(value)
  end
  self.InputSetting:SaveKeyMappings()
  self.ActionMappingKey = {}
  for ActionName, Data in pairs(self.KeyCanChanged) do
    self.ActionMappingKey[Data.ActionName] = Data.Key
  end
  self:SaveKeySetting()
  self:InitKeyListOptions(self.RegionIndex)
end

function S:SaveSetting()
  if self.TabType == "Key" then
    self:SaveKeySetting()
  end
end

function S:RestoreDefaultSet()
  if self.TabType == "Key" then
    self:RestoreDefaultKeySet()
  else
    self:RestoreDefaultListSet()
  end
end

function S:RestoreOldValueSet()
  if self.TabType == "Key" then
  else
    self:RestoreListOldValueSet()
  end
end

function S:ClearSettingOptionUnfoldState()
  for i = 0, self.List_Options:GetNumItems() - 1 do
    local Item = self.List_Options:GetItemAt(i)
    if Item and Item.SelfWidget and Item.SelfWidget.ClearUnfoldState then
      Item.SelfWidget:ClearUnfoldState()
    end
  end
end

function S:OnClickLeftMouseButton()
  if self.TabType ~= "Key" then
    for i = 0, self.List_Options:GetNumItems() - 1 do
      local Item = self.List_Options:GetItemAt(i)
      if Item and Item.SelfWidget and Item.SelfWidget.OnClickLeftMouseButton then
        Item.SelfWidget:OnClickLeftMouseButton()
      end
    end
  end
end

function S:PlayInAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:PlayAnimation(self.In)
end

function S:OnParentTabSwitch()
  if self.TabType ~= "Key" then
    for i = 0, self.List_Options:GetNumItems() - 1 do
      local Item = self.List_Options:GetItemAt(i)
      if Item and Item.SelfWidget and Item.SelfWidget.OnParentTabSwitch then
        Item.SelfWidget:OnParentTabSwitch()
      end
    end
  end
end

function S:OnParentClosed()
  EventManager:RemoveEvent(EventID.OnUpdateActionMapping, self)
end

function S:CloseAllParent()
  self.Parent:CloseSelfAndEsc()
end

function S:ShowVoiceResourcePopup()
  for i = 0, self.List_Options:GetNumItems() - 1 do
    local Item = self.List_Options:GetItemAt(i)
    if Item and Item.Cache == "SystemVoice" and Item.SelfWidget and Item.SelfWidget.Switcher_Option:GetActiveWidget() then
      Item.SelfWidget.Switcher_Option:GetActiveWidget():ShowVoiceResourcePopup()
    end
  end
end

return S
