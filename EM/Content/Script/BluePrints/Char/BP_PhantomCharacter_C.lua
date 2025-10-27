local EffectResults = require("BluePrints.Combat.BattleLogic.EffectResults")
require("UnLua")
local BP_PhantomCharacter = Class({
  "BluePrints.Char.BP_MonsterCharacter_C",
  "BluePrints.Char.CharacterComponent.PlayerCommonInterface"
})
BP_PhantomCharacter._components = {
  "BluePrints.Char.CharacterComponent.PickupComponent",
  "BluePrints.Char.CharacterComponent.CharacterPickupUseComponent",
  "BluePrints.Char.CharacterComponent.TeamRecoveryComponent"
}

function BP_PhantomCharacter:Initialize(Initializer)
  BP_PhantomCharacter.Super.Initialize(self)
  self:InitActionLogicParamas()
end

function BP_PhantomCharacter:ClientInitInfoNew(Context)
  self:InitUIWidgetComponent()
  if self.PhantomOwner and self.PhantomOwner:IsMainPlayer() then
    self:AddInteractiveTrigger()
    self.InteractiveTriggerComponent.SpecInteractiveComps:Add(UPickUpInteractiveComponent:StaticClass())
  end
  if self.BP_RecoverInteractiveComponent then
    self.BP_RecoverInteractiveComponent:InitCharInfo()
  end
end

function BP_PhantomCharacter:ClientInitInfo(Info)
  BP_PhantomCharacter.Super.ClientInitInfo(self, Info)
  self:InitUIWidgetComponent()
  if self.PhantomOwner and self.PhantomOwner:IsMainPlayer() then
    self:AddInteractiveTrigger()
    self.InteractiveTriggerComponent.SpecInteractiveComps:Add(UPickUpInteractiveComponent:StaticClass())
  end
  if self.BP_RecoverInteractiveComponent then
    self.BP_RecoverInteractiveComponent:InitCharInfo()
  end
end

function BP_PhantomCharacter:ReceiveEndPlay(EndPlayReason)
  local Avatar = GWorld:GetAvatar()
  if Avatar and EndPlayReason ~= EEndPlayReason.LevelTransition then
    Avatar:ClearCreatePhantomInfo(self.UnitId)
  end
  self.Overridden.ReceiveEndPlay(self, EndPlayReason)
end

function BP_PhantomCharacter:CheckCanPart()
  return true
end

function BP_PhantomCharacter:CheckJumpStage()
  local CurrentJumpState = self.PlayerAnimInstance.CurrentJumpState
  local IsMoveOnGround = not self.IsInAir
  local EnterFirstJumpStage = self:CheckFirstJumpCondition(CurrentJumpState, IsMoveOnGround)
  if EnterFirstJumpStage then
    return Const.FirstJump
  end
  local EnterSecondJumpStage = self:CheckSecondJumpCondition(CurrentJumpState, IsMoveOnGround)
  if EnterSecondJumpStage then
    return Const.SecondJump
  end
  return nil
end

function BP_PhantomCharacter:OnJumpStageChaned(JumpStage)
  if JumpStage == Const.BulletJump then
    self.BulletJumpCount = self.BulletJumpCount + 1
    self:RealStopSlide(false)
  end
  if self:CharacterInTag("Avoid") then
    self:StopDodge()
  end
  if -1 ~= self.SlideTime then
    self.SlideTime = -1
  end
  self:SetCrouch(false)
  self:SetHoldCrouch(false)
end

function BP_PhantomCharacter:Recovery(...)
  BP_PhantomCharacter.Super.Recovery(self, ...)
  self:TryLeaveDying()
  self:AddGravityModifier(UE4.EGravityModifierTag.PhantomDead, 1)
  if IsAuthority(self) then
    self:UseSkill(Const.PlayerRecoverySkill, 0)
  end
  if self.IsHostage and IsAuthority(self) then
    local GameMode = UGameplayStatics.GetGameMode(self)
    if GameMode then
      GameMode:RemoveDungeonEvent("HostageDyingCountDown")
    end
  end
  if self.PhantomOwner then
    Battle(self):TriggerBattleEvent(BattleEventName.OnPhantomRecover, self.PhantomOwner, self)
  end
end

function BP_PhantomCharacter:OnRealEnterDying()
  self.Super.OnRealEnterDying(self)
  DebugPrint("LHQPhantomState OnRealEnterDying")
  if IsAuthority(self) and not self.IsHostage then
    local GameMode = UGameplayStatics.GetGameMode(self)
    if self:CheckCanRecovery() then
      local RespawnRule = GameMode:GetRespawnRule(self)
      if RespawnRule and RespawnRule.PhantomRecoverSpeed then
        Battle(self):RecoverOther(self.Eid, self.Eid, true, {
          Speed = RespawnRule.PhantomRecoverSpeed
        }, UE4.ERecoverReason.RecoverReason_SelfRecover)
      end
    end
  end
end

function BP_PhantomCharacter:OnRealDie()
  DebugPrint("Tianyi@ Phantom real die, Eid = " .. self.Eid)
  local RespawnRuleName = self:GetCurRespawnRuleName()
  if RespawnRuleName and DataMgr.RespawnRule[RespawnRuleName] then
    local RespawnRule = DataMgr.RespawnRule[RespawnRuleName]
    if RespawnRule.DissolveAfterDead == true then
      local DiscardPlayRate = 1
      self:PhantomDiscard(DiscardPlayRate, 0, false)
      if IsAuthority(self) then
        self:AddTimer_Combat(0.4 / DiscardPlayRate, function()
          self:EMActorDestroy(EDestroyReason.PhantomDieInRegion)
        end, false, 0, "DestroyPhantomTimer", false)
      end
    end
  end
  if IsAuthority(self) and self.IsHostage then
    local GameMode = UGameplayStatics.GetGameMode(self)
    if GameMode then
      GameMode:TriggerDungeonComponentFun("OnHostageDie", self)
    end
  end
end

function BP_PhantomCharacter:TriggerFallingCallable()
  DebugPrint("OtherActor is Falling Dead. ActorName: ", self:GetName(), ", UnitId: ", self.UnitId, ", Eid: ", self.Eid, ", CreatorId: ", self.CreatorId, " CreatorType: ", self.CreatorType, ", BornPos: ", self.BornPos)
  local Player = self.PhantomOwner
  UNavigationFunctionLibrary.ActorToActorTeleport(self, Player)
  self:EnableCheckOverlapPush({})
  if self.OnTriggerFallingCallable then
    self:OnTriggerFallingCallable()
  end
  self:Landed()
end

function BP_PhantomCharacter:TriggerWaterFallingCallable()
  self:TriggerFallingCallable()
end

function BP_PhantomCharacter:ActiveHostageGuide(OpType, HostageEid)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local SceneMgrComponent = GameInstance:GetSceneManager()
  self.StartFireDistanceEvent = true
  self.IsHostageChar = true
  if IsValid(SceneMgrComponent) and self.Data and self.Data.GuideIconAni then
    SceneMgrComponent:UpdateSceneGuideIcon(HostageEid, self, nil, OpType, true, self.Data)
  end
end

function BP_PhantomCharacter:DeactiveHostageGuide()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local SceneMgrComponent = GameInstance:GetSceneManager()
  if IsValid(SceneMgrComponent) and self.Data and self.Data.GuideIconAni then
    SceneMgrComponent:UpdateSceneGuideIcon(self.Eid, self, nil, "Delete", true, self.Data)
  end
end

function BP_PhantomCharacter:PhantomBulletJump(Forward)
  self.BulletForward = FVector(Forward.X, Forward.Y, Forward.Z)
  return self:ServerDoJump(Const.BulletJump)
end

function BP_PhantomCharacter:GetBulletJumpForwardVector()
  if not self.BulletForward then
    return self:GetActorForwardVector(), self:GetActorRightVector(), self:K2_GetActorRotation()
  end
  local Rotation = self.BulletForward:ToRotator()
  local RightVector = UE4.UKismetMathLibrary.GetRightVector(Rotation)
  return self.BulletForward, RightVector, Rotation
end

function BP_PhantomCharacter:OnEMActorDestroy_Lua(DestroyReason)
  if not (not IsClient(self) or GameState(self):GetPhantomState(self.Eid)) or IsStandAlone(self) then
    EventManager:FireEvent(EventID.CloseTeammateBloodUI, self.Eid, self.TeammateUI)
    self.TeammateUI = nil
  end
  self.Super.OnEMActorDestroy_Lua(self, DestroyReason)
end

function BP_PhantomCharacter:OnCharacterReady_Lua()
  if self.RangedWeapon == nil then
    return
  end
  local RangedWeaponId = self.RangedWeapon.WeaponId
  local WeaponData = DataMgr.BattleWeapon[RangedWeaponId]
  if WeaponData and WeaponData.IsForceEnablePhysics then
    if UE4.UCharacterFunctionLibrary.SetMonsterPhysicsForceEnable(self:GetWorld(), true) then
      DebugPrint("@gulinan BP_PhantomCharacter::OnCharacterReady_Lua try Enable physics, WeaponId: ", RangedWeaponId)
    end
  elseif UE4.UCharacterFunctionLibrary.SetMonsterPhysicsForceEnable(self:GetWorld(), false) then
    DebugPrint("@gulinan BP_PhantomCharacter::OnCharacterReady_Lua try Disable physics, WeaponId: ", RangedWeaponId)
  end
end

function BP_PhantomCharacter:UpdatePhantomRegionData()
  local GameMode = UGameplayStatics.GetGameMode(self)
  if GameMode then
    local RegionDataMgr = GameMode:GetRegionDataMgrSubSystem()
    RegionDataMgr:UpdatePhantomRegionData(self)
  end
end

AssembleComponents(BP_PhantomCharacter, {
  "CheckJumpStage",
  "OnJumpStageChaned",
  "GetBulletJumpForwardVector"
})
return BP_PhantomCharacter
