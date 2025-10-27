require("UnLua")
local M = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function M:OnBreakCountDown(SourceEid)
  M.Super.OnBreakCountDown(self, SourceEid)
  self:ChangeState("Hit", SourceEid)
end

function M:ActiveCombat()
  M.Super.ActiveCombat(self)
  self:OnActive()
end

function M:DeActiveCombat()
  M.Super.DeActiveCombat(self)
  self:OnDeActive()
end

function M:OnEnterState(NowStateId)
  self.Overridden.OnEnterState(self, NowStateId)
  if NowStateId == self.CompleteStateId then
    self:OnComplete()
  end
end

return M
