require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local BP_WindCreate_C = Class({
  "BluePrints.Item.BP_CombatItemBase_C",
  "BluePrints.Common.TimerMgr"
})

function BP_WindCreate_C:AuthorityInitInfo(Info)
  BP_WindCreate_C.Super.AuthorityInitInfo(self, Info)
  self:AddBuffOnBegin()
  self:NotifyFieldCover()
end

function BP_WindCreate_C:AddBuffOnBegin()
  local OutActors = self:GetTrapOverlapActors()
  for i = 1, OutActors:Length() do
    self:TargetEnter(nil, OutActors:GetRef(i))
  end
end

function BP_WindCreate_C:NotifyFieldCover()
  if IsStandAlone(self) or IsClient(self) or MiscUtils.IsSimulatedProxy(self) then
    local ObjectTypes = TArray(EObjectTypeQuery)
    ObjectTypes:Add(UE4.EObjectTypeQuery.WorldStatic)
    local OutActors = TArray(AActor)
    local IngorArray = TArray(AActor)
    OutActors = UE4.UKismetSystemLibrary.ComponentOverlapActors(self.TrapArea, self:GetTransform(), ObjectTypes)
    for i = 1, OutActors:Length() do
      local TargetActor = OutActors:GetRef(i)
      if self.IsCastFieldCover and self:IsCastFieldCover(TargetActor) then
        TargetActor:FieldCoverIsHitEnter(self)
      end
    end
  end
end

function BP_WindCreate_C:ReceiveBeginPlay()
  BP_WindCreate_C.Super.ReceiveBeginPlay(self)
  self.PrimaryActorTick.bCanEverTick = true
  self.PrimaryActorTick.TickInterval = 0.02
  self.TrapArea.OnComponentBeginOverlap:Add(self, self.TargetEnter)
  self.TrapArea.OnComponentEndOverlap:Add(self, self.TargetLeave)
  self.AllowPlayer = {}
  self.DeltaSeconds = 0.01
end

function BP_WindCreate_C:TargetEnter(OverlappedComponent, Target, OtherComp, OtherBodyIndex, bFromSweep, SweepResult)
  if self.IsCastFieldCover and self:IsCastFieldCover(Target) then
    Target:FieldCoverIsHitEnter(self)
    return
  end
  if not Target:Cast(UE4.ACharacterBase) or self.Grade <= 0 or not self.IsActive then
    return
  end
  local TargetActorSign = {}
  TargetActorSign.Target = Target
  self.AllowPlayer[Target.Eid] = TargetActorSign
  local Hit, Res = self:LineTraceCheck(Target)
  if Res and Hit.Actor.Eid ~= Target.Eid then
    self.AllowPlayer[Target.Eid].IsCover = true
    return
  end
  self:SetTargetActorLocation(Target)
end

function BP_WindCreate_C:TargetLeave(OverlappedComponent, Target, OtherComp, OtherBodyIndex, bFromSweep, SweepResult)
  if self.IsCastFieldCover and self:IsCastFieldCover(Target) then
    Target:FieldCoverIsHitLeave(self)
    return
  end
  if not Target:Cast(UE4.ACharacterBase) or not self.IsActive then
    return
  end
  self.AllowPlayer[Target.Eid] = nil
end

function BP_WindCreate_C:LineTraceCheck(TargetActor)
  if not IsValid(TargetActor) then
    return false
  end
  local EndPosition = TargetActor:K2_GetActorLocation()
  local ArrowLocation = self.Arrow:K2_GetComponentLocation() + self.Arrow:GetForwardVector()
  local Distance = UKismetMathLibrary.Vector_Distance(ArrowLocation, EndPosition)
  local Location = UKismetMathLibrary.Multiply_VectorFloat(self.Arrow:GetForwardVector(), Distance) * -1 + EndPosition
  local StartPosition = Location
  local ActorsToIgnore = UE4.TArray(AActor)
  local TraceColor = UE4.FLinearColor(256, 0, 0, 1)
  local HitColor = UE4.FLinearColor(0, 256, 0, 1)
  return UE4.UKismetSystemLibrary.LineTraceSingleByProfile(self, StartPosition, EndPosition, "SceneCollision", false, ActorsToIgnore, EDrawDebugTrace.None, nil, true, TraceColor, HitColor, 5)
end

function BP_WindCreate_C:GetTrapOverlapActors()
  local ObjectTypes = TArray(EObjectTypeQuery)
  ObjectTypes:Add(EObjectTypeQuery.Pawn)
  local OutActors = TArray(UE4.ACharacterBase)
  OutActors = UE4.UKismetSystemLibrary.ComponentOverlapActors(self.TrapArea, self:GetTransform(), ObjectTypes)
  return OutActors
end

function BP_WindCreate_C:SetTargetActorLocation(TargetActor)
  if TargetActor.IsCharacterInAir and TargetActor:IsCharacterInAir() then
    local TargetLocation = TargetActor:K2_GetActorLocation()
    local ForwardVector = self:GetActorForwardVector()
    local ForwardVectorNormal = UKismetMathLibrary.Normal(ForwardVector, 1.0E-4)
    local OffsetLocationDeltaSecond = UE4.UKismetMathLibrary.Multiply_VectorFloat(ForwardVectorNormal, self.DeltaSeconds)
    local OffsetLocation = UE4.UKismetMathLibrary.Multiply_VectorFloat(OffsetLocationDeltaSecond, self.Speed1) + UE4.UKismetMathLibrary.Multiply_VectorFloat(OffsetLocationDeltaSecond, self.Speed2)
    TargetActor:K2_AddActorWorldOffset(OffsetLocation, false, nil, false)
  else
    local TargetLocation = TargetActor:K2_GetActorLocation()
    local ForwardVector = self:GetActorForwardVector()
    local ForwardVectorNormal = UKismetMathLibrary.Normal(ForwardVector, 1.0E-4)
    local OffsetLocationDeltaSecond = UE4.UKismetMathLibrary.Multiply_VectorFloat(ForwardVectorNormal, self.DeltaSeconds)
    local OffsetLocation = UE4.UKismetMathLibrary.Multiply_VectorFloat(OffsetLocationDeltaSecond, self.Speed1)
    TargetActor:K2_AddActorWorldOffset(OffsetLocation, false, nil, false)
  end
end

function BP_WindCreate_C:ReceiveTick(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
  local SinginTable = {}
  if self.Grade <= 0 then
    self.PrimaryActorTick.TickInterval = 0.5
    return
  else
    self.PrimaryActorTick.TickInterval = 0.02
  end
  for _, Target in pairs(self.AllowPlayer) do
    local TargetActor = Target.Target
    if not IsValid(TargetActor) then
      table.insert(SinginTable, _)
    else
      local Hit, Res = self:LineTraceCheck(TargetActor)
      if Res and IsValid(Hit.Actor) and TargetActor.Eid == Hit.Actor.Eid then
        self:SetTargetActorLocation(TargetActor)
        if self.AllowPlayer[TargetActor] then
          self.AllowPlayer[TargetActor].IsCover = false
        end
      elseif self.AllowPlayer[TargetActor] then
        self.AllowPlayer[TargetActor].IsCover = true
      end
    end
  end
  for _, Eid in ipairs(SinginTable) do
    self.AllowPlayer[Eid] = nil
  end
end

function BP_WindCreate_C:SetWindCreator(Grade, IsActive)
  self:SwitchBefore()
  self.Grade = Grade
  self.IsActive = IsActive
  self:AddBuffOnBegin()
  self:UpdateRegionData("Grade", self.Grade, false)
end

function BP_WindCreate_C:CreateRegionData()
  BP_WindCreate_C.Super.CreateRegionData(self)
  self.RegionData = {}
end

function BP_WindCreate_C:RecoverSavedData(DataTable)
  BP_WindCreate_C.Super.RecoverSavedData(self, DataTable)
end

return BP_WindCreate_C
