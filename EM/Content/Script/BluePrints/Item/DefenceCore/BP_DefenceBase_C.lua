require("UnLua")
local BP_DefenceBase_C = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function BP_DefenceBase_C:AuthorityInitInfo(Info)
  self.IsActive = false
  self.SeventyEvent = true
  self.ThirtyEvent = true
  BP_DefenceBase_C.Super.AuthorityInitInfo(self, Info)
  self.RecoverTime = self.UnitParams.RecoverTime or 0
  self.HPRecover = self.UnitParams.HPRecover or 0
  self.ESRecover = self.UnitParams.ESRecover or 0
  self.ActiveRange = self.UnitParams.ActiveRange or 0
end

function BP_DefenceBase_C:OnActiveStateChange()
  if self.IsActive then
    local GameState = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(self)
    GameState:AddDefBaseInfo(self)
    self.CombatClientEffectComponent:OnActiveEffect()
  end
end

function BP_DefenceBase_C:SetActiveType()
  self.ActiveType = "DistanceAlways"
end

function BP_DefenceBase_C:ActiveOnServer(Info)
  if self.IsActive then
    self:ActiveDefence(1)
  end
end

function BP_DefenceBase_C:OnDamaged(DamageEvent)
  if not IsAuthority(self) then
    return
  end
  BP_DefenceBase_C.Super.OnDamaged(self, DamageEvent)
  local HpPercent = self:GetAttr("Hp") / self:GetAttr("MaxHp")
  if HpPercent <= 0.7 and self.SeventyEvent then
    self:TriggerGameModeEvent("OnDefenceHpSeventyPercent")
    self.SeventyEvent = false
  elseif HpPercent <= 0.3 and self.ThirtyEvent then
    self:TriggerGameModeEvent("OnDefenceHpThirtyPercent")
    self.ThirtyEvent = false
  end
end

function BP_DefenceBase_C:ActiveDefence()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if nil == GameState then
    return
  end
  local EffectiveDefence = GameState.DefBaseMap
  if self.Mesh then
    self:PlayActiveAnim()
  end
  self.CombatClientEffectComponent:OnActiveEffect()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  print(_G.LogTag, "LXZ ActiveDefence11", self:GetName(), EffectiveDefence:Length())
  if 0 == EffectiveDefence:Length() and GameMode then
    GameMode:TriggerOnDefenceCoreActive(self)
    self:OnFirstActive()
  end
  Battle(self):RemoveBuffFromTarget(self, self, 301, false, -1)
  GameState:AddDefBaseInfo(self)
end

function BP_DefenceBase_C:RegisterToGameState()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if nil == GameState then
    print(_G.LogTag, "GameState is nil")
    return
  end
  GameState:RegisterMechanism(self, self:GetUnitRealType())
end

function BP_DefenceBase_C:ShowDeath()
  BP_DefenceBase_C.Super.ShowDeath(self)
  self:PlayDeadAnim()
end

function BP_DefenceBase_C:OnDead(KillMineRoleEid, KillMineSkillId, DeathReason)
  BP_DefenceBase_C.Super.OnDead(self, KillMineRoleEid, KillMineSkillId, DeathReason)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState:SetDungeonEndReason(Const.DungeonEnd_DefenceCoreDead)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:TriggerOnDefenceCoreDead(self)
  end
  if IsStandAlone(self) or IsClient(self) then
    DebugPrint(" BP_DefenceBase_C:OnDead StandAlone or Client")
    if self.IsPetDefenceCore then
      return
    end
    local DefenceUIName = CommonConst.DungeonUINameMap[GameState.GameModeType]
    if "DungenonDefenseFloat" == DefenceUIName or "DungenonDefenseProFloat" == DefenceUIName then
      local DefenceUI = UIManager(self):GetUIObj(DefenceUIName)
      if DefenceUI then
        DefenceUI:OnDefenceCoreDead()
      end
    end
  end
  self:OnCoreDead()
end

function BP_DefenceBase_C:OnCoreDead()
  self.Overridden.OnCoreDead(self)
end

function BP_DefenceBase_C:OnEMActorDestroy(...)
  BP_DefenceBase_C.Super.OnEMActorDestroy(self, ...)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.DefBaseMap:Remove(self.Eid)
  GameState.HatredCombatProp:Remove(self.Eid)
end

function BP_DefenceBase_C:OnFirstActive()
end

function BP_DefenceBase_C:OnDefenceWaveStart()
  self.Overridden.OnDefenceWaveStart(self)
end

function BP_DefenceBase_C:OnDefenceWaveEnd()
  self.Overridden.OnDefenceWaveEnd(self)
end

function BP_DefenceBase_C:RecoverSavedData(DataTable)
  if not DataTable then
    return
  end
  for i, v in pairs(DataTable) do
    if "Attribute" == i then
      self:RecoverAttribute(v)
    else
      self[i] = v
    end
  end
end

function BP_DefenceBase_C:RecoverAttribute(DataTable)
  if not DataTable then
    return
  end
  for i, v in pairs(DataTable) do
    self:SetAttr(i, v)
  end
end

function BP_DefenceBase_C:GetDungeonSaveData()
  return {
    StateId = self.StateId,
    Attribute = {
      Hp = self:GetAttr("Hp"),
      ES = self:GetAttr("ES")
    }
  }
end

function BP_DefenceBase_C:GetGuidePos()
  if self.GuidePos then
    return self:K2_GetActorLocation() + self.GuidePos.RelativeLocation
  else
    return self:K2_GetActorLocation()
  end
end

return BP_DefenceBase_C
