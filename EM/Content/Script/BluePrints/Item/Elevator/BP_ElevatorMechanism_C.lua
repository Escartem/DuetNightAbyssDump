require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local BP_ElevatorMechanism_C = Class({
  "BluePrints.Item.BP_CombatItemBase_C",
  "BluePrints.Common.TimerMgr"
})

function BP_ElevatorMechanism_C:ReceiveBeginPlay()
  self.Overridden.ReceiveBeginPlay(self)
  self.Super.ReceiveBeginPlay(self)
end

function BP_ElevatorMechanism_C:Init()
end

function BP_ElevatorMechanism_C:AuthorityInitInfo(Info)
  BP_ElevatorMechanism_C.Super.AuthorityInitInfo(self, Info)
  if Info.State then
    self.CurrentElevatorState = self.StateId
  end
  local LocalTransform
  if self.CurrentElevatorState == UE4.ElevatorMechanismState.ElevatorTop then
    LocalTransform = UE4.UKismetMathLibrary.MakeTransform(MiscUtils.GetObjectLocation(self.ElevatorInSign) + FVector(0, 0, self.MoveHeight), self:K2_GetActorRotation(), UE4.FVector(1, 1, 1))
  else
    self.CurrentElevatorState = UE4.ElevatorMechanismState.ElevatorBottom
    LocalTransform = UE4.UKismetMathLibrary.MakeTransform(MiscUtils.GetObjectLocation(self.ElevatorInSign), self:K2_GetActorRotation(), UE4.FVector(1, 1, 1))
  end
  local ElevatorInCharacter = self:GetWorld():SpawnActor(self.ElevatorInCharacterClass, LocalTransform)
  self.ElevatorInCharacter = ElevatorInCharacter
  self.ElevatorInCharacter.StartLocation = MiscUtils.GetObjectLocation(self.ElevatorInSign)
  self.ElevatorInCharacter.TargetLocation = self.ElevatorInCharacter.StartLocation + FVector(0, 0, self.MoveHeight)
  self.ElevatorInCharacter.Eid = self.Eid
  self.ElevatorInCharacter:SetCharacterFlySpeed(self.Speed)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local MiniGameList = TArray(0)
  if 0 ~= self.ElevatorTopCreatorId then
    GameState.StaticCreatorMap:Find(self.ElevatorTopCreatorId).SourceEid = self.Eid
    MiniGameList:Add(self.ElevatorTopCreatorId)
  end
  if 0 ~= self.ElevatorBottomCreatorId then
    GameState.StaticCreatorMap:Find(self.ElevatorBottomCreatorId).SourceEid = self.Eid
    MiniGameList:Add(self.ElevatorBottomCreatorId)
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:TriggerActiveStaticCreator(MiniGameList)
  EventManager:AddEvent(EventID.OnMiniGameCreated, self, self.OnMiniGameCreated)
end

function BP_ElevatorMechanism_C:ReceiveEndPlay(reason)
  BP_ElevatorMechanism_C.Super.ReceiveEndPlay(self, reason)
  EventManager:RemoveEvent(EventID.OnMiniGameCreated, self)
end

function BP_ElevatorMechanism_C:OnMiniGameCreated(MiniGameActor)
  if not self.ChildrenState then
    self.ChildrenState = {}
  end
  self.ChildrenState[MiniGameActor] = {IsRun = false, IsOpenDoor = false}
  if MiniGameActor.CreatorId == self.ElevatorTopCreatorId then
    self.ElevatorTopChildActor = MiniGameActor
    if self.CurrentElevatorState == UE4.ElevatorMechanismState.ElevatorTop then
      self:OpenTopDoor(self.ElevatorTopChildActor)
    end
  elseif MiniGameActor.CreatorId == self.ElevatorBottomCreatorId then
    self.ElevatorBottomChildActor = MiniGameActor
    if self.CurrentElevatorState == ElevatorMechanismState.ElevatorBottom then
      self:OpenBottomDoor(self.ElevatorBottomChildActor)
    end
  end
end

function BP_ElevatorMechanism_C:OpenTopDoor(ElevatorTopChildActor)
  self.Overridden.OpenTopDoor(self, ElevatorTopChildActor)
  self.ElevatorInCharacter:OpenDoor(ElevatorTopChildActor)
  self:UpdateRegionData("StateId", self.CurrentElevatorState)
end

function BP_ElevatorMechanism_C:OpenBottomDoor(ElevatorBottomChildActor)
  self.Overridden.OpenBottomDoor(self, ElevatorBottomChildActor)
  self.ElevatorInCharacter:OpenDoor(ElevatorBottomChildActor)
  self:UpdateRegionData("StateId", self.CurrentElevatorState)
end

function BP_ElevatorMechanism_C:OpenMoveSetting(TargetActor)
  if IsValid(TargetActor) then
    if self.ChildrenState[TargetActor].IsRun or self.ChildrenState[TargetActor].IsOpenDoor then
      return false
    end
    self.ChildrenState[TargetActor].IsRun = true
    return true
  end
  return false
end

function BP_ElevatorMechanism_C:CloseMoveSetting(TargetActor)
  if IsValid(TargetActor) then
    if not self.ChildrenState[TargetActor].IsOpenDoor or self.ChildrenState[TargetActor].IsRun then
      return false
    end
    self.ChildrenState[TargetActor].IsRun = true
    return true
  end
  return false
end

function BP_ElevatorMechanism_C:CompleteNotify(TargetActor)
  if IsValid(TargetActor) then
    self.ChildrenState[TargetActor].IsOpenDoor = not self.ChildrenState[TargetActor].IsOpenDoor
    self.ChildrenState[TargetActor].IsRun = false
    EventManager:FireEvent(EventID.ElevatorMechanismCompleteNotify, self)
  end
  self:UpdateMiniGameState()
end

function BP_ElevatorMechanism_C:CloseAllDoor()
  self:CloseBottomDoor(self.ElevatorBottomChildActor)
  self:CloseTopDoor(self.ElevatorTopChildActor)
  self.ElevatorInCharacter:CloseDoor(self.ElevatorBottomChildActor)
  self.ElevatorInCharacter:CloseDoor(self.ElevatorTopChildActor)
end

function BP_ElevatorMechanism_C:PlayOpenDoorSound(Component)
  AudioManager(self):PlayFMODSound(Component, nil, "event:/sfx/common/scene/lift_fast_door_open")
end

function BP_ElevatorMechanism_C:PlayCloseDoorSound(Component)
  AudioManager(self):PlayFMODSound(Component, nil, "event:/sfx/common/scene/lift_fast_door_close")
end

function BP_ElevatorMechanism_C:RealMoveLua(ElevatorId, SourceEid)
  if IsAuthority(self) then
    local SelfChildActor = self:GetSelfChildActor(SourceEid)
    local RequiredState = self:GetSelfChildActorState(SourceEid)
    if 1 == RequiredState and 1 ~= self.CurrentElevatorState then
      self:ElevatorMove(RequiredState)
    elseif RequiredState == self.CurrentElevatorState and 1 ~= self.CurrentElevatorState then
      if not self.ChildrenState[SelfChildActor].IsOpenDoor then
        if 0 == RequiredState then
          self:OpenTopDoor(SelfChildActor)
        elseif 2 == RequiredState then
          self:OpenBottomDoor(SelfChildActor)
        end
      end
    else
      self:ElevatorMove(RequiredState)
    end
  end
end

function BP_ElevatorMechanism_C:GetSelfChildActor(SourceEid)
  if SourceEid == self.ElevatorTopChildActor.Eid then
    return self.ElevatorTopChildActor
  elseif SourceEid == self.ElevatorBottomChildActor.Eid then
    return self.ElevatorBottomChildActor
  elseif SourceEid == self.ElevatorInCharacter.Eid then
    return self.ElevatorInCharacter
  end
  return nil
end

function BP_ElevatorMechanism_C:GetSelfChildActorState(SourceEid)
  if SourceEid == self.ElevatorTopChildActor.Eid then
    return ElevatorMechanismState.ElevatorTop
  elseif SourceEid == self.ElevatorBottomChildActor.Eid then
    return ElevatorMechanismState.ElevatorBottom
  end
  return ElevatorMechanismState.ElevatorIn
end

function BP_ElevatorMechanism_C:SetChildActorRunningEffect()
  if IsValid(self.ElevatorInCharacter) then
    if self.ElevatorInCharacter.FXLock:IsActive() then
      self.ElevatorInCharacter.FXLock:Deactivate()
    end
    if not self.ElevatorInCharacter.FXRunning:IsActive() then
      self.ElevatorInCharacter.FXRunning:Activate(true)
    end
  end
end

function BP_ElevatorMechanism_C:SetChildActorLockEffect()
  if IsValid(self.ElevatorInCharacter) then
    if self.ElevatorInCharacter.FXRunning:IsActive() then
      self.ElevatorInCharacter.FXRunning:Deactivate()
    end
    self.ElevatorInCharacter.FXLock:Activate(true)
  end
end

function BP_ElevatorMechanism_C:ClientInitInfo(Info)
  if IsStandAlone(self) or IsClient(self) then
  end
end

function BP_ElevatorMechanism_C:OnRep_ElevatorBottomChildActor()
  DebugPrint("crack,....OnRep_ElevatorBottomChildActor")
  if not self.ChildrenState then
    self.ChildrenState = {}
  end
  self.ChildrenState[self.ElevatorBottomChildActor] = {IsRun = false, IsOpenDoor = false}
end

function BP_ElevatorMechanism_C:OnRep_ElevatorTopChildActor()
  DebugPrint("crack,....OnRep_ElevatorTopChildActor")
  if not self.ChildrenState then
    self.ChildrenState = {}
  end
  self.ChildrenState[self.ElevatorTopChildActor] = {IsRun = false, IsOpenDoor = false}
end

function BP_ElevatorMechanism_C:OnRep_ElevatorInCharacter()
  self.ElevatorInCharacter.ElevatorInteractiveComponent.DisplayInteractiveName = GText(self.ElevatorInCharacter.ElevatorInteractiveComponent.InteractiveName)
end

function BP_ElevatorMechanism_C:AddStoryNodeCallback(StateName, Callback)
  if not self.StoryNodeCallback then
    self.StoryNodeCallback = {}
  end
  self.StoryNodeCallback[StateName] = Callback
end

function BP_ElevatorMechanism_C:RemoveStoryNodeCallback(StateName)
  self.StoryNodeCallback[StateName] = nil
end

function BP_ElevatorMechanism_C:GetGuideLocation(IsTargetTop, Target)
  if IsTargetTop then
    if self.CurrentElevatorState == ElevatorMechanismState.ElevatorBottom and not self.ElevatorInCharacter.IsMoveStart then
      if self.ChildrenState[self.ElevatorBottomChildActor].IsOpenDoor then
        return self.ElevatorInCharacter, true
      else
        return self.ElevatorBottomChildActor, true
      end
    end
    return nil, false
  else
    if self.CurrentElevatorState == ElevatorMechanismState.ElevatorTop and not self.ElevatorInCharacter.IsMoveStart then
      if self.ChildrenState[self.ElevatorTopChildActor].IsOpenDoor then
        return self.ElevatorInCharacter, true
      else
        return self.ElevatorTopChildActor, true
      end
    end
    return nil, false
  end
end

function BP_ElevatorMechanism_C:SetLifeTime(LifeTime, Reason)
end

function BP_ElevatorMechanism_C:TriggerByChild(SourceEid)
  self:RealMove(self.Eid, SourceEid)
end

function BP_ElevatorMechanism_C:ElevatorMove(ChildState)
  if 0 == ChildState then
    if 2 == self.CurrentElevatorState then
      self.ElevatorInCharacter:MoveStart()
    end
  elseif 1 == ChildState then
    if 0 == self.CurrentElevatorState then
      self.ElevatorInCharacter:MoveEnd()
    elseif 2 == self.CurrentElevatorState then
      self.ElevatorInCharacter:MoveStart()
    end
  elseif 0 == self.CurrentElevatorState then
    self.ElevatorInCharacter:MoveEnd()
  end
end

function BP_ElevatorMechanism_C:UpdateMiniGameState()
  DebugPrint("crack", "UpdateMiniGameState", self.ChildrenState[self.ElevatorTopChildActor], self.ChildrenState[self.ElevatorBottomChildActor])
  if self.ChildrenState[self.ElevatorTopChildActor] then
    DebugPrint("crack", "ElevatorTopChildActor,IsOpenDoor", self.ChildrenState[self.ElevatorTopChildActor].IsOpenDoor)
  end
  if self.ChildrenState[self.ElevatorBottomChildActor] then
    DebugPrint("crack", "ElevatorBottomChildActor,IsOpenDoor", self.ChildrenState[self.ElevatorBottomChildActor].IsOpenDoor)
  end
  if IsValid(self.ElevatorTopChildActor) and not self.ChildrenState[self.ElevatorTopChildActor].IsOpenDoor and IsValid(self.ElevatorBottomChildActor) and not self.ChildrenState[self.ElevatorBottomChildActor].IsOpenDoor then
    return
  end
  local topStateId = self.StateUninteractiveId
  local bottomStateId = self.StateUninteractiveId
  if 0 == self.CurrentElevatorState then
    topStateId = self.StateUninteractiveId
    bottomStateId = self.StateInteractiveId
  elseif 2 == self.CurrentElevatorState then
    bottomStateId = self.StateUninteractiveId
    topStateId = self.StateInteractiveId
  end
  if IsValid(self.ElevatorTopChildActor) and self.ElevatorTopChildActor.StateId ~= topStateId then
    DebugPrint("crack", "ChangeState Top", topStateId)
    self.ElevatorTopChildActor:ChangeState("Manual", 0, topStateId)
  end
  if IsValid(self.ElevatorBottomChildActor) and self.ElevatorBottomChildActor.StateId ~= bottomStateId then
    DebugPrint("crack", "ChangeState Bottom", bottomStateId)
    self.ElevatorBottomChildActor:ChangeState("Manual", 0, bottomStateId)
  end
end

function BP_ElevatorMechanism_C:CheckChildrenStateOpen()
  if not self.ElevatorTopChildActor and not self.ElevatorBottomChildActor then
    return true
  end
  if self.ElevatorTopChildActor and 2 == self.CurrentElevatorState then
    return self.ElevatorTopChildActor.StateId == self.StateInteractiveId
  end
  if self.ElevatorBottomChildActor and 0 == self.CurrentElevatorState then
    return self.ElevatorBottomChildActor.StateId == self.StateInteractiveId
  end
  return false
end

function BP_ElevatorMechanism_C:CreateRegionData()
  self.RegionData = {
    StateId = self.CurrentElevatorState
  }
end

function BP_ElevatorMechanism_C:OnRep_StateId()
end

return BP_ElevatorMechanism_C
