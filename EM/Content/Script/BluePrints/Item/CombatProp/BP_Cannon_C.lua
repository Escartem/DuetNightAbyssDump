require("UnLua")
local BP_Cannon_C = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function BP_Cannon_C:AuthorityInitInfo(Info)
  BP_Cannon_C.Super.AuthorityInitInfo(self, Info)
  self.BulletNum = self.UnitParams.BulletNum or 5
  self.DelayTime = self.UnitParams.DelayTime or 1
  self.IntervalTime = self.UnitParams.IntervalTime or 1
  self.FillingTime = self.UnitParams.FillingTime or 10
  self.SkillSavePos = self.UnitParams.SkillSavePos or 900009
  self.SkillCauesDamage = self.UnitParams.SkillCauesDamage or 900008
  self.WarningEffect = self.UnitParams.WarningEffect or 900005
  self.RoundHandle = {}
  self.RoundNum = 1
  self:ChangeToState(1)
end

function BP_Cannon_C:ChangeToState(StateId)
  if 1 == StateId then
    self.IsActive = true
    self.CannonHandle = self:AddTimer(self.FillingTime, self.SingleRoundAttack, true, -self.FillingTime)
  elseif 0 == StateId then
    self.IsActive = false
    self:RemoveTimer(self.CannonHandle)
    self.CannonHandle = nil
  end
end

function BP_Cannon_C:SingleRoundAttack()
  local RemainBullet = self.BulletNum
  local Handle = self.RoundHandle
  self.RoundHandle[self.RoundNum] = {Num = RemainBullet, Handle = nil}
  self.RoundHandle[self.RoundNum].Handle = self:AddTimer(self.IntervalTime, self.SingleAttack, true, -self.IntervalTime, nil, nil, self.RoundNum)
  self.RoundNum = self.RoundNum + 1
end

function BP_Cannon_C:SingleAttack(RoundNum)
  self.RoundHandle[RoundNum].Num = self.RoundHandle[RoundNum].Num - 1
  if self.RoundHandle[RoundNum].Num <= 0 then
    self:RemoveTimer(self.RoundHandle[RoundNum].Handle)
    self.RoundHandle[RoundNum].Handle = nil
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self:PropUseSkill(self.SkillSavePos, Player)
  self:PropUseSkill(self.SkillCauesDamage, nil)
  self.FXComponent:PlayFxDecalByID(self.WarningEffect, self:GetSaveLoc(""), true)
end

function BP_Cannon_C:WaitToDamage(num)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self:PropUseSkill(self.SkillSavePos, Player)
  self:PropUseSkill(self.SkillCauesDamage, nil)
end

function BP_Cannon_C:GetShootingTargets()
  local Array = TArray(ACharacterBase)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  Array.Add(Player)
  return Array
end

function BP_Cannon_C:GetControlRotation()
  return nil
end

function BP_Cannon_C:SetActiveType()
  self.ActiveType = "Manual"
end

return BP_Cannon_C
