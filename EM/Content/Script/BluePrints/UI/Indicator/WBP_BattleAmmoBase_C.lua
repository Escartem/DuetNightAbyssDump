require("UnLua")
local WBP_BattleAmmoBase_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function WBP_BattleAmmoBase_C:Construct()
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.WaitingFlag = false
  self:AddTimer(0.2, function()
    self.WaitingFlag = true
    self:TryShowSelf()
  end, false, 0, "WaitingFlagTimer", true)
end

function WBP_BattleAmmoBase_C:Destruct()
  self:RemoveTimer("WaitingFlagTimer")
end

function WBP_BattleAmmoBase_C:Refresh()
  if self.CurUIMagazineCapacity ~= self.Root.CurMagazineCapacity then
    self:SetInfo()
  end
end

function WBP_BattleAmmoBase_C:PlayOutOfBulletAnim()
  if EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.No_Bullets) then
    return
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.No_Bullets)
end

function WBP_BattleAmmoBase_C:PlayBulletLackAnim(IsForward)
  if IsForward then
    self:SetAmmoBarMatColor(self.LackColor, 1)
  else
    self:SetAmmoBarMatColor(self.NormalColor, 1)
  end
end

function WBP_BattleAmmoBase_C:AmmoBarOutLineSetRenderOpacity(Opacity)
  self.AmmoBarOutLine:SetRenderOpacity(Opacity)
end

function WBP_BattleAmmoBase_C:UpdateAmmoBarColor()
  local MagazineBulletNum = self.Root.CurrentWeapon:GetAttr("MagazineBulletNum")
  if MagazineBulletNum / self.Root.CurMagazineCapacity < self.WarningBulletPercent then
    if self.BarColor ~= "Lack" then
      self.BarColor = "Lack"
      self:PlayBulletLackAnim(true)
      self:AmmoBarOutLineSetRenderOpacity(1)
    end
  elseif self.BarColor ~= "Enough" then
    self.BarColor = "Enough"
    self:PlayBulletLackAnim(false)
    self:AmmoBarOutLineSetRenderOpacity(0)
  end
end

function WBP_BattleAmmoBase_C:SwitchIn()
  self.Root.IsLerpSetAmmo = false
  self.Root:RemoveTimer(self.Root.LerpSetAmmoBarPercentTimer)
  self.Root.LerpSetAmmoBarPercentTimer = nil
  if self.WaitingFlag then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_BattleAmmoBase_C:SwitchOut()
  self.Root.IsLerpSetAmmo = false
  self.Root:RemoveTimer(self.Root.LerpSetAmmoBarPercentTimer)
  self.Root.LerpSetAmmoBarPercentTimer = nil
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_BattleAmmoBase_C:TryShowSelf()
  if self.Root.AmmoBarPanel == self then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

return WBP_BattleAmmoBase_C
