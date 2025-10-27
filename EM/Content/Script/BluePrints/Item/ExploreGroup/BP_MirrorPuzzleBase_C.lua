require("UnLua")
local M = Class("BluePrints.Item.Chest.BP_MechanismBase_C")

function M:AuthorityInitInfo(Info)
  M.Super.AuthorityInitInfo(self, Info)
  self.RayMaxLength = self.UnitParams.RayMaxLength or 500
  self.RayFixAngle = self.UnitParams.RayFixAngle or 10
  self.RayConnectTime = self.UnitParams.RayConnectTime or 5
  self.RayDisSuration = self.UnitParams.RayDisSuration or 10
  self.RayMinLength = self.UnitParams.RayMinLength or 300
  self.IsEnd = false
end

function M:UpdateNormalDirect()
  self.NormalDirect = UKismetMathLibrary.GreaterGreater_VectorRotator(FVector(0, 0, 1), self.Mirror.RelativeRotation)
  self.WorldNormalDirect = UKismetMathLibrary.GreaterGreater_VectorRotator(FVector(0, 0, 1), self.Mirror:K2_GetComponentRotation())
end

function M:OpenMechanism(PlayerId)
  if 0 ~= self.Type then
    return
  end
  self.LineSource = self
  self:LineTrace()
end

function M:LineTrace()
  self:UpdateNormalDirect()
  local Start = self.LineStart or self.Mirror:K2_GetComponentLocation()
  self.LineStart = Start
  local End = self:GetLineTraceEnd()
  local HitResult = FHitResult()
  local Color = UE4.FLinearColor(1, 0, 0, 1)
  local ActorsToIgnore = TArray(AActor)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  ActorsToIgnore:Add(self)
  ActorsToIgnore:Add(PlayerCharacter)
  local TraceObjectTypes = TArray(EObjectTypeQuery)
  TraceObjectTypes:Add(EObjectTypeQuery.WorldStatic)
  local bHit = UE4.UKismetSystemLibrary.LineTraceSingleForObjects(self, Start, End, TraceObjectTypes, false, ActorsToIgnore, 0, HitResult, false, Color, nil, 3)
  if 0 == self.Type then
    self.LineSource.PathPointArray:Add(self.LineStart)
    self.LineSource.MirrorArray:Add(self)
  end
  if bHit and HitResult.Actor:Cast(UE4.ACombatItemBase) and HitResult.Actor:IsCombatItemBase() and HitResult.Component == HitResult.Actor.MirrorCollision then
    print(_G.LogTag, "LXZ LineTrace11", self:GetName(), HitResult.Actor:GetName(), HitResult.Component:GetName())
    if HitResult.Actor.OnLineHit then
      HitResult.Actor:OnLineHit(self, HitResult)
    end
  else
    self:OnLineNotHit()
  end
  if 0 == self.Type then
    self:OnPathCreate(self.IsEnd)
  end
end

function M:GetLineTraceEnd()
  if not self.LastMirror then
    local End = self.NormalDirect * self.RayMaxLength + self.Mirror.RelativeLocation
    End = UKismetMathLibrary.TransformLocation(self:GetTransform(), End)
    return End
  else
    local LastMirrorCenterRelative = -self.LastMirror.LineStart + self.LineStart
    LastMirrorCenterRelative = LastMirrorCenterRelative / LastMirrorCenterRelative:Size()
    local Tmp = 2 * UKismetMathLibrary.Dot_VectorVector(LastMirrorCenterRelative, self.WorldNormalDirect)
    local OutLine = LastMirrorCenterRelative - UKismetMathLibrary.Multiply_VectorFloat(self.WorldNormalDirect, Tmp)
    OutLine = OutLine / OutLine:Size()
    local End = OutLine * self.RayMaxLength + self.LineStart
    return End
  end
end

function M:OnLineHit(LastMirror, HitResult)
  if self.LastMirror == LastMirror then
    return
  end
  if 0 ~= self.Type then
    self:OnLineReceived()
  end
  if 1 == self.Type then
    self.LastMirror = LastMirror
    self.LineSource = LastMirror.LineSource
    self.LineStart = FVector(HitResult.Location.X, HitResult.Location.Y, HitResult.Location.Z)
    self.LineSource.PathPointArray:Add(self.LineStart)
    self.LineSource.MirrorArray:Add(self)
    if self:CheckLastMirrorValid() then
      self:LineTrace()
    else
      self:OnLineNotHit()
    end
  elseif 2 == self.Type then
    self.LastMirror = LastMirror
    self.LineSource = LastMirror.LineSource
    self.LineSource.PathPointArray:Add(HitResult.Location)
    self.LineSource.MirrorArray:Add(self)
    self.LineSource.IsEnd = true
  end
end

function M:OnLineNotHit()
  if not self.LineSource then
    return
  end
  local Point = self:GetLineTraceEnd()
  self.LineSource.PathPointArray:Add(Point)
end

function M:CheckLastMirrorValid()
  local InDirect = self.LastMirror.Mirror:K2_GetComponentLocation() - self.Mirror:K2_GetComponentLocation()
  InDirect = InDirect / InDirect:Size()
  local Cos = UKismetMathLibrary.Dot_VectorVector(self.WorldNormalDirect, InDirect)
  local Degree = UKismetMathLibrary.DegAcos(Cos)
  return Degree <= 90
end

function M:Reset()
  self.Overridden.Reset(self)
  self.LastMirror = nil
  self.LineSource = nil
  self.LineStart = nil
  if 0 == self.Type then
    self.IsEnd = false
    for i, v in pairs(self.MirrorArray) do
      if v ~= self then
        print(_G.LogTag, "LXZ Reset", v:GetName())
        v:Reset()
      end
    end
    self.PathPointArray:Clear()
    self.MirrorArray:Clear()
  end
end

return M
