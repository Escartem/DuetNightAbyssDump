local M = Class("BluePrints.Common.MVC.Controller")
local Model = require("BluePrints.UI.WBP.StoryInteractive.StoryInteractiveModel")

function M:Init()
  self.Super.Init(self)
  self.AIControllerForPlayer = nil
  self.TalkPawn = nil
  self.Mode = "Player"
end

function M:Destory()
  self.Super.Destory(self)
  self.AIControllerForPlayer = nil
  self.TalkPawn = nil
end

function M:GetEventName()
  return "StoryInterActive"
end

function M:GetModel()
  return Model
end

function M:AdaptCameraComponent(CameraComponent)
  if not IsValid(CameraComponent) then
    return
  end
  local AspectRatio, FOV, bConstrainAspectRatio = CommonUtils:GetCurrentAspectRatioAndFOV()
  local NewFOV = FOV
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

function M:TryStartInteractive(NpcId, NpcCharacter, PlayerActor, EndCallback)
  if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(NpcCharacter) and self:GetAvatar() == nil and self.bInited ~= true then
    self:Init()
  end
  if Model:HasMultiInteractive(NpcId) then
    DebugPrint("WXT M:TryStartInteractive OpenView", NpcId)
    self:OpenView(NpcCharacter, "StoryInteractiveUI", NpcId, EndCallback)
  else
    local TalkInteractiveInfos = Model:GetNpcTalkInteractives(NpcId)
    DebugPrint("WXT M:TryStartInteractive DirectStartInteractive", NpcId)
    self:DirectStartInteractive(TalkInteractiveInfos[1], NpcCharacter, PlayerActor, EndCallback)
  end
end

function M:DirectStartInteractive(TalkInfo, NpcCharacter, PlayerActor, EndCallback)
  if not TalkInfo then
    if EndCallback and EndCallback.Func then
      EndCallback.Func(EndCallback.Obj)
    end
    return
  end
  if TalkInfo.Type == "TalkTrigger" then
    DebugPrint("WXT DirectStartTalkTrigger")
    self:DirectStartTalkTrigger(TalkInfo.TalkTriggerId, NpcCharacter.NpcId, NpcCharacter, PlayerActor, EndCallback)
    return
  end
  if TalkInfo.Type == "TalkNode" then
    DebugPrint("WXT DirectStartTalkNode")
    self:DirectStartTalkNode(TalkInfo.BindId, NpcCharacter.NpcId, NpcCharacter, EndCallback)
    return
  end
  if EndCallback and EndCallback.Func then
    EndCallback.Func(EndCallback.Obj)
  end
end

function M:DirectStartTalkTrigger(TalkTriggerId, NpcId, NpcCharacter, PlayerActor, EndCallback)
  local TS = TalkSubsystem()
  local GameInstance = GWorld.GameInstance
  local TalkContext = GameInstance:GetTalkContext()
  TalkContext:StartTalk(TalkTriggerId, nil, nil, PlayerActor, NpcCharacter, EndCallback, TS and TS:GetNpcPlayDialogueCallback(NpcId) or nil)
end

function M:DirectStartTalkNode(Index, NpcId, NpcCharacter, EndCallback)
  GWorld.StoryMgr:TryExecNPCInteractiveTalk(NpcId, NpcCharacter, Index, EndCallback)
end

function M:CalculateTalkPawnTrans(InteractiveActor, Player, PivotOffset)
  local InteractiveActor = InteractiveActor or Player
  local StoryPlayable = InteractiveActor:Cast(UStoryPlayableInterface)
  local CameraLocationOffset = FVector(0, 0, PivotOffset or 0)
  if StoryPlayable then
    CameraLocationOffset = StoryPlayable:GetFreeCameraOffset() + FVector(0, 0, PivotOffset or 0)
  end
  local CameraLocation = (Player:K2_GetActorLocation() + InteractiveActor:K2_GetActorLocation()) / 2 + CameraLocationOffset
  local CameraRotation
  FRotator(0, 0, 0)
  local CameraComp = Player:GetComponentByClass(UCameraComponent)
  if CameraComp then
    CameraRotation = UKismetMathLibrary.Conv_VectorToRotator(CameraLocation - CameraComp:K2_GetComponentLocation())
  else
    CameraComp = Player:GetComponentByClass(UCameraComponent)
  end
  return CameraLocation, CameraRotation
end

function M:CreateTalkPawn(bCalculateTrans, bUseProceduralCamera, ProceduralCameraId, InteractiveActor)
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
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local Loc, Rot
  if bCalculateTrans then
    Loc, Rot = self:CalculateTalkPawnTrans(InteractiveActor, Player, (ProceduralParams or {}).PivotOffset)
  else
    Loc = FVector(1)
    Rot = FRotator(0, 0, 0)
  end
  local GameInstance = GWorld.GameInstance
  local TalkContext = GameInstance:GetTalkContext()
  if IsValid(self.TalkPawn) then
    self.TalkPawn:K2_DestroyActor()
    self.TalkPawn = nil
    if IsValid(self.AIControllerForPlayer) then
      self.AIControllerForPlayer:K2_DestroyActor()
      self.AIControllerForPlayer = nil
    end
  end
  local TalkPawnClass = LoadClass("/Game/BluePrints/Story/Talk/Base/BP_TalkPlayerPawn.BP_TalkPlayerPawn_C")
  self.TalkPawn = TalkContext:GetWorld():SpawnActor(TalkPawnClass, UE4.UKismetMathLibrary.MakeTransform(Loc, Rot, FVector(1)))
  self.TalkPawn:SetEnableChangeView(false)
  if bCalculateTrans and ProceduralParams then
    TalkContext:FreeSimpleProceduralCamera(Player, self.TalkPawn, Player, InteractiveActor, ProceduralParams.PushX, ProceduralParams.PullX, ProceduralParams.AngleThreshold, ProceduralParams.AngleAfterBlock, ProceduralParams.CameraHeight)
  end
  self.TalkPawn:K2_SetActorTransform(UE4.UKismetMathLibrary.MakeTransform(Loc, Rot, FVector(1)), false, nil, false)
  self:AdaptCameraComponent(self.TalkPawn.Camera)
  return self.TalkPawn
end

function M:SwitchToTalkPawn()
  self.Mode = "TalkPawn"
  if IsValid(self.AIControllerForPlayer) then
    self.AIControllerForPlayer:K2_DestroyActor()
    self.AIControllerForPlayer = nil
  end
  local GameInstance = GWorld.GameInstance
  local TalkContext = GameInstance:GetTalkContext()
  self.AIControllerForPlayer = TalkContext:GetWorld():SpawnActor(ATalkAIController:StaticClass(), UE4.UKismetMathLibrary.MakeTransform(UE4.FVector(), UE4.FRotator(), UE4.FVector(1, 1, 1)))
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  self.TalkPawn:SetEnableChangeView(true)
  PlayerController:SetLastPawn(Player)
  PlayerController:Possess(self.TalkPawn)
  self.AIControllerForPlayer:Possess(Player)
  local FC = Player:GetComponentByClass(UFashionComponent)
  if FC then
    FC:ForceEnableDitherAlphaByTalk(true)
  end
  self.TalkPawn:EnableInput(PlayerController)
end

function M:SwitchToPlayer()
  self.Mode = "Player"
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  self.TalkPawn:SetEnableChangeView(false)
  local Rot = PlayerController:GetControlRotation()
  self.AIControllerForPlayer.bSetControlRotationFromPawnOrientation = false
  if self.AIControllerForPlayer then
    self.AIControllerForPlayer:UnPossess(Player)
  end
  self.TalkPawn:DisableInput(PlayerController)
  PlayerController:Possess(Player)
  if self.AIControllerForPlayer then
    self.AIControllerForPlayer:Possess(self.TalkPawn)
  end
  self.AIControllerForPlayer:SetControlRotation(Rot)
end

function M:BlendCamera(TargetCamera, BlendTime, Callback)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  USequenceFunctionLibrary.SetViewTargetWithBlend(PlayerController, TargetCamera, BlendTime, UE4.EViewTargetBlendFunction.VTBlend_EaseInOut, 2)
  if BlendTime > 0 then
    self:AddTimer(BlendTime, Callback)
  else
    Callback()
  end
end

function M:BlendInCamera(BlendTime, Callback)
  local GameInstance = GWorld.GameInstance
  local TalkContext = GameInstance:GetTalkContext()
  local Camera = self:CreateTalkPawn(true, true, 1, TalkContext.InteractiveActor)
  
  local function OverrideCallback()
    self:SwitchToTalkPawn()
    Callback()
  end
  
  self:BlendCamera(Camera, BlendTime, OverrideCallback)
end

function M:BlendOutToTalk(BlendTime, Callback)
  self:SwitchToPlayer()
  self:BlendCamera(self.TalkPawn, BlendTime, Callback)
end

function M:BlendOutCamera(BlendTime, Callback)
  local TargetCamera = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  local Rot = PlayerController:GetControlRotation()
  self.AIControllerForPlayer.bSetControlRotationFromPawnOrientation = false
  self.AIControllerForPlayer:SetControlRotation(Rot)
  
  local function OverideCallback()
    local Rot = self.AIControllerForPlayer:GetControlRotation()
    self:SwitchToPlayer()
    PlayerController:SetControlRotation(Rot)
    Callback()
  end
  
  self:BlendCamera(TargetCamera, BlendTime, OverideCallback)
end

function M:ClearController()
  if self.Mode ~= "Player" then
    self:SwitchToPlayer()
  end
end

return M
