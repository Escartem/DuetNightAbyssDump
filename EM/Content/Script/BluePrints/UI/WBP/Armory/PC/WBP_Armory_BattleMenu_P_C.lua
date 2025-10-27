require("UnLua")
local FSM = require("Blueprints.UI.FocusStateMachine")
local M = Class("BluePrints.UI.WBP.Armory.WBP_Armory_BattleMenu_Base_C")
M._components = {
  "BluePrints.UI.KeyInputComponent"
}
local FocusStates = {
  List = "List",
  ListToWheel = "ListToWheel",
  WheelToList = "WheelToList",
  Wheel = "Wheel",
  WheelItem = "WheelItem",
  Plan = "Plan",
  PhantomConfig = "PhantomConfig",
  Tips = "Tips"
}

function M:IsWheelFocusState(StateName)
  return StateName == FocusStates.Wheel or StateName == FocusStates.WheelItem or StateName == FocusStates.ListToWheel
end

function M:IsListFocusState(StateName)
  return StateName == FocusStates.List or StateName == FocusStates.WheelToList
end

function M:Construct()
  self.bIsFocusable = true
  self.AnalogValue = FVector2D(0, 0)
  self.KeyDownEvents = {}
  self.IsKeyDown = {}
  self.Btn_Config:SetGamePadImg("RS")
  self.Key_LT:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LT"}
    }
  })
  self.Key_RT:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RT"}
    }
  })
  self.KeyInfo_A = {
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = ""
  }
  self.Btn_Wipe:SetButtonIsLongPress(true)
  self.Btn_Wipe:SetGamePadImg("X")
  self.Key_A:CreateCommonKey(self.KeyInfo_A)
  self:CreateBottomKeyInfo()
  self.FSM = FSM:New(self, {
    StateNames = FocusStates,
    OnStateChanged = self.OnFocusStateChanged,
    CheckFunction = self.IsFocusStateValid
  })
  self.Arrow_L.Btn.bIsFocusable = false
  self.Arrow_R.Btn.bIsFocusable = false
  M.Super.Construct(self)
  self:InitNavigationRules()
  self:AddInputMethodChangedListen()
  self:RefreshOpInfoByInputDevice(UIUtils.UtilsGetCurrentInputType())
end

function M:InitNavigationRules()
  for index, value in ipairs(self.CurWheelBtns) do
    value.bIsFocusable = false
  end
  
  local function func()
    return self.List_Item
  end
  
  self.List_Item:SetNavigationRuleCustom(EUINavigation.Left, func)
  self.List_Item:SetNavigationRuleCustom(EUINavigation.Right, func)
  self.List_Item:SetNavigationRuleCustom(EUINavigation.Down, func)
  self.List_Item:SetNavigationRuleCustom(EUINavigation.Up, func)
  self.BattleMenu_Plan:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.BattleMenu_Plan:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.BattleMenu_Plan:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.BattleMenu_Plan:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.Tips_Item:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.Tips_Item:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.Tips_Item:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.Tips_Item:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
end

function M:EndWheelAnimation()
  M.Super.EndWheelAnimation(self)
  if self.IsGamepadInput then
    if self.FSM:Peak().Name == FocusStates.Wheel then
      self.CurWheelWidget:EnablePointerDetection(false)
      self.CurWheelWidget.bIsFocusable = true
    else
      self:EnableWheelWidgetPointerDetection(self.CurWheelWidget, true)
    end
  else
    self:EnableWheelWidgetPointerDetection(self.CurWheelWidget, true)
  end
  self:InitWheelNavigationRules()
end

function M:CreateBottomKeyInfo()
  self.RightMouseButtonKeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = "RightMouseButton"
      }
    },
    Desc = GText("UI_Mod_QuickEquip")
  }
  self.FocusToListKeyInfoList = {
    GamePadInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    },
    Desc = GText("UI_CTL_Focus_List")
  }
  self.SubTabKeyInfoList = {
    KeyInfoList = {
      {
        Type = "Or",
        ImgShortPath = CommonUtils:GetKeyText("Mouse_Button"),
        Owner = self
      },
      SubKeyInfoList = {
        {
          Type = "Text",
          Text = CommonUtils:GetKeyText(EKeys.A.KeyName),
          Owner = self
        },
        {
          Type = "Text",
          Text = CommonUtils:GetKeyText(EKeys.D.KeyName),
          Owner = self
        }
      }
    },
    Desc = GText("BattleWheel_SwitchWheel")
  }
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.IsGamepadInput = CurInputDevice == ECommonInputType.Gamepad
  self.AnalogValue.X = 0
  self.AnalogValue.Y = 0
  if self.IsInFocusPath then
    local State = self.FSM:Peak()
    local StateName = State.Name
    if self.IsGamepadInput then
      local IsStateValid = self:IsFocusStateValid(State)
      if not IsStateValid or not self:IsStateHasAnyFocus(State) then
        local Widget = self:GetDesiredFocusTarget()
        if Widget then
          Widget:SetFocus()
        end
      end
    elseif StateName == FocusStates.ListToWheel or StateName == FocusStates.WheelToList then
      self:CancelPreInstallMode()
      self.FSM:Clear()
    end
  end
  self:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
end

function M:GetDesiredFocusTarget()
  local State = self.FSM:Peak()
  local StateName = State.Name
  if StateName == FocusStates.Tips then
    local Btn = self.Tips_Item:GetFirstJumpItem()
    if Btn then
      return Btn
    else
      return self.CurWheelWidget
    end
  end
  if IsValid(State.Widget) then
    return State.Widget
  elseif StateName == FocusStates.List or StateName == FocusStates.WheelToList then
    return self:NavigateToList(State.Content)
  else
    return self.CurWheelWidget
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  M.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputDevice, CurGamepadName)
  if self.IsInFocusPath then
    self:OnFocusChanged()
  end
end

function M:InitKeyEvents()
  self:ClearAllKeyEvents()
  self:AddKeyDownEvent(EKeys.Escape.KeyName, self.OnBackKeyDown)
  self:AddKeyDownEvent(EKeys.A.KeyName, self.OnWheelToLeftBtnClicked)
  self:AddKeyDownEvent(EKeys.D.KeyName, self.OnWheelToRightBtnClicked)
  self:AddKeyDownEvent(UIConst.GamePadKey.FaceButtonRight, self.OnBackKeyDown)
  if not self.IsGamepadInput then
    return
  end
  local StateName = self.FSM:Peak().Name
  if StateName ~= FocusStates.Plan then
    self:AddKeyDownEvent(UIConst.GamePadKey.RightThumb, self.OnRightThumbKeyDown)
    self:AddKeyDownEvent(UIConst.GamePadKey.LeftThumb, self.OnFocusToPlanKeyDown)
    self:AddKeyDownEvent(UIConst.GamePadKey.LeftTriggerThreshold, self.OnFilterToLeftKeyDown)
    self:AddKeyDownEvent(UIConst.GamePadKey.RightTriggerThreshold, self.OnFilterToRightKeyDown)
    self:AddKeyDownEvent(UIConst.GamePadKey.FaceButtonBottom, self.OnFaceButtonBottomKeyDown)
    if StateName ~= FocusStates.WheelToList then
      self:AddKeyUpEvent(UIConst.GamePadKey.FaceButtonLeft, self.OnFaceButtonLeftKeyUp)
    end
    self:AddKeyDownEvent(UIConst.GamePadKey.FaceButtonTop, self.OnFaceButtonTopKeyDown)
    self:AddKeyDownEvent(UIConst.GamePadKey.SpecialLeft, self.OnSpecialLeftKeyDown)
  end
  if StateName == FocusStates.WheelItem or StateName == FocusStates.ListToWheel then
    self.CurWheelWidget:EnablePointerDetection(true)
  else
    self.CurWheelWidget:EnablePointerDetection(false)
  end
  if next(self.WheelContens) and StateName ~= FocusStates.WheelToList then
    self:AddLongPressEvent(UIConst.GamePadKey.FaceButtonLeft, 1.5, self.OnClearWheelLongPressStart, self.OnClearWheelLongPressCancel, self.OnClearWheelLongPressEnd)
  end
end

function M:InitBottomKeyInfo()
  local BottomKeyInfo = {}
  if self.IsGamepadInput then
    local StateName = self.FSM:Peak().Name
    if StateName == FocusStates.Wheel then
      table.insert(BottomKeyInfo, self.FocusToListKeyInfoList)
    end
  else
    table.insert(BottomKeyInfo, self.RightMouseButtonKeyInfoList)
    if self:HasKeyDownEvent(EKeys.A.KeyName) then
      table.insert(BottomKeyInfo, self.SubTabKeyInfoList)
    end
  end
  table.insert(BottomKeyInfo, self.Parent.ESCKeyInfoList)
  self.Parent:UpdateBottomKeyInfo(BottomKeyInfo)
  self.BottomKeyInfo = BottomKeyInfo
  self.FaceButtonLeftKeyWidget = self.Btn_Wipe.Key_GamePad
end

function M:NavigateToList(Content)
  Content = Content or self.ItemtDetailContent
  local Idx = self.List_Item:GetIndexForItem(Content)
  if Idx < 0 then
    Content = self.List_Item:GetItemAt(0)
    Idx = Content and 0
  end
  if Idx and Idx >= 0 and Content.Id then
    self.List_Item:BP_CancelScrollIntoView()
    self.List_Item:BP_SetSelectedItem(Content)
    self.List_Item:BP_NavigateToItem(Content)
    if Content.SelfWidget then
      return Content.SelfWidget
    end
  end
  return self.List_Item
end

function M:OnBackKeyDown()
  if self:IsShowingItemDetail() then
    self:HideItemDetail()
    if not self.IsGamepadInput then
      return UIUtils.Handled, true
    end
  end
  if self.IsGamepadInput then
    self:CancelPreInstallMode()
    local State = self.FSM:Pop()
    local BackState = self.FSM:Peak()
    local BackStateName = BackState.Name
    if not self:IsFocusStateValid(BackState) then
      if State.Name ~= FocusStates.Wheel then
        return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.CurWheelWidget), true
      end
    elseif BackStateName == FocusStates.Wheel then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), BackState.Widget), true
    elseif BackStateName == FocusStates.WheelItem then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), BackState.Widget), true
    elseif BackStateName == FocusStates.ListToWheel then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), BackState.Widget), true
    elseif BackStateName == FocusStates.List then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self:NavigateToList(BackState.Content)), true
    elseif BackStateName == FocusStates.WheelToList then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self:NavigateToList(BackState.Content)), true
    end
  end
end

function M:OnWheelToLeftBtnClicked(...)
  M.Super.OnWheelToLeftBtnClicked(self, ...)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.CurWheelWidget), true
end

function M:OnWheelToRightBtnClicked(...)
  M.Super.OnWheelToRightBtnClicked(self, ...)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.CurWheelWidget), true
end

function M:OnFilterToLeftKeyDown()
  local LeftContent = self.FiterContents[self.CurFilterContent.Idx - 1]
  if LeftContent then
    self:OnFilterWidgetClicked(LeftContent)
    return self:GetReplyAfterFilterChanged()
  end
end

function M:OnFilterToRightKeyDown()
  local RightContent = self.FiterContents[self.CurFilterContent.Idx + 1]
  if RightContent then
    self:OnFilterWidgetClicked(RightContent)
    return self:GetReplyAfterFilterChanged()
  end
end

function M:GetReplyAfterFilterChanged()
  local State = self.FSM:Peak()
  local StateName = State.Name
  if StateName == FocusStates.Wheel or StateName == FocusStates.WheelItem then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), State.Widget), true
  elseif StateName == FocusStates.ListToWheel then
    local ItemIdx = self.List_Item:GetIndexForItem(State.ListContent)
    if ItemIdx < 0 then
      State.ListContent = self.List_Item:GetItemAt()
    end
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), State.Widget), true
  elseif StateName == FocusStates.List then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self:NavigateToList(State.Content)), true
  elseif StateName == FocusStates.WheelToList then
    local ItemIdx = self.List_Item:GetIndexForItem(State.Content)
    if ItemIdx < 0 then
      State.Content = self.List_Item:GetItemAt(0)
    end
    State.Widget = self:NavigateToList(State.Content)
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), State.Widget), true
  end
end

function M:OnListItemSelectionChanged(Content, IsSelected)
  M.Super.OnListItemSelectionChanged(self, Content, IsSelected)
  if not self.IsGamepadInput then
    return
  end
  if not IsSelected or not Content.Id then
    return
  end
  self:SetItemDetailContent(Content)
  local State = self.FSM:Peak()
  local StateName = State.Name
  if StateName == FocusStates.WheelToList then
    self.CurWheelWidget:SelectSlot(true, State.WheelSlotIdx)
    self.CurWheelWidget:SetPreInstallSlot(State.WheelSlotIdx, Content)
    State.Content = Content
    self.FSM:Push(State)
  end
end

local _NavigatePosOffsetPercent = FVector2D(0.5, 0)
local _NavigatePosOffsetAlignment = FVector2D(0.5, 0.8)

function M:OnEntryInitialized(Content, Widget)
  M.Super.OnEntryInitialized(self, Content, Widget)
  Widget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  Widget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  Widget:SetNavigationRuleCustom(EUINavigation.Left, function()
    local ItemIdx = self.List_Item:GetIndexForItem(Content)
    local PreContent = self.List_Item:GetItemAt(ItemIdx - 1)
    if PreContent then
      return self:NavigateToList(PreContent)
    end
    return Widget
  end)
  Widget:SetNavigationRuleCustom(EUINavigation.Right, function()
    local ItemIdx = self.List_Item:GetIndexForItem(Content)
    local NextContent = self.List_Item:GetItemAt(ItemIdx + 1)
    if NextContent then
      return self:NavigateToList(NextContent)
    end
    return Widget
  end)
  Widget:SetNavigatePosOffsetAlignment(_NavigatePosOffsetAlignment)
  Widget:SetNavigatePosOffsetPercent(_NavigatePosOffsetPercent)
  Widget:SetNavigatePosAngle(0)
end

function M:SelectWheelSlot(CurrentSlotIdx, LastSlotIdx)
  M.Super.SelectWheelSlot(self, CurrentSlotIdx, LastSlotIdx)
  local State = self.FSM:Peak()
  local StateName = State.Name
  if StateName == FocusStates.ListToWheel then
    State.SlotIdx = CurrentSlotIdx
    self.FSM:Push(State)
  else
    self.FSM:Push({
      Name = FocusStates.WheelItem,
      Widget = self.CurWheelWidget,
      SlotIdx = CurrentSlotIdx
    })
  end
end

function M:UpdateAKeyText()
  local State = self.FSM:Peak()
  local StateName = State.Name
  if StateName == FocusStates.Wheel then
    self.KeyInfo_A.Desc = GText("UI_CTL_BattleBag_Check")
  elseif StateName == FocusStates.WheelItem then
    if self.CurWheelWidget:GetSlotItem(State.SlotIdx) then
      self.KeyInfo_A.Desc = GText("UI_CTL_Choose_ReplaceItem")
    else
      self.KeyInfo_A.Desc = GText("UI_CTL_Choose_InputItem")
    end
  elseif StateName == FocusStates.ListToWheel then
    if self.CurWheelWidget:GetSlotItem(State.SlotIdx) then
      self.KeyInfo_A.Desc = GText("UI_CTL_Replace_Slot")
    else
      self.KeyInfo_A.Desc = GText("UI_CTL_BattleBag_Input_Slot")
    end
  elseif StateName == FocusStates.List then
    self.KeyInfo_A.Desc = GText("UI_CTL_Select_Slot")
  elseif StateName == FocusStates.WheelToList then
    if self.CurWheelWidget:GetSlotItem(State.WheelSlotIdx) then
      self.KeyInfo_A.Desc = GText("UI_CTL_ReplaceItem")
    else
      self.KeyInfo_A.Desc = GText("UI_CTL_Input_Slot")
    end
  end
  self.Key_A:SetDescription(self.KeyInfo_A.Desc)
end

function M:OnWheelSlotHoverChanged(LastSlot, CurrentSlot)
  if not self.IsGamepadInput then
    return
  end
  local State = self.FSM:Peak()
  local StateName = State.Name
  if StateName ~= FocusStates.WheelItem and StateName ~= FocusStates.ListToWheel then
    return
  end
  if not CurrentSlot then
    return
  end
  local SelectedSlotIdx = State.SlotIdx
  if SelectedSlotIdx then
    self.CurWheelWidget:SetPreInstallSlot(SelectedSlotIdx, nil)
  end
  self:SelectWheelSlot(CurrentSlot, LastSlot)
  if StateName == FocusStates.ListToWheel and CurrentSlot then
    self.CurWheelWidget:SetPreInstallSlot(CurrentSlot, State.ListContent)
  end
  State.SlotIdx = CurrentSlot
  self.FSM:Push(State)
  self:UpdateAKeyText()
end

function M:SetItemDetailContent(Content, WheelIdx, SlotIdx)
  local State = self.FSM:Peak()
  local StateName = State.Name
  if StateName == FocusStates.ListToWheel then
    self.Super.SetItemDetailContent(self, State.ListContent, WheelIdx, SlotIdx)
  else
    self.Super.SetItemDetailContent(self, Content, WheelIdx, SlotIdx)
  end
end

function M:CancelPreInstallMode()
  local State = self.FSM:Peak()
  local SlotIdx = State.SlotIdx or State.WheelSlotIdx
  if SlotIdx then
    self.CurWheelWidget:SetPreInstallSlot(SlotIdx, nil)
  end
end

function M:Init(Params)
  M.Super.Init(self, Params)
  self._OnAddedToFocusPath = Params.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Params.OnRemovedFromFocusPath
  self.FSM:Clear()
  self:OnFocusChanged()
end

function M:OnAddedToFocusPath()
  self.IsInFocusPath = true
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Parent, self)
  end
end

function M:OnRemovedFromFocusPath()
  self.IsInFocusPath = false
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Parent, self)
  end
end

function M:OnModifyWheelInitParams(Params)
  function Params.OnAddedToFocusPathEvent(_self, Widget)
    if not self.IsGamepadInput then
      self.FSM:Clear()
      
      self.FSM:Push({
        Name = FocusStates.Wheel,
        Widget = Widget
      })
      return
    end
    local State = self.FSM:Peak()
    local StateName = State.Name or ""
    if StateName == FocusStates.List then
      self.FSM:Push({
        Name = FocusStates.ListToWheel,
        Widget = Widget,
        ListContent = State.Content,
        SlotIdx = self.CurWheelWidget:FindFirtEmptySlotIdx() or 1
      })
    elseif StateName == FocusStates.ListToWheel then
    elseif StateName == FocusStates.WheelItem then
    else
      self.FSM:Push({
        Name = FocusStates.Wheel,
        Widget = Widget
      })
    end
  end
  
  function Params.OnRemovedFromFocusPathEvent(_self, Widget)
  end
  
  function Params.OnAnalogValueChanged(_self, MyGeometry, InAnalogInputEvent)
    if self.IsGamepadInput and self.FSM:Peak().Name == FocusStates.Wheel then
      return UIUtils.Unhandled, true
    end
  end
end

function M:OnFilterContentCreated(Content)
  function Content.OnAddedToFocusPath(_Content)
  end
  
  function Content.OnRemovedFromFocusPath()
  end
end

function M:OnListItemContentCreated(Content)
  Content.OnAddedToFocusPathEvent = {
    Obj = self,
    Callback = function(_self, _Content)
      if not self.IsGamepadInput then
        self.FSM:Clear()
        self.FSM:Push({
          Name = FocusStates.List,
          Content = _Content,
          Widget = _Content.SelfWidget
        })
        return
      end
      local State = self.FSM:Peak()
      local StateName = State.Name
      if StateName == FocusStates.WheelItem then
        self.FSM:Push({
          Name = FocusStates.WheelToList,
          Content = _Content,
          WheelSlotIdx = State.SlotIdx,
          Widget = self:NavigateToList(_Content)
        })
      elseif StateName == FocusStates.WheelToList then
        self.FSM:Push({
          Name = FocusStates.WheelToList,
          Content = _Content,
          WheelSlotIdx = State.WheelSlotIdx,
          Widget = self:NavigateToList(_Content)
        })
      else
        self.FSM:Push({
          Name = FocusStates.List,
          Content = _Content,
          Widget = self:NavigateToList(_Content)
        })
      end
    end,
    Params = Content
  }
  Content.OnRemovedFromFocusPathEvent = {
    Obj = self,
    Callback = function(_self, _Content)
    end,
    Params = Content
  }
end

function M:OnEmptyListItemContentCreated(Content)
  Content.OnAddedToFocusPathEvent = {
    Obj = self,
    Callback = function(_self, _Content)
    end,
    Params = Content
  }
  Content.OnRemovedFromFocusPathEvent = {
    Obj = self,
    Callback = function(_self, _Content)
    end,
    Params = Content
  }
end

function M:SetContentButtonWhenPreInstall(Content)
  if Content.IsPhantom then
    Content.ItemDetailsButton01EventInfo = self:CreateOpenPhantomButtonEventInfo(Content)
    Content.ItemDetailsButton02EventInfo = nil
  else
    Content.ItemDetailsButton01EventInfo = nil
    Content.ItemDetailsButton02EventInfo = nil
  end
  if Content.SelfWidget then
    Content.SelfWidget.ItemDetailsButton01EventInfo = Content.ItemDetailsButton01EventInfo
    Content.SelfWidget.ItemDetailsButton02EventInfo = Content.ItemDetailsButton02EventInfo
  end
end

function M:OnModifyPlanParams(Params)
  Params.FocusKeyImgPath = "LS"
  
  function Params.OnGetBackReply(_self)
    return self:OnBackKeyDown()
  end
  
  function Params.OnAddedToFocusPath()
    self.FSM:Push({
      Name = FocusStates.Plan,
      Widget = self.BattleMenu_Plan
    })
  end
  
  function Params.OnRemovedFromFocusPath()
  end
end

function M:UpdateItemDetails(Content)
  if Content then
    Content.ItemDetailKeyDownEvent = {
      Obj = self,
      Callback = function(_self, MyGeometry, InKeyEvent)
        return self:OnParentKeyDown(MyGeometry, InKeyEvent)
      end
    }
    Content.OnItemDetailAddedToFocusPathEvent = {
      Obj = self,
      Callback = function(_self, Widget)
        self.FSM:Push({
          Name = FocusStates.Tips,
          Widget = self.Tips_Item
        })
      end,
      Params = self.Tips_Item
    }
    Content.OnItemRemovedFromFocusPathEvent = {
      Obj = self,
      Callback = function(_self, Widget)
      end,
      Params = self.Tips_Item
    }
  end
  M.Super.UpdateItemDetails(self, Content)
end

function M:UpdateItemDetailsButton(Content)
  local State = self.FSM:Peak()
  local StateName = State.Name
  if self.IsGamepadInput and StateName == FocusStates.WheelToList then
    local EventInfo01 = Content.ItemDetailsButton01EventInfo
    local EventInfo02 = Content.ItemDetailsButton02EventInfo
    if EventInfo01 and EventInfo01.ButtonClickPadKey == UIConst.GamePadKey.FaceButtonLeft then
      EventInfo01 = nil
    end
    if EventInfo02 and EventInfo02.ButtonClickPadKey == UIConst.GamePadKey.FaceButtonLeft then
      EventInfo02 = nil
    end
    self.Tips_Item:InitButton01Event(EventInfo01)
    self.Tips_Item:InitButtonEvent(EventInfo02)
    return
  end
  M.Super.UpdateItemDetailsButton(self, Content)
end

function M:IsFocusStateValid(State)
  return State and (State.Content or IsValid(State.Widget))
end

function M:IsStateHasAnyFocus(State)
  local StateName = State.Name
  if StateName == FocusStates.List then
    return UIUtils.HasAnyFocus(self.List_Item)
  elseif StateName == FocusStates.ListToWheel then
    return UIUtils.HasAnyFocus(self.CurWheelWidget)
  elseif StateName == FocusStates.WheelToList then
    return UIUtils.HasAnyFocus(self.List_Item)
  elseif StateName == FocusStates.Wheel then
    return UIUtils.HasAnyFocus(self.CurWheelWidget)
  elseif StateName == FocusStates.WheelItem then
    return UIUtils.HasAnyFocus(self.CurWheelWidget)
  elseif StateName == FocusStates.Plan then
    return UIUtils.HasAnyFocus(self.BattleMenu_Plan)
  elseif StateName == FocusStates.PhantomConfig then
    return self.PhantomWeaponMenu and UIUtils.HasAnyFocus(self.PhantomWeaponMenu)
  elseif StateName == FocusStates.Tips then
    return self:IsShowingItemDetail() and self.Tips_Item:GetFirstJumpItem()
  end
end

function M:OnFocusStateChanged(NewState, OldState, Operation)
  self:OnFocusChanged()
end

function M:OnFocusChanged()
  self:InitWheelNavigationRules()
  self:InitKeyEvents()
  self:InitKeyStyle()
  self:InitBottomKeyInfo()
  self.CurWheelWidget.HighLight_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Mask_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.IsGamepadInput then
    local State = self.FSM:Peak()
    local StateName = State.Name
    self.CurWheelWidget:SetIsShowNavigateGuide(true)
    if StateName == FocusStates.Wheel then
      self:CancelPreInstallMode()
      self.CurWheelWidget:ClearSlotSelect()
    elseif StateName == FocusStates.WheelItem then
      self.CurWheelWidget:SetIsShowNavigateGuide(false)
      self.Mask_GamePad:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      self.CurWheelWidget.HighLight_GamePad:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      self:SelectWheelSlot(State.SlotIdx or 1)
    elseif StateName == FocusStates.ListToWheel then
      self:SelectWheelSlot(State.SlotIdx or 1)
      self.CurWheelWidget:SetPreInstallSlot(State.SlotIdx, State.ListContent)
      self.CurWheelWidget:SetIsShowNavigateGuide(false)
      self.CurWheelWidget.HighLight_GamePad:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    elseif StateName == FocusStates.List then
    elseif StateName == FocusStates.WheelToList then
      self.CurWheelWidget:SelectSlot(true, State.WheelSlotIdx)
      self.CurWheelWidget:SetPreInstallSlot(State.WheelSlotIdx, State.Content)
    end
  else
    self:CancelPreInstallMode()
    if self:IsShowingItemDetail() and self.ItemtDetailContent and self.ItemtDetailContent ~= self.NoneContent and not self.ItemtDetailContent.WheelIdx then
      self.CurWheelWidget:ClearSlotSelect()
    end
    if not self.IsShowTipsAnimationPlaying and not self.IsWheelScrolling then
      self:EnableWheelWidgetPointerDetection(self.CurWheelWidget, true)
    end
  end
  if self:IsShowingItemDetail() and self.ItemtDetailContent and self.ItemtDetailContent ~= self.NoneContent then
    self:UpdateItemDetails(self.ItemtDetailContent)
  end
end

function M:InitWheelNavigationRules()
  local StateName = self.FSM:Peak().Name
  self.CurWheelWidget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.CurWheelWidget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  if StateName == FocusStates.Wheel then
    self.CurWheelWidget:SetNavigationRuleCustom(EUINavigation.Left, function()
      self:WheelScrollToRight()
      return self.CurWheelWidget
    end)
    self.CurWheelWidget:SetNavigationRuleCustom(EUINavigation.Right, function()
      self:WheelScrollToLeft()
      return self.CurWheelWidget
    end)
  else
    self.CurWheelWidget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    self.CurWheelWidget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  end
end

function M:InitKeyStyle()
  for index, value in ipairs(self.BattleWheelWidgets) do
    value:CreateCommonKey(nil)
  end
  self:UpdateClearBtn()
  local State = self.FSM:Peak()
  local StateName = State.Name or ""
  if self.IsGamepadInput then
    self.Btn_Wipe:SetButtonIsLongPress(true)
    self.Key_RT:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Key_LT:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Key_A:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self:UpdateAKeyText()
    if self:HasKeyDownEvent(UIConst.GamePadKey.LeftThumb) then
      self.BattleMenu_Plan:ForceSetGampadKeyVisibility(nil)
    else
      self.BattleMenu_Plan:ForceSetGampadKeyVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self.Arrow_L:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Arrow_R:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if StateName == FocusStates.WheelItem or StateName == FocusStates.ListToWheel then
      self.CurWheelWidget:CreateCommonKey({
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "L"}
        }
      })
    else
      self.CurWheelWidget:CreateCommonKey(nil)
    end
    if StateName == FocusStates.Plan then
      self.Btn_Config:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Btn_Config:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    self.Btn_Wipe:SetButtonIsLongPress(false)
    self.Key_RT:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_LT:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_A:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if self.IsWheelScrolling then
      self.Arrow_L:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      self.Arrow_R:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    else
      self.Arrow_L:SetVisibility(UIConst.VisibilityOp.Visible)
      self.Arrow_R:SetVisibility(UIConst.VisibilityOp.Visible)
    end
  end
end

function M:UpdateClearBtn()
  if next(self.WheelContens) then
    self.Btn_Wipe:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Btn_Wipe:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnFocusToPlanKeyDown()
  if self.bShowMenuPlan then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.BattleMenu_Plan), true
  end
end

function M:OnSpecialLeftKeyDown()
  if self:IsShowingItemDetail() and self.ItemtDetailContent ~= self.NoneContent then
    local IsHandled = self.Tips_Item:OnGamePadDown(UIConst.GamePadKey.SpecialLeft)
    if IsHandled then
      return UIUtils.Handled, true
    end
  end
end

function M:OnFaceButtonTopKeyDown()
  if not self:IsShowingItemDetail() or self.ItemtDetailContent == self.NoneContent then
    return
  end
  local State = self.FSM:Peak()
  local StateName = State.Name
  local Content
  if StateName == FocusStates.WheelItem or StateName == FocusStates.ListToWheel then
    Content = self.CurWheelWidget:GetSlotItem(State.SlotIdx)
  elseif StateName == FocusStates.List or StateName == FocusStates.WheelToList then
    Content = State.Content
  end
  if not Content then
    return
  end
  if Content.ResourceSType == "GestureItem" then
    self:TryOpenPreview(Content)
    return UWidgetBlueprintLibrary.Handled(), true
  end
  if not Content.IsPhantom then
    return
  end
  local Widget = self:OpenPhantomWeaponMenu(Content)
  if Widget then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), Widget), true
  end
end

function M:OpenPhantomWeaponMenu(...)
  local Widget = M.Super.OpenPhantomWeaponMenu(self, ...)
  if Widget then
    self.FSM:Push({
      Name = FocusStates.PhantomConfig,
      Widget = Widget
    })
    return Widget
  end
end

function M:OnPhantomWeaponMenuClosed()
  self.FSM:Pop()
  M.Super.OnPhantomWeaponMenuClosed(self)
end

function M:OnFaceButtonRightKeyDown()
  return self:OnBackKeyDown()
end

function M:OnFaceButtonLeftKeyUp()
  local State = self.FSM:Peak()
  local StateName = State.Name
  if StateName == FocusStates.Wheel then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self:NavigateToList()), true
  elseif StateName == FocusStates.WheelItem then
    local SlotIdx = State.SlotIdx
    if SlotIdx then
      local Content = self.CurWheelWidget:GetSlotItem(SlotIdx)
      self:OnWheelDragCancelled(Content, SlotIdx, function()
        self:SelectWheelSlot(SlotIdx)
      end)
    end
  elseif StateName == FocusStates.List or StateName == FocusStates.WheelToList then
    if not State.Content then
      return
    end
    if State.Content.WheelIdx then
      local SlotIdx = State.WheelSlotIdx
      self:OnWheelDragCancelled(State.Content, nil, function()
        self.CurWheelWidget:SelectSlot(true, SlotIdx)
      end)
    else
      local Content = State.Content
      local ItemIdx = self.List_Item:GetIndexForItem(Content)
      if ItemIdx < 0 then
        return
      end
      local ToFocusContent = self.List_Item:GetItemAt(ItemIdx + 1)
      if nil == ToFocusContent then
        ToFocusContent = self.List_Item:GetItemAt(ItemIdx - 1)
      end
      self:TryQuickEquipContent(State.Content, function()
        local ItemIdx = self.List_Item:GetIndexForItem(Content)
        if ItemIdx >= 0 then
          return
        end
        self:NavigateToList(ToFocusContent):SetFocus()
      end)
    end
  end
end

function M:OnListItemClicked(Content)
  if not Content.Id then
    return
  end
  if self.IsGamepadInput then
    local State = self.FSM:Peak()
    local StateName = State.Name
    if StateName == FocusStates.List then
      if not Content or not Content.Id then
        return
      end
      if not self:CanEquipContent(Content) then
        return
      end
      if self:IsContentInWheelAndFull(Content) then
        local ResourceServerSlotIdx = self:GetServerSlotIdxByRId(Content.UnitId)
        self:ShowEquippedWarning(ResourceServerSlotIdx, Content)
        return
      end
      self.CurWheelWidget:SetFocus()
    elseif StateName == FocusStates.WheelToList then
      if not self:CanEquipContent(Content) then
        return
      end
      if Content.WheelIdx then
        if Content.WheelIdx == self.CurWheelWidget.WheelIdx then
          local ItemIdx = self.List_Item:GetIndexForItem(Content)
          if ItemIdx < 0 then
            return
          end
          local ToFocusContent = self.List_Item:GetItemAt(ItemIdx + 1)
          if nil == ToFocusContent then
            ToFocusContent = self.List_Item:GetItemAt(ItemIdx - 1)
          end
          self:TryEquipContent(Content, Content.WheelIdx, Content.SlotIdx, function()
            local ItemIdx = self.List_Item:GetIndexForItem(Content)
            if ItemIdx >= 0 then
              return
            end
            self:NavigateToList(ToFocusContent):SetFocus()
          end)
        else
          local ResourceServerSlotIdx = self:GetServerSlotIdxByRId(Content.UnitId)
          self:ShowEquippedWarning(ResourceServerSlotIdx, Content)
          UIManager(self):ShowUITip("CommonToastMain", GText("UI_BattleWheel_Equipped"))
        end
        return
      end
      self:TryEquipContent(Content, nil, State.WheelSlotIdx, function()
        self.FSM:Pop()
        self.CurWheelWidget:SetFocus()
      end)
    end
  else
    self:SetItemDetailContent(Content)
  end
end

function M:OnFaceButtonBottomKeyDown()
  local State = self.FSM:Peak()
  local StateName = State.Name
  if StateName == FocusStates.Wheel then
    local SlotIdx = self.CurWheelWidget:FindFirtEmptySlotIdx() or 1
    self.FSM:Push({
      Name = FocusStates.WheelItem,
      SlotIdx = SlotIdx,
      Widget = self.CurWheelWidget
    })
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.CurWheelWidget), true
  elseif StateName == FocusStates.WheelItem then
    local Content = self.List_Item:GetItemAt(0)
    if nil == Content or not Content.Id then
      UIManager(self):ShowUITip("CommonToastMain", GText("UI_No_Item_To_Equip"))
      return UIUtils.Handled, true
    end
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self:NavigateToList(Content)), true
  else
    if StateName == FocusStates.ListToWheel and State.ListContent then
      self:TryEquipContent(State.ListContent, nil, State.SlotIdx, function()
        self.FSM:Pop()
        self:NavigateToList():SetFocus()
      end)
      return UIUtils.Handled, true
    else
    end
  end
end

function M:OnRightThumbKeyDown()
  local Widget
  self:OnWeaponConfigBtnClicked()
  if Widget then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), Widget), true
  end
end

function M:OnParentKeyDown(MyGeometry, InKeyEvent)
  local InputEvent = UWidgetBlueprintLibrary.GetInputEventFromKeyEvent(InKeyEvent)
  if UKismetInputLibrary.InputEvent_IsRepeat(InputEvent) then
    return UIUtils.Handled
  end
  local Reply, IsHandled = self:ProcessOnKeyDown(MyGeometry, InKeyEvent)
  if IsHandled then
    return Reply, IsHandled
  end
  return UIUtils.Unhandled, false
end

function M:OnParentKeyUp(MyGeometry, InKeyEvent)
  local Reply, IsHandled = self:ProcessOnKeyUp(MyGeometry, InKeyEvent)
  if IsHandled then
    return Reply
  end
  return UIUtils.Unhandled, false
end

function M:OnClearWheelLongPressStart()
  if self.FaceButtonLeftKeyWidget then
    self.FaceButtonLeftKeyWidget:OnButtonPressed(false, true, 0, self:GetLongPressAnimationTime(UIConst.GamePadKey.FaceButtonLeft))
  end
end

function M:OnClearWheelLongPressCancel()
  if self.FaceButtonLeftKeyWidget then
    self.FaceButtonLeftKeyWidget:OnButtonReleased()
    self.FaceButtonLeftKeyWidget:StopAllAnimations()
    self.FaceButtonLeftKeyWidget:PlayAnimation(self.FaceButtonLeftKeyWidget.Normal)
  end
end

function M:OnClearWheelLongPressEnd()
  self:OnClearWheelLongPressCancel()
  self:OnClearWheelBtnClicked()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  local Reply = UIUtils.Handled
  if IsValid(self.PhantomWeaponMenu) then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.PhantomWeaponMenu)
  end
  if self.IsGamepadInput then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self:GetDesiredFocusTarget())
  end
  return Reply
end

AssembleComponents(M)
return M
