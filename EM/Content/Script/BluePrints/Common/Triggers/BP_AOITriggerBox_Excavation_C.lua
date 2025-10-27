require("UnLua")
local M = Class("BluePrints.Common.Triggers.BP_AOITriggerBox_C")

function M:SetBoxExtent_Lua(Size)
  local Info = DataMgr[self.UnitType][self.UnitId]
  local X = Info.UnitParams.X or 100
  local Y = Info.UnitParams.Y or 100
  local Z = Info.UnitParams.Z or 100
  M.Super.SetBoxExtent_Lua(self, FVector(X, Y, Z))
end

function M:InitTriggerEventId(Info)
  self.TriggerEventId = self.UnitId
end

return M
