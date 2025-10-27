local Component = {}

function Component:GetTableAttrNames_Lua()
  return {
    "Attribute",
    "BaseOverShield",
    "OverShieldLevelGrow",
    "CRI",
    "CRD",
    "AttackSpeed_Normal",
    "AttackSpeed_Reload",
    "AttackRange_Normal",
    "AttackRange_RayLength",
    "SkillSpeed",
    "Sp",
    "MaxSp",
    "SpRecoverTime",
    "SpRecoverRate",
    "SpRecoverValue",
    "SpRate",
    "CollisionLevel",
    "SecondSp",
    "MaxSecondSp",
    "SkillRange",
    "SkillSustain",
    "SkillEfficiency",
    "SkillIntensity",
    "BreakCount",
    "PlayerDamagedRate",
    "MonsterDamageRate",
    "TN",
    "MaxTN",
    "TNResistance",
    "TNRecoverS",
    "TNRecoverTimeB",
    "TNRecoverTimeZ",
    "BossTNToZeroRecoverSpeed",
    "TriggerProbability",
    "MultiShoot",
    "BulletSpeed",
    "RayLength",
    "BulletType",
    "BulletMax",
    "BulletInit",
    "BulletConver",
    "MagazineCapacity",
    "MaxComboCount",
    "ComboHoldTime",
    "ESRecoverRate",
    "ESRecoverValue",
    "ESRecoverTime",
    "MoveSpeedAddRate",
    "MaxAvoidExecuteTimes",
    "AvoidChargeCd",
    "DropDistance"
  }
end

function Component:SetReplaceAttrs(ReplaceAttrs)
  local FromSkynet = true
  for AttrName, Value in pairs(ReplaceAttrs.TotalValues or {}) do
    local CardValue = (ReplaceAttrs.CardValues or {})[AttrName]
    local CardLevelValue = (ReplaceAttrs.CardLevelValues or {})[AttrName]
    local ModRateValue = (ReplaceAttrs.ModRateValues or {})[AttrName]
    local ModAddValue = (ReplaceAttrs.ModAddValues or {})[AttrName]
    self:FillReplaceAttr(AttrName, CardValue, CardLevelValue, ModRateValue, ModAddValue, FromSkynet)
  end
end

function Component:SetTableAttr(ReplaceAttrs)
  self:SetTableAttrCpp()
  if ReplaceAttrs then
    self:SetReplaceAttrs(ReplaceAttrs)
  else
    self:FillLevelAttrs()
  end
  self:AfterSetTableAttr()
end

function Component:InitAllWeaponModifier(ReplaceAttrs)
  if not ReplaceAttrs then
    return
  end
  for AttrName, Value in pairs(ReplaceAttrs.TotalValues or {}) do
    self:SetAllWeaponModifier(AttrName)
  end
end

return Component
