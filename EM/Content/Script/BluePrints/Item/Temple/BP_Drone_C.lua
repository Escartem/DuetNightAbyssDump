require("UnLua")
local M = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function M:AuthorityInitInfo(Info)
  M.Super.AuthorityInitInfo(self, Info)
  self:AddDrone()
end

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  DebugPrint("zwjkjk CommonInitInfo \229\136\157\229\167\139\231\138\182\230\128\129", self.StateId, self:GetName())
  self.AlertValue = 0.0
  self.MaxAlertValue = 100.0
  self.OverlappingPlayer = nil
  self.FoundPlayer = false
  self.MaxDistance = UE4.UKismetMathLibrary.Vector_Distance(self.Eye:K2_GetComponentLocation(), self.MaxPoint:K2_GetComponentLocation())
  self.InitLoc = self:K2_GetActorLocation()
  self.InitRot = self:K2_GetActorRotation()
  self.InitMeshTrans = self.Mesh:GetRelativeTransform()
  self.RotateFinish = true
  self.InitMeshRelativeRotation = FRotator(0, 0, 0)
  self.PlayerDetected = false
  self.AlertValueToMax = false
  self.OtherFound = false
  if self.bAutoActive then
    self:ActiveCombat()
  end
end

function M:ResetInfo()
  self.Overridden.ResetInfo(self)
  self:K2_SetActorLocation(self.InitLoc, false, nil, false)
  self:K2_SetActorRotation(self.InitRot, false, nil, false)
  self.Mesh:K2_SetRelativeTransform(self.InitMeshTrans, false, nil, false)
  self:RemoveTimer("TryFindPlayer")
  self.AlertValue = 0.0
  self.OverlappingPlayer = nil
  self.FoundPlayer = false
  self.RotateFinish = true
  self:SetActorHiddenInGame(false)
  self:SetActorEnableCollision(true)
  self:InactiveCombat()
  self.PlayerDetected = false
  self.AlertValueToMax = false
  self.OtherFound = false
  self:SetActorTickEnabled(false)
  self:OnDroneAlarmChange(0)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    GameState:RemoveGuideEid(self.Eid)
  end
  if self.bAutoActive then
    self:ActiveCombat()
  end
end

function M:OnPlayerIn(Player)
  self.PlayerInOverlap = true
  self.OverlappingPlayer = Player
  self:AddTimer(0.1, self.TryFindPlayer, true, -0.1, "TryFindPlayer", false, Player)
end

function M:OnPlayerOut()
  self.OverlappingPlayer = nil
  self.FoundPlayer = false
  self.PlayerDetected = false
  self.RotateFinish = false
  self:RemoveTimer("TryFindPlayer")
end

function M:TryFindPlayer(Player)
  if not self.IsActive then
    return
  end
  local CapsuleHalfHeight = Player.CapsuleComponent:GetScaledCapsuleHalfHeight()
  local EndPositionHead = UKismetMathLibrary.TransformLocation(Player:GetTransform(), (FVector(0, 0, CapsuleHalfHeight * self.HeadRate)))
  local EndPositionFoot = UKismetMathLibrary.TransformLocation(Player:GetTransform(), (FVector(0, 0, -CapsuleHalfHeight * self.FootRate)))
  local EyeLcoation = self.Eye:K2_GetComponentLocation()
  local HitResultHead = FHitResult()
  local bHitHead = UE4.UKismetSystemLibrary.LineTraceSingle(self, EyeLcoation, EndPositionHead, ETraceTypeQuery.TraceScene, false, nil, 0, HitResultHead, true)
  local HitResultFoot = FHitResult()
  local bHitFoot = UE4.UKismetSystemLibrary.LineTraceSingle(self, EyeLcoation, EndPositionFoot, ETraceTypeQuery.TraceScene, false, nil, 0, HitResultFoot, true)
  if not bHitHead or not bHitFoot then
    self.FoundPlayer = true
    self.RotateFinish = false
    self.OtherFound = false
    self:SetActorTickEnabled(true)
    if not self.PlayerDetected then
      self.PlayerDetected = true
      self:OnFound()
      self:OnDroneAlarmChange(1)
    end
  else
    self.FoundPlayer = false
    self.PlayerDetected = false
  end
end

function M:ReceiveTick(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
  if not self.IsActive then
    return
  end
  if not self.FoundPlayer or not self.OverlappingPlayer then
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    local Distance = UE4.UKismetMathLibrary.Vector_Distance(self.Mesh:K2_GetComponentLocation(), Player:K2_GetActorLocation())
    if Distance <= self.SeekDistance and (self.AlertValue > 0 or self.OtherFound) then
      self:RotateToAim(DeltaSeconds, Player)
    elseif not self.RotateFinish then
      self:RotateToInit(DeltaSeconds)
    end
    if self.AlertValue > 0 then
      self:ReduceAlertValue(DeltaSeconds)
      self.AlertValueToMax = false
    end
    return
  end
  local EyeLocation = self.Eye:K2_GetComponentLocation()
  EyeLocation.Z = 0
  local PlayerLocation = self.OverlappingPlayer:K2_GetActorLocation()
  PlayerLocation.Z = 0
  local Distance = UE4.UKismetMathLibrary.Vector_Distance(EyeLocation, PlayerLocation)
  self:UpdateAlertValue(Distance, DeltaSeconds)
  if not self.RotateFinish and self.OverlappingPlayer then
    self:RotateToAim(DeltaSeconds)
  end
end

function M:RotateToAim(DeltaSeconds, Player)
  local SelfLocation = self:K2_GetActorLocation()
  local PlayerLocation
  if nil ~= Player then
    PlayerLocation = Player:K2_GetActorLocation()
  else
    PlayerLocation = self.OverlappingPlayer:K2_GetActorLocation()
  end
  local Direction = PlayerLocation - SelfLocation
  Direction.Z = 0
  Direction:Normalize()
  local Rotation = UKismetMathLibrary.MakeRotFromX(Direction)
  self:RotateComponent(DeltaSeconds, self.RotateSpeed, Rotation:ToQuat(), self.Mesh)
  if self:CheckComponentTarget(Rotation:ToQuat(), self.Mesh) then
    self.RotateFinish = true
  end
end

function M:RotateToInit(DeltaSeconds)
  self:RotateComponentRelative(DeltaSeconds, self.RotateSpeed, self.InitMeshRelativeRotation:ToQuat(), self.Mesh)
  if self:CheckComponentTargetRelative(self.InitMeshRelativeRotation:ToQuat(), self.Mesh) then
    self.RotateFinish = true
    if self.AlertValue <= 0 then
      self:CheckAllGroupDroneReset()
    end
  end
end

function M:OnOtherDroneFoundPlayer()
  self:OnGroupDroneFoundPlayer()
  self.OtherFound = true
  self.RotateFinish = false
  self:SetActorTickEnabled(true)
end

function M:OnAllGroupDroneAlertZero()
  self.OtherFound = false
  self.RotateFinish = false
  self:SetActorTickEnabled(true)
end

function M:ActiveCombat(bFromGameMode)
  self.IsActive = true
end

function M:InactiveCombat(bFromGameMode)
  self.IsActive = false
  self:RemoveTimer("TryFindPlayer")
end

function M:UpdateAlertValue(Distance, DeltaSeconds)
  local DetectedTime
  if Distance <= self.MinDistance then
    DetectedTime = self.DetectedTimeMin
  elseif Distance >= self.MaxDistance then
    DetectedTime = self.DetectedTimeMax
  else
    local t = (Distance - self.MinDistance) / (self.MaxDistance - self.MinDistance)
    DetectedTime = self.DetectedTimeMin + t * (self.DetectedTimeMax - self.DetectedTimeMin)
  end
  local AlertIncrement = 100 / DetectedTime * DeltaSeconds
  self.AlertValue = math.min(100, self.AlertValue + AlertIncrement)
  if not self.AlertValueToMax and self.AlertValue >= 100 then
    self.AlertValueToMax = true
    self:OnAlarm()
    self:OnDroneAlarmChange(2)
  end
end

function M:ReduceAlertValue(DeltaSeconds)
  self.AlertValue = math.max(0, self.AlertValue - self.DetectedTimeReduceRate * DeltaSeconds)
  if self.AlertValue <= 0 then
    self:OnDroneAlarmChange(0)
    self:OnAlertValueReset()
    if self.RotateFinish then
      self:CheckAllGroupDroneReset()
    end
  end
end

function M:CheckAllGroupDroneReset()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local GroupDroneAllFinish = GameMode:GetDungeonComponent():OnDroneChangeToInit(self.GroupId, self.ManualItemId)
  if GroupDroneAllFinish then
    self:OnDroneStateChange(0)
    self:SetActorTickEnabled(false)
    self.OtherFound = false
  end
end

function M:OnBreakCountDown(SourceEid)
  self:SetActorEnableCollision(false)
  self:SetActorTickEnabled(false)
  self.AlertValueToMax = false
  self.AlertValue = 0
  self.RotateFinish = true
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    GameState:RemoveGuideEid(self.Eid)
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:TriggerGameModeEvent("OnDroneDestoryed", self.ManualItemId)
  GameMode:GetDungeonComponent():OnDroneAlertValueReset(self.GroupId, self.ManualItemId)
  self.IsActive = false
  self:OnDroneDestoryed()
end

function M:AddDrone()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:GetDungeonComponent():AddDrone(self.GroupId, self.ManualItemId)
end

function M:OnFound()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:GetDungeonComponent():OnDroneFoundPlayer(self.GroupId, self.ManualItemId)
  self:OnDroneStateChange(1)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    GameState:AddGuideEid(self.Eid)
  end
end

function M:OnAlarm()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:TriggerGameModeEvent("OnDroneAlarm", self.ManualItemId)
end

function M:OnAlertValueReset()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    GameState:RemoveGuideEid(self.Eid)
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:GetDungeonComponent():OnDroneAlertValueReset(self.GroupId, self.ManualItemId)
end

function M:ReceiveEndPlay()
  M.Super.ReceiveEndPlay(self)
end

return M
