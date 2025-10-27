require("UnLua")
local BP_MonField_C = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function BP_MonField_C:ClientInitInfo(Info)
end

function BP_MonField_C:OnActorReady(Info)
  BP_MonField_C.Super.OnActorReady(self, Info)
  self:InitMonPropEnd()
end

function BP_MonField_C:ShowDeath(Info)
  self:EMActorDestroy(EDestroyReason.MechanismDead)
end

return BP_MonField_C
