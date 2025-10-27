local BP_EffectFunctionComponent_C = Class()

function BP_EffectFunctionComponent_C:ExecuteFunction(Source, EffectId, FunctionName, Vars)
  self.Overridden.ExecuteFunction(self, Source, EffectId)
  local Func = self.Overridden[FunctionName]
  assert(Func, "\230\137\190\228\184\141\229\136\176\230\138\128\232\131\189\230\149\136\230\158\156\232\147\157\229\155\190\229\135\189\230\149\176" .. tostring(FunctionName))
  if Vars then
    for VarName, Value in pairs(Vars) do
      self[VarName] = Value
    end
  end
  Func(self)
end

return BP_EffectFunctionComponent_C
