local BP_ClassCacheSubsystem_C = Class()
BP_ClassCacheSubsystem_C.MaxNumInfo = {
  ABP = 10,
  Buff = 30,
  Passive = 30,
  PassiveClient = 10,
  Weapon = 15,
  ClientSkill = 5
}

function BP_ClassCacheSubsystem_C:GetMaxNum(Tag)
  return BP_ClassCacheSubsystem_C.MaxNumInfo[Tag] or 0
end

return BP_ClassCacheSubsystem_C
