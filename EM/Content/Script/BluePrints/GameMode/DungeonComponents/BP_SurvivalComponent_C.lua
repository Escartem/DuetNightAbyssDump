require("UnLua")
local BP_SurvivalComponent_C = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.GameMode.DungeonComponents.BP_DungeonVoteComponent_C"
})

function BP_SurvivalComponent_C:InitSurvivalComponent()
  self.GameMode = self:GetOwner()
  self.GameState = self.GameMode.EMGameState
  self:InitVoteComponent()
  self.SurvivalVitaminStop = false
  self.MinExtraFixVitamin = DataMgr.GlobalConstant.MinExtraFixVitamin.ConstantValue
  self.MaxSurvivalValue = DataMgr.GlobalConstant.SurvivalValue.ConstantValue
  self.SurvivalInfo = DataMgr.Survival[self.GameMode.DungeonId]
  if not self.SurvivalInfo then
    GameState(self):ShowDungeonError("SurvivalComponent:\229\189\147\229\137\141\229\137\175\230\156\172ID\230\178\161\230\156\137\229\161\171\229\134\153\229\156\168\229\175\185\229\186\148\231\154\132\229\137\175\230\156\172\232\161\168\228\184\173, \232\175\187\232\161\168\229\164\177\232\180\165! \232\175\187\229\133\165Id\239\188\154" .. self.GameMode.DungeonId)
    return
  end
  self.WaveTime = self.SurvivalInfo.WaveTime
  self.MonsterSpawnIds = self.SurvivalInfo.MonsterSpawnId
  self.WaveIndex = 0
  self.bIsSVLowTalkPlayed = false
  self.isStart = false
  self.GameMode:InitCreateEmergencyMonsterProb("Treasure", self, self.SurvivalInfo)
  self.GameMode:InitCreateEmergencyMonsterProb("Butcher", self, self.SurvivalInfo)
end

function BP_SurvivalComponent_C:InitSurvivalBaseInfo()
end

function BP_SurvivalComponent_C:RecordDungeonRoundData()
  local RoundData = {
    DungeonProgress = self.GameMode.EMGameState.DungeonProgress,
    GameModeLevel = self.GameMode:GetGameModeLevel(),
    SurvivalValue = self.GameMode.EMGameState.SurvivalValue,
    SurvivalTime = self.GameMode.EMGameState.CumulativeSurvivalTime,
    WaveIndex = self.WaveIndex
  }
  PrintTable(RoundData, 3)
  return RoundData
end

function BP_SurvivalComponent_C:RecoverDungeonRoundData(Data)
  PrintTable(Data, 3)
  self.GameMode.EMGameState:SetDungeonProgress(Data.DungeonProgress)
  self.GameMode.EMGameState:SetGameModeLevel(Data.GameModeLevel)
  self.TmpSurvivalValue = Data.SurvivalValue
  self.TmpSurvivalTime = Data.SurvivalTime
  self.WaveIndex = Data.WaveIndex
end

function BP_SurvivalComponent_C:InitSurvival()
  self.GameMode.EMGameState:SetSurvivalValue(self.TmpSurvivalValue or DataMgr.GlobalConstant.SurvivalValue.ConstantValue)
  self.isStart = true
  if self.TmpSurvivalValue and GWorld:IsStandAlone() then
    self.GameMode.EMGameState:OnRep_SurvivalValue()
  end
end

function BP_SurvivalComponent_C:StopSurvivalVitamin()
  self.SurvivalVitaminStop = true
end

function BP_SurvivalComponent_C:IsStopSurvivalVitamin()
  return self.SurvivalVitaminStop
end

function BP_SurvivalComponent_C:RecoverSurvivalVitamin()
  self.SurvivalVitaminStop = false
end

function BP_SurvivalComponent_C:TriggerActiveVitamin()
  if self:IsStopSurvivalVitamin() then
    self:RecoverSurvivalVitamin()
  else
    self:InitSurvival()
    self:StartCostSurvivalValue()
  end
end

function BP_SurvivalComponent_C:CheckSurvivalCriticalValue()
  if self:GetSurvivalValue_Component() <= self.MinExtraFixVitamin and not self.GameState.IsMinExtraFixVitamin then
    self.GameMode:TriggerGameModeEvent("OnSurvivalCriticalValue")
    self.GameState.IsMinExtraFixVitamin = true
  end
end

function BP_SurvivalComponent_C:StartCostSurvivalValue()
  local time = DataMgr.GlobalConstant.SurvivalCostRate.ConstantValue
  
  local function AutoCostSurvivalValue(self)
    if not self.GameMode.EMGameState:CheckGameModeStateEnable() then
      self:RemoveTimer("AutoCostSurvivalValue")
      return
    end
    self:AddSurvivalValue(-1)
  end
  
  self:AddTimer(time, AutoCostSurvivalValue, true, 0, "AutoCostSurvivalValue")
end

function BP_SurvivalComponent_C:AddSurvivalValue(ChangeValue)
  if not self.isStart then
    return
  end
  if self:IsStopSurvivalVitamin() then
    return
  end
  self:ChangeSurvivalValue(ChangeValue)
  self:CheckSurvivalFinish()
  self:CheckSurvivalCriticalValue()
  if not self.bIsSVLowTalkPlayed and self:GetSurvivalValue_Component() <= 30 then
    self.GameMode:TriggerGameModeEvent("OnSurvivalValueLow")
    self.bIsSVLowTalkPlayed = true
  end
end

function BP_SurvivalComponent_C:ChangeSurvivalValue(ChangeValue)
  local function SetIsMinExtraFixVitamin()
    if self.GameState.SurvivalValue > self.MinExtraFixVitamin then
      self.GameState.IsMinExtraFixVitamin = false
    end
  end
  
  self.GameState:SetSurvivalValue(math.max(math.min(self.GameState.SurvivalValue + ChangeValue, self.MaxSurvivalValue), 0))
  SetIsMinExtraFixVitamin()
  DebugPrint("SurvivalComponent: ChangeSurvivalValue", ChangeValue, "\229\189\147\229\137\141\231\148\159\229\173\152\229\128\188:", self.GameState.SurvivalValue)
  if GWorld:IsStandAlone() then
    self.GameState:OnRep_SurvivalValue()
  end
end

function BP_SurvivalComponent_C:GetSurvivalValue_Component()
  return self.GameState:GetSurvivalValue()
end

function BP_SurvivalComponent_C:CheckSurvivalFinish()
  if 0 == self:GetSurvivalValue_Component() then
    self:RemoveTimer("AutoCostSurvivalValue")
    DebugPrint("SurvivalComponent: SurvivalValueFinished")
    self.GameMode:AddDungeonEvent("SurvivalValueFinished")
    self.GameMode:TriggerGameModeEvent("OnVitaminFinished")
    local GameState = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(self)
  end
end

function BP_SurvivalComponent_C:TriggerActiveSurvivalTime()
  self.GameState:SetCumulativeSurvivalTime(self.TmpSurvivalTime or 0)
  if not self:IsExistTimer("TimeTotalTick") then
    self:AddTimer(1.0, self.SurvivalTiming, true, 0, "TimeTotalTick")
  end
  self.GameMode:SetClientDungeonUIState(Const.EDungeonUIState.OnTarget)
end

function BP_SurvivalComponent_C:SurvivalTiming()
  self.GameState:SetCumulativeSurvivalTime(self.GameState.CumulativeSurvivalTime + 1)
  if GWorld:IsStandAlone() then
    self.GameState:OnRep_CumulativeSurvivalTime()
  end
end

function BP_SurvivalComponent_C:TriggerStopVitamin()
  self:StopSurvivalVitamin()
end

function BP_SurvivalComponent_C:TriggerSurvivalWin()
  self:TriggerStopSurvivalTime()
end

function BP_SurvivalComponent_C:TriggerStopSurvivalTime()
  if self:IsExistTimer("TimeTotalTick") then
    self:RemoveTimer("TimeTotalTick")
  end
end

function BP_SurvivalComponent_C:TriggerActiveSurvivalTimeAndVitamin()
  self:TriggerActiveVitamin()
  self:TriggerActiveSurvivalTime()
end

function BP_SurvivalComponent_C:MonsterWaveStart()
  if self.WaveIndex > 0 then
    self.GameMode:TriggerDestoryMonsterSpawn(self:GetMonsterSpawnId())
  end
  self.WaveIndex = self.WaveIndex + 1
  self.GameMode:TriggerCreateMonsterSpawn(self:GetMonsterSpawnId())
  if 3 == self.WaveIndex and self.GameMode:GetNeedCreateEmergencyMonster("Pet") then
    self.GameMode:TriggerSpawnPet()
  end
  DebugPrint("SurvivalComponent: MonsterWaveStart", self.WaveIndex)
  self:AddTimer(self.WaveTime, self.MonsterWaveEnd, false, 0, "MonsterWaveEnd")
  self.GameMode:CreateEmergencyMonsterEachWave("Treasure", self, self.SurvivalInfo)
  self.GameMode:CreateEmergencyMonsterEachWave("Butcher", self, self.SurvivalInfo)
end

function BP_SurvivalComponent_C:MonsterWaveEnd()
  if not self.GameMode.EMGameState:CheckGameModeStateEnable() then
    return
  end
  DebugPrint("SurvivalComponent: MonsterWaveEnd", self.WaveIndex)
  if 0 == self.WaveIndex % 2 then
    if 2 == self.WaveIndex then
      self.GameMode:TriggerGameModeEvent("OnFirstRoundEnd")
    end
    self.GameMode:TriggerGameModeEvent("OnEachRoundEnd")
  else
    self:MonsterWaveStart()
  end
end

function BP_SurvivalComponent_C:GetMonsterSpawnId()
  local RealIndex = self.WaveIndex % #self.MonsterSpawnIds
  if 0 == RealIndex then
    RealIndex = #self.MonsterSpawnIds
  end
  return self:TableToTArray(self.MonsterSpawnIds[RealIndex])
end

function BP_SurvivalComponent_C:TableToTArray(table)
  local ResTArray = TArray(0)
  if table then
    for _, Item in ipairs(table) do
      ResTArray:Add(Item)
    end
  end
  return ResTArray
end

function BP_SurvivalComponent_C:InitTreasureMonsterEecapeLoc(TreasureMonster)
  local mechanimArray = self.GameMode.EMGameState.MechanismMap:FindRef("Supply")
  local monLoc = TreasureMonster.CurrentLocation
  if mechanimArray then
    local targetLoc, targetDis
    for _, supply in pairs(mechanimArray.Array:ToTable()) do
      local tempLoc = supply:K2_GetActorLocation()
      local dis = UKismetMathLibrary.Vector_Distance(monLoc, tempLoc)
      if not targetDis or targetDis > dis then
        targetLoc = tempLoc
        targetDis = dis
      end
    end
    if targetLoc then
      TreasureMonster:SetTreasureMonsterTarget(targetLoc)
    end
  end
end

function BP_SurvivalComponent_C:GetWaveIndex()
  return self.WaveIndex
end

function BP_SurvivalComponent_C:GetPickupUnitPreloadTable()
  local PreloadID = {2001}
  local BPPath = {}
  for _, id in pairs(PreloadID) do
    table.insert(BPPath, {
      DataMgr.Drop[id].UnitBPPath,
      10
    })
  end
  return BPPath
end

return BP_SurvivalComponent_C
