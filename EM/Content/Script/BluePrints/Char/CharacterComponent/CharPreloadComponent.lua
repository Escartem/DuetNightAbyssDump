require("UnLua")
local M = Class()
local WeaponMontageTagsConfig = {
  "Bow",
  "Cannon",
  "Claymore",
  "Crossbow",
  "Funnel",
  "Katana",
  "Machinegun",
  "Polearm",
  "Shotgun",
  "Sword",
  "Swordwhip"
}

function M:PreloadEnable()
  if self.Owner:IsPlayer() then
    return Const.EnablePlayerPreload
  end
  return true
end

function M:NeedPreloadAssets_Phantom()
  return Const.EnableDungeonPhantomPreload
end

function M:InitDistructableBody()
  self.Owner.DistructableBodyId = self:GetDistructableBodyId()
end

function M:GetDistructableBodyId()
  if not self.Owner:IsRealMonster() or self.Owner:IsPhantom() then
    return
  end
  return DataMgr.Monster[self.Owner.UnitId].DistructableId
end

function M:GetPlayerWeaponMontageTags()
  if not self.Owner:IsPlayer() or not self.Owner.InitSuccess then
    GWorld.logger.errorlog("\228\184\187\232\167\146\233\162\132\229\138\160\232\189\189\230\173\166\229\153\168\232\146\153\229\164\170\229\165\135\232\181\132\230\186\144, \232\142\183\229\143\150\230\149\176\230\141\174\229\164\177\232\180\165", self.Owner.CurrentRoleId, self.Owner.InitSuccess)
    return {}
  end
  local TmpWeaponIds = {}
  for _, Weapon in pairs(self.Owner.Weapons) do
    table.insert(TmpWeaponIds, Weapon.WeaponId)
  end
  local OutWeaponMontageTags = {}
  for _, Id in pairs(TmpWeaponIds) do
    local WeaponData = DataMgr.BattleWeapon[Id]
    if WeaponData then
      for _, Tag in pairs(WeaponData.WeaponTag) do
        if CommonUtils.HasValue(WeaponMontageTagsConfig, Tag) then
          table.insert(OutWeaponMontageTags, Tag)
        end
      end
    end
  end
  return OutWeaponMontageTags
end

function M:GetPhantomWeaponIds()
  local TmpWeaponIds = {}
  local Info = self.Owner.AvatarInfo
  if Info and Info.MeleeWeapon then
    table.insert(TmpWeaponIds, Info.MeleeWeapon.WeaponId)
  else
    table.insert(TmpWeaponIds, self.Owner:GetMeleeWeaponId())
  end
  if Info and Info.RangedWeapon then
    table.insert(TmpWeaponIds, Info.RangedWeapon.WeaponId)
  else
    table.insert(TmpWeaponIds, self.Owner:GetRangedWeaponId())
  end
  if Info and Info.UltraWeapon then
    table.insert(TmpWeaponIds, Info.UltraWeapon.WeaponId)
  else
    table.insert(TmpWeaponIds, self.Owner:GetUltraWeaponId())
  end
  table.insert(TmpWeaponIds, self.Owner:GetCondemnWeaponId())
  return TmpWeaponIds
end

return M
