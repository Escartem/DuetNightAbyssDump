local Component = {}

function Component:TriggerTarget(targets)
  if type(targets) ~= "table" then
    return
  end
  
  local function callback(ret)
    PrintTable({TriggerTarget = 1, ret = ret})
  end
  
  self:CallServer("TriggerTarget", callback, targets)
end

function Component:GetTargetCount(id)
  local target = self.AchvTargets[id]
  if target then
    return target.Count
  end
end

function Component:GetTargetCurrentValue(id)
  local target = self.AchvTargets[id]
  if target then
    return target.CurrentValue
  end
end

function Component:CombatItemTargetFinish(TargetType, UniqueAttr, Count, ...)
  local TargetIds = DataMgr.TargetType2TargetId[TargetType]
  if not TargetIds then
    return
  end
  local Params = {
    ...
  }
  local temp = false
  for _, TargetId in ipairs(TargetIds) do
    local info = DataMgr.Target[TargetId]
    if info and CommonUtils.HasValue(info.TargetParam[1], tostring(Params[1])) then
      temp = true
      break
    end
  end
  if temp then
    table.insert(Params, 0)
    self:ServerTargetFinish(TargetType, UniqueAttr, Count, table.unpack(Params))
    Params[#Params] = 1
    self:ServerTargetFinish(TargetType, UniqueAttr, Count, table.unpack(Params))
  end
end

function Component:ServerTargetFinish(TargetType, UniqueAttr, Count, ...)
  self.logger.debug("ServerTargetFinish", TargetType, UniqueAttr, Count, ...)
  self:CallServerMethod("ServerTargetFinish", TargetType, UniqueAttr, Count, {
    ...
  })
end

function Component:ConditionComplete(ConditionId)
  print(_G.LogTag, "ConditionComplete", ConditionId)
  
  local function cb(ret)
    if ret then
      EventManager:FireEvent(EventID.ConditionComplete, ConditionId)
    end
  end
  
  ConditionUtils.ServerCheckCondition(self, ConditionId, cb)
end

return Component
