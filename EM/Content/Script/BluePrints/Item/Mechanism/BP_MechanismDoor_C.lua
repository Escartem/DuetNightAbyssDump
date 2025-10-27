require("UnLua")
local DoorState = {Close = 0, Open = 1}
local BP_MechanismDoor_C = Class("BluePrints.Item.Mechanism.BP_MechanismDoorBase_C")

function BP_MechanismDoor_C:ReceiveBeginPlay()
  self.Super.ReceiveBeginPlay(self)
end

function BP_MechanismDoor_C:ReceiveActorBeginOverlap(OtherActor)
  self.Super.ReceiveActorBeginOverlap(self)
end

function BP_MechanismDoor_C:ReceiveActorEndOverlap(OtherActor)
end

function BP_MechanismDoor_C:IsClose()
  return self.State == DoorState.Close
end

function BP_MechanismDoor_C:IsOpen()
  return self.State == DoorState.Open
end

function BP_MechanismDoor_C:Open()
  self.DoorTimelineComp:Play()
  self.State = DoorState.Open
end

function BP_MechanismDoor_C:ChangeToState(StateId)
  if self.State == StateId then
    return
  end
  if self:IsClose() and StateId == DoorState.Open then
    self:Open()
  end
end

return BP_MechanismDoor_C
