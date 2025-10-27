require("Unlua")
local M = Class("BluePrints.Common.TimerMgr")

function M:ReceiveBeginPlay()
  self.RemainTriggerAlertCD = 0
  self.AlertingEid = 0
  self.MonsterSpawnIds = {}
  self.CommonAlarmTarget = nil
  self.InCommonAlert = false
  self.PlayerNum = 0
  self.PlayerInClan = {}
end

function M:InitClan()
  local Avatar = GWorld:GetAvatar()
  if (not Avatar or not Avatar:CheckCondition(self.ActiveConditionId)) and DataMgr.Condition[self.ActiveConditionId] then
    EventManager:AddEvent(EventID.ConditionComplete, self, self.ActiveClan)
  elseif Avatar and Avatar:CheckCondition(self.ActiveConditionId) then
    self:ActiveClan(self.ActiveConditionId)
  end
end

function M:ActiveClan(ConditionId)
  if ConditionId ~= self.ActiveConditionId then
    return
  end
  EventManager:AddEvent(EventID.CharDie, self, self.OnPlayerLeave)
  EventManager:AddEvent(EventID.CharRecover, self, self.OnPlayerEnter)
  self:InitClanCreator()
end

function M:InitClanCreator()
  local StaticIds = TArray(0)
  for Id, Creator in pairs(self.StaticCreatorMap) do
    StaticIds:Add(Id)
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:TriggerActiveStaticCreator(StaticIds)
  self.SpawnHandle = self:AddTimer(0.5, self.CheckAllSpawn, true)
  self.CommonAlertDisable = false
end

function M:CreateMonsterSpawn()
  if not self.InCommonAlert then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:TriggerCreateMonsterSpawn(self.MonsterSpawnIds)
end

function M:DestoryMonsterSpawn()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:TriggerDestoryMonsterSpawn(self.MonsterSpawnIds)
end

function M:CheckAllSpawn()
  for Id, Creator in pairs(self.StaticCreatorMap) do
    if Creator.ChildEids:Length() <= 0 or not IsValid(Battle(self):GetEntity(Creator.ChildEids:GetRef(1))) then
      return
    end
  end
  for Id, Creator in pairs(self.StaticCreatorMap) do
    if Creator.UnitType == "Monster" then
      local Monster = Battle(self):GetEntity(Creator.ChildEids:GetRef(1))
      Monster.ClanId = self.ClanManagerId
      self.MonsterMap:Add(Monster.Eid, Monster)
    elseif Creator.UnitType == "Mechanism" then
      local MiniGame = Battle(self):GetEntity(Creator.ChildEids:GetRef(1))
      MiniGame.ClanId = self.ClanManagerId
      self.AlertMiniGameMap:Add(MiniGame.Eid, MiniGame)
    end
  end
  self:RemoveTimer(self.SpawnHandle)
end

function M:GetAlertMechanism(Monster)
  local MinDis = 99999
  local Result
  for Eid, MiniGame in pairs(self.AlertMiniGameMap) do
    local Dis = self:GetAlertMiniGameDis(Monster, MiniGame)
    if -1 ~= Dis and (MinDis > Dis or nil == Result) then
      MinDis = Dis
      Result = MiniGame
    end
  end
  if not Result then
    print(_G.LogTag, "Error: Can't Find a AlertMiniGame")
    return nil
  end
  return Result
end

function M:GetAlertMiniGameDis(Monster, AlertMiniGame)
  return Monster:GetTwoPosPathLength(Monster:K2_GetActorLocation(), AlertMiniGame:GetMonsterAnimTrans().Translation)
end

function M:ChangeRemainTriggerAlertCD()
  self.RemainTriggerAlertCD = math.max(self.RemainTriggerAlertCD - 1, 0)
  if 0 == self.RemainTriggerAlertCD then
    self:RemoveTimer(self.TriggerAlertCDHandle)
    self.TriggerAlertCDHandle = nil
  end
end

function M:OnPlayerLeave(PlayerEid)
  if self.PlayerInClan[PlayerEid] == nil then
    return
  end
  self.PlayerInClan[PlayerEid] = nil
  self.PlayerNum = self.PlayerNum - 1
  if 0 ~= self.PlayerNum then
    return
  end
  if self.InCommonAlert then
    self:ExitAlert()
  end
end

function M:OnPlayerEnter(PlayerEid)
  if self.PlayerInClan[PlayerEid] == nil then
    self.PlayerInClan[PlayerEid] = Battle(self):GetEntity(PlayerEid)
    self.PlayerNum = self.PlayerNum + 1
  end
end

function M:OnMonsterLeave(MonsterEid)
  if MonsterEid ~= self.AlertingEid then
    return
  end
end

function M:OnMonsterEnter(MonsterEid)
end

function M:ResetRemainTriggerAlertCD()
  self.RemainTriggerAlertCD = DataMgr.GlobalConstant.GameModeAlertCD.ConstantValue or 30
  if not self.TriggerAlertCDHandle then
    self.TriggerAlertCDHandle = self:AddTimer(1.0, self.ChangeRemainTriggerAlertCD, true)
  end
end

function M:ResetAllMonster()
  for Eid, Monster in pairs(self.MonsterMap) do
    if IsValid(Monster) and not Monster:IsDead() then
      Monster.MonAlertComponent:AlertStateChange(Const.EndBattleState)
    else
      self.MonsterMap:Remove(Eid)
    end
  end
  for i, MonsterSpawnId in pairs(self.MonsterSpawnIds) do
    local MonsterSpawn = UE4.UGameplayStatics.GetGameMode(self).MonsterSpawnMap:Find(MonsterSpawnId)
    if MonsterSpawn then
      MonsterSpawn:ClearMonsterSpawnInfo(true)
    end
  end
end

function M:ExitAlert()
  self.AlertingEid = 0
  self.InCommonAlert = false
  self:ResetAllMonster()
  self:DestoryMonsterSpawn()
  self:ResetRemainTriggerAlertCD()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:OnExitCommonAlert()
end

function M:ActiveClanAlert()
  for Eid, Monster in pairs(self.MonsterMap) do
  end
end

return M
