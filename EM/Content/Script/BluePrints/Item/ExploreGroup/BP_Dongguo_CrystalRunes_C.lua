require("UnLua")
local M = Class({
  "BluePrints/Item/ExploreGroup/BP_DongGuoBreakableItem_C"
})

function M:OnEnergyZero()
  self.Overridden.OnEnergyZero(self)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local PlayerLoc = Player:K2_GetActorLocation()
  self.bCanMove = true
  self:SetMovementTarget(5, true, PlayerLoc)
end

function M:OnDead(KillMineRoleEid, KillMineSkillId, DeathReason)
  M.Super.OnDead(self, KillMineRoleEid, KillMineSkillId, DeathReason)
  self:EMActorDestroy(EDestroyReason.MechanismDead)
end

function M:MoveTargetEnd()
  if not self.bCanMove then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    local ExtraInfo = {
      UniqueSign = self.Eid,
      SourceEid = Player.Eid
    }
    GameMode:TriggerRewardEvent(self.UnitId, CommonConst.RewardReason.Chest, self:GetTransform(), ExtraInfo)
  end
  self.Overridden.MoveTargetEnd(self)
  self.bCanMove = false
end

return M
