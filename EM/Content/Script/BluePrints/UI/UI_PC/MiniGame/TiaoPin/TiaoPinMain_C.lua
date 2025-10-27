require("UnLua")
local WBP_MiniGame_Tiaopin_P_C = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.TimerMgr"
})

function WBP_MiniGame_Tiaopin_P_C:Destruct()
  if self.bGameStart then
    self:SetInputUIOnly(false)
    self.UseActor:ChangeState("InteractBreak", self.UseActor.PlayerEid)
  end
  self.Super.Destruct(self)
end

function WBP_MiniGame_Tiaopin_P_C:OnLoaded(...)
  WBP_MiniGame_Tiaopin_P_C.Super.OnLoaded(self, ...)
  self.PlayerController = UGameplayStatics.GetPlayerController(self, 0)
  self.RemainTime = self.GameTime or 60
  self.TimeHandleName = "CountDown"
  self.IsInCD = false
  self.IsPressEsc = false
  self.IsWin = false
  self.IsClosing = false
end

function WBP_MiniGame_Tiaopin_P_C:InitAfterBeginPlay()
  DebugPrint("thy    InitAfterBeginPlay", self.Difficulty)
  self:InitDataInfo()
  self:InitUI()
  self:InitCrack()
  self:InitDeviceInfo()
  self:InitListenEvent()
  self:PlayAnimation(self.In)
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/tiaopin_start", "TiaoPinStart", nil)
  self:SetFocus()
end

function WBP_MiniGame_Tiaopin_P_C:InitDataInfo()
  self.GameDifficulty = self.Difficulty or 1
  self.GameDataInfo = DataMgr["MiniGameFreq" .. self.GameDifficulty]
  if not self.GameDataInfo then
    DebugPrint("thy    GameDataInfo is nil")
  end
  self.FreqType = math.random(#self.GameDataInfo)
  self.FreqInfo = self.GameDataInfo[self.FreqType]
  self.RowNum = self.FreqInfo.Num
  self.TiaoPinListLen = self.RowNum
  self.Destination = self.FreqInfo.Destination
  self.OriginPointPosition = self.FreqInfo.Comb
  self.BindingRealtion = self.FreqInfo.BindingRealtion
  self.BindingRowNum = self.BindingRealtion[1]
  self.BindingRowInterval = self.BindingRealtion[2]
  self.MoveRange = self.FreqInfo.MoveRange or 1
  self.PointPosition = {
    -177,
    -140,
    -105,
    -70,
    -35,
    0,
    35,
    70,
    105,
    140,
    177
  }
  self.BindingIndex = {}
  DebugPrint("thy   GameConfigInfo: self.GameDifficulty " .. self.GameDifficulty .. " self.FreqType " .. self.FreqType .. " self.RowNum " .. self.RowNum .. " self.BindingRowNum " .. self.BindingRowNum .. " self.BindingRowInterval " .. self.BindingRowInterval .. " self.MoveRange " .. self.MoveRange)
end

function WBP_MiniGame_Tiaopin_P_C:InitUI()
  self.Text_Float:SetText(GText("UI_MiniGame_Hint_TiaoPin"))
  self.MiniGame_Text.Text_Fail:SetText(GText("UI_MiniGame_Fail"))
  self.MiniGame_Text.Text_Success:SetText(GText("UI_MiniGame_Success"))
  self:InitTime()
  self:InitFreqUI()
  self:InitButtonUIAndEvent()
end

function WBP_MiniGame_Tiaopin_P_C:InitBtnTipsUI()
  DebugPrint("thy    InitBtnTipsUI", self.CurInputDeviceType)
  if not self.CurInputDeviceType or self.CurInputDeviceType == ECommonInputType.Touch then
    self.Key_Close:SetVisibility(ESlateVisibility.Collapsed)
    self.ClickCD = self.ClickCDInPC or 0.1
    return
  end
  if self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
    self.ClickCD = self.ClickCDInPC or 0.1
    self.KeyInfo1 = {
      Type = "Or",
      KeyInfoList = {
        {Type = "Text", Text = "A"},
        {Type = "Text", Text = "D"}
      },
      Desc = "\229\136\135\230\141\162"
    }
    self.KeyInfo2 = {
      Type = "Or",
      KeyInfoList = {
        {Type = "Text", Text = "W"},
        {Type = "Text", Text = "S"}
      },
      Desc = "\231\167\187\229\138\168"
    }
    self.KeyInfo3 = {
      KeyInfoList = {
        {
          ClickCallback = self.TimeOut,
          Owner = self,
          Type = "Text",
          Text = "Esc"
        }
      },
      Desc = GText("UI_BACK")
    }
    if self.Key_Switch and self.Key_Move then
      self.Key_Switch:CreateSubKeyDesc(self.KeyInfo1)
      self.Key_Move:CreateSubKeyDesc(self.KeyInfo2)
      self.Key_Close:CreateCommonKey(self.KeyInfo3)
    end
  else
    self.ClickCD = self.ClickCDInGamepad or 0.2
    self.KeyInfo1 = {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LH"}
      },
      Desc = "\229\136\135\230\141\162"
    }
    self.KeyInfo2 = {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LV"}
      },
      Desc = "\231\167\187\229\138\168"
    }
    self.KeyInfo3 = {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    }
    if self.Key_Switch and self.Key_Move then
      self.Key_Switch:CreateCommonKey(self.KeyInfo1)
      self.Key_Move:CreateCommonKey(self.KeyInfo2)
      self.Key_Close:CreateCommonKey(self.KeyInfo3)
    end
  end
end

function WBP_MiniGame_Tiaopin_P_C:InitCrack()
  local Param = {
    RootPage = self,
    SuccCallBack = self.CompleteGame,
    ResetCallBack = self.Reset,
    NeedCrack = self.bCanCrack or false,
    NeedReset = true
  }
  self.MiniGame_Crack:SetVisibility(ESlateVisibility.Visibility)
  self.MiniGame_Crack:Init(Param)
end

function WBP_MiniGame_Tiaopin_P_C:Reset()
  for key, value in pairs(self.TiaoPinList) do
    value:ResetPointPosition()
  end
  self:InitBindingRowAnimation()
end

function WBP_MiniGame_Tiaopin_P_C:InitButtonUIAndEvent()
  if self.MoveRange > 1 then
    self.Switcher_D:SetActiveWidgetIndex(1)
    self.Switcher_T:SetActiveWidgetIndex(1)
  else
    self.Switcher_D:SetActiveWidgetIndex(0)
    self.Switcher_T:SetActiveWidgetIndex(0)
  end
  self.Btn_L.OnClicked:Add(self, self.OnBtnLClicked)
  self.Btn_R.OnClicked:Add(self, self.OnBtnRClicked)
  self.Btn_D.OnClicked:Add(self, self.OnBtnDClicked)
  self.Btn_T.OnClicked:Add(self, self.OnBtnTClicked)
  if self.Btn_Close then
    self.Btn_Close:Init("Close", self, self.ExitGameByMoble)
  end
end

function WBP_MiniGame_Tiaopin_P_C:OnBtnLClicked()
  if self:CheckIsInCD() then
    return
  end
  local CurTiaoPinBaseIndex = self.BindingIndex[1]
  if self:CheckBindingRow(CurTiaoPinBaseIndex - 1) then
    self:UpdateBindingRowAnimation()
    AudioManager(self):PlayUISound(self, "event:/ui/minigame/tiaopin_bar_change", "TiaoPinChageBar", nil)
  else
    local TiaoPin = self.TiaoPinList[CurTiaoPinBaseIndex]
    TiaoPin:PlayAnimation(TiaoPin.Select_Warning)
    AudioManager(self):PlayUISound(self, "event:/ui/minigame/tiaopin_block_or_bar_err", "TiaoPinWarning", nil)
  end
end

function WBP_MiniGame_Tiaopin_P_C:OnBtnRClicked()
  if self:CheckIsInCD() then
    return
  end
  local CurTiaoPinBaseIndex = self.BindingIndex[1]
  if self:CheckBindingRow(CurTiaoPinBaseIndex + 1) then
    self:UpdateBindingRowAnimation()
    AudioManager(self):PlayUISound(self, "event:/ui/minigame/tiaopin_bar_change", "TiaoPinChageBar", nil)
  else
    local TiaoPin = self.TiaoPinList[self.BindingIndex[#self.BindingIndex]]
    TiaoPin:PlayAnimation(TiaoPin.Select_Warning)
    AudioManager(self):PlayUISound(self, "event:/ui/minigame/tiaopin_block_or_bar_err", "TiaoPinWarning", nil)
  end
end

function WBP_MiniGame_Tiaopin_P_C:OnBtnDClicked()
  if self:CheckIsInCD() then
    return
  end
  local CanMove = true
  for key, value in pairs(self.BindingIndex) do
    local TiaoPin = self.TiaoPinList[value]
    if not TiaoPin:CheckCanMovePointDown() then
      CanMove = false
    end
  end
  if CanMove then
    local HeightMax = 0
    for key, value in pairs(self.BindingIndex) do
      self.TiaoPinList[value]:MovePointDown()
      HeightMax = math.max(HeightMax, self.TiaoPinList[value].CurrentPositionIndex)
    end
    AudioManager(self):PlayUISound(self, "event:/ui/minigame/tiaopin_block_move", "TiaoPinWhiteMove", {
      progress = 1 - HeightMax / #self.PointPosition
    })
    self:CheckIsCompleteGame()
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/tiaopin_block_or_bar_err", "TiaoPinWarning", nil)
end

function WBP_MiniGame_Tiaopin_P_C:OnBtnTClicked()
  if self:CheckIsInCD() then
    return
  end
  local CanMove = true
  for key, value in pairs(self.BindingIndex) do
    local TiaoPin = self.TiaoPinList[value]
    if not TiaoPin:CheckCanMovePointUp() then
      CanMove = false
    end
  end
  if CanMove then
    local HeightMax = 0
    for key, value in pairs(self.BindingIndex) do
      self.TiaoPinList[value]:MovePointUp()
      HeightMax = math.max(HeightMax, self.TiaoPinList[value].CurrentPositionIndex)
    end
    AudioManager(self):PlayUISound(self, "event:/ui/minigame/tiaopin_block_move", "TiaoPinWhiteMove", {
      progress = 1 - HeightMax / #self.PointPosition
    })
    self:CheckIsCompleteGame()
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/tiaopin_block_or_bar_err", "TiaoPinWarning", nil)
end

function WBP_MiniGame_Tiaopin_P_C:CheckIsInCD()
  if self.IsInCD then
    DebugPrint("thy       self.IsInCD", self.IsInCD)
    return true
  else
    self.IsInCD = true
    self:AddTimer(self.ClickCD, self.CDIsOver, false, 0, "CD", true)
    return false
  end
end

function WBP_MiniGame_Tiaopin_P_C:CDIsOver()
  self.IsInCD = false
  self:RemoveTimer("CD")
end

function WBP_MiniGame_Tiaopin_P_C:InitTime()
  self:RemoveTimer(self.TimeHandleName)
  self.MiniGame_Time.Text_Time:SetText("00:" .. tostring(self.RemainTime))
  self:AddTimer(1, self.CountDown, true, 0.1, self.TimeHandleName, true)
end

function WBP_MiniGame_Tiaopin_P_C:CountDown()
  self.RemainTime = self.RemainTime - 1
  if self.RemainTime < 0 then
    if self.IsClosing then
      return
    end
    self:TimeOut()
    self.IsClosing = true
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/tiaopin_countdown", "TiaoPinCountDown", nil)
  if self.RemainTime < 10 then
    self:PlayAnimation(self.Warning)
    self.MiniGame_Time.Text_Time:SetText("00:0" .. tostring(self.RemainTime))
    return
  end
  self.MiniGame_Time.Text_Time:SetText("00:" .. tostring(self.RemainTime))
end

function WBP_MiniGame_Tiaopin_P_C:InitFreqUI()
  self.TiaoPinList = {}
  self.ListView_255:ClearListItems()
  for i = 1, self.RowNum do
    local TiaoPin = NewObject(UIUtils.GetCommonItemContentClass())
    TiaoPin.Owner = self
    TiaoPin.OriginPointPositionIndex = self.OriginPointPosition[i]
    TiaoPin.CurrentPositionIndex = self.OriginPointPosition[i]
    TiaoPin.TargetPointPositionIndex = self.Destination[i]
    TiaoPin.MoveRange = self.MoveRange
    TiaoPin.Index = i
    self.ListView_255:AddItem(TiaoPin)
  end
end

function WBP_MiniGame_Tiaopin_P_C:InitBindingRowAnimation()
  if self:CheckBindingRow(1) then
    self:UpdateBindingRowAnimation()
  end
end

function WBP_MiniGame_Tiaopin_P_C:AddItemInTiaoPinList(Index, TiaoPin)
  self.TiaoPinList[Index] = TiaoPin
  if Index == self.TiaoPinListLen then
    self:InitBindingRowAnimation()
  end
end

function WBP_MiniGame_Tiaopin_P_C:CheckBindingRow(MoveTargetRowIndex)
  if MoveTargetRowIndex < 1 or MoveTargetRowIndex > self.TiaoPinListLen then
    return false
  end
  local PreBindingIndex = {MoveTargetRowIndex}
  for i = 1, self.BindingRowNum - 1 do
    MoveTargetRowIndex = MoveTargetRowIndex + self.BindingRowInterval + 1
    if MoveTargetRowIndex > self.RowNum then
      return false
    else
      table.insert(PreBindingIndex, MoveTargetRowIndex)
    end
  end
  self.BindingIndex = PreBindingIndex
  return true
end

function WBP_MiniGame_Tiaopin_P_C:UpdateBindingRowAnimation()
  if not self.BindingIndex or 0 == #self.BindingIndex then
    return
  end
  for index = 1, self.TiaoPinListLen do
    self.TiaoPinList[index]:CloseSelectState()
  end
  for _, value in pairs(self.BindingIndex) do
    self.TiaoPinList[value]:OpenSelectState()
  end
end

function WBP_MiniGame_Tiaopin_P_C:CheckIsCompleteGame()
  for index = 1, self.TiaoPinListLen do
    if not self.TiaoPinList[index].IsComplete then
      return
    end
  end
  self:CompleteGame()
end

function WBP_MiniGame_Tiaopin_P_C:CompleteGame()
  for key, value in pairs(self.TiaoPinList) do
    value:PlayAnimation(value.Success_Out)
    self:BlockAllUIInput(true)
  end
  self.IsWin = true
  self:BindToAnimationFinished(self.Success_Out, {
    self,
    self.ExitGame
  })
  self:RemoveTimer(self.TimeHandleName)
  self:AddTimer(0, self.PlaySuccessAnimation, false, 0.5, "Success_Out")
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/tiaopin_success", "TiaoPinSuccess", nil)
end

function WBP_MiniGame_Tiaopin_P_C:PlaySuccessAnimation()
  self:PlayAnimation(self.Success_Out)
  self:BlockAllUIInput(true)
  self.MiniGame_Text.Switcher_Tip:SetActiveWidgetIndex(0)
  self:RemoveTimer("Success_Out")
end

function WBP_MiniGame_Tiaopin_P_C:TimeOut()
  self.IsWin = false
  if self.IsPressEsc then
    return
  end
  self.IsPressEsc = true
  self:BindToAnimationFinished(self.Fail_Out, {
    self,
    self.ExitGame
  })
  self:RemoveTimer(self.TimeHandleName)
  self:PlayAnimation(self.Fail_Out)
  self:BlockAllUIInput(true)
  self.MiniGame_Text.Switcher_Tip:SetActiveWidgetIndex(1)
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/tiaopin_fail", "TiaoPinFail", nil)
end

function WBP_MiniGame_Tiaopin_P_C:ExitGameByMoble()
  self:TimeOut()
end

function WBP_MiniGame_Tiaopin_P_C:ExitGame()
  if self.IsWin then
    AudioManager(self):PlayFMODSound(self.UseActor, nil, "event:/ui/minigame/tiaopin_gear_unlock", "TiaoPinGearClose")
  end
  self:RemoveTimer("Init")
  self:RemoveTimer("InitPoint")
  self:RemoveTimer("InitArrow")
  self:Close()
end

function WBP_MiniGame_Tiaopin_P_C:Close()
  self.UseActor:SetVariableBool("IsGameSuccess", self.IsWin, UE4.UGameplayStatics.GetPlayerPawn(self, 0).Eid)
  self.UseActor.ChestInteractiveComponent:EndInteractive(UE4.UGameplayStatics.GetPlayerPawn(self, 0))
  self.Super.Close(self)
end

function WBP_MiniGame_Tiaopin_P_C:InitDeviceInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function WBP_MiniGame_Tiaopin_P_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_MiniGame_Tiaopin_P_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("thy     CurGamepadName", CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self:InitBtnTipsUI()
end

function WBP_MiniGame_Tiaopin_P_C:Handle_OnPCDown(InKeyName)
  if "Escape" == InKeyName then
    self:TimeOut()
    return true
  end
  if "Right" == InKeyName or "D" == InKeyName then
    self:OnBtnRClicked()
    return true
  end
  if "Left" == InKeyName or "A" == InKeyName then
    self:OnBtnLClicked()
    return true
  end
  if "Up" == InKeyName or "W" == InKeyName then
    self:OnBtnTClicked()
    return true
  end
  if "Down" == InKeyName or "S" == InKeyName then
    self:OnBtnDClicked()
    return true
  end
  if "F" == InKeyName and self.bCanCrack then
    self:CompleteGame()
    return true
  end
  return false
end

function WBP_MiniGame_Tiaopin_P_C:Handle_OnGamePadDown(InKeyName)
  DebugPrint("thy    Handle_OnGamePadDown", InKeyName)
  if "Gamepad_DPad_Up" == InKeyName or "Gamepad_LeftStick_Up" == InKeyName then
    self:OnBtnTClicked()
    return true
  elseif "Gamepad_DPad_Down" == InKeyName or "Gamepad_LeftStick_Down" == InKeyName then
    self:OnBtnDClicked()
    return true
  elseif "Gamepad_DPad_Left" == InKeyName or "Gamepad_LeftStick_Left" == InKeyName then
    self:OnBtnLClicked()
    return true
  elseif "Gamepad_DPad_Right" == InKeyName or "Gamepad_LeftStick_Right" == InKeyName then
    self:OnBtnRClicked()
    return true
  elseif "Gamepad_FaceButton_Top" == InKeyName then
    if self.bCanCrack then
      self:CompleteGame()
    end
    return true
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    self:Reset()
    return true
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    self:TimeOut()
  end
  return false
end

function WBP_MiniGame_Tiaopin_P_C:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    DebugPrint("thy    Key_IsGamepadKey", InKeyName)
    IsEventHandled = self:Handle_OnGamePadDown(InKeyName)
  else
    DebugPrint("thy    Key_IsPC", InKeyName)
    IsEventHandled = self:Handle_OnPCDown(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_MiniGame_Tiaopin_P_C:CheckLeftStickKeyName()
  local InKeyName
  if self.MoveDeltaX and 0 ~= self.MoveDeltaX then
    if self.MoveDeltaX > 0.5 then
      InKeyName = "Gamepad_LeftStick_Right"
    elseif self.MoveDeltaX < -0.5 then
      InKeyName = "Gamepad_LeftStick_Left"
    end
  end
  if not InKeyName and self.MoveDeltaY and 0 ~= self.MoveDeltaY then
    if self.MoveDeltaY > 0.5 then
      InKeyName = "Gamepad_LeftStick_Up"
    elseif self.MoveDeltaY < -0.5 then
      InKeyName = "Gamepad_LeftStick_Down"
    end
  end
  return InKeyName
end

function WBP_MiniGame_Tiaopin_P_C:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_LeftX" == InKeyName then
    self.MoveDeltaX = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
  elseif "Gamepad_LeftY" == InKeyName then
    self.MoveDeltaY = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
  end
  self:Handle_OnGamePadDown(self:CheckLeftStickKeyName())
  return self.Unhandle
end

return WBP_MiniGame_Tiaopin_P_C
