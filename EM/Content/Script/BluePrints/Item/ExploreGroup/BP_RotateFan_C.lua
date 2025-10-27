require("UnLua")
local M = Class({
  "BluePrints.Item.ExploreGroup.BP_DongGuoBreakableItem_C",
  "BluePrints.Common.TimerMgr"
})

function M:ReceiveBeginPlay()
  self.Super.ReceiveBeginPlay(self)
  self.PlayerInRight = true
  if self.RotateDirection then
    self.RotateSpeed = -self.RotateSpeed
    self.RelativeActorRot = UE4.FRotator(0, self.RelativeActorSpeed, 0)
  else
    self.RelativeActorRot = UE4.FRotator(0, -self.RelativeActorSpeed, 0)
  end
  self.RotateFactor = -1
  self.Reverse = false
  self.IsChangeDir = false
  self.ActorReverse = 1
  if self.RelativeActorReverse then
    self.ActorReverse = -1
  end
  self.InitRotate = self.Mesh:K2_GetComponentRotation():ToQuat()
end

function M:ReceiveTick(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
  if self.IsInReturn then
    self:RotateComponent(DeltaSeconds, self.ReturnSpeed, self.InitRotate, self.Mesh)
    return
  end
  local CurrentLocation = self.Mesh:K2_GetComponentLocation()
  local CurrentRotation = self.Mesh:K2_GetComponentRotation():ToQuat()
  local RightVector = self.Mesh:GetRightVector()
  local AngleRad = math.rad(-self.RotateSpeed * DeltaSeconds * self.RotateFactor)
  local DeltaQuat = self:GetQuat_Lua(RightVector, AngleRad)
  local NewQuat = DeltaQuat * CurrentRotation
  local NewTransform = FTransform()
  NewTransform.Translation = CurrentLocation
  NewTransform.Rotation = NewQuat
  self.Mesh:K2_SetWorldTransform(NewTransform, false, nil, false)
  if self.RelativeActor ~= nil and self.RelativeActor.IsActive then
    self.RelativeActor:K2_AddActorWorldRotation(self.RelativeActorRot * self.ActorReverse * DeltaSeconds * self.RotateFactor, false, nil, false)
  end
end

function M:OnHit(SourceId)
  local Player = Battle(self):GetEntity(SourceId)
  if Player and Player.IsPlayer and Player:IsPlayer() and not Player:IsDead() then
    local RightVector = -self:GetActorForwardVector()
    local DirectionVector = Player:K2_GetActorLocation() - self.Mesh:K2_GetComponentLocation()
    DirectionVector:Normalize()
    local Dot = UE4.UKismetMathLibrary.Dot_VectorVector(RightVector, DirectionVector)
    if Dot > 0 then
      if -1 == self.RotateFactor then
        self.IsChangeDir = true
      else
        self.IsChangeDir = false
      end
      self.RotateFactor = 1
      self.Reverse = false
    else
      if 1 == self.RotateFactor then
        self.IsChangeDir = true
      else
        self.IsChangeDir = false
      end
      self.RotateFactor = -1
      self.Reverse = true
    end
    if self.RelativeActor ~= nil and self.RelativeActor.CheckAngle and self.RelativeActor:CheckAngle(self.RotateFactor) then
      self:SetActorTickEnabled(true)
      
      local function DisableTick()
        if not self.IsInReturn then
          self:SetActorTickEnabled(false)
        end
      end
      
      self:AddTimer(self.WaitToPauseTime, DisableTick, false, 0, "DisableTick")
    else
      if not self.GameMode then
        self.GameMode = UE4.UGameplayStatics.GetGameMode(self)
      end
      if self.GameMode then
        local Avatar = GWorld:GetAvatar()
        if not Avatar or not self.GameMode:IsInRegion() then
          return
        end
        if not self.SubRegionId then
          self.SubRegionId = Avatar:GetSubRegionId2RegionId(Avatar.CurrentRegionId)
        end
        if not self.StateRecorder then
          self.StateRecorder = self.GameMode:LevelSequenceState_GetStateRecorder(self.SubRegionId)
        end
        if not self.StateRecorder then
          return
        end
        if self.StateRecorder:GetSequenceState(self.SequenceId, 1) == ELevelSequenceRuntimeState.EComplete and not self.IsChangeDir then
          return
        end
        if self.StateRecorder:GetSequenceState(self.SequenceId, 1) == ELevelSequenceRuntimeState.EDefault and self.Reverse then
          return
        end
        self:PlaySequence()
        self:SetActorTickEnabled(true)
        
        local function DisableTick()
          self:PauseSequence()
          self:SetActorTickEnabled(false)
        end
        
        self:AddTimer(self.WaitToPauseTime, DisableTick, false, 0, "DisableTick")
      end
    end
  end
end

function M:PlaySequence()
  if self.StateRecorder and self.GameMode then
    self.GameMode:LevelSequenceState_PlaySequence(self.SubRegionId, self.SequenceId, 1, self.Reverse)
  end
end

function M:PauseSequence()
  if self.StateRecorder and self.GameMode then
    self.GameMode:LevelSequenceState_PauseSequence(self.SubRegionId, self.SequenceId, 1)
  end
end

function M:ActiveCombat()
  self.Super.ActiveCombat(self)
  self.IsInReturn = false
end

function M:OnEnterState(NowStateId)
  self.Overridden.OnEnterState(self, NowStateId)
  if NowStateId == self.InReturnStateId then
    self.IsInReturn = true
    self.CurRotate = self.Mesh:K2_GetComponentRotation()
    self:SetActorTickEnabled(true)
  elseif NowStateId == self.NormalStateId then
    self.IsInReturn = false
    self:SetActorTickEnabled(false)
  else
    self:SetActorTickEnabled(false)
    self.IsInReturn = false
  end
end

return M
