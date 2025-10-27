require("UnLua")
local WBP_Battle_Resurgence_C = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.TimerMgr"
})

function WBP_Battle_Resurgence_C:Construct()
  self.Super.Construct(self)
  self.Owner = nil
  self.NowTime = nil
  self.RecoveryTickTime = 0.03
  self.CanRecovery = false
  self.HideUITag = "Resurgence"
  self:InitEvent()
  
  local function CloseUi()
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Out)
  end
  
  self:BindToAnimationFinished(self.success, {self, CloseUi})
  self:BindToAnimationFinished(self.Out, {
    self,
    self.ShowBattleMainUI
  })
  self:RefreshOpInfoByInputDevice()
end

function WBP_Battle_Resurgence_C:InitEvent()
  self:AddDispatcher(EventID.CharRecover, self, self.ResurgenceAccomplish)
  self:AddDispatcher(EventID.OnExitDungeon, self, self.OnExitDungeon)
  self:AddDispatcher(EventID.OnMainCharacterInitReady, self, self.OnMainCharacterInitReady)
end

function WBP_Battle_Resurgence_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  if self.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
  else
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
  end
end

function WBP_Battle_Resurgence_C:OnMainCharacterInitReady()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) then
    return
  end
  self.Owner = Player
end

function WBP_Battle_Resurgence_C:InitResurgenceUI(TargetEid)
  self.IsStart = false
  self.Teammate = Battle(self):GetEntity(TargetEid)
  if not IsValid(self.Owner) or self.Owner.Eid ~= TargetEid then
    return
  end
  self:HideBattleMainUI()
  self.Owner:OnDeathDissolve()
  local RemainTimes = self.Owner:GetRemainRecoveryTimes()
  if RemainTimes < 0 then
    self.RemainTimes:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.RemainTimes:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_RemainTimes:SetText(RemainTimes)
    if 0 == RemainTimes then
      self.Text_RemainTimes:SetColorAndOpacity(self.Color_RemainTimes_Red)
    else
      self.Text_RemainTimes:SetColorAndOpacity(self.Color_RemainTimes_Normal)
    end
  end
  if self:IsExistTimer("ListenRecoverValue") then
    self:RemoveTimer("ListenRecoverValue")
  end
  if self:IsExistTimer("ResurgenceAccomplish") then
    self:RemoveTimer("ResurgenceAccomplish")
  end
  self:AddTimer(self.RecoveryTickTime, self.ListenRecoverValue, true, 0, "ListenRecoverValue")
  self.Battle_Resurgence_New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:ShowLongPressHint(self.Owner:CheckCanRecovery())
  self.Text01:SetText("")
  self.Text02:SetText(GText("BATTLE_RECOVERY_LONGPRESSRECOVERY"))
  self.Button_Revive:SetText(GText("BATTLE_RECOVERY_LONGPRESSRECOVERY"))
  self.Button_Revive:BindEventOnClicked(self, function()
    self:SetBarPercentByX(self.Owner)
  end)
  self.Key_Single:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("Recovery"))
      }
    }
  })
  self.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
  self:ResetBar()
  self:StopAllAnimations()
  self:PlayAnimation(self.In)
  if self.IsRecoverKeyPressed then
    self:SetBarPercentByX(self.Owner)
  end
  if self.Owner:HaveDyingCountDown() then
    self.Text_CountDown:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Text_CountDown:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self:InitMobile()
  else
    self:InitPC()
  end
end

function WBP_Battle_Resurgence_C:InitPC()
end

function WBP_Battle_Resurgence_C:InitMobile()
end

function WBP_Battle_Resurgence_C:ShowLongPressHint(IsShow)
  local bIsMobile = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
  if IsShow then
    if bIsMobile then
      self.Panel_Revive_Phone:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.LongpressHint:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.LongpressHint:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Panel_Revive_Phone:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    self.Panel_Revive_Phone:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.LongpressHint:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Battle_Resurgence_C:ListenRecoverValue()
  local DyingLeftTime = self.Owner:GetDyingLeftTime()
  if DyingLeftTime then
    self.Text_CountDown:SetText(math.max(math.floor(DyingLeftTime), 0))
  end
  local NowRecoverValue = self.Owner:GetRecoveryPercent()
  local Percent = math.min(math.max(NowRecoverValue / Const.MaxRecoverValue, 0), 1)
  self.Progress:SetPercent(Percent)
  local VXProgress = self.VX_GlowLine:GetDynamicMaterial()
  local VXPercent = -0.95 + 1.025 * Percent
  VXProgress:SetScalarParameterValue("Main_V_Offset", VXPercent)
  self.Text_RescueByOther:SetText(GText("BATTLE_RECOVERY_BEHELPING"))
  if self.Owner:IsRecoveringByOther() then
    if not self:IsExistTimer("PlayLoopAnimation") then
      local AnimTime = self.Loop:GetEndTime()
      
      local function PlayLoopAnimation()
        self:PlayAnimation(self.Loop)
      end
      
      self:AddTimer(AnimTime, PlayLoopAnimation, true, 0, "PlayLoopAnimation")
    end
    self.Text_RescueByOther:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    if self:IsExistTimer("PlayLoopAnimation") then
      self:RemoveTimer("PlayLoopAnimation")
      self:StopAnimation(self.Loop)
    end
    self.Text_RescueByOther:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Battle_Resurgence_C:OnExitDungeon()
  AudioManager(self):SetEventSoundParam(self, "Recovery", {ToEnd = 1})
end

function WBP_Battle_Resurgence_C:ResurgenceAccomplish(Eid)
  if not IsValid(self.Owner) or self.Owner.Eid ~= Eid then
    return
  end
  if self:IsExistTimer("ListenRecoverValue") then
    self:RemoveTimer("ListenRecoverValue")
  end
  self.Progress:SetPercent(1.0)
  local VXProgress = self.VX_GlowLine:GetDynamicMaterial()
  VXProgress:SetScalarParameterValue("Main_V_Offset", 0.075)
  self:AddTimer(0.033, function()
    AudioManager(self):SetEventSoundParam(self, "Recovery", {ToEnd = 1})
  end)
  local UIBattleMain = UIManager(self.Owner):GetUI("BattleMain")
  if UIBattleMain then
    UIBattleMain:PlayDeathMaskOut()
  end
  self:PlayAnimation(self.success)
end

function WBP_Battle_Resurgence_C:SetBarPercentByX(Character)
  if not (Character:IsDead() and Character:CheckCanRecovery()) or Character:IsInRecovering() or Character.IsTeleportRecovery then
    return
  end
  local bIsMobile = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
  if bIsMobile then
    self:PlayAnimation(self.Phone_BtnOut)
  else
    self:PlayAnimation(self.Press)
  end
  local CurRemainRecoveryTimes = self.Owner:GetRemainRecoveryTimes()
  local AfterRemainReocveryTimes = CurRemainRecoveryTimes - 1
  self:PlayAnimation(self.UseCoin)
  if AfterRemainReocveryTimes <= 0 then
    self.Text_RemainTimes:SetColorAndOpacity(self.Color_RemainTimes_Red)
  end
  self.Text_CountDown:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Text_RemainTimes:SetText(self.Owner:GetRemainRecoveryTimes() - 1)
  self.Owner:ServerBeginRecoverOther(self.Owner.Eid, UE4.ERecoverReason.RecoverReason_SelfRecover)
  AudioManager(self):PlayUISound(self, "event:/ui/common/revive", "Recovery", nil)
end

function WBP_Battle_Resurgence_C:ResetBar()
end

function WBP_Battle_Resurgence_C:HideBattleMainUI()
  local UIBattleMain = UIManager(self.Owner):GetUI("BattleMain")
  if UIBattleMain then
    UIBattleMain:ShowPlayerDeadUI()
  end
  if self.Owner then
    local RespawnRule = self.Owner:GetCurRespawnRuleName()
    if "CommonRegion" == RespawnRule then
      self:HideAllUIWithOutSelf(true, "RegionResurgence")
    end
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/revive_filter", "DeadResurgence", nil)
end

function WBP_Battle_Resurgence_C:ShowBattleMainUI()
  local UIBattleMain = UIManager(self.Owner):GetUI("BattleMain")
  if UIBattleMain then
    UIBattleMain:HidePlayerDeadUI()
  end
  if self.Owner then
    local RespawnRule = self.Owner:GetCurRespawnRuleName()
    if "CommonRegion" == RespawnRule then
      self:HideAllUIWithOutSelf(false, "RegionResurgence")
    end
  end
  AudioManager(self):SetEventSoundParam(self, "DeadResurgence", {ToEnd = 1})
end

return WBP_Battle_Resurgence_C
