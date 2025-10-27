local Component = {}

function Component:TriggerTarget(targets, AvatarEid)
  if type(targets) ~= "table" then
    return
  end
  if AvatarEid then
    self:SendAvatar(AvatarEid, "ServerTriggerTarget", targets)
  else
    self:ServerMulticast("ServerTriggerTarget", targets)
  end
end

function Component:CombatItemTargetFinish(AvatarEid, TargetType, UniqueAttr, Count, ...)
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
    self:ServerTargetFinish(AvatarEid, TargetType, UniqueAttr, Count, ...)
  end
end

function Component:ServerTargetFinish(AvatarEid, TargetType, UniqueAttr, Count, ...)
  self.logger.debug("ServerTargetFinish", TargetType, UniqueAttr, Count, ...)
  local args = {
    ...
  }
  table.insert(args, 0)
  self:ServerMulticast("ServerTargetFinish", TargetType, UniqueAttr, Count, args)
  args[#args] = 1
  self:SendAvatar(AvatarEid, "ServerTargetFinish", TargetType, UniqueAttr, Count, args)
end

return Component
