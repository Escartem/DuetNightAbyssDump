local Component = {}

function Component:UpdateSuitKey2Value(SuitType, SuitSubType, SuitKey, SuitValue)
  if not self:CheckCurrentSubRegion() then
    return
  end
  
  local function Callback(Ret)
  end
  
  self:CallServer("UpdateSuitKey2Value", Callback, SuitType, SuitSubType, SuitKey, SuitValue)
end

function Component:UpdateSuitKey2Table(SuitType, SuitSubType, SuitKey, ...)
  if not self:CheckCurrentSubRegion() then
    return
  end
  local Args = {
    ...
  }
  
  local function Callback(Ret)
  end
  
  self:CallServer("UpdateSuitKey2Table", Callback, SuitType, SuitSubType, SuitKey, Args)
end

return Component
