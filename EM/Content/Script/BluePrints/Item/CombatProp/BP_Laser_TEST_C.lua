require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local BP_Laser_TEST_C = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function BP_Laser_TEST_C:AuthorityInitInfo(Info)
  BP_Laser_TEST_C.Super.AuthorityInitInfo(self, Info)
  self.ActiveRange = self.UnitParams.ActiveRange
end

function BP_Laser_TEST_C:CommonInitInfo(Info)
  BP_Laser_TEST_C.Super.CommonInitInfo(self, Info)
  self.RotateSpeed = self.UnitParams.RotateSpeed
  self.AttackCD = self.UnitParams.AttackCD
  self.LaserNum = self.UnitParams.LaserNum
  self.LaserLength = self.UnitParams.LaserLength
  self.SkillEffect = self.UnitParams.SkillEffect
  self.RotatingMovement.RotationRate.Yaw = self.RotateSpeed
  self.HitedArray = {}
end

function BP_Laser_TEST_C:SetActiveType()
  self.ActiveType = "Distance"
end

function BP_Laser_TEST_C:OnActiveStateChange()
  self.Super.OnActiveStateChange(self)
  if self.IsActive then
    self:PlaySound("event:/sfx/common/scene/laser_gear_open", "LaserActive")
  else
    AudioManager(self):StopSound(self, "LaserActive")
    AudioManager(self):StopSound(self, self.SoundKeyRotate)
    AudioManager(self):StopSound(self, self.SoundKeyLoop)
    self.HitedCDMap:Clear()
  end
end

function BP_Laser_TEST_C:ChangeCD()
  self.InCD = false
end

function BP_Laser_TEST_C:LaunchLaser(Index)
  local LaserInfo = FLaserInfo()
  LaserInfo.LaserLength = self.LaserLength
  LaserInfo.Interval = self.AttackCD
  LaserInfo.LastTime = -1
  LaserInfo.SocketName = "Center" .. Index
  LaserInfo.Debug = false
  local LaserPort = Battle(self):CreateLaser(self.Mesh, self["LaserRay" .. Index], LaserInfo)
  self["LaserRay" .. Index]:SetActive(true, false)
  return LaserPort
end

function BP_Laser_TEST_C:OnHitTarget(Port, HitResult)
  if HitResult.Actor then
    local SelfPlayer = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    if HitResult.Actor:IsDead() ~= true and not self.HitedCDMap:Find(HitResult.Actor.Eid) then
      self.HitedCDMap:Add(HitResult.Actor.Eid, 0)
      self:PlaySound("event:/sfx/common/scene/laser_hit")
      self.Super.PropUseSkill(self, self.SkillEffect, HitResult.Actor)
    end
  end
end

function BP_Laser_TEST_C:OnDead(KillMineRoleEid, KillMineSkillId, DeathReason)
  self.RotatingMovement:SetActive(false, false)
  BP_Laser_TEST_C.Super.OnDead(self, KillMineRoleEid, KillMineSkillId, DeathReason)
end

function BP_Laser_TEST_C:ShowDeath()
  self:RemoveTimer("DistanceDeActiveTimer")
  self:PlayDeadMontage()
  self:DeActiveFX(self.LaserRay1)
  self:DeActiveFX(self.LaserRay2)
  self:DeActiveFX(self.LaserRay3)
  self:DeActiveFX(self.LaserRay4)
  AudioManager(self):StopSound(self, self.SoundKeyRotate)
  AudioManager(self):StopSound(self, self.SoundKeyLoop)
  self:PlaySound("event:/sfx/common/scene/laser_gear_break")
  BP_Laser_TEST_C.Super.ShowDeath(self)
end

function BP_Laser_TEST_C:DeActive()
  BP_Laser_TEST_C.Super.DeActive(self)
  if not IsAuthority(self) or IsStandAlone(self) then
    self:DeActiveFX(self.LaserRay1)
    self:DeActiveFX(self.LaserRay2)
    self:DeActiveFX(self.LaserRay3)
    self:DeActiveFX(self.LaserRay4)
    self:PlayDeactiveMontage()
  end
end

function BP_Laser_TEST_C:ActiveAfterAnim(Eid)
  for i = 1, 4 do
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

function BP_Laser_TEST_C:OnEMActorDestroy(DestroyReason)
  MiscUtils.RemoveTickLodActor(ESignificanceTag.None, self, ETickObjectFlag.FLAG_ALL)
  BP_Laser_TEST_C.Super.OnEMActorDestroy(self, DestroyReason)
end

function BP_Laser_TEST_C:ReceiveEndPlay(Reason)
  MiscUtils.RemoveTickLodActor(ESignificanceTag.None, self, ETickObjectFlag.FLAG_ALL)
  self.Overridden.ReceiveEndPlay(self, Reason)
end

return BP_Laser_TEST_C
