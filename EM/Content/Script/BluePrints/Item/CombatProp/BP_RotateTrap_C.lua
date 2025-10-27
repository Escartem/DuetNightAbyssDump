require("UnLua")
local M = Class({
  "BluePrints.Item.CombatProp.BP_CombatPropBase_C",
  "BluePrints.Common.TimerMgr"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.AttackCD = self.UnitParams.AttackCD
  self.Rotator = FRotator(0, 0, self.RotateSpeed)
end

function M:OnActorReady(Info)
  M.Super.OnActorReady(self, Info)
  self.InstancedStaticMesh.OnComponentBeginOverlap:Add(self, self.OnOverlap)
  self.InstancedMesh = self.InstancedStaticMesh
  self.RotSpeed = self.RotateSpeed
end

function M:OnOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex, bFromSweep, SweepResult)
  if not self.IsActive then
    return
  end
  if not OtherActor.RotateTrapAttacking and OtherActor:IsDead() ~= true and (OtherActor.IsPlayer or OtherActor.IsRealMonster) then
    OtherActor.RotateTrapAttacking = true
    
    local function ResetTargetAcorTrapAttack()
      OtherActor.RotateTrapAttacking = false
    end
    
    self:AddTimer(self.AttackCD, ResetTargetAcorTrapAttack, false, 0)
    self.Super.PropAttack(self, OtherActor)
  end
end

function M:OnEndOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex)
end

function M:ActiveCombat()
  M.Super.ActiveCombat(self)
  self:OnTrapActive()
  self:SetActorTickEnabled(true)
end

function M:DeActiveCombat()
  M.Super.DeActiveCombat(self)
  self:OnTrapDeActive()
  self:SetActorTickEnabled(false)
end

return M
