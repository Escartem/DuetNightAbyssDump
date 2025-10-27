require("UnLua")
local M = Class("BluePrints/Item/MiniGame/BP_OpenUIMechanism_C")

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.UIName = "AnglingMain"
  if not self.BpBorn then
    self.FishingSpotId = self.UnitParams.FishingSpotId
  end
  self.FishingSpotName = DataMgr.FishingSpot[self.FishingSpotId].FishingSpotName
  self.ExtraInfo.FishingSpotId = self.FishingSpotId
  self.ExtraInfo.FishingSpot = self
end

function M:SetCamera(Name)
  self:UpdateCameraInfo()
  local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local InfoName = "CameraInfo_" .. Name
  local CameraName = "Camera_" .. Name
  local Transform = self[InfoName].Trans
  local Time = self[InfoName].Time
  local Exp = self[InfoName].Exp
  if not IsValid(self[CameraName]) then
    self[CameraName] = self:GetWorld():SpawnActor(ACineCameraActor:StaticClass(), Transform)
    self[CameraName].CameraComponent:SetConstraintAspectRatio(self[InfoName].ConstraintAspectRadio)
    self[CameraName].CurrentAperture = self[InfoName].CurrentAperture
    self[CameraName].CurrentFocalLength = self[InfoName].FocalLength
    self[CameraName].CameraComponent:SetAspectRatio(1.7777)
    self[CameraName].CameraComponent:SetFieldOfView(90)
  end
  local PlayerCameraComp = UE4.UGameplayStatics.GetPlayerCharacter(self, 0).CharCameraComponent
  Controller:SetViewTargetWithBlend(self[CameraName], Time, EViewTargetBlendFunction.VTBlend_EaseOut, Exp)
  AudioManager(self):PlayUISound(self, "event:/ui/common/whoosh_cam_move_long", nil, nil)
end

function M:OpenUI(PlayerId, NextStateId)
  local Player = Battle(self):GetEntity(PlayerId)
  Player:SetInvincible(true, "Fishing")
  Player:SetSuperArmor(true, "Fishing")
  Player:SetStealth(true, "Fishing")
  local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.Camera:SetAspectRatio(Player.CharCameraComponent.AspectRatio)
  self.Camera:SetFieldOfView(Player.CharCameraComponent.FieldOfView)
  self:SetCamera("Main")
  self.CacheControllerPausedParam = Controller.bShouldPerformFullTickWhenPaused
  Controller.bShouldPerformFullTickWhenPaused = true
  Player.CharSpringArmComponent:SetTickableWhenPaused(true)
  for i, Weapon in pairs(Player.Weapons) do
    Weapon:SetActorHideTag("Fishing", true, false, false)
  end
  local EnterPointLoc = self.PlayerPoint:K2_GetComponentLocation()
  local RealZ = EnterPointLoc.Z + Player.CapsuleComponent.CapsuleHalfHeight + Player:GetFloorInfo().FloorDist
  local Loc = FVector(EnterPointLoc.X, EnterPointLoc.Y, RealZ)
  local Rot = self.PlayerPoint:K2_GetComponentRotation()
  Player:DisableInput(Controller)
  local handle = UE4.ULTweenBPLibrary.Vector3To(self, {
    self,
    function(_, value)
      Player.MoveInput = FVector(0, 0, 0)
      Player.MoveInputCache = FVector(0, 0, 0)
      Player:K2_SetActorLocationAndRotation(value, Rot, false, nil, false)
    end
  }, Player:K2_GetActorLocation(), Loc, 0.1, 0)
  handle:OnComplete({
    self,
    function()
      Player:K2_SetActorLocationAndRotation(Loc, Rot, false, nil, false)
      Player:GetMovementComponent():SetMovementMode(1)
      Player.CharSpringArmComponent.bArmCollision = false
      Player.CharSpringArmComponent.CameraProbeSize = 2
      Player:EnableInput(Controller)
      self:RealOpenUI(PlayerId, NextStateId)
    end
  })
  MissionIndicatorManager:TriggerAllIndicatorVisible(false)
end

function M:RealOpenUI(PlayerId, NextStateId)
  self.UINextStateId = NextStateId
  self:BroadcastOpenMechanism(PlayerId)
end

function M:CloseMechanism(PlayerId, IsSuccess)
  M.Super.CloseMechanism(self, PlayerId)
  local Player = Battle(self):GetEntity(PlayerId)
  Player:SetInvincible(false, "Fishing")
  Player:SetSuperArmor(false, "Fishing")
  self:AddTimer(1, function()
    Player:SetStealth(false, "Fishing")
  end)
  local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local PlayerRot = Player:K2_GetActorRotation().Yaw
  Controller:SetControlRotation(FRotator(0, PlayerRot, 0))
  Controller:SetViewTargetWithBlend(Player, 0, EViewTargetBlendFunction.VTBlend_EaseOut, 4)
  for i, Weapon in pairs(Player.Weapons) do
    Weapon:SetActorHideTag("Fishing", false, false, false)
  end
  if IsValid(self.Camera_Main) then
    self.Camera_Main:K2_DestroyActor()
  end
  if IsValid(self.Camera_Game) then
    self.Camera_Game:K2_DestroyActor()
  end
  MissionIndicatorManager:TriggerAllIndicatorVisible(true)
end

function M:CheckCanInteractive(Player)
  local TraceInfo = "From BP_FishingSopo_C:CheckCanInteractive"
  local ResBattle = Battle(self):CheckConditionNew(67, Player, nil, TraceInfo)
  if not ResBattle then
    self.ChestInteractiveComponent:InteractiveFailed()
    return false
  end
  local ResParent = M.Super.CheckCanInteractive(self, Player)
  local Res = ResParent
  local Avatar = GWorld:GetAvatar()
  local ConditionId = DataMgr.FishingSpot[self.FishingSpotId].ConditionId
  if Avatar and ConditionId then
    local ResCondition = ConditionUtils.CheckCondition(Avatar, ConditionId)
    Res = Res and ResCondition
  end
  return Res
end

function M:RetrieveCameraViewInfo(CameraInfo, Time, Exp)
  local AnchorTrans = self:GetTransform()
  local List = Split(CameraInfo, ",")
  local Loc = FVector(tonumber(List[1]), tonumber(List[2]), tonumber(List[3]))
  local Rot = FRotator(tonumber(List[5]), tonumber(List[6]), tonumber(List[4]))
  local LocTrans = UE4.UKismetMathLibrary.MakeTransform(Loc, Rot, FVector(1, 1, 1))
  local Table = {}
  Table.Trans = UE4.UKismetMathLibrary.ComposeTransforms(LocTrans, AnchorTrans)
  Table.FocalLength = tonumber(List[7])
  Table.FocusDis = tonumber(List[8])
  Table.ConstraintAspectRadio = "true" == List[9] and true or false
  Table.FocusMethod = List[10]
  Table.CurrentAperture = tonumber(List[11])
  Table.Time = Time
  Table.Exp = Exp
  return Table
end

function M:UpdateCameraInfo()
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  local BattleCharTag = DataMgr.BattleChar[Player.CurrentRoleId].BattleCharTag[1]
  local FishingCameraData = DataMgr.FishingCamera[self.FishingSpotId]
  FishingCameraData = FishingCameraData or DataMgr.FishingCamera[1]
  local CameraInfoMain = FishingCameraData[BattleCharTag].CameraInfoMain
  local CameraInfoGame = FishingCameraData[BattleCharTag].CameraInfoGame
  local CameraInfoSelect = FishingCameraData[BattleCharTag].CameraInfoSelect
  if not (CameraInfoMain and CameraInfoGame) or not CameraInfoSelect then
    GWorld.logger.error("\233\146\147\233\177\188\231\130\185" .. self.FishingSpotName .. "\231\188\186\229\176\145\233\149\156\229\164\180\230\149\176\230\141\174")
    return
  end
  local CameraInfoMainTrans = CameraInfoMain[1]
  local CameraInfoMainTime = CameraInfoMain[2] or 0.7
  local CameraInfoMainExp = CameraInfoMain[3] or 5
  self.CameraInfo_Main = self:RetrieveCameraViewInfo(CameraInfoMainTrans, CameraInfoMainTime, CameraInfoMainExp)
  local PlayerCameraComp = UE4.UGameplayStatics.GetPlayerCharacter(self, 0).CharCameraComponent
  if not IsValid(self.Camera_Main) then
    self.Camera_Main = self:GetWorld():SpawnActor(ACameraActor:StaticClass(), self.CameraInfo_Main.Trans)
    self.Camera_Main.CameraComponent:SetConstraintAspectRatio(self.CameraInfo_Main.ConstraintAspectRadio)
    self.Camera_Main.CameraComponent:SetAspectRatio(PlayerCameraComp.AspectRatio)
    self.Camera_Main.CameraComponent:SetFieldOfView(90)
  end
  local CameraInfoGameTrans = CameraInfoGame[1]
  local CameraInfoGameTime = CameraInfoGame[2] or 0.4
  local CameraInfoGameExp = CameraInfoGame[3] or 7
  self.CameraInfo_Game = self:RetrieveCameraViewInfo(CameraInfoGameTrans, CameraInfoGameTime, CameraInfoGameExp)
  if not IsValid(self.Camera_Game) then
    self.Camera_Game = self:GetWorld():SpawnActor(ACameraActor:StaticClass(), self.CameraInfo_Game.Trans)
    self.Camera_Game.CameraComponent:SetConstraintAspectRatio(self.CameraInfo_Game.ConstraintAspectRadio)
    self.Camera_Game.CameraComponent:SetAspectRatio(PlayerCameraComp.AspectRatio)
    self.Camera_Game.CameraComponent:SetFieldOfView(90)
  end
  local CameraInfoSelectTrans = CameraInfoSelect[1]
  local CameraInfoSelectTime = CameraInfoSelect[2] or 0.4
  local CameraInfoSelectExp = CameraInfoSelect[3] or 7
  self.CameraInfo_Select = self:RetrieveCameraViewInfo(CameraInfoSelectTrans, CameraInfoSelectTime, CameraInfoSelectExp)
  if not IsValid(self.Camera_Select) then
    self.Camera_Select = self:GetWorld():SpawnActor(ACameraActor:StaticClass(), self.CameraInfo_Select.Trans)
    self.Camera_Select.CameraComponent:SetConstraintAspectRatio(self.CameraInfo_Select.ConstraintAspectRadio)
    self.Camera_Select.CameraComponent:SetAspectRatio(PlayerCameraComp.AspectRatio)
    self.Camera_Select.CameraComponent:SetFieldOfView(90)
  end
end

function M:CheckMontageInteractive()
  return true
end

return M
