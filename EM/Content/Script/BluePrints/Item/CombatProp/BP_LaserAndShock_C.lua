require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local BP_LaserAndShock_C = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function BP_LaserAndShock_C:AuthorityInitInfo(Info)
  BP_LaserAndShock_C.Super.AuthorityInitInfo(self, Info)
  self.SkillRange = 0
end

function BP_LaserAndShock_C:CommonInitInfo(Info)
  BP_LaserAndShock_C.Super.CommonInitInfo(self, Info)
  self.RotateSpeed = self.UnitParams.RotateSpeed
  self.LaserAttackCD = self.UnitParams.LaserAttackCD
  self.LaserNum = self.UnitParams.LaserNum
  self.LaserLength = self.UnitParams.LaserLength
  self.SkillEffectLaser = self.UnitParams.SkillEffectLaser
  self.SkillEffectShock = self.UnitParams.SkillEffectShock
  self.ShockMaxRadius = self.UnitParams.ShockMaxRadius
  self.ShockAttackCD = self.UnitParams.ShockAttackCD
  self.ShockWidth = self.UnitParams.ShockWidth
  self.RotatingMovement.RotationRate.Yaw = self.RotateSpeed
  self.Speed = self.ShockMaxRadius / self.ShockAttackCD
  self.ShockRange:SetBoxExtent(FVector(self.ShockMaxRadius, self.ShockMaxRadius, 10))
  self.SkillRange = 0
end

function BP_LaserAndShock_C:OnActiveStateChange()
  DebugPrint("zwkk OnActiveStateChange")
  self.Super.OnActiveStateChange(self)
  if self.IsActive then
    self:PlaySound("event:/sfx/common/scene/laser_gear_open", "LaserActive")
    self:PlayActiveMontage()
  else
    AudioManager(self):StopSound(self, "LaserActive")
    AudioManager(self):StopSound(self, self.SoundKeyRotate)
    AudioManager(self):StopSound(self, self.SoundKeyLoop)
    self.LaserHitedCDMap:Clear()
    self.ShockHitedCDMap:Clear()
  end
end

function BP_LaserAndShock_C:ChangeCD()
  self.InCD = false
end

function BP_LaserAndShock_C:LaunchLaser(Index)
  local LaserInfo = FLaserInfo()
  LaserInfo.LaserLength = self.LaserLength
  LaserInfo.Interval = self.LaserAttackCD
  LaserInfo.LastTime = -1
  LaserInfo.SocketName = "Center" .. Index
  LaserInfo.Debug = false
  local LaserPort = Battle(self):CreateLaser(self.Mesh, self["LaserRay" .. Index], LaserInfo)
  self["LaserRay" .. Index]:SetActive(true, false)
  return LaserPort
end

function BP_LaserAndShock_C:OnHitTarget(Port, HitResult)
  if HitResult.Actor and self.IsActive then
    local SelfPlayer = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    if HitResult.Actor:IsDead() ~= true and not self.LaserHitedCDMap:Find(HitResult.Actor.Eid) then
      self.LaserHitedCDMap:Add(HitResult.Actor.Eid, 0)
      self:PlaySound("event:/sfx/common/scene/laser_hit")
      self.Super.PropUseSkill(self, self.SkillEffectLaser, HitResult.Actor)
      self:ChangeState("Manual", 0, self.OnHitStateId)
    end
  end
end

function BP_LaserAndShock_C:AddHitMap(Actor)
  if not IsAuthority(self) then
    return
  end
  if Actor.Eid and Actor.Eid == self.Eid then
    return
  end
  self.HitMap:Add(Actor.Eid, Actor)
end

function BP_LaserAndShock_C:RemoveHitMap(Actor)
  if not IsAuthority(self) then
    return
  end
  self.HitMap:Remove(Actor.Eid)
end

function BP_LaserAndShock_C:OnDead(KillMineRoleEid, KillMineSkillId, DeathReason)
  self.RotatingMovement:SetActive(false, false)
  BP_LaserAndShock_C.Super.OnDead(self, KillMineRoleEid, KillMineSkillId, DeathReason)
end

function BP_LaserAndShock_C:ShowDeath()
  self:RemoveTimer("DistanceDeActiveTimer")
  self:PlayDeadMontage()
  self:DeActiveFX(self.LaserRay1)
  self:DeActiveFX(self.LaserRay2)
  self:DeActiveFX(self.LaserRay3)
  self:DeActiveFX(self.LaserRay4)
  self:DeActiveFX(self.ShockFX)
  AudioManager(self):StopSound(self, self.SoundKeyRotate)
  AudioManager(self):StopSound(self, self.SoundKeyLoop)
  self:PlaySound("event:/sfx/common/scene/laser_gear_break")
  BP_LaserAndShock_C.Super.ShowDeath(self)
end

function BP_LaserAndShock_C:DeActive()
  BP_LaserAndShock_C.Super.DeActive(self)
  self.SkillRange = 0
  if not IsAuthority(self) or IsStandAlone(self) then
    self:DeActiveFX(self.LaserRay1)
    self:DeActiveFX(self.LaserRay2)
    self:DeActiveFX(self.LaserRay3)
    self:DeActiveFX(self.LaserRay4)
    self:DeActiveFX(self.ShockFX)
    self:PlayDeactiveMontage()
  end
end

function BP_LaserAndShock_C:ActiveAfterAnim(Eid)
  for i = 1, self.LaserNum do
    local LaserPort = self:LaunchLaser(i)
    LaserPort.OnHitTarget:Add(self, self.OnHitTarget)
  end
  self.RotatingMovement:SetActive(true, false)
  self.IsStart = true
  self.SoundKeyRotate = "LaserRotate" .. self.Eid
  self.SoundKeyLoop = "LaserLoop" .. self.Eid
  self:PlaySound("event:/sfx/common/scene/laser_gear_rotate", self.SoundKeyRotate)
  self:PlaySound("event:/sfx/common/scene/laser_loop", self.SoundKeyLoop)
end

function BP_LaserAndShock_C:ReceiveBeginPlay()
  BP_LaserAndShock_C.Super.ReceiveBeginPlay(self)
  self:DeActiveFX(self.ShockFX)
end

function BP_LaserAndShock_C:OnEMActorDestroy(DestroyReason)
  MiscUtils.RemoveTickLodActor(ESignificanceTag.None, self, ETickObjectFlag.FLAG_ALL)
  BP_LaserAndShock_C.Super.OnEMActorDestroy(self, DestroyReason)
end

function BP_LaserAndShock_C:ReceiveEndPlay(Reason)
  MiscUtils.RemoveTickLodActor(ESignificanceTag.None, self, ETickObjectFlag.FLAG_ALL)
  self.Overridden.ReceiveEndPlay(self, Reason)
end

return BP_LaserAndShock_C
