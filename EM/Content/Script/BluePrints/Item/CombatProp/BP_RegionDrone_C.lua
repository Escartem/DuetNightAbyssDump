require("UnLua")
local M = Class({
  "BluePrints/Item/Temple/BP_Drone_C"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.ChestInteractiveComponent:InitInteractiveComponent(self.Data.InteractiveId)
end

function M:CheckAllGroupDroneReset()
  local GroupDroneAllFinish = false
  if self.BpBorn then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    if GameState then
      GroupDroneAllFinish = GameState:OnDroneChangeToInit(self.GroupId, self.ManualItemId)
    end
  else
    GroupDroneAllFinish = true
  end
  if GroupDroneAllFinish then
    DebugPrint("zwkk CheckAllGroupDroneReset")
    self:OnDroneStateChange(0)
    self:SetActorTickEnabled(false)
    self.OtherFound = false
  end
end

function M:OnBreakCountDown(SourceEid)
end

function M:AddDrone()
  if self.BpBorn then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    if GameState then
      GameState:AddDrone(self.GroupId, self.ManualItemId)
    end
  end
end

function M:GetCanOpen()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local CapsuleHalfHeight = Player.CapsuleComponent:GetScaledCapsuleHalfHeight()
  local EndPositionHead = UKismetMathLibrary.TransformLocation(Player:GetTransform(), (FVector(0, 0, CapsuleHalfHeight * self.HeadRate)))
  local EndPositionFoot = UKismetMathLibrary.TransformLocation(Player:GetTransform(), (FVector(0, 0, -CapsuleHalfHeight * self.FootRate)))
  local EyeLcoation = self.Eye:K2_GetComponentLocation()
  local HitResultHead = FHitResult()
  local bHitHead = UE4.UKismetSystemLibrary.LineTraceSingle(self, EyeLcoation, EndPositionHead, ETraceTypeQuery.TraceScene, false, nil, 0, HitResultHead, true)
  local HitResultFoot = FHitResult()
  local bHitFoot = UE4.UKismetSystemLibrary.LineTraceSingle(self, EyeLcoation, EndPositionFoot, ETraceTypeQuery.TraceScene, false, nil, 0, HitResultFoot, true)
  if not bHitHead or not bHitFoot then
    self.CanOpen = true
  else
    self.CanOpen = false
  end
end

function M:OnFound()
  self:OnDroneStateChange(1)
  if self.BpBorn then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    if GameState then
      GameState:AddGuideEid(self.Eid)
      GameState:OnDroneFoundPlayer(self.GroupId, self.ManualItemId)
    end
  else
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    if GameState then
      GameState:AddGuideEid(self.Eid)
    end
  end
  self:ChangeState("Manual", 0, self.FoundPlayerStateId)
end

function M:OnAlarm()
  self:ChangeState("Manual", 0, self.MaxAlertStateId)
end

function M:OnAlertValueReset()
  if self.BpBorn then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    if GameState then
      GameState:RemoveGuideEid(self.Eid)
      GameState:OnDroneAlertValueReset(self.GroupId, self.ManualItemId)
    end
  else
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    if GameState then
      GameState:RemoveGuideEid(self.Eid)
    end
    self.OtherFound = false
    self.RotateFinish = false
    self:OnDroneStateChange(0)
  end
  self:ChangeState("Manual", 0, self.NormalStateId)
end

function M:ReceiveEndPlay()
  M.Super.ReceiveEndPlay(self)
end

return M
