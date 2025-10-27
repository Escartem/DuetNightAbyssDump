local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init(Owner, PlayerState)
  self.Owner = Owner
  self.PlayerState = PlayerState
  self.CurState = "Dead"
  self.StateCheckUpdateTime = 1.0
  self:RefreshUIInfo()
  self:StartStateChange()
end

function M:Clear()
  if self.CurState == "Alive" then
    return
  end
  self.CurState = "Alive"
  self:UnbindAllFromAnimationFinished(self.UseCoin)
  self:UnbindAllFromAnimationFinished(self.Return)
  local RemainTimes = self:GetRemainRecoveryTimes()
  self.Num_Resurrection:SetText(RemainTimes)
  
  local function EndRecovering()
    if RemainTimes <= 0 then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Forbidden)
    else
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
    end
  end
  
  self:BindToAnimationFinished(self.Return, {self, EndRecovering})
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Return)
  self:EndStateChange()
end

function M:RefreshUIInfo()
  local RemainTimes = self:GetRemainRecoveryTimes()
  self.Num_Resurrection_Used:SetText(RemainTimes)
  self.Num_Resurrection:SetText(RemainTimes)
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
end

function M:GetRemainRecoveryTimes()
  local RemainTimes = 0
  if IsValid(self.Owner) then
    RemainTimes = self.Owner:GetRemainRecoveryTimes()
  elseif IsValid(self.PlayerState) and self.PlayerState.RecoveryCount and self.PlayerState.RecoveryMaxCount then
    RemainTimes = self.PlayerState.RecoveryMaxCount - self.PlayerState.RecoveryCount
  end
  return math.max(0, RemainTimes)
end

function M:StartStateChange()
  self:Update()
  self:AddTimer(self.StateCheckUpdateTime, self.Update, true, 0, "CheckState", true)
end

function M:EndStateChange()
  if self:IsExistTimer("CheckState") then
    self:RemoveTimer("CheckState")
  end
end

function M:Update()
  local NowState = self.CurState
  if IsValid(self.Owner) then
    if self.Owner:IsRecoveringByOther() then
      NowState = "RecoveringByOther"
    elseif self.Owner:IsRecoveredBySelf() then
      NowState = "RecoveredBySelf"
    end
  elseif IsValid(self.PlayerState) then
    if "Dead" == NowState and self.PlayerState.TeamRecoveryState == UE4.ETeamRecoveryState.IsWaitingRecover and self.PlayerState.RecoverySpeed > 0 then
      NowState = "RecoveredBySelf"
    end
  else
    self:Clear()
    return
  end
  if NowState == self.CurState then
    return
  end
  if "RecoveringByOther" == NowState then
    if EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Save_Self) then
      EMUIAnimationSubsystem:EMStopAnimation(self, self.Save_Self)
    end
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Save_Teamate)
  elseif "RecoveredBySelf" == NowState then
    local function StartRecoveringBySelf()
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Save_Self)
    end
    
    self:BindToAnimationFinished(self.UseCoin, {self, StartRecoveringBySelf})
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.UseCoin)
  end
  self.CurState = NowState
end

return M
