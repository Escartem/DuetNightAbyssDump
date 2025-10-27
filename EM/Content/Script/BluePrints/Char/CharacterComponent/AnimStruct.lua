require("UnLua")
local FFootIK = {
  FootLock_L_Alpha = 0.0,
  FootLock_R_Alpha = 0.0,
  UseFootLockCurve_L = false,
  UseFootLockCurve_R = false,
  FootLock_L_Location = FVector(),
  TargetFootLock_R_Location = FVector(),
  FootLock_R_Location = FVector(),
  TargetFootLock_L_Rotation = FRotator(),
  FootLock_L_Rotation = FRotator(),
  TargetFootLock_R_Rotation = FRotator(),
  FootLock_R_Rotation = FRotator(),
  FootOffset_L_Location = FVector(),
  FootOffset_R_Location = FVector(),
  FootOffset_L_Rotation = FRotator(),
  FootOffset_R_Rotation = FRotator(),
  PelvisOffset = FVector(),
  PelvisAlpha = 0.0,
  KneesAlpha = 0.0
}
return New(FFootIK)
