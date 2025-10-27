local WBP_ImpressionResult_PC = Class("BluePrints.Story.Talk.UI.Common.WBP_ImpressionResult_Common")
WBP_ImpressionResult_PC._components = {
  "BluePrints.UI.UI_PC.Common.LSFocusComp"
}
local ECheckMode = {
  Normal = "Normal",
  ImpressionShop = "ImpressionShop"
}

function WBP_ImpressionResult_PC:AdaptPlatform()
  DebugPrint("WBP_ImpressionResult_PC:AdaptPlatform")
  self:AddLSFocusTarget(self.Com_Cost.Key, self.Com_Cost, nil, true)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self.Key_ResultPlay:ChangeToDiceThrowMode()
  if self.CheckMode == ECheckMode.ImpressionShop then
    self:SetStoryInputModeEnabled(true)
  end
  self.Btn_Dice.OnClicked:Add(self, self.OnSkipButtonClicked)
end

function WBP_ImpressionResult_PC:SetStoryInputModeEnabled(bIsEnable)
  if self.bStoryInputModeEnabled ~= bIsEnable then
    self.bStoryInputModeEnabled = bIsEnable
    local Subsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
    if bIsEnable then
      local Params = FGameInputModeParams()
      Params.WidgetToFocus = self
      Params.MouseLockMode = EMouseLockMode.LockOnCapture
      Params.bHideCursorDuringCapture = true
      Params.bShowMouseCursor = true
      Subsystem:EnableInputMode("ImpressionResult", EGameInputMode.GameAndUI, Params)
      UIManager(self):SetUIInputEnable(false, self.GameInputModeTag)
    else
      Subsystem:DisableInputMode("ImpressionResult")
      UIManager(self):SetUIInputEnable(true, self.GameInputModeTag)
    end
  end
end

function WBP_ImpressionResult_PC:InitPlayKey()
  self.Key_ResultPlay:Init(self.bUseGamePad)
end

function WBP_ImpressionResult_PC:SwitchBindDicePressInput(bBind)
  DebugPrint("WBP_ImpressionResult_PC SwitchBindDicePressInput", bBind)
  self.bListenPressInput = bBind
  self.Key_ResultPlay:SwitchBindAutoPlay(bBind, self, self.OnBtn_DicePressed, true)
  self.Key_ResultPlay:SwitchBindSkip(bBind, self, self.OnBtn_EscPressed, true)
  if bBind then
    self:ListenForInputAction("TalkClick", EInputEvent.IE_Pressed, false, {
      self.Key_ResultPlay,
      self.Key_ResultPlay.OnAutoKeyPressed
    })
    self:ListenForInputAction("TalkExit", EInputEvent.IE_Pressed, false, {
      self.Key_ResultPlay,
      self.Key_ResultPlay.OnSkipKeyPressed
    })
  else
    self:StopListeningForInputAction("TalkClick", EInputEvent.IE_Pressed)
    self:StopListeningForInputAction("TalkExit", EInputEvent.IE_Pressed)
  end
end

function WBP_ImpressionResult_PC:SwitchBindDiceReleaseInput(bBind)
  DebugPrint("WBP_ImpressionResult_PC:SwitchBindDiceReleaseInput", bBind)
  self.bListenReleaseInput = bBind
  self.Key_ResultPlay:SwitchBindAutoPlay(bBind, self, self.OnBtn_DiceReleased, false)
  if bBind then
    self:ListenForInputAction("TalkClick", EInputEvent.IE_Released, false, {
      self.Key_ResultPlay,
      self.Key_ResultPlay.OnAutoKeyReleased
    })
  else
    self:StopListeningForInputAction("TalkClick", EInputEvent.IE_Released)
  end
end

function WBP_ImpressionResult_PC:SwitchBindSkipInput(bBind)
  DebugPrint("WBP_ImpressionResult_PC:SwitchBindSkipInput", bBind)
  self.Key_ResultPlay:SwitchBindSkip(bBind, self, self.OnSkipButtonClicked, false)
  if bBind then
    self:ListenForInputAction("TalkSkip", EInputEvent.IE_Pressed, false, {
      self.Key_ResultPlay,
      self.Key_ResultPlay.OnSkipKeyPressed
    })
    self:ListenForInputAction("TalkSkip", EInputEvent.IE_Released, false, {
      self.Key_ResultPlay,
      self.Key_ResultPlay.OnSkipKeyReleased
    })
    self.Btn_Dice:SetVisibility(ESlateVisibility.Visible)
  else
    self:StopListeningForInputAction("TalkSkip", EInputEvent.IE_Pressed)
    self:StopListeningForInputAction("TalkSkip", EInputEvent.IE_Released)
    self.Btn_Dice:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_ImpressionResult_PC:SwitchShowSpaceShortCut(bShow)
  DebugPrint("WBP_ImpressionResult_PC:SwitchShowSpaceShortCut", bShow)
  if bShow then
    self.Key_ResultPlay:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.Key_ResultPlay:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_ImpressionResult_PC:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  DebugPrint("WBP_ImpressionResult_PC:OnKeyDown", InKey.KeyName)
  local EventHandled = self:OnKeyDownForLSComp(MyGeometry, InKeyEvent)
  if EventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  if self.bListenGamePadRetryEndInput then
    if InKey.KeyName == "Gamepad_FaceButton_Right" then
      if self:IsTipsOpen() then
        self:SetFocus()
        return UE4.UWidgetBlueprintLibrary.Handled()
      end
      self.bListenGamePadRetryEndInput = false
      self:OnBtn_EndClicked()
      return UE4.UWidgetBlueprintLibrary.Handled()
    elseif InKey.KeyName == "Gamepad_FaceButton_Bottom" then
      if self:IsTipsOpen() then
        return UE4.UWidgetBlueprintLibrary.Handled()
      end
      self.bListenGamePadRetryEndInput = false
      self:OnBtn_RetryClicked()
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function WBP_ImpressionResult_PC:IsTipsOpen()
  return self.Com_Cost:HasFocusedDescendants() or self.Com_Cost:HasAnyUserFocus()
end

function WBP_ImpressionResult_PC:AddInputMethodChangedListen()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_ImpressionResult_PC:RemoveInputMethodChangedListen()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_ImpressionResult_PC:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("WBP_ImpressionResult_PC:RefreshOpInfoByInputDevice", CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    self.bUseGamePad = true
    self.Text_Tip:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if not self:HasFocusedDescendants() or self:HasAnyUserFocus() then
      self:SetFocus()
    end
  else
    self.Text_Tip:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.bUseGamePad = false
  end
  self.Key_ResultPlay:UpdateKeyImg(self.bUseGamePad)
end

function WBP_ImpressionResult_PC:OnBtn_DiceReleased_Platform()
  self.Key_ResultPlay:ChangeToDiceSkipMode(self.bUseGamePad)
end

function WBP_ImpressionResult_PC:OnAgainAnimationFinished_Platform()
  self:SwitchShowSpaceShortCut(true)
  self.Key_ResultPlay:ChangeToDiceThrowMode(self.bUseGamePad)
end

function WBP_ImpressionResult_PC:OnFailAnimationFinished()
  WBP_ImpressionResult_PC.Super.OnFailAnimationFinished(self)
  self:SetFocus()
  self:SwitchShowSpaceShortCut(false)
  self.bListenGamePadRetryEndInput = true
end

function WBP_ImpressionResult_PC:Close()
  if self.CheckMode == ECheckMode.ImpressionShop then
    self:SetStoryInputModeEnabled(false)
  end
  WBP_ImpressionResult_PC.Super.Close(self)
end

function WBP_ImpressionResult_PC:Destruct()
  DebugPrint("WBP_ImpressionResult_PC:Destruct")
  if self.CheckMode == ECheckMode.ImpressionShop then
    self:SetStoryInputModeEnabled(false)
  end
end

function WBP_ImpressionResult_PC:BP_GetDesiredFocusTarget()
  return self
end

AssembleComponents(WBP_ImpressionResult_PC)
return WBP_ImpressionResult_PC
