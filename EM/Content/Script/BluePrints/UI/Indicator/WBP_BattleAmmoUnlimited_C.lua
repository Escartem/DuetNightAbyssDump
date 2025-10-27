require("UnLua")
local WBP_BattleAmmoUnlimited_C = Class({
  "BluePrints.UI.Indicator.WBP_BattleAmmoBase_C"
})

function WBP_BattleAmmoUnlimited_C:Init(Root)
  self.Root = Root
  self.AmmoBar = self.VX_UnlimitedBar
  self.AmmoBarOutLine = self.VX_UnlimitedBar_Warning
  self.AmmoBarMat = self.AmmoBar:GetDynamicMaterial()
  self:SetInfo()
end

function WBP_BattleAmmoUnlimited_C:SetInfo()
  self.CurUIMagazineCapacity = self.Root.CurMagazineCapacity
  self.UnlimitedSingleStep = 1 / self.CurUIMagazineCapacity
end

function WBP_BattleAmmoUnlimited_C:RealUpdateAmmoBarProgress()
  if self.Root.CurState == "Reload" then
    self.Root.IsLerpSetAmmo = true
    if not self.Root.LerpSetAmmoBarPercentTimer then
      self.Root.LerpSetAmmoBarPercentTimer = self.Root:AddTimer(0.033, self.Root.LerpSetAmmoBarPercentInTick, true, 0, "LerpSetAmmoBarPercentTimer", false, 0.033)
    end
  else
    local MagazineBulletNum = self.Root.CurrentWeapon:GetAttr("MagazineBulletNum")
    self.AmmoBarMat:SetScalarParameterValue("Percent", MagazineBulletNum / self.CurUIMagazineCapacity)
  end
end

function WBP_BattleAmmoUnlimited_C:LerpSetAmmoBarPercentInTick()
  local MagazineBulletNum = self.Root.CurrentWeapon:GetAttr("MagazineBulletNum")
  local CurrentPercent = self.AmmoBarMat:K2_GetScalarParameterValue("Percent") + self.UnlimitedSingleStep
  local TargetPercent = MagazineBulletNum / self.CurUIMagazineCapacity
  if CurrentPercent >= TargetPercent then
    CurrentPercent = TargetPercent
    self.Root.IsLerpSetAmmo = false
    self.Root:RemoveTimer(self.Root.LerpSetAmmoBarPercentTimer)
    self.Root.LerpSetAmmoBarPercentTimer = nil
    if self.Root.CurState == "Reload" and (self.Root:ShouldNotKeepReloading() or self.Root:IsReloadBreaked()) then
      self.Root:LeaveReloadState()
    end
  end
  self.AmmoBarMat:SetScalarParameterValue("Percent", CurrentPercent)
end

function WBP_BattleAmmoUnlimited_C:RealEnterReloadState()
  self.BarColor = "Reload"
  EMUIAnimationSubsystem:EMStopAnimation(self, self.No_Bullets)
  self:SetAmmoBarMatColor(self.ReloadColor, 0)
  self:AmmoBarOutLineSetRenderOpacity(0)
end

function WBP_BattleAmmoUnlimited_C:TryToLeaveReloadState(Reason)
  if "Break" == Reason then
    self.Root:LeaveReloadState(Reason)
  end
end

function WBP_BattleAmmoUnlimited_C:LeaveReloadState()
  self:UpdateAmmoBarColor()
end

function WBP_BattleAmmoUnlimited_C:UpdateAmmoBarProgress()
  if self.Root.CurState ~= "Reload" then
    self:UpdateAmmoBarColor()
  end
  self:RealUpdateAmmoBarProgress()
end

function WBP_BattleAmmoUnlimited_C:SetAmmoBarMatColor(LinearColor, Value)
  self.AmmoBarMat:SetVectorParameterValue("MainColor", LinearColor)
  self.AmmoBarMat:SetScalarParameterValue("Saturation", Value)
end

return WBP_BattleAmmoUnlimited_C
