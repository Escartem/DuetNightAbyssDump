local BP_ElectricGrid_C = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function BP_ElectricGrid_C:CommonInitInfo(Info)
  BP_ElectricGrid_C.Super.CommonInitInfo(self, Info)
  self:TrySetVariable()
  self.AttackCD = self.UnitParams.AttackCD
  self.DefaultLocation = FVector(0, 0, 0)
  self.DefaultForward = FVector(0, 0, 0)
  if self.RotateSpeed > 0 and self.CenterActor and self.MotionType == EElectricGridMotionType.RotateWithOther then
    self.CenterComponent = nil
    if self.CenterActor == self then
      self.RotateBySelf = true
      self.CenterComponent = self.RotateCenter
      self.DefaultLocation = self.CenterComponent:K2_GetComponentLocation()
      self.DefaultForward = self.CenterComponent:GetForwardVector()
    else
      self.RotateBySelf = false
      self.CenterComponent = self.CenterActor:K2_GetRootComponent()
    end
  elseif self.RotateSpeed > 0 and self.MotionType == EElectricGridMotionType.RotateSelf then
    self.DefaultForward = self.Arrow1:GetForwardVector()
  end
end

function BP_ElectricGrid_C:OnActorReady(Info)
  BP_ElectricGrid_C.Super.OnActorReady(self, Info)
  if 0 ~= self.CurrentTypeStateId and IsAuthority(self) then
    self:ChangeState("Manual", 0, self.CurrentTypeStateId)
  end
end

function BP_ElectricGrid_C:ReceiveTick(DeltaSeconds)
  if not self.IsActive then
    return
  end
  if not self.HitedArray then
    return
  end
  self:UpdateHitedArray(DeltaSeconds)
  if self.CanMoveAndRotate and self.TimeLength > 0 and (self.MotionType == EElectricGridMotionType.MoveTurnBack or self.MotionType == EElectricGridMotionType.MoveOrder) then
    self:MoveWithSpline(DeltaSeconds)
  elseif self.CanMoveAndRotate and self.RotateSpeed > 0 and self.MotionType == EElectricGridMotionType.RotateSelf then
    self:RotateSelf(DeltaSeconds, self.DefaultForward)
  elseif self.CanMoveAndRotate and self.RotateSpeed > 0 and self.MotionType == EElectricGridMotionType.RotateWithOther then
    self:RotateWithOtherActor(DeltaSeconds, self.CenterComponent, self.RotateBySelf, self.DefaultLocation)
  end
end

function BP_ElectricGrid_C:TrySetVariable()
  if not self.Start then
    self.Start = {}
    self.End = {}
    self.Rays = {}
    self.Lasers = {}
    self.HitedArray = {}
    self:GetComponents()
  end
end

function BP_ElectricGrid_C:GetComponents()
  local Components = self:K2_GetComponentsByClass(UE.USceneComponent)
  if Components then
    for _, Component in pairs(Components) do
      local Name = Component:GetName()
      if string.find(Name, "BP_ElectricGridComponent") then
        self.Start[Name] = Component
      elseif string.find(Name, "EndMesh") then
        self.End[Name] = Component
      elseif string.find(Name, "LaserRay") then
        self.Rays[Name] = Component
      end
    end
    self:SetNiagara(self.Rays)
  end
end

function BP_ElectricGrid_C:UpdateHitedArray(DeltaSeconds)
  for i, v in pairs(self.HitedArray) do
    for Id, Value in pairs(v) do
      self.HitedArray[i][Id] = Value + DeltaSeconds
      if self.HitedArray[i][Id] >= self.AttackCD then
        self.HitedArray[i][Id] = nil
      end
    end
  end
end

function BP_ElectricGrid_C:LaunchLaser()
  if self.IsActive then
    return
  end
  for i, v in pairs(self.Start) do
    local Start, End = string.find(i, "%d+", 1)
    local Idx = tonumber(string.sub(i, Start, End))
    local LaserInfo = FLaserInfo()
    if self.End["EndMesh" .. Idx] then
      local Start = v:K2_getComponentLocation()
      local End = self.End["EndMesh" .. Idx]:K2_getComponentLocation()
      local Length = (End - Start):Size()
      LaserInfo.LaserLength = Length < self.MaxLength and Length or self.MaxLength
    else
      LaserInfo.LaserLength = self.MaxLength
    end
    LaserInfo.Interval = self.AttackCD
    LaserInfo.LastTime = -1
    LaserInfo.SocketName = "LaserPoint"
    LaserInfo.Debug = false
    LaserInfo.Radiu = self.LaserRadius
    if self.Rays["LaserRay" .. Idx] then
      local LaserPort = Battle(self):CreateLaser(v, self.Rays["LaserRay" .. Idx], LaserInfo)
      if not self.HitedArray[LaserPort] then
        self.HitedArray[LaserPort] = {}
      end
      LaserPort.OnHitTarget:Add(self, self.OnHitTarget)
      table.insert(self.Lasers, LaserPort)
      self.Rays["LaserRay" .. Idx]:SetActive(true, false)
    end
  end
end

function BP_ElectricGrid_C:DeActiveLaser()
  if not self.IsActive or not self.Rays then
    return
  end
  for i, v in pairs(self.Rays) do
    v:SetActive(false, false)
  end
  if self.Lasers and #self.Lasers > 0 then
    for i, v in pairs(self.Lasers) do
      Battle(self):RemoveLaserPort(v.UniqueId)
    end
  end
  self.Lasers = {}
end

function BP_ElectricGrid_C:OnHitTarget(Port, HitResult)
  if HitResult.Actor and HitResult.Actor:IsDead() ~= true and not self.HitedArray[Port][HitResult.Actor.Eid] then
    self.HitedArray[Port][HitResult.Actor.Eid] = 0
    self:PlaySound("event:/sfx/common/scene/laser_hit")
    self.Super.PropAttack(self, HitResult.Actor)
  end
end

function BP_ElectricGrid_C:MoveWithSpline(DeltaSeconds)
  self.Progress = self.Progress + self.Direction * DeltaSeconds
  if self.Progress >= self.TimeLength then
    if self.MotionType == EElectricGridMotionType.MoveTurnBack then
      self.Direction = -1
    elseif self.MotionType == EElectricGridMotionType.MoveOrder then
      self.Progress = 0
    end
  elseif self.Progress <= 0 then
    self.Direction = 1
  else
    local Power = UKismetMathLibrary.MultiplyMultiply_FloatFloat(self.TimeLength, -1.0)
    local Location = self.Spline:GetLocationAtDistanceAlongSpline(Power * self.Progress * self.Spline:GetSplineLength(), ESplineCoordinateSpace.World)
    self.Components:K2_SetWorldLocation(Location, false, nil, false)
    self.Box:K2_SetWorldLocation(Location, false, nil, false)
  end
end

function BP_ElectricGrid_C:OnEnterState(NowStateId)
  self.Overridden.OnEnterState(self, NowStateId)
  DebugPrint("zwk ElectricGrid OnEnterState", self:GetName(), NowStateId)
  self:TrySetVariable()
  if NowStateId == self.InitStateId then
    self.CanMoveAndRotate = false
    self.Box:SetCollisionEnabled(ECollisionEnabled.NoCollision)
    self.HitedArray = {}
    self:DeActiveLaser()
  elseif NowStateId == self.NormalStateId then
    self.CanMoveAndRotate = false
    self.Box:SetCollisionEnabled(ECollisionEnabled.QueryAndPhysics)
    self:LaunchLaser()
  elseif NowStateId == self.MotionStateId then
    self.CanMoveAndRotate = true
    self.Box:SetCollisionEnabled(ECollisionEnabled.QueryAndPhysics)
    self:LaunchLaser()
  end
end

return BP_ElectricGrid_C
