local BP_TrollyWall_C = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function BP_TrollyWall_C:CommonInitInfo(Info)
  BP_TrollyWall_C.Super.CommonInitInfo(self, Info)
  self.InitHandle = self:AddTimer(0.5, self.GetTrolly, true)
  self.bCrashed = false
end

function BP_TrollyWall_C:OnActorReady(Info)
  if IsAuthority(self) then
    self._RegisterOnCharacterDead = true
    self.BattleEvent.AfterBeCutToughness:Add(self, self.AfterBeCutToughness)
    self.BattleEvent.OnToughnessToZero:Add(self, self.OnToughnessToZeroCallback)
  end
end

function BP_TrollyWall_C:OnToughnessToZeroCallback()
  self:OnToughnessToZero_CPP()
end

function BP_TrollyWall_C:OnToughnessToZero()
  if IsAuthority(self) then
    self.BattleEvent.AfterBeCutToughness:Remove(self, self.AfterBeCutToughness)
    self.BattleEvent.OnToughnessToZero:Remove(self, self.OnToughnessToZero_CPP)
  end
  if IsClient(self) or IsStandAlone(self) then
    self:ShowDeath()
    self.Overridden.OnToughnessToZero(self)
  end
  self:EMActorDestroy(EDestroyReason.MechanismDead)
end

function BP_TrollyWall_C:AfterBeCutToughness(Target, Source, Skill, BeforeTN, AfterTN, SubTN)
  if 0 ~= AfterTN then
    self:OnNormalDamage()
  else
    self:OnNormalDead()
  end
end

function BP_TrollyWall_C:OnCrashed()
  self.bCrashed = true
  AudioManager(self):PlayFMODSound(self, nil, self.OnCrashedSoundPath, "OnTrollyWallCrashed")
end

function BP_TrollyWall_C:OnNormalDead()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.RaplacePathMap:Add(self.CurrentPathIndex, self.ReplacePathIndex)
  if self.Trolly then
    self.Trolly.CurrentWall = nil
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode then
      GameMode:TriggerGameModeEvent("OnWallDead", self)
    end
  end
end

function BP_TrollyWall_C:OnNormalDamage()
  if self.bCrashed then
    self.Trolly:Stop(self)
  end
end

function BP_TrollyWall_C:GetTrolly()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState.DefBaseMap:Length() > 1 then
    print(_G.LogTag, "Error: Level has more than two Trolly")
  end
  if GameState.DefBaseMap:Length() < 1 then
    print(_G.LogTag, "Error: Level has no Trolly")
  end
  for i, Trolly in pairs(GameState.DefBaseMap) do
    self.Trolly = Trolly
    self:RemoveTimer(self.InitHandle)
    break
  end
end

return BP_TrollyWall_C
