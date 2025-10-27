require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")
local GamePadKeyList = {
  [1] = "Key_Detail",
  [2] = "Key_PlayerInfo",
  [3] = "Key_ClosePlayerInfo",
  [4] = "Key_TeamInfo",
  [5] = "Key_Back"
}

function M:InitListenEvent()
  self:AddDispatcher(EventID.UpdateDungeonValues, self, self.UpdateDungeonValues)
  self:AddDispatcher(EventID.OnRepDungeonVoteInterval, self, self.OnRepDungeonVoteInterval)
  self:BindToAnimationFinished(self.Auto_In, {
    self,
    function()
      self:SetFocus()
      self.bIsFocusable = true
      self.bCanAutoFocus = true
      EventManager:FireEvent(EventID.OnVoteUIAutoInFinished)
    end
  })
end

function M:Construct()
  print(_G.LogTag, "LXZ  Construct")
  self:InitListenEvent()
  self.DefenceWave = 0
  self.bCanAutoFocus = false
  self.SelfPlayerEid = UGameplayStatics.GetPlayerCharacter(self, 0).Eid
  self:SetCurrentWave()
  self:StartCountDown()
  self:SetPlayerInfo()
  AudioManager(self):PlayUISound(self, "event:/ui/common/battle_stage_ui_show", "", nil)
  self.DeviceInPc = CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile"
  local GameState = UGameplayStatics.GetGameState(self)
  self.IsDS = IsDedicatedServer(GameState) or not IsAuthority(GameState)
  self.Box_Leave:Init("Leave", self)
  self.Box_Continue:Init("Continue", self)
  if self.DeviceInPc then
    self:OnGamePadSelectComfirmBox()
    self.Key_Detail:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Controller_CheckDetails")
    })
    self.Key_PlayerInfo:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Controller_CheckPlayer")
    })
    self.Key_ClosePlayerInfo:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_Controller_ClosePlayer")
    })
    self.Key_TeamInfo:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RS"}
      },
      Desc = GText("UI_Controller_CheckTeam")
    })
    self.Key_Back:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_Tips_Close")
    })
  end
  self.VoteInfo = {}
  UIManager(self):HideAllUI_EX({
    self:GetName()
  }, true, "Vote", true)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshInfoByInputTypeChange)
  self.CurMode = self.GameInputModeSubsystem:GetCurrentInputType()
  self:RefreshInfoByInputTypeChange(self.CurMode)
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
end

function M:SetCurrentWavePanelToastInfo()
  local WaveCount = self.CurrentWave
  local UnitDigit = WaveCount % 10
  local TenDigit = math.floor(WaveCount / 10 % 10)
  self.Toast_WaveFinish.Text_Bit:SetText(UnitDigit)
  self.Toast_WaveFinish.Text_Bit:SetOpacity(0.8)
  self.Toast_WaveFinish.Text_Ten:SetText(TenDigit)
  if 0 ~= TenDigit then
    self.Toast_WaveFinish.Text_Ten:SetOpacity(0.8)
  else
    self.Toast_WaveFinish.Text_Ten:SetOpacity(0.2)
  end
  self.Toast_WaveFinish.Text_Content:SetText(GText("UI_Vote_End"))
  self.Toast_WaveFinish.Text_WorldText:SetText(EnText("UI_Vote_End"))
end

function M:StartCountDown(Info)
  local GameState = UGameplayStatics.GetGameState(self)
  if not IsDedicatedServer(GameState) and IsAuthority(GameState) then
    self.Switch_Show:SetActiveWidgetIndex(0)
    self.Panel_Player:SetVisibility(ESlateVisibility.Collapsed)
    self.Text_Top:SetText(GText("UI_Vote_Select"))
  else
    self.Switch_Show:SetActiveWidgetIndex(1)
    self.Text_Tips:SetText(GText("UI_Vote_Retreat_Auto"))
    local Info = GameState.ClientTimerStruct:GetTimerInfo("OnDungeonVoteBegin")
    local VoteMain = UIManager(self):GetUIObj("Vote")
    local NowTime = GameState.ReplicatedRealTimeSeconds
    self:AddTimer(0.1, self.VoteCountDown, true, 0, "VoteCountDown")
  end
end

function M:VoteCountDown()
  local CurrentCountDown, CountDownPercent = self:GetRemainVoteTime()
  local IntCountDown = math.ceil(CurrentCountDown)
  self.CountDown.Text_CountDown:SetText(string.format("%d", IntCountDown))
  self.Bar01:SetPercent(1 - CountDownPercent)
  self.Bar02:SetPercent(1 - CountDownPercent)
  if IntCountDown <= DataMgr.GlobalConstant.VoteReadyCountTime.ConstantValue then
    if not self.LastWarningTime or IntCountDown < self.LastWarningTime then
      AudioManager(self):PlayUISound(self, "event:/ui/common/battle_stage_ui_show", "", nil)
      self.CountDown.FX_Text_CountDown_1:SetText(string.format("%d", IntCountDown))
      self.CountDown:PlayAnimation(self.CountDown.RefreshCountDown)
    end
    self.LastWarningTime = IntCountDown
  end
  if CurrentCountDown < 1 then
    self:RemoveTimer("VoteCountDown")
  end
end

function M:GetRemainVoteTime()
  local GameState = UGameplayStatics.GetGameState(self)
  local Info = GameState.ClientTimerStruct:GetTimerInfo("OnDungeonVoteBegin")
  local RemainVoteTime = Info.Time - (GameState.ReplicatedRealTimeSeconds - Info.RealTimeSeconds)
  local RemainPercent = (GameState.ReplicatedRealTimeSeconds - Info.RealTimeSeconds) / Info.Time
  return RemainVoteTime, RemainPercent
end

function M:SetCurrentWave()
  local DungeonId = GWorld.GameInstance:GetCurrentDungeonId() or 90401
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    self.CurrentWave = 1
  else
    print(_G.LogTag, "LXZ SetCurrentWave", DungeonId, GWorld.GameInstance:GetCurrentDungeonId())
    self.CurrentWave = GameState.DungeonProgress - 1
  end
  self:SetCurrentWavePanelToastInfo()
end

function M:SetPlayerInfo()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not IsDedicatedServer(GameState) and IsAuthority(GameState) then
    return
  end
  self.MultiPlayer:Init(self)
end

function M:Vote(IsContinue)
  print(_G.LogTag, "LXZ  Vote", IsContinue)
  if self.bInClose then
    return
  end
  if IsContinue == self.SelectContinue then
    return
  end
  if IsContinue then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar:TryEnterNextProgress(function(Ret)
        if Ret == ErrorCode.RET_SUCCESS then
          self.SelectContinue = IsContinue
          self:SendVoteResult(EVoteState.Continue)
          self.Box_Leave:OnReleaseLeave()
        elseif Ret == ErrorCode.RET_ACTIONPOINT_NOT_ENOUGH then
          UIUtils.ShowActionRecover(self)
          self.Box_Continue.bClick = false
        end
      end)
    end
  else
    self.SelectContinue = IsContinue
    self.Box_Continue:OnReleaseContinue()
    self:SendVoteResult(EVoteState.Exit)
  end
end

function M:SendVoteResult(VoteState)
  print(_G.LogTag, "LXZ  SendVoteResult", VoteState)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  PlayerCharacter.RPCComponent:SendDungeonVote(VoteState)
end

function M:UpdateDungeonValues(VoteValues)
  for i, v in pairs(VoteValues) do
    self:UpdateDungeonSingleValue(i, v)
  end
end

function M:UpdateDungeonSingleValue(Eid, Value)
  if self.VoteInfo[Eid] == Value then
    return
  end
  local bMainPlayer = self.SelfPlayerEid == Eid
  local bFirstMainPlayer = self.VoteInfo[self.SelfPlayerEid] == nil
  self.VoteInfo[Eid] = Value
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not IsDedicatedServer(GameState) and IsAuthority(GameState) then
    return
  end
  if Value == EVoteState.Wait then
    return
  end
  self.MultiPlayer:OnPlayerVote(Value, Eid, bMainPlayer, bFirstMainPlayer)
end

function M:OnRepDungeonVoteInterval()
  local GameState = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(self)
  UIManager(self):HideAllUI_EX({
    self:GetName()
  }, false, "Vote", true)
  self.bInClose = true
  self:SetFocus()
  self:Close()
end

function M:ShowAndHideGamePadKey(ShowList)
  for i, v in pairs(GamePadKeyList) do
    self[v]:SetVisibility(ESlateVisibility.Collapsed)
  end
  for i, v in pairs(ShowList) do
    self[GamePadKeyList[v]]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:OnGamePadSelectComfirmBox()
  self.FocusState = "ComfirmBox"
  if not self.IsDS then
    self:ShowAndHideGamePadKey({1})
  else
    self:ShowAndHideGamePadKey({1, 4})
  end
end

function M:OnGamePadSelectTeamInfo()
  self.FocusState = "TeamInfo"
  if not self.IsDS then
    self:ShowAndHideGamePadKey({5})
  else
    self:ShowAndHideGamePadKey({2, 5})
  end
end

function M:OnGamePadOpenTeamInfo()
  self.FocusState = "OpenTeamInfo"
  if not self.IsDS then
    self:ShowAndHideGamePadKey({})
  else
    self:ShowAndHideGamePadKey({3})
  end
end

function M:OnClickFaceButtonBottom()
  if self.FocusState == "ComfirmBox" then
  elseif self.FocusState == "TeamInfo" then
    self:OnGamePadOpenTeamInfo()
  elseif self.FocusState == "OpenTeamInfo" then
  end
end

function M:OnClickFaceButtonRight()
  if self.FocusState == "ComfirmBox" then
  elseif self.FocusState == "TeamInfo" then
    self:OnGamePadSelectComfirmBox()
    self.Box_Leave.Box_Leave:SetFocus()
  elseif self.FocusState == "OpenTeamInfo" then
    print(_G.LogTag, "LXZ OnClickFaceButtonRight22222", self.FocusState)
    self.MultiPlayer:SetFocus()
    self:OnGamePadSelectTeamInfo()
  end
end

function M:OnClickRS()
  if self.FocusState == "ComfirmBox" then
    if self.IsDS then
      self:OnGamePadSelectTeamInfo()
      self.MultiPlayer:SetFocus()
    end
  elseif self.FocusState == "TeamInfo" then
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_FaceButton_Bottom" == InKeyName then
      self:OnClickFaceButtonBottom()
    elseif "Gamepad_FaceButton_Right" == InKeyName then
      self:OnClickFaceButtonRight()
    elseif "Gamepad_RightThumbstick" == InKeyName then
      self:OnClickRS()
    elseif "Gamepad_FaceButton_Left" == InKeyName then
      self.Box_Leave:OnGamepadPressLeave()
    elseif "Gamepad_FaceButton_Top" == InKeyName then
      self.Box_Continue:OnGamepadPressContinue()
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_FaceButton_Left" == InKeyName then
      self.Box_Leave:OnGamepadReleaseLeave()
    elseif "Gamepad_FaceButton_Top" == InKeyName then
      self.Box_Continue:OnGamepadReleaseContinue()
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:RefreshInfoByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.MouseAndKeyboard and self.DeviceInPc then
    self.Controller:SetVisibility(ESlateVisibility.Collapsed)
  elseif CurInputDevice == ECommonInputType.Gamepad and self.DeviceInPc then
    if self.bCanAutoFocus then
      self.Box_Leave.Box_Leave:SetFocus()
    end
    self.Controller:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:OnGamePadSelectComfirmBox()
  elseif CurInputDevice == ECommonInputType.Touch then
  end
  self.Box_Leave:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.Box_Continue:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
end

function M:OnItemMenuOpenChanged(bIsOpen)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  local CurMode = self.GameInputModeSubsystem:GetCurrentInputType()
  if CurMode ~= ECommonInputType.Gamepad then
    return
  end
  if bIsOpen then
    self.Controller:SetVisibility(ESlateVisibility.Collapsed)
    self.Box_Leave.WS_Controller01:SetActiveWidgetIndex(0)
    self.Box_Leave.WS_Controller02:SetActiveWidgetIndex(0)
    self.Box_Continue.WS_Controller01:SetActiveWidgetIndex(0)
    self.Box_Continue.WS_Controller02:SetActiveWidgetIndex(0)
    self.Box_Continue.Cost:SwitchToPC()
  else
    self.Controller:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Box_Leave.WS_Controller01:SetActiveWidgetIndex(1)
    self.Box_Leave.WS_Controller02:SetActiveWidgetIndex(1)
    self.Box_Continue.WS_Controller01:SetActiveWidgetIndex(1)
    self.Box_Continue.WS_Controller02:SetActiveWidgetIndex(1)
    self.Box_Continue.Cost:SwitchToGamePad()
    if self.SelectContinueWaveReward then
      self.Box_Continue.Box_Continue:SetFocus()
    else
      self.Box_Leave.Box_Leave:SetFocus()
    end
  end
end

function M:BP_GetDesiredFocusTarget()
  if self.bInClose then
    return self
  end
  return self.Box_Leave.Box_Leave
end

function M:Close()
  self.Box_Leave:OnClose()
  M.Super.Close(self)
end

return M
