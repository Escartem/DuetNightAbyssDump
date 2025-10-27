require("UnLua")
local BP_BodyAccessoryItem_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_BodyAccessoryItem_C:EMActorDestroyMulticast_Lua()
  self.FXComponent:StopAllEffects(true)
end

return BP_BodyAccessoryItem_C
