local SkillEffectClass = {}

function SkillEffectClass.New(Source, EffectId, TargetFilterResult, Location, Skill, SkillLevelSource, SkillEffectInfo, SourceComponent)
  if not IsValid(Source) then
    return
  end
  local EffectInfo = DataMgr.SkillEffects[EffectId]
  assert(EffectInfo, "\230\138\128\232\131\189\230\149\136\230\158\156\231\188\150\229\143\183\229\161\171\229\134\153\233\148\153\232\175\175:" .. tostring(EffectId))
  local Effects = EffectInfo.TaskEffects
  if not IsValid(Skill) then
    Skill = nil
  end
  SkillLevelSource = SkillLevelSource or Skill
  local HitTargetsArray = TArray(0)
  local FirstTargetEid
  if TargetFilterResult.HitTargets then
    for _, Eid in ipairs(TargetFilterResult.HitTargets) do
      HitTargetsArray:Add(Eid)
      FirstTargetEid = FirstTargetEid or Eid
    end
  end
  local DeadTargetsArray = TArray(0)
  if TargetFilterResult.DeadTargets then
    for _, Eid in ipairs(TargetFilterResult.DeadTargets) do
      DeadTargetsArray:Add(Eid)
    end
  end
  local CollisionNamesMap = TMap(0, FName)
  for Eid, CollisionName in pairs(TargetFilterResult.CollisionNames or {}) do
    CollisionNamesMap:Add(Eid, CollisionName)
  end
  local SkillEffectStruct = {
    Source = Source,
    EffectId = EffectId,
    Result = TargetFilterResult,
    Location = Location,
    Skill = Skill,
    SkillLevelSource = SkillLevelSource,
    EffectInfo = EffectInfo,
    Effects = Effects,
    HitTargets = TargetFilterResult.HitTargets,
    DeadTargets = TargetFilterResult.DeadTargets,
    SocketPositions = TargetFilterResult.SocketPositions,
    ControlForwardVector = TargetFilterResult.ControlForwardVector,
    HitPosition = TargetFilterResult.HitPosition,
    CollisionNames = TargetFilterResult.CollisionNames or {},
    PartEidMap = TargetFilterResult.PartEidMap or {},
    DontCullPartTarget = TargetFilterResult.DontCullPartTarget or false,
    UniqueId = nil,
    CanExecute = not not Effects,
    FirstTargetEid = FirstTargetEid,
    SkillEffectInfo = SkillEffectInfo,
    CppEffectStruct = FSkillEffectStruct(EffectId, HitTargetsArray, DeadTargetsArray, SkillEffectInfo or FSkillEffectInfo(), Skill, SkillLevelSource, Source, TargetFilterResult.HitPosition and CommonUtils.TableToVector(TargetFilterResult.HitPosition) or FVector(), CollisionNamesMap)
  }
  if SkillEffectStruct.CppEffectStruct.CutTNInfo.IsValid then
    SkillEffectStruct.CutTNInfo = SkillEffectStruct.CppEffectStruct.CutTNInfo
  end
  if SourceComponent then
    SkillEffectStruct.ActorLocation = SourceComponent:K2_GetComponentLocation()
    SkillEffectStruct.ActorForwardVector = SourceComponent:GetForwardVector()
    SkillEffectStruct.ActorRightVector = SourceComponent:GetRightVector()
    SkillEffectStruct.ActorUpVector = SourceComponent:GetUpVector()
  else
    SkillEffectStruct.ActorLocation = Source:K2_GetActorLocation()
    SkillEffectStruct.ActorForwardVector = Source:GetActorForwardVector()
    SkillEffectStruct.ActorRightVector = Source:GetActorRightVector()
    SkillEffectStruct.ActorUpVector = Source:GetActorUpVector()
  end
  if SourceComponent and SourceComponent.Eid then
    SkillEffectStruct.SourceComponentEid = SourceComponent.Eid
  end
  return SkillEffectStruct
end

return SkillEffectClass
