local ECameraBlendFunc = {
  linear = 0,
  easeInQuad = 1,
  easeOutQuad = 2,
  easeInOutQuad = 3
}
local ECameraComponentClass = {CameraComponent = 0, CineCameraComponent = 1}
local ECameraFocusMethod = {
  [0] = "DoNotOverride",
  [1] = "Manual",
  [2] = "Tracking",
  [3] = "Disable",
  [4] = "MAX"
}
local FeishuErrorTitle = "\229\175\185\232\175\157\231\155\184\230\156\186\233\148\153\232\175\175"
local TalkCameraManager_C = {}

function TalkCameraManager_C.New(TalkContext, Player, PlayerController)
  local Obj = setmetatable({}, {__index = TalkCameraManager_C})
  Obj.TalkContext = TalkContext
  Obj.Player = Player
  Obj.PlayerController = PlayerController
  Obj.AIControllerForPlayer = nil
  Obj.CineCameras = {}
  Obj.CurrentCineCameraIdx = 1
  Obj.TalkPawn = nil
  Obj.CurrentCamera = nil
  Obj.InteractiveActor = nil
  Obj.BlendRunTime = 0
  Obj.BlendType = nil
  Obj.BlendTime = 0
  Obj.Callback = nil
  Obj.BlendParam = {}
  Obj.CurrentCameraLocation = nil
  Obj.TargetCameraLocation = nil
  Obj.DeltaLocation = nil
  Obj.TranslationTime = 0
  Obj.TotalTranslationTime = 0
  Obj.CurrentCameraRotation = nil
  Obj.TargetCameraRotation = nil
  Obj.TargetCameraForward = nil
  Obj.DeltaRotation = nil
  Obj.RotationTime = 0
  Obj.TotalRotationTime = 0
  Obj.IsCameraTransforming = false
  Obj.bUseFinalCameraBlend = false
  Obj.StartCameraInfo = nil
  Obj.EndCameraInfo = nil
  Obj.bNeedFixCamera = false
  if URuntimeCommonFunctionLibrary.IsPlayInEditor(GWorld.GameInstance) then
    Obj.bNeedFixCamera = true
  end
  Obj.PlayerAspectRatio = 1.7777777777777777
  Obj.ConfiguredCameras = {}
  Obj.CameraConfigs = {}
  Obj.FinalCameraTranslationTimeInterval = 0.01666
  return Obj
end

local function InterpEaseIn(Alpha, Exp)
  local ModifiedAlpha = Alpha ^ Exp
  return ModifiedAlpha
end

local function InterpEaseOut(Alpha, Exp)
  local ModifiedAlpha = 1 - (1 - Alpha) ^ Exp
  return ModifiedAlpha
end

local function InterpEaseInOut(Alpha, Exp)
  if Alpha < 0.5 then
    Alpha = InterpEaseIn(Alpha * 2, Exp) * 0.5
  else
    Alpha = InterpEaseOut(Alpha * 2 - 1, Exp) * 0.5 + 0.5
  end
  return Alpha
end

function TalkCameraManager_C:CalculateBlendPct(CameraBlendFuncType)
  local Alpha = 0
  if 0 == self.TotalTranslationTime then
    Alpha = 1
  else
    Alpha = self.TranslationTime / self.TotalTranslationTime
  end
  local BlendExp = 2
  if CameraBlendFuncType == ECameraBlendFunc.linear then
  elseif CameraBlendFuncType == ECameraBlendFunc.easeInQuad then
    Alpha = InterpEaseIn(Alpha, BlendExp)
  elseif CameraBlendFuncType == ECameraBlendFunc.easeOutQuad then
    Alpha = InterpEaseIn(Alpha, 1 / BlendExp)
  elseif CameraBlendFuncType == ECameraBlendFunc.easeInOutQuad then
    Alpha = InterpEaseInOut(Alpha, BlendExp)
  end
  return Alpha
end

function TalkCameraManager_C:SwitchForceEnablePlayerFashionComponentDither(bEnable)
  if not IsValid(self.Player) then
    return
  end
  self.bEnablePlayerDither = bEnable
  local FC = self.Player:GetComponentByClass(UFashionComponent)
  if IsValid(FC) then
    FC:ForceEnableDitherAlphaByTalk(bEnable)
  end
end

function TalkCameraManager_C:SwitchEnablePlayerDither(bEnable)
  DebugPrint("TalkCameraManager_C:SwitchEnablePlayerDither", bEnable)
  if not IsValid(self.Player) then
    return
  end
  local PCC = self.Player:GetComponentByClass(UPlayerCameraComponent)
  self:SwitchEnablePlayerCameraComponentDither(PCC, bEnable)
end

function TalkCameraManager_C:SwitchEnableTalkPawnDither(bEnable)
  DebugPrint("TalkCameraManager_C:SwitchEnableTalkPawnDither", bEnable)
  if not IsValid(self.TalkPawn) then
    return
  end
  local PCC = self.TalkPawn:GetComponentByClass(UPlayerCameraComponent)
  self:SwitchEnablePlayerCameraComponentDither(PCC, bEnable)
end

function TalkCameraManager_C:SwitchEnablePlayerCameraComponentDither(PCC, bEnable)
  if not IsValid(PCC) then
    return
  end
  if bEnable then
    PCC:EnableCameraDither()
  else
    PCC:DisableCameraDither()
  end
end

function TalkCameraManager_C:ReceiveTick(DeltaTime)
  if self.AIControllerForPlayer and self.PlayerController and self.bUseTalkPawn and self.bEnablePlayerDither then
    local Rot = self.PlayerController:GetControlRotation()
    self.AIControllerForPlayer:SetControlRotation(Rot)
    self.AIControllerForPlayer.bSetControlRotationFromPawnOrientation = false
  end
  if self.SequenceCamera then
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    local PCC = Player:GetComponentByClass(UPlayerCameraComponent)
    local Config = self:MakeConfigFromCamera(PCC)
    local FinalTrans = UE4.UKismetMathLibrary.TInterpTo(self.SequenceCamera:GetTransform(), PCC:K2_GetComponentToWorld(), DeltaTime, 1)
    self.SequenceCamera:K2_SetActorTransform(FinalTrans, false, nil, false)
  end
  self:_CameraBreathe(DeltaTime)
end

function TalkCameraManager_C:_CameraBreathe(DeltaTime)
  if self.IsCameraTransforming and self:GetCurrentCamera() and not self.bBreathePaused then
    if self.bUseFinalCameraBlend then
      self:_CameraBreathe_ByFinalCameraBlendConfig(DeltaTime)
    else
      self:_CameraBreathe_ByCameraTransformConfig(DeltaTime)
    end
  end
end

function TalkCameraManager_C:_CameraBreathe_ByFinalCameraBlendConfig(DeltaTime)
  if not self.Stage then
    return
  end
  local BlendPct = self:CalculateBlendPct(self.ToFinalCameraBlendFuntion)
  UTalkFunctionLibrary.UpdateCameraByBlendViewInfo(self:GetCurrentCamera(), self.StartCameraInfo, self.EndCameraInfo, BlendPct, self.PlayerAspectRatio)
  self.TranslationTime = self.TranslationTime + DeltaTime
  if self.TranslationTime >= self.TotalTranslationTime then
    UTalkFunctionLibrary.UpdateCameraByBlendViewInfo(self:GetCurrentCamera(), self.StartCameraInfo, self.EndCameraInfo, 1, self.PlayerAspectRatio)
    self.IsCameraTransforming = false
    self.StartCameraInfo = nil
    self.EndCameraInfo = nil
    if self.FinalCameraBlendCallback then
      local FinalCameraBlendCallback = self.FinalCameraBlendCallback
      self.FinalCameraBlendCallback = nil
      FinalCameraBlendCallback()
    end
    return
  end
end

function TalkCameraManager_C:_CameraBreathe_ByCameraTransformConfig(DeltaTime)
  self.IsCameraTransforming = false
  if self.RotationTime < self.TotalRotationTime then
    self.CurrentCameraRotation = self.CurrentCameraRotation + self.DeltaRotation * DeltaTime
    self.RotationTime = self.RotationTime + DeltaTime
    self.IsCameraTransforming = true
  end
  if self.TranslationTime < self.TotalTranslationTime then
    self.CurrentCameraLocation = self.CurrentCameraLocation + self.DeltaLocation * DeltaTime
    self.TranslationTime = self.TranslationTime + DeltaTime
    self.IsCameraTransforming = true
  end
  local LocalTrans = UE4.UKismetMathLibrary.MakeTransform(self.CurrentCameraLocation, self.CurrentCameraRotation, FVector(1, 1, 1))
  local FinalTrans = UE4.UKismetMathLibrary.ComposeTransforms(LocalTrans, self.Stage:GetTransform())
  self:GetCurrentCamera():K2_SetActorTransform(FinalTrans, false, nil, false)
end

function TalkCameraManager_C:GetActiveCameraComponent(Target, CameraClass)
  local RtnCameraComponent
  local CameraComponents = Target:K2_GetComponentsByClass(CameraClass)
  for i = 1, CameraComponents:Length() do
    local CameraComponent = CameraComponents:Get(i)
    if CameraComponent:IsActive() then
      RtnCameraComponent = CameraComponent
    end
  end
  return RtnCameraComponent
end

function TalkCameraManager_C:DialogueBlendCamera(CameraInfo, CameraBlendTime, CameraTransform, FinalCameraInfo, CameraBlendCurve, ToFinalCameraBlendTime, TalkStage, Instigator, Callback)
  if not CameraInfo then
    if Callback then
      Callback()
    end
    return
  end
  local FixedCamera = self:GetFixedCamera(CameraInfo, TalkStage)
  self:CameraBlendToNew(Instigator, FixedCamera, CameraBlendTime, nil, {
    Func = function()
      if Callback then
        Callback()
      end
      self:StartCameraBreathe(FixedCamera, CameraTransform, CameraInfo, FinalCameraInfo, CameraBlendCurve, ToFinalCameraBlendTime, TalkStage)
    end
  })
end

function TalkCameraManager_C:_StartCameraBreathe_FinalCameraConfig(CameraInfo, FinalCameraInfo, BlendDuration, Stage, CameraBlendCurve, FinalCameraBlendCallback)
  self.TotalTranslationTime = BlendDuration
  self.TranslationTime = 0
  self.IsCameraTransforming = true
  self.bUseFinalCameraBlend = true
  self.ToFinalCameraBlendFuntion = ECameraBlendFunc[CameraBlendCurve]
  self.Stage = Stage
  self.FinalCameraBlendCallback = FinalCameraBlendCallback
  local Trans, FocalLength, FocusDis, ConstraintAspectRadio, FocusMethod, CurrentAperture
  if CameraInfo then
    Trans, FocalLength, FocusDis, ConstraintAspectRadio, FocusMethod, CurrentAperture = self:RetrieveCameraViewInfo(CameraInfo, self.Stage:GetTransform())
  else
    Trans, FocalLength, FocusDis, ConstraintAspectRadio, FocusMethod, CurrentAperture = self:GetCurrentCameraInfo()
  end
  self.StartCameraInfo = UE4.UTalkFunctionLibrary.MakeCameraBlendViewInfo(Trans, FocalLength, FocusDis, ConstraintAspectRadio, FocusMethod, CurrentAperture)
  Trans, FocalLength, FocusDis, ConstraintAspectRadio, FocusMethod, CurrentAperture = self:RetrieveCameraViewInfo(FinalCameraInfo, self.Stage:GetTransform())
  self.EndCameraInfo = UE4.UTalkFunctionLibrary.MakeCameraBlendViewInfo(Trans, FocalLength, FocusDis, ConstraintAspectRadio, FocusMethod, CurrentAperture)
  if 0 == self.TotalTranslationTime then
    self:ReceiveTick(0)
  end
end

function TalkCameraManager_C:_StartCameraBreathe_CameraTransformConfig(CameraTransform, TargetCameraActor, Stage)
  if not CameraTransform or "" == CameraTransform then
    return
  end
  self.Stage = Stage
  self.IsCameraTransforming = true
  self.bUseFinalCameraBlend = false
  self.ToFinalCameraBlendFuntion = nil
  local List = Split(CameraTransform, ",")
  local AddRotation = UE4.FRotator(tonumber(List[1] or 0), tonumber(List[2] or 0), 0)
  local AngleSpeed = tonumber(List[3] or 4)
  local AddLocation = UE4.FVector(tonumber(List[4] or 0), tonumber(List[5] or 0), tonumber(List[6] or 0))
  local TranslationSpeed = tonumber(List[7] or 0)
  local CurrentTransfrom = TargetCameraActor:GetTransform()
  self.CurrentCameraLocation = CurrentTransfrom.Translation - self.Stage:GetTransform().Translation
  self.TargetCameraLocation = self.CurrentCameraLocation + AddLocation
  self.DeltaLocation = UE4.UKismetMathLibrary.Normal(self.TargetCameraLocation - self.CurrentCameraLocation) * TranslationSpeed
  local Dis = UE4.UKismetMathLibrary.VSize(self.TargetCameraLocation - self.CurrentCameraLocation)
  self.TranslationTime = 0
  if TranslationSpeed > 0 then
    self.TotalTranslationTime = Dis / TranslationSpeed
  else
    self.TotalTranslationTime = 0
  end
  self.CurrentCameraRotation = UE4.UKismetMathLibrary.Quat_Rotator(CurrentTransfrom.Rotation)
  self.TargetCameraRotation = self.CurrentCameraRotation + AddRotation
  local CurrentCameraForward = TargetCameraActor:GetActorForwardVector()
  TargetCameraActor:K2_SetActorRotation(self.TargetCameraRotation, false)
  self.TargetCameraForward = TargetCameraActor:GetActorForwardVector()
  TargetCameraActor:K2_SetActorRotation(self.CurrentCameraRotation, false)
  local DeltaUp = UE4.UKismetMathLibrary.Normal(UE4.UKismetMathLibrary.Cross_VectorVector(CurrentCameraForward, self.TargetCameraForward))
  local DeltaForward = UE4.UKismetMathLibrary.RotateAngleAxis(CurrentCameraForward, AngleSpeed, DeltaUp)
  self.DeltaRotation = UE4.UKismetMathLibrary.FindLookAtRotation(self.CurrentCameraLocation, self.CurrentCameraLocation + DeltaForward) - self.CurrentCameraRotation
  self.DeltaRotation.Roll = 0
  self.RotationTime = 0
  local TotalAngle = UE4.UKismetMathLibrary.DegAcos(CurrentCameraForward:Dot(self.TargetCameraForward))
  self.TotalRotationTime = TotalAngle / AngleSpeed
  DebugPrint("InitCameraTransformAnim", self.CurrentCameraLocation, self.TargetCameraLocation, self.DeltaLocation, self.CurrentCameraRotation, self.TargetCameraRotation, self.DeltaRotation, self.TotalRotationTime, self.TotalTranslationTime)
end

function TalkCameraManager_C:StartCameraBreathe(TargetCameraActor, CameraTransform, CameraInfo, FinalCameraInfo, CameraBlendCurve, BlendDuration, Stage)
  if nil == TargetCameraActor then
    return
  end
  self.bBreathePaused = false
  if CameraInfo and FinalCameraInfo then
    self:_StartCameraBreathe_FinalCameraConfig(CameraInfo, FinalCameraInfo, BlendDuration, Stage, CameraBlendCurve)
  else
    self:_StartCameraBreathe_CameraTransformConfig(CameraTransform, TargetCameraActor, Stage)
  end
end

function TalkCameraManager_C:PauseCameraBreathe(bPause)
  self.bBreathePaused = bPause
end

function TalkCameraManager_C:StopCameraBreathe()
  self.RotationTime = self.TotalRotationTime + 1
  self.TranslationTime = self.TotalTranslationTime + 1
  self.IsCameraTransforming = false
  self.bBreathePaused = false
  self.StartCameraInfo = nil
  self.EndCameraInfo = nil
  if self.FinalCameraBlendCallback then
    self.FinalCameraBlendCallback()
    self.FinalCameraBlendCallback = nil
  end
end

function TalkCameraManager_C:SkipCameraBreathe()
  self:ReceiveTick(self.TotalTranslationTime)
end

function TalkCameraManager_C:ClearCameraBreatheCallback()
  self.FinalCameraBlendCallback = nil
end

function TalkCameraManager_C:SwitchCameraRole(Target)
  if "TalkPawn" == Target then
    self:SwitchToTalkPawn()
  elseif "Player" == Target then
    self:SwitchToPlayer()
  end
end

function TalkCameraManager_C:CameraBlendToNew(Instigator, TargetCamera, BlendTime, TalkPawnSwitch, Callback, CurveInfo, EaseExp)
  self:StopCameraBreathe()
  local PlayerCameraManager = UE4.UGameplayStatics.GetPlayerCameraManager(GWorld.GameInstance, 0)
  local CurrentCameraLoc = PlayerCameraManager:GetCameraLocation()
  DebugPrint("TalkCameraManager_C:CameraBlendToNew", Instigator, TargetCamera, TargetCamera:GetName(), TargetCamera:K2_GetActorLocation(), CurrentCameraLoc, BlendTime, TalkPawnSwitch, Callback, CurveInfo, EaseExp)
  
  local function OnBlendEndCallback()
    USequenceFunctionLibrary.SetViewTarget(self.PlayerController, TargetCamera)
    self:SetCurrentCamera(TargetCamera)
    self:SwitchCameraRole(TalkPawnSwitch)
    self.TalkContext:TryFireCallback(Callback)
    local PlayerController = UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
    UTalkSequenceFunctionLibrary.UpdatePlayerCameraManager(PlayerController)
    DebugPrint("TalkCameraManager_C:OnBlendEndCallback", UKismetSystemLibrary.GetFrameCount(), PlayerController:GetViewTarget():GetName(), PlayerController.PlayerCameraManager:GetCameraLocation())
  end
  
  if -1 == BlendTime then
    OnBlendEndCallback()
  elseif 0 == BlendTime then
    OnBlendEndCallback()
  else
    if CurveInfo then
      USequenceFunctionLibrary.SetViewTargetWithBlendByCurve(self.PlayerController, TargetCamera, BlendTime, CurveInfo.FOVCurveName, CurveInfo.CameraPositionCurveName, CurveInfo.CameraRotationCurveName)
    elseif EaseExp then
      USequenceFunctionLibrary.SetViewTargetWithBlend(self.PlayerController, TargetCamera, BlendTime, UE4.EViewTargetBlendFunction.VTBlend_EaseInOut, EaseExp)
    else
      USequenceFunctionLibrary.SetViewTargetWithBlend(self.PlayerController, TargetCamera, BlendTime)
    end
    self.TalkContext:AddTimer(BlendTime, function()
      self.TalkContext:RemoveTimer(Instigator)
      OnBlendEndCallback()
    end, false, 0, Instigator)
  end
end

function TalkCameraManager_C:FreeSimpleCameraBlendOutTo(Callback, TalkTaskData, TargetCamera, BlendTime, EaseExp)
  DebugPrint("TalkCameraManager_C:FreeSimpleCameraBlendOutTo", BlendTime, EaseExp)
  self:StopCameraBreathe()
  
  local function OverrideCallback()
    local Rot = self.AIControllerForPlayer:GetControlRotation()
    self:SwitchToPlayer()
    self.PlayerController:SetControlRotation(Rot)
    self.AIControllerForPlayer.bSetControlRotationFromPawnOrientation = false
    self.TalkContext:TryFireCallback(Callback)
  end
  
  if -1 == BlendTime then
    self.TalkContext:TryFireCallback(Callback)
  elseif 0 == BlendTime then
    USequenceFunctionLibrary.SetViewTarget(self.PlayerController, TargetCamera)
    OverrideCallback()
  else
    local Rot = self.PlayerController:GetControlRotation()
    self.AIControllerForPlayer.bSetControlRotationFromPawnOrientation = false
    self.AIControllerForPlayer:SetControlRotation(Rot)
    if EaseExp and EaseExp > 0 then
      USequenceFunctionLibrary.SetViewTargetWithBlend(self.PlayerController, TargetCamera, BlendTime, UE4.EViewTargetBlendFunction.VTBlend_EaseInOut, EaseExp)
    else
      USequenceFunctionLibrary.SetViewTargetWithBlend(self.PlayerController, TargetCamera, BlendTime, nil, nil, true)
    end
    self.TalkContext.TalkTimerManager:AddTimer("FreeSimpleCameraBlendOut", BlendTime, false, nil, nil, function()
      self.TalkContext.TalkTimerManager:ClearTimer("FreeSimpleCameraBlendOut")
      self:SetCurrentCamera(TargetCamera)
      OverrideCallback()
    end)
  end
end

function TalkCameraManager_C:KeepCurrentCamera()
  USequenceFunctionLibrary.SetViewTarget(self.PlayerController, self:GetCurrentCamera())
end

function TalkCameraManager_C:SetCurrentCamera(Camera)
  self.CurrentCamera = Camera
  if self.CachedPPInfo then
    self:SetPostProcess_Internal(self.CachedPPInfo)
  end
end

function TalkCameraManager_C:SwitchToTalkPawn()
  if self.AIControllerForPlayer == nil then
    self.AIControllerForPlayer = self.TalkContext:GetWorld():SpawnActor(ATalkAIController:StaticClass(), UE4.UKismetMathLibrary.MakeTransform(UE4.FVector(), UE4.FRotator(), UE4.FVector(1, 1, 1)))
  end
  DebugPrint("TalkCameraManager_C:SwitchToTalkPawn", self.PlayerController, self.Player, self.TalkPawn, self.AIControllerForPlayer, UE4.UKismetSystemLibrary.GetFrameCount())
  self.bUseTalkPawn = true
  self.PlayerController:SetLastPawn(self.Player)
  self.PlayerController:Possess(self.TalkPawn)
  self.AIControllerForPlayer:Possess(self.Player)
  local FC = self.Player:GetComponentByClass(UFashionComponent)
  if FC then
    FC:ForceEnableDitherAlphaByTalk(true)
  end
end

function TalkCameraManager_C:SwitchToPlayer()
  if not self.bUseTalkPawn then
    return
  end
  DebugPrint("TalkCameraManager_C:SwitchToPlayer", UE4.UKismetSystemLibrary.GetFrameCount())
  if self.AIControllerForPlayer then
    self.AIControllerForPlayer:UnPossess(self.Player)
  end
  self.bUseTalkPawn = false
  self.PlayerController:Possess(self.Player)
end

function TalkCameraManager_C:SetTalkPawnEnableChangeView(bEnable)
  DebugPrint("TalkCameraManager_C:SetTalkPawnEnableChangeView", bEnable)
  if self.TalkPawn then
    self.TalkPawn:SetEnableChangeView(bEnable)
  end
end

function TalkCameraManager_C:GetTalkPawn(bCalculateTrans, bUseOldTalkPawn, ProceduralParams)
  if bUseOldTalkPawn and self.TalkPawn then
    return self.TalkPawn
  end
  local Loc = FVector(1)
  local Rot = FRotator(0, 0, 0)
  if IsValid(self.TalkPawn) then
    self.TalkPawn:K2_DestroyActor()
  end
  local TalkPawnClass = LoadClass("/Game/BluePrints/Story/Talk/Base/BP_TalkPlayerPawn.BP_TalkPlayerPawn_C")
  self.TalkPawn = self.TalkContext:GetWorld():SpawnActor(TalkPawnClass, UE4.UKismetMathLibrary.MakeTransform(Loc, Rot, FVector(1)))
  self:AdaptCameraComponent(self.TalkPawn.Camera)
  return self.TalkPawn
end

function TalkCameraManager_C:GetTalkPawnNew(bCalculateTrans, bUseOldTalkPawn, bUseProceduralCamera, ProceduralCameraId)
  if bUseOldTalkPawn and self.TalkPawn then
    return self.TalkPawn
  end
  local ProceduralParams
  if bUseProceduralCamera and ProceduralCameraId then
    local ProceduralCameraData = DataMgr.FreeCamera[ProceduralCameraId]
    ProceduralParams = {
      CameraControl = ProceduralCameraData.CameraControl,
      PushX = ProceduralCameraData.PushDistance,
      PullX = ProceduralCameraData.PullDistance,
      AngleThreshold = ProceduralCameraData.BlockRange,
      AngleAfterBlock = ProceduralCameraData.IfBlockThenRot,
      CameraHeight = ProceduralCameraData.CameraHeight,
      PivotOffset = ProceduralCameraData.PivotOffset
    }
  end
  local Loc, Rot
  if bCalculateTrans then
    Loc, Rot = self:CalculateTalkPawnTrans((ProceduralParams or {}).PivotOffset)
  else
    Loc = FVector(1)
    Rot = FRotator(0, 0, 0)
  end
  if not self.TalkPawn then
    local TalkPawnClass = LoadClass("/Game/BluePrints/Story/Talk/Base/BP_TalkPlayerPawn.BP_TalkPlayerPawn_C")
    self.TalkPawn = self.TalkContext:GetWorld():SpawnActor(TalkPawnClass, UE4.UKismetMathLibrary.MakeTransform(Loc, Rot, FVector(1)))
  end
  self.TalkPawn:K2_SetActorTransform(UE4.UKismetMathLibrary.MakeTransform(Loc, Rot, FVector(1)), false, nil, false)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if bCalculateTrans and ProceduralParams then
    local CameraActor = self:GetCurrentCamera()
    self.TalkContext:FreeSimpleProceduralCamera(CameraActor, self.TalkPawn, self.Player, self.InteractiveActor, ProceduralParams.PushX, ProceduralParams.PullX, ProceduralParams.AngleThreshold, ProceduralParams.AngleAfterBlock, ProceduralParams.CameraHeight)
    if ProceduralParams.CameraControl == nil or ProceduralParams.CameraControl == false then
      self.TalkPawn:SetDisableRotation(true)
    end
  end
  self:AdaptCameraComponent(self.TalkPawn.Camera)
  return self.TalkPawn
end

function TalkCameraManager_C:CalculateTalkPawnTrans(PivotOffset)
  local InteractiveActor = self.InteractiveActor or self.Player
  local StoryPlayable = InteractiveActor:Cast(UStoryPlayableInterface)
  local CameraLocationOffset = FVector(0, 0, PivotOffset or 0)
  if StoryPlayable then
    CameraLocationOffset = StoryPlayable:GetFreeCameraOffset() + FVector(0, 0, PivotOffset or 0)
  end
  local CameraLocation = (self.Player:K2_GetActorLocation() + InteractiveActor:K2_GetActorLocation()) / 2 + CameraLocationOffset
  local CameraRotation
  FRotator(0, 0, 0)
  local CameraComp = self.Player:GetComponentByClass(UCameraComponent)
  if CameraComp then
    CameraRotation = UKismetMathLibrary.Conv_VectorToRotator(CameraLocation - CameraComp:K2_GetComponentLocation())
  else
    CameraComp = self.Player:GetComponentByClass(UCameraComponent)
  end
  return CameraLocation, CameraRotation
end

function TalkCameraManager_C:GetCurrentCamera()
  return self.CurrentCamera or self.Player
end

function TalkCameraManager_C:GetCurrentCameraInfo()
  local CurrentCamera = self:GetCurrentCamera()
  if not CurrentCamera then
    return
  end
  local CineCamera = CurrentCamera:GetCineCameraComponent()
  if not CineCamera then
    return
  end
  local Trans = CurrentCamera:GetTransform()
  local FocalLength = CineCamera.CurrentFocalLength
  local FocusDis = CineCamera.FocusSettings and CineCamera.FocusSettings.ManualFocusDistance or 0
  local ConstraintAspectRadio = CineCamera.bConstrainAspectRatio
  local FocusMethod = CineCamera.FocusSettings and CineCamera.FocusSettings.FocusMethod
  FocusMethod = FocusMethod and ECameraFocusMethod[FocusMethod] or "Disable"
  local CurrentAperture = CineCamera.CurrentAperture
  return Trans, FocalLength, FocusDis, ConstraintAspectRadio, FocusMethod, CurrentAperture
end

function TalkCameraManager_C:GetCineCamera()
  local CameraIdx = self:GetCineCameraIdx()
  local CineCamera = self.CineCameras[CameraIdx]
  if not CineCamera then
    self.CineCameras[CameraIdx] = self.TalkContext:GetWorld():SpawnActor(ACineCameraActor:StaticClass(), UE4.UKismetMathLibrary.MakeTransform(FVector(1), FRotator(0, 0, 0), FVector(1)), UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
    local CameraComp = self:GetCameraComponent(self.CineCameras[CameraIdx])
    self:MarkCameraIsConfigured(CameraComp, false)
    self:RecordCameraConfig(CameraComp, nil)
    self:AdaptCameraComponent(CameraComp)
    CameraComp:SetConstraintAspectRatio(false)
    return self.CineCameras[CameraIdx]
  else
    local CameraComp = self:GetCameraComponent(CineCamera)
    self:MarkCameraIsConfigured(CameraComp, false)
    self:RecordCameraConfig(CameraComp, nil)
    return CineCamera
  end
end

local function Split(str, p)
  local rt = {}
  string.gsub(str, "[^" .. p .. "]+", function(w)
    table.insert(rt, w)
  end)
  return rt
end

function TalkCameraManager_C:RetrieveCameraViewInfo(CameraInfo, AnchorTrans)
  local List = Split(CameraInfo, ",")
  local Loc = FVector(tonumber(List[1]), tonumber(List[2]), tonumber(List[3]))
  local Rot = FRotator(tonumber(List[5]), tonumber(List[6]), tonumber(List[4]))
  local LocTrans = UE4.UKismetMathLibrary.MakeTransform(Loc, Rot, FVector(1, 1, 1))
  local Trans = UE4.UKismetMathLibrary.ComposeTransforms(LocTrans, AnchorTrans)
  local FocalLength = tonumber(List[7])
  local FocusDis = tonumber(List[8])
  local ConstraintAspectRadio = "true" == List[9] and true or false
  local FocusMethod = List[10]
  local CurrentAperture = tonumber(List[11])
  return Trans, FocalLength, FocusDis, ConstraintAspectRadio, FocusMethod, CurrentAperture
end

function TalkCameraManager_C:GetDefaultCameraViewInfo()
  local Trans = self.Player:GetCameraComponent():K2_GetComponentToWorld()
  local FocalLength = 0
  local FocusDis = 0
  local ConstraintAspectRadio = false
  local FocusMethod = "Disable"
  local CurrentAperture = 0
  return Trans, FocalLength, FocusDis, ConstraintAspectRadio, FocusMethod, CurrentAperture
end

function TalkCameraManager_C:MakeSequenceCamera()
  self.SequenceCamera = self:GetCineCamera()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local PCC = Player:GetComponentByClass(UPlayerCameraComponent)
  local Config = self:MakeConfigFromCamera(PCC)
  self.SequenceCamera:K2_SetActorTransform(PCC:K2_GetComponentToWorld(), false, nil, false)
  self:PasteConfigToCamera(self.SequenceCamera, Config)
end

function TalkCameraManager_C:ClearSequenceCamera()
  self.SequenceCamera = nil
end

function TalkCameraManager_C:GetFixedCamera(CameraInfo, Stage, bUseDefaultIfCameraInfoIsNil, bUseDebugStage)
  bUseDefaultIfCameraInfoIsNil = bUseDefaultIfCameraInfoIsNil or false
  local CineCamera = self:GetCineCamera()
  local Trans, FocalLength, FocusDis, ConstraintAspectRadio, FocusMethod, CurrentAperture
  if nil == CameraInfo and bUseDefaultIfCameraInfoIsNil then
    if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(self.TalkContext) then
      ScreenPrint("\233\149\156\229\164\180\230\156\170\233\133\141\231\189\174\239\188\140\228\189\191\231\148\168\233\187\152\232\174\164\233\149\156\229\164\180\233\133\141\231\189\174\239\188\129")
    end
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    local PCC = Player:GetComponentByClass(UPlayerCameraComponent)
    local Config = self:MakeConfigFromCamera(PCC)
    CineCamera:K2_SetActorTransform(PCC:K2_GetComponentToWorld(), false, nil, false)
    self:PasteConfigToCamera(CineCamera, Config)
    self:MarkCameraIsConfigured(self:GetCameraComponent(CineCamera), true)
    self:RecordCameraConfig(self:GetCameraComponent(CineCamera), Config)
  elseif nil == CameraInfo or "" == CameraInfo then
    local Message = "\233\149\156\229\164\180\228\191\161\230\129\175\230\156\170\233\133\141\231\189\174(Debug\228\191\161\230\129\175\231\155\174\229\137\141\228\184\141\229\164\170\229\165\189\229\138\160\239\188\140\228\185\139\229\144\142\232\161\165\229\133\133)"
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, FeishuErrorTitle, Message)
  else
    if Stage then
      Trans, FocalLength, FocusDis, ConstraintAspectRadio, FocusMethod, CurrentAperture = self:RetrieveCameraViewInfo(CameraInfo, Stage:GetTransform())
    elseif bUseDebugStage then
      local PlayerCameraManager = UE4.UGameplayStatics.GetPlayerCameraManager(GWorld.GameInstance, 0)
      local Loc = PlayerCameraManager:GetCameraLocation()
      local Rot = PlayerCameraManager:GetCameraRotation()
      Trans = FTransform(Loc, Rot)
      FocalLength, FocusDis, ConstraintAspectRadio, FocusMethod, CurrentAperture = 27, 100000, false, 0, 2.8
    end
    CineCamera:K2_SetActorTransform(Trans, false, nil, false)
    UTalkFunctionLibrary.UpdateCameraSettingFromConfig(CineCamera, FocalLength, FocusDis, ConstraintAspectRadio, FocusMethod, CurrentAperture, self.PlayerAspectRatio)
    self:MarkCameraIsConfigured(self:GetCameraComponent(CineCamera), true)
    local Config = {
      ConstraintAspectRadio = ConstraintAspectRadio,
      FocalLength = FocalLength,
      AspectRatio = 1.7777778,
      SensorWidth = 23.76
    }
    self:RecordCameraConfig(self:GetCameraComponent(CineCamera), Config)
  end
  return CineCamera
end

function TalkCameraManager_C:MarkCameraIsConfigured(TargetCamera, bIsConfigured)
  if not TargetCamera then
    return
  end
  local Camera = self:GetCameraComponent(TargetCamera)
  if bIsConfigured then
    self.ConfiguredCameras[Camera] = true
  elseif self.ConfiguredCameras[Camera] then
    self.ConfiguredCameras[Camera] = nil
  end
end

function TalkCameraManager_C:IsConfiguredCamera(TargetCamera)
  local Camera = self:GetCameraComponent(TargetCamera)
  return self.ConfiguredCameras[Camera]
end

function TalkCameraManager_C:RecordCameraConfig(TargetCamera, Config)
  if not TargetCamera then
    return
  end
  local Camera = self:GetCameraComponent(TargetCamera)
  self.CameraConfigs[Camera] = Config
end

function TalkCameraManager_C:GetCameraConfig(TargetCamera)
  local Camera = self:GetCameraComponent(TargetCamera)
  return self.CameraConfigs[Camera]
end

function TalkCameraManager_C:GetFirstBoundObject(SequenceActor, Tag)
  local Binds = SequenceActor:FindNamedBindings(Tag)
  for i = 1, Binds:Num() do
    local Objects = SequenceActor.SequencePlayer:GetBoundObjects(Binds[i])
    for j = 1, Objects:Num() do
      return Objects[j]
    end
  end
end

function TalkCameraManager_C:MakeConfigFromCamera(Camera)
  local CameraComp = self:GetCameraComponent(Camera)
  local Config = {}
  if URuntimeCommonFunctionLibrary.ObjIsChildOf(CameraComp, UCineCameraComponent) then
    Config = {
      FocalLength = CameraComp.CurrentFocalLength,
      AspectRatio = CameraComp.Filmback.SensorAspectRatio,
      SensorWidth = CameraComp.Filmback.SensorWidth,
      SensorHeight = CameraComp.Filmback.SensorHeight,
      FOV = CameraComp:GetHorizontalFieldOfView(),
      Class = ECameraComponentClass.CineCameraComponent
    }
  elseif URuntimeCommonFunctionLibrary.ObjIsChildOf(CameraComp, UCameraComponent) then
    Config = {
      FOV = CameraComp.FieldOfView,
      AspectRatio = CameraComp.AspectRatio,
      Class = ECameraComponentClass.CameraComponent
    }
  end
  return Config
end

function TalkCameraManager_C:PasteConfigToCamera(Camera, Config)
  local CameraComp = self:GetCameraComponent(Camera)
  if URuntimeCommonFunctionLibrary.ObjIsChildOf(CameraComp, UCineCameraComponent) then
    if Config.Class == ECameraComponentClass.CameraComponent then
      CameraComp:SetAspectRatio(Config.AspectRatio)
      CameraComp:SetFieldOfView(Config.FOV)
    elseif Config.Class == ECameraComponentClass.CineCameraComponent then
      CameraComp.SensorWidth = Config.SensorWidth
      CameraComp.SensorHeight = Config.SensorHeight
      CameraComp:SetCurrentFocalLength(Config.FocalLength)
    end
  elseif URuntimeCommonFunctionLibrary.ObjIsChildOf(CameraComp, UCineCameraComponent) then
    CameraComp:SetAspectRatio(Config.AspectRatio)
    CameraComp:SetFieldOfView(Config.FOV)
  end
end

function TalkCameraManager_C:GetCineCameraIdx()
  local CurrentCineCameraIdx = self.CurrentCineCameraIdx
  self.CurrentCineCameraIdx = self.CurrentCineCameraIdx % 3 + 1
  return CurrentCineCameraIdx
end

function TalkCameraManager_C:AdaptCameraActor(TargetActor)
  if IsValid(TargetActor) then
    local CameraComponent = self:GetCameraComponent(TargetActor)
    self:AdaptCameraComponent(CameraComponent)
  end
end

function TalkCameraManager_C:FixAndReturnFOV(CameraComponent, Config, NewAspectRatio)
  local InitFOV = Config.FOV
  if not InitFOV then
    local SensorWidth = Config.SensorWidth or 23.76
    if Config.FocalLength then
      InitFOV = math.deg(2.0 * math.atan(SensorWidth / (2.0 * Config.FocalLength)))
    else
      InitFOV = 37.497356
    end
  end
  local InitFOVHalfTan = math.tan(math.rad(InitFOV / 2))
  local InitAspectRatio = 1.7777778
  local NewFOV = 2 * (math.atan(InitFOVHalfTan * NewAspectRatio / InitAspectRatio) * 180 / math.pi)
  return NewFOV
end

function TalkCameraManager_C:AdaptCameraComponent(CameraComponent)
  if not IsValid(CameraComponent) or not self.bNeedFixCamera then
    return
  end
  local AspectRatio, FOV, bConstrainAspectRatio = CommonUtils:GetCurrentAspectRatioAndFOV()
  local NewFOV = FOV
  if self:IsConfiguredCamera(CameraComponent) then
    local Config = self:GetCameraConfig(CameraComponent)
    NewFOV = self:FixAndReturnFOV(CameraComponent, Config, AspectRatio)
  end
  if URuntimeCommonFunctionLibrary.ObjIsChildOf(CameraComponent, UCineCameraComponent) then
    local CineCameraComponent = CameraComponent
    if IsValid(CineCameraComponent) then
      local DesiredHeight = CineCameraComponent.Filmback.SensorWidth / AspectRatio
      CineCameraComponent.bConstrainAspectRatio = false
      CineCameraComponent:SetFieldOfView(NewFOV)
      CineCameraComponent.Filmback.SensorHeight = DesiredHeight
    end
  elseif URuntimeCommonFunctionLibrary.ObjIsChildOf(CameraComponent, UCameraComponent) then
    CameraComponent.bConstrainAspectRatio = false
    CameraComponent:SetFieldOfView(NewFOV)
    CameraComponent:SetAspectRatio(AspectRatio)
  end
end

function TalkCameraManager_C:OnSequenceCameraSpawned(TargetActor)
  if not IsValid(TargetActor) then
    return
  end
  local CameraComp = self:GetCameraComponent(TargetActor)
  if not IsValid(CameraComp) then
    return
  end
  if IsValid(TargetActor) then
    self:MarkCameraIsConfigured(CameraComp, true)
    local Config = {
      FocalLength = CameraComp.CurrentFocalLength,
      AspectRatio = CameraComp.Filmback and CameraComp.Filmback.SensorAspectRatio,
      SensorWidth = CameraComp.Filmback and CameraComp.Filmback.SensorWidth,
      FOV = CameraComp.GetHorizontaFieldOfView and CameraComp.GetHorizontaFieldOfView() or CameraComp.FieldOfView
    }
    self:RecordCameraConfig(CameraComp, Config)
  end
end

function TalkCameraManager_C:OnPlayerWindowChanged(bConstrainAspectRatio, NewAspectRatio, NewFOV)
  self.bNeedFixCamera = true
  self.PlayerAspectRatio = NewAspectRatio
  if self.CineCameras then
    for Idx, Camera in pairs(self.CineCameras) do
      if IsValid(Camera) then
        self:AdaptCameraActor(Camera)
      else
        self.CineCameras[Idx] = nil
      end
    end
  end
  if self.TalkContext.CamerasInSequence then
    for Idx, Camera in pairs(self.TalkContext.CamerasInSequence) do
      if IsValid(Camera) then
        self:AdaptCameraActor(Camera)
      else
        self.TalkContext.CamerasInSequence[Idx] = nil
      end
    end
  end
  if IsValid(self.TalkPawn) and IsValid(self.TalkPawn.Camera) then
    self:AdaptCameraComponent(self.TalkPawn.Camera)
  end
end

function TalkCameraManager_C:AdaptCineCameraConstraint(CameraActor)
  local CameraComponent = self:GetCameraComponent(CameraActor)
  if not IsValid(CameraComponent) then
    return
  end
  CameraComponent:SetConstraintAspectRatio(false)
end

function TalkCameraManager_C:GetCameraComponent(CameraActor)
  local CameraComponent
  if IsValid(CameraActor) then
    if URuntimeCommonFunctionLibrary.ObjIsChildOf(CameraActor, UCameraComponent) then
      CameraComponent = CameraActor
    elseif URuntimeCommonFunctionLibrary.ObjIsChildOf(CameraActor, ACineCameraActor) then
      CameraComponent = CameraActor:GetCineCameraComponent()
    elseif URuntimeCommonFunctionLibrary.ObjIsChildOf(CameraActor, ACameraActor) then
      CameraComponent = CameraActor.CameraComponent
    end
  end
  return CameraComponent
end

function TalkCameraManager_C:OnExceptionInterrupted()
  if self.bUseTalkPawn then
    self:SwitchToPlayer()
  end
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if IsValid(PlayerController) and IsValid(self.Player) then
    USequenceFunctionLibrary.SetViewTarget(PlayerController, self.Player)
  end
end

function TalkCameraManager_C:SetPostProcess(MaterialPath)
  if self.CachedPPInfo and self.CachedPPInfo.MaterialPath ~= MaterialPath then
    self:ClearPostProcess()
  end
  if "None" == MaterialPath then
    return
  end
  local Material = LoadObject(MaterialPath)
  if not Material then
    local Message = "\229\144\142\229\164\132\231\144\134\230\157\144\232\180\168\228\184\141\229\173\152\229\156\168\239\188\140\232\183\175\229\190\132\239\188\154" .. MaterialPath
    local Title = "\229\175\185\232\175\157\232\132\154\230\156\172Error\239\188\154\229\144\142\229\164\132\231\144\134\230\157\144\232\180\168\228\184\141\229\173\152\229\156\168"
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, Title, Message)
    return
  end
  local MaterialType = Material:GetBaseMaterial()
  local DynamicInstance = UE4.UKismetMaterialLibrary.CreateDynamicMaterialInstance(self, Material)
  self.CachedPPInfo = {
    MaterialPath = MaterialPath,
    MaterialType = MaterialType,
    DynamicInstance = DynamicInstance
  }
  self:SetPostProcess_Internal(self.CachedPPInfo)
end

function TalkCameraManager_C:SetPostProcess_Internal(PostProcessInfo)
  local MaterialType = PostProcessInfo.MaterialType
  local DynamicInstance = PostProcessInfo.DynamicInstance
  local CameraComponent = self:GetCameraComponent(self:GetCurrentCamera()) or self:GetCurrentCamera():GetComponentByClass(UPlayerCameraComponent)
  if not CameraComponent then
    DebugPrint("lhr@SetPostProcess: CameraComponent is nil", self:GetCurrentCamera() and self:GetCurrentCamera():GetName())
    return
  end
  self.ProcessedCameras = self.ProcessedCameras or {}
  if self.ProcessedCameras[CameraComponent] then
    return
  end
  if CameraComponent.MaterialInstDynamicMaps then
    if CameraComponent.MaterialInstDynamicMaps:Find(MaterialType) then
      DynamicInstance = CameraComponent.MaterialInstDynamicMaps:Find(MaterialType)
    else
      CameraComponent.MaterialInstDynamicMaps:Add(MaterialType, DynamicInstance)
    end
  end
  CameraComponent:AddOrUpdateBlendable(DynamicInstance, 1)
  self.ProcessedCameras[CameraComponent] = true
end

function TalkCameraManager_C:ClearPostProcess()
  self.ProcessedCameras = self.ProcessedCameras or {}
  for CameraComp, _ in pairs(self.ProcessedCameras) do
    self:ClearSingleCameraPP(CameraComp)
  end
  self.ProcessedCameras = {}
  self.CachedPPInfo = nil
end

function TalkCameraManager_C:ClearSingleCameraPP(CameraComponent)
  if not CameraComponent then
    return
  end
  if CameraComponent.ClearBlendables then
    CameraComponent:ClearBlendables()
  elseif CameraComponent.PostProcessSettings then
    CameraComponent.PostProcessSettings.WeightedBlendables.Array:Clear()
  end
  if CameraComponent.MaterialInstDynamicMaps then
    CameraComponent.MaterialInstDynamicMaps:Clear()
  end
end

return TalkCameraManager_C
