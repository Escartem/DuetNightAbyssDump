require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.Btn_Close.OnClicked:Add(self, self.OnBtnCloseClicked)
  self.Text_Tip:SetText(GText("UI_TRAIN_CLOSE"))
  self.BlessingItem.Button_Select:SetIsEnabled(false)
  self.TreasureItem.Button_Select:SetIsEnabled(false)
  self.BlessingItem.Btn_Desc:SetIsEnabled(false)
  self.TreasureItem.Btn_Desc:SetIsEnabled(false)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/item_info_panel_show", nil, nil)
  self.CurInputDeviceType = nil
  self.TextOverflow = false
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self)
  self.bIsFocusable = true
  self:SetFocus()
  self.ItemId, self.ItemType, self.Level = ...
  local Info = {
    AwardId = self.ItemId,
    AwardType = self.ItemType,
    AwardLevel = self.Level
  }
  if self.ItemType == "Blessing" then
    self.WS:SetActiveWidgetIndex(0)
    self.BlessingItem:OnLoaded(Info)
    self.BlessingItem.Button_Select.OnClicked:Clear()
  elseif self.ItemType == "Treasure" then
    self.WS:SetActiveWidgetIndex(1)
    self.TreasureItem:OnLoaded(Info)
    self.TreasureItem.Button_Select.OnClicked:Clear()
  end
  self:PlayAnimation(self.In)
  self.BlessingItem.Button_Select:SetVisibility(ESlateVisibility.Collapsed)
  self.TreasureItem.Button_Select:SetVisibility(ESlateVisibility.Collapsed)
  self.BlessingItem.Btn_Desc:SetVisibility(ESlateVisibility.Collapsed)
  self.TreasureItem.Btn_Desc:SetVisibility(ESlateVisibility.Collapsed)
  self:InitListenEvent()
  self:InitTipsInfo()
end

function M:Destruct()
  self.Super.Destruct(self)
  self:ClearListenEvent()
end

function M:InitListenEvent()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  local IsGamePad = CurInputDevice == ECommonInputType.Gamepad
  if IsGamePad then
    self:SetFocus()
  end
  self:UpdateTips(IsGamePad, CurGamepadName)
  self.CurInputDeviceType = CurInputDevice
end

function M:InitTipsInfo()
  self.Key_GamePad01:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RV"}
    },
    Desc = GText("UI_Controller_Slide")
  })
  self.Key_GamePad02:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_BACK")
  })
end

function M:UpdateTips(IsGamePad, CurGamepadName)
  if IsGamePad then
    self.Switch_Key:SetActiveWidgetIndex(1)
    if self.CurGamepadName ~= CurGamepadName then
      self.CurGamepadName = CurGamepadName
    end
    self:AddTimer(0.01, self.ShowSwipeTip)
  else
    self.Switch_Key:SetActiveWidgetIndex(0)
  end
end

function M:ShowSwipeTip()
  self.TextOverflow = self[self.ItemType .. "Item"].ScrollBox_Desc:GetScrollOffsetOfEnd() > 1
  if self.TextOverflow then
    self.Key_GamePad01:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Key_GamePad01:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OnBtnCloseClicked()
  if self:IsPlayingAnimation() then
    return
  end
  self:PlayAnimation(self.Out)
end

function M:OnAnimationFinished(Animation)
  if Animation == self.Out then
    self:Close()
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:Handle_KeyEventOnGamePad(InKeyName)
  else
    IsEventHandled = self:Handle_KeyEventOnPC(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:Handle_KeyEventOnPC(InKeyName)
  local IsEventHandled = false
  if "Escape" == InKeyName then
    IsEventHandled = true
    self:OnBtnCloseClicked()
  end
  return IsEventHandled
end

function M:Handle_KeyEventOnGamePad(InKeyName)
  local IsEventHandled = false
  if "Gamepad_FaceButton_Right" == InKeyName then
    IsEventHandled = true
    self:OnBtnCloseClicked()
  end
  return IsEventHandled
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_RightY" == InKeyName and self.TextOverflow then
    local CurScrollOffset = self[self.ItemType .. "Item"].ScrollBox_Desc:GetScrollOffset()
    local Speed = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
    local MaxHig1ht = self[self.ItemType .. "Item"].ScrollBox_Desc:GetDesiredSize().Y
    if CurScrollOffset + Speed < 0 or MaxHig1ht < CurScrollOffset + Speed then
      return self.Unhandle
    end
    self[self.ItemType .. "Item"].ScrollBox_Desc:SetScrollOffset(CurScrollOffset + Speed)
  end
  return self.Unhandle
end

return M
