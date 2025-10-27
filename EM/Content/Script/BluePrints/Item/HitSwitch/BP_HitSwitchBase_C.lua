require("UnLua")
local M = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function M:OnBreakCountDown(SourceEid)
  M.Super.OnBreakCountDown(self, SourceEid)
  self:ChangeState("Hit", SourceEid)
end

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  Battle(self):AddBuffToTarget(self, self, 5000017, -1, nil, nil)
  self.JumpWordComponent:K2_DestroyComponent(self)
end

function M:ClientInitInfo(Info)
  M.Super.ClientInitInfo(self, Info)
  self.BillboardComponent.IsInit = true
end

function M:OnStateChangeCountDownLua(RemainTimePercent, RemainTime)
  EventManager:FireEvent(EventID.OnRepHitSwitchTimer, RemainTimePercent)
end

return M
