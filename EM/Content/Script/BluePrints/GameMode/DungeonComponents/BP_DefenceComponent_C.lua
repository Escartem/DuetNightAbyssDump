require("UnLua")
local BP_DefenceComponent_C = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.GameMode.DungeonComponents.BP_DungeonVoteComponent_C"
})

function BP_DefenceComponent_C:InitDefenceComponent()
  self.GameMode = self:GetOwner()
  self:InitVoteComponent()
  self.GameMode.EMGameState:SetDefenceWaveInterval(DataMgr.GlobalConstant.DefenceWaveInterval.ConstantValue or 5)
  self.DefenceInfo = self:GetDataMgrInfo()
  if not self.DefenceInfo then
    GameState(self):ShowDungeonError("DefenceComponent:\229\189\147\229\137\141\229\137\175\230\156\172ID\230\178\161\230\156\137\229\161\171\229\134\153\229\156\168\229\175\185\229\186\148\231\154\132\229\137\175\230\156\172\232\161\168\228\184\173, \232\175\187\232\161\168\229\164\177\232\180\165! \232\175\187\229\133\165Id\239\188\154" .. self.GameMode.DungeonId)
    return
  end
  self.MonsterTotalBaseNum = self.DefenceInfo.MonsterTotalBaseNum or 15
  self.MonsterTotalNum = self.MonsterTotalBaseNum
  self.MonsterSpawnIds = self.DefenceInfo.MonsterSpawnId
  self.bMissionSwitched = false
  self.bMonRuleReseted = false
  self.GameMode:InitCreateEmergencyMonsterProb("Butcher", self, self.DefenceInfo)
  local WavesPerStage = self.DefenceInfo.WavesPerStage or 3
  self.GameMode.EMGameState:SetDefenceWavesPerStage(WavesPerStage)
end

function BP_DefenceComponent_C:GetDataMgrInfo()
  return DataMgr.Defence[self.GameMode.DungeonId]
end

function BP_DefenceComponent_C:RecordDungeonRoundData()
  local RoundData = {
    DungeonProgress = self.GameMode.EMGameState.DungeonProgress,
    GameModeLevel = self.GameMode:GetGameModeLevel(),
    DefenceWave = self.GameMode.EMGameState.DefenceWave
  }
  PrintTable(RoundData, 2)
  return RoundData
end

function BP_DefenceComponent_C:RecoverDungeonRoundData(Data)
  PrintTable(Data, 2)
  self.GameMode.EMGameState:SetDungeonProgress(Data.DungeonProgress)
  self.GameMode.EMGameState:SetGameModeLevel(Data.GameModeLevel)
  self.GameMode.EMGameState:SetDefenceWave(Data.DefenceWave)
end

function BP_DefenceComponent_C:WaveStart()
  self.GameMode:CreateEmergencyMonsterEachWave("Butcher", self, self.DefenceInfo)
  self.MonsterTotalNum = self.MonsterTotalBaseNum + math.random(0, 2)
  self.GameMode:TriggerCreateMonsterSpawn(self:GetMonsterSpawnId())
  self.bMonRuleReseted = false
end

function BP_DefenceComponent_C:GetMonsterSpawnId()
  local RealIndex = self:GetWaveIndex() % #self.MonsterSpawnIds
  if 0 == RealIndex then
    RealIndex = #self.MonsterSpawnIds
  end
  return self:TableToTArray(self.MonsterSpawnIds[RealIndex])
end

function BP_DefenceComponent_C:TriggerMonsterDead(Monster)
  if Monster.CreatorType and Monster.CreatorId and Monster:GetCamp() == ECampName.Monster then
    self.MonsterTotalNum = self.MonsterTotalNum - 1
    if self.MonsterTotalNum <= 0 then
      if self:GetMonsterNum() <= 6 and self:GetMonsterNum() > 0 then
        for _, Monster in pairs(self.GameMode.EMGameState.MonsterMap) do
          if IsValid(Monster) and not Monster:IsDead() and "Monster" == Monster.UnitType and self.GameMode:CheckCanGuide(Monster.UnitId, Monster.UnitType) then
            self.GameMode.EMGameState:AddGuideEid(Monster.Eid)
          end
        end
        if not self.bMissionSwitched then
          self.bMissionSwitched = true
          self.GameMode:TriggerGameModeEvent("OnShowRemainMonster")
        end
      elseif 0 == self:GetMonsterNum() then
        self.bMissionSwitched = false
      end
      if not self.bMonRuleReseted then
        self.bMonRuleReseted = true
        self.GameMode:DestroyAllMonsterSpawn()
        self:AddTimer(3.5, function()
          self:AddTimer(2, self.MonsterNumCheck, true, 0, "MonsterNumCheck")
        end, false, 0, "MonRuleReset")
      end
    end
  end
end

function BP_DefenceComponent_C:MonsterNumCheck()
  if 0 == self:GetMonsterNum() and self.MonsterTotalNum <= 0 then
    self.GameMode:PostCustomEvent("DefenceWaveEnd")
    self:RemoveTimer("MonsterNumCheck")
    self.GameMode:TriggerGameModeEvent("OnShowDefenceTarget")
  end
end

function BP_DefenceComponent_C:OnDefenceCoreActive()
  self.GameMode.EMGameState:SetDungeonUIState(Const.EDungeonUIState.OnTarget)
end

function BP_DefenceComponent_C:GetMonsterNum()
  return self.GameMode.EMGameState.MonsterNum
end

function BP_DefenceComponent_C:GetWaveIndex()
  return self.GameMode.EMGameState.DefenceWave
end

function BP_DefenceComponent_C:AddWaveIndex(Value)
  self.GameMode.EMGameState:SetDefenceWave(self.GameMode.EMGameState.DefenceWave + Value)
end

function BP_DefenceComponent_C:SetWaveIndex(Value)
  self.GameMode.EMGameState:SetDefenceWave(Value)
end

function BP_DefenceComponent_C:TableToTArray(table)
  local ResTArray = TArray(0)
  if table then
    for _, Item in ipairs(table) do
      ResTArray:Add(Item)
    end
  end
  return ResTArray
end

return BP_DefenceComponent_C
