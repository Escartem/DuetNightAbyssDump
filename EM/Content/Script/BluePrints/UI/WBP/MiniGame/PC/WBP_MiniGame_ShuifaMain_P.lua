require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.Overridden.Construct(self)
  self.bGameOver = false
  self.Time = 5
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.bMapIndexIsLocked = false
  self:InitListenEvent()
  self:SetInputUIOnly(true)
end

function M:InitListenEvent()
end

function M:InitAfterBeginPlay()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self:InitWidghtPC()
  elseif CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self:InitWidghtMobile()
  end
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
    self.WidgetSwitcher_Key:SetActiveWidgetIndex(1)
  end
  self:InitCrack()
  self:PlayAnimation(self.In)
  if not self.bMapIndexIsLocked then
    self.MapIndex = self.MapIndex % #DataMgr["MiniGameClick" .. self.Difficulty] + 1
  end
  self.ShuifaDial.RootPage = self
  self.ShuifaDial:InitAfterBeginPlay()
  local time_str = string.format("%02d:%02d", math.floor(self.Time / 60), self.Time % 60)
  self.ShuiFaDial.MiniGame_Time.Text_Time:SetText(time_str)
  self.ShuiFaDial.MiniGame_Time.Text_Time:SetColorAndOpacity(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(1, 1, 1, 1))
  self:AddTimer(1, self.CountDown, true, -1, "CountDown", true)
  self.bGameStart = true
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/shuifa_start", nil, nil)
  AudioManager(self.ShuiFaDial):PlayUISound(self.ShuiFaDial, "event:/ui/minigame/shuifa_push_amb", "ShuifaPlaying", nil)
end

function M:InitWidghtPC()
  self.Key_Hint:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "SpaceBar"}
    }
  })
  self.Key_Back:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "Escape"}
    },
    Desc = GText("UI_BACK")
  })
  self.Key_Hint_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    }
  })
  self.Key_Back_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_BACK")
  })
  self.Key_Back:AddExecuteLogic(self, self.GameFail)
  self.Text_Float_L:SetText(GText("UI_MiniGame_SF_Hint1"))
  self.Text_Float_R:SetText(GText("UI_MiniGame_SF_Hint2"))
end

function M:InitWidghtMobile()
  self.Btn_Close:Init("Close", self, self.GameOver, false)
  if self.ShuifaDial.Key_Space then
    self.ShuifaDial.Key_Space:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.ShuifaDial.MiniGame_Time.WidgetSwitcher_MP:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn_ClickArea.OnClicked:Add(self, self.OnClickSpaceBar)
  self.Text_Float:SetText(GText("UI_MiniGame_SF_Hint_Phone"))
end

function M:InitCrack()
  if not self.bCanCrack then
    return
  end
  self.MiniGame_Crack:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.MiniGame_Crack:Init({
    RootPage = self,
    SuccCallBack = self.GameSuccess,
    NeedCrack = true,
    NeedReset = false
  })
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and "Gamepad_FaceButton_Bottom" == InKeyName then
    self:OnClickSpaceBar()
    IsHandled = true
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_FaceButton_Right" == InKeyName then
      self:GameOver(false)
      IsEventHandled = true
    elseif "Gamepad_FaceButton_Top" == InKeyName then
      self.MiniGame_Crack:OnClickCrackButton()
      IsEventHandled = true
    end
  elseif "Escape" == InKeyName then
    self:GameOver(false)
    IsEventHandled = true
  elseif "F" == InKeyName then
    self.MiniGame_Crack:OnClickCrackButton()
    IsEventHandled = true
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "SpaceBar" == InKeyName then
    self:OnClickSpaceBar()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnClickSpaceBar()
  self.ShuifaDial:OnClickSpaceBar()
end

function M:GameFail()
  self:GameOver(false)
end

function M:GameOver(bSuccess)
  if self.bGameOver then
    return
  end
  self.bGameOver = true
  if bSuccess then
    self:GameSuccess()
  else
    self:GameFailed()
  end
end

function M:GameFailed()
  self:PlayAnimation(self.Fail_Out)
  self.ShuiFaDial.MiniGame_Text.Text_Success:SetText(GText("UI_MiniGame_Success"))
  self.ShuiFaDial.MiniGame_Text.Switcher_Tip:SetActiveWidgetIndex(1)
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/shuifa_fail", nil, nil)
  self:RemoveTimer("CountDown", true)
end

function M:GameSuccess()
  self:PlayAnimation(self.Success_Out)
  self.ShuiFaDial.MiniGame_Text.Text_Fail:SetText(GText("UI_MiniGame_Fail"))
  self.ShuiFaDial.MiniGame_Text.Switcher_Tip:SetActiveWidgetIndex(0)
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/shuifa_success", nil, nil)
end

function M:Close(Value)
  self:SetInputUIOnly(false)
  self.bGameStart = false
  self.UseActor:SetVariableBool("IsGameSuccess", Value, UE4.UGameplayStatics.GetPlayerPawn(self, 0).Eid)
  self.UseActor.ChestInteractiveComponent:EndInteractive(UE4.UGameplayStatics.GetPlayerPawn(self, 0))
  self:UnBindAllFromAnimationFinished(self.ShuiFaDial.Fail)
  self:UnBindAllFromAnimationFinished(self.ShuiFaDial.Success)
  AudioManager(self.ShuiFaDial):StopSound(self.ShuiFaDial, "ShuifaRelease")
  AudioManager(self.ShuiFaDial):StopSound(self.ShuiFaDial, "ShuifaPlaying")
  self.Super.Close(self)
end

function M:Destruct()
  if self.bGameStart then
    self:SetInputUIOnly(false)
    self.UseActor:ChangeState("InteractBreak", self.UseActor.PlayerEid)
  end
  self.Super.Destruct(self)
end

function M:CountDown()
  local time_str = string.format("%02d:%02d", math.floor(self.Time / 60), self.Time % 60)
  self.ShuiFaDial.MiniGame_Time.Text_Time:SetText(time_str)
  if self.Time <= 3 then
    self.ShuiFaDial.MiniGame_Time:PlayAnimation(self.ShuiFaDial.MiniGame_Time.Warning)
  end
  if self.Time <= 0 then
    self:GameOver(false)
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/mech_maze_countdown", nil, nil)
  self.Time = self.Time - 1
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self:GamepadToPC()
  else
    self:SetFocus()
    self:PCToGamepad()
  end
  self.CurInputDeviceType = CurInputDevice
end

function M:GamepadToPC()
  if self.WidgetSwitcher_MP then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
  end
  if self.ShuifaDial.WidgetSwitcher_MP then
    self.ShuifaDial.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
  end
  if self.ShuifaDial.MiniGame_Time.WidgetSwitcher_MP then
    self.ShuifaDial.MiniGame_Time.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
  end
  if self.WidgetSwitcher_Key then
    self.WidgetSwitcher_Key:SetActiveWidgetIndex(0)
  end
  self.ShuifaDial:ShowTips()
end

function M:PCToGamepad()
  if self.WidgetSwitcher_MP then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
  end
  if self.ShuifaDial.WidgetSwitcher_MP then
    self.ShuifaDial.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
  end
  if self.ShuifaDial.MiniGame_Time.WidgetSwitcher_MP then
    self.ShuifaDial.MiniGame_Time.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
  end
  if self.WidgetSwitcher_Key then
    self.WidgetSwitcher_Key:SetActiveWidgetIndex(1)
  end
  self.ShuifaDial:ShowTips()
end

return M
