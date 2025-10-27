require("UnLua")
local M = Class({
  "BluePrints.Item.BP_CombatItemBase_C"
})

function M:ActiveCombat()
  M.Super.ActiveCombat(self)
  self.Waves = self.MonsterCreateInfo:Length()
  self.CurWave = 1
  self.CurMonsterDeadNum = 0
  self.AimMonsterNum = 0
  self.AllMonsterNum = 0
  self.CreatorIds = {}
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    GameState:RegisterGameModeEvent("OnDeadStaticUnit", self, self.OnMonsterDead)
  end
  self:AddTimer(self.ActiveTime, self.OnActiveTimeEnd, false, 0, "OnActiveTimeEnd")
  self:StartWave()
end

function M:StartWave()
  if self.CurWave <= self.Waves then
    self.CreateInfo = self.MonsterCreateInfo:FindRef(self.CurWave)
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode then
      self.AimMonsterNum = self.AimMonsterNum + self.CreateInfo.CreatorIds:Length()
      GameMode:TriggerActiveStaticCreator(self.CreateInfo.CreatorIds, "StartTriggerMonster")
      for i = 1, self.CreateInfo.CreatorIds:Length() do
        self.CreatorIds[self.CreateInfo.CreatorIds[i]] = true
      end
    end
    if self.CreateInfo.WaveTime > 0 then
      self:AddTimer(self.CreateInfo.WaveTime, self.OnCurWaveTimeEnd, false, 0, "OnCurWaveTimeEnd")
    end
  end
end

function M:CreateMonster(CreateInfo)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:TriggerActiveStaticCreator(CreateInfo.CreatorIds, "StartTriggerMonster")
  end
end

function M:OnMonsterDead(Monster)
  if Monster and self.CreatorIds and self.CreatorIds[Monster.CreatorId] ~= nil then
    self.CurMonsterDeadNum = self.CurMonsterDeadNum + 1
    if self.CurMonsterDeadNum >= self.AimMonsterNum then
      if self.CurWave >= self.Waves then
        self:OnComplete()
      elseif self.CreateInfo.WaveTime <= 0 then
        self:OnCurWaveTimeEnd()
      end
    end
  end
end

function M:OnActiveTimeEnd()
  self:ChangeState("Manual", 0, self.DeActiveStateId)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    GameState:RemoveGameModeEvent("OnDeadStaticUnit", self, self.OnMonsterDead)
  end
  for i, v in pairs(self.CreatorIds) do
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode then
      local Creator = GameMode.EMGameState.StaticCreatorMap:FindRef(i)
      if Creator then
        local Eids = UE4.URuntimeCommonFunctionLibrary.GetStaticCreatorChildEids(Creator)
        for j = 1, Eids:Length() do
          local Monster = Battle(self):GetEntity(Eids[j])
          if IsValid(Monster) then
            Battle(self):BattleOnDead(Monster.Eid, Monster.Eid, 0, EDeathReason.KillSelf)
          end
        end
      end
    end
  end
end

function M:OnCurWaveTimeEnd()
  self.CurWave = self.CurWave + 1
  self:StartWave()
end

function M:OnComplete()
  self:RemoveTimer("OnActiveTimeEnd")
  self:ChangeState("Manual", 0, self.CompleteStateId)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    GameState:RemoveGameModeEvent("OnDeadStaticUnit", self, self.OnMonsterDead)
  end
end

function M:ReceiveEndPlay(EndReason)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    GameState:RemoveGameModeEvent("OnDeadStaticUnit", self, self.OnMonsterDead)
  end
  self.Super.ReceiveEndPlay(self, EndReason)
end

return M
