require("UnLua")
local M = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  if self.UnitParams.RotateAxis == "X" then
    self.RotateAxis = 0
  elseif self.UnitParams.RotateAxis == "Y" then
    self.RotateAxis = 1
  elseif self.UnitParams.RotateAxis == "Z" then
    self.RotateAxis = 2
  end
end

function M:OnBreakCountDown(SourceEid)
  if self.bInRotate then
    return
  end
  local RotateSucc = self:TryRotate()
  if RotateSucc then
    self.bInRotate = true
    self:ChangeState("Hit", SourceEid)
  end
end

return M
