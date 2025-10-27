local Component = {}

function Component:ReceiveBeginPlay()
  EventManager:AddEvent(EventID.TalkPauseGame, self, self.ClearPauseRemovableCreature)
  EventManager:AddEvent(EventID.TalkResumeGame, self, self.ResetPauseCreature)
end

function Component:ReceiveEndPlay()
  EventManager:RemoveEvent(EventID.TalkPauseGame, self)
  EventManager:RemoveEvent(EventID.TalkResumeGame, self)
end

function Component:ClearPauseRemovableCreature()
  local Entities = self:GetAllEntities()
  for Eid, Ent in pairs(Entities) do
    if Ent and Ent:IsSkillCreature() then
      Ent:ClearPauseRemovableCreature()
    end
  end
end

function Component:ResetPauseCreature()
  local Entities = self:GetAllEntities()
  for Eid, Ent in pairs(Entities) do
    if Ent and Ent:IsSkillCreature() then
      Ent:ResetPauseCreature()
    end
  end
end

function Component:TargetFilterAndSetEndHitLocationOnFiringRay(SkillCreatureData, BornLocation, Direction)
  local CreatureConfig = DataMgr.RayCreature[SkillCreatureData.CreatureId]
  local RayCreatureConfig = CreatureConfig
  local Source = SkillCreatureData.Source
  local RayEndLoc = SkillCreatureData.RayEndLoc
  local Distance = SkillCreatureData.Distance
  local HitOthers = RayCreatureConfig.HitOthers or {
    0,
    0,
    0
  }
  local HitResults = TArray(FHitResult)
  local HitLocation = BornLocation + Direction * Distance
  local RayHitLocation
  if RayCreatureConfig.Radius then
    local RayTargetLocation = BornLocation + Direction * RayCreatureConfig.Radius + Direction * Distance
    UE4.UKismetSystemLibrary.SphereTraceMulti(Source, BornLocation + Direction * RayCreatureConfig.Radius, RayTargetLocation, RayCreatureConfig.Radius, ETraceTypeQuery.TraceCreatureHit, false, nil, Const.IsShowRayCreature and 2 or 0, HitResults, true)
  else
    UE4.UKismetSystemLibrary.LineTraceMulti(Source, BornLocation, HitLocation, ETraceTypeQuery.TraceCreatureHit, false, nil, Const.IsShowRayCreature and 2 or 0, HitResults, true)
  end
  local RealHitResult = TArray(FHitResult)
  local EidMap = {}
  local FinalHitComponent
  for Index = 1, HitResults:Length() do
    local HitResult = HitResults:GetRef(Index)
    local HitActor = HitResult.Actor
    local HitComponent = HitResult.Component
    local IsTarget = CommonUtils.CheckIsTarget(HitActor)
    local IsStopAddHitList = false
    if not self:IsValidOnCreatureOverlap(HitActor, HitComponent, 0) then
    elseif HitActor.Eid and EidMap[HitActor.Eid] then
    else
      if IsTarget then
        local ActorLocation = HitResult.Actor:K2_GetActorLocation()
        local TBDirection = FVector(HitResult.Location.X, HitResult.Location.Y, HitResult.Location.Z) - BornLocation
        TBDirection:Normalize()
        local FinalLocation = UE4.UKismetMathLibrary.FindClosestPointOnLine(ActorLocation, HitResult.Location, TBDirection)
        if HitActor:IsEnemy(Source) and 1 == HitOthers[1] then
          IsStopAddHitList = true
          HitLocation = FinalLocation
        elseif HitActor:IsFriend(Source) and 1 == HitOthers[2] then
          IsStopAddHitList = true
          HitLocation = FinalLocation
        end
        RayHitLocation = FinalLocation
      elseif not IsTarget then
        if 1 == HitOthers[3] then
          HitLocation = HitResult.Location
          IsStopAddHitList = true
        end
        RayHitLocation = HitResult.Location
      end
      FinalHitComponent = HitResult.Component
      RealHitResult:Add(HitResult)
      if IsStopAddHitList then
        break
      end
    end
  end
  if RayEndLoc then
    Source:SetSaveLoc(HitLocation, "")
  end
  return RealHitResult, RayHitLocation, FinalHitComponent
end

function Component:ExecuteRaySkillEffect(SkillCreatureData, OtherActor, RayHitLocation, HitComponent)
  local Source = SkillCreatureData.Source
  local CreatureConfig = DataMgr.RayCreature[SkillCreatureData.CreatureId]
  local MultiShootValue = SkillCreatureData.MultiShootValue
  local Skill = SkillCreatureData.Skill
  local SkillLevelInfo = SkillCreatureData.SkillLevelInfo
  local SkillLevel = SkillLevelInfo and SkillLevelInfo.SkillLevel
  local SkillGrade = SkillLevelInfo and SkillLevelInfo.SkillGrade
  local IsTarget = CommonUtils.CheckIsTarget(OtherActor) or OtherActor and OtherActor.bIsDanmakuTemplate
  local IsScene = not IsTarget and (not OtherActor or not OtherActor.bIsDanmakuTemplate)
  local Effects
  if CreatureConfig.HitEnemy and IsTarget and Source:IsEnemy(OtherActor) then
    Effects = CreatureConfig.HitEnemy
  elseif CreatureConfig.HitFriend and IsTarget and Source:IsFriend(OtherActor) then
    Effects = CreatureConfig.HitFriend
  elseif CreatureConfig.HitScene and IsScene then
    Effects = CreatureConfig.HitScene
    OtherActor = nil
  end
  if not Effects then
    return
  end
  local RealSource = Source
  if CreatureConfig.DamageSource and 1 == CreatureConfig.DamageSource then
    RealSource = RealSource:GetRootSource()
    if not RealSource then
      return
    end
  end
  if CreatureConfig.SkillEffectsDelayTime and CreatureConfig.SkillEffectsDelayTime > 0 then
    RealSource:AddTimer_Combat(CreatureConfig.SkillEffectsDelayTime, function()
      local CollisionName = HitComponent and UE4.UKismetSystemLibrary.GetObjectName(HitComponent) or ""
      RealSource:SetString("CollisionName", CollisionName)
      local SkillEffectInfo = FSkillEffectInfo()
      SkillEffectInfo.IsLaunchRayCreature = true
      SkillEffectInfo.MultiShootValue = MultiShootValue
      SkillEffectInfo.RayHitLoc = RayHitLocation
      for _, EffectId in pairs(Effects) do
        local SkillLevelStruct = FSkillLevelStruct()
        SkillLevelStruct.SkillLevel = SkillLevel
        SkillLevelStruct.SkillGrade = SkillGrade
        self:FinalExecuteSkillEffect(RealSource, EffectId, OtherActor, Skill, SkillLevelStruct, SkillEffectInfo)
      end
    end)
  else
    local CollisionName = HitComponent and UE4.UKismetSystemLibrary.GetObjectName(HitComponent) or ""
    RealSource:SetString("CollisionName", CollisionName)
    local SkillEffectInfo = FSkillEffectInfo()
    SkillEffectInfo.IsLaunchRayCreature = true
    SkillEffectInfo.MultiShootValue = MultiShootValue
    SkillEffectInfo.RayHitLoc = RayHitLocation
    for _, EffectId in pairs(Effects) do
      local SkillLevelStruct = FSkillLevelStruct()
      SkillLevelStruct.SkillLevel = SkillLevel
      SkillLevelStruct.SkillGrade = SkillGrade
      self:FinalExecuteSkillEffect(RealSource, EffectId, OtherActor, Skill, SkillLevelStruct, SkillEffectInfo)
    end
  end
end

function Component:FiringRaySkillCreature(SkillCreatureData)
  local CreatureId = SkillCreatureData.CreatureId
  local CreatureConfig = DataMgr.RayCreature[CreatureId]
  local Source = SkillCreatureData.Source
  local CreateRayActor = CreatureConfig.CreateRayActor
  local AimUpdateEndLoc = CreatureConfig.AimUpdateEndLoc
  local BornLocation = self:CalcRayBornLocation(Source, CreatureId)
  SkillCreatureData.BornLocation = BornLocation
  local Distance = SkillCreatureData.Distance
  if CreatureConfig.AllowAttackRangeModify then
    local LocalRanges = {1}
    self:ApplyRangeModify(SkillCreatureData.Source, {
      AttackRangeType = CreatureConfig.AttackRangeType
    }, LocalRanges)
    Distance = Distance * LocalRanges[1]
  end
  if CreatureConfig.AllowSkillRangeModify then
    local LocalRanges = {1}
    self:ApplyRangeModify(SkillCreatureData.Source, {AllowSkill = 1}, LocalRanges)
    Distance = Distance * LocalRanges[1]
  end
  SkillCreatureData.Distance = Distance
  local Strategy = 4
  if AimUpdateEndLoc and CreateRayActor then
    Strategy = 1
  elseif AimUpdateEndLoc and not CreateRayActor then
    Strategy = 2
  elseif not AimUpdateEndLoc and CreateRayActor then
    Strategy = 3
  elseif not AimUpdateEndLoc and not CreateRayActor then
    Strategy = 4
  end
  self["RayStrategy" .. Strategy](self, SkillCreatureData)
end

function Component:RayStrategy1(SkillCreatureData)
  local RayCreature = self:CreateRayCreature(SkillCreatureData, false, false)
  RayCreature:InitRaySkillEffectInfo(SkillCreatureData.MultiShootValue, SkillCreatureData.Skill, SkillCreatureData.SkillLevelInfo)
  RayCreature:RefreshTargetEffect()
end

function Component:RayStrategy2(SkillCreatureData)
  local Source = SkillCreatureData.Source
  local CreatureId = SkillCreatureData.CreatureId
  local Distance = SkillCreatureData.Distance
  local BornLocation = SkillCreatureData.BornLocation
  local TargetEid = SkillCreatureData.TargetEid
  local RayCreature = self:CreateRayCreature(SkillCreatureData, true, false)
  Distance = math.modf(Distance)
  local DesireTargetDirection
  if SkillCreatureData.InterpRotationOffset and RayCreature and not UE4.UKismetMathLibrary.Vector_IsZero(RayCreature.FinalRayDirection) then
    DesireTargetDirection = RayCreature.FinalRayDirection
  else
    DesireTargetDirection = SkillCreatureData.BornDirection ~= Const.ZeroVector and SkillCreatureData.BornDirection or self:CalcRayTargetDirection(Source, CreatureId, BornLocation, Distance, TargetEid, "")
  end
  local HitResults, RayHitLocation, HitComponent = self:TargetFilterAndSetEndHitLocationOnFiringRay(SkillCreatureData, BornLocation, DesireTargetDirection)
  for i = 1, HitResults:Length() do
    self:ExecuteRaySkillEffect(SkillCreatureData, HitResults[i].Actor, RayHitLocation, HitComponent)
  end
end

function Component:RayStrategy3(SkillCreatureData)
  local RayCreature = self:CreateRayCreature(SkillCreatureData, false, true)
  RayCreature:InitRaySkillEffectInfo(SkillCreatureData.MultiShootValue, SkillCreatureData.Skill, SkillCreatureData.SkillLevelInfo)
  RayCreature:RefreshTargetEffect()
end

function Component:RayStrategy4(SkillCreatureData)
  local Source = SkillCreatureData.Source
  local CreatureId = SkillCreatureData.CreatureId
  local BornLocation = SkillCreatureData.BornLocation
  local Distance = SkillCreatureData.Distance
  local TargetEid = SkillCreatureData.TargetEid
  Distance = math.modf(Distance)
  local DesireTargetDirection = self:CalcRayTargetDirection(Source, CreatureId, BornLocation, Distance, TargetEid, "")
  local HitResults, RayHitLocation, HitComponent = self:TargetFilterAndSetEndHitLocationOnFiringRay(SkillCreatureData, BornLocation, DesireTargetDirection)
  for i = 1, HitResults:Length() do
    self:ExecuteRaySkillEffect(SkillCreatureData, HitResults[i].Actor, RayHitLocation, HitComponent)
  end
end

return Component
