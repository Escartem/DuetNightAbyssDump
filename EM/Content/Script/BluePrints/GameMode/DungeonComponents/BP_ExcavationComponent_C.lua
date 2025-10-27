require("UnLua")
local BP_ExcavationComponent_C = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.GameMode.DungeonComponents.BP_DungeonVoteComponent_C"
})

function BP_ExcavationComponent_C:InitExcavationComponent()
  self.GameMode = self:GetOwner()
  self:InitVoteComponent()
  self.ExcavationData = DataMgr.Excavation[self.GameMode.DungeonId]
  if not self.ExcavationData then
    GameState(self):ShowDungeonError("ExcavationComponent:\229\189\147\229\137\141\229\137\175\230\156\172ID\230\178\161\230\156\137\229\161\171\229\134\153\229\156\168\229\175\185\229\186\148\231\154\132\229\137\175\230\156\172\232\161\168\228\184\173, \232\175\187\232\161\168\229\164\177\232\180\165! \232\175\187\229\133\165Id\239\188\154" .. self.GameMode.DungeonId)
    return
  end
  self.GameMode.EMGameState:SetExcavationItemId(self.ExcavationData.ExcavationItemId)
  self.ExcavMaxNum = DataMgr.GlobalConstant.ExcavMaxNum.ConstantValue
  self.NowExcavNum = 0
  self.ATurnExcavMaxNum = 3
  self.ThisTurnExcavNum = 0
  self.FinishedExcavNum = 0
  self.TurnDeadExcavNum = 0
  self.IsFirstExcavation = true
  self.IsFirstRoundEnd = true
  self.GameMode:InitCreateEmergencyMonsterProb("Treasure", self, self.ExcavationData)
  self.GameMode:InitCreateEmergencyMonsterProb("Butcher", self, self.ExcavationData)
  self.RoundInterval = self.ExcavationData.RoundInterval or 0
  self.BatteryFullEventCD = self.ExcavationData.BatteryFullEventCD or 0
  self.bCanTriggerBatteryFull = true
  self.GuideOrder = {}
end

function BP_ExcavationComponent_C:InitExcavationBaseInfo()
end

function BP_ExcavationComponent_C:RecordDungeonRoundData()
  local RoundData = {
    DungeonProgress = self.GameMode.EMGameState.DungeonProgress,
    GameModeLevel = self.GameMode:GetGameModeLevel(),
    IsFirstExcavation = self.IsFirstExcavation,
    IsFirstRoundEnd = self.IsFirstRoundEnd,
    GuideOrder = self.GuideOrder
  }
  PrintTable(RoundData, 3)
  return RoundData
end

function BP_ExcavationComponent_C:RecoverDungeonRoundData(Data)
  PrintTable(Data, 3)
  self.GameMode.EMGameState:SetDungeonProgress(Data.DungeonProgress)
  self.GameMode.EMGameState:SetGameModeLevel(Data.GameModeLevel)
  self.IsFirstExcavation = Data.IsFirstExcavation
  self.IsFirstRoundEnd = Data.IsFirstRoundEnd
  self.GuideOrder = Data.GuideOrder
end

function BP_ExcavationComponent_C:TriggerPrepareActiveExcavation()
  DebugPrint("BP_ExcavationComponent_C  ThisTurnExcavNum =", self.ThisTurnExcavNum, ", FinishedExcavNum =", self.FinishedExcavNum, ", TurnDeadExcavNum =", self.TurnDeadExcavNum)
  if 2 == self.GameMode.EMGameState.DungeonProgress and self.GameMode:GetNeedCreateEmergencyMonster("Pet") then
    self.GameMode:TriggerSpawnPet()
  end
  if self.NowExcavNum >= self.ExcavMaxNum or self.ThisTurnExcavNum >= self.ATurnExcavMaxNum then
    DebugPrint("BP_ExcavationComponent_C \230\140\150\230\142\152\230\156\186\230\149\176\233\135\143\229\183\178\232\190\190\230\156\128\229\164\167")
    return
  end
  local Info = TArray(0)
  if self.IsFirstExcavation then
    self.IsFirstExcavation = false
    Info:Add(self.ExcavationData.FirstRandomId)
  else
    self.GameMode:TriggerGameModeEvent("OnExcavationDiscovered")
    Info:Add(self.ExcavationData.ExcavationRandomId)
  end
  self.GameMode:TriggerActiveRandomCreator(Info)
  self.NowExcavNum = self.NowExcavNum + 1
  self.ThisTurnExcavNum = self.ThisTurnExcavNum + 1
end

function BP_ExcavationComponent_C:TriggerRealCreateExcavation(TriggerBox)
  if TriggerBox.RandomRuleId == self.ExcavationData.FirstRandomId then
    self.GameMode.EMGameState:StartGameTime()
  end
  local ExcavationMechData = self:GetExcavationMechData()
  local Creator = self.GameMode.RandomActorManager.Templates:Find(TriggerBox.RandomRuleId).Template
  local Context = AEventMgr.CreateUnitContext()
  Context.UnitType = "Mechanism"
  Context.UnitId = ExcavationMechData.ExcavationMechId
  Context.Loc = TriggerBox:K2_GetActorLocation()
  Context.IntParams:Add("Level", Creator.Level + self.GameMode:GetFixedGamemodeLevel())
  Context.IntParams:Add("MonsterSpawnId", ExcavationMechData.MonsterSpawnId)
  Context.IntParams:Add("RandomCreatorId", TriggerBox.RandomCreatorId)
  Context:AddObjectParams("RandomCreator", Creator)
  self.GameMode.EMGameState.EventMgr:CreateUnitNew(Context, false)
end

function BP_ExcavationComponent_C:RegisterGuideOrder(Eid)
  local Index = self:GetIndexByEid(Eid)
  if 0 ~= Index then
    return Index
  end
  DebugPrint("ExcavationComponent: RegisterGuideOrder Eid", Eid)
  table.insert(self.GuideOrder, Eid)
  return #self.GuideOrder
end

function BP_ExcavationComponent_C:GetIndexByEid(Eid)
  for index, _Eid in pairs(self.GuideOrder) do
    if _Eid == Eid then
      return index
    end
  end
  return 0
end

function BP_ExcavationComponent_C:TriggerClearExcavNum()
  DebugPrint("BP_ExcavationComponent_C  \230\140\150\230\142\152\231\142\169\230\179\149\229\188\128\229\167\139\230\150\176\231\154\132\232\189\174\230\172\161")
  self.ThisTurnExcavNum = 0
  self.FinishedExcavNum = 0
  self.TurnDeadExcavNum = 0
end

function BP_ExcavationComponent_C:JudgeNextTurn()
  if self.FinishedExcavNum + self.TurnDeadExcavNum >= self.ATurnExcavMaxNum then
    if self.FinishedExcavNum > 0 then
      self:AddTimer(self.RoundInterval, self.OnEachRoundEnd)
    else
      self.GameMode:TriggerDungeonFailed()
    end
  end
end

function BP_ExcavationComponent_C:OnEachRoundEnd()
  if self.GameMode.EMGameState:CheckGameModeStateEnable() then
    if self.IsFirstRoundEnd then
      self.IsFirstRoundEnd = false
    end
    self.GameMode:TriggerActiveGameModeState(Const.StatePause)
  end
end

function BP_ExcavationComponent_C:UpdateExcavationItemNum(Num)
  if Num <= 0 then
    return
  end
  local LastExcavationItemNum = self:GetExcavationItemNum()
  self:SetExcavationItemNum(self:GetExcavationItemNum() + Num)
end

function BP_ExcavationComponent_C:GetExcavationItemNum()
  return self.GameMode.EMGameState.ExcavationItemNum
end

function BP_ExcavationComponent_C:SetExcavationItemNum(Num)
  self.GameMode.EMGameState:SetExcavationItemNum(Num)
end

function BP_ExcavationComponent_C:UpdateNowExcavNum(Num)
  self.NowExcavNum = self.NowExcavNum + Num
end

function BP_ExcavationComponent_C:UpdateFinishedExcavNum(Num)
  self.FinishedExcavNum = self.FinishedExcavNum + Num
  if not self.ExcavationData.TreasureMonsterSpawnProbability or #self.ExcavationData.TreasureMonsterSpawnProbability < 2 then
    GameState(self):ShowDungeonError("\230\140\150\230\142\152\230\156\172\233\133\141\231\189\174\232\161\168\228\184\173\231\154\132\229\174\157\231\137\169\230\128\170\231\137\169\229\175\185\229\186\148\231\154\132\229\136\183\230\150\176\230\166\130\231\142\135\230\149\176\230\141\174\228\184\141\229\133\168")
    return
  else
    self.CurrentTreasureMonsterProb = self.CurrentTreasureMonsterProb + self.ExcavationData.TreasureMonsterSpawnProbability[2]
  end
  if not self.ExcavationData.ButcherMonsterSpawnProbability or #self.ExcavationData.ButcherMonsterSpawnProbability < 2 then
    GameState(self):ShowDungeonError("\230\140\150\230\142\152\230\156\172\233\133\141\231\189\174\232\161\168\228\184\173\231\154\132\229\177\160\229\164\171\230\128\170\231\137\169\229\175\185\229\186\148\231\154\132\229\136\183\230\150\176\230\166\130\231\142\135\230\149\176\230\141\174\228\184\141\229\133\168")
    return
  else
    self.CurrentButcherMonsterProb = self.CurrentButcherMonsterProb + self.ExcavationData.ButcherMonsterSpawnProbability[2]
    print(_G.LogTag, " [THY]  CurrentButcherMonsterProb: ", self.CurrentButcherMonsterProb)
  end
  self:CheckCreateSpecialMonster("Treasure")
  self:CheckCreateSpecialMonster("Butcher")
end

function BP_ExcavationComponent_C:UpdateTurnDeadExcavNum(Num)
  self.TurnDeadExcavNum = self.TurnDeadExcavNum + Num
end

function BP_ExcavationComponent_C:GetFinishedExcavNum(Num)
  return self.FinishedExcavNum
end

function BP_ExcavationComponent_C:GetThisTurnExcavNum(Num)
  return self.ThisTurnExcavNum
end

function BP_ExcavationComponent_C:GetATurnExcavMaxNum(Num)
  return self.ATurnExcavMaxNum
end

function BP_ExcavationComponent_C:GetTurnDeadExcavNum(Num)
  return self.TurnDeadExcavNum
end

function BP_ExcavationComponent_C:BatteryFull()
  if self.bCanTriggerBatteryFull and self:IsNotFullExcavationExist() then
    self.bCanTriggerBatteryFull = false
    self:AddTimer(self.BatteryFullEventCD, function()
      self.bCanTriggerBatteryFull = true
    end)
    self.GameMode:TriggerGameModeEvent("OnBatteryFull")
  end
end

function BP_ExcavationComponent_C:IsNotFullExcavationExist()
  for Eid, Excavation in pairs(self.GameMode.EMGameState.DefBaseMap) do
    if IsValid(Excavation) and (Excavation.BatteryNum == nil or nil == Excavation.MaxEnergy or nil == Excavation.BatteryEnergy) then
      print(_G.LogTag, "LXZ IsNotFullExcavationExist", Excavation:GetName(), Excavation.BatteryNum, Excavation.MaxEnergy, Excavation.BatteryEnergy)
      PrintTable(Excavation, 10)
    end
    if IsValid(Excavation) and Excavation.BatteryNum < Excavation.MaxEnergy / Excavation.BatteryEnergy then
      return true
    end
  end
  return false
end

function BP_ExcavationComponent_C:GetBatteryMonsterUnitId()
  local Length = #self.ExcavationData.BatteryMonsterId
  local Index = math.random(1, Length)
  return self.ExcavationData.BatteryMonsterId[Index]
end

function BP_ExcavationComponent_C:GetExcavationMechData()
  local RandomValue = math.random(1, 10)
  local RandomCount = 0
  for i, ExcavationData in pairs(self.ExcavationData.Excavation) do
    RandomCount = RandomCount + ExcavationData.Weight
    if RandomValue <= RandomCount then
      return ExcavationData
    end
  end
  return self.ExcavationData.Excavation[1]
end

function BP_ExcavationComponent_C:CheckCreateSpecialMonster(MonsterType)
  DebugPrint("BP_ExcavationComponent_C CheckCreateSpecialMonster", MonsterType)
  if self[MonsterType .. "MonsterTimer"] ~= nil then
    return
  end
  if math.random() > self["Current" .. MonsterType .. "MonsterProb"] then
    return
  end
  if self.GameMode:GetNeedCreateEmergencyMonster(MonsterType) == false then
    return
  end
  self[MonsterType .. "MonsterTimer"] = self:AddTimer(self.GameMode:GetCreateEmergencyMonsterInterval(MonsterType), function()
    self:TryCreateEmergencyMonster(MonsterType)
  end, true)
end

function BP_ExcavationComponent_C:TryCreateEmergencyMonster(MonsterType)
  if self.GameMode:GetNeedCreateEmergencyMonster(MonsterType) == false then
    self:RemoveTimer(self[MonsterType .. "MonsterTimer"])
    return
  end
  if self.GameMode.EMGameState.DefBaseMap:Num() > 0 or self.FinishedExcavNum < 1 then
    return
  end
  self.GameMode:TryCreateEmergencyMonster(MonsterType)
  self:RemoveTimer(self[MonsterType .. "MonsterTimer"])
end

function BP_ExcavationComponent_C:InitTreasureMonsterEecapeLoc(TreasureMonster)
  local mechanimArray = self.GameMode.EMGameState.MechanismMap:FindRef("AOITriggerBox")
  local monLoc = TreasureMonster.CurrentLocation
  if mechanimArray then
    local targetLoc, targetDis
    for _, mechanism in pairs(mechanimArray.Array:ToTable()) do
      if mechanism.UnitId == 49004 then
        local tempLoc = mechanism:K2_GetActorLocation()
        local dis = UKismetMathLibrary.Vector_Distance(monLoc, tempLoc)
        if not targetDis or targetDis > dis then
          targetLoc = tempLoc
          targetDis = dis
        end
      end
    end
    if targetLoc then
      TreasureMonster:SetTreasureMonsterTarget(targetLoc)
    end
  end
end

function BP_ExcavationComponent_C:GetPickupUnitPreloadTable()
  local PreloadID = {2005, 2006}
  local BPPath = {}
  for _, id in pairs(PreloadID) do
    table.insert(BPPath, {
      DataMgr.Drop[id].UnitBPPath,
      10
    })
  end
  return BPPath
end

return BP_ExcavationComponent_C
