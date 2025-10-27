local Component = Class({
  "BluePrints.Combat.Components.CharacterInitLogic"
})

function Component:GetInfoForInit()
  return {
    RoleId = self.CurrentRoleId,
    UnitId = self.UnitId,
    UnitType = self.UnitType,
    ShadowModelId = self.ShadowModelId
  }
end

function Component:InitCharacterInfo(Info)
  Info = Info or self.InfoForInit
  local InitType = Info.InitType
  if "FromCache" == InitType then
    self:GetInitLogicComp():InitFromCache(Info)
  else
    self:GetInitLogicComp():FirstInit(Info)
  end
end

function Component:IsBpbornRegionStorage()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return false
  end
  local BPBornActor = GameMode.BPBornRegionActor:FindRef(self.ManualItemId)
  return self.BpBorn and IsValid(BPBornActor)
end

function Component:CheckInitGuideType()
  local InitGuideInfo = DataMgr[self.UnitType][self.UnitId].InitGuide
  if not InitGuideInfo or not self:GetShowGuideDis(InitGuideInfo) then
    return false
  end
  return true
end

function Component:GetShowGuideDis(InitGuideInfo)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  for type, dis in pairs(InitGuideInfo) do
    if GameState.GameModeType == type then
      self.ShowGuideDistance = dis
      return true
    end
  end
  return false
end

function Component:CreateGuideHandle()
  self.FixTryToAddGuideHandle = self:AddTimer(1, self.TryToAddGuide, true)
end

function Component:StopTryToAddGuideTimer()
  if not IsValid(self) then
    self:StopAddGuideTimer()
    return true
  end
  if self:IsDead() then
    self:StopAddGuideTimer()
    return true
  end
  return false
end

function Component:CheckUnitNeedStorage()
  if self.RegionDataType and CommonUtils.HasValue(Const.RegionDataStorageType, self.RegionDataType) then
    return true
  end
  return false
end

function Component:ClearFXComponent()
  self.FXComponent:StopAllEffects(true)
  if not self.Weapons then
    return
  end
  for _, Weapon in pairs(self.Weapons) do
    Weapon.FXComponent:StopAllEffects(true)
  end
end

function Component:ServerClearMonsterExtraInfo(DestroyReason)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if self.MonAlertComponent then
    self.MonAlertComponent:TryResetCommonAlertingInfo()
  end
  self:RegionOnEMActorDestroy(GameMode)
  if self.MonEliteComponent then
    self.MonEliteComponent:ClearEliteTeamInfo()
  end
  self:ServerClearAIExtraInfo(DestroyReason)
end

function Component:ServerClearNpcExtraInfo(DestroyReason)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  self:RegionOnEMActorDestroy(GameMode)
  self:ServerClearAIExtraInfo(DestroyReason)
end

function Component:ServerClearAIExtraInfo(DestroyReason)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if CommonUtils.CheckDestroyReason(DestroyReason, "IsClearStaticCreatorRef") and self.CreatorType == "StaticCreator" then
    local Creator = GameState:GetStaticCreatorInfo(self.CreatorId, self.PrivateEnable, "", self)
    if Creator and URuntimeCommonFunctionLibrary.IsStaticCreatorValid(Creator) then
      Creator:RemoveActorToChildEids(self.Eid)
    end
  end
  if CommonUtils.CheckDestroyReason(DestroyReason, "IsMonClearBattleInfo") then
    self:SetCharacterTag("Dead")
    self:ClearCharacterBattleInfo(false, DestroyReason)
  end
  if CommonUtils.CheckDestroyReason(DestroyReason, "IsClearGuide") then
    GameState:RemoveGuideEid(self.Eid)
  end
end

function Component:RegionOnEMActorDestroy(GameMode)
  if GameMode:IsInDungeon() or not IsValid(GameMode:GetWCSubSystem()) then
    return
  end
  GameMode:GetWCSubSystem():UnregisterEntryToWorldComposition(self)
end

function Component:RemoveBuffOfInDirect()
  for i = 1, self.BuffManager.Buffs:Length() do
    local Buff = self.BuffManager.Buffs:GetRef(i)
    if Buff.SourceEid ~= self.Eid then
      self:RawRemoveBuff(Buff)
    end
  end
end

return Component
