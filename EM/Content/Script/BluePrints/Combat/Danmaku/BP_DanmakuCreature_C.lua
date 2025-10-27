local BP_DanmakuCreature_C = Class()
BP_DanmakuCreature_C._components = {}

function BP_DanmakuCreature_C:InitVars()
  local CreatureInfo = DataMgr.DanmakuCreature[self.CreatureId]
  if CreatureInfo and CreatureInfo.Vars then
    for VarName, Value in pairs(CreatureInfo.Vars) do
      self[VarName] = Value
    end
  end
end

function BP_DanmakuCreature_C:OnBreakCountDown()
  self.Overridden.OnBreakCountDown(self)
end

return BP_DanmakuCreature_C
