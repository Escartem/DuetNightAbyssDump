require("UnLua")
local BP_ExterminateBaseComponent_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_ExterminateBaseComponent_C:InitExterminateBaseComponent()
  self.GameMode = self:GetOwner()
  self.NowGuideEids = {}
  self.HasGuideUpdateRequest = {}
  self.Success = false
  self.ExterminateInfo = self:GetDataMgrInfo()
  if not self.ExterminateInfo then
    GameState(self):ShowDungeonError("ExterminateBaseComponent:\229\189\147\229\137\141\229\137\175\230\156\172ID\230\178\161\230\156\137\229\161\171\229\134\153\229\156\168\229\175\185\229\186\148\231\154\132\229\137\175\230\156\172\232\161\168\228\184\173, \232\175\187\232\161\168\229\164\177\232\180\165! \232\175\187\229\133\165Id\239\188\154" .. self.GameMode.DungeonId)
    return
  end
  self.TargetNum = self.ExterminateInfo.TargetNum or 80
  self.NormalRange = self.ExterminateInfo.NormalRange
  self.NormalSpawnRule = self.ExterminateInfo.NormalSpawnRule
  self.NormalSpawnOnlyRelation = self.ExterminateInfo.NormalSpawnOnlyRelation
  self.IsNormalNumActive = self:ResetNormalNum()
  self.EliteRange = self.ExterminateInfo.EliteRange
  self.EliteSpawnRule = self.ExterminateInfo.EliteSpawnRule
  self.EliteSpawnOnlyRelation = self.ExterminateInfo.EliteSpawnOnlyRelation
  self.IsEliteNumActive = self:ResetEliteNum()
  self.PetSpawnRange = self.ExterminateInfo.PetSpawnRange
  if self.PetSpawnRange then
    if 1 == #self.PetSpawnRange then
      self.PetSpawnNum = self.PetSpawnRange[1]
    else
      self.PetSpawnNum = math.random(self.PetSpawnRange[1], self.PetSpawnRange[2])
    end
  end
  self.GameMode.EMGameState:SetExterminateTotalNum(self.TargetNum)
end

function BP_ExterminateBaseComponent_C:GetDataMgrInfo()
  return
end

function BP_ExterminateBaseComponent_C:OnEliteNumClear()
end

function BP_ExterminateBaseComponent_C:ResetNormalNum()
  if self.NormalRange == nil then
    return false
  end
  if nil == self.NormalSpawnRule then
    return false
  end
  if nil == self.NormalSpawnOnlyRelation then
    return false
  end
  if 1 == #self.NormalRange then
    self.NormalNum = self.NormalRange[1]
  else
    self.NormalNum = math.random(self.NormalRange[1], self.NormalRange[2])
  end
  DebugPrint("ExterminateBaseComponent: New NormalNum:", self.NormalNum)
  return true
end

function BP_ExterminateBaseComponent_C:ResetEliteNum()
  if self.EliteRange == nil then
    return false
  end
  if nil == self.EliteSpawnRule then
    return false
  end
  if nil == self.EliteSpawnOnlyRelation then
    return false
  end
  if 1 == #self.EliteRange then
    self.EliteNum = self.EliteRange[1]
  else
    self.EliteNum = math.random(self.EliteRange[1], self.EliteRange[2])
  end
  DebugPrint("ExterminateBaseComponent: New EliteNum:", self.EliteNum)
  return true
end

function BP_ExterminateBaseComponent_C:InitGuideUpdateTimerLogic()
  self.GuideTimerHandle_DetectFault = "Handle_DetectFault"
  self.GuideTimerInterval_AutoUpdate = DataMgr.GlobalConstant.ExterminateGuideInterval.ConstantValue or 10
  self:AddGuideTimer_DetectFault()
  for i = 0, self.GameMode:GetPlayerNum() - 1 do
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, i)
    if IsValid(Player) then
      self.HasGuideUpdateRequest[Player.Eid] = false
      self:AddGuideTimer_AutoUpdate(Player.Eid)
    end
  end
end

function BP_ExterminateBaseComponent_C:OnPlayerEnter(PlayerEid)
  DebugPrint("zwk  \228\184\173\233\128\148\230\156\137\231\142\169\229\174\182\229\138\160\229\133\165 Eid\239\188\154 ", PlayerEid)
  self:AddGuideTimer_AutoUpdate(PlayerEid)
end

function BP_ExterminateBaseComponent_C:AddGuideTimer_AutoUpdate(PlayerEid)
  self:AddTimer(self.GuideTimerInterval_AutoUpdate, self.OnTimerEnd_AutoUpdate, true, 0, "Handle_AutoUpdate_" .. PlayerEid, nil, PlayerEid)
end

function BP_ExterminateBaseComponent_C:OnTimerEnd_AutoUpdate(PlayerEid)
  DebugPrint("ExterminateBaseComponent: \232\135\170\229\138\168\230\155\180\230\150\176RemoveGuideEid \232\162\171Remove\231\154\132\230\140\135\229\188\149\231\130\185Eid: " .. tostring(self.NowGuideEids[PlayerEid]) .. "  Player Eid: " .. tostring(PlayerEid))
  self.GameMode.EMGameState:RemoveGuideEid(self.NowGuideEids[PlayerEid], PlayerEid)
  self:TryUpdateGuidePoint(PlayerEid)
end

function BP_ExterminateBaseComponent_C:AddGuideTimer_LimitCalls(PlayerEid)
  self:AddTimer(1, self.OnTimerEnd_LimitCalls, false, 0, "Handle_LimitCalls_" .. PlayerEid, nil, PlayerEid)
end

function BP_ExterminateBaseComponent_C:OnTimerEnd_LimitCalls(PlayerEid)
  if self.HasGuideUpdateRequest[PlayerEid] then
    DebugPrint("ExterminateBaseComponent: \232\161\165\229\133\133\232\176\131\231\148\168\230\155\180\230\150\176\230\140\135\229\188\149 PlayerEid: " .. PlayerEid)
    self:UpdateNearestMonsterGuide(PlayerEid)
    self.HasGuideUpdateRequest[PlayerEid] = false
  end
end

function BP_ExterminateBaseComponent_C:AddGuideTimer_DetectFault()
  self:AddTimer(2, self.OnTimerEnd_DetectFault, true, 0, self.GuideTimerHandle_DetectFault)
end

function BP_ExterminateBaseComponent_C:OnTimerEnd_DetectFault()
  for i = 0, self.GameMode:GetPlayerNum() - 1 do
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, i)
    if IsValid(Player) and self:CheckGuideLogicHasFault(Player) then
      DebugPrint("ExterminateBaseComponent: \230\163\128\230\181\139\229\136\176\231\142\169\229\174\182Eid: " .. Player.Eid .. " \228\184\141\229\173\152\229\156\168\230\140\135\229\188\149\231\130\185\239\188\140\229\135\134\229\164\135\230\183\187\229\138\160")
      self:TryUpdateGuidePoint(Player.Eid)
    end
  end
end

function BP_ExterminateBaseComponent_C:CheckGuideLogicHasFault(Player)
  if not IsValid(Player) then
    return true
  end
  if self.NowGuideEids[Player.Eid] == nil then
    return true
  end
  if not self.GameMode.EMGameState:ContainsGuideEid(self.NowGuideEids[Player.Eid], Player.Eid) then
    return true
  end
  return false
end

function BP_ExterminateBaseComponent_C:TryUpdateGuidePoint(PlayerEid)
  if self:IsExistTimer("Handle_LimitCalls_" .. PlayerEid) then
    DebugPrint("ExterminateBaseComponent: \230\173\164\230\172\161\232\176\131\231\148\168\230\155\180\230\150\176\230\140\135\229\188\149\233\162\145\231\142\135\232\191\135\233\171\152\239\188\140\229\183\178\230\154\130\231\188\147\232\176\131\231\148\168 PlayerEid: " .. PlayerEid)
    self.HasGuideUpdateRequest[PlayerEid] = true
  else
    self:UpdateNearestMonsterGuide(PlayerEid)
    self:AddGuideTimer_LimitCalls(PlayerEid)
  end
end

function BP_ExterminateBaseComponent_C:OnUnitDeadEvent(MonsterC)
  if self.Success then
    return
  end
  if not IsValid(MonsterC) then
    return
  end
  if not MonsterC:IsRealMonster() then
    return
  end
  self:AddExterminateKilledNum(1)
  self:CheckTargetNum()
  if MonsterC:IsEliteMonster() then
    return
  end
  for PlayerEid, GuideEid in pairs(self.NowGuideEids) do
    if MonsterC.Eid == GuideEid then
      DebugPrint("ExterminateBaseComponent: \230\128\170\231\137\169\230\173\187\228\186\161RemoveGuideEid \232\162\171Remove\231\154\132\230\140\135\229\188\149\231\130\185Eid: " .. GuideEid .. "  Player Eid: " .. PlayerEid)
      self.GameMode.EMGameState:RemoveGuideEid(GuideEid, PlayerEid)
      self:TryUpdateGuidePoint(PlayerEid)
      self:AddGuideTimer_AutoUpdate(PlayerEid)
      DebugPrint("ExterminateBaseComponent: OnUnitDeadEvent", MonsterC:GetName(), MonsterC.Eid, PlayerEid)
    end
  end
end

function BP_ExterminateBaseComponent_C:AddExterminateKilledNum(Num)
  self.GameMode.EMGameState:SetExterminateKilledNum(self.GameMode.EMGameState.ExterminateKilledNum + Num)
  if IsStandAlone(self) then
    self.GameMode.EMGameState:OnRep_ExterminateKilledNum()
  end
end

function BP_ExterminateBaseComponent_C:UpdateNearestMonsterGuide(PlayerEid)
  local Player = Battle(self):GetEntity(PlayerEid)
  if IsValid(Player) then
    local MonsterEid = self.GameMode:GetNearestMonsterEid(Player)
    if nil ~= MonsterEid and MonsterEid > 0 then
      self.NowGuideEids[PlayerEid] = MonsterEid
      self.GameMode.EMGameState:AddGuideEid(MonsterEid, PlayerEid)
      DebugPrint("ExterminateBaseComponent: \229\183\178\230\136\144\229\138\159\230\183\187\229\138\160\230\140\135\229\188\149\231\130\185 \230\140\135\229\188\149\231\130\185Eid: " .. MonsterEid .. "  Player Eid: " .. PlayerEid)
    else
      DebugPrint("ExterminateBaseComponent: Error  \230\173\188\231\129\173\231\142\169\230\179\149\229\189\147\229\137\141\229\156\186\228\184\138\230\137\190\228\184\141\229\136\176\230\128\170\231\137\169!")
    end
  end
end

function BP_ExterminateBaseComponent_C:ClearGuideUpdateTimerLogic()
  for PlayerEid, GuideEid in ipairs(self.NowGuideEids) do
    DebugPrint("ExterminateBaseComponent: \231\187\147\230\157\159\230\184\133\231\144\134RemoveGuideEid \232\162\171Remove\231\154\132\230\140\135\229\188\149\231\130\185Eid: " .. GuideEid .. "  Player Eid: " .. PlayerEid)
    self.GameMode.EMGameState:RemoveGuideEid(GuideEid, PlayerEid)
  end
  self.NowGuideEids = {}
  self:RemoveTimer(self.GuideTimerHandle_DetectFault)
  for i = 0, self.GameMode:GetPlayerNum() - 1 do
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, i)
    if IsValid(Player) then
      self.GameMode.EMGameState:ClearGuideEid(Player.Eid)
      self:RemoveTimer("Handle_AutoUpdate_" .. Player.Eid)
      self:RemoveTimer("Handle_LimitCalls_" .. Player.Eid)
    end
  end
end

function BP_ExterminateBaseComponent_C:CheckTargetNum()
  self.TargetNum = self.TargetNum - 1
  if self.TargetNum <= 0 then
    self.Success = true
    self.GameMode:TriggerGameModeEvent("OnAchieveTarget")
    if self.GameMode:GetNeedCreateEmergencyMonster("Pet") then
      self.GameMode:TriggerSpawnPet()
    end
  end
  if self.IsNormalNumActive then
    self.NormalNum = self.NormalNum - 1
    if 0 == self.NormalNum then
      self.GameMode:TriggerCreateMonsterSpawn(self:RuleToTArray(self.NormalSpawnRule), self.NormalSpawnOnlyRelation)
      self:ResetNormalNum()
    end
  end
  if self.IsEliteNumActive then
    self.EliteNum = self.EliteNum - 1
    if 0 == self.EliteNum then
      self:OnEliteNumClear()
      self.GameMode:TriggerCreateMonsterSpawn(self:RuleToTArray(self.EliteSpawnRule), self.EliteSpawnOnlyRelation)
      self:ResetEliteNum()
    end
  end
  if self.PetSpawnNum then
    self.PetSpawnNum = self.PetSpawnNum - 1
    if 0 == self.PetSpawnNum then
      self.PetSpawnNum = nil
      if self.GameMode:GetNeedCreateEmergencyMonster("Pet") then
        self.GameMode:TriggerSpawnPet()
      end
    end
  end
end

function BP_ExterminateBaseComponent_C:RuleToTArray(Rule)
  local ResTArray = TArray(0)
  if Rule then
    ResTArray:Add(Rule)
  end
  return ResTArray
end

return BP_ExterminateBaseComponent_C
