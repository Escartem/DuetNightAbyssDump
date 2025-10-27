require("UnLua")
local BP_CombatItemBase_C = Class({
  "BluePrints.Item.SceneItemBase"
})
BP_CombatItemBase_C._components = {
  "BluePrints.Item.Components.MechanismMovementComponent",
  "BluePrints.Item.Components.DistanceCheck"
}
local MechanismStateCpp = true

function BP_CombatItemBase_C:OnEMActorDestroy(DestroyReason)
  BP_CombatItemBase_C.Super.OnEMActorDestroy(self, DestroyReason)
  if IsStandAlone(self) or IsDedicatedServer(self) then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if CommonUtils.CheckDestroyReason(DestroyReason, "IsTriggerDestroyEvent") then
      GameMode:TriggerEMActorDestoryEvent(nil, self)
    end
    if self.Data and self.Data.GuideInactive then
      GameState:RemoveGuideEid(self.Eid)
    end
  end
end

function BP_CombatItemBase_C:PreInitInfo(Info)
  BP_CombatItemBase_C.Super.PreInitInfo(self, Info)
  if not self.Data then
    assert(self.Data, "CombatItemBase Can't find in Table, UnitId: " .. Info.UnitId .. " UnitType: " .. Info.UnitType)
    return
  end
  self.UnitParams = self.Data.UnitParams or {}
  self.UnitName = GText(self.Data.UnitName) or self.Data.UnitName
  self.ModelId = self.Data.ModelId
  self:UpdateBluePrintParams()
end

function BP_CombatItemBase_C:CommonInitInfo(Info)
  BP_CombatItemBase_C.Super.CommonInitInfo(self, Info)
  self.ActorLocation = self:K2_GetActorLocation()
  self:InitBattleInfo()
  self:RegisterToGameState()
  self:InitComponent(self)
  self:CheckNeedHide()
  self:SetLightingChannels()
end

function BP_CombatItemBase_C:AuthorityInitInfo(Info)
  BP_CombatItemBase_C.Super.AuthorityInitInfo(self, Info)
  self:AdjustLocation(Info)
  if 0 ~= self.SourceEid and self.RegionDataType ~= ERegionDataType.RDT_None then
    GWorld.logger.errorlog("Eid = " .. tostring(self.Eid) .. "\231\154\132\230\156\186\229\133\179 RegionDataType\228\184\141\228\184\186None, \229\143\175\232\131\189\229\175\188\232\135\180\230\156\186\229\133\179\230\129\162\229\164\141\228\184\164\228\187\189")
  end
end

function BP_CombatItemBase_C:ClientInitInfo(Info)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    GameState:TryRegisterFirstSeeMehcanism(self.UnitId, self.Eid)
  end
  EventManager:AddEvent(EventID.OnArtLevelLoaded, self, self.OnArtLevelLoaded)
end

function BP_CombatItemBase_C:InitComponent(Info)
  self.CombatClientEffectComponent:InitComponent()
  if self.DefaultInteractiveComponent then
    self.DefaultInteractiveComponent.bCanUsed = false
    self.DefaultInteractiveComponent.IsDefault = true
    self.InteractiveComponents:Clear()
    self.InteractiveComponents:Add(self.DefaultInteractiveComponent)
    self.ChestInteractiveComponent = self.DefaultInteractiveComponent
  end
  if not MechanismStateCpp then
    self.CombatStateChangeComponent:InitComponent_Lua()
  else
    self.CombatStateChangeComponent:InitComponent()
  end
  if self.NeedNavModifier then
    self:AddNavModifier()
  end
end

function BP_CombatItemBase_C:CheckNeedHide()
  local ShowConditionId = self.Data.ShowConditionId
  local Avatar = GWorld:GetAvatar()
  if not (ShowConditionId and Avatar) or ConditionUtils.CheckCondition(Avatar, ShowConditionId) then
    return
  end
  self:HideMechanism(true, "Condition")
end

function BP_CombatItemBase_C:CreateRegionData()
  self.RegionData = {
    StateId = self.StateId
  }
end

function BP_CombatItemBase_C:CheckUnitNeedStorage()
  if self.RegionDataType and self.RegionDataType > 0 and self.RegionDataType ~= ERegionDataType.RDT_HardBossData and self.RegionDataType ~= ERegionDataType.RDT_QuestData then
    return true
  end
  return false
end

function BP_CombatItemBase_C:SetActorHideTag(HideTag, Invisible)
  if self.HideTags == nil then
    self.HideTags = {}
  end
  if Invisible and self.HideTags[HideTag] then
    return
  end
  if Invisible then
    self.HideTags[HideTag] = 1
  else
    self.HideTags[HideTag] = nil
  end
  if IsClient(self) or IsStandAlone(self) then
    local Hide = not IsEmptyTable(self.HideTags)
    self:SetActorHiddenInGame(Hide)
  end
end

function BP_CombatItemBase_C:HideMechanism(NeedCallBack, Reason, AlwaysShow)
  local CompArray = self:K2_GetComponentsByClass(UShapeComponent:StaticClass())
  for i, v in pairs(CompArray) do
    v:SetCollisionEnabled(0)
  end
  if not AlwaysShow then
    self:SetActorHideTag(Reason, true)
    local MeshCompArray = self:K2_GetComponentsByClass(UMeshComponent:StaticClass())
    for i, v in pairs(MeshCompArray) do
      v:SetCollisionEnabled(0)
    end
  end
  if NeedCallBack then
    EventManager:AddEvent(EventID.ConditionComplete, self, self.ShowMechanismWithCondition)
  end
end

function BP_CombatItemBase_C:ShowMechanismWithCondition(ShowConditionId)
  if ShowConditionId ~= self.Data.ShowConditionId then
    return
  end
  local CompArray = self:K2_GetComponentsByClass(UShapeComponent:StaticClass())
  for i, v in pairs(CompArray) do
    v:SetCollisionEnabled(1)
  end
  local MeshCompArray = self:K2_GetComponentsByClass(UMeshComponent:StaticClass())
  for i, v in pairs(MeshCompArray) do
    v:SetCollisionEnabled(1)
  end
  EventManager:RemoveEvent(EventID.ConditionComplete, self)
  self:SetActorHideTag("Condition", false)
end

function BP_CombatItemBase_C:ShowMechanism(Reason)
  local CompArray = self:K2_GetComponentsByClass(UShapeComponent:StaticClass())
  for i, v in pairs(CompArray) do
    v:SetCollisionEnabled(1)
  end
  local MeshCompArray = self:K2_GetComponentsByClass(UMeshComponent:StaticClass())
  for i, v in pairs(MeshCompArray) do
    v:SetCollisionEnabled(1)
  end
  self:SetActorHideTag(Reason, false)
end

function BP_CombatItemBase_C:SetLifeTime(LifeTime, Reason)
  DebugPrint("ZJT_ \229\189\147\229\137\141\230\173\187\228\186\161\231\154\132\230\156\186\229\133\179\229\144\141\231\167\176\228\184\186\239\188\154 ", self:GetName(), self.UnitType, LifeTime, Reason, self.IsCache)
  if self.IsCache then
    return
  end
  
  local function TryDestroy()
    self:EMActorDestroy(EDestroyReason.MechanismLifeTime)
  end
  
  self:AddTimer(LifeTime, TryDestroy, false)
end

function BP_CombatItemBase_C:SetCollisionType_Lua(ComponentName, ChannelIndex, Response, Reset)
  if Reset then
    self[ComponentName]:SetCollisionResponseToAllChannels(ECollisionResponse.ECR_Ignore)
  end
  self[ComponentName]:SetCollisionResponseToChannel(ChannelIndex, Response)
end

function BP_CombatItemBase_C:GetCurrentModelInfo()
  if self.ModelId == nil then
    return nil
  end
  return DataMgr.Model[self.ModelId]
end

function BP_CombatItemBase_C:GetFXMesh()
  return self.Mesh or self.RootComponent
end

function BP_CombatItemBase_C:GetUnitRealType()
  local Res
  if DataMgr.Mechanism[self.UnitId] then
    Res = DataMgr.Mechanism[self.UnitId].UnitRealType
  end
  return Res or ""
end

function BP_CombatItemBase_C:TriggerSource(GamePlayType)
  if 0 ~= self.SourceEid then
    local Source = Battle(self):GetEntity(self.SourceEid)
    if not GamePlayType or Source.GamePlayType == GamePlayType then
      Source:TriggerByChild(self.Eid)
    end
  end
end

function BP_CombatItemBase_C:TriggerFallingCallable()
  DebugPrint("OtherActor is Falling Dead. ActorName: ", self:GetName(), ", UnitId: ", self.UnitId, ", Eid: ", self.Eid, ", CreatorId: ", self.CreatorId, " CreatorType: ", self.CreatorType, ", BornPos: ", self.BornPos)
  self:SetLifeTime(1.0, EDeathReason.TriggerFalling)
end

function BP_CombatItemBase_C:TriggerByChild()
  print(_G.LogTag, "Error: Use CombatItemBase TriggerByChild, Check definition in code")
end

function BP_CombatItemBase_C:SetVariableBool(VariableName, Variable, PlayerEid)
  local Player = Battle(self):GetEntity(PlayerEid)
  if not IsValid(Player) then
    return
  end
  Player.RPCComponent:SetVariableBool(VariableName, Variable, self.Eid)
end

function BP_CombatItemBase_C:PlaySound(EventName, key, SoundParam)
  if EventName then
    AudioManager(self):PlayFMODSound(self, nil, EventName, key)
  end
  if nil ~= SoundParam then
    AudioManager(self):SetEventSoundParam(self, key, SoundParam)
  end
end

function BP_CombatItemBase_C:UpdateBluePrintParams()
  if not self.Data.BluePrintParams then
    return
  end
  for i, v in pairs(self.Data.BluePrintParams) do
    if self[i] then
      self[i] = v
    end
  end
end

function BP_CombatItemBase_C:AdjustLocation(Info)
  if not self.Mesh or self.BpBorn then
    return
  end
  local OldLoc
  local GameMode = UGameplayStatics.GetGameMode(self)
  self:AdjustLocationCPP(Info.Creator, Info.IntParams:Find("RandomRuleId"), Info.IntParams:Find("RandomCreatorId"), self.Mesh.RelativeLocation.Z)
end

function BP_CombatItemBase_C:RegisterToGameState()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if nil == GameState then
    print(_G.LogTag, "Error, GameState is nil")
    return
  end
  GameState:RegisterMechanism(self, self:GetUnitRealType())
end

function BP_CombatItemBase_C:TriggerGameModeEvent(Reason)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:TriggerGameModeEvent(Reason)
end

function BP_CombatItemBase_C:ActiveCombat()
  self.IsActive = true
  self:ActiveOnServer()
  self:OnActiveStateChange()
end

function BP_CombatItemBase_C:DeActiveCombat()
  self.IsActive = false
  self:DeActive()
  self:OnActiveStateChange()
end

function BP_CombatItemBase_C:DeActive()
end

function BP_CombatItemBase_C:ActiveOnServer()
end

function BP_CombatItemBase_C:OnActiveStateChange()
  if self.IsActive then
    self.CombatClientEffectComponent:OnActiveEffect()
  else
    self.CombatClientEffectComponent:OnDeactiveEffect()
  end
end

function BP_CombatItemBase_C:UpdateRegionStateId(NewStateId)
  if self.BpBorn and not self:CheckManuItemRegionStorage() then
    return
  end
  if not self.RegionData or self.RegionData.StateId == nil then
    return
  end
  self.RegionData.StateId = NewStateId
  local GameMode = UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:GetRegionDataMgrSubSystem():UpdateRegionActorData(self, self.RegionData)
  end
end

function BP_CombatItemBase_C:RecoverBpBornData()
  self:ChangeState("Recover", 0, 0)
end

function BP_CombatItemBase_C:ChangeState(Type, PlayerId, NextState)
  if not (IsAuthority(self) or IsStandAlone(self)) or not self.InitSuccess then
    return
  end
  if MechanismStateCpp then
    self.CombatStateChangeComponent:TryChangeState("ChangeState_" .. Type .. "_CPP", PlayerId, NextState)
  else
    self.CombatStateChangeComponent["ChangeState_" .. Type](self.CombatStateChangeComponent, PlayerId, NextState)
  end
end

function BP_CombatItemBase_C:OnRep_StateId()
  if self.InitSuccess then
    if not MechanismStateCpp then
      self.CombatStateChangeComponent:ClientChangeToState_Lua(self.StateId)
    else
      self.CombatStateChangeComponent:ClientChangeToState(self.StateId)
    end
  else
    local function Callback()
      if self.InitSuccess then
        if not MechanismStateCpp then
          self.CombatStateChangeComponent:ClientChangeToState_Lua(self.StateId)
        else
          self.CombatStateChangeComponent:ClientChangeToState(self.StateId)
        end
        self:RemoveTimer("OnRep_StateId")
      end
    end
    
    self:AddTimer(0.1, Callback, true, 0, "OnRep_StateId", false, self, self.StateId)
  end
end

function BP_CombatItemBase_C:TriggerBluePrintEvent_Lua(EventName)
  if not IsAuthority(self) or IsStandAlone(self) then
    self[EventName](self)
  end
end

function BP_CombatItemBase_C:GetDungeonSaveData()
  return {
    StateId = self.StateId
  }
end

function BP_CombatItemBase_C:AddTN(ChangeTN)
  local TN = math.max(0, math.min(self:GetAttr("MaxTN"), self:GetAttr("TN") + ChangeTN))
  self:SetAttr("TN", TN)
end

function BP_CombatItemBase_C:CreateSpecialMonster(RuleId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not IsValid(GameMode) or GameMode:IsInDungeon() then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local CombatItemBaseLoc = FVector(self:K2_GetActorLocation().X, self:K2_GetActorLocation().Y, self:K2_GetActorLocation().Z)
  
  local function Cb(ErrCode)
    if ErrCode ~= ErrorCode.RET_SUCCESS then
      DebugPrint("ERROR! \230\156\186\229\133\179\229\136\155\229\187\186\231\137\185\230\174\138\230\128\170\229\164\177\232\180\165:   ", ErrorCode:Name(ErrCode))
      return
    end
    local SpawnLocationType = DataMgr.SpecialMonsterSpawn[RuleId].SpawnLocation
    if "Local" == SpawnLocationType then
      local Context = AEventMgr.CreateUnitContext()
      Context.UnitType = "Monster"
      Context.UnitId = DataMgr.SpecialMonsterSpawn[RuleId].UnitId
      Context.Loc = CombatItemBaseLoc
      Context.MonsterSpawn = GameMode.FixedMonsterSpawn
      Context.IntParams:Add("Level", GameMode:GetGameModeLevel())
      GameMode.EMGameState.EventMgr:CreateUnitNew(Context, false)
    else
      local Strs = Split(SpawnLocationType, ":")
      if "Offvision" == Strs[1] then
        local Offset = tonumber(Strs[2])
        local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
        local Forward = Player.CharCameraComponent:GetForwardVector()
        local PlayerPos = Player:K2_GetActorLocation()
        local Center = PlayerPos - Forward * (Offset / 2 + 100)
        local Radius = Offset / 2 - 100
        local NavLocation = FVector(0, 0, 0)
        local HasNav = UE4.URuntimeCommonFunctionLibrary.GetRandomReachablePointInRadius(NavLocation, Center, Radius)
        if HasNav then
          local Context = AEventMgr.CreateUnitContext()
          Context.UnitType = "Monster"
          Context.UnitId = DataMgr.SpecialMonsterSpawn[RuleId].UnitId
          Context.Loc = NavLocation
          Context.MonsterSpawn = GameMode.FixedMonsterSpawn
          Context.IntParams:Add("Level", GameMode:GetGameModeLevel())
          GameMode.EMGameState.EventMgr:CreateUnitNew(Context, false)
        else
          DebugPrint("=====================CreateSpecialMonster==No Vaild NavLocation")
        end
      end
    end
  end
  
  Avatar:TrySpawnSpecialMonster(RuleId, Cb)
end

function BP_CombatItemBase_C:SetLightingChannels()
  local Comps = self:K2_GetComponentsByClass(USkeletalMeshComponent:StaticClass())
  for i, v in pairs(Comps) do
    v:SetLightingChannels(true, false, false)
  end
end

function BP_CombatItemBase_C:CheckCanInteractive(Player)
  return not self.ChestInteractiveComponent:IsForbidden(Player)
end

function BP_CombatItemBase_C:CheckMontageInteractive()
  if not self.ChestInteractiveComponent then
    return false
  end
  if not self.ChestInteractiveComponent.MontageName then
    return false
  end
  return true
end

function BP_CombatItemBase_C:CanDungeonSave()
  return true
end

function BP_CombatItemBase_C:OnArtLevelLoaded(LevelId)
end

function BP_CombatItemBase_C:ReceiveEndPlay(Reason)
  EventManager:RemoveEvent(EventID.OnArtLevelLoaded, self)
  BP_CombatItemBase_C.Super.ReceiveEndPlay(self, Reason)
end

AssembleComponents(BP_CombatItemBase_C)
return BP_CombatItemBase_C
