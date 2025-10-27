local Component = {}

function Component:TriggerCondition(ConditionType, ...)
  local info = DataMgr.Condition2Id[ConditionType]
  assert(info, "Unknown ConditionType: " .. ConditionType)
  local Params = {
    ...
  }
  local ConditionIds = info
  local ConditionIdsFunc = self["Get" .. ConditionType .. "Ids"]
  if ConditionIdsFunc then
    ConditionIds = ConditionIdsFunc(self, info, ...)
  else
    for i = 1, #Params do
      local p = Params[i]
      ConditionIds = ConditionIds[p]
      if nil == ConditionIds then
        return
      end
    end
  end
  if type(ConditionIds) ~= "table" then
    return
  end
  local func = self["TriggerCondition" .. ConditionType]
  for i = 1, #ConditionIds do
    local ConditionId = ConditionIds[i]
    if func then
      func(self, ConditionId)
    else
      print(_G.LogTag, "TriggerCondition", ConditionType, ConditionId)
      self:ServerTriggerCheckCondition(ConditionId)
    end
  end
end

function Component:ServerTriggerCheckCondition(ConditionId)
  if IsStandAlone(self) or IsClient(self) then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar:ClientTriggerCheckCondition(ConditionId)
    end
  else
    if GWorld.bDebugServer then
      return
    end
    local DSEntity = GWorld:GetDSEntity()
    if DSEntity then
      DSEntity:TriggerCondition(ConditionId)
    end
  end
end

return Component
