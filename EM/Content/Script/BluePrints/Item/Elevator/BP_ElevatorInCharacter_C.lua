require("UnLua")
local BP_ElevatorInCharacter_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_ElevatorInCharacter_C:ReceiveBeginPlay()
  self.Overridden.ReceiveBeginPlay(self)
  self.InitSuccess = true
end

function BP_ElevatorInCharacter_C:SetCharacterFlySpeed(Speed)
  self.CharacterMovement.MaxFlySpeed = Speed
end

function BP_ElevatorInCharacter_C:ReceiveTick(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
  if self.IsMoveStart or self.IsMoveEnd then
  else
  end
end

function BP_ElevatorInCharacter_C:CloseAllDoor()
  if not Battle(self) then
    return
  end
  local SelfParentActor = Battle(self):GetEntity(self.Eid)
  SelfParentActor:CloseAllDoor()
end

function BP_ElevatorInCharacter_C:OpenTopDoor()
  local SelfParentActor = Battle(self):GetEntity(self.Eid)
  SelfParentActor:OpenTopDoor(SelfParentActor.ElevatorTopChildActor)
end

function BP_ElevatorInCharacter_C:OpenBottomDoor()
  local SelfParentActor = Battle(self):GetEntity(self.Eid)
  SelfParentActor:OpenBottomDoor(SelfParentActor.ElevatorBottomChildActor)
end

function BP_ElevatorInCharacter_C:CheckAllDoorState()
  if not (not (self.Eid <= 0) and Battle(self)) or IsClient(self) then
    return false
  end
  local SelfParentActor = Battle(self):GetEntity(self.Eid)
  if not IsValid(SelfParentActor) then
    return false
  end
  if not SelfParentActor.ElevatorBottomChildActor or not SelfParentActor.ElevatorTopChildActor then
    return false
  end
  if not SelfParentActor.ChildrenState[SelfParentActor.ElevatorBottomChildActor].IsOpenDoor and not SelfParentActor.ChildrenState[SelfParentActor.ElevatorTopChildActor].IsOpenDoor then
    if SelfParentActor.ChildrenState[SelfParentActor.ElevatorBottomChildActor].IsRun or SelfParentActor.ChildrenState[SelfParentActor.ElevatorTopChildActor].IsRun then
      return false
    end
    return true
  end
  return false
end

function BP_ElevatorInCharacter_C:ArrivalDetection(CurrenLocation, TargetLocation, DetecteDistance)
  if DetecteDistance >= TargetLocation.Z - CurrenLocation.Z then
    return true
  end
  if DetecteDistance <= CurrenLocation.Z - TargetLocation.Z then
    self:K2_SetActorLocation(TargetLocation, false, nil, false)
    return true
  end
  return false
end

function BP_ElevatorInCharacter_C:TopArrivalDetecting(CurrenLocation, TargetLocation, DetecteDistance)
  if DetecteDistance >= UKismetMathLibrary.Abs(TargetLocation.Z - CurrenLocation.Z) then
    return true
  end
  if CurrenLocation.Z - TargetLocation.Z >= 2 * DetecteDistance then
    self:K2_SetActorLocation(TargetLocation, false, nil, false)
    return true
  end
  return false
end

function BP_ElevatorInCharacter_C:BottomArrivalDetecting(CurrenLocation, TargetLocation, DetecteDistance)
  if DetecteDistance >= UKismetMathLibrary.Abs(CurrenLocation.Z - TargetLocation.Z) then
    return true
  end
  if CurrenLocation.Z - TargetLocation.Z <= -(2 * DetecteDistance) then
    self:K2_SetActorLocation(TargetLocation, false, nil, false)
    return true
  end
  return false
end

function BP_ElevatorInCharacter_C:GetSelfParentActor()
  local SelfParentActor
  if self.Eid <= 0 then
    return SelfParentActor
  end
  if not Battle(self) then
    return SelfParentActor
  end
  SelfParentActor = Battle(self):GetEntity(self.Eid)
  return SelfParentActor
end

function BP_ElevatorInCharacter_C:SetCurrentActiveEffect()
end

function BP_ElevatorInCharacter_C:PlayEffect()
  local SelfParentActor = self:GetSelfParentActor()
  if not SelfParentActor then
    return
  end
  AudioManager(self):PlayFMODSound(self, nil, self.SoundEvent, "soundKey_lift_fast_running", nil, nil, false, false, nil, true)
  self.FXStartInteractive:Activate(true)
  if self.IsNormalElevator then
    self:RemoveTimer("ExitTimeOneTick")
    
    local function func()
      if self.FXLock:IsActive() then
        self.FXLock:Deactivate()
      end
      SelfParentActor:SetChildActorRunningEffect()
      self.FXRunning:Activate(true)
      self:StartEmissiv()
    end
    
    self:AddTimer(self.DelayRuningTime, func, false, 0, "ExitTimeOneTick")
  end
end

function BP_ElevatorInCharacter_C:SetLockParticle()
  local SelfParentActor = self:GetSelfParentActor()
  if not SelfParentActor then
    return
  end
  SelfParentActor:SetChildActorLockEffect()
end

function BP_ElevatorInCharacter_C:ElevatorStartUp_Lua()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not IsDedicatedServer(self) then
    self:PlayEffect()
    local SelfParentActor = self:GetSelfParentActor()
    if SelfParentActor then
      SelfParentActor:SetChildActorRunningEffect()
    end
  end
  self.Overridden.ElevatorStartUp_Lua(self)
  if not IsValid(GameMode) then
    return
  end
  GameMode:ElevatorStartUp(self:GetSelfParentActor())
  self:TriggerStoryNodeCallback("StartUp")
end

function BP_ElevatorInCharacter_C:ElevatorStopUp_Lua()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not IsDedicatedServer(self) then
    self:SetLockParticle()
    AudioManager(self):StopSound(self, "soundKey_lift_fast_running")
    if self.EndEmissiv then
      self:EndEmissiv()
    end
  end
  self.Overridden.ElevatorStopUp_Lua(self)
  if not IsValid(GameMode) then
    return
  end
  GameMode:ElevatorStopUp(self:GetSelfParentActor())
  self:TriggerStoryNodeCallback("StopUp")
end

function BP_ElevatorInCharacter_C:ElevatorStartDown_Lua()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not IsDedicatedServer(self) then
    self:PlayEffect()
    local SelfParentActor = self:GetSelfParentActor()
    if SelfParentActor then
      SelfParentActor:SetChildActorRunningEffect()
    end
  end
  self.Overridden.ElevatorStartDown_Lua(self)
  if not IsValid(GameMode) then
    return
  end
  GameMode:ElevatorStartDown(self:GetSelfParentActor())
  self:TriggerStoryNodeCallback("StartDown")
end

function BP_ElevatorInCharacter_C:ElevatorStopDown_Lua()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not IsDedicatedServer(self) then
    self:SetLockParticle()
    AudioManager(self):StopSound(self, "soundKey_lift_fast_running")
    if self.EndEmissiv then
      self:EndEmissiv()
    end
  end
  if not IsValid(GameMode) then
    return
  end
  GameMode:ElevatorStopDown(self:GetSelfParentActor())
  self:TriggerStoryNodeCallback("StopDown")
end

function BP_ElevatorInCharacter_C:TriggerStoryNodeCallback(StateName)
  local SelfParentActor = self:GetSelfParentActor()
  if SelfParentActor.StoryNodeCallback and SelfParentActor.StoryNodeCallback[StateName] then
    SelfParentActor.StoryNodeCallback[StateName](SelfParentActor)
  end
end

function BP_ElevatorInCharacter_C:OnRep_IsMoveStart()
end

function BP_ElevatorInCharacter_C:OnRep_IsMoveEnd()
end

function BP_ElevatorInCharacter_C:MoveStart()
  self.Overridden.MoveStart(self)
end

function BP_ElevatorInCharacter_C:MoveEnd()
  self.Overridden.MoveEnd(self)
end

return BP_ElevatorInCharacter_C
