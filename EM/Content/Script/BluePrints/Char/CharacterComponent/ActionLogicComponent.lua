require("Utils")
local msgpack = require("msgpack_core")
local MiscUtils = require("Utils.MiscUtils")
local EffectResults = require("BluePrints.Combat.BattleLogic.EffectResults")
local ActionLogicComponent = {}

function ActionLogicComponent:InitActionLogicParamas()
  self.AvoidTime = -1
  self.SlideCount = 0
  self.AvoidCount = 0
  self.SlidePrepareInfo = {}
  self.AvoidPrepareInfo = {}
  self.AvoidRemainTimes = 1
end

function ActionLogicComponent:SetupActionLogicPramas()
  self.bUseControllerRotationYaw = false
  self.JumpMaxCount = 3
  local r = DataMgr.PlayerRotationRates.BulletJump
  if r then
    self.BulletRotationSpeed = r.ParamentValue[2]
  else
    self.BulletRotationSpeed = self.PlayerRotationRates:Find("BulletJump").Yaw
  end
  self:InitCapsuleSize()
  if self:IsPlayer() then
    self:SetActionFeatureAttr(self.SlideMaintainTime, self.SlideLaunchDelay)
  end
  self.SlidePrepareInfo = {}
  self.AvoidPrepareInfo = {}
  self.OriginBrakFrictionWalk = self:GetMovementComponent().BrakingDecelerationWalking
  self:SetRotationRate("OnGround")
  self:SetHoldCrouch(false)
  self.ShrinkType = {Tag = "Defaulted", Reverse = false}
  local Movement = self:GetMovementComponent()
  local _AirControl = DataMgr.PlayerRotationRates.FlyAirControl
  if _AirControl then
    Movement.FlyAirControl = _AirControl.ParamentValue[1]
  end
  local _AirControlMulti = DataMgr.PlayerRotationRates.AirControlMultiplier
  if _AirControlMulti then
    Movement.FlyAirControlBoostMultiplier = _AirControlMulti.ParamentValue[1]
  end
  self.AvoidRemainTimes = math.max(1, self:GetAttr("MaxAvoidExecuteTimes"))
end

function ActionLogicComponent:GetConstHalfHeight(InShrinkType)
  if "Defaulted" == InShrinkType then
    return self.OriginHalfHeight
  end
  return Const[InShrinkType .. "HalfHeight"]
end

function ActionLogicComponent:GetInteractiveWaitToEnd()
  return Const.InteractiveWaitToEnd
end

function ActionLogicComponent:ResetGravity(Now)
  if self:ClearBulletGravityInfo(Now) then
    self.BulletJumpDirectionInfo = nil
    self.bBulletJumpControlGravity = false
  end
end

function ActionLogicComponent:CounterJump(JumpStage)
  if JumpStage == Const.BulletJump then
    self:CountPlayerSkillUsedTimes("BulletJump")
  elseif JumpStage == Const.FirstJump or JumpStage == Const.SecondJump then
    self:CountPlayerSkillUsedTimes("Jump")
  end
end

function ActionLogicComponent:NotifyBulletToUI()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local DungeonCapture = UIManager:GetUIObj("DungeonCaptureFloat")
  if DungeonCapture then
    DungeonCapture:NotifyBulletJump()
  end
  if self.NeedBulletJumpEvent then
    EventManager:FireEvent(EventID.OnBulletJumpStarted)
  end
end

function ActionLogicComponent:BulletJumpRecoverCheck_Lua()
  self.AutoSyncProp.IsBulletJumping = false
  self.ForbidOrient = false
  self:ChangeOrientControll()
end

function ActionLogicComponent:SetEnterInteractive(InInteractive, MontageName, CharacterTag)
  self.IsInteractive = InInteractive
  if self.PlayerAnimInstance then
    self.PlayerAnimInstance.IsInteractive = InInteractive
    self.PlayerAnimInstance:ResetIdleTag()
  end
  if InInteractive and MontageName then
    local Callback = {
      OnCompleted = self.OnExitInteractive,
      OnInterrupted = self.OnExitInteractive,
      OnBlendOut = self.OnExitInteractive
    }
    self:PlayActionMontage("Interactive/MechInteractive", MontageName, Callback, false, true)
    self.InteractiveMont = self.MontToPlay
  end
  if self.NeedInteractiveEvent then
    EventManager:FireEvent(EventID.OnInteractivePressed)
  end
end

function ActionLogicComponent:OnExitInteractive()
  if self:IsPlayer() then
    self:MinusForbidTag("Battle")
  end
  self.InteractiveMont = nil
  self.IsInteractive = false
  self.WaitCallBack = false
  if self.PlayerAnimInstance then
    self.PlayerAnimInstance.IsInteractive = false
  end
  if self.OnInteractiveDelegate:IsBound() then
    self.OnInteractiveDelegate:Broadcast(self)
  end
  self:GetMovementComponent().RootMotionZScale = 1
  if self:CharacterInTag("Interactive") or self:CharacterInTag("Seating") then
    self:ServerSetCharacterTag("Idle")
    self:SetCharacterTagIdle()
  end
end

function ActionLogicComponent:PlayArmoryAction(ActionId)
  DebugPrint("gmy@ActionLogicComponent:PlayArmoryAction ActionId", ActionId)
  if 0 == ActionId then
    return
  end
  local ActionName = Const.ArmoryActionIdToArmoryTag[ActionId]
  if ActionName then
    if 0 ~= self.CurrentSkillId then
      self:StopSkill()
    end
    self:SetArmoryTag(ActionName)
  end
end

function ActionLogicComponent:CanUseArmoryAction(ActionId)
  DebugPrint("gmy@ActionLogicComponent ActionLogicComponent:CanUseArmoryAction", ActionId)
  if 0 == ActionId then
    return
  end
  local ActionName = Const.ArmoryActionIdToArmoryTag[ActionId]
  if ActionName == Const.Melee then
    DebugPrint("gmy@ActionLogicComponent ActionLogicComponent:CanUseArmoryAction", self.MeleeWeapon)
    local MeleeWeapon = self.MeleeWeapon
    if not IsValid(MeleeWeapon) then
      return false
    end
  elseif ActionName == Const.Ranged then
    DebugPrint("gmy@ActionLogicComponent ActionLogicComponent:CanUseArmoryAction", self.RangedWeapon)
    local RangedWeapon = self.RangedWeapon
    if not IsValid(RangedWeapon) then
      return false
    end
  end
  return true
end

function ActionLogicComponent:EmptyCurResourceId()
  self.CurResourceId = 0
  if self.FromOtherWorld then
    self.PlayerAnimInstance:SetEmoIdleEnabled(true, true)
  end
end

function ActionLogicComponent:PlayResourceAction(ActionName)
  local Callback = {
    OnCompleted = self.EmptyCurResourceId
  }
  if self.FromOtherWorld then
    if self:GetCharacterTag() == "None" then
      self:SetCharacterTagIdle()
    end
    self.PlayerAnimInstance:SetEmoIdleEnabled(false)
  end
  self:PlayActionMontage("Interactive/Gesture", ActionName .. "_Montage", Callback, false)
end

function ActionLogicComponent:PlayActionMontage(SubFile, MontageSuffix, Callback, ShouldForbidAction, ExcuteFnishOnlyWhenCompelete, bLoadAsync)
  if ShouldForbidAction then
    self:AddForbidTag("Battle")
  end
  if 0 ~= self.CurrentSkillId then
    self:StopSkill()
  end
  local MontPath = self:GetMontagePath(SubFile, MontageSuffix)
  if bLoadAsync then
    UResourceLibrary.LoadObjectAsync(self, MontPath, {
      self,
      function(_, Montage)
        self.MontToPlay = Montage
        if Montage then
          DebugPrint("ActionLogicComponent:PlayActionMontage", self:GetName(), Montage:GetName())
        end
        local MontParam = {
          OnCompleted = Callback.OnCompleted,
          OnBlendOut = Callback.OnBlendOut,
          OnInterrupted = Callback.OnInterrupted,
          OnNotifyBegin = Callback.OnNotifyBegin,
          OnNotifyEnd = Callback.OnNotifyEnd,
          ExcuteFnishOnlyWhenCompelete = ExcuteFnishOnlyWhenCompelete
        }
        self:SetCanExtractZVelocity()
        MiscUtils.PlayMontageBySkeletaMesh(self, self.Mesh, self.MontToPlay, MontParam)
      end
    })
    return nil
  end
  self.MontToPlay = LoadObject(MontPath)
  local MontParam = {
    OnCompleted = Callback.OnCompleted,
    OnBlendOut = Callback.OnBlendOut,
    OnInterrupted = Callback.OnInterrupted,
    OnNotifyBegin = Callback.OnNotifyBegin,
    OnNotifyEnd = Callback.OnNotifyEnd,
    ExcuteFnishOnlyWhenCompelete = ExcuteFnishOnlyWhenCompelete
  }
  self:SetCanExtractZVelocity()
  MiscUtils.PlayMontageBySkeletaMesh(self, self.Mesh, self.MontToPlay, MontParam)
end

function ActionLogicComponent:GetMontagePath(SubFile, MontageSuffix)
  local ModelId = self:GetCharModelComponent():GetCurrentModelId()
  local ModelData = DataMgr.Model[ModelId]
  local PlayerAnimPath = ModelData.MontageFolder or ""
  local Prefix = ModelData.MontagePrefix or ""
  if not Prefix then
    return
  end
  local _SubFile = SubFile .. "/"
  if not SubFile or "" == SubFile then
    _SubFile = ""
  end
  local MontPath = "AnimMontage'" .. PlayerAnimPath .. _SubFile .. Prefix .. MontageSuffix .. "." .. Prefix .. MontageSuffix .. "'"
  return MontPath
end

function ActionLogicComponent:GetCapsuleRootLocation()
  return self.Mesh:GetSocketLocation("Root")
end

function ActionLogicComponent:IsAnimCrouch()
  if not self.PlayerAnimInstance then
    return false
  end
  return self.PlayerAnimInstance.IsCrouching
end

function ActionLogicComponent:PlayerLanded()
  print(_G.LogTag, "PlayerLanded", self:GetCharacterTag())
  if not self:CharacterInTag("Slide") then
    self:ResetCapSize()
    self:SetRotationRate("OnGround")
  end
  self.PlayerAnimInstance.WallJumpIndex = 0
  return true
end

function ActionLogicComponent:PlayerImpending()
  if self.AutoSyncProp.IsBulletJumping then
    return false
  end
  if self:IsFlying() then
    return false
  end
  if self.ImpendingSetted then
    return
  end
  if not self:CharacterInTag("Slide") then
    self:SetRotationRate("InAir")
  end
  self.PlayerAnimInstance.WallJumpIndex = 0
  return true
end

function ActionLogicComponent:PlayTeleportAction(...)
  local MontageSuffix
  if self.InfoForInit and self.InfoForInit.AppearanceSuit then
    local AccessorySuit = self.InfoForInit.AppearanceSuit.AccessorySuit or {}
    if AccessorySuit[CommonConst.NewCharAccessoryTypes.FX_Teleport] then
      local Data = DataMgr.CharAccessory[AccessorySuit[CommonConst.NewCharAccessoryTypes.FX_Teleport]]
      if Data then
        MontageSuffix = Data.Montage
      end
    end
  end
  MontageSuffix = MontageSuffix or "Teleport_01_Montage"
  self:PlayActionMontage("Interactive/MechInteractive", MontageSuffix, ...)
end

return ActionLogicComponent
