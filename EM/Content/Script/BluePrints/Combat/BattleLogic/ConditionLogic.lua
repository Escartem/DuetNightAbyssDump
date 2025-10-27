require("DataMgr")
local Component = {}

function Component:JudgeAndOrNot(Condition, CheckResult, Source, Targets, TraceInfo)
  if Condition.Not ~= nil then
    CheckResult = not CheckResult
  end
  if nil ~= Condition.And then
    for _, V in pairs(Condition.And) do
      if false == CheckResult then
        break
      end
      CheckResult = CheckResult and self:CheckConditionNew(V, Source, Targets, TraceInfo)
    end
  end
  if nil ~= Condition.Or then
    for _, V in pairs(Condition.Or) do
      if true == CheckResult then
        break
      end
      CheckResult = CheckResult or self:CheckConditionNew(V, Source, Targets, TraceInfo)
    end
  end
  return CheckResult
end

function Component:CheckCondition_Lua(ConditionId, Source, Targets, ExtraVars)
  local ret = self.Overridden.CheckCondition(self, ConditionId, Source, Targets)
  if not ret then
    return false
  end
  local _Data = DataMgr.CombatCondition[ConditionId]
  assert(_Data, "CombatCondition\227\128\144" .. tostring(ConditionId) .. "\227\128\145\228\184\141\229\173\152\229\156\168!")
  if _Data.FuncName then
    ret = self.ConditionComponent:CheckCondition_Lua(ConditionId, Source, Targets, ExtraVars)
  end
  return self:JudgeAndOrNot(_Data, ret, Source, Targets)
end

return Component
