require("UnLua")
local WBP_BattleAmmo_C = Class({
  "BluePrints.UI.Indicator.WBP_BattleAmmoBase_C"
})

function WBP_BattleAmmo_C:Init(Root)
  self.Root = Root
  self.AmmoBar = self.VX_Bar
  self.AmmoBarOutLine = self.Img_Ammo_Bar_1
  self.AmmoBarMat = self.AmmoBar:GetDynamicMaterial()
  self:SetInfo()
end

function WBP_BattleAmmo_C:SetInfo()
  self.CurUIMagazineCapacity = self.Root.CurMagazineCapacity
end

function WBP_BattleAmmo_C:RealUpdateAmmoBarProgress(bLerp)
  local MagazineBulletNum = self.Root.CurrentWeapon:GetAttr("MagazineBulletNum")
  if bLerp then
    self:SetAmmoBarPercent_Lerp(MagazineBulletNum / self.CurUIMagazineCapacity)
  else
    self:SetAmmoBarPercent(MagazineBulletNum / self.CurUIMagazineCapacity)
  end
end

function WBP_BattleAmmo_C:SetAmmoBarPercent(Percent)
  self.Root.IsLerpSetAmmo = false
  self.Root:RemoveTimer(self.Root.LerpSetAmmoBarPercentTimer)
  self.Root.LerpSetAmmoBarPercentTimer = nil
  self.AmmoBarMat:SetScalarParameterValue("Percent", Percent)
end

function WBP_BattleAmmo_C:SetAmmoBarPercent_Lerp(Percent)
  self.TargetBulletNumPercent = Percent
  self.StartBulletNumPercent = self.AmmoBarMat:K2_GetScalarParameterValue("Percent")
  if self.TargetBulletNumPercent >= self.StartBulletNumPercent then
    self:SetAmmoBarPercent(Percent)
    return
  end
  self.BulletNumLerpAlpha = 0
  self.Root.IsLerpSetAmmo = true
  if not self.Root.LerpSetAmmoBarPercentTimer then
    self.Root.LerpSetAmmoBarPercentTimer = self.Root:AddTimer(0.033, self.Root.LerpSetAmmoBarPercentInTick, true, 0, "LerpSetAmmoBarPercentTimer", false, 0.033)
  end
end

function WBP_BattleAmmo_C:LerpSetAmmoBarPercentInTick(DeltaTime)
  self.BulletNumLerpAlpha = self.BulletNumLerpAlpha + self.BulletNumChangeSpeed * DeltaTime
  if self.BulletNumLerpAlpha >= 1 then
    self.BulletNumLerpAlpha = 1
    self.AmmoBarMat:SetScalarParameterValue("Percent", self.TargetBulletNumPercent)
    self.Root.IsLerpSetAmmo = false
    self.Root:RemoveTimer(self.Root.LerpSetAmmoBarPercentTimer)
    self.Root.LerpSetAmmoBarPercentTimer = nil
    return
  end
  local Percent = UE4.UKismetMathLibrary.Lerp(self.StartBulletNumPercent, self.TargetBulletNumPercent, self.BulletNumLerpAlpha)
  self.AmmoBarMat:SetScalarParameterValue("Percent", Percent)
end

function WBP_BattleAmmo_C:RealEnterReloadState()
  self.ReloadAnimPlayTime = self.Root:GetFirstReloadAnimPlayTime()
  if not self.ReloadAnimPlayTime or self.ReloadAnimPlayTime <= 0 then
    return
  end
  self.BarColor = "Reload"
  self.ReloadPercent = 0
  self.ReloadAnimPassedTime = 0
  self.UpdatedDuringReload = false
  self:SetAmmoBarPercent(0)
  self:AmmoBarOutLineSetRenderOpacity(0)
  self.ReloadSkillSpeed = self.Root.OwnerPlayer.SkillTimeline.CurrentSkillNode.AnimPlayRate
  self.Root.IsLerpSetAmmo = false
  self.Root:RemoveTimer(self.Root.LerpSetAmmoBarPercentTimer)
  self.Root.LerpSetAmmoBarPercentTimer = nil
  self.Root.IsReloadingBar = true
  if not self.Root.PlayReloadAnimTimer then
    self.Root.PlayReloadAnimTimer = self.Root:AddTimer(0.033, self.Root.PlayReloadAnimInTick, true, 0, "PlayReloadAnimTimer", false, 0.033)
  end
  EMUIAnimationSubsystem:EMStopAnimation(self, self.No_Bullets)
  self:SetAmmoBarMatColor(self.ReloadColor)
end

function WBP_BattleAmmo_C:PlayReloadAnimInTick(DeltaTime)
  if self.Root:IsReloadBreaked() then
    self.Root:LeaveReloadState("Break")
    return
  end
  self.ReloadAnimPassedTime = self.ReloadAnimPassedTime + DeltaTime * self.ReloadSkillSpeed * UE4.UGameplayStatics.GetGlobalTimeDilation(self)
  self.ReloadPercent = self.ReloadAnimPassedTime / self.ReloadAnimPlayTime
  if self.ReloadPercent >= 1 then
    self:SetAmmoBarPercent(1)
  else
    self:SetAmmoBarPercent(self.ReloadPercent)
  end
end

function WBP_BattleAmmo_C:TryToLeaveReloadState(Reason)
  self.Root:LeaveReloadState(Reason)
end

function WBP_BattleAmmo_C:LeaveReloadState(Reason)
  self.Root.IsReloadingBar = false
  self.Root:RemoveTimer(self.Root.PlayReloadAnimTimer)
  self.Root.PlayReloadAnimTimer = nil
  if Reason and self["GetLeaveReloadStateTimeBy" .. Reason] then
    self["GetLeaveReloadStateTimeBy" .. Reason](self)
  end
  self:RealLeaveReloadState()
end

function WBP_BattleAmmo_C:RealLeaveReloadState()
  if self.NeedUpdateAfterLeaveReload then
    self.NeedUpdateAfterLeaveReload = false
    self:UpdateAmmoBarProgress()
  end
end

function WBP_BattleAmmo_C:GetLeaveReloadStateTimeByLeaveNormally()
  if not self.UpdatedDuringReload then
    self.bWaitForUpdateBulletNum = true
  else
    self.NeedUpdateAfterLeaveReload = true
  end
end

function WBP_BattleAmmo_C:GetLeaveReloadStateTimeByBreak()
  self.NeedUpdateAfterLeaveReload = true
end

function WBP_BattleAmmo_C:UpdateAmmoBarProgress(bLerp)
  if self.Root.IsReloadingBar then
    self.UpdatedDuringReload = true
    return
  end
  if self.Root.CurState ~= "Reload" then
    self:UpdateAmmoBarColor()
  end
  if self.bWaitForUpdateBulletNum then
    self.bWaitForUpdateBulletNum = false
    bLerp = false
  end
  self:RealUpdateAmmoBarProgress(bLerp)
end

function WBP_BattleAmmo_C:SetAmmoBarMatColor(LinearColor, Value)
  self.AmmoBarMat:SetVectorParameterValue("CircleColor", LinearColor)
end

return WBP_BattleAmmo_C
