require("UnLua")
local BP_Excavation_C = Class({
  "BluePrints/Item/DefenceCore/BP_DefenceBase_C",
  "BluePrints.Common.TimerMgr"
})

function BP_Excavation_C:AuthorityInitInfo(Info)
  BP_Excavation_C.Super.AuthorityInitInfo(self, Info)
  self.DepleteRate = 1
  self.AttractRange = self.UnitParams.AttractRange
  self.MaxEnergy = 100
  self.NowEnergy = self.UnitParams.NowEnergy
  self.Progress = 0
  self.PreProgress = 0
  self.BatteryEnergy = DataMgr.GlobalConstant.BatteryEnergy.ConstantValue
  self.BatteryNum = self.NowEnergy / self.BatteryEnergy
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  self.CompleteRewardNum = DataMgr.Excavation[GameMode.DungeonId].CompleteRewardNum
  self.MultiDepleteRate = DataMgr.Excavation[GameMode.DungeonId].MultiDepleteRate or 1
  self.CreateRewardNum = 0
  local RandomCreator = Info:FindObjectParams("RandomCreator")
  self.CreatorId = RandomCreator.StaticCreatorId
  self.RandomCreatorId = Info.IntParams:Find("RandomCreatorId")
  RandomCreator:AddUserEid(self)
  self.GuideOrderIndex = GameMode:TriggerDungeonComponentFun("RegisterGuideOrder", self.Eid)
end

function BP_Excavation_C:CommonInitInfo(Info)
  self.StartDigStateId = self.UnitParams.StartDigStateId
  self.StopDigStateId = self.UnitParams.StopDigStateId
  BP_Excavation_C.Super.CommonInitInfo(self, Info)
  self.Efficiency = self.UnitParams.Efficiency
end

function BP_Excavation_C:InitExcavationMonsterSpawn(Info)
  local MonsterSpawnId
  MonsterSpawnId = Info.IntParams:Find("MonsterSpawnId")
  if not MonsterSpawnId then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local Ids = TArray(0)
  Ids:Add(MonsterSpawnId)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.ExcavationMechanismInfos:Add(self.Eid, MonsterSpawnId)
  GameMode:TriggerCreateMonsterSpawn(Ids)
end

function BP_Excavation_C:StartDig()
  if IsAuthority(self) then
    self:RemoveTimer("ExcavationCreateReward")
    self:AddTimer(1, BP_Excavation_C.CreateReward, true, 0, "ExcavationCreateReward")
  end
  if not IsAuthority(self) or IsStandAlone(self) then
    self:OnStartDig()
    self.Mesh:PlayAnimation(self.DigAnim, true)
  end
end

function BP_Excavation_C:StopDig()
  if not IsAuthority(self) or IsStandAlone(self) then
    self:OnStopDig()
    self.Mesh:PlayAnimation(self.IdleAnim, true)
  end
  if IsAuthority(self) then
    self:RemoveTimer("ExcavationCreateReward")
  end
end

function BP_Excavation_C:ActiveOnServer()
  if self.IsActive == true then
    self:ActiveDefence()
    if IsAuthority(self) then
      self.BatteryHandle = self:AddTimer(0.5, self.AttractBattery, true)
    end
  end
end

function BP_Excavation_C:OnActiveStateChange()
  self.Super.OnActiveStateChange(self)
  if self.IsActive then
    AudioManager(self):PlayFMODSound(self, nil, "event:/sfx/common/scene/gear/excavation_create", "ExcavationCreate")
  end
end

function BP_Excavation_C:AttractBattery()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  for _, Player in pairs(GameMode:GetAllPlayer()) do
    local Distance = (Player:K2_GetActorLocation() - self:K2_GetActorLocation()):Size()
    if Distance <= self.AttractRange then
      if not self:IsExistTimer("ExcavationCreateReward") and self.NowEnergy > 0 then
        self:ChangeState("Manual", Player.Eid, self.StartDigStateId)
      end
      if self.BatteryNum >= self.MaxEnergy / self.BatteryEnergy then
        self.DepleteRate = self.DepleteRate * self.MultiDepleteRate
        self:RemoveTimer(self.BatteryHandle)
        return
      end
      local NowBatteryNum = math.floor(math.min(self.BatteryNum + Player.BatteryNum, self.MaxEnergy / self.BatteryEnergy) - self.BatteryNum)
      if NowBatteryNum > 0 then
        self:OnCharge(Player.Eid)
      end
      self.BatteryNum = self.BatteryNum + NowBatteryNum
      self.PreEnergy = self.NowEnergy
      self.NowEnergy = math.min(self.NowEnergy + NowBatteryNum * self.BatteryEnergy, self.MaxEnergy)
      GameState.BatteryToTalNum = GameState.BatteryToTalNum - Player.BatteryNum
      Player.BatteryNum = Player.BatteryNum - NowBatteryNum
      if NowBatteryNum > 0 then
        Battle(self):ReduceBuffLayerFromTarget(Player, Player, Const.BarriyBuffId, NowBatteryNum, false)
      end
      if self.PreEnergy ~= self.NowEnergy then
        self:OnAttractBattery(self.Eid, self.NowEnergy - self.PreEnergy)
      end
    end
  end
end

function BP_Excavation_C:CreateReward()
  self.NowEnergy = math.max(self.NowEnergy - self.DepleteRate, 0)
  self.Progress = self.Progress + self.DepleteRate
  local RealProgress = (self.Progress - self.PreProgress) // 10
  if self.PreProgress < 50 and self.Progress >= 50 then
    self:CreateNextExcavation()
  end
  if RealProgress >= 1 then
    for i = 1, RealProgress do
      self:RealCreateReward(self.Progress // 10)
      self.PreProgress = self.PreProgress + 10
    end
  end
  if self.Progress >= 100 then
    for i = 0, self.CompleteRewardNum - 1 do
      self:RealCreateReward(11 + i)
    end
    self:MissionComplete()
    self:CreateNextExcavation()
  end
  if self.NowEnergy <= 0 then
    if self.Progress < 100 then
      self:TriggerGameModeEvent("OnEnergyZero")
    end
    self:ChangeState("Manual", 0, self.StopDigStateId)
  end
end

function BP_Excavation_C:CreateNextExcavation()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:TriggerDungeonComponentFun("TriggerPrepareActiveExcavation")
end

function BP_Excavation_C:RealCreateReward(CreateNum)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  for i = 1, self.Efficiency do
    self.CreateRewardNum = self.CreateRewardNum + 1
    local ExtraInfo = {
      UniqueSign = self.Eid .. "_" .. self.CreateRewardNum
    }
    GameMode:TriggerRewardEvent(self.UnitId, CommonConst.RewardReason.Repeated, self.RewardPosition:K2_GetComponentToWorld(), ExtraInfo)
  end
  self:TriggerBluePrintEvent("OnCreateReward")
end

function BP_Excavation_C:MissionComplete()
  self:RemoveTimer(self.BatteryHandle)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:TriggerDungeonComponentFun("UpdateNowExcavNum", -1)
  GameMode:TriggerDungeonComponentFun("UpdateFinishedExcavNum", 1)
  self:TriggerGameModeEvent("OnExcavationProgressEnough")
  self:ChangeState("Manual", 0, self.StopDigStateId)
  self:TriggerBluePrintEvent("OnMissionComplete")
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.DefBaseMap:Remove(self.Eid)
  GameState.HatredCombatProp:Remove(self.Eid)
  self:EMActorDestroy(EDestroyReason.MechanismDead)
  GameMode:TriggerDungeonComponentFun("JudgeNextTurn")
end

function BP_Excavation_C:ShowDeath()
  BP_Excavation_C.Super.ShowDeath(self)
  EventManager:FireEvent(EventID.OnExcavationItemChange, "Remove", self.Eid)
end

function BP_Excavation_C:OnDead(KillMineRoleEid, KillMineSkillId, DeathReason)
  BP_Excavation_C.Super.OnDead(self, KillMineRoleEid, KillMineSkillId, DeathReason)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if IsAuthority(self) then
    GameMode:TriggerDungeonComponentFun("UpdateNowExcavNum", -1)
    GameMode:TriggerDungeonComponentFun("UpdateTurnDeadExcavNum", 1)
    self:CreateNextExcavation()
  end
  self:ChangeState("Manual", 0, self.StopDigStateId)
  if IsAuthority(self) then
    GameMode:TriggerGameModeEvent("OnExcavationDestroyed")
    GameMode:TriggerDungeonComponentFun("JudgeNextTurn")
  end
  if IsStandAlone(self) or IsClient(self) then
    self:OnExcavationDestroyed()
  end
  self:RemoveTimer(self.BatteryHandle)
  self:EMActorDestroy(EDestroyReason.MechanismDead)
end

function BP_Excavation_C:RegisterToGameState()
  if not IsAuthority(self) then
    print(_G.LogTag, "not IsAuthority")
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if nil == GameState then
    print(_G.LogTag, "GameState is nil")
    return
  end
  GameState:RegisterMechanism(self, self:GetUnitRealType())
end

function BP_Excavation_C:OnActorReady(Info)
  BP_Excavation_C.Super.OnActorReady(self, Info)
  if IsAuthority(self) then
    self:InitExcavationMonsterSpawn(Info)
  end
end

function BP_Excavation_C:ClientInitInfo(Info)
  BP_Excavation_C.Super.ClientInitInfo(self, Info)
  local ExcavationUI = Utils.UIManager(self):GetUIObj("DungenonExcavation")
  if ExcavationUI then
    ExcavationUI:OnExcavationItemChange("Add", self.Eid)
  else
    DebugPrint("BP_Excavation_C\230\137\190\228\184\141\229\136\176ExcavationUI", self.Eid)
    self:AddTimer(5, function()
      ExcavationUI = Utils.UIManager(self):GetUIObj("DungenonExcavation")
      if ExcavationUI then
        ExcavationUI:OnExcavationItemChange("Add", self.Eid)
        self:RemoveTimer("ExcavationUIAddItem")
      end
    end, true, 0, "ExcavationUIAddItem")
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local SceneManager = GameInstance:GetSceneManager()
  if SceneManager then
    SceneManager:UpdateOneSceneGuideIcon(self.Eid, true, false)
  end
end

function BP_Excavation_C:OnCharge(Eid)
  self.Overridden.OnCharge(self)
end

function BP_Excavation_C:OnMissionComplete()
  self:OnExcavationProgressEnough()
  EventManager:FireEvent(EventID.OnExcavationFinish, self.Eid)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.DefBaseMap:Remove(self.Eid)
  GameState.HatredCombatProp:Remove(self.Eid)
end

function BP_Excavation_C:OnEnterState(NowStateId)
  self.Overridden.OnEnterState(self, NowStateId)
  if NowStateId == self.StartDigStateId then
    self:StartDig()
  elseif NowStateId == self.StopDigStateId then
    self:StopDig()
  end
end

function BP_Excavation_C:OnAttractBattery_Lua(ExcavationEid, BatteryEnergy)
  if not IsAuthority(self) or IsStandAlone(self) then
    EventManager:FireEvent(EventID.OnAttractBattery, ExcavationEid, BatteryEnergy)
  end
end

return BP_Excavation_C
