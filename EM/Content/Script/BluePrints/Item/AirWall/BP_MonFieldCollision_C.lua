require("UnLua")
local BP_MonFieldCollision_C = Class({
  "BluePrints/Item/AirWall/BP_MonField_C"
})

function BP_MonFieldCollision_C:AuthorityInitInfo(Info)
  BP_MonFieldCollision_C.Super.AuthorityInitInfo(self, Info)
  self.ShapeType = self.UnitParams.ShapeType or "Box"
  self:SetFieldRange()
end

function BP_MonFieldCollision_C:ClientInitInfo(Info)
end

function BP_MonFieldCollision_C:SetFieldRange()
  local SphereProfileName = self.Sphere:GetCollisionProfileName()
  local BoxProfileName = self.Box:GetCollisionProfileName()
  local CylinderProfileName = self.Cylinder:GetCollisionProfileName()
  self.Cylinder:SetCollisionEnabled(0)
  self.Box:SetCollisionEnabled(0)
  self.Sphere:SetCollisionEnabled(0)
  if "Box" == self.ShapeType then
    self:InitBoxCollisition()
  elseif "Sphere" == self.ShapeType then
    self:InitSphereCollisition()
  elseif "Cylinder" == self.ShapeType then
    self:InitCylinderCollisition()
  end
  self.Cylinder:SetCollisionProfileName(CylinderProfileName)
  self.Box:SetCollisionProfileName(BoxProfileName)
  self.Sphere:SetCollisionProfileName(SphereProfileName)
end

function BP_MonFieldCollision_C:GetTrapOverlapActors()
  local ObjectTypes = TArray(EObjectTypeQuery)
  ObjectTypes:Add(EObjectTypeQuery.Pawn)
  local OutActors = TArray(UE4.ACharacterBase)
  OutActors = UE4.UKismetSystemLibrary.ComponentOverlapActors(self.Collision, self:GetTransform(), ObjectTypes)
  return OutActors
end

function BP_MonFieldCollision_C:InitBoxCollisition()
  local X = self.UnitParams.X or self.Box.BoxExtent.X
  local Y = self.UnitParams.Y or self.Box.BoxExtent.Y
  local Z = self.UnitParams.Z or self.Box.BoxExtent.Z
  local Size = FVector(X, Y, Z)
  self.Box:SetBoxExtent(Size, true)
  self.Box:SetCollisionEnabled(3)
  self.Collision = self.Box
end

function BP_MonFieldCollision_C:InitSphereCollisition()
  local R = self.UnitParams.Radius or self.Sphere.SphereRadius
  self.Sphere:SetSphereRadius(R, true)
  self.Sphere:SetCollisionEnabled(3)
  self.Collision = self.Sphere
end

function BP_MonFieldCollision_C:InitCylinderCollisition()
  local Scale = self.Cylinder:K2_GetComponentScale()
  local R = self.UnitParams.Radius or Scale.X * 100
  local H = self.UnitParams.Height or Scale.Z * 100
  local NewScale = FVector(R / 50, R / 50, H / 100)
  self.Cylinder:SetWorldScale3D(NewScale)
  self.Cylinder:SetCollisionEnabled(3)
  self.Collision = self.Cylinder
end

function BP_MonFieldCollision_C:ShowDeath()
  BP_MonFieldCollision_C.Super.ShowDeath(self)
  self:EMActorDestroy(EDestroyReason.MechanismDead)
end

return BP_MonFieldCollision_C
