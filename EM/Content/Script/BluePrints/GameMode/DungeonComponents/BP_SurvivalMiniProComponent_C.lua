local M = Class({
  "BluePrints.GameMode.DungeonComponents.BP_SurvivalMiniBaseComponent_C"
})

function M:InitSurvivalMiniProComponent()
  self:InitSurvivalMiniBaseComponent()
  local SurvivalMiniProInfo = DataMgr.SurvivalMiniPro[self.GameMode.DungeonId]
  if not SurvivalMiniProInfo then
    GameState(self):ShowDungeonError("SurvivalMiniProComponent:\229\189\147\229\137\141\229\137\175\230\156\172ID\230\178\161\230\156\137\229\161\171\229\134\153\229\156\168\229\175\185\229\186\148\231\154\132\229\137\175\230\156\172\232\161\168\228\184\173, \232\175\187\232\161\168\229\164\177\232\180\165! \232\175\187\229\133\165Id\239\188\154" .. self.GameMode.DungeonId)
    return
  end
  self.MonsterSpawnId = SurvivalMiniProInfo.MonsterSpawnId or {}
  self.SpMonsterSpawnId = SurvivalMiniProInfo.SpMonsterSpawnId or {}
  self.SpMonsterSpawnTime = SurvivalMiniProInfo.SpMonsterSpawnTime or 20
end

function M:InitSurvivalMiniProBaseInfo()
end

function M:StartRound()
  M.Super.StartRound(self)
  local Interval = DataMgr.GlobalConstant.SurvivalCostRate.ConstantValue
  
  local function AutoCostSurvivalValue()
    if not self.GameMode.EMGameState:CheckGameModeStateEnable() then
      self:RemoveTimer("AutoCostSurvivalValue")
      return
    end
    self:AddSurvivalMiniValue(-1)
  end
  
  self:AddTimer(Interval, AutoCostSurvivalValue, true, 0, "AutoCostSurvivalValue")
end

function M:SpawnMonsters()
  self.GameMode:TriggerCreateMonsterSpawn(self:TableToTArray(self.MonsterSpawnId))
  self:AddTimer(self.SpMonsterSpawnTime - 2, self.SpawnSpMonstersAlarm)
  self:AddTimer(self.SpMonsterSpawnTime, self.SpawnSpMonsters)
end

function M:SpawnSpMonstersAlarm()
  if not self.IsRoundBegin then
    return
  end
  self.GameMode:NotifyClientShowDungeonToast("", 2, EToastType.SabotageAlarm)
end

function M:SpawnSpMonsters()
  if not self.IsRoundBegin then
    return
  end
  self.GameMode:TriggerCreateMonsterSpawn(self:TableToTArray(self.SpMonsterSpawnId))
  self.GameMode:TriggerGameModeEvent("Event_OnSpawnSpMonsters")
end

return M
