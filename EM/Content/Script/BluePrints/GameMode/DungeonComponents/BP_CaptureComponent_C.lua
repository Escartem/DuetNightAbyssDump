require("UnLua")
local BP_CaptureComponent_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_CaptureComponent_C:InitCaptureComponent()
  self.GameMode = self:GetOwner()
  local CaptureData = DataMgr.Capture[self.GameMode.DungeonId]
  if not CaptureData then
    GameState(self):ShowDungeonError("CaptureComponent:\229\189\147\229\137\141\229\137\175\230\156\172ID\230\178\161\230\156\137\229\161\171\229\134\153\229\156\168\229\175\185\229\186\148\231\154\132\229\137\175\230\156\172\232\161\168\228\184\173, \232\175\187\232\161\168\229\164\177\232\180\165! \232\175\187\229\133\165Id\239\188\154" .. self.GameMode.DungeonId)
    return
  end
  self.CaptureMonsterId = self:GetCaptureMonsterId(CaptureData)
  if not self.CaptureMonsterId then
    GameState(self):ShowDungeonError("CaptureComponent:\232\142\183\229\143\150\230\141\149\232\142\183\230\128\170Id\229\164\177\232\180\165!")
    return
  end
  self.CaptureMonsterLoc, self.CaptureLevelId, self.CapturePathLevelArray = self.GameMode.TacMapManager:GenerateCapturePath(CaptureData.Dis)
  self.CaptureCreator = self:GetWorld():SpawnActor(self.GameMode.StaticCreatorPath, UE4.FTransform(FVector(0, 0, 0), self.CaptureMonsterLoc + FVector(0, 0, 100)), UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
  self.CaptureCreator.StaticCreatorId = CaptureData.CaptureCreatorId
  self.CaptureCreator.UnitType = "Monster"
  self.CaptureCreator.Level = CaptureData.FixLevel or 0
  self.CaptureCreator.UnitId = self.CaptureMonsterId
  self.GameMode.EMGameState.StaticCreatorMap:Add(self.CaptureCreator.StaticCreatorId, self.CaptureCreator)
  self.PostEventCaptureTargetSpawnEnable = true
  self.GameMode.EMGameState:SetIsMonsterWaitForCapture(false)
  self.CaptureMonsterEid = 0
  self.CaptureMonsterData = {}
  self.IsFirstSeen = false
end

function BP_CaptureComponent_C:InitCaptureBaseInfo()
  if not (self.CaptureMonsterId and self.GameMode.TacMapManager) or not self.CaptureLevelId then
    return
  end
  self.GameMode.EMGameState:StartGameTime()
  self.EscapeLoc = nil
  local CaptureExitCreatorInfos = TMap(0, UObject)
  self.GameMode.EMGameState:GetSubStaticCreatorInfo(self.CaptureLevelId, CaptureExitCreatorInfos)
  if CaptureExitCreatorInfos:Length() <= 0 then
    GameState(self):ShowDungeonError("CaptureComponent:\230\128\170\231\137\169\233\128\131\232\132\177\229\133\179\229\141\161\229\134\133\228\184\141\229\173\152\229\156\168\233\128\131\232\132\177\231\130\185\239\188\140\232\175\183\230\163\128\230\159\165\233\133\141\231\189\174\239\188\140LevelName\239\188\154" .. self.CaptureLevelId)
  end
  for Id, Creator in pairs(CaptureExitCreatorInfos) do
    if IsValid(Creator) and Creator.CaptureMonsterExit then
      self.EscapeLoc = Creator:K2_GetActorLocation()
      self.GameMode:TriggerActiveCustomStaticCreator(Id, "", true, self.CaptureLevelId)
      DebugPrint("\230\141\149\232\142\183\231\142\169\230\179\149\239\188\140\229\136\183\230\150\176\230\128\170\231\137\169\233\128\131\232\132\177\231\130\185  CaptureLevelName:", self.CaptureLevelId, "CreatorId:", Creator.StaticCreatorId)
      self:ActiveCaptureMonster()
      return
    end
  end
  self:ActiveCaptureMonster()
  GameState(self):ShowDungeonError("CaptureComponent:\232\142\183\231\142\169\230\179\149\229\136\183\230\150\176\233\128\131\232\132\177\231\130\185\229\164\177\232\180\165! \232\175\183\230\163\128\230\159\165\232\147\157\229\155\190\233\133\141\231\189\174    LevelId:   " .. self.CaptureLevelId)
end

function BP_CaptureComponent_C:ActiveCaptureMonster()
  local CpatureArray = TArray(0)
  CpatureArray:Add(self.CaptureCreator.StaticCreatorId)
  self.GameMode:TriggerActiveStaticCreator(CpatureArray, "CaptureMonster")
end

function BP_CaptureComponent_C:OnStaticCreatorEvent(EventName, Eid, UnitId, UnitType)
  if "CaptureMonster" == EventName then
    self.CaptureMonsterEid = Eid
    DebugPrint("CaptureComponent: \230\141\149\232\142\183\230\128\170\229\183\178\230\191\128\230\180\187\239\188\140Eid", Eid, "UnitId", UnitId, self.CaptureMonsterId)
  end
end

function BP_CaptureComponent_C:GetCaptureMonsterId(CaptureData)
  local TotalWeight = 0
  for i, Data in pairs(CaptureData.Capture) do
    TotalWeight = TotalWeight + Data.Weight
  end
  local RandomValue = math.random(0, TotalWeight - 1)
  local RandomCount = 0
  for i, Data in pairs(CaptureData.Capture) do
    RandomCount = RandomCount + Data.Weight
    if RandomValue < RandomCount then
      return Data.CaptureMonsterId
    end
  end
  return CaptureData.Capture[1].CaptureMonsterId
end

function BP_CaptureComponent_C:OnCaptureSuccess()
  if self.GameMode:GetNeedCreateEmergencyMonster("Treasure") == true then
    self.GameMode:TryCreateEmergencyMonster("Treasure")
  end
  if true == self.GameMode:GetNeedCreateEmergencyMonster("Pet") then
    self.GameMode:TriggerSpawnPet()
  end
end

function BP_CaptureComponent_C:InitTreasureMonsterEecapeLoc(TreasureMonster)
  local mechanimArray = self.GameMode.EMGameState.MechanismMap:FindRef("AOITriggerBox")
  if mechanimArray then
    local targetLoc = self.GameMode:GetEscapeMechanismLocation()
    if targetLoc then
      TreasureMonster:SetTreasureMonsterTarget(targetLoc)
    end
  end
end

function BP_CaptureComponent_C:OnMonsterWaitForCapture(CaptureMonster)
  DebugPrint("CaptureComponent: OnMonsterWaitForCapture  UnitId: " .. self.CaptureMonsterId .. "Eid: " .. self.CaptureMonsterEid)
  local CaptureParam = CaptureMonster.Data.CaptureParam
  if not CaptureParam or not CaptureParam.RecoverTime then
    GameState(self):ShowDungeonError("CaptureComponent:\230\141\149\232\142\183\230\128\170\230\178\161\230\156\137CaptureParam\239\188\129 UnitId:" .. self.CaptureMonsterId .. "Eid: " .. self.CaptureMonsterEid .. "==" .. CaptureMonster.Eid)
    return
  end
  self:SetCaptureRecoveryTime(CaptureParam.RecoverTime)
  self.GameMode:AddDungeonEvent("CaptureMonsterRecovery")
  self:AddTimer(0.1, self.UpdateCaptureRecoveryTimer, true, 0, "CaptureRecovery")
  self.GameMode.EMGameState:SetIsMonsterWaitForCapture(true)
  self.CaptureMonsterData = CaptureMonster.Data
end

function BP_CaptureComponent_C:UpdateCaptureRecoveryTimer()
  self:AddCaptureRecoveryTime(-0.1)
  if self:GetCaptureRecoveryTime() <= 0 then
    self:RemoveCaptureRecoveryTimer()
    self:OnCaptureRecoveryTimerEnd()
  end
end

function BP_CaptureComponent_C:OnCaptureRecoveryTimerEnd()
  self.GameMode.EMGameState:SetIsMonsterWaitForCapture(false)
  local CaptureMonster = Battle(self):GetEntity(self.CaptureMonsterEid)
  if IsValid(CaptureMonster) then
    DebugPrint("CaptureComponent: OnCaptureRecoveryTimerEnd \230\141\149\232\142\183\230\128\170\229\156\168\229\156\186")
    CaptureMonster:SetMonWaitForCaught(false)
    CaptureMonster:SetCharacterTag("Idle")
    CaptureMonster:StopMontage()
    Battle(self):CaptureMonsterStandUp(CaptureMonster.Eid)
    self.GameMode:TriggerGameModeEvent("OnCaptureTargetRecover", CaptureMonster)
    if CaptureMonster.CapturePlayer then
      CaptureMonster.InteractiveComponent:EndPressInteractive(CaptureMonster.CapturePlayer, false)
    end
  else
    DebugPrint("CaptureComponent: OnCaptureRecoveryTimerEnd \230\141\149\232\142\183\230\128\170\228\184\141\229\156\168\229\156\186")
    self.GameMode:TriggerGameModeEvent("OnCaptureTargetRecover", nil)
  end
  self.GameMode:RemoveDungeonEvent("CaptureMonsterRecovery")
end

function BP_CaptureComponent_C:SetCaptureRecoveryTime(Value)
  self.GameMode.EMGameState:SetCaptureRecoveryTime(Value)
  if IsStandAlone(self) then
    self.GameMode.EMGameState:OnRep_CaptureRecoveryTime()
  end
end

function BP_CaptureComponent_C:AddCaptureRecoveryTime(Value)
  self.GameMode.EMGameState:SetCaptureRecoveryTime(self.GameMode.EMGameState.CaptureRecoveryTime + Value)
  if IsStandAlone(self) then
    self.GameMode.EMGameState:OnRep_CaptureRecoveryTime()
  end
end

function BP_CaptureComponent_C:GetCaptureRecoveryTime()
  return self.GameMode.EMGameState.CaptureRecoveryTime
end

function BP_CaptureComponent_C:RemoveCaptureRecoveryTimer()
  DebugPrint("CaptureComponent: CaptureRecoveryTimer\229\183\178\231\167\187\233\153\164")
  self:RemoveTimer("CaptureRecovery")
end

function BP_CaptureComponent_C:PauseCaptureRecoveryTimer()
  DebugPrint("CaptureComponent: CaptureRecoveryTimer\229\183\178\230\154\130\229\129\156")
  self:PauseTimer("CaptureRecovery")
end

function BP_CaptureComponent_C:UnPauseCaptureRecoveryTimer()
  DebugPrint("CaptureComponent: CaptureRecoveryTimer\230\129\162\229\164\141\230\154\130\229\129\156")
  self:UnPauseTimer("CaptureRecovery")
end

return BP_CaptureComponent_C
