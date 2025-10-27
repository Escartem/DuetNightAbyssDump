require("UnLua")
local M = Class({
  "BluePrints.Item.CombatProp.BP_CombatPropBase_C"
})

function M:AuthorityInitInfo(Info)
  M.Super.AuthorityInitInfo(self, Info)
  self.SpawnedMonsters = {}
  self.ExistMonsters = {}
end

function M:GetMonsterSpawnPointTrans()
  return self.MonsterSpawnPoint:K2_GetComponentToWorld()
end

function M:ActiveOnServer()
  M.Super.ActiveOnServer(self)
end

function M:DeActive()
  M.Super.DeActive(self)
  self:RemoveTimer("SpawnMonstersTimer")
end

function M:OnActiveStateChange()
  self.Super.OnActiveStateChange(self)
  if self.IsActive then
    self:AddTimer(self.MonsterSpawnInterval, self.SpawnMonsters, true, 0, "SpawnMonstersTimer")
  end
end

function M:ShowDeath()
  M.Super.ShowDeath(self)
end

function M:OnDead(KillMineRoleEid, KillMineSkillId, DeathReason)
  M.Super.OnDead(self, KillMineRoleEid, KillMineSkillId, DeathReason)
  self:RemoveTimer("SpawnMonstersTimer")
end

function M:SetActiveType()
  self.ActiveType = "Manual"
end

function M:SpawnMonsters()
  if self.MonsterNum <= 0 then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if nil == GameMode then
    self:DeActive()
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if nil == GameState then
    self:DeActive()
    return
  end
  local MonPresetTarget
  if self.MonsterPresetTarget == EPresetTargetType.EPlayer then
    MonPresetTarget = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  elseif self.MonsterPresetTarget == EPresetTargetType.EMechanism then
    for _, DefCore in pairs(GameState.DefBaseMap) do
      if DefCore.UnitId == self.MonsterPresetTargetId then
        MonPresetTarget = DefCore
        break
      end
    end
  end
  local RandomIndex = math.random(self.MonsterUnitId:Num())
  local RandomUnitId = self.MonsterUnitId:Get(RandomIndex)
  DebugPrint("BP_MonsterNestBase_C SpawnMonster ", self:GetName(), " RandomUnitId:", RandomUnitId)
  
  local function LoadFinishCallback(_, Unit)
    print(_G.LogTag, "LXZ LoadFinishCallback", Unit.Eid)
    if IsValid(Unit.NestHelperComponent) then
      Unit.NestHelperComponent:K2_DestroyComponent(Unit)
      Unit.NestHelperComponent = nil
    end
    table.insert(self.SpawnedMonsters, Unit.Eid)
    table.insert(self.ExistMonsters, Unit.Eid)
    if Unit.OnSpawnInMonsterNest then
      Unit:OnSpawnInMonsterNest(self, self, self.LaunchSpeed or 1500, self.MaxTime or 5)
      Unit.CharacterMovement.MaxWalkSpeed = 600
    end
    if #self.SpawnedMonsters >= self.MonsterNum then
      self:RemoveTimer("SpawnMonstersTimer")
    end
  end
  
  local Context = AEventMgr.CreateUnitContext()
  Context.UnitType = self.MonsterUnitType
  Context.UnitId = RandomUnitId
  Context.Loc = self:GetMonsterSpawnPointTrans().Translation
  Context.Rotation = self:GetMonsterSpawnPointTrans().Rotation:ToRotator()
  Context.MonsterSpawn = GameMode.LevelGameMode.FixedMonsterSpawn
  Context.IntParams:Add("Level", self:GetAttr("Level"))
  Context.BoolParams:Add("FixNavLocation", false)
  Context:AddObjectParams("PresetTarget", MonPresetTarget)
  Context.OnUnitInitCreateReadyDynamic:Add(self, LoadFinishCallback)
  GameMode.EMGameState.EventMgr:CreateUnitNew(Context, false)
end

function M:DestroyAllMonster()
  for i, v in pairs(self.SpawnedMonsters) do
    local Monster = Battle(self):GetEntity(v)
    if IsValid(Monster) then
      Monster:EMActorDestroy(EDestroyReason.MonsterNestItemClear)
    end
  end
  self.SpawnedMonsters = {}
  self.ExistMonsters = {}
  self.IsCountRest = false
end

function M:ShowSpawnedMonsterGuide()
  DebugPrint("BP_MonsterNestBase_C ShowSpawnedMonsterGuide", self:GetName())
  for _, Eid in pairs(self.ExistMonsters) do
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    GameState:AddGuideEid(Eid)
  end
end

function M:HideSpawnedMonsterGuide()
  DebugPrint("BP_MonsterNestBase_C HideSpawnedMonsterGuide", self:GetName())
  for _, Eid in pairs(self.ExistMonsters) do
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    GameState:RemoveGuideEid(Eid)
  end
end

function M:TriggerCountRestMonsters()
  DebugPrint("BP_MonsterNestBase_C TriggerCountRestMonsters", self.ManualItemId)
  self.IsCountRest = true
  self:AddTimer(1, self.CheckRestMonsters, true, 0, "CheckRestMonsters")
end

function M:CheckRestMonsters()
  if not self.IsCountRest then
    return
  end
  local NewExistMonsters = {}
  for _, LastExistEid in pairs(self.ExistMonsters) do
    local MonsterEntity = Battle(self):GetEntity(LastExistEid)
    if IsValid(MonsterEntity) then
      table.insert(NewExistMonsters, LastExistEid)
    end
  end
  self.ExistMonsters = NewExistMonsters
  DebugPrint("BP_MonsterNestBase_C ManaualItemId", self.ManualItemId, " \232\191\152\229\137\169", #self.ExistMonsters, "\228\184\170\230\128\170\231\137\169\230\178\161\230\184\133\233\153\164")
  if 0 == #self.ExistMonsters then
    self.IsCountRest = false
    DebugPrint("BP_MonsterNestBase_C ManaualItemId", self.ManualItemId, " \229\133\168\233\131\168\230\128\170\231\137\169\230\173\187\228\186\161\239\188\140\229\143\145\229\135\186\228\186\139\228\187\182")
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    GameMode:OnMonsterNestRestMonClear(self.ManualItemId)
  end
end

return M
