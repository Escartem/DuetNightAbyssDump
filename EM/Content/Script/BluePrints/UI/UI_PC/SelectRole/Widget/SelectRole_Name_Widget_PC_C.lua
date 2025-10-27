require("UnLua")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local PlayerNameUtils = require("Utils.PlayerNameUtils")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Init()
  self.Btn_Continue:BindEventOnClicked(self, self.OnClickButtonContinue)
  self.Btn_Continue:SetText(GText("UI_LOGIN_ENSURE"))
  self.Btn_Continue:ForbidBtn(true)
  self.Text_Input:Init({
    Owner = self,
    Events = {
      OnTextChanged = self.OnNameChanged
    },
    bLimitSpaces = true,
    HintText = GText("UI_LOGIN_ENSURE"),
    TextLimit = 14
  })
  self.Text_Input:SetHintText(GText("UI_REGISTER_NAME"))
  if self.RootPage.SelectNodeType ~= "Current" then
    self.Text_Input:SetText(GText("ExPlayerDefaultName"))
  else
    self.Text_Input:SetText(GText("PlayerDefaultName"))
  end
  self.Text_Num:SetText(0)
  self.NowNameLength = 0
  self.SpaceIndex = {}
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
  else
    self.Btn_Back:SetText(GText("UI_REGISTER_BACK"))
    self.Btn_Back:BindEventOnClicked(self, self.OnClickButtonBack)
  end
  self.Text_Tips01:SetText(GText("UI_REGISTER_OVERLENGTH"))
  self.Text_Tips02:SetText(GText("UI_REGISTER_BANNEDINPUT"))
  self.Text_Tips03:SetText(GText("UI_REGISTER_ILLEGALINPUT"))
  self.Text_Tips04:SetText(GText("UI_REGISTER_INCLUDEBLANKCHAR"))
  self.Switch_Tips:SetRenderOpacity(0)
  self.Root:SetRenderOpacity(0)
  self:BindToAnimationFinished(self.In, {
    self,
    function()
      self:SetVisibility(4)
    end
  })
  self:BindToAnimationFinished(self.Out, {
    self,
    function()
      self:SetVisibility(3)
    end
  })
end

function M:FinishNode()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local RealGameMode = GameMode.SubGameModeInfo:Find("Prologue_Void")
  if RealGameMode and RealGameMode.PlayCastingSequence then
    RealGameMode.Sequence:Stop()
  else
    GameMode.Sequence:Stop()
  end
  EventManager:FireEvent(EventID.OnSelectFinish)
end

function M:OnClickButtonContinue()
  print(_G.LogTag, "LXZ OnClickButtonContinue")
  local Nickname = self.Text_Input:GetText()
  if PlayerNameUtils.CheckIsAllSpace(Nickname) then
    self.Text_Input:ShowTips(GText("UI_REGISTER_EMPTY"), 2)
    return
  end
  self.RootPage.bCanChangeRole = false
  self.Text_Tips02:SetText(GText("UI_REGISTER_BANNEDINPUT"))
  HeroUSDKUtils.CheckStringSensitive(self, Nickname, self.OnNameSensitive, self.OnNameNotSensitive)
end

function M:OnNameSensitive(ReplaceName, Name, Words)
  self.Text_Input:ShowTips(GText("UI_REGISTER_BANNEDINPUT"), 1)
  self.WaitCallBack = false
  self.RootPage.bCanChangeRole = true
end

function M:OnNameNotSensitive(Name)
  if self.WaitCallBack == true then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/gender_select_role_create_success", nil, nil)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  
  local function Callback()
    self:SetInputUIOnly(false)
    self.RootPage:PlayAnimation(self.RootPage.Out)
    self.WaitCallBack = false
    local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
    HeroUSDKSubsystem():HeroSDKRoleEnterGame(HeroUSDKUtils.GenHeroHDCGameRoleInfo())
    AudioManager(self):SetVoiceGender()
  end
  
  self.Btn_Continue:ForbidBtn(true)
  local Sex = self.RootPage.Page_Role.NowRole == "Male" and 0 or 1
  local UsedName = PlayerNameUtils.DeleteHeadAndTailSpace(Name)
  if self.RootPage.SelectNodeType == "Current" then
    Avatar:AvatarCreateRole(UsedName, Sex, Callback)
  else
    Avatar:SetWeitaInfo(UsedName, Sex, Callback)
  end
end

function M:OnClickButtonBack()
  self.RootPage:ChangeWidget("SelectRole")
  self.RootPage.Page_Role.NowState = self.RootPage.Page_Role.NowRole == "Male" and 7 or 6
  self.RootPage:OnBackToDetail()
  if self.RootPage.DeviceInPc then
    self.RootPage.Key_Back:SetVisibility(ESlateVisibility.Collapsed)
    self.RootPage.Key_Observe:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:Handle_KeyEventOnGamePad(InKeyName)
  print(_G.LogTag, "LXZ Handle_KeyEventOnGamePad", InKeyName)
  if "Escape" == InKeyName or "Gamepad_FaceButton_Right" == InKeyName then
    self:OnClickButtonBack()
  elseif "Gamepad_FaceButton_Bottom" == InKeyName then
    print(_G.LogTag, "LXZ Handle_KeyEventOnGamePad2", InKeyName)
    self:OnClickButtonContinue()
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    self.Text_Input:SetFocus()
  elseif "Gamepad_LeftThumbstick" == InKeyName then
    self.Text_Input:PasteText()
  elseif "Gamepad_RightShoulder" == InKeyName then
    print(_G.LogTag, "LXZ Handle_KeyEventOnGamePad", InKeyName, self.RootPage.Page_Role.NowState)
    if self.RootPage.Page_Role.NowRole == "Female" then
      self.RootPage.Page_Role:OnClickButtonMale()
    elseif self.RootPage.Page_Role.NowRole == "Male" then
      self.RootPage.Page_Role:OnClickButtonFemale()
    end
  end
  return true
end

function M:OnNameComposing(Text)
  self.Text_Show:SetText("")
end

function M:OnNameChanged(NewName)
  print(_G.LogTag, "LXZ OnNameChanged", NewName)
  if "" == NewName then
    self.Btn_Continue:ForbidBtn(true)
    return
  end
  self:CheckStrLen()
  self.Btn_Continue:ForbidBtn(false)
end

function M:PlayWariningAnimation(Type)
  self.Switch_Tips:SetActiveWidgetIndex(Type)
  AudioManager(self):PlayUISound(self, "event:/ui/common/input_err", nil, nil)
  self:PlayAnimation(self.Warning)
end

function M:RefreshInfoByInputTypeChange(CurInputDevice, CurGamepadName)
  print(_G.LogTag, "LXZ RefreshInfoByInputTypeChange Name")
  if CurInputDevice == ECommonInputType.MouseAndKeyboard then
    self.Btn_Continue:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  elseif CurInputDevice == ECommonInputType.Gamepad then
    self.Btn_Continue:SetVisibility(ESlateVisibility.Collapsed)
  elseif CurInputDevice == ECommonInputType.Touch then
    self.Btn_Continue:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:CheckStrLen()
  if not self.RootPage.DeviceInPc then
    return
  end
  local Text = self.Text_Input:GetText()
  local Len = self.Text_Input:Utf8StrLen(Text)
  if Len > self.Text_Input.TextLimit or 0 == Len then
    self.RootPage.Key_Continue:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.RootPage.Key_Continue:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

return M
