local Component = {}

function Component:OnActorReady(Info)
  if IsAuthority(self) then
    self._RegisterOnCharacterDead = true
    self:RegisterAfterDeadBattleEvent(self, "OnCharacterDead")
  end
end

function Component:OnCharacterDead(Target, ...)
  if not Target then
    return
  end
  if not Target:IsSummonMonster() and Target:IsMonster() then
    self:OutRecover(Target)
  end
end

return Component
