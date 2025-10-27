require("UnLua")
local BP_EMPhantomState_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_EMPhantomState_C:Initialize(Initializer)
end

function BP_EMPhantomState_C:OnRep_TeamRecoveryState(PrevRecoveryState)
  DebugPrint("LHQ_PhantomState OnRep_TeamRecoveryState, NewState:" .. self.TeamRecoveryState, "Eid:", self.Eid, "PrevRecoveryState: ", PrevRecoveryState)
  EventManager:FireEvent(EventID.OnTeamRecoveryStateChange, self.Eid, self.TeamRecoveryState, PrevRecoveryState)
end

function BP_EMPhantomState_C:OnRep_RecoveryValue()
  DebugPrint("PhantomState OnRep_RecoveryValue", self.RecoveryValue)
  EventManager:FireEvent(EventID.OnRepPhantomRecoveryValue, self.RecoveryValue)
end

function BP_EMPhantomState_C:OnRep_RecoverySpeed()
  if not self.bIsHostage then
    return
  end
  DebugPrint("PhantomState OnRep_RecoverySpeed", self.RecoverySpeed)
  if self.TeamRecoveryState == UE4.ETeamRecoveryState.IsWaitingRecover and self.RecoverySpeed > 0 then
    if self.IsRecovering then
      return
    end
    self.IsRecovering = true
    self:OnEnterRecoveringState()
  else
    if not self.IsRecovering then
      return
    end
    self.IsRecovering = false
    self:OnExitRecoveringState()
  end
end

function BP_EMPhantomState_C:OnRep_DyingDuration()
  DebugPrint("PhantomState OnRep_DyingDuration", self.DyingDuration)
  EventManager:FireEvent(EventID.OnRepPhantomDyingDuration, self.DyingDuration)
end

function BP_EMPhantomState_C:OnRep_OwnerEid()
  EventManager:FireEvent(EventID.OnRepOwnerEidPhantomState, self.Eid, self.OwnerEid)
end

function BP_EMPhantomState_C:OnEnterRecoveringState()
  self:TriggerRescueTimerFloatVisibility(true)
end

function BP_EMPhantomState_C:OnExitRecoveringState()
  self:TriggerRescueTimerFloatVisibility(false)
end

function BP_EMPhantomState_C:TriggerRescueTimerFloatVisibility(IsShow)
  if not self.bIsHostage then
    return
  end
  local RescueTimeFloat = UIManager(self):GetUIObj("DungeonRescueTimeFloat")
  local CaptureFloat = UIManager(self):GetUIObj("DungeonCaptureFloat")
  if nil == RescueTimeFloat then
    return
  end
  RescueTimeFloat:OnHostageRecoverState(IsShow)
  if IsShow then
    CaptureFloat.Panel_time:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    CaptureFloat.Panel_time:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

return BP_EMPhantomState_C
