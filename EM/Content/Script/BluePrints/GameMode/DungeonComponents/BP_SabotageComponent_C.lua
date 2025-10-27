require("UnLua")
local BP_SabotageComponent_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_SabotageComponent_C:InitSabotageComponent()
  self.GameMode = self:GetOwner()
  self.SabotageMonsterGuide = {}
  self.DeathSabotageMonsterGuide = {}
  self.GuideOrder = {}
  self.RewardLevel = 0
  if not DataMgr.Sabotage[self.GameMode.DungeonId] then
    GameState(self):ShowDungeonError("SabotageComponent:\229\189\147\229\137\141\229\137\175\230\156\172ID\230\178\161\230\156\137\229\161\171\229\134\153\229\156\168\229\175\185\229\186\148\231\154\132\229\137\175\230\156\172\232\161\168\228\184\173, \232\175\187\232\161\168\229\164\177\232\180\165! \232\175\187\229\133\165Id\239\188\154" .. self.GameMode.DungeonId)
    return
  end
  if not self.GameMode.TacMapManager then
    GameState(self):ShowDungeonError("SabotageComponent \229\136\157\229\167\139\229\140\150\229\164\177\232\180\165\239\188\129\230\178\161\230\156\137\233\133\141\231\189\174TacMapManager! DungeonIdId: ", self.GameMode.DungeonId)
    return
  end
  self.SabotagePoints = self.GameMode.TacMapManager:GenerateSabotagePoints()
end

function BP_SabotageComponent_C:InitSabotageBaseInfo()
  self.GameMode.EMGameState:StartGameTime()
  local SabotageData = DataMgr.Sabotage[self.GameMode.DungeonId]
  if not SabotageData then
    GameState(self):ShowDungeonError("SabotageComponent:\229\189\147\229\137\141\229\137\175\230\156\172ID\230\178\161\230\156\137\229\161\171\229\134\153\229\156\168\229\175\185\229\186\148\231\154\132\229\137\175\230\156\172\232\161\168\228\184\173, \232\175\187\232\161\168\229\164\177\232\180\165! \232\175\187\229\133\165Id\239\188\154" .. self.GameMode.DungeonId)
    return
  end
  self:InitSabotageCreators(SabotageData)
  self:InitEmergencyMonster(SabotageData)
  self.IsSabotageTargetActive = false
end

function BP_SabotageComponent_C:InitSabotageCreators(SabotageData)
  local NeedResetLocIds = {}
  local SabotageMon = SabotageData.SabotageMon or {}
  for _, sometable in pairs(SabotageMon) do
    NeedResetLocIds[sometable.SabotageStaticId] = true
  end
  local SabotageArray = TArray(0)
  for _, Data in pairs(self.SabotagePoints) do
    local SabotageCreator = self.GameMode.EMGameState.StaticCreatorMap:Find(Data.Id)
    if SabotageCreator then
      local IsResetLoc = NeedResetLocIds[Data.Id]
      DebugPrint("SabotageComponent \229\135\134\229\164\135\230\191\128\230\180\187 \233\157\153\230\128\129\231\130\185Id:", SabotageCreator.UnitId, " tacmap\228\188\160\230\157\165\231\154\132\228\189\141\231\189\174", Data.Loc, "\230\152\175\229\144\166\233\156\128\232\166\129\231\167\187\229\138\168\228\189\141\231\189\174: ", IsResetLoc)
      if IsResetLoc then
        SabotageCreator:K2_SetActorLocation(Data.Loc, false, nil, false)
      end
      SabotageArray:Add(SabotageCreator.StaticCreatorId)
    else
      GameState(self):ShowDungeonError("SabotageComponent:\230\137\190\228\184\141\229\136\176\229\175\185\229\186\148\231\154\132\233\157\153\230\128\129\231\130\185! Id: " .. Data.Id)
    end
  end
  self.GameMode:TriggerActiveStaticCreator(SabotageArray, "SabotageMonsterGuide")
end

function BP_SabotageComponent_C:InitEmergencyMonster(SabotageData)
  local TreasureMonsterDealy = math.random(SabotageData.TreasureMonsterSpawnDelayMin, SabotageData.TreasureMonsterSpawnDelayMax)
  self:AddTimer(TreasureMonsterDealy, function()
    DebugPrint("SabotageComponent \229\136\183EmergencyMonster")
    self:TryCreateEmergencyMonster("Treasure")
    if self.GameMode:GetNeedCreateEmergencyMonster("Pet") then
      self.GameMode:TriggerSpawnPet()
    end
  end)
end

function BP_SabotageComponent_C:OnStaticCreatorEvent(EventName, Eid, UnitId, UnitType)
  if "SabotageMonsterGuide" == EventName then
    DebugPrint("SabotageComponent SabotageMonsterGuide Eid", Eid, "UnitId", UnitId)
    self.SabotageMonsterGuide[Eid] = UnitId
  end
end

function BP_SabotageComponent_C:ShowSabotageMonsterGuide(DeathEid)
  DebugPrint("SabotageComponent ShowSabotageMonsterGuide", DeathEid)
  self.DeathSabotageMonsterGuide[DeathEid] = DeathEid
  for Eid, UnitId in pairs(self.SabotageMonsterGuide) do
    if not self.DeathSabotageMonsterGuide[Eid] then
      local Monster = Battle(self):GetEntity(Eid)
      if IsValid(Monster) and not Monster:IsDead() and Monster.StopAddGuideTimer then
        Monster:StopAddGuideTimer()
      end
      DebugPrint("\231\160\180\229\157\143\231\142\169\230\179\149\230\183\187\229\138\160\228\186\134\231\178\190\232\139\177\230\128\170\230\140\135\229\188\149\231\130\185\239\188\140\230\128\170\231\137\169Eid: " .. Eid)
      self:OnMonsterGuideAdded(Eid)
      self.GameMode.EMGameState:AddGuideEid(Eid)
    end
  end
end

function BP_SabotageComponent_C:OnMonsterGuideAdded(Eid)
  if self.SabotageMonsterGuide[Eid] == nil then
    return
  end
  if self:IsGuideOrderContains(Eid) then
    return
  end
  DebugPrint("SabotageComponent: OnMonsterGuideAdded Eid", Eid)
  table.insert(self.GuideOrder, Eid)
end

function BP_SabotageComponent_C:IsGuideOrderContains(value)
  for _, v in pairs(self.GuideOrder) do
    if v == value then
      return true
    end
  end
  return false
end

function BP_SabotageComponent_C:ClearSabotageMonsterGuide()
  for i, j in pairs(self.SabotageMonsterGuide) do
    DebugPrint("\231\160\180\229\157\143\231\142\169\230\179\149\229\136\160\233\153\164\228\186\134\231\178\190\232\139\177\230\128\170\230\140\135\229\188\149\231\130\185\239\188\140\230\128\170\231\137\169Eid: " .. i)
    self.GameMode.EMGameState:RemoveGuideEid(i)
    self.GameMode.EMGameState:AddBanGuideEid(i)
    local Monster = Battle(self):GetEntity(i)
    if IsValid(Monster) and Monster.StopAddGuideTimer then
      Monster:StopAddGuideTimer()
    end
  end
end

function BP_SabotageComponent_C:SabotageTargetActive()
  self.GameMode:TriggerGameModeEvent("OnSabotageTargetActive")
  self:ClearSabotageMonsterGuide()
  self.IsSabotageTargetActive = true
  local SabotageCountDownTime = DataMgr.Sabotage[self.GameMode.DungeonId].SabotageCountDownTime or -1
  if -1 == SabotageCountDownTime then
    self.NoCountDown = true
    return
  end
  self.GameMode.EMGameState:SetSabotageCountDownTime(SabotageCountDownTime)
  self.CountDownEnable = true
  self:AddTimer(1, self.CountDown, true, 0, "SabotageCountDownTimer")
end

function BP_SabotageComponent_C:CountDown()
  self:AddCountDownTime(-1)
  if self:GetCountDownTime() <= 0 then
    self.CountDownEnable = false
    self:RemoveTimer("SabotageCountDownTimer")
    self.GameMode:TriggerDungeonFailed()
  end
end

function BP_SabotageComponent_C:TriggerSabotageExitMechanismOverlap()
  if not self.NoCountDown then
    if not self.CountDownEnable then
      return
    end
    self.CountDownEnable = false
    self:RemoveTimer("SabotageCountDownTimer")
  end
  if self.NoCountDown then
    self.RewardLevel = 1
  else
    local DungeonDataReward = DataMgr.Dungeon[self.GameMode.DungeonId].DungeonReward
    local SabotageDataReward = DataMgr.Sabotage[self.GameMode.DungeonId].SabotageRewardRemainTimes
    if not (DungeonDataReward and SabotageDataReward) or #DungeonDataReward < #SabotageDataReward then
      GameState(self):ShowDungeonError("SabotageComponent \231\160\180\229\157\143\231\142\169\230\179\149\229\165\150\229\138\177\229\143\145\230\148\190\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168  Or \229\137\169\228\189\153\230\151\182\233\151\180\230\149\176\231\187\132\233\149\191\229\186\166\229\164\167\228\186\142\229\165\150\229\138\177\232\189\174\230\172\161\230\149\176\231\187\132\233\149\191\229\186\166")
      return
    end
    for k, v in pairs(SabotageDataReward) do
      if v <= self:GetCountDownTime() then
        self.RewardLevel = self.RewardLevel + 1
      end
    end
    if self.RewardLevel == #SabotageDataReward then
      self.GameMode:TriggerDungeonAchieve("TriggerHighestReward", -1)
    end
  end
end

function BP_SabotageComponent_C:AddCountDownTime(Value)
  self.GameMode.EMGameState:SetSabotageCountDownTime(math.max(0, self.GameMode.EMGameState.SabotageCountDownTime + Value))
  if IsStandAlone(self) then
    self.GameMode.EMGameState:OnRep_SabotageCountDownTime()
  end
end

function BP_SabotageComponent_C:GetCountDownTime()
  return self.GameMode.EMGameState.SabotageCountDownTime
end

function BP_SabotageComponent_C:TryCreateEmergencyMonster(MonsterType)
  if self.GameMode:GetNeedCreateEmergencyMonster(MonsterType) == false or self.IsSabotageTargetActive then
    return
  end
  self.GameMode:TryCreateEmergencyMonster(MonsterType)
end

function BP_SabotageComponent_C:InitTreasureMonsterEecapeLoc(TreasureMonster)
  local mechanimArray = self.GameMode.EMGameState.MechanismMap:FindRef("SabotageTarget")
  local monLoc = TreasureMonster.CurrentLocation
  if mechanimArray then
    local targetLoc, targetDis
    for _, mechanism in pairs(mechanimArray.Array:ToTable()) do
      local dis = UKismetMathLibrary.Vector_Distance(monLoc, mechanism:K2_GetActorLocation())
      if not targetDis or targetDis > dis then
        targetLoc = mechanism:K2_GetActorLocation()
        targetDis = dis
      end
    end
    for Eid, UnitId in pairs(self.SabotageMonsterGuide) do
      if not self.DeathSabotageMonsterGuide[Eid] then
        local Monster = Battle(self):GetEntity(Eid)
        if IsValid(Monster) and not Monster:IsDead() then
          local tempLoc = Monster:K2_GetActorLocation()
          local dis = UKismetMathLibrary.Vector_Distance(monLoc, tempLoc)
          if not targetDis or targetDis > dis then
            targetLoc = tempLoc
            targetDis = dis
          end
        end
      end
    end
    if targetLoc then
      TreasureMonster:SetTreasureMonsterTarget(targetLoc)
    end
  end
end

return BP_SabotageComponent_C
