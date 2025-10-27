local BP_Steam_C = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})
BP_Steam_C.HitedArray = {}

function BP_Steam_C:CommonInitInfo(Info)
  self.SkillEffect = self.UnitParams.SkillEffect
  self.GasNum = self.UnitParams.GasNum
  self.GasLength = self.UnitParams.GasLength
  self.GasHeight = self.UnitParams.GasHeight
  self.RotateSpeed = self.UnitParams.RotateSpeed
  self.FRotateSpeed = FRotator(0, self.UnitParams.RotateSpeed / 180 * 3.14, 0)
  self.AttackCD = self.UnitParams.AttackCD
  self.WarningTime = self.UnitParams.WarningTime or 2
  self.CurWarningTime = 0
  self.IsWarning = false
  self.ActorsToIgnore = TArray(AActor)
  self.HitResult = FHitResult()
  self.ActorsToIgnore:Add(self)
  self.Color1 = UE4.FLinearColor(1, 0, 0, 1)
  self.Color2 = UE4.FLinearColor(0, 1, 0, 1)
  BP_Steam_C.Super.CommonInitInfo(self, Info)
  self.RotateMesh = self.Mesh
  self.MeshRelativeRotation = self.Mesh.RelativeRotation
  self.CapsuleRadius = self.Capsule:GetUnscaledCapsuleRadius()
end

function BP_Steam_C:ActiveOnServer()
  self:ShowSteamEffect()
  self:StartWarning()
end

function BP_Steam_C:StartWarning()
  self.IsWarning = true
  self.CurWarningTime = 0
end

function BP_Steam_C:DeActive()
  self:HideSteamEffect()
end

return BP_Steam_C
