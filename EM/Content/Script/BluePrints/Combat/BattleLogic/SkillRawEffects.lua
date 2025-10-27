local SkillUtils = require("Utils.SkillUtils")
local EffectResults = require("BluePrints.Combat.BattleLogic.EffectResults")
local Component = {}

function Component:RealExecuteOneEffect_Lua(EffectStruct, Index)
  if not IsValid(EffectStruct.Source) then
    return
  end
  local EffectId = EffectStruct.EffectId
  local EffectInfo = DataMgr.SkillEffects[EffectId]
  local Effect = SkillUtils.GrowProxyBySkillLevel("SkillEffects", EffectId, EffectStruct.SkillLevelInfo.SkillLevel, EffectInfo.TaskEffects[Index], {
    Source = EffectStruct.Source
  })
  local FunctionName = Effect.Function
  if not self["Effect_" .. FunctionName] then
    self:ShowBattleError("\230\138\128\232\131\189\230\149\136\230\158\156\231\188\150\229\143\183: " .. EffectId .. ", \230\137\167\232\161\140\230\149\136\230\158\156\231\188\150\229\143\183: " .. Index .. ", \230\150\185\230\179\149: " .. FunctionName .. ", \229\156\168 SkillRawEffects.lua \228\184\173\228\184\141\229\173\152\229\156\168\227\128\130")
    return
  end
  local EffectDataParam = {
    ID = EffectStruct.EffectId,
    Index = Index
  }
  self["Effect_" .. FunctionName](self, EffectStruct, Effect, EffectDataParam)
  if not self.Result.IsEmpty then
    self.Result.Index = Index
    self.Result.EffectId = EffectStruct.EffectId
    self.Results:Add(self.Result)
    self.Result = EffectResults.Result()
  end
end

function Component:Effect_AddTnToMax(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  if Source then
    Source:RecoverToMaxTN()
  end
end

function Component:Effect_RemoveRayCreature(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  local CreatureId = ParamentsTable.CreatureId
  if not CreatureId then
    return
  end
  local RayCreature = Source:GetRayCreature(CreatureId)
  if not RayCreature then
    return
  end
  RayCreature:EMActorDestroy()
end

function Component:Effect_FireCreature(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  local CreatureId = ParamentsTable.CreatureId
  local CreatureList = Source:GetCreatureList(CreatureId)
  if 0 == CreatureList:Num() then
    return
  end
  local FirstTargetEid = EffectStruct.FirstTargetEid
  local Target = self:GetEntity(FirstTargetEid)
  if not Target then
    return
  end
  CreatureList = CreatureList:ToTable()
  for i = 1, #CreatureList do
    local Creature = self:GetEntity(CreatureList[i])
    if Creature then
      Creature:FireToTarget(Target, ParamentsTable.AcceptRadius)
    end
  end
end

function Component:StarCameraShakeByEids(Eids, ParamentsTable, SourceLocation)
  if Eids and #Eids > 0 then
    local ShakeScale = ParamentsTable.ShakeScale or 1
    local ShakeClassName = ParamentsTable.ShakeClass
    local ShakeClassPath = string.format("Blueprint'/Game/AssetDesign/Camera/CameraShake/%s.%s_C'", ShakeClassName, ShakeClassName)
    local ShakeClass = LoadClass(ShakeClassPath)
    if nil == ShakeClass then
      return
    end
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    if Player and Player.SkillFeature then
      return
    end
    local Target
    for _, Eid in pairs(Eids) do
      Target = self:GetEntity(Eid)
      if ParamentsTable.IsSceneCameraShake and Target then
        local TargetRootSource = Target:GetRootSource()
        if IsValid(TargetRootSource) and TargetRootSource:IsMainPlayer() then
          local TargetLocation = SourceLocation and FVector(SourceLocation[1], SourceLocation[2], SourceLocation[3]) or Target:K2_GetActorLocation()
          UGameplayStatics.PlayWorldCameraShake(TargetRootSource, ShakeClass, TargetLocation, 0, ParamentsTable.OuterRadius or 0, ParamentsTable.Falloff or 1)
        end
      else
        local Controller = Target and Target:GetController()
        local PlayerCameraManager = Controller and Controller.PlayerCameraManager
        if nil ~= PlayerCameraManager then
          PlayerCameraManager:StartCameraShake(ShakeClass, ShakeScale)
        end
      end
    end
  end
end

function Component:GetSummonOffsets(FormationId, PlayerRotation, Player)
  local ResOffsets = {}
  local TeamData = DataMgr.EliteTeamData[FormationId]
  if TeamData then
    if TeamData.SummonPresetShape then
      local PreFormationType = TeamData.SummonPresetShape.PreFormationType
      ResOffsets = self["UseTeam_" .. PreFormationType](self, TeamData, PlayerRotation, Player)
    else
      ResOffsets = self:UseTeamOffsets(TeamData, PlayerRotation)
    end
  end
  return ResOffsets
end

function Component:UseTeamOffsets(TeamData, PlayerRotation)
  local ResOffsets = {}
  local Offsets = TeamData.Offsets
  if Offsets then
    local i = 1
    while Offsets[i] do
      local Value = Offsets[i]
      local Offset = FVector(0, 0, 0)
      Offset.X = Value.OffsetXY[1] or 0
      Offset.Y = Value.OffsetXY[2] or 0
      Offset.Z = Value.OffsetXY[3] or 0
      Offset = UE4.UKismetMathLibrary.GreaterGreater_VectorRotator(Offset, PlayerRotation)
      table.insert(ResOffsets, Offset)
      i = i + 1
    end
  end
  return ResOffsets
end

function Component:Shuffle(t)
  if type(t) ~= "table" then
    return
  end
  local tab = {}
  local index = 1
  while 0 ~= #t do
    local n = math.random(0, #t)
    if nil ~= t[n] then
      tab[index] = t[n]
      table.remove(t, n)
      index = index + 1
    end
  end
  return tab
end

function Component:UseTeam_Circle(TeamData, PlayerRotation)
  local ResOffsets = {}
  local SummonPresetShape = TeamData.SummonPresetShape
  if SummonPresetShape then
    local Radius = SummonPresetShape.Radius or 0
    local Interval = SummonPresetShape.Interval or 360
    local Random = SummonPresetShape.Random or 0
    local PlayerFrontUnit = UE4.UKismetMathLibrary.GetForwardVector(PlayerRotation)
    local RotationOffset = -90
    while RotationOffset < 360 do
      local Offset = UE4.UKismetMathLibrary.GreaterGreater_VectorRotator(PlayerFrontUnit, UE4.FRotator(0, RotationOffset, 0)) * Radius
      table.insert(ResOffsets, Offset)
      RotationOffset = RotationOffset + Interval
    end
    if 1 == Random then
      ResOffsets = self:Shuffle(ResOffsets)
    end
  end
  return ResOffsets
end

function Component:Effect_Taunt(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  local HitTargets = EffectStruct.HitTargets:ToTable()
  if not next(HitTargets) then
    return
  end
  local DirectSource = Source
  if not DirectSource then
    return
  end
  for _, Eid in ipairs(HitTargets) do
    local Target = self:GetEntity(Eid)
    if Target and Target:IsAIControlled() and Target:IsEnemyOrNeutral(DirectSource) then
      local HatredTargetEid = Target:GetMaxHatredTargetHatred()
      if HatredTargetEid ~= DirectSource.Eid then
        local MaxHatred = Target.TargetHatred:Find(HatredTargetEid)
        MaxHatred = MaxHatred and MaxHatred or 0
        local MyHatred = Target.TargetHatred:Find(DirectSource.Eid)
        MyHatred = MyHatred and MyHatred or 0
        local Value = MaxHatred + ParamentsTable.Value > math.maxinteger and math.maxinteger - MyHatred or ParamentsTable.Value + MaxHatred - MyHatred
        Target:AddHatredTarget(DirectSource.Eid, Value, Value)
        Target:BBSetTarget(DirectSource)
      end
    end
  end
end

function Component:Effect_GatherTargets(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  local HitTargets = EffectStruct.HitTargets:ToTable()
  local GatherPoint = ParamentsTable.GatherPoint
  local TargetSocketName = ParamentsTable.TargetSocketName
  local GatherSpeed = ParamentsTable.GatherSpeed
  local StopDistance = ParamentsTable.StopDistance
  local Acceleration = ParamentsTable.Acceleration
  local LocationOffset = ParamentsTable.LocationOffset
  LocationOffset = LocationOffset and FVector(LocationOffset[1], LocationOffset[2], LocationOffset[3]) or FVector(0, 0, 0)
  if not next(HitTargets) then
    return
  end
  if 0 ~= EffectStruct.CreatureInfo.CreatureEid then
    local SkillCreatureConfig = DataMgr.SkillCreature[EffectStruct.CreatureInfo.CreatureId]
    if Source:IsPlayer() and SkillCreatureConfig.ClientOwner and IsDedicatedServer(self) then
      self:ShowBattleError("\229\189\147\229\137\141\228\184\141\230\148\175\230\140\129\231\148\177\231\142\169\229\174\182\231\155\180\230\142\165\230\137\167\232\161\140\231\154\132\230\138\128\232\131\189\230\149\136\230\158\156\231\188\150\229\143\183: " .. EffectStruct.EffectId .. ", \230\137\167\232\161\140\230\149\136\230\158\156GatherTargets\239\188\140\230\138\128\232\131\189\229\136\155\231\148\159\231\137\169id\228\184\186" .. EffectStruct.CreatureInfo.CreatureId .. "ClientOwner\228\184\186true\231\154\132\230\138\128\232\131\189\230\149\136\230\158\156")
      return
    end
    for _, Eid in ipairs(HitTargets) do
      local Target = self:GetEntity(Eid)
      if Target and Target.GatherToCreature then
        Target:GatherToCreature(EffectStruct.CreatureInfo, GatherPoint, TargetSocketName, GatherSpeed, StopDistance, Acceleration, LocationOffset)
      end
    end
  else
    for _, Eid in ipairs(HitTargets) do
      local Target = self:GetEntity(Eid)
      if Target and Target.GatherToSource then
        Target:GatherToSource(Source, GatherPoint, TargetSocketName, GatherSpeed, StopDistance, Acceleration, LocationOffset)
      end
    end
  end
end

function Component:Effect_ChangeSummonLifeTime(EffectStruct, ParamentsTable)
  local HitTargets = EffectStruct.HitTargets:ToTable()
  if not next(HitTargets) then
    return
  end
  for _, Eid in ipairs(HitTargets) do
    local Target = self:GetEntity(Eid)
    if Target and Target:IsSummonMonster() then
      local LifeTime = ParamentsTable.LifeTime < 0 and 0 or ParamentsTable.LifeTime
      if ParamentsTable.IsExpand then
        local RemainingLifeTime = UE4.UBattleFunctionLibrary.GetSummonRemainingLifeTime(Target)
        if RemainingLifeTime >= 0 then
          LifeTime = RemainingLifeTime + LifeTime
        end
      end
      UE4.UBattleFunctionLibrary.SetSummonLifeTime(Target, LifeTime)
    end
  end
end

function Component:Effect_ActiveStaticCreator(EffectStruct, ParamentsTable)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if nil == GameMode then
    return
  end
  local StaticCreatorId = ParamentsTable.StaticCreatorId
  local StaticCreatorArray = TArray(0)
  StaticCreatorArray:Add(StaticCreatorId)
  GameMode:TriggerActiveStaticCreator(StaticCreatorArray)
end

function Component:Effect_InactiveStaticCreator(EffectStruct, ParamentsTable)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if nil == GameMode then
    return
  end
  local StaticCreatorId = ParamentsTable.StaticCreatorId
  local StaticCreatorArray = TArray(0)
  StaticCreatorArray:Add(StaticCreatorId)
  GameMode:TriggerInactiveStaticCreator(StaticCreatorArray)
end

function Component:Effect_QuitDefeated(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  local TargetEid = Source.CondemnMonsterEid
  if not TargetEid then
    return
  end
  local Target = self:GetEntity(TargetEid)
  if Target and Target:CharacterInTag("Defeated") then
    Target:DefeatedRecoverToIdle()
  end
end

function Component:Effect_SetToCondemnLoc(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  if not Source then
    return
  end
  local TargetEid = Source.CondemnMonsterEid
  if not TargetEid then
    return
  end
  local Monster = self:GetEntity(TargetEid)
  if not Monster then
    return
  end
  local ModelInfo = Monster:GetCharModelComponent():GetCurrentModelInfo()
  local CondemnBoneName = ModelInfo.CondemnBoneName
  if not CondemnBoneName then
    return
  end
  local CondemnLocation = Monster:GetCondemnLocation(Source)
  if not CondemnLocation then
    return
  end
  Source:K2_SetActorLocation(CondemnLocation, false, nil, false)
  local MonsterPenalizeComponent = Monster.PenalizeInteractiveComponent
  local NewSourceLocation = Source:K2_GetActorLocation()
  NewSourceLocation.Z = MonsterPenalizeComponent:K2_GetComponentLocation().Z
  local Rotate = UE4.UKismetMathLibrary.FindLookAtRotation(NewSourceLocation, MonsterPenalizeComponent:K2_GetComponentLocation())
  Source:K2_SetActorRotation(Rotate, false)
  Monster:SetEnableBeCondemned(ECondemnState.DefeatedStopNotify)
end

function Component:Effect_StartTargetCondemn(EffectStruct, ParamentsTable)
  local TargetEid = EffectStruct.Source.CondemnMonsterEid
  if not TargetEid then
    return
  end
  local Target = self:GetEntity(TargetEid)
  if Target then
    Target:MultiCastPlayCondemnMontage()
  end
end

function Component:Effect_SetFloat(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  local Key = ParamentsTable.Key
  local Value = ParamentsTable.Value
  Source:SetFloat(Key, Value)
end

function Component:Effect_SaveLoc(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  if not Source then
    return
  end
  local TargetType = ParamentsTable.TargetType or "Target"
  local Tag = ParamentsTable.Tag or ""
  local FirstTargetEid = EffectStruct.FirstTargetEid
  local IsOnGround = ParamentsTable.IsOnGround
  local FixLocationZ = ParamentsTable.FixLocationZ or 0
  local FixLocationStartZ = ParamentsTable.FixLocationStartZ or 0
  local FixLocationEndZ = ParamentsTable.FixLocationEndZ or -2000
  local TargetLocation
  if "Target" == TargetType and FirstTargetEid then
    local Target = self:GetEntity(FirstTargetEid)
    if not Target then
      return
    end
    TargetLocation = Target:K2_GetActorLocation()
  elseif "StaticCreator" == TargetType and Source.CreatorId then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    if not GameState then
      return
    end
    local StaticCreator = GameState.StaticCreatorMap:Find(Source.CreatorId)
    if not StaticCreator then
      return
    end
    TargetLocation = StaticCreator:K2_GetActorLocation()
  end
  if not TargetLocation then
    return
  end
  if IsOnGround then
    TargetLocation = CommonUtils.GetFixLocation(Source, TargetLocation, FixLocationZ, FixLocationStartZ, FixLocationEndZ, "TraceScene")
  end
  Source:SetSaveLoc(TargetLocation, Tag)
  Source.SaveLoc = TargetLocation
end

function Component:Effect_SetSelfLoc(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  if not Source then
    return
  end
  local FirstTargetEid = EffectStruct.FirstTargetEid
  local TargetCenterLoc = ParamentsTable.TargetCenterLoc or "Target"
  local LocOffset = ParamentsTable.LocOffset and FVector(ParamentsTable.LocOffset[1], ParamentsTable.LocOffset[2], ParamentsTable.LocOffset[3]) or FVector(0, 0, 0)
  local FixLocation = ParamentsTable.FixLocation
  local FixLocationZ = ParamentsTable.FixLocationZ
  local FixLocationStartZ = ParamentsTable.FixLocationStartZ
  local FixLocationEndZ = ParamentsTable.FixLocationEndZ
  local FixTraceChannel = ParamentsTable.FixTraceChannel
  local UseRelativeOffset = ParamentsTable.UseRelativeOffset
  local SaveLocTag = ParamentsTable.SaveLocTag or ""
  local BattlePointID = ParamentsTable.BattlePointID
  local UseBattlePointRotation = ParamentsTable.UseBattlePointRotation
  local SourceLocation = Source:K2_GetActorLocation()
  local TargetLocation, BattlePointRotation
  if "Target" == TargetCenterLoc and FirstTargetEid then
    local Target = self:GetEntity(FirstTargetEid)
    if not Target then
      return
    end
    TargetLocation = Target:K2_GetActorLocation()
  elseif "StaticCreator" == TargetCenterLoc and Source.CreatorId then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    if not GameState then
      return
    end
    local StaticCreator = GameState.StaticCreatorMap:Find(Source.CreatorId)
    if not StaticCreator then
      return
    end
    TargetLocation = StaticCreator:K2_GetActorLocation()
  elseif "SavedLoc" == TargetCenterLoc then
    TargetLocation = Source:GetSaveLoc(SaveLocTag)
    if UseRelativeOffset and TargetLocation then
      TargetLocation = UE4.UKismetMathLibrary.TransformLocation(Source:GetTransform(), TargetLocation)
    end
  elseif "BattlePoint" == TargetCenterLoc then
    local BattlePoint = self:GetBattlePointsById(BattlePointID)
    if not BattlePoint then
      return
    end
    TargetLocation = BattlePoint:K2_GetActorLocation()
    if UseBattlePointRotation then
      BattlePointRotation = BattlePoint:K2_GetActorRotation()
    end
  end
  if not TargetLocation then
    return
  end
  local Location = TargetLocation
  if FixLocation then
    Location = CommonUtils.GetCapFixLocation(Source, Location, FixLocationZ, FixLocationStartZ, FixLocationEndZ, FixTraceChannel or "TraceScene")
  end
  SourceLocation.Z = Location.Z
  local Rotation = UE4.UKismetMathLibrary.FindLookAtRotation(SourceLocation, Location)
  local Transform = UE4.UKismetMathLibrary.MakeTransform(Location, Rotation, FVector(1, 1, 1))
  local NewLocation = UE4.UKismetMathLibrary.TransformLocation(Transform, LocOffset)
  Source:K2_SetActorLocation(NewLocation, false, nil, false)
  if BattlePointRotation then
    Source:K2_SetActorRotation(BattlePointRotation, false)
  end
  if Source.UpdateCurrentLevelId then
    Source:UpdateCurrentLevelId()
  end
end

function Component:CallBackSkillCreature(CallBackCreature, BindWeaponState, TargetEid, TargetSocket, TargetSocketLocation, MinDistance, IsFollowing, EventDistance, SetSpeed, TargetWeapon)
  local SkillCreatureConfig = DataMgr.SkillCreature[CallBackCreature.CreatureId]
  if CallBackCreature:IsBulletCreature() then
    return
  end
  if CallBackCreature.bReplicates and IsClient(self) then
    return
  end
  if BindWeaponState then
    CallBackCreature:SetBindWeaponState(BindWeaponState)
  end
  CallBackCreature:MultiCastSetCallBackLocation(TargetEid, TargetSocket, TargetSocketLocation, MinDistance, IsFollowing, EventDistance, CallBackCreature.BindWeapon, TargetWeapon, SetSpeed)
  if SkillCreatureConfig.RefreshTargetRule and 2 == SkillCreatureConfig.RefreshTargetRule then
    CallBackCreature.Targets:Clear()
  end
end

function Component:Effect_CallBackSkillCreature(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  local CreatureId = ParamentsTable.CreatureId
  local TargetSocket = ParamentsTable.TargetSocket or ""
  local IsFollowing = ParamentsTable.IsFollowing
  local BindWeaponState = ParamentsTable.BindWeapon
  local MinDistance = ParamentsTable.MinDistance or 0
  local EventDistance = ParamentsTable.EventDistance or 0
  local CallBackNum = ParamentsTable.CallBackNum or -1
  local TargetSocketLocation = ParamentsTable.TargetSocketLocation or {
    0,
    0,
    0
  }
  TargetSocketLocation = FVector(TargetSocketLocation[1], TargetSocketLocation[2], TargetSocketLocation[3])
  local BeCallBacked = ParamentsTable.BeCallBacked
  local TargetWeapon = ParamentsTable.Target or ""
  local SetSpeed = ParamentsTable.SetSpeed or -1
  if BeCallBacked and 0 ~= EffectStruct.CreatureInfo.CreatureEid then
    local Creature = self:GetEntity(EffectStruct.CreatureInfo.CreatureEid)
    self:CallBackSkillCreature(Creature, BindWeaponState, Source.Eid, TargetSocket, TargetSocketLocation, MinDistance, IsFollowing, EventDistance, SetSpeed, TargetWeapon)
  else
    local CreatureList = Source:GetCreatureList(CreatureId)
    if 0 == CreatureList:Num() then
      return
    end
    CreatureList = CreatureList:ToTable()
    for i = 1, #CreatureList do
      local Creature = self:GetEntity(CreatureList[i])
      self:CallBackSkillCreature(Creature, BindWeaponState, Source.Eid, TargetSocket, TargetSocketLocation, MinDistance, IsFollowing, EventDistance, SetSpeed, TargetWeapon)
      CallBackNum = CallBackNum - 1
      if 0 == CallBackNum then
        break
      end
    end
  end
end

function Component:Effect_SkillMove(EffectStruct, ParamentsTable)
  local HitTargets = EffectStruct.HitTargets:ToTable()
  if not next(HitTargets) then
    return
  end
  for _, Eid in ipairs(HitTargets) do
    local Target = self:GetEntity(Eid)
    if Target then
      if ParamentsTable.DisableRootMotion then
        Target:DisableRootMotion(ESourceTags.SkillMove)
      end
      local MoveX = ParamentsTable.MoveX or 0
      local MoveY = ParamentsTable.MoveY or 0
      local MoveZ = ParamentsTable.MoveZ or 0
      if ParamentsTable.CanSkillRangeModify then
        local SkillRangeModity = Target:GetAttrByConstrain(EAttrName.SkillRange)
        MoveX = MoveX * SkillRangeModity
        MoveY = MoveY * SkillRangeModity
        MoveZ = MoveZ * SkillRangeModity
      end
      Target:SetMoveInfo_Lua(ESourceTags.SkillMove, ParamentsTable.TotalTime, MoveX, MoveY, MoveZ)
      Target:AddTimer_Combat(ParamentsTable.TotalTime, function()
        if not UKismetSystemLibrary.IsValid(Target) then
          return
        end
        if ParamentsTable.DisableRootMotion then
          Target:EnableRootMotion(ESourceTags.SkillMove)
        end
        Target:ClearMoveInfo_Lua(ESourceTags.SkillMove)
      end, false, 0, "SkillEffectSkillMove")
    end
  end
  self.Result:Add("SkillMove", {HitTargets = HitTargets})
end

function Component:Effect_ChargeSkill(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  local SkillId = ParamentsTable.SkillId
  local ChargeNum = ParamentsTable.ChargeNum
  local Skill = Source:GetSkill(SkillId)
  assert(Source, "Source \229\191\133\233\161\187\229\173\152\229\156\168\227\128\130")
  assert(Skill, "Skill \229\191\133\233\161\187\229\173\152\229\156\168\227\128\130")
  Skill:ChargeUseTime(ChargeNum)
end

function Component:Effect_CameraUnlock(EffectStruct, ParamentsTable)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  for _, Player in pairs(GameMode:GetAllPlayer()) do
    if Player.CameraUnlockOnBySkill then
      Player:CameraUnlockOnBySkill(EffectStruct.Source, ParamentsTable)
    end
  end
end

function Component:Effect_CameraRelock(EffectStruct, ParamentsTable)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  for _, Player in pairs(GameMode:GetAllPlayer()) do
    if Player.CameraRelockOnBySkill then
      Player:CameraRelockOnBySkill(EffectStruct.Source)
    end
  end
end

function Component:Effect_PlayerCameraUnlock(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  if IsValid(Source) and Source.IsPlayer and Source:IsPlayer() then
    Source:BanCameraLockOnBySkill(ParamentsTable)
  end
end

function Component:Effect_SetCameraPitch(EffectStruct, ParametersTable)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  for _, Player in pairs(GameMode:GetAllPlayer()) do
    Player.CameraRotationComponent:SetCameraPitchBySkill(ParametersTable)
  end
end

function Component:Effect_EnablePitchInput(EffectStruct, ParametersTable)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  for _, Player in pairs(GameMode:GetAllPlayer()) do
    Player.CameraRotationComponent:EnablePitchRotInputBySkill(ParametersTable)
  end
end

function Component:Effect_LiftTargetUp(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  local HitTargets = EffectStruct.HitTargets:ToTable()
  if not next(HitTargets) then
    return
  end
  for _, Eid in ipairs(HitTargets) do
    local Target = self:GetEntity(Eid)
    if IsValid(Target) and not Target:IsBossMonster() then
      Target:ApplyHitPerformLiftHeight(Source, ParamentsTable)
    end
  end
end

function Component:Effect_CreateDanmaku(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  local DanmakuTemplateId = tonumber(ParamentsTable.DanmakuTemplateId)
  local Duration = tonumber(ParamentsTable.Duration)
  local BoneName = ParamentsTable.BoneName
  local HitTargets = EffectStruct.HitTargets:ToTable()
  DebugPrint("gmy@SkillRawEffects Component:Effect_CreateDanmaku", EffectStruct.ActorTransform, EffectStruct.SourceComponentEid)
  local TargetEid = 0
  if next(HitTargets) then
    DebugPrint("gmy@Effect_CreateDanmaku", EffectStruct.EffectId, HitTargets[1])
    TargetEid = HitTargets[1]
  end
  local bInTransformValid = -1 == EffectStruct.SourceComponentEid
  Source:FireDanmaku(DanmakuTemplateId, Duration, BoneName, TargetEid, bInTransformValid, EffectStruct.ActorTransform)
end

function Component:Effect_TriggerSkillCreatureTriggerEvent(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  local CreatureId = ParamentsTable.CreatureId
  local CreatureList = Source:GetCreatureList(CreatureId)
  if 0 == CreatureList:Num() then
    return
  end
  CreatureList = CreatureList:ToTable()
  for i = 1, #CreatureList do
    local Creature = self:GetEntity(CreatureList[i])
    if Creature then
      Creature:TriggerEvent()
    end
  end
end

function Component:Effect_AimDiffusion(EffectStruct, ParamentsTable)
  if EffectStruct.Source and EffectStruct.Source.TakeAimIndicator then
    EffectStruct.Source.TakeAimIndicator:TryToPlayAimDiffusionStartAnim()
  end
  if EffectStruct.Source and EffectStruct.Source.PaoTaiBattleFront then
    EffectStruct.Source.PaoTaiBattleFront:TryToPlayAimDiffusionStartAnim()
  end
end

function Component:Effect_StartAlarm(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  if Source and Source:IsMonster() and Source.MonAlertComponent then
    Source.MonAlertComponent:ApplyEffectStartAlarm()
  end
end

function Component:Effect_TryAlarm(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  if Source and Source:IsMonster() and Source.MonAlertComponent then
    Source.MonAlertComponent:ApplyEffectTryAlarm()
  end
end

function Component:Effect_EffectFunction(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  local FunctionName = ParamentsTable.FunctionName
  local Vars = ParamentsTable.Vars
  self.EffectFunctionComponent:ExecuteFunction(Source, EffectStruct.EffectId, FunctionName, Vars)
end

function Component:Effect_RemoveUnit(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  local UnitId = ParamentsTable.UnitId
  for _, SummonEid in pairs(Source:GetAllDirectorSummon():ToTable()) do
    local Summon = self:GetEntity(SummonEid)
    if Summon and Summon.UnitId == UnitId then
      self:BattleOnDead(Summon.Eid, Summon.Eid, 0, EDeathReason.SummonRemove)
    end
  end
  if Source:IsOwnedCreatingUnitBySummonId(UnitId) then
    Source:RemoveCreatedUnitEidBySummonId(UnitId)
  end
end

function Component:Effect_StartRecovery(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  if not Source then
    return
  end
  local Targets = EffectStruct.DeadTargets:ToTable()
  local Params = {
    Speed = ParamentsTable.Speed,
    RecoveryEffectCreature = ParamentsTable.RecoveryEffectCreature
  }
  for _, Eid in ipairs(Targets) do
    Battle(self):RecoverOther(Source.Eid, Eid, true, Params, UE4.ERecoverReason.RecoverReason_SkillEffect)
  end
end

function Component:Effect_EndRecovery(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  if not Source or not Source.RecoverTargets then
    return
  end
  for TargetEid, RecoverSpeed in pairs(Source.RecoverTargets) do
    Battle(self):RecoverOther(Source.Eid, TargetEid, false)
  end
end

function Component:Effect_Disarm(EffectStruct, ParamentsTable)
  local HitTargets = EffectStruct.HitTargets:ToTable()
  local Source = EffectStruct.Source
  local CauseHit = ParamentsTable.CauseHit
  if not next(HitTargets) then
    return
  end
  local TargetCount = 0
  for _, Eid in ipairs(HitTargets) do
    local Target = self:GetEntity(Eid)
    if not Target or not Target:IsMonster() then
    else
      local WeaponList = Target.Data.WeaponId
      if not WeaponList then
      else
        local ChangeWeaponParams = Target.Data.ChangeWeaponParams
        if not (ChangeWeaponParams and ChangeWeaponParams.Disarm) or 0 ~= ChangeWeaponParams.Disarm and not WeaponList[ChangeWeaponParams.Disarm] then
        elseif Target:GetCannotBeDisarmed() then
        else
          local DisarmHitMontage
          if CauseHit and not Target:CheckCanEnterTag("LightHit") then
            goto lbl_118
          else
            local HitMontageRule = Target:GetHitMontageRule()
            DisarmHitMontage = HitMontageRule.DisarmHitMontage and HitMontageRule.DisarmHitMontage[1]
          end
          local WeaponObject = Target:GetCurrentWeapon()
          if not WeaponObject or WeaponObject and WeaponObject.WeaponId ~= WeaponList[ChangeWeaponParams.Disarm] then
            if CauseHit and DisarmHitMontage then
              local HitLogicComp = Target:GetOrAddHitLogicComp()
              if HitLogicComp and HitLogicComp:_GetHitMontage(DisarmHitMontage) then
                local HitParams = UE4.FHitParams()
                HitParams.CauseHitName = "LightHit"
                HitParams.CauseHitType = Const.CauseHitTypeNormal
                HitParams.OverrideMontageSuffix = DisarmHitMontage
                if Target:PrepareHit(UE4.EHitType.LightHit) then
                  Target:ProcessHit("LightHit", Source, HitParams)
                end
              end
            end
            Target:ServerChangeMonsterWeapon("Disarm")
            TargetCount = TargetCount + 1
          end
        end
      end
    end
    ::lbl_118::
  end
  if TargetCount > 0 then
    self:TriggerBattleEvent(BattleEventName.OnDisarm, Source, TargetCount)
  end
end

function Component:Effect_ChangeWeapon(EffectStruct, ParamentsTable)
  local WeaponIndex = ParamentsTable.WeaponIndex
  local HitTargets = EffectStruct.HitTargets:ToTable()
  if not next(HitTargets) then
    return
  end
  for _, Eid in ipairs(HitTargets) do
    local Target = self:GetEntity(Eid)
    if Target or Target:IsMonster() then
      if 0 == WeaponIndex then
        Target:ChangeUsingWeaponById()
      else
        local WeaponList = Target.Data.WeaponId
        if not WeaponList then
          return
        end
        local WeaponId = WeaponList[WeaponIndex]
        if not WeaponId then
          return
        end
        Target:ChangeUsingWeaponById(WeaponId)
      end
    end
  end
end

function Component:Effect_RescueAlert(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:TriggerDungeonComponentFun("TriggerRescueAlert", Source)
  end
end

function Component:Effect_UpdateSupportSkillCd(EffectStruct, ParamentsTable)
  local HitTargets = EffectStruct.HitTargets:ToTable()
  if not next(HitTargets) then
    return
  end
  local Source = EffectStruct.Source
  local ModifyValue = ParamentsTable.ModifyValue or 0
  local Intensity = ParamentsTable.Intensity
  if Intensity then
    local SkilIntensity = Source:GetAttr("SkillIntensity")
    ModifyValue = ModifyValue * SkilIntensity
  end
  for _, Eid in ipairs(HitTargets) do
    local Target = self:GetEntity(Eid)
    if Target then
      local SupportSKillId = Target:GetSkillByType(UE.ESkillType.Support)
      local SupportSKill = Target:GetSkill(SupportSKillId)
      if SupportSKill then
        SupportSKill:UpdateSkillCurrCd(ModifyValue)
      end
    end
  end
end

function Component:Effect_PlayUIAnim(EffectStruct, ParamentsTable)
  if not EffectStruct.bIsServer or IsStandAlone(self) then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    if UIManager then
      local UI = UIManager:GetUIObj(ParamentsTable.UIName)
      if UI then
        EMUIAnimationSubsystem:EMPlayAnimation(UI, UI[ParamentsTable.AnimName])
      else
        DebugPrint("SystemUI\232\161\168\230\178\161\230\137\190\229\136\176" .. tostring(ParamentsTable.UIName))
      end
    end
  end
end

function Component:Effect_BossSPSaveLocs(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  local FormationId = ParamentsTable.FormationId
  local SetSaveLocsTag = ParamentsTable.SetSaveLocs or ""
  local SaveAsStaticLocation = ParamentsTable.SaveAsStaticLocation
  local IsOnGround = ParamentsTable.IsOnGround
  local FixLocationZ = ParamentsTable.FixLocationZ or 0
  local FixLocationStartZ = ParamentsTable.FixLocationStartZ or 0
  local FixLocationEndZ = ParamentsTable.FixLocationEndZ or -2000
  if not FormationId then
    return
  end
  local FormationConfig = DataMgr.EliteTeamData[FormationId]
  if not FormationConfig then
    return
  end
  local Offsets = FormationConfig.Offsets
  for i = 1, #Offsets do
    local Offset = FormationConfig.Offsets[i]
    local OffsetVector = FVector(Offset.OffsetXY[1] or 0, Offset.OffsetXY[2] or 0, Offset.OffsetXY[3] or 0)
    if SaveAsStaticLocation then
      local TargetLocation = UE4.UKismetMathLibrary.TransformLocation(Source:GetTransform(), OffsetVector)
      if IsOnGround then
        TargetLocation = CommonUtils.GetFixLocation(Source, TargetLocation, FixLocationZ, FixLocationStartZ, FixLocationEndZ, "TraceScene")
      end
      Source:SetSaveLoc(TargetLocation, SetSaveLocsTag .. i)
    else
      Source:SetSaveLoc(OffsetVector, SetSaveLocsTag .. i)
    end
  end
end

function Component:Effect_BindWeaponToCreature(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  local TransWeaponDelay = ParamentsTable.TransWeaponDelay or 0
  local WeaponSocket = ParamentsTable.WeaponSocket or ""
  local TransWeapon = ParamentsTable.TransWeapon or ""
  local CreatureId = ParamentsTable.CreatureId
  local CreatureList = Source:GetCreatureList(CreatureId)
  if 0 == CreatureList:Num() then
    return
  end
  CreatureList = CreatureList:ToTable()
  local CreatureEid = CreatureList[#CreatureList]
  local Creature = self:GetEntity(CreatureEid)
  if not Creature then
    return
  end
  local CurWeapon = Source:GetCurrentWeapon()
  if not CurWeapon then
    return
  end
  if 0 == TransWeaponDelay then
    CurWeapon:BindWeaponToCreature(TransWeapon, Creature, WeaponSocket)
  else
    Source:AddTimer_Combat(TransWeaponDelay, function()
      if CurWeapon and Creature then
        CurWeapon:BindWeaponToCreature(TransWeapon, Creature, WeaponSocket)
      end
    end)
  end
end

function Component:Effect_Print(EffectStruct, ParamentsTable)
  local HitTargetsStr = ""
  local HitTargets = EffectStruct.HitTargets:ToTable()
  for _, Eid in ipairs(HitTargets) do
    HitTargetsStr = HitTargetsStr .. tostring(Eid) .. ","
  end
  DebugPrint(tostring(EffectStruct.Source.Eid) .. ":Print:" .. tostring(ParamentsTable.Text) .. ",HitTargets:" .. HitTargetsStr)
end

function Component:Effect_BeginAccumulate(EffectStruct, ParamentsTable)
  if EffectStruct.Source and EffectStruct.Source.TakeAimIndicator then
    EffectStruct.Source.TakeAimIndicator:BeginAccumulate(EffectStruct.Skill)
  end
end

function Component:Effect_Catapult(EffectStruct, ParamentsTable)
  local Source = EffectStruct.Source
  local SkillEffectId = ParamentsTable.SkillEffectId
  local CatapultNum = ParamentsTable.CatapultNum or 1
  local Rule = ParamentsTable.Rule or "Nearpriority"
  local HitTargets = EffectStruct.HitTargets:ToTable()
  if 0 == #HitTargets then
    return
  end
  for i = #HitTargets, 1, -1 do
    local Target = self:GetEntity(HitTargets[i])
    if not Target then
      table.remove(HitTargets, i)
    end
  end
  local SourceActorLocation = EffectStruct.RayHitLoc ~= Const.ZeroVector and EffectStruct.RayHitLoc or EffectStruct.ActorTransform.Translation
  
  local function SortByDistance(AEid, BEid)
    local TargetA = self:GetEntity(AEid)
    local TargetB = self:GetEntity(BEid)
    local TargetALocation = TargetA:K2_GetActorLocation()
    local TargetBLocation = TargetB:K2_GetActorLocation()
    local DistanceA = UE4.UKismetMathLibrary.Vector_Distance(SourceActorLocation, TargetALocation)
    local DistanceB = UE4.UKismetMathLibrary.Vector_Distance(SourceActorLocation, TargetBLocation)
    if "Nearpriority" == Rule then
      return DistanceA < DistanceB
    else
      return DistanceA > DistanceB
    end
  end
  
  table.sort(HitTargets, SortByDistance)
  if CatapultNum < #HitTargets then
    for i = #HitTargets, CatapultNum + 1, -1 do
      table.remove(HitTargets, i)
    end
  end
  for _, Eid in ipairs(HitTargets) do
    local Target = self:GetEntity(Eid)
    self:ExecuteSkillEffect(Source, SkillEffectId, Target, EffectStruct.Skill, EffectStruct.SkillLevelSource)
  end
end

function Component:Effect_ClearHitTargets(EffectStruct, ParamentsTablex)
  local CreatureInfo = EffectStruct.CreatureInfo
  if 0 ~= not CreatureInfo.CreatureEid then
    return
  end
  local Creature = self:GetEntity(CreatureInfo.CreatureEid)
  if not Creature then
    return
  end
  if Creature:IsRealSkillCreature() then
    Creature:ClearHitTargets()
  else
    Creature:ClearHitTargets(CreatureInfo.BulletEid)
  end
end

function Component:Effect_ReplaceBulletFXID(EffectStruct, ParamentsTablex)
  local Source = EffectStruct.Source
  local BulletManager = Source:GetBulletManager()
  local CreatureInfo = EffectStruct.CreatureInfo
  local FXId = ParamentsTablex.FXId
  if 0 == CreatureInfo.CreatureEid then
    return
  end
  local Creature = self:GetEntity(CreatureInfo.CreatureEid)
  if not Creature then
    return
  end
  if IsStandAlone(self) or IsClient(self) then
    if Creature:IsRealSkillCreature() then
      Creature:ReplaceBulletFXID(FXId)
    else
      Creature:ReplaceBulletFXID(CreatureInfo.BulletEid, FXId)
    end
  end
  if BulletManager and IsDedicatedServer(self) and EffectStruct.FromServer then
    BulletManager:ClientReplaceBulletFXID(CreatureInfo, FXId)
  end
end

return Component
