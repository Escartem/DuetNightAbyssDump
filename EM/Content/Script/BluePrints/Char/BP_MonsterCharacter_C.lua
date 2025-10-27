require("UnLua")
local ItemUtils = require("Utils.ItemUtils")
local CommonConst = require("CommonConst")
local UIUtils = require("Utils.UIUtils")
local GMVariable = require("BluePrints.UI.GMInterface.GMVariable")
local BP_MonsterCharacter_C = Class({
  "BluePrints.Char.BP_AICharacterBase_C",
  "BluePrints.Combat.Components.MonsterInitLogic",
  "BluePrints.Combat.BattleLogic.CampLogic",
  "BluePrints.Char.CharacterComponent.MonsterComponent.MonModelComponent"
})
BP_MonsterCharacter_C._components = {
  "BluePrints.Char.CharacterComponent.MonsterComponent.MonCaptureComponent",
  "BluePrints.Char.CharacterComponent.MonsterComponent.MonPenalizeComponent"
}
UE4.AMonsterCharacter.SetEQSOptimizationInfo(Const.bSkipEQSTestWhilePlatformWarning, Const.NumOfEQSItemWhilePlatformWarning)
UE4.AMonsterCharacter.SetAndroidPlayDeathEffectDist(Const.AndroidPlayDeathEffectDist)

function BP_MonsterCharacter_C:Initialize(Initializer)
  self.bIsBossInPart = false
end

function BP_MonsterCharacter_C:ReceiveBeginPlay()
  self.IsDestroied = false
  BP_MonsterCharacter_C.Super.ReceiveBeginPlay(self)
  local GameState = UGameplayStatics.GetGameState(self)
  if GameState and GameState:IsInRegion() then
    self.CharFSMComp.OnAfterTagChanged:Add(self, self.OnTagChange)
  end
end

function BP_MonsterCharacter_C:CallFromCPPDelegete(Type)
  DebugPrint("BP_MonsterCharacter_C:CallFromCPPDelegete", Type)
end

function BP_MonsterCharacter_C:OnTagChange(Eid, OldTag, NewTag)
  if "HitFly" ~= NewTag then
    return
  end
  local Mesh = self.Mesh
  if Mesh and Mesh.SkeletalMesh:GetPhysicsAsset() then
    local PhysicsAsset = Mesh.SkeletalMesh:GetPhysicsAsset()
    for _, BodySetup in pairs(PhysicsAsset.SkeletalBodySetups) do
      if BodySetup and BodySetup.PhysicsType == EPhysicsType.PhysType_Default and BodySetup.CollisionReponse ~= EBodyCollisionResponse.BodyCollision_Enabled then
        BodySetup.CollisionReponse = EBodyCollisionResponse.BodyCollision_Enabled
      end
    end
  end
end

function BP_MonsterCharacter_C:SetReplaceAttrsLua(Context)
  local ReplaceAttrs = Context:GetLuaTable("ReplaceAttrs")
  if ReplaceAttrs then
    self:SetReplaceAttrs(ReplaceAttrs)
  end
end

function BP_MonsterCharacter_C:TryResumeRootMotionFromPush()
  if not self.bBePushed and self:GetRootMotionTagState(ESourceTags.ApplyPush) then
    self:EnableRootMotion(ESourceTags.ApplyPush)
  end
end

function BP_MonsterCharacter_C:TickMonsterBattleComponent(DeltaSeconds)
  self:TickComponent(DeltaSeconds)
end

function BP_MonsterCharacter_C:CheckMonsterCanReachTest()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local Location = self:CheckMonsterCanReach(Player)
  if not Location then
    return
  end
  self:K2_SetActorLocation(Location, false, nil, false)
  print("selfCheckMonsterCanReachTest", Location)
end

function BP_MonsterCharacter_C:GetBlueprintPath()
  return self.Data.UnitBPPath
end

function BP_MonsterCharacter_C:PlayOutBattleMontage(MontageIndex)
  local Model = DataMgr.Model[self.ModelId]
  local GroupId = Model.BehaviorMontageGroupId
  if not GroupId or not DataMgr.BehaviorRuleId[GroupId] then
    return 0
  end
  local PossibleOutBattleMontageList = DataMgr.BehaviorRuleId[GroupId].OutBattleList
  if not PossibleOutBattleMontageList then
    return 0
  end
  self.LastOutBattleMontageIndex = PossibleOutBattleMontageList[MontageIndex]
  if not self.LastOutBattleMontageIndex then
    return 0
  end
  if not DataMgr.BehaviorMontage[self.LastOutBattleMontageIndex] then
    return 0
  end
  local Path = DataMgr.BehaviorMontage[self.LastOutBattleMontageIndex].MontagePath
  self:Montage_RepPlay(Path)
  return self.EMAnimInstance.NowMontageDuration
end

function BP_MonsterCharacter_C:OnEMActorDestroy_Lua(DestroyReason)
  self:CommonOnEMActorDestroy(DestroyReason)
end

function BP_MonsterCharacter_C:GetKillSourceType(KillMineRoleEid)
  local KillMineRole = Battle(self):GetEntity(KillMineRoleEid)
  local KillSourceType
  if KillMineRole then
    local RootSource = KillMineRole:GetRootSource()
    if RootSource and RootSource.IsPlayer and RootSource:IsPlayer() then
      KillSourceType = CommonConst.ActorType.Player
    elseif RootSource and RootSource.IsCombatItemBase and RootSource:IsCombatItemBase() then
      KillSourceType = CommonConst.ActorType.CombatItemBase
    end
  end
  return KillSourceType
end

function BP_MonsterCharacter_C:IsAllowedExp()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  if not Avatar:IsInDungeon() then
    return true
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local DungeonInfo = DataMgr.Dungeon[GameState.DungeonId]
  if not DungeonInfo then
    if DataMgr.HardBossDifficulty[GameState.DungeonId] then
      return true
    end
    return false
  end
  return not DungeonInfo.OnlyCombatReward
end

function BP_MonsterCharacter_C:Recovery(...)
  BP_MonsterCharacter_C.Super.Recovery(self, ...)
  self:SetCharacterTagIdle()
end

function BP_MonsterCharacter_C:OnDeadAnimationEnd()
  self.Mesh:SetCollisionProfileName("Ragdoll")
  if not self.IsSpawnedByMovieCaptureSequence then
    self.Mesh:SetAllBodiesBelowSimulatePhysics("root", true, false)
  end
  self.Mesh:SetAllBodiesPhysicsBlendWeight(1.0)
  self:BeginRagdollState("Ragdoll", "pelvis", -1, true, 1.0, 0.0, ERagdollStateType.RagdollStateDead)
  if self.DuringDyingHitFly then
    self.DuringDyingHitFly = nil
  end
end

function BP_MonsterCharacter_C:SetActionModeForBlackBoard(ActionMode)
  if self:GetOwnBlackBoardComponent() then
    self:GetOwnBlackBoardComponent():SetValueAsEnum("ActionMode", ActionMode)
  end
end

function BP_MonsterCharacter_C:MonsterCommonLeaveTag()
  if not DataMgr.MonsterStateLimit[self.AutoSyncProp.CharacterTag] then
    return
  end
  if 1 == DataMgr.MonsterStateLimit[self.AutoSyncProp.CharacterTag].ForbidAI then
    self:ClearStopBTFlag(self.AutoSyncProp.CharacterTag)
  end
end

function BP_MonsterCharacter_C:TriggerFallingCallable(GameMode)
  DebugPrint("OtherActor is Falling Dead. ActorName: ", self:GetName(), ", UnitId: ", self.UnitId, ", Eid: ", self.Eid, ", CreatorId: ", self.CreatorId, " CreatorType: ", self.CreatorType, ", BornPos: ", self.BornPos)
  if self.IsSummonMonster and self:IsSummonMonster() then
    local DirectSource = self:GetDirectSource()
    if not DirectSource then
      return
    end
    local AttachParent = self:GetAttachParentActor()
    if AttachParent then
      return
    end
    UNavigationFunctionLibrary.ActorToActorTeleport(self, DirectSource)
    self:EnableCheckOverlapPush({})
    if self.OnTriggerFallingCallable then
      self:OnTriggerFallingCallable()
    end
    self:Landed()
  elseif self.IsCaptureMonster and self:IsCaptureMonster() then
    local NearestPlayer
    local MinDis = 9999999
    for _, Player in pairs(GameMode:GetAllPlayer()) do
      if IsValid(Player) then
        local Dis = Player:GetDistanceTo(self)
        if MinDis > Dis then
          MinDis = Dis
          NearestPlayer = Player
        end
      end
    end
    if IsValid(NearestPlayer) then
      UNavigationFunctionLibrary.ActorToActorTeleport(self, NearestPlayer)
    end
  elseif self.IsAIControlled and self:IsAIControlled() and not self:IsNPC() then
    self:SetIsFallTrigger()
    Battle(GameMode):BattleOnDead(self.Eid, self.Eid, 0, EDeathReason.TriggerFalling)
  end
end

function BP_MonsterCharacter_C:TriggerWaterFallingCallable(GameMode)
  if self.IsCaptureMonster and self:IsCaptureMonster() then
    local NearestPlayer
    local MinDis = 9999999
    for _, Player in pairs(GameMode:GetAllPlayer()) do
      if IsValid(Player) then
        local Dis = Player:GetDistanceTo(self)
        if MinDis > Dis then
          MinDis = Dis
          NearestPlayer = Player
        end
      end
    end
    if IsValid(NearestPlayer) then
      UNavigationFunctionLibrary.ActorToActorTeleport(self, NearestPlayer)
    end
  elseif self.IsMonster and self:IsMonster() then
    self:SetIsFallTrigger()
    Battle(self):BattleOnDead(self.Eid, self.Eid, 0, EDeathReason.TriggerFalling)
  end
end

function BP_MonsterCharacter_C:CheckMonsterCanReach(Creator, IgnoreActorPos)
  local TwoPosPathType = UE4.UNavigationFunctionLibrary.CheckTwoPosHasPath(self:K2_GetActorLocation(), Creator:K2_GetActorLocation(), self)
  if TwoPosPathType == Const.PathTypeHasPath then
    return nil
  end
  local MonsPos = self:K2_GetActorLocation()
  local CreatorPos = Creator:K2_GetActorLocation()
  local DeltaAngel = 36
  local CheckRadius = self.CapsuleComponent:GetUnscaledCapsuleRadius() * 10
  local Forward = self:GetActorForwardVector()
  for index = 0, 9 do
    local CosAngle = UE4.UKismetMathLibrary.DegCos(DeltaAngel * index)
    local SinAngle = UE4.UKismetMathLibrary.DegSin(DeltaAngel * index)
    local TargetVec = FVector(Forward.X * CosAngle + Forward.Y * SinAngle, Forward.Y * CosAngle - Forward.X * SinAngle, 0) * CheckRadius + MonsPos
    local TargetVecPathType = UE4.UNavigationFunctionLibrary.CheckTwoPosHasPath(TargetVec, CreatorPos, self)
    if TargetVecPathType == Const.PathTypeHasPath then
      return TargetVec
    end
  end
  if IgnoreActorPos then
    return nil
  end
  return Creator:K2_GetActorLocation()
end

function BP_MonsterCharacter_C:SetIsFallTrigger()
  self.IsFallTrigger = true
end

function BP_MonsterCharacter_C:LeaveHitFlyTag()
end

function BP_MonsterCharacter_C:GetMonsterToTargetPitch()
  local Target = self.BBTarget
  if not Target then
    return 0
  end
  local TargetLocation = Target:K2_GetActorLocation()
  local SelfLocation = self:K2_GetActorLocation()
  local SelfToTarget = TargetLocation - SelfLocation
  local DesiredRotPitch = SelfToTarget:ToRotator().Pitch
  return DesiredRotPitch
end

function BP_MonsterCharacter_C:TreasureMonsterInRougLikeOnDead()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:SpeciaMonsterOnDead(self.UnitId)
  end
end

function BP_MonsterCharacter_C:AddHatredTargetByWaitRecover(TargetEid)
  local Target = Battle(self):GetEntity(TargetEid)
  if not Target:IsPlayer() and not Target:IsAIControlled() then
    return
  end
  if not Target:IsDead() then
    return
  end
  local PresetHatredValue = self:GetPresetHatredValue(Target, "ReasonWaitRecover")
  if self.TargetHatred:Find(TargetEid) then
    self:RemoveHatredTarget(TargetEid)
    self:AddHatredTarget(TargetEid, PresetHatredValue, PresetHatredValue)
  end
end

function BP_MonsterCharacter_C:ListenRecoverHatredEvent()
  EventManager:AddEvent(EventID.CharDie, self, self.AddHatredTargetByWaitRecover)
end

function BP_MonsterCharacter_C:RemoveRecoverHatredEvent()
  EventManager:RemoveEvent(EventID.CharDie, self)
end

function BP_MonsterCharacter_C:GetSplingAnim()
  if not self.IsCoverMontage then
    return
  end
  local CoverType = self.CoverPointInfo.IsCrouch
end

function BP_MonsterCharacter_C:GetCoverMontageAnimAsset(AnimName)
  local MontageInfo = DataMgr.Model[self.ModelId]
  local MontageFolder, MontagePrefix = self:GetHitMontageFolderAndPrefix()
  if not MontageFolder then
    return nil, nil
  end
  local MontageName = MontagePrefix .. AnimName
  local MontageFloderPath = MontageFolder .. "Locomotion/"
  local MontageAnimBpPath = MontageFloderPath .. MontageName .. Const.MontageSuffix .. "." .. MontageName .. Const.MontageSuffix
  return nil, MontageAnimBpPath
end

function BP_MonsterCharacter_C:IsLimitMontage()
  local SourceTag = DataMgr.MonsterStateLimit[self.AutoSyncProp.CharacterTag].SourceTag
  return SourceTag == Const.StunTag
end

function BP_MonsterCharacter_C:PlayLimitMontage(StunName)
  if self:IsLimitMontage() == false then
    return
  end
  local Path = self:GetLimitMontagePath(StunName)
  if nil == Path then
    return
  end
  self:PlayMontageByPath(Path, nil, false)
end

function BP_MonsterCharacter_C:StopLimitMontage(StunName)
  if self:IsLimitMontage() == false then
    return
  end
  local Path = self:GetLimitMontagePath(StunName)
  if nil == Path then
    return
  end
  local AnimationAsset = LoadObject(Path)
  if not AnimationAsset then
    return
  end
  self.EMAnimInstance:Montage_Stop(Const.MontageBlendOutTime, AnimationAsset)
end

function BP_MonsterCharacter_C:GetLimitMontagePath(StunName)
  local MontageFloder, MontagePrefix = self:GetHitMontageFolderAndPrefix()
  if nil ~= MontageFloder then
    local MontagePostfix = StunName .. "_Montage"
    local Path = MontageFloder .. "Combat/Hit/" .. MontagePrefix .. MontagePostfix
    return Path
  else
    return nil
  end
end

function BP_MonsterCharacter_C:GetSkillIdBySkillType(SkillId)
  return SkillId
end

function BP_MonsterCharacter_C:GetCurrentAnimationBlueprint(Id)
  if self.Data and self.Data.AnimCoverPath then
    return self.Data.AnimCoverPath
  end
  return BP_MonsterCharacter_C.Super.GetCurrentAnimationBlueprint(self, Id)
end

function BP_MonsterCharacter_C:IsContainCollapsedGraphTag(CollapsedGraph)
  if "None" == CollapsedGraph then
    return false
  end
  if self:HasAnyTags_Table(self, {CollapsedGraph}, false) then
    return true
  end
  return false
end

function BP_MonsterCharacter_C:BlockTickLod(bEnable, Tag, TickObjectFlag)
  if self.Data and self.Data.DisableTicklod then
    return
  end
  if TickObjectFlag | ETickObjectFlag.FLAG_CHARMOVEMENTCOMPONENT then
    GWorld.logger.errorlog("@wuzhijun\239\188\154BlockTickLod.\229\164\132\231\144\134\231\167\187\229\138\168\231\187\132\228\187\182\231\148\168 BlockTickLod_MoveComp")
    return
  end
  local SignificanceMgrSubsystem = USubsystemBlueprintLibrary.GetWorldSubsystem(self, UEMSignificanceMgrSubsystem)
  if not SignificanceMgrSubsystem then
    return
  end
  SignificanceMgrSubsystem:BlockTickLod(ESignificanceTag.Monster, bEnable, self, Tag, TickObjectFlag)
end

function BP_MonsterCharacter_C:BlockTickLod_BT(bEnable, Tag)
  if self.Data and self.Data.DisableTicklod then
    return
  end
  local SignificanceMgrSubsystem = USubsystemBlueprintLibrary.GetWorldSubsystem(self, UEMSignificanceMgrSubsystem)
  if not SignificanceMgrSubsystem then
    return
  end
  SignificanceMgrSubsystem:BlockTickLod(ESignificanceTag.MonsterBT, bEnable, self:GetController(), Tag, ETickObjectFlag.FLAG_ACTOR | ETickObjectFlag.FLAG_BTCOMPONENT)
end

function BP_MonsterCharacter_C:CheckOverlapPushForChangeCollision(Channel, NewResponse)
  local function SetCollision()
    if self.CapsuleComponent then
      self.CapsuleComponent:SetCollisionResponseToChannel(Channel, NewResponse)
    end
  end
  
  return self:EnableCheckOverlapPush({self, SetCollision})
end

function BP_MonsterCharacter_C:IsNeedHideInTalk()
  if IsStandAlone(self) then
    return GWorld.GameInstance:GetTalkContext():HasDisableMonsterSpawn()
  else
    return false
  end
end

function BP_MonsterCharacter_C:OnTalkEnableMonsterSpawn()
  self:SetWaitInitTag(false, Const.CharWaitInitTag.HideInTalk)
  EventManager:RemoveEvent(EventID.TalkEnableMonsterSpawn, self)
end

function BP_MonsterCharacter_C:ReceiveEndPlay(EndPlayReason)
  EventManager:RemoveEvent(EventID.TalkEnableMonsterSpawn, self)
  EventManager:RemoveEvent(EventID.CharDie, self)
  GWorld.GameInstance.GlobalLockOnTargets:Remove(self.Eid)
  if self.BossBloodUI then
    self.BossBloodUI:UnLoadSelf()
    self.BossBloodUI = nil
  end
  self.IsDestroied = true
end

function BP_MonsterCharacter_C:UpdateCdAndUseSkill(SkillId)
  local Skill = self:GetSkill(SkillId)
  Skill:ResetSkillCd()
  return self:UseSkill(SkillId, 0)
end

function BP_MonsterCharacter_C:ReuseSkill(SkillIndex)
  local SkillId = self:GetSeqSkill(SkillIndex)
  if 0 == SkillId then
    return false
  end
  local Skill = self:GetSkill(SkillId)
  if not Skill then
    return false
  end
  if Skill.SkillType == "Passive" then
    return false
  end
  self:AddTimer(0.05, self.UpdateCdAndUseSkill, true, 0, "ReuseSkillTimer", nil, SkillId)
end

function BP_MonsterCharacter_C:CallSuperFunction(FuncName, ...)
  BP_MonsterCharacter_C.Super[FuncName](self, ...)
end

function BP_MonsterCharacter_C:OnTimeDilationChanged(TimeDilation, CurrentTimeDilation)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if Player then
    Player:TimeDilationPostProcess(TimeDilation, CurrentTimeDilation)
  end
end

function BP_MonsterCharacter_C:SetTreasureMonsterTarget(TargetLocation)
  self:GetOwnBlackBoardComponent():SetValueAsVector("ExtractionLoc", TargetLocation)
end

function BP_MonsterCharacter_C:GetManualItemId()
  return -1
end

function BP_MonsterCharacter_C:CommonOnEMActorDestroy(DestroyReason)
end

AssembleComponents(BP_MonsterCharacter_C)
if BP_MonsterCharacter_C.TickComponent then
  AMonsterCharacter.SetHasLuaComponentTick(true)
end
return BP_MonsterCharacter_C
