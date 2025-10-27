require("UnLua")
require("DataMgr")
local FootIKValues = require("BluePrints.Char.CharacterComponent.AnimStruct")
local HighLevelKawaiiState = {
  Shooting = 1,
  ShootHold = 1,
  Reload = 1
}
local IdleTagToZero = {EmoIdle = 1, Gesture01_Idle = 1}
local BP_TestPlayerAnimInstance_C = Class()

function BP_TestPlayerAnimInstance_C:LuaAnimBeginPlay()
end

function BP_TestPlayerAnimInstance_C:GetPawnOwner()
  if not self.Pawn then
    self.Pawn = self:TryGetPawnOwner()
  end
  return self.Pawn
end

function BP_TestPlayerAnimInstance_C:OnLeaveGesture01_Idle(NewIdleTag)
  if self:IsAnymontagePlaying() then
    self:Montage_StopSlotByName(0, "Gesture")
  end
end

function BP_TestPlayerAnimInstance_C:OnEnterEmoIdle()
  if self.IdleTag == "EmoIdle" and self:CanPlayEmoIdleVoice() and not self:GetPawnOwner().bHidden then
    AudioManager(self):PlaySeById(self:GetPawnOwner(), 214, self:GetPawnOwner(), false, true, "", "EmoIdle")
    self.EmoIdleVoiceHandle = UE4.UKismetSystemLibrary.K2_SetTimerDelegate({
      self,
      self.RemoveEmoIdleVoiceHandle
    }, Const.EmoIdleVoiceCoolDown, false, 0)
  end
end

function BP_TestPlayerAnimInstance_C:OnLeaveEmoIdle()
  if self.EmoIdleVoiceHandle then
    self:RemoveEmoIdleVoiceHandle()
    AudioManager(self):StopSound(self:GetPawnOwner(), "EmoIdle")
  end
end

function BP_TestPlayerAnimInstance_C:CanPlayEmoIdleVoice()
  if not self:GetPawnOwner():IsPlayer() then
    return false
  end
  if self.EmoIdleVoiceHandle then
    return false
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar:IsInDungeon() then
    return true
  end
  if self:GetPawnOwner():IsRegionInBattle() then
    return true
  end
  return false
end

function BP_TestPlayerAnimInstance_C:SetEmoIdleEnabled(IsEnable, IsChangeRefreshNow)
  if self.IsEmoIdleEnable == IsEnable then
    return
  end
  self.IsEmoIdleEnable = IsEnable
  if IsEnable then
    if IsChangeRefreshNow then
      self:ResetIdleTag()
      self:EnterEmojiIdle()
    else
      self:ResetIdleTag()
    end
  else
    self:RemoveIdleHandle()
    if IsChangeRefreshNow then
      self:ResetIdleTag()
    end
  end
end

function BP_TestPlayerAnimInstance_C:EnterEmojiIdle()
  self:SetIdleTag("EmoIdle")
end

function BP_TestPlayerAnimInstance_C:RemoveEmoIdleVoiceHandle()
  UE4.UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(self, self.EmoIdleVoiceHandle)
  self.EmoIdleVoiceHandle = nil
end

function BP_TestPlayerAnimInstance_C:EnterArmoryIdle()
  self:RemoveIdleHandle()
  if self.IsEnterArmory == "None" then
    self:ResetIdleTag()
    return
  end
end

function BP_TestPlayerAnimInstance_C:SetArmoryIdleTag()
  if self.IsEnterArmory ~= "None" then
    self:SetIdleTag(self:GetArmoryIdleTag())
    if self:GetPawnOwner() and (self:GetPawnOwner():IsPlayer() or self:GetPawnOwner():IsPhantom()) then
      self.EnableHandIk = false
      self:GetPawnOwner():PlayShowIdleMontage(self.IdleTag)
    end
  end
end

function BP_TestPlayerAnimInstance_C:GetArmoryIdleTag()
  local Pawn = self:TryGetPawnOwner(self:GetPawnOwner())
  if not Pawn then
    return "0"
  end
  if self.IsEnterArmory and Const.ArmoryIdleTags[self.IsEnterArmory] then
    return Const.ArmoryIdleTags[self.IsEnterArmory]
  end
  return Pawn:GetUsingWeaponType(self.IsEnterArmory)
end

function BP_TestPlayerAnimInstance_C:OnAnimationEnded(Montage, Interrupted)
end

function BP_TestPlayerAnimInstance_C:RealMontage_RepPlay(MontagePath, InPlayRate, StartSectionName, ReturnValueType, InTimeToStartMontageAt, bStopAllMontages)
  local Pawn = self:TryGetPawnOwner(self:GetPawnOwner())
  if Pawn.PlayerAnimInstance then
    Pawn:SetCanExtractZVelocity()
    Pawn:ResetAllCancelTag()
    local AnimationAsset = LoadObject(MontagePath)
    if AnimationAsset and self:IsMontageAsset(AnimationAsset) then
      local Duration = self:Montage_Play(AnimationAsset, InPlayRate)
      if Duration > 0 then
        if "None" ~= StartSectionName then
          Pawn.PlayerAnimInstance:Montage_JumpToSection(StartSectionName, AnimationAsset)
        end
        return Duration
      else
        return 0
      end
    else
      return 0
    end
  elseif Pawn.NpcAnimInstance then
    Pawn:SetCanExtractZVelocity()
    Pawn:ResetAllCancelTag()
    local AnimationAsset = LoadObject(MontagePath)
    if AnimationAsset and self:IsMontageAsset(AnimationAsset) then
      local Duration = self:Montage_Play(AnimationAsset, InPlayRate)
      if Duration > 0 then
        if "None" ~= StartSectionName then
          Pawn.NpcAnimInstance:Montage_JumpToSection(StartSectionName, AnimationAsset)
        end
        return Duration
      else
        return 0
      end
    else
      return 0
    end
  end
end

function BP_TestPlayerAnimInstance_C:EndAnimationTrigger()
  if self.CurrentAnimation then
    self:Montage_Stop(0.01, self.CurrentAnimation)
    self.CurrentAnimation = nil
  end
end

function BP_TestPlayerAnimInstance_C:PlayEyeAnimation(Animation)
  if not Animation then
    return
  end
  DebugPrint("Eye animation:", Animation)
  self.EyeSequence = Animation
end

function BP_TestPlayerAnimInstance_C:PlayMouthAnimation(Animation)
  if not Animation then
    return
  end
  DebugPrint("Mouth animation:", Animation)
  self.MouthSequence = Animation
end

function BP_TestPlayerAnimInstance_C:SetNpcDefaultAnim(Animation)
  if not Animation then
    DebugPrint("ERROR: DefaultAnim Is Null", self:GetPawnOwner():GetName())
    return
  end
  DebugPrint("NpcDefaultAnim: ", Animation)
  self.NpcDefaultAnim = Animation
end

function BP_TestPlayerAnimInstance_C:SetNpcDefaultAnimEnable(bEnable)
  self.EnableNpcDefaultAnim = bEnable
end

function BP_TestPlayerAnimInstance_C:SwitchEnableTalkAction(bEnable)
  self.bEnableTalkAction = bEnable and true or false
end

function BP_TestPlayerAnimInstance_C:SwitchEnableAnimInstanceIK(bEnable)
  DebugPrint("BP_TestPlayerAnimInstance_C:SwitchEnableAnimInstanceIK", bEnable)
  self.bUseIK = bEnable and true or false
end

function BP_TestPlayerAnimInstance_C:CheckParamentVaild(KawaiiInfo, CurrentState)
  if not KawaiiInfo then
    return false
  end
  if not KawaiiInfo.KawaiiParament then
    return false
  end
  if not KawaiiInfo.KawaiiParament[CurrentState] then
    return false
  end
  return true
end

function BP_TestPlayerAnimInstance_C:TryCallLuaOverriden(NotifyName, MeshComponent, Sequence)
  local LuaFuncName = "Lua_" .. NotifyName
  local LuaFunc = self[LuaFuncName]
  if not LuaFunc then
    return false
  end
  if type(LuaFunc) ~= "function" and (not (type(LuaFunc) == "table" and getmetatable(LuaFunc)) or not getmetatable(LuaFunc).__call) then
    return false
  end
  self[LuaFuncName](self, MeshComponent, Sequence)
  return true
end

function BP_TestPlayerAnimInstance_C:Lua_AnimNotify_BindNewWeaponType(Mesh, Anim)
  print(_G.LogTag, "Lua_AnimNotify_BindNewWeaponType", Mesh, Anim)
end

function BP_TestPlayerAnimInstance_C:AnimNotify_SecondJumpEnd()
  if self.CurrentJumpState == Const.SecondJump and self:GetPawnOwner() then
    self:GetPawnOwner():SetCurrentJumpState(Const.JumpFall)
  end
end

function BP_TestPlayerAnimInstance_C:AnimNotify_LeaveJump()
  if self.CurrentJumpState == Const.FirstJump and self:GetPawnOwner() then
    self:GetPawnOwner():SetCurrentJumpState(Const.JumpFall)
  end
end

function BP_TestPlayerAnimInstance_C:AnimNotify_LeaveJumpSec()
  if self.CurrentJumpState == Const.SecondJump and self:GetPawnOwner() then
    self:GetPawnOwner():SetCurrentJumpState(Const.JumpFall)
  end
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EnterLand()
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EnterGround()
  self.ShouldInAir = true
end

function BP_TestPlayerAnimInstance_C:AnimNotify_LeaveGround()
  if not self:GetPawnOwner() then
    return
  end
  if self.CurrentJumpState ~= Const.JumpFall or self.CurrentJumpState ~= Const.NormalState then
    return
  end
  local TraceStart = self:GetPawnOwner():K2_GetActorLocation() + self:GetPawnOwner():GetActorForwardVector() * self:GetPawnOwner().CapsuleComponent:GetUnscaledCapsuleRadius() - FVector(0, 0, 1) * self:GetPawnOwner().CapsuleComponent:GetUnscaledCapsuleHalfHeight()
  local TraceEnd = TraceStart - FVector(0, 0, 1) * 50
  local HitResult = FHitResult()
  UE4.UKismetSystemLibrary.LineTraceSingle(self, TraceStart, TraceEnd, ETraceTypeQuery.TraceExceptChar, false, nil, 0, HitResult, true)
  if not HitResult.bBlockingHit then
    return
  end
  self.ShouldInAir = false
end

function BP_TestPlayerAnimInstance_C:AnimNotify_ShrinkEnd()
  if not self:GetPawnOwner() then
    return
  end
  if self:GetPawnOwner():CharacterInTag("Slide") then
    return
  end
  self:GetPawnOwner():ResetCapSize()
end

function BP_TestPlayerAnimInstance_C:AnimNotify_Enter_SlideLoop()
  self.IsSlideLoop = true
end

function BP_TestPlayerAnimInstance_C:AnimNotify_Out_SlideLoop()
  self.IsSlideLoop = false
end

function BP_TestPlayerAnimInstance_C:AnimNotify_FirstJumpEnd()
  if self.CurrentJumpState == Const.FirstJump and self:GetPawnOwner() then
    self:GetPawnOwner():SetCurrentJumpState(Const.JumpFall)
  end
end

function BP_TestPlayerAnimInstance_C:AnimNotify_ClimbEnd()
  if self.CurrentJumpState == Const.Climb and self:GetPawnOwner() then
    self:GetPawnOwner():SetCurrentJumpState(Const.JumpFall)
  end
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EnterWallJumpLoop()
  self.CanPlayWallJumpLoop = true
end

function BP_TestPlayerAnimInstance_C:AnimNotify_LeaveWallJumpLoop()
  self.CanPlayWallJumpLoop = false
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EnterBindNewWeaponType()
  self:GetPawnOwner():PlayWeaponNewTypeIn()
end

function BP_TestPlayerAnimInstance_C:AnimNotify_PauseAnimation()
  if self.CurrentAnimation then
    self:Montage_Pause(self.CurrentAnimation)
  end
end

function BP_TestPlayerAnimInstance_C:AnimNotify_DeadAnimationEnd()
  local Pawn = self:TryGetPawnOwner(self:GetPawnOwner())
  if Pawn:IsMonster() then
    Pawn:MonsterDeadAnimationEnd(Pawn:GetVector("DamageCauserLocation"), 0.0, 0.0, 3.0, 3.0)
  end
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EnterIdle()
  self:SetKawaiiPhysics_Cpp("Idle")
  self.ForceIdle = false
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EnterArmoryIdle()
  self:SetKawaiiPhysics_Cpp("ArmoryIdle")
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EnterJump()
  self:SetKawaiiPhysics_Cpp("Jump")
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EnterSecJump()
  self:SetKawaiiPhysics_Cpp("SecJump")
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EnterRunstart()
  self:SetKawaiiPhysics_Cpp("RunStart")
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EnterRunLoop()
  self:SetKawaiiPhysics_Cpp("RunLoop")
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EnterShootHoldEx()
  self:StartShootHoldToIdle()
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EnterShootHold()
  self:SetKawaiiPhysics_Cpp("ShootHold")
  if 0 ~= self.StopShootHoldHandle.Handle then
    return
  end
  self.StopShootHoldHandle = UE4.UKismetSystemLibrary.K2_SetTimerDelegate({
    self,
    self.StopShootHold
  }, Const.WholeShootHoldTime, false, 0)
end

function BP_TestPlayerAnimInstance_C:AnimNotify_StartShootHold()
  self:SetKawaiiPhysics_Cpp("ShootHold")
  if self.StartHoldHandle then
    UE4.UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(self, self.StartHoldHandle)
  end
  self.StartHoldHandle = UE4.UKismetSystemLibrary.K2_SetTimerDelegate({
    self,
    self.StartShootHoldToIdle
  }, Const.StopShootHoldDelay, false, 0)
  if 0 ~= self.StopShootHoldHandle.Handle then
    return
  end
  self.StopShootHoldHandle = UE4.UKismetSystemLibrary.K2_SetTimerDelegate({
    self,
    self.StopShootHoldEx
  }, Const.WholeShootHoldTime, false, 0)
end

function BP_TestPlayerAnimInstance_C:StartShootHoldToIdle()
  self:StopShootHold()
  do return end
  if self.CurVelocity:Size() > 0 then
    return
  end
  self:RemoveHoldHandler()
  self.HoldeToIdle = true
  if self.StartHoldHandle then
    UE4.UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(self, self.StartHoldHandle)
  end
  self.StartHoldHandle = nil
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EnterHoldToIdle()
  self.StopShootHoldHandle = UE4.UKismetSystemLibrary.K2_SetTimerDelegate({
    self,
    self.StopShootHold
  }, Const.StopShootHoldDelay, false, 0)
  self:GetPawnOwner():ShouldEnableHandIk()
end

function BP_TestPlayerAnimInstance_C:AnimNotify_LeaveShootHold()
  if self.IsOnServer then
    return
  end
  self.HoldeToIdle = false
  self:RemoveHoldHandler()
  if self.StartHoldHandle then
    UE4.UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(self, self.StartHoldHandle)
    self.StartHoldHandle = nil
  end
end

function BP_TestPlayerAnimInstance_C:StopShootHoldEx()
  if self.CurVelocity:Size() > 0 then
    self:StopShootHold()
  else
    self:StartShootHoldToIdle()
  end
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EnterRunStop()
  if self.IsOnServer then
    return
  end
  print(_G.LogTag, "AnimNotify_EnterRunStop")
  local CurveValue = self:GetCurveValue("FeetPos")
  local CurveValue2 = self:GetCurveValue("StartFeetPos")
  self.StartFeetPos = CurveValue2
  self.IsRightFootStop = CurveValue > 0.5 or CurveValue < 0 and CurveValue > -0.5
  self.FootPosCurveValue = CurveValue
  self.Pivot = false
  self:SetKawaiiPhysics_Cpp("RunStop")
end

function BP_TestPlayerAnimInstance_C:AnimNotify_SlideStart()
  if self.IsOnServer then
    return
  end
  self:SetKawaiiPhysics_Cpp("SlideStart")
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EnterSlideToIdle()
  if self.IsOnServer then
    return
  end
  self:SetKawaiiPhysics_Cpp("SlideToIdle")
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EnterSlideToRun()
  if self.IsOnServer then
    return
  end
  self:SetKawaiiPhysics_Cpp("SlideToRun")
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EnterLand()
  if self.IsOnServer then
    return
  end
  self:SetKawaiiPhysics_Cpp("Land")
end

function BP_TestPlayerAnimInstance_C:AnimNotify_ShowPet()
  EventManager:FireEvent(EventID.OnArmoryShowPet)
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EndShoot_Bow01()
  if self.IsOnServer then
    return
  end
  AudioManager(self:GetPawnOwner()):PlayNormalSound(self:GetPawnOwner(), nil, "event:/sfx/weapon/Bow/Lieyan/end", "EndShoot_Bow")
end

function BP_TestPlayerAnimInstance_C:AnimNotify_EndShoot_Bow02()
  if self.IsOnServer then
    return
  end
  AudioManager(self:GetPawnOwner()):StopSound(self:GetPawnOwner(), "EndShoot_Bow")
end

return BP_TestPlayerAnimInstance_C
