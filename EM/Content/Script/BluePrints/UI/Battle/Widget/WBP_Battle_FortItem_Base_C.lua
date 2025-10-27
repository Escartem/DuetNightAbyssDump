local WBP_Battle_FortItem_Base_C = {}

function WBP_Battle_FortItem_Base_C:InitItem_PaoTai(SkillName, Skill, OwnerPlayer, Index, Root)
  self.SkillName_PaoTai = SkillName
  self.Skill_PaoTai = Skill
  self.OwnerPlayer = OwnerPlayer
  self.Index = Index
  self.Root = Root
  self.PaoTaiItem = true
  
  function self.BuffsAddedDelegate()
    self:OnBuffAdded()
  end
  
  function self.BuffsRemovedDelegate()
    self:OnBuffRemoved()
  end
  
  if 1 == self.Index then
    self.BuffId = 40101001
    self.OwnerPlayer.BuffManager:BP_BindOnBuffAdded(self.BuffId, self.BuffsAddedDelegate)
    self.OwnerPlayer.BuffManager:BP_BindOnBuffRemoved(self.BuffId, self.BuffsRemovedDelegate)
  elseif 2 == self.Index then
    self.BuffId = 40101002
    self.OwnerPlayer.BuffManager:BP_BindOnBuffAdded(self.BuffId, self.BuffsAddedDelegate)
    self.OwnerPlayer.BuffManager:BP_BindOnBuffRemoved(self.BuffId, self.BuffsRemovedDelegate)
  end
end

function WBP_Battle_FortItem_Base_C:RefreshSkillStyleInTimer_PaoTai()
  if not IsValid(self.OwnerPlayer) then
    return
  end
  local SkillCdTime, SkillCdPercent = self.OwnerPlayer:GetSkillCdTimeAndPercent(self.Skill_PaoTai.SkillId)
  if SkillCdTime > 0 then
    self.CurButtonState = "InCDTime"
    self.Text_CDPaoTai:SetText(self:GetPreciseDecimal(SkillCdTime, 1))
    self.ProgressBar_CDPaoTai:SetPercent(1 - SkillCdPercent)
  else
    self.CurButtonState = "UnLock"
  end
  self:HandleButtonStateChange_PaoTai()
end

function WBP_Battle_FortItem_Base_C:HandleButtonStateChange_PaoTai()
  if self.LastButtonState ~= self.CurButtonState then
    if self.CurButtonState == "InCDTime" then
      self.Text_CDPaoTai:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Text_CDPaoTai:SetRenderOpacity(1.0)
      self.Icon_Skill:SetRenderOpacity(0.2)
      if self.CD then
        EMUIAnimationSubsystem:EMPlayAnimation(self, self.CD)
      end
    else
      if self.CurButtonState == "UnLock" then
        self.Icon_Skill:SetRenderOpacity(1.0)
        if not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.CDFinishAnimation_PaoTai) then
          EMUIAnimationSubsystem:EMPlayAnimation(self, self.CDFinishAnimation_PaoTai)
        end
      end
      self.ProgressBar_CDPaoTai:SetPercent(0)
      self.Text_CDPaoTai:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  self.LastButtonState = self.CurButtonState
end

function WBP_Battle_FortItem_Base_C:RefreshSkillItem_HotValue(DeltaTime, Percent)
  if self.Root then
    if self.Root.OwnerMechanism.Hot then
      local HotValue = self.Root.OwnerMechanism.HotValue
      if HotValue < 0 then
        HotValue = 0
      end
      local Time = HotValue / (self.Root.OwnerMechanism.RecoverSpeed / self.Root.OwnerMechanism.RecoverInterval)
      local HotPercent = HotValue / self.Root.OwnerMechanism.MaxHotValue
      if HotPercent > 1 then
        HotPercent = 1
      end
      if HotValue < self.Root.OwnerMechanism.MaxHotValue then
        self.Text_CDPaoTai:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        self.Text_CDPaoTai:SetText(self:GetPreciseDecimal(Time, 1))
        self.Text_CDPaoTai:SetRenderOpacity(1.0)
      end
      self.OverHeating_CDPaoTai:SetPercent(HotPercent)
      self.CurButtonState = "InCDTime"
      if 0 == Time then
        self.CurButtonState = "UnLock"
      end
    else
      self.OverHeating_CDPaoTai:SetPercent(Percent)
      self.CurButtonState = "UnLock"
    end
    self:ChangeState_HotValue()
  end
end

function WBP_Battle_FortItem_Base_C:ChangeState_HotValue()
  if self.LastButtonState ~= self.CurButtonState then
    if self.CurButtonState == "InCDTime" then
      self.Icon_Skill:SetRenderOpacity(0.2)
    else
      if self.CurButtonState == "UnLock" then
        self.Icon_Skill:SetRenderOpacity(1.0)
        if not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.CDFinishAnimation_PaoTai) then
          EMUIAnimationSubsystem:EMPlayAnimation(self, self.CDFinishAnimation_PaoTai)
        end
      end
      self.OverHeating_CDPaoTai:SetPercent(0)
      self.Text_CDPaoTai:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  self.LastButtonState = self.CurButtonState
end

function WBP_Battle_FortItem_Base_C:OnBuffAdded()
  self:UnbindAllFromAnimationFinished(self.Cutdown)
  self:BindToAnimationFinished(self.Cutdown, {
    self,
    self.PlayCutdownAnimation
  })
  local Buff = Battle(self.OwnerPlayer):FindBuffById(self.OwnerPlayer, self.BuffId, 0, false)
  local LeftTime = Buff.LeftTime
  if LeftTime >= 0 then
    local Time = LeftTime - 3
    if Time < 0 then
      Time = LeftTime
    end
    self:AddTimer(Time, function()
      self:PlayCutdownAnimation()
    end, false, 0, "RougeBuffTimeCutdownTipTimer", false)
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Sustain_Loop, EUMGSequencePlayMode.Forward)
end

function WBP_Battle_FortItem_Base_C:OnBuffRemoved()
  self:UnbindAllFromAnimationFinished(self.Cutdown)
  if self:IsAnimationPlaying(self.Cutdown) then
    self:StopAnimation(self.Cutdown)
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Sustain_Loop, EUMGSequencePlayMode.Reverse)
end

function WBP_Battle_FortItem_Base_C:PlayCutdownAnimation()
  self:PlayAnimation(self.Cutdown)
end

function WBP_Battle_FortItem_Base_C:Destruct()
  if self.BuffId then
    self:RemoveTimer("RougeBuffTimeCutdownTipTimer")
    self:UnbindAllFromAnimationFinished(self.Cutdown)
    self.OwnerPlayer.BuffManager:BP_UnBindOnBuffAdded(self.BuffId, self.BuffsAddedDelegate)
    self.OwnerPlayer.BuffManager:BP_UnBindOnBuffRemoved(self.BuffId, self.BuffsRemovedDelegate)
  end
end

return WBP_Battle_FortItem_Base_C
