require("UnLua")
local M = Class({
  "BluePrints.Item.CombatProp.BP_CombatPropBase_C",
  "BluePrints.Common.TimerMgr"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.HpThreshold = self.UnitParams.HpThreshold
  self.SkillEffect = self.UnitParams.SkillEffect
  self.SpawnedMonsters = {}
  self.RemainNum = self.MonsterNum
  self.OverlappingPlayer = nil
  self.ActiveState = false
end

function M:OnActorReady(Info)
  M.Super.OnActorReady(self, Info)
  self.Sphere.OnComponentBeginOverlap:Add(self, self.OnPlayerIn)
  self.Sphere.OnComponentEndOverlap:Add(self, self.OnPlayerOut)
  self.Sphere:SetCollisionProfileName("OnlyPlayer", true)
  EventManager:AddEvent(EventID.OnKongmingLanternBreak, self, self.OnKongmingLanternBreak)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    if not GameState.MonsterSmokes then
      GameState.MonsterSmokes = {}
    end
    GameState.MonsterSmokes[self.Eid] = false
    GameState:RegisterGameModeEvent("OnDead", self, self.OnMonsterKilled)
  end
end

function M:OnKongmingLanternBreak(CreatorId)
  if not self.OverlappingPlayer then
    return
  end
  for i = 1, self.LanternCreatorIds:Length() do
    if self.LanternCreatorIds[i] == CreatorId then
      self:RemoveTimer("CheckState")
      self:OnDetection()
      self:AddTimer(1, self.CheckState, true, 0, "CheckState", false)
      break
    end
  end
end

function M:OnPlayerIn(Component, OtherActor, OtherComp)
  self.OverlappingPlayer = OtherActor
end

function M:OnPlayerOut(Component, OtherActor, OtherComp)
  self.OverlappingPlayer = nil
end

function M:ActiveCombat()
  M.Super.ActiveCombat(self)
  if not self:IsExistTimer("CheckState") then
    self:AddTimer(1, self.CheckState, true, -1, "CheckState", false)
  end
end

function M:DeActiveCombat()
  M.Super.DeActiveCombat(self)
  self:RemoveTimer("CheckState")
  self:RemoveTimer("LongCheckState")
  self:RemoveTimer("SpawnMonstersTimer")
end

function M:CheckState()
  if self.ActiveState then
    return
  end
  if self.OverlappingPlayer and self.IsActive then
    local CurHp = self.OverlappingPlayer:GetAttr("Hp")
    local MaxHp = self.OverlappingPlayer:GetAttr("MaxHp")
    local Rate = CurHp / MaxHp
    if Rate <= self.HpThreshold then
      self:OnDetection()
    end
  end
end

function M:LongCheckState()
  if self.OverlappingPlayer and self.IsActive then
    local CurHp = self.OverlappingPlayer:GetAttr("Hp")
    local MaxHp = self.OverlappingPlayer:GetAttr("MaxHp")
    local Rate = CurHp / MaxHp
    if Rate <= self.HpThreshold then
      self:OnDetection()
    else
      self:RemoveTimer("LongCheckState")
      self.ActiveState = false
    end
  end
end

function M:OnDetection()
  if not self:IsExistTimer("SpawnMonstersTimer") then
    self:AddTimer(self.MonsterSpawnInterval, self.SpawnMonsters, true, 0, "SpawnMonstersTimer")
    self:AddTimer(self.MonsterDetectionInterval, self.LongCheckState, true, 0, "LongCheckState", false)
    self.ActiveState = true
  end
end

function M:GetMonsterSpawnPointTrans()
  return self.MonsterSpawnPoint:K2_GetComponentToWorld()
end

function M:SpawnMonsters()
  if not self.IsActive then
    return
  end
  if self.MonsterNum <= 0 then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if nil == GameMode then
    self:CombatPropDeActive()
    return
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if nil == GameState then
    self:CombatPropDeActive()
    return
  end
  local MonPresetTarget
  if self.MonsterPresetTarget == EPresetTargetType.EPlayer then
    MonPresetTarget = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  end
  local RandomIndex = math.random(self.MonsterUnitId:Num())
  local RandomUnitId = self.MonsterUnitId:Get(RandomIndex)
  
  local function LoadFinishCallback(_, Unit)
    self.RemainNum = self.RemainNum - 1
    self.SpawnedMonsters[Unit.Eid] = Unit.Eid
    if Unit.OnSpawnInMonsterNest then
      Unit:OnSpawnInMonsterNest(self, self, self.LaunchSpeed or 1500, self.MaxTime or 5)
      Unit.CharacterMovement.MaxWalkSpeed = 600
    end
    if self.RemainNum <= 0 then
      self:RemoveTimer("SpawnMonstersTimer")
      self.RemainNum = self.MonsterNum
    end
    self:ChangeState("Manual", 0, self.HasMonsterStateId)
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    if GameState and GameState.MonsterSmokes[self.Eid] ~= nil then
      GameState.MonsterSmokes[self.Eid] = true
    end
    EventManager:FireEvent(EventID.OnMonsterAlive)
  end
  
  local Context = AEventMgr.CreateUnitContext()
  Context.UnitType = self.MonsterUnitType
  Context.UnitId = RandomUnitId
  Context.Loc = self:GetMonsterSpawnPointTrans().Translation
  Context.Rotation = self:GetMonsterSpawnPointTrans().Rotation:ToRotator()
  Context.MonsterSpawn = GameMode.LevelGameMode.FixedMonsterSpawn
  Context.IntParams:Add("Level", self:GetAttr("Level"))
  Context:AddObjectParams("PresetTarget", MonPresetTarget)
  Context.OnUnitInitCreateReadyDynamic:Add(self, LoadFinishCallback)
  GameMode.EMGameState.EventMgr:CreateUnitNew(Context, false)
end

function M:OnMonsterKilled(Monster)
  if self.SpawnedMonsters[Monster.Eid] then
    if self.SkillEffect and self.SkillEffect > 0 then
      local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
      self.Super.PropUseSkill(self, self.SkillEffect, Player)
    end
    self.SpawnedMonsters[Monster.Eid] = nil
    if self:getTableLength(self.SpawnedMonsters) <= 0 then
      self:ChangeState("Manual", 0, self.ClearMonsterStateId)
      DebugPrint("zwkk \230\128\170\232\162\171\230\184\133\229\133\137")
      local GameState = UE4.UGameplayStatics.GetGameState(self)
      if GameState and nil ~= GameState.MonsterSmokes[self.Eid] then
        GameState.MonsterSmokes[self.Eid] = false
        local bHasMonster = false
        for _, v in pairs(GameState.MonsterSmokes) do
          if v then
            bHasMonster = true
            break
          end
        end
        if not bHasMonster then
          EventManager:FireEvent(EventID.OnMonsterClear)
        end
      end
    end
  end
end

function M:ReceiveEndPlay()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState and GameState.MonsterSmokes and GameState.MonsterSmokes[self.Eid] ~= nil then
    GameState.MonsterSmokes[self.Eid] = nil
  end
  EventManager:RemoveEvent(EventID.OnKongmingLanternBreak, self)
end

function M:DestroyAllMonster()
  for i, v in pairs(self.SpawnedMonsters) do
    local Monster = Battle(self):GetEntity(v)
    if IsValid(Monster) then
      self:OnMonsterKilled(Monster)
      Monster:EMActorDestroy(EDestroyReason.MonsterNestItemClear)
    end
  end
  self.SpawnedMonsters = {}
  DebugPrint("zwkk DestroyAllMonster End")
end

function M:getTableLength(tbl)
  local count = 0
  for _ in pairs(tbl) do
    count = count + 1
  end
  return count
end

return M
