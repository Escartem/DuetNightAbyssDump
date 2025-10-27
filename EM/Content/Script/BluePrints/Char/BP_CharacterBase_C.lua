require("UnLua")
local EffectResults = require("BluePrints.Combat.BattleLogic.EffectResults")
local EMCache = require("EMCache.EMCache")
local TimeUtils = require("Utils.TimeUtils")
local StoryPlayableUtils = require("BluePrints.Story.StoryPlayableUtils").StoryPlayableUtils
local GMVariable = require("BluePrints.UI.GMInterface.GMVariable")
local MiscUtils = require("Utils.MiscUtils")
local BP_CharacterBase_C = Class({
  "BluePrints.Combat.Components.CharacterComponent"
})
BP_CharacterBase_C._components = {
  "BluePrints.Combat.Components.AccessoryComponent",
  "BluePrints.Combat.Components.ActorTypeComponent",
  "BluePrints.Combat.Components.CharacterBattleEventComponent",
  "BluePrints.Combat.Components.EffectCreatureComponent",
  "BluePrints.Combat.Components.PassiveEffectComponent",
  "BluePrints.Combat.Components.SkillComponent",
  "BluePrints.Combat.Components.WeaponComponent",
  "BluePrints.Combat.Components.DestructableComponent",
  "BluePrints.Char.CharacterComponent.CharacterTagLogic.CharacterTagComponent",
  "BluePrints.Char.CharacterComponent.ChangeRoleComponent",
  "BluePrints.Char.CharacterComponent.HitLogicComponent",
  "BluePrints.Char.CharacterComponent.TagComponent",
  "BluePrints.Char.CharacterComponent.ActionLogicComponent",
  "BluePrints.Char.CharacterComponent.PhantomComponent",
  "BluePrints.Common.DelayFrameComponent",
  "BluePrints.Char.CharacterComponent.CheckOverlapAndPushComponent"
}

function BP_CharacterBase_C:Initialize(Initializer)
  self.StartBulletJumpTime = -1
  self.PrepareIntoBulletJump = -1
  self.LuaTimerHandles = {}
  self.LastZSpeed = 0
  self.WallJumpCount = 0
  self.OriginCapsuleRadius = self.CapsuleComponent:GetUnscaledCapsuleRadius()
  self.OriginHalfHeight = self.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
  self.LastBipHeight = self.Mesh:GetSocketTransform("Bip001", 3)
  self.PlayAddtiveHitTime = 0
  self.HitMontageRule = nil
  rawset(self, "AutoSyncProp", self.AutoSyncProp)
end

function BP_CharacterBase_C:GetShootingTargets()
  return self.ShootingTargets
end

function BP_CharacterBase_C:ClearShootingTargets()
  self.ShootingTargets:Clear()
end

function BP_CharacterBase_C:ReceiveBeginPlay()
  EventManager:AddEvent(EventID.OnBattleReady, self, self.OnBattleReady_TryInitCharacterInfo)
  self.LuaTimerHandles = {}
end

function BP_CharacterBase_C:OnBattleReady_TryInitCharacterInfo(_Battle)
  if Battle(self) == _Battle then
    self:TryInitCharacterInfo("Battle")
  end
end

function BP_CharacterBase_C:GetConstAimRotLerpSpeed_Lua()
  return Const.AimRotLerpSpeed
end

function BP_CharacterBase_C:AttackToFire()
end

function BP_CharacterBase_C:AttackToNormal()
end

function BP_CharacterBase_C:SetSkillCD(Skill, RetCode)
  if self:HandleCheckSkillNodeCondition(RetCode, Skill.SkillId, 0) and not Skill.StopSkillCalcCD then
    self:SetSkillTimestamp(Skill.SkillId, true)
  end
end

function BP_CharacterBase_C:IsSkillFinished()
  return self.SkillTimeLine.SkillFinish
end

function BP_CharacterBase_C:GetDataInfo(RoleId)
  if not RoleId or 0 == RoleId then
    return
  end
  if self:IsPlayer() or self:IsPhantom() then
    return DataMgr.BattleChar[RoleId]
  elseif self:IsAIControlled() then
    return DataMgr.BattleMonster[RoleId]
  end
end

function BP_CharacterBase_C:GetSkillInitInfo(SkillInfos)
  local Res = TArray(FSkillInitInfo)
  if SkillInfos then
    for _, SkillData in ipairs(SkillInfos) do
      local SkillLevel = SkillData.SkillInfo.Level or Const.DefaultSkillLevel
      local SkillGrade = SkillData.SkillInfo.Grade or Const.DefaultSkillGrade
      local SkillInitInfo = FSkillInitInfo()
      SkillInitInfo.SkillId = SkillData.SkillId
      SkillInitInfo.SkillLevel = SkillLevel
      SkillInitInfo.SkillGrade = SkillGrade
      Res:Add(SkillInitInfo)
    end
  end
  return Res
end

function BP_CharacterBase_C:GetHitMontageRule()
  if self.HitMontageRule then
    return self.HitMontageRule
  end
  if self:IsMonster() then
    local MonsterData = DataMgr.Monster[self.UnitId]
    if MonsterData and MonsterData.HitMontageRule then
      self.HitMontageRule = DataMgr.HitMontageData[MonsterData.HitMontageRule]
    end
  end
  if not self.HitMontageRule then
    local ModelData = DataMgr.Model[self.ModelId]
    if ModelData and ModelData.HitMontageRule then
      self.HitMontageRule = DataMgr.HitMontageData[ModelData.HitMontageRule]
    end
  end
  if not self.HitMontageRule then
    self.HitMontageRule = DataMgr.Model[self.ModelId]
  end
  return self.HitMontageRule
end

function BP_CharacterBase_C:CheckCanPart()
  return self:IsPlayer()
end

function BP_CharacterBase_C:StopMontage()
  if not self.EMAnimInstance then
    return
  end
  self.EMAnimInstance:Montage_Stop(Const.MontageBlendOutTime)
end

function BP_CharacterBase_C:PlayMontageByPath(MontagePath, StopCallback, NoStopMontages, SectionName)
  local AnimationAsset = LoadObject(MontagePath)
  if not AnimationAsset then
    DebugPrint("Error: Load Montage Failed!!!", MontagePath)
    return nil
  end
  return self:PlayMontageByAsset(AnimationAsset, StopCallback, NoStopMontages, SectionName)
end

function BP_CharacterBase_C:PlayMontageByAsset(MontageAsset, StopCallback, NoStopMontages, SectionName)
  if not MontageAsset then
    return nil
  end
  if not NoStopMontages then
    self.EMAnimInstance:Montage_Stop(Const.MontageBlendOutTime)
  end
  if StopCallback then
    StopCallback(self)
  end
  self:SetCanExtractZVelocity()
  self:ResetAllCancelTag()
  self.CurrentHitMontage = MontageAsset
  local RetVal = self.EMAnimInstance:Montage_Play(MontageAsset, 1.0, UE4.EMontagePlayReturnType.Duration, 0.0, not NoStopMontages), MontageAsset
  if SectionName then
    self.EMAnimInstance:Montage_JumpToSection(SectionName, MontageAsset)
  end
  return RetVal, MontageAsset
end

function BP_CharacterBase_C:GetHitMontageFolderAndPrefix()
  local ModelId = self.ModelId
  local ModelData = DataMgr.Model[ModelId]
  if nil ~= ModelData and nil ~= ModelData.MontageFolder then
    return ModelData.MontageFolder, ModelData.MontagePrefix
  else
    return nil, nil
  end
end

function BP_CharacterBase_C:PressSkill1(IsTickUse)
  print("use skill 1")
end

function BP_CharacterBase_C:PressSkill2()
  print("use skill 2")
end

function BP_CharacterBase_C:PressSkill3()
  print("use skill 3")
end

function BP_CharacterBase_C:PressOpenMenu()
  print("use OpenMenu")
end

function BP_CharacterBase_C:SupportSkill()
  print("use skill SupportSkill")
end

function BP_CharacterBase_C:StartHeavyAttack(IsTickUse)
  print("use heavy attack")
end

function BP_CharacterBase_C:CallLanded()
  self:Landed()
end

function BP_CharacterBase_C:Landed()
  if not self.EMAnimInstance then
    return
  end
  if self.EMAnimInstance.CurrentJumpState == Const.Climb then
    return
  end
  if self:CharacterInTag("Avoid") then
    return
  end
  self:ResetJumpState_Cpp()
  print(_G.LogTag, "CallLandedCallLandedCallLandedCallLanded")
  if not self:CharacterInTag("Slide") and not self.LuaTimerHandles.HitRepel then
    if self.EMAnimInstance.FallingSpeed and self.EMAnimInstance.FallingSpeed < Const.LandHeavySpeed and self:SetCharacterTag("LandHeavy") then
      local LandHeavyTime = DataMgr.PlayerRotationRates.LandHeavyTime.ParamentValue[1]
      self:AddTimer_Combat(LandHeavyTime, self.SetCharacterTagIdle, false, 0, "LandHeavy")
      self.EMAnimInstance.FallingSpeed = 0
    end
    if not self:CharacterInTag("Shooting") and not self:CharacterInTag("Idle") and not self:CharacterInTag("LandHeavy") then
      self:SetCharacterTagIdle()
    end
  end
  self.JumpCount = 0
  self.BulletJumpCount = 0
  self.AutoSyncProp.IsBulletJumping = false
  self.ImpendingSetted = false
  local Rotation = self:K2_EMGetActorRotation()
  self:K2_EMSetActorRotation({
    Yaw = Rotation.Yaw,
    Pitch = 0,
    Roll = Rotation.Roll
  })
  self.bBulletJumpRotation = false
  self.BulletJumpRotation = nil
  self.LastZSpeed = nil
  if self:IsPlayer() or self:IsPhantom() then
    self:ChangeOrientControll()
  else
  end
end

function BP_CharacterBase_C:HasMoveInput()
  return self.IsMoveInput
end

function BP_CharacterBase_C:SetDeathInfo(DeathInfo)
  if DeathInfo and DeathInfo.IsRealDead then
    self:SetDead(true)
  else
    self:SetDead(false)
  end
  if DeathInfo and DeathInfo.RecoveryCount then
    self:SetRecoveryCount(DeathInfo.RecoveryCount)
  end
end

function BP_CharacterBase_C:CheckCanRecovery()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return true
  end
  return GameMode:CheckEntityCanRecover(self)
end

function BP_CharacterBase_C:ServerRecoverOther_Impl(TargetEid, IsBegin, Speed, Reason)
  Battle(self):RecoverOther(self.Eid, TargetEid, IsBegin, {Speed = Speed}, Reason)
end

function BP_CharacterBase_C:GetRemainRecoveryTimes()
  local MaxRecoveryCount = self:GetRecoveryMaxCount()
  local RecoveryCount = self:GetRecoveryCount()
  if MaxRecoveryCount and RecoveryCount then
    return MaxRecoveryCount - RecoveryCount
  end
  return 0
end

function BP_CharacterBase_C:CheckHaveDyingCountDown()
  if self:IsPlayer() then
    if not IsStandAlone(self) then
      return true
    end
  elseif self:IsPhantom() and self.IsHostage == true then
    return true
  end
  return false
end

function BP_CharacterBase_C:Recovery(NotRecoverAttr)
  if IsAuthority(self) then
    if self:IsDead() then
      self:SetDead(false, 0, 0, 0)
      if not NotRecoverAttr then
        self:SetAttr("Hp", self:GetAttr("MaxHp"))
        self:CalcHpPercent()
        self:SetAttr("ES", self:GetAttr("MaxES"))
        self:SetAttr("Sp", self:GetAttr("InitSp"))
        self:RecoveryPassiveEffects()
      end
    end
  else
    self:SetDead(false, 0, 0, 0)
  end
  if IsStandAlone(self) or IsClient(self) then
    self:RefreshClientSkillLogicComponents()
  end
  self.AlreadyDead = false
  if MiscUtils.IsAutonomousProxy(self) or IsStandAlone(self) then
    self.DodgeCount = 0
  end
  EventManager:FireEvent(EventID.CharRecover, self.Eid)
  Battle(self):TriggerBattleEvent(BattleEventName.OnRecover, self)
  self.Overridden.Recovery(self)
end

function BP_CharacterBase_C:QuickRecovery(NotRecoverAttr)
  if not self:IsDead() then
    return
  end
  self.Super.Recovery(self, NotRecoverAttr)
  self:TryLeaveDying()
  self.EMAnimInstance:Montage_Stop(0)
  self:SetCharacterTag("Recovery")
  self:SetCharacterTag("Idle")
  if self:IsPlayer() then
    self:ResetForbidTag("Battle")
    self:OnRecoverDissolve()
  end
end

function BP_CharacterBase_C:SetHitDurationTime(HitType, HitMontageTime)
  if not HitMontageTime then
    return
  end
  if self.LuaTimerHandles[HitType] ~= nil then
    self:RemoveTimer(self.LuaTimerHandles[HitType])
    self.LuaTimerHandles[HitType] = nil
  end
  self.LuaTimerHandles[HitType] = self:AddTimer_Combat(HitMontageTime, self.SetCharacterTagIdle)
end

function BP_CharacterBase_C:PlayHitMontage(HitType, StopCallback, NoStopMontages, SectionName)
  local MontageFolder, MontagePrefix = self:GetHitMontageFolderAndPrefix()
  if nil ~= MontageFolder then
    local HitMontage = MontageFolder .. "Combat/Hit/" .. MontagePrefix .. HitType .. Const.MontageSuffix .. "." .. MontagePrefix .. HitType .. Const.MontageSuffix
    return self:PlayMontageByPath(HitMontage, StopCallback, NoStopMontages, SectionName)
  end
end

function BP_CharacterBase_C:CheckHitMontage(HitType)
  local MontageFolder, MontagePrefix = self:GetHitMontageFolderAndPrefix()
  if nil ~= MontageFolder then
    local HitMontagePackageName = MontageFolder .. "Combat/Hit/" .. MontagePrefix .. HitType .. Const.MontageSuffix
    return UResourceLibrary.CheckResourceExistOnDisk(HitMontagePackageName)
  end
  return false
end

function BP_CharacterBase_C:GetHitFlyCD()
  if self:IsPlayer() then
    return DataMgr.PlayerRotationRates.HitFlyCD.ParamentValue[1]
  else
    return Const.DefaultCD
  end
end

function BP_CharacterBase_C:GetHitRepelCD()
  if self:IsPlayer() then
    return DataMgr.PlayerRotationRates.HitRepelCD.ParamentValue[1]
  else
    return Const.DefaultCD
  end
end

function BP_CharacterBase_C:GetHeavyHitCD()
  if self:IsPlayer() then
    return DataMgr.PlayerRotationRates.HeavyHitCD.ParamentValue[1]
  else
    return Const.DefaultCD
  end
end

function BP_CharacterBase_C:GetBoneHitCD()
  if self:IsPlayer() then
    return DataMgr.PlayerRotationRates.BoneHitCD.ParamentValue[1]
  else
    return Const.DefaultCD
  end
end

function BP_CharacterBase_C:GetCauseHitData(CauseHitId, CauseHitType)
  local CauseHitParam = DataMgr.HitPerformanceData[CauseHitId]
  if not CauseHitParam then
    return nil
  end
  if CauseHitType == UE4.ECauseHitType.CauseHitTypeDie then
    return CauseHitParam.CauseDieParam
  elseif CauseHitType == UE4.ECauseHitType.CauseHitTypeFirst then
    return CauseHitParam.FirstHitParam
  elseif CauseHitType == UE4.ECauseHitType.CauseHitTypeNormal then
    return CauseHitParam.CauseHitParam
  end
  return
end

function BP_CharacterBase_C:ApplyGrabHitGetup()
  if self:CharacterInTag("GrabHit") then
    self:SetCharactertagIdle()
  end
end

function BP_CharacterBase_C:HitFlyDownRestore()
  if not self:IsPlayer() and self:CharacterInTag("HitFly") then
    self:SetCharacterTagIdle()
  end
  if self.LuaTimerHandles.HitFlyDown ~= nil then
    self:RemoveTimer(self.LuaTimerHandles.HitFlyDown)
    self.LuaTimerHandles.HitFlyDown = nil
  end
end

function BP_CharacterBase_C:CheckBuffCanEnterIdleTag(Tag)
  if not self.EMAnimInstance or not self.EMAnimInstance.CheckCanEnterIdleTag then
    return false
  end
  return self.EMAnimInstance:CheckCanEnterIdleTag(Tag)
end

function BP_CharacterBase_C:SetIdleTag(Tag)
  if not self.EMAnimInstance and not self.EMAnimInstance.SetIdleTag then
    return
  end
  self.EMAnimInstance:SetIdleTag(Tag)
end

function BP_CharacterBase_C:GetIdleTag()
  local AnimInst = self.EMAnimInstance
  if not AnimInst or not AnimInst.IdleTag then
    return
  end
  return AnimInst.IdleTag
end

function BP_CharacterBase_C:SetArmoryTag(ArmoryTag, bKeepWeapon)
  local NoWeaponIdleTag = Const.ArmoryIdleTags[ArmoryTag]
  self.LastArmoryTag = self.ArmoryTag
  self.ArmoryTag = ArmoryTag
  if self.UsingWeapon and "None" == ArmoryTag then
    self.UsingWeapon:SetWeaponTypeChanged(false)
  end
  if ArmoryTag and not NoWeaponIdleTag then
    local CurrentUsingWeapon = self.UsingWeapon
    self:ChangeUsingWeaponByType(ArmoryTag)
    print(_G.LogTag, "SetArmoryTag", ArmoryTag, self.UsingWeapon)
    if CurrentUsingWeapon ~= self.UsingWeapon then
      self.UsingWeapon:SetWeaponTypeChanged(true)
      self:BindWeaponToHand()
    end
  else
    if not bKeepWeapon then
      self:ChangeUsingWeaponByType(nil)
    end
    self:UnBindWeaponFromHand()
  end
  self.IsEnterArmory = ArmoryTag
  if self.PlayerAnimInstance then
    self.PlayerAnimInstance.IsEnterArmory = ArmoryTag
    self.PlayerAnimInstance:EnterArmoryIdle()
  end
  if "None" ~= self.IsEnterArmory then
    self:SetArmoryIdleTag()
  else
    self:StopArmoryIdle()
  end
end

function BP_CharacterBase_C:PlayShowIdleMontage(IldeTag)
  local MontageFolder = DataMgr.Model[self.ModelId].MontageFolder
  local MontagePrefix = DataMgr.Model[self.ModelId].MontagePrefix
  local MontagePath = MontageFolder .. "Armory/" .. MontagePrefix .. IldeTag .. "_Show_Montage"
  print(_G.LogTag, "PlayShowIdleMontage", MontagePath)
  self:PlayMontageByPath(MontagePath)
end

function BP_CharacterBase_C:StopArmoryIdle()
  self:ShouldEnableHandIk()
  if self.EMAnimInstance then
    self.EMAnimInstance:Montage_StopSlotByName(0, "ArmoryIdle")
  end
  self:EmptyCurResourceId()
end

function BP_CharacterBase_C:GetUsingWeaponType(AmoryType)
  if not self[AmoryType .. "Weapon"] then
    return Const.ArmoryIdleTags.None
  end
  return self[AmoryType .. "Weapon"]:GetWeaponType()
end

function BP_CharacterBase_C:CharacterHasAnyTag(Tag)
  local SkillId = self:GetSkillByType(UE.ESkillType.Shooting)
  local Skill = self:GetSkill(SkillId)
  if not Skill then
    return
  end
  local Weapon = Skill.Weapon
  if not Weapon then
    return
  end
  return Weapon:CheckWeaponState(Tag)
end

function BP_CharacterBase_C:ShouldResetJump(Tag)
  return "HitFly" == Tag or "HeavyHit" == Tag
end

function BP_CharacterBase_C:ResetJumpState(KeepJumpCount)
  if not KeepJumpCount then
    self.JumpCount = 0
  end
  self:SetCurrentJumpState(Const.NormalState)
end

function BP_CharacterBase_C:EnterStunFloatTag()
  self:SetRagdollFloating(true)
end

function BP_CharacterBase_C:LeaveStunFloatTag()
  self:SetRagdollFloating(false)
end

function BP_CharacterBase_C:MonsterCommonLeaveTag()
end

function BP_CharacterBase_C:UpdateBillboardComp_BuffSpecialEffect(ShowHotUI, CharInvisible, InvincibleUI)
  if self.BillBoardComponent then
    self.BillBoardComponent:BuffChange_SpecialEffect(ShowHotUI, CharInvisible, InvincibleUI)
  end
end

function BP_CharacterBase_C:OnRealEnterDying()
  if not Battle(self) then
    return
  end
  if not IsDedicatedServer(self) and self:IsMainPlayer() then
    self:ShowPlayerDeadUI()
  end
  Battle(self):TriggerBattleEvent(BattleEventName.OnTeammateCanRecovery, self)
  if self.IsHostage then
    local GameMode = UGameplayStatics.GetGameMode(self)
    if GameMode then
      GameMode:TriggerDungeonComponentFun("OnHostageDying", self)
    end
  end
end

function BP_CharacterBase_C:OnRealDie()
end

function BP_CharacterBase_C:UpdateRecovererInfo(Eid, RecoverySpeed)
  self.RecoverTargets = self.RecoverTargets or {}
  if RecoverySpeed <= 0 then
    self.RecoverTargets[Eid] = nil
  else
    self.RecoverTargets[Eid] = RecoverySpeed
  end
  if not next(self.RecoverTargets) then
    DebugPrint("Tianyi@ \230\149\145\229\138\169\232\128\133: " .. self.Eid .. "\228\184\141\229\134\141\230\149\145\229\138\169\229\175\185\232\177\161")
    self.IsRecoveringOthers = false
  else
    DebugPrint("Tianyi@ \230\149\145\229\138\169\232\128\133: " .. self.Eid .. "\230\173\163\229\156\168\230\149\145\229\138\169\229\175\185\232\177\161")
    self.IsRecoveringOthers = true
  end
end

function BP_CharacterBase_C:DestroyActorOnDead(bNormalDeath, DeathReason)
  self:DestroyActorOnDead_CPP(bNormalDeath, DeathReason)
end

function BP_CharacterBase_C:ClearCharacterBattleInfo(NormalDeath, DeathReason)
  self.BornInfo = nil
  self:DestroyActorOnDead_CPP(NormalDeath, DeathReason)
  self:RemoveAllEffectCreature(NormalDeath)
end

function BP_CharacterBase_C:StopFire(bStillHoldFire, OnlyReleaseFire)
end

function BP_CharacterBase_C:ResetIdle()
  if self:IsDead() then
    return
  end
  self:StopSkill()
  self:StopFire(false, false)
  self:ResetJumpState_Cpp()
  self:RealStopSlide(false)
  if self:IsPlayer() then
    self:StopJump()
    self:SetHoldCrouch(false)
    if self:CharacterInTag("Avoid") then
      self:StopDodge(true, 0)
    end
    self:RemoveClearInputCache()
    self:FlushPlayerPressedKeys()
    self.MoveInputCache:Set(0, 0, 0)
    self.MoveInput:Set(0, 0, 0)
    if self:GetMovementComponent() then
      self:GetMovementComponent():ConsumeInputVector()
    end
  end
  self:ResetCapSize()
  self:GetMovementComponent().bForceStop = true
  self:LaunchCharacter(FVector(0, 0, 0), true, true)
  self:StopAllCurrentMove()
  if self.LuaTimerHandles then
    self:RemoveTimer(self.LuaTimerHandles.BulletJump)
  end
  self:SetCharacterTagIdle()
  if not self.EMAnimInstance then
    return
  end
  local AnimInstance = self.EMAnimInstance
  AnimInstance:StopSkillAnimation()
  AnimInstance:Montage_Stop(0)
  if AnimInstance.ForceToIdle then
    AnimInstance:ForceToIdle()
  end
  if AnimInstance.RootMotionMode ~= ERootMotionMode.RootMotionFromMontagesOnly then
    AnimInstance:SetRootMotionMode(ERootMotionMode.RootMotionFromMontagesOnly)
  end
end

function BP_CharacterBase_C:OnTriggerFallingCallable()
  self:ResetIdle()
  self:FinishGather()
  self:HandleDestroyCreatureOnFalling()
  self:HandleRemoveBuff(self.Eid, 1)
  self:GetGrabLogicComponent():ReleaseAllGrabTargets()
  if self.CurrentSkillId then
    if self:IsPlayer() then
      self.bSkill1LongPress = false
      self.bSkill2LongPress = false
    end
    self:StopSkill()
    self:ClearInputCache()
  end
  self:LaunchCharacter(FVector(0, 0, -100), true, true)
end

function BP_CharacterBase_C:ResetBulletRotation()
  self.bBulletJumpRotation = false
  self.BulletJumpRotation = nil
  self.RecoverPitch = true
end

function BP_CharacterBase_C:CheckCeilingHit(Height)
  local Start = self:K2_GetActorLocation()
  local End = Start + FVector(0, 0, Height + self.CapsuleComponent:GetUnscaledCapsuleHalfHeight())
  local HitResult = FHitResult()
  local bHit = UE4.UKismetSystemLibrary.LineTraceSingle(self, Start, End, ETraceTypeQuery.TraceSkillCreatureBlock, false, nil, 0, HitResult, true)
  return bHit
end

function BP_CharacterBase_C:GetFloorInfo()
  local FindFloorResult = FFindFloorResult()
  self:GetMovementComponent():K2_FindFloor(self.CapsuleComponent:K2_GetComponentLocation(), FindFloorResult)
  return FindFloorResult
end

function BP_CharacterBase_C:GetFloorDist(FindFloorResult)
  local FloorDist = FindFloorResult.FloorDist
  if FindFloorResult.bLineTrace then
    FloorDist = FindFloorResult.LineDist
  end
  return FloorDist
end

function BP_CharacterBase_C:IsCharacterWalking()
  return self:GetMovementComponent():IsWalking() and 0 ~= self:GetVelocity():Size2D() and (self:CharacterInTag("Idle") or self:CharacterInTag("Name_None"))
end

function BP_CharacterBase_C:IsCharacterIdling()
  return self:GetMovementComponent():IsWalking() and 0 == self:GetVelocity():Size2D()
end

function BP_CharacterBase_C:IsCharacterInAirAndFalling()
  local Falling = false
  if 0 == self.JumpCount and self:GetMovementComponent():IsFalling() and (self:GetVelocity().Z >= 0 and self:GetVelocity().Z <= Const.VectorSizeZero or self:GetVelocity().Z <= 0) then
    return true
  end
  if self.LastZSpeed ~= nil then
    Falling = self.LastZSpeed * self:GetVelocity().Z <= 0
    self.LastZSpeed = self:GetVelocity().Z
  end
  if self.LastZSpeed ~= nil and Falling and self:GetMovementComponent():IsFalling() then
    return true
  end
  return false
end

function BP_CharacterBase_C:GetAimRotation()
  return self.AimingRotation
end

function BP_CharacterBase_C:GetLittleOffset()
  return Const.LittleOffset
end

function BP_CharacterBase_C:GetAllAttaches()
  local Attaches = {}
  if self.Weapons then
    for _, v in pairs(self.Weapons) do
      table.insert(Attaches, v)
    end
  end
  if self.GetAccessories then
    for _, v in pairs(self:GetAccessories()) do
      table.insert(Attaches, v)
    end
  end
  return Attaches
end

function BP_CharacterBase_C:OnSpawnedByMovieCaptureSequence()
  self.Overridden.OnSpawnedByMovieCaptureSequence(self)
  if self.Weapons then
    for _, Weapon in pairs(self.Weapons) do
      if IsValid(Weapon) then
        Weapon:SetActorHiddenInGame(true)
      end
    end
  end
end

function BP_CharacterBase_C:InitRoleInfo()
end

function BP_CharacterBase_C:CheckIfEffectHitTarget(NotifyName)
  if not self.SkillTimeLine.CurrentSkillNode then
    return false
  end
  local EffectIds = self.SkillTimeLine.CurrentSkillNode:GetEffectIDsByNotifyName(NotifyName)
  for i = 1, #EffectIds do
    local EffectInfo = DataMgr.SkillEffects[EffectIds[i]]
    local TargetEids = EffectInfo.TargetFilter and Battle(self):DoTargetFilter(self, nil, DataMgr.SkillEffects[EffectIds[i]].TargetFilter, EffectInfo.AllowSkillRangeModify or false, EffectInfo.AttackRangeType or "", false, 0)
    if TargetEids and TargetEids:Length() > 0 then
      return true
    end
  end
  return false
end

function BP_CharacterBase_C:IsEqualCurrentWeaponAttribute()
  if self:GetCurrentWeapon() == nil then
    return false
  end
  local OwnerAttribute = self:GetAttr("Attribute")
  local WeaponAttribute = self:GetCurrentWeapon():GetAttr("Attribute")
  return OwnerAttribute == WeaponAttribute
end

function BP_CharacterBase_C:DestroyPlayer()
  self:K2_DestroyActor()
end

function BP_CharacterBase_C:GetBattleCharBodyType()
  local DefaultBodyType = "Girl"
  if not self.CurrentRoleId then
    LogError("GetBattleCharBodyType: CurrentRoleId is nil")
    return DefaultBodyType
  end
  local CharData = DataMgr.BattleChar[self.CurrentRoleId]
  if not CharData then
    LogError("GetBattleCharBodyType: No BattleChar found for ID", self.CurrentRoleId)
    return DefaultBodyType
  end
  local BattleCharTags = CharData.BattleCharTag
  if BattleCharTags then
    local BodyTypes = {
      "Girl",
      "Boy",
      "Loli",
      "Woman",
      "Man"
    }
    for _, value in ipairs(BattleCharTags) do
      for _, type in ipairs(BodyTypes) do
        if value == type then
          return type
        end
      end
    end
  end
  return DefaultBodyType
end

function BP_CharacterBase_C:SetCollisionType_Lua(ComponentName, ChannelIndex, Response, Reset)
  if Reset then
    self[ComponentName]:SetCollisionResponseToAllChannels(ECollisionResponse.ECR_Ignore)
  end
  self[ComponentName]:SetCollisionResponseToChannel(ChannelIndex, Response)
end

function BP_CharacterBase_C:HandleStuck(Hit)
  local ActorLocation = self:K2_GetActorLocation()
  local FixedLocation = ActorLocation + FVector(Hit.Normal.X, Hit.Normal.Y, Hit.Normal.Z) * Hit.PenetrationDepth
  self:K2_SetActorLocation(FixedLocation, false, nil, false)
end

function BP_CharacterBase_C:AddInteractiveTrigger()
  if self.InteractiveTriggerComponent == nil then
    local BPClass = LoadClass("/Game/BluePrints/Story/Interactive/Base/BP_InteractiveTriggerComponent.BP_InteractiveTriggerComponent")
    self.InteractiveTriggerComponent = self:AddComponentByClass(BPClass, false, FTransform(), false)
    self.InteractiveTriggerComponent:InitOnPlayerPossessed()
    if self.bForbidInteractiveTrigger then
      self.InteractiveTriggerComponent:SetIsCanTrigger(false)
    end
  end
end

function BP_CharacterBase_C:GetHeadWidgetComponent()
  return self.HeadWidgetComponent
end

function BP_CharacterBase_C:InitHeadWidgetComponent()
  if self.HeadWidgetComponent then
    return
  end
  local HeadUISubsystem = UNpcHeadUISubsystem.GetHeadUISubsystem(self)
  if not HeadUISubsystem then
    return
  end
  self.HeadWidgetComponent = HeadUISubsystem:InitHeadWidgetComponent(self)
end

function BP_CharacterBase_C:EnableHeadWidget(WidgetName, bEnable, ...)
  if bEnable then
    self:InitHeadWidgetComponent()
  end
  if self.HeadWidgetComponent then
    if bEnable then
      if self.HeadWidgetComponent:NeedForceInit() then
        self.HeadWidgetComponent:AdjustSelfTransform()
      end
      self.HeadWidgetComponent:EnableWidget(WidgetName, ...)
    else
      self.HeadWidgetComponent:DisableWidget(WidgetName, ...)
    end
  end
end

function BP_CharacterBase_C:SetPlayerMaxMovingSpeed(Rate)
  if Rate < 0 then
    Rate = 0
  end
  if IsAuthority(self) then
    self.SpeedRate = Rate
  end
  self:SetWalkSpeed()
end

function BP_CharacterBase_C:RecoverPlayerMovingSpeed()
  if IsAuthority(self) then
    self.SpeedRate = 1
  end
  self:SetWalkSpeed()
end

function BP_CharacterBase_C:GetMoveRate()
  return self.PlayerSlideAtttirbute.NormalWalkSpeed / DataMgr.PlayerRotationRates.NormalWalkSpeed.ParamentValue[1]
end

function BP_CharacterBase_C:GetMovingSpeed()
  return self.PlayerSlideAtttirbute.NormalWalkSpeed, self.PlayerSlideAtttirbute.CrouchWalkSpeed
end

function BP_CharacterBase_C:SetMaxMovingSpeedByInfo(Info)
  self.PlayerSlideAtttirbute.NormalWalkSpeed = Info.NormalWalk
  self.PlayerSlideAtttirbute.CrouchWalkSpeed = Info.CrouchWalk
  self:SetWalkSpeed()
end

function BP_CharacterBase_C:GetMaxMovingSpeedInfo()
  return {
    NormalWalk = self.PlayerSlideAtttirbute.NormalWalkSpeed,
    CrouchWalk = self.PlayerSlideAtttirbute.CrouchWalkSpeed
  }
end

function BP_CharacterBase_C:IsSeating()
  return self:GetCharacterTag() == "Seating"
end

function BP_CharacterBase_C:TestEnterTag(TagName)
  DebugPrint(self.Eid .. " Enter Tag " .. TagName)
end

function BP_CharacterBase_C:TestLeaveTag(TagName)
  DebugPrint(self.Eid .. " Enter Tag " .. TagName)
end

function BP_CharacterBase_C:HandleCheckSkillNodeCondition(RetCode, SkillId, NodeId)
  if RetCode == ESkillNodeCondRetCode.Success then
    return true
  end
  if RetCode == ESkillNodeCondRetCode.OutOfBullet then
    if self:IsMainPlayer() then
      local Info = DataMgr.SkillNode[NodeId]
      if Info and not self.RangedWeapon:IsAllBulletEnough(Info.CostBullet) then
        EventManager:FireEvent(EventID.OutOfBullet)
      end
    end
    self.RangedWeapon:SetWeaponState("NoBullet", true)
  elseif RetCode == ESkillNodeCondRetCode.OutOfSp then
    if self:IsMainPlayer() then
      UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, "UI_TIP_MP")
    end
  elseif RetCode == ESkillNodeCondRetCode.OverHeat then
    self.RangedWeapon:SetWeaponState("OverHeat", true)
  end
  return false
end

function BP_CharacterBase_C:ApplyEnterTag_Lua(NewTag)
  return self:ApplyEnterCharacterTag(NewTag)
end

function BP_CharacterBase_C:ApplyLeaveTag_Lua(OldTag, NewTag)
  return self:ApplyLeaveCharacterTag(OldTag, NewTag)
end

function BP_CharacterBase_C:CanLeaveTag_Lua(TagName)
  return self:CanLeaveCharacterTag(TagName)
end

function BP_CharacterBase_C:RotateOffset(RotationAngle, OnFinished, MontageName)
  if self.EMAnimInstance == nil and nil == self.NpcAnimInstance then
    StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
    return
  end
  if self.EMAnimInstance then
    if not self.EMAnimInstance:CanTurnInPlace() or math.abs(RotationAngle) < 10 then
      StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
    else
      function self.OnStoryActionFinished()
        if self.OnStoryActionFinished then
          StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
        end
        self.OnStoryActionFinished = nil
      end
      
      self:TurnByMotionWarping(RotationAngle, function()
        StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
      end, MontageName)
    end
  end
  if self.NpcAnimInstance then
    if MontageName then
      local ModelId = self:GetCharModelComponent():GetCurrentModelId()
      local ModelData = DataMgr.Model[ModelId]
      local RotateAnimPath = ModelData.MontageFolder or ""
      local Prefix = ModelData.MontagePrefix or ""
      MontageName = RotateAnimPath .. "Locomotion/" .. Prefix .. MontageName .. "_Montage." .. Prefix .. MontageName .. "_Montage"
    end
    if not self.NpcAnimInstance:CanTurnInPlace() or math.abs(RotationAngle) < 10 then
      StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
    else
      self.NpcAnimInstance:ChangeTurnState(true)
      if not self:GetMovementComponent():IsComponentTickEnabled() then
        self:SetNpcMovementTickEnable(true)
      end
      
      function self.OnStoryActionFinished()
        if self.OnStoryActionFinished then
          StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
        end
        self.OnStoryActionFinished = nil
      end
      
      self:TurnByMotionWarping(RotationAngle, function()
        StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
      end, nil, MontageName)
    end
  end
end

function BP_CharacterBase_C:PlayTalkAction(ActionId, OnFinished, CallbackObj, CallbackFuncName, IsSync, IgnoreBlendInTime)
  if type(OnFinished) == "userdata" then
    assert(OnFinished.Execute ~= nil)
  end
  local TalkActionData = DataMgr.TalkAction[ActionId]
  if nil == TalkActionData then
    Utils.ScreenPrint("ActionId \228\184\141\229\173\152\229\156\168:" .. tostring(ActionId))
    StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
    return 0
  end
  self.MontagesProxy = self.MontagesProxy or {}
  self.ActionGroupProxy = self.ActionGroupProxy or {}
  local MontagePaths = {}
  if TalkActionData.ActionMontage then
    local ActionMontagePath = self:GetTalkActionPath(TalkActionData.MontagePrePath, TalkActionData.ActionMontage)
    local ProxyData = {
      Path = ActionMontagePath,
      Group = "",
      ActionId = ActionId
    }
    table.insert(self.MontagesProxy, ProxyData)
    table.insert(MontagePaths, ActionMontagePath)
  end
  if TalkActionData.EndLoopMontage then
    local EndLoopMontage = self:GetTalkActionPath(TalkActionData.MontagePrePath, TalkActionData.EndLoopMontage)
    local ProxyData = {
      Path = EndLoopMontage,
      Group = "",
      ActionId = ActionId
    }
    table.insert(self.MontagesProxy, ProxyData)
    table.insert(MontagePaths, EndLoopMontage)
  end
  local LoadedCount = 0
  local TotalToLoad = #MontagePaths
  if IsSync then
    for _, MontagePath in pairs(MontagePaths) do
      local MontageAsset = LoadObject(MontagePath)
      local MontageGroupName = ""
      self.ActionGroupProxy[MontagePath] = true
      if IsValid(self.Mesh:GetAnimInstance()) and self.Mesh:GetAnimInstance().GetMontageSlotGroupName then
        MontageGroupName = self.Mesh:GetAnimInstance():GetMontageSlotGroupName(MontageAsset)
      end
      if "" ~= MontageGroupName and self.ActionGroupProxy[MontagePath] == true then
        DebugPrint("LHQ@@@@@PlayTalkAction:", MontagePath, "MontageGroupName:", MontageGroupName, "UnitId:", self.UnitId)
        self.ActionGroupProxy[MontagePath] = nil
        self:PlayTalkActionInternal(TalkActionData, OnFinished, CallbackObj, CallbackFuncName, IgnoreBlendInTime, MontageGroupName)
      elseif IsValid(CallbackObj) and CallbackFuncName then
        CallbackObj[CallbackFuncName](CallbackObj)
        if self.ActionGroupProxy then
          self.ActionGroupProxy[MontagePath] = nil
        end
      else
        StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
        if self.ActionGroupProxy then
          self.ActionGroupProxy[MontagePath] = nil
        end
      end
    end
  else
    for _, MontagePath in pairs(MontagePaths) do
      self.ActionGroupProxy[MontagePath] = true
      UResourceLibrary.LoadObjectAsync(self, MontagePath, {
        self,
        function(_, Montage)
          local MontageGroupName = ""
          local MontageWidget = 0
          local IsLastAnim = true
          if IsValid(self.Mesh:GetAnimInstance()) and self.Mesh:GetAnimInstance().GetMontageSlotGroupName then
            MontageGroupName = self.Mesh:GetAnimInstance():GetMontageSlotGroupName(Montage)
            for Index, Data in pairs(self.MontagesProxy) do
              if Data and Data.Path ~= MontagePath and Data.ActionId ~= ActionId and Data.Group == MontageGroupName then
                IsLastAnim = false
              end
              if Data and Data.Path == MontagePath then
                Data.Group = MontageGroupName
                MontageWidget = Index
                IsLastAnim = true
              end
            end
          end
          LoadedCount = LoadedCount + 1
          if 0 == MontageWidget or false == IsLastAnim then
            return
          end
          if LoadedCount == TotalToLoad then
            if "" ~= MontageGroupName and self.ActionGroupProxy and self.ActionGroupProxy[MontagePath] == true then
              self.ActionGroupProxy[MontagePath] = nil
              DebugPrint("LHQ@@@@@PlayTalkAction:", MontagePath, "MontageGroupName:", MontageGroupName, "UnitId:", self.UnitId)
              self:PlayTalkActionInternal(TalkActionData, OnFinished, CallbackObj, CallbackFuncName, IgnoreBlendInTime, MontageGroupName)
            elseif IsValid(CallbackObj) and CallbackFuncName then
              CallbackObj[CallbackFuncName](CallbackObj)
              if self.ActionGroupProxy then
                self.ActionGroupProxy[MontagePath] = nil
              end
            else
              StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
              if self.ActionGroupProxy then
                self.ActionGroupProxy[MontagePath] = nil
              end
            end
          end
        end
      })
    end
  end
  return 0
end

function BP_CharacterBase_C:AsyncLoadAndPlayTalkMontage(Paths, CurrentIndex, TalkActionData, OnFinished, CallbackObj, CallbackFuncName, IgnoreBlendInTime)
  local count = 0
  for _, v in pairs(Paths) do
    count = count + 1
  end
  if CurrentIndex > count then
    return
  end
  local MontagePath = Paths[CurrentIndex]
  UResourceLibrary.LoadObjectAsync(self, MontagePath, {
    self,
    function(_, Montage)
      self.ActionGroupProxy[MontagePath] = true
      local MontageGroupName = ""
      if IsValid(self.Mesh:GetAnimInstance()) and self.Mesh:GetAnimInstance().GetMontageSlotGroupName then
        MontageGroupName = self.Mesh:GetAnimInstance():GetMontageSlotGroupName(Montage)
      end
      if "" ~= MontageGroupName and self.ActionGroupProxy and self.ActionGroupProxy[MontagePath] == true then
        self.ActionGroupProxy[MontagePath] = nil
        DebugPrint("LHQ@@@@@PlayTalkAction:", MontagePath, "MontageGroupName:", MontageGroupName, "UnitId:", self.UnitId)
        self:PlayTalkActionInternal(TalkActionData, OnFinished, CallbackObj, CallbackFuncName, IgnoreBlendInTime, MontageGroupName)
      elseif IsValid(CallbackObj) and CallbackFuncName then
        CallbackObj[CallbackFuncName](CallbackObj)
        if self.ActionGroupProxy then
          self.ActionGroupProxy[MontagePath] = nil
        end
      else
        StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
        if self.ActionGroupProxy then
          self.ActionGroupProxy[MontagePath] = nil
        end
      end
      self:AsyncLoadAndPlayTalkMontage(Paths, CurrentIndex + 1, TalkActionData, OnFinished, CallbackObj, CallbackFuncName, IgnoreBlendInTime)
    end
  })
end

function BP_CharacterBase_C:PlayTalkActionInternal(TalkActionData, OnFinished, CallbackObj, CallbackFuncName, IgnoreBlendInTime, MontageGroupName)
  if nil == TalkActionData then
    Utils.ScreenPrint("TalkActionData \228\184\141\229\173\152\229\156\168")
    if IsValid(CallbackObj) and CallbackFuncName then
      CallbackObj[CallbackFuncName](CallbackObj)
    else
      StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
    end
    return
  end
  local BlendInTime = TalkActionData.BlendInTime or 0.5
  if IgnoreBlendInTime then
    BlendInTime = 0
  end
  if MontageGroupName == Const.TalkActionMontageGroupName then
    self.CurrentTalkGroupMontageName = TalkActionData.AnimationId
  end
  local BlendOutTime = TalkActionData.BlendOutTime or 0.5
  local PrePath = TalkActionData.MontagePrePath or ""
  if self.UnitId == 110040 and TalkActionData.AnimationId == "Sit_Idle_End" and self.IsSpecialSit and self.SetNpcMovementTickEnable then
    self.IsSpecialSit = false
    self:SetNpcMovementTickEnable(true)
  end
  if TalkActionData.EndLoopMontage then
    local function OnBlendOut()
      self:PlayTalkMontage(TalkActionData.EndLoopMontage, 0, BlendOutTime, TalkActionData.EndLoopMontageSection, nil, nil, true, PrePath)
    end
    
    local function OnCompleted()
      self.CurrentTalkGroupMontageName = nil
    end
    
    self:PlayTalkMontage(TalkActionData.ActionMontage, BlendInTime, BlendOutTime, TalkActionData.MontageSection, OnBlendOut, OnCompleted, TalkActionData.bUseIK, PrePath)
    if IsValid(CallbackObj) and CallbackFuncName then
      CallbackObj[CallbackFuncName](CallbackObj)
    else
      StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
    end
  else
    local function OnCompleted()
      if TalkActionData.IsSpecialAnim then
        if IsValid(CallbackObj) and CallbackFuncName then
          CallbackObj[CallbackFuncName](CallbackObj)
        else
          StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
        end
      end
      self.CurrentTalkGroupMontageName = nil
    end
    
    self:PlayTalkMontage(TalkActionData.ActionMontage, BlendInTime, BlendOutTime, TalkActionData.MontageSection, nil, OnCompleted, TalkActionData.bUseIK, PrePath)
    if false == TalkActionData.IsSpecialAnim then
      if IsValid(CallbackObj) and CallbackFuncName then
        CallbackObj[CallbackFuncName](CallbackObj)
      else
        StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
      end
    end
  end
end

function BP_CharacterBase_C:StopTalkAction(ActionId)
  local TalkActionData = DataMgr.TalkAction[ActionId]
  if nil == TalkActionData then
    return
  end
  local MontagePaths = {}
  if TalkActionData and TalkActionData.ActionMontage then
    table.insert(MontagePaths, self:GetTalkActionPath(TalkActionData.MontagePrePath, TalkActionData.ActionMontage))
  end
  if TalkActionData and TalkActionData.EndLoopMontage then
    table.insert(MontagePaths, self:GetTalkActionPath(TalkActionData.MontagePrePath, TalkActionData.EndLoopMontage))
  end
  for _, MontagePath in pairs(MontagePaths) do
    if self.ActionGroupProxy and self.ActionGroupProxy[MontagePath] then
      self.ActionGroupProxy[MontagePath] = nil
    end
    local Montage = LoadObject(MontagePath)
    if IsValid(self.Mesh:GetAnimInstance()) and self.Mesh:GetAnimInstance().GetMontageSlotGroupName then
      local MontageGroupName = self.Mesh:GetAnimInstance():GetMontageSlotGroupName(Montage)
      self.Mesh:GetAnimInstance():Montage_StopGroupByName(0, MontageGroupName)
    end
  end
end

function BP_CharacterBase_C:StopAllTalkAction()
  self.ActionGroupProxy = nil
  if IsValid(self.Mesh:GetAnimInstance()) then
    self.Mesh:GetAnimInstance():Montage_StopGroupByName(0, "TalkGroup")
    self.Mesh:GetAnimInstance():Montage_StopGroupByName(0, "HeadGroup")
    self.Mesh:GetAnimInstance():Montage_StopGroupByName(0, "DefaultGroup")
  end
end

function BP_CharacterBase_C:PlayTalkMontage(MontageName, BlendInTime, BlendOutTime, StartSec, OnBlendOut, OnCompleted, bUseIK, PrePath)
  local MontagePath = self:GetTalkActionPath(PrePath, MontageName)
  local Montage = LoadObject(MontagePath)
  if nil == Montage then
    Utils.ScreenPrint("\232\146\153\229\164\170\229\165\135\232\183\175\229\190\132\228\184\141\229\173\152\229\156\168" .. MontagePath)
    if OnCompleted then
      OnCompleted()
    end
    return
  end
  if self:IsNPC() then
    DebugPrint("NPC PlayTalkMontageMontageName:", MontagePath, "FobiddenIk:", bUseIK)
    self:SwitchEnableAnimInstanceIK(not bUseIK)
  else
    self:SwitchEnableAnimInstanceIK(bUseIK)
  end
  UTalkFunctionLibrary.SetMontageBlendInTime(Montage, BlendInTime)
  UTalkFunctionLibrary.SetMontageBlendOutTime(Montage, BlendOutTime)
  local PlayParam = {
    StartSec = StartSec,
    OnBlendOut = OnBlendOut,
    OnCompleted = OnCompleted,
    ExcuteFnishOnlyWhenCompelete = true
  }
  MiscUtils.PlayMontageBySkeletaMesh(self, self.Mesh, Montage, PlayParam)
end

function BP_CharacterBase_C:GetTalkActionPath(PrePath, ActionName)
  local MontagePath = ""
  if nil == ActionName then
    return MontagePath
  end
  local ModelData = DataMgr.Model[self.ModelId]
  if nil == PrePath or "" == PrePath then
    return string.format("%sInteractive/%s%s_Montage", ModelData.MontageFolder, ModelData.MontagePrefix, ActionName)
  else
    return string.format("%s%s/%s%s_Montage", ModelData.MontageFolder, PrePath, ModelData.MontagePrefix, ActionName)
  end
end

function BP_CharacterBase_C:PlayOrStopEmoIdleMontage(IsPlay)
  if IsPlay then
    local ModelId = self:GetCharModelComponent():GetCurrentModelId()
    local ModelData = DataMgr.Model[ModelId]
    local RotateAnimPath = ModelData.MontageFolder or ""
    local Prefix = ModelData.MontagePrefix or ""
    local MontagePath = RotateAnimPath .. "Interactive/" .. Prefix .. "Emo_Idle" .. "_Montage." .. Prefix .. "Emo_Idle" .. "_Montage"
    if MontagePath then
      UResourceLibrary.LoadObjectAsync(self, MontagePath, {
        self,
        function(_, Montage)
          local PlayParam = {}
          MiscUtils.PlayMontageBySkeletaMesh(self, self.Mesh, Montage, PlayParam)
        end
      })
    end
  else
    local AnimInstance = self.Mesh:GetAnimInstance()
    if AnimInstance then
      AnimInstance:Montage_StopGroupByName(0.5, Const.TalkActionMontageGroupName)
    end
  end
end

function BP_CharacterBase_C:SwitchEnableAnimInstanceIK(bEnable)
  local EMAnimInstance = self.EMAnimInstance
  if EMAnimInstance and EMAnimInstance.SwitchEnableAnimInstanceIK then
    EMAnimInstance:SwitchEnableAnimInstanceIK(bEnable)
  end
  if self.NpcAnimInstance then
    self.NpcAnimInstance.EnableDataFootIK = bEnable
    DebugPrint("NPC Swich foot ik ", bEnable)
  end
end

function BP_CharacterBase_C:GetHoldInput(HoldType)
  return self[HoldType]
end

function BP_CharacterBase_C:CanEnterInteractive()
  if self.IsInAir then
    return false
  end
  if (self:CharacterInTag("Skill") or self:CharacterInTag("Shooting")) and self:IsSafeToCancelSkill() then
    return self:CheckTagCanEnterTag("Idle", "Interactive")
  end
  if self:CheckCanEnterTag("Interactive") then
    return true
  end
  return false
end

function BP_CharacterBase_C:StartDamageCounter()
  if self.IsCountingDamage then
    return
  end
  self:StopDamageCounter()
  Battle(self):RegisterBattleEvent(BattleEventName.Damaged, self, "CountDamageValue")
  self.DpsArr = {}
  self.DpsVal = 0
  self.TotalVal = 0
  self.IsCountingDamage = true
end

function BP_CharacterBase_C:CountDamageValue(TargetEffectSource, DamageEvent, Source, Target)
  local Value = DamageEvent:GetTrueValue()
  local CurTime = os.time()
  if not self.FirstDamageTime or CurTime - (self.LastDamageTime or CurTime) > 3 then
    self.DpsVal = Value
    self.TotalVal = Value
    self.FirstDamageTime = CurTime
  else
    local DmgTotalTime = CurTime - self.FirstDamageTime
    self.TotalVal = self.TotalVal + Value
    if DmgTotalTime >= 1 then
      self.DpsVal = self.TotalVal / DmgTotalTime
    else
      self.DpsVal = self.TotalVal
    end
  end
  self.LastDamageTime = CurTime
end

function BP_CharacterBase_C:UpdateDamageValue()
  local LeftIndex = 0
  local CurTime = os.time()
  for i = 1, #self.DpsArr do
    local DpsInfo = self.DpsArr[i]
    if CurTime - DpsInfo.Time > 1 then
      self.DpsVal = self.DpsVal - DpsInfo.Value
      LeftIndex = i
    else
      break
    end
  end
  if LeftIndex == #self.DpsArr then
    self.DpsArr = {}
  elseif LeftIndex > 0 then
    self.DpsArr = table.slice(self.DpsArr, LeftIndex + 1, #self.DpsArr)
  end
end

function BP_CharacterBase_C:StopDamageCounter()
  Battle(self):UnregisterBattleEvent(BattleEventName.Damaged, self, "CountDamageValue")
  self.DpsArr = nil
  self.DpsVal = nil
  self.IsCountingDamage = false
end

function BP_CharacterBase_C:GetMaxGatherTime_Lua()
  return Const.GatherMaxTime
end

function BP_CharacterBase_C:GetConstStandAloneMonsterCanCache()
  return Const.StandAloneMonsterCanCache
end

function BP_CharacterBase_C:GetConstOnlineMonsterCanCache()
  return Const.OnlineMonsterCanCache
end

function BP_CharacterBase_C:IsPhantomDispatching(RoleId)
  DebugPrint("gmy@BP_PhantomCharacter_C BP_PhantomCharacter:IsPhantomDispatching", self.CurrentRoleId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for _, Dispatch in pairs(Avatar.Dispatches) do
      if Dispatch.DispatchCharsList:Length() > 0 then
        for Index, CharUuid in pairs(Dispatch.DispatchCharsList) do
          local StrUuid = CommonUtils.ObjId2Str(CharUuid)
          local CharId = self:GetCharIdByCharUuid(StrUuid)
          DebugPrint("gmy@BP_CharacterBase_C BP_CharacterBase_C:IsPhantomDispatching Info:", Index, StrUuid, CharId)
          if CharId == RoleId then
            return true
          end
        end
      end
    end
  end
  return false
end

function BP_CharacterBase_C:GetCharIdByCharUuid(Uuid)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for _, Char in pairs(Avatar.Chars) do
    if CommonUtils.ObjId2Str(Char.Uuid) == Uuid then
      return Char.CharId
    end
  end
end

AssembleComponents(BP_CharacterBase_C)
return BP_CharacterBase_C
