require("UnLua")
local BP_ElevatorBody_C = Class()

function BP_ElevatorBody_C:ReceiveBeginPlay()
  self.Overridden.ReceiveBeginPlay(self)
  self.InitSuccess = true
end

return BP_ElevatorBody_C
