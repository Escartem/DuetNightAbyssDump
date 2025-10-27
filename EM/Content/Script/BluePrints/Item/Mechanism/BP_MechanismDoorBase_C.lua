require("UnLua")
local BP_MechanismDoorBase_C = Class()

function BP_MechanismDoorBase_C:ReceiveBeginPlay()
  self.State = 0
end

function BP_MechanismDoorBase_C:ReceiveActorBeginOverlap(OtherActor)
end

function BP_MechanismDoorBase_C:ReceiveActorEndOverlap(OtherActor)
end

return BP_MechanismDoorBase_C
