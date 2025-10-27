require("UnLua")
local BP_ConditionComponent_C = Class()

function BP_ConditionComponent_C:CheckCondition_Lua(ConditionId, Source, Targets, ExtraVars)
  local ret = self.Overridden.CheckCondition(self, ConditionId, Source, Targets)
  if not ret then
    return false
  end
  local _Data = DataMgr.CombatCondition[ConditionId]
  local FuncName = _Data.FuncName
  if FuncName then
    local Func = self.Overridden[FuncName]
    assert(Func, "\230\137\190\228\184\141\229\136\176\230\157\161\228\187\182\229\136\164\229\174\154\229\135\189\230\149\176:" .. tostring(FuncName))
    local Vars = _Data.ConditionVars
    if Vars then
      for VarName, Value in pairs(Vars) do
        self[VarName] = Value
      end
    end
    if ExtraVars then
      for VarName, Value in pairs(ExtraVars) do
        self[VarName] = Value
      end
    end
    ret = Func(self)
  end
  self.Overridden.ConditionResult(self, ConditionId, ret)
  return ret
end

return BP_ConditionComponent_C
