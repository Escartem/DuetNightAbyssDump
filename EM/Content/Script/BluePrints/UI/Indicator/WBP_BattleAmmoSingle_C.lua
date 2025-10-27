require("UnLua")
local WBP_BattleAmmoSingle_C = Class({
  "BluePrints.UI.Indicator.WBP_BattleAmmoBase_C"
})

function WBP_BattleAmmoSingle_C:Init(Root)
  self.Root = Root
  self:SetInfo()
end

function WBP_BattleAmmoSingle_C:SetInfo()
  self.CurUIMagazineCapacity = self.Root.CurMagazineCapacity
  self.AmmoBar = nil
  self.AmmoBarTable = {}
  self.AmmoBarOutLine = nil
  self.AmmoBarOutLineTable = {}
  self.AmmoBarMat = nil
  self.AmmoBarMatTable = {}
  local AllChildren = self.WrapBox_0:GetAllChildren()
  for i = 1, AllChildren:Length() do
    if i <= self.CurUIMagazineCapacity then
      self["Bullet0" .. i]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self["Bullet0" .. i]:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  for i = AllChildren:Length(), 1, -1 do
    table.insert(self.AmmoBarOutLineTable, AllChildren[i]:GetChildAt(0):GetChildAt(0))
    if AllChildren[i]:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible then
      table.insert(self.AmmoBarTable, AllChildren[i]:GetChildAt(0):GetChildAt(3))
    end
  end
  for i = 1, #self.AmmoBarTable do
    table.insert(self.AmmoBarMatTable, self.AmmoBarTable[i]:GetDynamicMaterial())
  end
end

function WBP_BattleAmmoSingle_C:AmmoBarOutLineSetRenderOpacity(Opacity)
  for i = 1, #self.AmmoBarOutLineTable do
    self.AmmoBarOutLineTable[i]:SetRenderOpacity(Opacity)
  end
end

function WBP_BattleAmmoSingle_C:RealUpdateAmmoBarProgress()
  local MagazineBulletNum = self.Root.CurrentWeapon:GetAttr("MagazineBulletNum")
  for i = 1, self.CurUIMagazineCapacity do
    if i <= MagazineBulletNum then
      self.AmmoBarTable[i]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.AmmoBarTable[i]:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  if self.Root.CurState == "Reload" and (self.Root:ShouldNotKeepReloading() or self.Root:IsReloadBreaked()) then
    self.Root:LeaveReloadState()
  end
end

function WBP_BattleAmmoSingle_C:RealEnterReloadState()
  self.BarColor = "Reload"
  self:SetAmmoBarMatColor(self.ReloadColor)
  self:AmmoBarOutLineSetRenderOpacity(0)
end

function WBP_BattleAmmoSingle_C:TryToLeaveReloadState(Reason)
  if "Break" == Reason then
    self.Root:LeaveReloadState(Reason)
  end
end

function WBP_BattleAmmoSingle_C:LeaveReloadState()
  self:UpdateAmmoBarColor()
end

function WBP_BattleAmmoSingle_C:UpdateAmmoBarProgress()
  if self.Root.CurState ~= "Reload" then
    self:UpdateAmmoBarColor()
  end
  self:RealUpdateAmmoBarProgress()
end

function WBP_BattleAmmoSingle_C:UpdateAmmoBarColor()
  local MagazineBulletNum = self.Root.CurrentWeapon:GetAttr("MagazineBulletNum")
  if MagazineBulletNum <= math.ceil(self.WarningBulletPercent * self.CurUIMagazineCapacity) then
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

function WBP_BattleAmmoSingle_C:SetAmmoBarMatColor(LinearColor, Value)
  for i = 1, #self.AmmoBarMatTable do
    self.AmmoBarMatTable[i]:SetVectorParameterValue("MainColor", LinearColor)
  end
end

return WBP_BattleAmmoSingle_C
