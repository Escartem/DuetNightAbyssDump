local AvatarUtils = require("BluePrints.Client.AvatarUtils")
local Component = {}

function Component:CharInitUltraWeapon(Char, Level, ReasonId)
  if not Char or not Char.UWeapon then
    return
  end
  for i, v in ipairs(Char.UWeapon) do
    Char.UWeaponEids:Append(self:AddUWeapon(v, Level, Char.EnhanceLevel, ReasonId))
  end
  if Char.UWeaponEids:Length() > 0 then
    Char.ProminentWeapon = Char.UWeaponEids[1]
  end
end

function Component:AddUWeapon(WeaponId, Level, EnhanceLevel, Reason)
  local info = DataMgr.UWeapon[WeaponId]
  if not info or not DataMgr.WeaponLevelUp[Level] then
    return
  end
  local uuid = bson.objectid()
  local weapon = self.UWeapons:NewWeapon(uuid, WeaponId, Level)
  weapon.EnhanceLevel = EnhanceLevel
  weapon:UnlockModSlotAfterUWeaponBreakUp()
  self.UWeapons[weapon.Uuid] = weapon
  return weapon.Uuid
end

function Component:GMAddWeapon(WeaponId, Level, Reason, NotLog, NeedEnhance)
  local info = DataMgr.Weapon[WeaponId]
  if not info or 1 == info.GMNot then
    return
  end
  return self:AddWeapon(WeaponId, Level, Reason, true, NotLog, NeedEnhance)
end

function Component:AddWeapon(WeaponId, Level, Reason, GiveNotOpen, NotLog, NeedEnhance)
  self.logger.info("AddWeapon", WeaponId, Level, Reason)
  return self:AddWeaponCommon(WeaponId, Level, Reason, GiveNotOpen, NotLog, NeedEnhance)
end

function Component:AddWeaponCommon(WeaponId, Level, Reason, GiveNotOpen, NotLog, NeedEnhance)
  GiveNotOpen = GiveNotOpen or false
  NotLog = NotLog or false
  local info = DataMgr.Weapon[WeaponId]
  if not info or info.IsNotOpen and not GiveNotOpen then
    return
  end
  if not DataMgr.WeaponLevelUp[Level] then
    return
  end
  return self:RealAddWeapon(WeaponId, Level, Reason, GiveNotOpen, NotLog, NeedEnhance)
end

function Component:RealAddWeapon(WeaponId, Level, Reason, GiveNotOpen, NotLog, NeedEnhance)
  local uuid = bson.objectid()
  local weapon = self.Weapons:NewWeapon(uuid, WeaponId, Level)
  if nil == NeedEnhance or 1 == NeedEnhance then
    NeedEnhance = true
  else
    NeedEnhance = false
  end
  if nil ~= DataMgr.WeaponBreak[WeaponId] then
    local WeaponBreak = DataMgr.WeaponBreak[WeaponId]
    for i = 1, #WeaponBreak do
      if NeedEnhance then
        if Level >= WeaponBreak[i].WeaponBreakLevel then
          weapon.EnhanceLevel = WeaponBreak[i].WeaponBreakNum
        end
      elseif Level > WeaponBreak[i].WeaponBreakLevel then
        weapon.EnhanceLevel = WeaponBreak[i].WeaponBreakNum
      end
    end
  end
  self:UnlockModSlotAfterWeaponBreakUp(weapon)
  self.Weapons[weapon.Uuid] = weapon
  return uuid
end

function Component:UnlockModSlotAfterWeaponBreakUp(Weapon)
  local WeaponInfo = DataMgr.Weapon[Weapon.WeaponId]
  if WeaponInfo and WeaponInfo.ModSlot and WeaponInfo.ModSlotUnlock then
    for ModSlotId = 1, #WeaponInfo.ModSlotUnlock do
      if WeaponInfo.ModSlotUnlock[ModSlotId] <= Weapon.EnhanceLevel then
        AvatarUtils:UnLockModSlot(Weapon, ModSlotId)
      end
    end
  end
end

return Component
