require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")
local ProgressBarRefreshIntervel = 0.1
local ProgressBarRefreshTimerTag = "QTE_ProgressBar"

function M:ResponseQTE(Config)
  DebugPrint("QTE: ResponseQTE", Config.SuccessClickNum)
  self:InitQTEData(Config)
  self:SwitchBindButtonClickEvents(true)
  self:SwitchType(Config)
  self:InitButtonPerformance()
  self:AdaptPlatform()
  self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:PlayAnimation(self.In)
  self:SetFocus()
  self:SwitchShowMouseCursorInPIE(true)
  self:PlayQTEShowAudio()
  self:AddEvent()
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
end

function M:AddEvent()
  EventManager:AddEvent(EventID.PauseQTE, self, self.PauseQTE)
  EventManager:AddEvent(EventID.ResumeQTE, self, self.ResumeQTE)
end

function M:RemoveEvent()
  EventManager:RemoveEvent(EventID.PauseQTE, self)
  EventManager:RemoveEvent(EventID.ResumeQTE, self)
end

function M:SwitchType(Config)
  if Config.ClickType == "Single" then
    self.bRefreshProgressBar = true
    self:SwitchHideProgressBar(false)
    self:SwitchShowVX_Par(false)
  elseif Config.ClickType == "Multi" then
    self:SwitchHideProgressBar(true)
    self:SwitchShowVX_Par(true)
    self:BindToAnimationFinished(self.In, {
      self,
      function()
        self:PlayRemindAnimation()
      end
    })
  end
end

function M:Tick(MyGeometry, InDeltaTime)
  if not self:CheckCanWorking() then
    return
  end
  if self.bSimulateRemindAnimation and self.RemindNiagaraComponent then
    self.RemindNiagaraComponent:SetPaused(false)
    self.RemindNiagaraComponent:AdvanceSimulation(1, InDeltaTime)
    self.RemindNiagaraComponent:SetPaused(true)
  end
  if self.bRefreshProgressBar then
    self:RefreshProgressBar(InDeltaTime)
  end
end

function M:PlayRemindAnimation()
  self:PlayAnimation(self.Remind)
  self:BindToAnimationFinished(self.Remind, {
    self,
    function()
      self.bSimulateRemindAnimation = true
      self.RemindNiagaraComponent = self.VX_Par:GetNiagaraComponent()
      self.RemindNiagaraComponent:SetAgeUpdateMode(0)
      self.RemindNiagaraComponent:SetPaused(true)
    end
  })
end

function M:SwitchShowVX_Par(bShow)
  if bShow then
    self.VX_Par:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.VX_Par:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:SwitchHideProgressBar(bHide)
  if bHide then
    self.Progress_Bar_BG:SetVisibility(ESlateVisibility.Collapsed)
    self.Progress_Bar_1:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Progress_Bar_BG:SetVisibility(ESlateVisibility.Visible)
    self.Progress_Bar_1:SetVisibility(ESlateVisibility.Visible)
  end
end

function M:InitQTEData(Config)
  self.bQteResponded = false
  self.QTEConfig = Config
  self.bWorking_QTE = true
  self.ShortClickCount = 0
  self.FaultClickCount = 0
  self.FaultDownKeys = {}
  self.ProgressBarPercent = 1
  self.ProgressBarMat = self.Progress_Bar_1:GetDynamicMaterial()
end

function M:RefreshProgressBar(DeltaTime)
  DebugPrint("QTE: UI RefreshProgressBar", self.ProgressBarPercent)
  if self.bWorking_QTE and self.QTEConfig then
    self.ProgressBarPercentStep = DeltaTime / self.QTEConfig.RealWindowSize
    self.ProgressBarPercent = self.ProgressBarPercent - self.ProgressBarPercentStep
    self.ProgressBarMat:SetScalarParameterValue("Percent", self.ProgressBarPercent)
    if self.ProgressBarPercent < 0 then
      self:OnQTEFailed()
    end
  end
end

function M:GetClickButtonText()
  if not (self.QTEConfig and self.QTEConfig.InputActionName) or not self.QTEConfig.InputGamePadActionName then
    return
  end
  return self.QTEConfig.InputActionName
end

function M:OnInputPress()
  if not self:CheckCanWorking() then
    return
  end
  self.ShortClickCount = self.ShortClickCount + 1
  DebugPrint("QTE: Correct Click", self.ShortClickCount)
  self:PlayAnimation(self.FeedBack)
  if self.ShortClickCount >= self.QTEConfig.SuccessClickNum then
    self:OnQTESucceed()
  else
    self:PlayQTERightPressAudio()
  end
end

function M:GetTargetKeyName()
  if not (self.QTEConfig and self.QTEConfig.InputActionName) or not self.QTEConfig.InputGamePadActionName then
    return
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if self.QTEConfig.InputGamePadActionName == "None" then
      return UIConst.GamePadKey.FaceButtonTop
    else
      return self.QTEConfig.InputGamePadActionName
    end
  end
  return self.QTEConfig.InputActionName
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  if not self:CheckCanWorking() then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  DebugPrint("QTE: OnKeyUp", InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local TargetKeyName = self:GetTargetKeyName()
  if TargetKeyName and InKey.KeyName == TargetKeyName then
    self:OnInputPress()
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  self.FaultClickCount = self.FaultClickCount + 1
  DebugPrint("QTE: \230\140\137\233\148\174\233\148\153\232\175\175\239\188\140\233\148\153\232\175\175\230\172\161\230\149\176", self.FaultClickCount)
  if self.FaultClickCount > self.QTEConfig.ClickFaultToleranceCount then
    DebugPrint("QTE: \231\148\177\228\186\142\230\140\137\233\148\153\230\172\161\230\149\176\232\182\133\232\191\135\232\174\190\231\189\174\229\128\188\239\188\140QTE\229\164\177\232\180\165", self.QTEConfig.ClickFaultToleranceCount)
    self:OnQTEFailed()
  else
    self:PlayQTEFaultPressAudio()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnQTESucceed()
  if not self:CheckCanWorking() then
    return
  end
  self:PlayQTESuccessAudio()
  self.bQteResponded = true
  self.bQteSucceed = true
  self:ClearQTE()
  self:StopAllAnimations()
  self:PlayAnimation(self.Success)
end

function M:OnQTEFailed()
  if not self.bWorking_QTE then
    return
  end
  if not self:CheckCanWorking() then
    return
  end
  self:PlayQTEFailAudio()
  self.bQteResponded = true
  self.bQteSucceed = false
  self:ClearQTE()
  self:StopAllAnimations()
  self:PlayAnimation(self.Fail)
end

function M:CheckCanWorking()
  return self.bWorking_QTE
end

function M:ClearQTE()
  self.bWorking_QTE = false
  self.FaultDownKeys = {}
  self.bSimulateRemindAnimation = false
  self.ActionMappings = nil
  self.bRefreshProgressBar = false
  self:SwitchBindButtonClickEvents(false)
  self:SwitchShowMouseCursorInPIE(false)
  self:CleanTimer()
  self:StopQTEShowAudio()
  self:RemoveEvent()
end

function M:OnAnimationFinished(Animation)
  if Animation == self.Success then
    if self.OnSuccCallbackObj and self.OnSuccCallbackFunc then
      self:SetVisibility(ESlateVisibility.Collapsed)
      self.OnSuccCallbackFunc(self.OnSuccCallbackObj)
      self:SetOnSuccCallback()
    end
  elseif Animation == self.Fail and self.OnFailCallbackObj and self.OnFailCallbackFunc then
    self:SetVisibility(ESlateVisibility.Collapsed)
    self.OnFailCallbackFunc(self.OnFailCallbackObj)
    self:SetOnFailCallback()
  end
end

function M:SetOnSuccCallback(Obj, Func)
  self.OnSuccCallbackObj = Obj
  self.OnSuccCallbackFunc = Func
end

function M:SetOnFailCallback(Obj, Func)
  self.OnFailCallbackObj = Obj
  self.OnFailCallbackFunc = Func
end

function M:OnTimeOut(bForceSuccess, CB)
  DebugPrint("QTE: WBP_QTE_Common: OnTimeOut")
  self.bWorking_QTE = false
  self:SetOnSuccCallback()
  self:SetOnFailCallback()
  self:ClearQTE()
  if not self.bQteResponded then
    if bForceSuccess then
      self:BindToAnimationFinished(self.Out, {
        self,
        function()
          CB()
        end
      })
      self:PlayAnimation(self.Out)
    else
      self:BindToAnimationFinished(self.Fail, {
        self,
        function()
          CB()
        end
      })
      self:PlayAnimation(self.Fail)
      self:PlayQTEFailAudio()
    end
  else
    CB()
  end
end

function M:PauseQTE()
  self.bWorking_QTE = false
end

function M:ResumeQTE()
  self.bWorking_QTE = true
end

function M:PlayQTEShowAudio()
  AudioManager(self):PlayUISound(self, "event:/ui/common/qte_show", "QTEShow", nil)
end

function M:StopQTEShowAudio()
  AudioManager(self):StopSound(self, "QTEShow")
end

function M:PlayQTEFailAudio()
  AudioManager(self):PlayUISound(self, "event:/ui/common/qte_fail", "", nil)
end

function M:PlayQTESuccessAudio()
  AudioManager(self):PlayUISound(self, "event:/ui/common/qte_success", "", nil)
end

function M:PlayQTERightPressAudio()
  AudioManager(self):PlayUISound(self, "event:/ui/common/qte_press", "", nil)
end

function M:PlayQTEFaultPressAudio()
  AudioManager(self):PlayUISound(self, "event:/ui/common/qte_press_err_key", "", nil)
end

function M:InitButtonPerformance()
  DebugPrint("WBP_QTE_Common:InitButtonPerformance \230\156\170\229\174\158\231\142\176")
end

function M:SwitchBindButtonClickEvents(bBind)
  DebugPrint("WBP_QTE_Common:SwitchBindButtonClickEvents \230\156\170\229\174\158\231\142\176")
end

function M:AdaptPlatform()
  DebugPrint("WBP_QTE_Common:AdaptPlatform \230\156\170\229\174\158\231\142\176")
end

function M:SwitchShowMouseCursorInPIE(bShow)
  DebugPrint("WBP_QTE_Common:SwitchShowMouseCursorInPIE\230\156\170\229\174\158\231\142\176")
  if URuntimeCommonFunctionLibrary.IsPlayInEditor(self) then
    local PlayerController = UGameplayStatics.GetPlayerController(self, 0)
    PlayerController.bShowMouseCursor = bShow
  end
end

return M
