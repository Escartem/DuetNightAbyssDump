require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local BP_FieldCreature_C = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function BP_FieldCreature_C:AuthorityInitInfo(Info)
  self:ReadDataMgr()
  BP_FieldCreature_C.Super.AuthorityInitInfo(self, Info)
  self:AddBuffOnBegin()
  self:NotifyFieldCover()
  if tonumber(self.ManualItemId) > 0 then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    GameState.FeildCreatureMap:Add(self.ManualItemId, self)
  end
end

function BP_FieldCreature_C:CommonInitInfo(Info)
  self:ReadDataMgr()
  if self.Z then
    self.TrapArea:K2_SetRelativeLocation(FVector(0, 0, self.Z / 2), false, nil, false)
  end
  self.bSkillUseful = false
  BP_FieldCreature_C.Super.CommonInitInfo(self, Info)
end

function BP_FieldCreature_C:TargetEnter(OverlappedComponent, Target, OtherComp, OtherBodyIndex, bFromSweep, SweepResult)
  if self.IsCastFieldCover and self:IsCastFieldCover(Target) then
    Target:FieldCoverIsHitEnter(self)
    return
  end
  if not (self.IsActive and self.bSkillUseful and Target:Cast(UE4.ACharacterBase)) or self:GetCamp() == ECampName.None then
    return
  end
  local TargetActorSign = {}
  TargetActorSign.Target = Target
  self.AllowPlayer[Target.Eid] = TargetActorSign
  local Hit, Res = self:LineTraceCheck(Target)
  if Res and not UKismetMathLibrary.EqualEqual_ObjectObject(Target, Hit.Actor) then
    self.AllowPlayer[Target.Eid].IsCover = true
    return
  end
  if self.PlayerEffect and self.PlayerEffect > 0 and self.AttackCD and self.AttackCD > 0 then
    local function UseFieldEffect(_, TargetEid)
      if not IsValid(Target) then
        Target = Battle(self):GetEntity(TargetEid)
        
        if not IsValid(Target) then
          self:RemoveTimer("UseFieldEffect" .. TargetEid)
          return
        end
      end
      local Res = self:LineTraceCheck(Target)
      if Res then
        return
      end
      self.Super.PropUseSkill(self, self.PlayerEffect, Target)
      if Target.IsDead and Target:IsDead() then
        self:RemoveTimer("UseFieldEffect" .. TargetEid)
      end
    end
    
    self:AddTimer(self.AttackCD, UseFieldEffect, true, 0, "UseFieldEffect" .. Target.Eid, nil, Target.Eid)
  end
  if self.MonEffect and self.MonEffect > 0 and self.MonAttackCD and self.MonAttackCD > 0 then
    local function UseFieldMonEffect(_, TargetEid)
      if not IsValid(Target) then
        Target = Battle(self):GetEntity(TargetEid)
        
        if not IsValid(Target) then
          self:RemoveTimer("UseFieldMonEffect" .. TargetEid)
          return
        end
      end
      local Res = self:LineTraceCheck(Target)
      if Res then
        return
      end
      self.Super.PropUseSkill(self, self.MonEffect, Target)
      if Target.IsDead and Target:IsDead() then
        self:RemoveTimer("UseFieldMonEffect" .. TargetEid)
      end
    end
    
    self:AddTimer(self.MonAttackCD, UseFieldMonEffect, true, 0, "UseFieldMonEffect" .. Target.Eid, nil, Target.Eid)
  end
  if self.SkillEnter and self.SkillEnter > 0 then
    self.Super.PropUseSkill(self, self.SkillEnter, Target)
  end
  if self.MonSkillEnter and self.MonSkillEnter > 0 then
    self.Super.PropUseSkill(self, self.MonSkillEnter, Target)
  end
end

function BP_FieldCreature_C:TargetLeave(OverlappedComponent, Target, OtherComp, OtherBodyIndex, bFromSweep, SweepResult)
  if self.IsCastFieldCover and self:IsCastFieldCover(Target) then
    Target:FieldCoverIsHitLeave(self)
    return
  end
  if not (self.IsActive and self.bSkillUseful) or not Target:Cast(UE4.ACharacterBase) then
    return
  end
  self.AllowPlayer[Target.Eid] = nil
  local Hit, Res = self:LineTraceCheck(Target)
  if Res and not UKismetMathLibrary.EqualEqual_ObjectObject(Target, Hit.Actor) then
    return
  end
  if self.PlayerEffect and self.PlayerEffect > 0 and self.AttackCD and self.AttackCD > 0 then
    self:RemoveTimer("UseFieldEffect" .. Target.Eid)
  end
  if self.MonEffect and self.MonEffect > 0 and self.MonAttackCD and self.MonAttackCD > 0 then
    self:RemoveTimer("UseFieldMonEffect" .. Target.Eid)
  end
  if self.SkillLeave and self.SkillLeave > 0 then
    self.Super.PropUseSkill(self, self.SkillLeave, Target)
  end
  if self.MonSkillLeave and self.MonSkillLeave > 0 then
    self.Super.PropUseSkill(self, self.MonSkillLeave, Target)
  end
end

function BP_FieldCreature_C:AddBuffOnBegin()
  local OutActors = self:GetTrapOverlapActors()
  for i = 1, OutActors:Length() do
    self:TargetEnter(nil, OutActors:GetRef(i))
  end
end

function BP_FieldCreature_C:GetUnitParams()
  local _Data = self:GetBattleDataInfo()
  if _Data then
    self:SetTableAttr()
  end
  local UnitData = DataMgr.Mechanism[self.UnitId]
  if not UnitData then
    return
  end
  local UnitParams = UnitData.UnitParams
  if not UnitParams then
    return
  end
  return UnitParams
end

function BP_FieldCreature_C:ReadDataMgr()
  local UnitParams = self:GetUnitParams()
  if not UnitParams then
    return
  end
  if UnitParams then
    local SkillEnterParam = "SkillEnter"
    local SkillLeaveParam = "SkillLeave"
    local MonSkillEnterParam = "MonSkillEnter"
    local MonSkillLeaveParam = "MonSkillLeave"
    local PlayerEffect = "PlayerEffect"
    local AttackCDParam = "AttackCD"
    local MonEffectParam = "MonEffect"
    local MonAttackCDParam = "MonAttackCD"
    self.SkillEnter = UnitParams[SkillEnterParam]
    self.SkillLeave = UnitParams[SkillLeaveParam]
    self.MonSkillEnter = UnitParams[MonSkillEnterParam]
    self.MonSkillLeave = UnitParams[MonSkillLeaveParam]
    self.PlayerEffect = UnitParams[PlayerEffect]
    self.AttackCD = UnitParams[AttackCDParam]
    self.MonEffect = UnitParams[MonEffectParam]
    self.MonAttackCD = UnitParams[MonAttackCDParam]
    if not self.BpBorn then
      local X = UnitParams.X or self.TrapArea:GetScaledBoxExtent().X
      local Y = UnitParams.Y or self.TrapArea:GetScaledBoxExtent().Y
      local Z = UnitParams.Z or self.TrapArea:GetScaledBoxExtent().Z
      local BoxSize = FVector(X, Y, Z)
      self.TrapArea:SetBoxExtent(BoxSize, true)
    end
  end
end

function BP_FieldCreature_C:NotifyFieldCover()
  if IsStandAlone(self) or IsClient(self) or MiscUtils.IsSimulatedProxy(self) then
    local ObjectTypes = TArray(EObjectTypeQuery)
    ObjectTypes:Add(UE4.EObjectTypeQuery.WorldStatic)
    local OutActors = TArray(AActor)
    local IngorArray = TArray(AActor)
    OutActors = UE4.UKismetSystemLibrary.ComponentOverlapActors(self.TrapArea, self:GetTransform(), ObjectTypes)
    for i = 1, OutActors:Length() do
      local TargetActor = OutActors:GetRef(i)
      if self.IsCastFieldCover and self:IsCastFieldCover(TargetActor) then
        TargetActor:FieldCoverIsHitEnter(self)
      end
    end
  end
end

function BP_FieldCreature_C:SwitchBefore()
  self.Overridden.SwitchBefore(self)
end

function BP_FieldCreature_C:SetFieldCreateMechanismInfo(TargetTrapState, TargetTrapType, TriggerBoxScale, Grade)
  local CurrentType = self.TrapType
  self.TrapType = TargetTrapType
  self.LastState = self.IsActive
  self.IsActive = TargetTrapState
  self.Grade = Grade
  self:ReadDataMgr()
  if TriggerBoxScale ~= UE4.FVector(0, 0, 0) then
    self.TrapArea:SetBoxExtent(TriggerBoxScale, true)
  end
  if self.IsActive and not self.LastState then
    self:AddBuffOnBegin()
    self:SetRegionState()
  else
    local Data = {
      TrapType = self.TrapType,
      IsActive = self.IsActive,
      Grade = self.Grade
    }
    self:UpdateRegionDataByTable(Data)
  end
end

function BP_FieldCreature_C:CleanCurrentBuff()
  if not self.AllowPlayer then
    return
  end
  for _, Target in pairs(self.AllowPlayer) do
    if self.AllowPlayer[Target.Target.Eid] and self.Grade > 0 and IsValid(Target.Target) then
      self.Super.PropUseSkill(self, self.SkillLeave, Target.Target)
    end
  end
end

function BP_FieldCreature_C:OnRep_TrapType()
  self:ReadDataMgr()
end

function BP_FieldCreature_C:GetBattleDataInfo()
  local CombatProp = DataMgr.Mechanism[self.UnitId]
  self.RoleId = CombatProp.BattleRoleId
  self.RewardId = CombatProp.RewardId
  return DataMgr.BattleMonster[self.RoleId]
end

function BP_FieldCreature_C:GetTrapOverlapActors()
  local ObjectTypes = TArray(EObjectTypeQuery)
  ObjectTypes:Add(EObjectTypeQuery.Pawn)
  local OutActors = TArray(UE4.ACharacterBase)
  OutActors = UE4.UKismetSystemLibrary.ComponentOverlapActors(self.TrapArea, self:GetTransform(), ObjectTypes)
  return OutActors
end

function BP_FieldCreature_C:ReceiveTick(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
  for _, TargetSign in pairs(self.AllowPlayer) do
    local TargetActor = TargetSign.Target
    if not Battle(self):GetEntity(_) then
      table.insert(self.SignTable, _)
    else
      local Hit, Res = self:LineTraceCheck(TargetSign.Target)
      if Res and UKismetMathLibrary.EqualEqual_ObjectObject(TargetSign.Target, Hit.Actor) and self.SkillEnter > 0 then
        if not self:EndEnterEffect(Target) then
          self.Super.PropUseSkill(self, self.SkillEnter, TargetSign.Target)
        end
        self.AllowPlayer[TargetSign.Target.Eid].IsCover = false
      elseif self.AllowPlayer[TargetSign.Target.Eid] and not self.AllowPlayer[TargetSign.Target.Eid].IsCover and self.SkillLeave > 0 then
        self.Super.PropUseSkill(self, self.SkillLeave, TargetSign.Target)
        self.AllowPlayer[TargetSign.Target.Eid].IsCover = true
        self.AllowPlayer[TargetSign.Target.Eid].IsUseLeave = false
      end
    end
  end
  for Key, Eid in ipairs(self.SignTable) do
    self.AllowPlayer[Eid] = nil
  end
  for Key, Eid in pairs(self.SignTable) do
    self.SignTable[Key] = nil
  end
end

function BP_FieldCreature_C:EndEnterEffect(Target)
  local Player = Target.Target
  if Player:Cast(UE4.APlayerCharacter) and Player:GetAttr("ES") <= 0 and self.Grade > 0 then
    local UnitData = DataMgr.Mechanism[self.UnitId]
    if not UnitData then
      return false
    end
    local UnitParams = UnitData.UnitParams
    local SkillEnterParam = "SkillEffect"
    local SkillEnter = UnitParams[SkillEnterParam]
    if SkillEnter and not Target.IsHitBack then
      Target.IsHitBack = true
      self.Super.PropUseSkill(self, self.SkillLeave, Player)
      self.Super.PropUseSkill(self, SkillEnter, Player)
      
      local function func()
        if Target then
          Target.IsHitBack = false
        end
      end
      
      self:AddTimer(5, func)
      return true
    end
  end
  return false
end

function BP_FieldCreature_C:ShowDeath()
  BP_FieldCreature_C.Super.ShowDeath(self)
  self:EMActorDestroy(EDestroyReason.MechanismDead)
end

function BP_FieldCreature_C:ReceiveBeginPlay()
  BP_FieldCreature_C.Super.ReceiveBeginPlay(self)
  self.PrimaryActorTick.bCanEverTick = true
  self.PrimaryActorTick.TickInterval = 0.2
  self.TrapArea.OnComponentBeginOverlap:Add(self, self.TargetEnter)
  self.TrapArea.OnComponentEndOverlap:Add(self, self.TargetLeave)
  self.AllowPlayer = {}
  self.SignTable = {}
end

function BP_FieldCreature_C:CreateRegionData()
  BP_FieldCreature_C.Super.CreateRegionData(self)
end

function BP_FieldCreature_C:RecoverSavedData(DataTable)
  BP_FieldCreature_C.Super.RecoverSavedData(self, DataTable)
  self:ReadDataMgr()
end

function BP_FieldCreature_C:CheckUnitNeedStorage()
  self.LastState = self.LastState or self.TrapType
  return self.TrapType ~= ETrapType.TrapNone and CurrentState ~= self.TrapType
end

function BP_FieldCreature_C:SetActiveType()
  self.ActiveType = "Manual"
end

function BP_FieldCreature_C:SetSkillUseful(bUseful)
  print(_G.LogTag, "LXZ SetSkillUseful", bUseful)
  self.bSkillUseful = bUseful
end

return BP_FieldCreature_C
