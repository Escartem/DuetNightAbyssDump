require("UnLua")
local WBP_Battle_Weapon_Hint_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Battle_Weapon_Hint_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.CurLevel = nil
  self.LevelProcess = 0
  self.CurPlatformName = nil
end

function WBP_Battle_Weapon_Hint_C:Construct()
  self:AddDispatcher(EventID.OnCharForbidWeapon, self, self.HideOrShowWidget)
  self.text_num_1:SetText("x0")
  self.CurPlatformName = CommonUtils.GetDeviceTypeByPlatformName(self)
  if self.CurPlatformName == "PC" then
    self.Progress_bar:SetPercent(0)
  else
    self.panel_batter:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:PlayAnim(self.InOrHitAnimName)
end

function WBP_Battle_Weapon_Hint_C:UpdateCurLevelProcess(IsShowIn, CurrentComboLevel, CurrentComboCount, CurLevelNeedCount, NextLevelNeedCount, MaxComboLevel, IsUseOut)
  self.text_num_1:SetText("x" .. tostring(CurrentComboLevel))
  self.CurLevel = CurrentComboLevel
  self.LevelProcess = CurrentComboCount
  if self.CurPlatformName == "PC" then
    self.Progress_bar:SetPercent((CurrentComboCount - CurLevelNeedCount) / (NextLevelNeedCount - CurLevelNeedCount))
  end
end

function WBP_Battle_Weapon_Hint_C:UpdateBulletNumInTick()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) then
    self.Panel_Bullet:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  local CurrentWeapon = Player:GetCurrentWeapon()
  local RangedWeapon = Player.RangedWeapon
  local MeleeWeapon = Player.MeleeWeapon
  if not IsValid(CurrentWeapon) then
    self.Panel_Bullet:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.panel_batter:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  if CurrentWeapon == RangedWeapon then
    self.panel_batter:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if Player:CheckSkillInActive(ESkillName.Fire) then
      self.Panel_Bullet:SetVisibility(UE4.ESlateVisibility.Collapsed)
      return
    end
    local MagazineBulletNum = RangedWeapon:GetAttr("MagazineBulletNum")
    local BulletNum = RangedWeapon:GetAttr("BulletNum")
    if nil == MagazineBulletNum or nil == BulletNum then
      self.Panel_Bullet:SetVisibility(UE4.ESlateVisibility.Collapsed)
      return
    end
    self.Panel_Bullet:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.TExt_1:SetText(tostring(MagazineBulletNum))
    self.TExt_2:SetText("/ " .. tostring(BulletNum))
    local MagazineCapacity = RangedWeapon:GetAttr("MagazineCapacity")
    if MagazineCapacity and MagazineBulletNum < MagazineCapacity then
      if nil == self.LastMagazineBulletNum then
        self:PlayAnim("Shoot_Loop")
      elseif MagazineBulletNum < self.LastMagazineBulletNum then
        self:PlayAnim("Shoot_Loop")
      end
    end
    self.LastMagazineBulletNum = MagazineBulletNum
  elseif CurrentWeapon == MeleeWeapon then
    self.Panel_Bullet:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.panel_batter:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Battle_Weapon_Hint_C:HideOrShowWidget(WeaponTag, IsHide)
  local Widget = "Melee" == WeaponTag and self.panel_batter or self.Panel_Bullet
  if nil ~= Widget then
    if IsHide then
      Widget:SetRenderOpacity(0.0)
    else
      Widget:SetRenderOpacity(1.0)
    end
  end
end

return WBP_Battle_Weapon_Hint_C
