require("UnLua")
local BP_DebugBattleBug_C = Class()

function BP_DebugBattleBug_C:ReceiveBeginPlay()
  PrintTable({DebugBattleBug_ReceiveBeginPlay_CZC = 1})
  GWorld.PP = self
end

function BP_DebugBattleBug_C:TestF()
  PrintTable({DebugBattleBug_TestF_CZC = 1})
  self.Overridden.ReceiveBeginPlay(self)
end

return BP_DebugBattleBug_C
