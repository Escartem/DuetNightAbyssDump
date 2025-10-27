require("UnLua")
local TargetFilterComponent_C = Class()

function TargetFilterComponent_C:DoBPFilter(Source, Targets, FilterFunc, Vars, ExtraVars, CollisionCompMap)
  local TargetEids = self.Overridden.DoBPFilter(self, Source, Targets)
  if not TargetEids then
    return TargetEids
  end
  self:SetEid2CollisionComponents(CollisionCompMap)
  if FilterFunc and "None" ~= FilterFunc then
    local Func = self.Overridden[FilterFunc]
    assert(Func, "\230\137\190\228\184\141\229\136\176\231\155\174\230\160\135\232\191\135\230\187\164\229\135\189\230\149\176" .. tostring(FilterFunc))
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
    TargetEids = Func(self)
  end
  self.Overridden.FilterResult(self, Source, Targets, TargetEids, FilterFunc, CollisionCompMap)
  return TargetEids
end

function TargetFilterComponent_C:SetEid2CollisionComponents(CollisionCompMap)
  self.Eid2CollisionComponents:Clear()
  if CollisionCompMap then
    self.Eid2CollisionComponents = CollisionCompMap
  end
end

return TargetFilterComponent_C
