require("UnLua")
local M = Class({
  "BluePrints/Item/DefenceCore/BP_DefenceBase_C"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.KeyBuffId = self.UnitParams.KeyBuffId
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  self.NeedKeyNum = DataMgr.Synthesis[GameState.DungeonId].KeyNeedNum or 1
end

function M:ActiveOnServer()
  M.Super.ActiveOnServer(self)
  if IsAuthority(self) then
    self:StartFindPlayer()
  end
end

function M:DeActive()
  M.Super.DeActive(self)
  self:StopFindPlayer()
end

function M:StartFindPlayer()
  self:AddTimer(0.1, self.FindPlayer, true, 0, "WeeklyChestTarget")
end

function M:TryFindPlayer()
  self:FindPlayer()
end

function M:StopFindPlayer()
  self:RemoveTimer("WeeklyChestTarget")
end

function M:OnKeyDelivered_Server(KeyNum)
  self.Overridden.OnKeyDelivered_Server(self, KeyNum)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:TriggerDungeonComponentFun("OnKeyDelivered", self)
  end
end

function M:OnDead(KillMineRoleEid, KillMineSkillId, DeathReason)
  M.Super.OnDead(self, KillMineRoleEid, KillMineSkillId, DeathReason)
end

return M
