require("UnLua")
local M = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function M:OnBreakCountDown(SourceEid)
  if not self:CheckTag() then
    return
  end
  M.Super.OnBreakCountDown(self, SourceEid)
  self:ChangeState("Hit", SourceEid)
end

function M:AuthorityInitInfo(Info)
  M.Super.AuthorityInitInfo(self, Info)
  self.Trigger.OnComponentBeginOverlap:Add(self, self.CollisionBeginOverlap)
  self.Trigger.OnComponentEndOverlap:Add(self, self.CollisionEndOverlap)
end

function M:CollisionBeginOverlap(Component, OtherActor)
  if not OtherActor.IsPlayer or not OtherActor:IsPlayer() then
    return
  end
  if not self:CheckTag() then
    return
  end
  self:ChangeState("TriggerBox")
end

function M:CollisionEndOverlap(Component, OtherActor)
  if not OtherActor.IsPlayer or not OtherActor:IsPlayer() then
    return
  end
  if not self:CheckTag() then
    return
  end
  self:ChangeState("TriggerBox")
end

function M:CheckTag()
  if not self.bCheckTag then
    return true
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local Res = self:CheckPlayerLevelTag(Player)
  return Res
end

return M
