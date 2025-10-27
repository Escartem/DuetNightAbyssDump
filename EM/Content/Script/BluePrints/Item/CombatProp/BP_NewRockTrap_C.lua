require("UnLua")
local BP_RockTrap_C = Class({
  "BluePrints/Item/CombatProp/BP_RockTrap_C"
})

function BP_RockTrap_C:OnActiveBoxOverlap()
end

function BP_RockTrap_C:OnBreakCountDown(SourceEid)
  if not self.IsActive then
    self:ChangeState("Hit", SourceEid)
  end
end

function BP_RockTrap_C:OnEnterState(StateId)
  self.Overridden.OnEnterState(self, StateId)
  if StateId == self.CrashStateId then
    self:OnCrash(self.FloorPos)
  end
end

AssembleComponents(BP_RockTrap_C)
return BP_RockTrap_C
