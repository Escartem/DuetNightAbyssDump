require("UnLua")
local M = Class({
  "BluePrints/Item/AirWall/BP_FieldCreature_C"
})

function M:OnBreakCountDown(SourceEid)
  M.Super.OnBreakCountDown(self, SourceEid)
  self:ChangeState("Hit", SourceEid)
end

function M:ClientInitInfo(Info)
  M.Super.ClientInitInfo(self, Info)
  self.BillboardComponent.IsInit = true
end

return M
