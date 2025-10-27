local M = Class({
  "BluePrints.GameMode.DungeonComponents.BP_SurvivalMiniBaseComponent_C",
  "BluePrints.GameMode.DungeonComponents.BP_DungeonVoteComponent_C"
})

function M:InitSurvivalMiniComponent()
  self:InitSurvivalMiniBaseComponent()
  self:InitVoteComponent()
  self.SurvivalMiniInfo = DataMgr.SurvivalMini[self.GameMode.DungeonId]
  if not self.SurvivalMiniInfo then
    GameState(self):ShowDungeonError("SurvivalMiniComponent:\229\189\147\229\137\141\229\137\175\230\156\172ID\230\178\161\230\156\137\229\161\171\229\134\153\229\156\168\229\175\185\229\186\148\231\154\132\229\137\175\230\156\172\232\161\168\228\184\173, \232\175\187\232\161\168\229\164\177\232\180\165! \232\175\187\229\133\165Id\239\188\154" .. self.GameMode.DungeonId)
    return
  end
  self.MonsterSpawnIds = self.SurvivalMiniInfo.MonsterSpawnId
  self.GameMode:InitCreateEmergencyMonsterProb("Treasure", self, self.SurvivalMiniInfo)
  self.GameMode:InitCreateEmergencyMonsterProb("Butcher", self, self.SurvivalMiniInfo)
end

function M:InitSurvivalMiniBaseInfo()
end

function M:RecordDungeonRoundData()
  local RoundData = {
    DungeonProgress = self.GameMode.EMGameState.DungeonProgress,
    GameModeLevel = self.GameMode:GetGameModeLevel(),
    EnergySupplyCount = self.GameMode.EMGameState.EnergySupplyCount
  }
  PrintTable(RoundData, 3)
  return RoundData
end

function M:RecoverDungeonRoundData(Data)
  PrintTable(Data, 3)
  self.GameMode.EMGameState:SetDungeonProgress(Data.DungeonProgress)
  self.GameMode.EMGameState:SetGameModeLevel(Data.GameModeLevel)
  self.GameMode.EMGameState:AddEnergySupplyCount(Data.EnergySupplyCount)
  self.GameMode.EMGameState:SetDungeonUIState(Const.EDungeonUIState.OnTarget)
end

function M:StartRound()
  M.Super.StartRound(self)
  self.GameMode:CreateEmergencyMonsterEachWave("Treasure", self, self.SurvivalMiniInfo)
  self.GameMode:CreateEmergencyMonsterEachWave("Butcher", self, self.SurvivalMiniInfo)
end

function M:SpawnMonsters()
  local CurRoundIndex = self:GetRoundIndex()
  local LastSpawnIds = self:GetMonsterSpawnIdByRoundIndex(CurRoundIndex - 1)
  self.GameMode:TriggerDestoryMonsterSpawn(LastSpawnIds)
  for _, MonsterSpawnId in pairs(LastSpawnIds) do
    self.GameMode:DeleteMonsterSpawnDropRule(MonsterSpawnId)
  end
  local NewSpawnIds = self:GetMonsterSpawnIdByRoundIndex(CurRoundIndex)
  self.GameMode:TriggerCreateMonsterSpawn(NewSpawnIds)
  self.GameMode:AddMonsterSpawnDropRuleByArray(NewSpawnIds)
end

function M:GetRoundIndex()
  return self.GameMode.EMGameState.DungeonProgress
end

function M:GetWaveIndex()
  return self:GetRoundIndex()
end

function M:GetMonsterSpawnIdByRoundIndex(RoundIndex)
  if RoundIndex < 1 then
    return TArray(0)
  end
  local RealIndex = RoundIndex % #self.MonsterSpawnIds
  if 0 == RealIndex then
    RealIndex = #self.MonsterSpawnIds
  end
  return self:TableToTArray(self.MonsterSpawnIds[RealIndex])
end

return M
