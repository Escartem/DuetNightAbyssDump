require("UnLua")
local BP_ElevatorInteractiveComponent_C = Class("BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C")

function BP_ElevatorInteractiveComponent_C:IsCanInteractive(PlayerActor)
  local Owner = self:GetOwner()
  if not Owner then
    return false
  end
  local Eid = -1
  local EMGameState = UE4.UGameplayStatics.GetGameState(self)
  if not EMGameState then
    return false
  end
  local ElevatorMechanismBody = Owner:Cast(UE4.AElevatorMechanismBody)
  if ElevatorMechanismBody then
    Eid = ElevatorMechanismBody.Eid
  end
  local ElevatorInCharacter = Owner:Cast(UE4.AElevatorCharacter)
  if ElevatorInCharacter then
    Eid = ElevatorInCharacter.Eid
    local ElevatorMechanism = Battle(self):GetEntity(Owner.Eid):Cast(UE4.AElevatorMechanism)
    if ElevatorMechanism.CurrentElevatorState == ElevatorMechanismState.ElevatorIn then
      return false
    elseif not ElevatorMechanism:CheckChildrenStateOpen() then
      return false
    end
  end
  local Elevator = Owner:GetAttachParentActor()
  local OpenState = false
  if Elevator then
    OpenState = Elevator.OpenState
  end
  if -1 == Eid then
    return false
  end
  return self.DistanceCheckComponent(self, PlayerActor, self.InteractiveDistance) and self.CFaceToACheckComponent(self, PlayerActor, self.InteractiveFaceAngle) and self.AFaceToCCheckComponent(PlayerActor, self, self.InteractiveAngle) and not OpenState and not self:InteractiveStateCheck()
end

function BP_ElevatorInteractiveComponent_C:StartInteractive(PlayerActor)
  if self:IsCanInteractive(PlayerActor) then
    self:InteractiveImplement(PlayerActor.Eid)
  end
end

function BP_ElevatorInteractiveComponent_C:EndInteractive(PlayerActor)
end

function BP_ElevatorInteractiveComponent_C:InteractiveStateCheck()
  local Owner = self:GetOwner()
  local ElevatorMechanism = Battle(Owner):GetEntity(Owner.Eid)
  if nil == ElevatorMechanism then
    return false
  end
  if ElevatorMechanism.IsCircle then
    return false
  end
  local TypeCheck = true
  if Owner.SelfElevatorState ~= ElevatorMechanismState.ElevatorIn then
    if not Owner.IsRun and not Owner.IsOpenDoor then
      TypeCheck = false
    end
  elseif not Owner.IsMoveEnd and not Owner.IsMoveStart and (not ElevatorMechanism.ElevatorBottomChildActor or not ElevatorMechanism.ElevatorBottomChildActor.IsRun) and (not ElevatorMechanism.ElevatorTopChildActor or not ElevatorMechanism.ElevatorTopChildActor.IsRun) then
    TypeCheck = false
  end
  return ElevatorMechanism.CurrentElevatorState == ElevatorMechanismState.ElevatorIn or TypeCheck
end

function BP_ElevatorInteractiveComponent_C:GetElevatorInnerState()
  local SelfActor = self:GetOwner()
  local SelfParentActor = Battle(self):GetEntity(SelfActor.Eid)
  local InnerElevator = SelfParentActor.ElevatorInCharacter
  if IsValid(InnerElevator) then
    return InnerElevator.ChildActor.SelfElevatorState
  end
  return nil
end

function BP_ElevatorInteractiveComponent_C:OpenDoor()
  local SelfActor = self:GetOwner()
  local SelfParentActor = Battle(self):GetEntity(SelfActor.Eid)
  if 0 == SelfActor.SelfElevatorState then
    SelfParentActor:OpenTopDoor()
  elseif 2 == SelfActor.SelfElevatorState then
    SelfParentActor:OpenBottomDoor()
  end
end

function BP_ElevatorInteractiveComponent_C:ElevatorMove()
  local SelfActor = self:GetOwner()
  local SelfParentActor = Battle(self):GetEntity(SelfActor.Eid)
  if 0 == SelfActor.SelfElevatorState then
    if 2 == SelfParentActor.CurrentElevatorState then
      SelfParentActor.ElevatorInCharacter:MoveStart()
    end
  elseif 1 == SelfActor.SelfElevatorState then
    if 0 == SelfParentActor.CurrentElevatorState then
      SelfActor:MoveEnd()
    elseif 2 == SelfParentActor.CurrentElevatorState then
      SelfActor:MoveStart()
    end
  elseif 0 == SelfParentActor.CurrentElevatorState then
    SelfParentActor.ElevatorInCharacter:MoveEnd()
  end
end

function BP_ElevatorInteractiveComponent_C:InteractiveImplement(PlayerId)
  local SelfActor = self:GetOwner()
  local SelfParentActor = Battle(self):GetEntity(SelfActor.Eid)
  SelfActor.OpenState = true
  self:PlayInteractiveEffects()
  SelfParentActor:MoveElevator(PlayerId, SelfParentActor.Eid, SelfActor.SelfElevatorState)
end

function BP_ElevatorInteractiveComponent_C:InteractiveSuccess()
  local SelfActor = self:GetOwner()
  local SelfParentActor = Battle(self):GetEntity(SelfActor.Eid)
  if SelfParentActor.IsCircle then
    SelfParentActor:PlayMiddle()
    return
  end
  if 1 == SelfActor.SelfElevatorState and 1 ~= SelfParentActor.CurrentElevatorState then
    self:ElevatorMove()
  elseif SelfActor.SelfElevatorState == SelfParentActor.CurrentElevatorState and 1 ~= SelfParentActor.CurrentElevatorState then
    if not SelfActor.IsOpenDoor then
      if 0 == SelfActor.SelfElevatorState then
        SelfParentActor:OpenTopDoor(SelfActor)
      elseif 2 == SelfActor.SelfElevatorState then
        SelfParentActor:OpenBottomDoor(SelfActor)
      end
    end
  else
    self:ElevatorMove()
  end
end

function BP_ElevatorInteractiveComponent_C:PlayInteractiveEffects()
  local SelfActor = self:GetOwner()
  local SelfParentActor = Battle(self):GetEntity(SelfActor.Eid)
  if SelfParentActor.IsCircle then
    SelfParentActor:PlayInteractiveEffects()
    return
  end
end

function BP_ElevatorInteractiveComponent_C:BtnClicked(PlayerActor, InPressTimeSeconds)
  self:StartInteractive(PlayerActor)
end

function BP_ElevatorInteractiveComponent_C:BtnPressed(PlayerActor)
end

function BP_ElevatorInteractiveComponent_C:BtnReleased(PlayerActor, InPressTimeSeconds)
end

return BP_ElevatorInteractiveComponent_C
