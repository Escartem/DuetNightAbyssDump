local TemplateDumpUtils = require("BluePrints.Client.TemplateDumpUtils")
local BattleDumpUtils = {}

function BattleDumpUtils:GetInfoProxy(Info, ModData, ModSuit)
  local Proxy = setmetatable({ModData = ModData, ModSuit = ModSuit}, {__index = Info})
  return Proxy
end

function BattleDumpUtils:GetBattleInfoByInfo(Avatar, Info, bNotUseUWeapon)
  if Info.ReplaceAvatar then
    Avatar = Info.ReplaceAvatar
  end
  if not Avatar then
    return {}
  end
  Info = Info or {}
  local Char = Info.Char
  local MeleeWeapon = Info.MeleeWeapon
  local RangedWeapon = Info.RangedWeapon
  local AvatarInfo = {
    AvatarQuestRoleID = Info.AvatarQuestRoleID
  }
  if Char then
    local InfoProxy = self:GetInfoProxy(Info, Info.CharModData, Info.CharModSuit)
    AvatarInfo.RoleInfo = Char:BattleDump(Avatar, InfoProxy)
  else
    AvatarInfo.RoleInfo = {}
  end
  if MeleeWeapon then
    local InfoProxy = self:GetInfoProxy(Info, Info.MeleeWeaponModData, Info.MeleeWeaponModSuit)
    AvatarInfo.MeleeWeapon = MeleeWeapon:BattleDump(Avatar, InfoProxy)
  else
    AvatarInfo.MeleeWeapon = {}
  end
  if RangedWeapon then
    local InfoProxy = self:GetInfoProxy(Info, Info.RangedWeaponModData, Info.RangedWeaponModSuit)
    AvatarInfo.RangedWeapon = RangedWeapon:BattleDump(Avatar, InfoProxy)
  else
    AvatarInfo.RangedWeapon = {}
  end
  if Char then
    AvatarInfo.UltraWeapons = {}
    local UltraWeapons = Info.UltraWeapons or {}
    for Index, UltraWeaponInfo in ipairs(UltraWeapons) do
      local UltraWeapon = UltraWeaponInfo.UltraWeapon
      if UltraWeapon then
        local ModData
        if bNotUseUWeapon then
          ModData = {}
        else
          ModData = UltraWeaponInfo.ModData
        end
        local InfoProxy = self:GetInfoProxy(Info, ModData, UltraWeaponInfo.ModSuit)
        table.insert(AvatarInfo.UltraWeapons, UltraWeapon:BattleDump(Avatar, InfoProxy))
      end
    end
  else
    AvatarInfo.UltraWeapons = {}
  end
  AvatarInfo.WheelIndex = Info.WheelIndex
  local Pet = Info.Pet
  if Pet then
    AvatarInfo.Pet = Pet:BattleDump(Avatar)
  else
    AvatarInfo.Pet = {}
  end
  return AvatarInfo
end

function BattleDumpUtils:GetDefaultBattleInfo(Avatar, ExtraInfo)
  if not Avatar then
    return
  end
  ExtraInfo = ExtraInfo or {}
  local Info = {
    Char = ExtraInfo.Char or Avatar.Chars[Avatar.CurrentChar],
    MeleeWeapon = ExtraInfo.MeleeWeapon or Avatar.Weapons[Avatar.MeleeWeapon],
    RangedWeapon = ExtraInfo.RangedWeapon or Avatar.Weapons[Avatar.RangedWeapon],
    Pet = ExtraInfo.Pet or Avatar.Pets[Avatar.CurrentPet]
  }
  if Info.Char then
    Info.CharModSuit = Info.Char.ModSuitIndex
    Info.UltraWeapons = self:GetDefaultUltraWeaponInfo(Avatar, Info.Char)
  end
  if Info.MeleeWeapon then
    Info.MeleeWeaponModSuit = Info.MeleeWeapon.ModSuitIndex
  end
  if Info.RangedWeapon then
    Info.RangedWeaponModSuit = Info.RangedWeapon.ModSuitIndex
  end
  if ExtraInfo then
    for k, v in pairs(ExtraInfo) do
      Info[k] = v
    end
  end
  return self:GetBattleInfoByInfo(Avatar, Info)
end

function BattleDumpUtils:GetDefaultUltraWeaponInfo(Avatar, Char)
  if not Char then
    return {}
  end
  local UltraWeapons = {}
  for Index, Uuid in ipairs(Char.UWeaponEids) do
    local UltraWeapon = Avatar.UWeapons[Uuid]
    if UltraWeapon then
      table.insert(UltraWeapons, {
        UltraWeapon = UltraWeapon,
        ModSuit = UltraWeapon.ModSuitIndex
      })
    end
  end
  return UltraWeapons
end

function BattleDumpUtils:GetPhantomBattleInfo(Avatar, Char, Weapon, Pet, bNotUseUWeapon)
  local Info = {
    Char = Char,
    IsPhantom = true,
    Pet = Pet
  }
  if Weapon then
    if Weapon:IsMelee() then
      Info.MeleeWeapon = Weapon
    else
      Info.RangedWeapon = Weapon
    end
  end
  if Info.Char then
    Info.CharModSuit = Info.Char.ModSuitIndex
    Info.UltraWeapons = self:GetDefaultUltraWeaponInfo(Avatar, Info.Char)
  end
  if Info.MeleeWeapon then
    Info.MeleeWeaponModSuit = Info.MeleeWeapon.ModSuitIndex
  end
  if Info.RangedWeapon then
    Info.RangedWeaponModSuit = Info.RangedWeapon.ModSuitIndex
  end
  local AvatarInfo = self:GetBattleInfoByInfo(Avatar, Info, bNotUseUWeapon)
  AvatarInfo.Pet = {}
  return AvatarInfo
end

function BattleDumpUtils:GetCharBattleInfo(Avatar, Char, ExtraModSuitIndex)
  local Info = {Char = Char}
  if Info.Char then
    Info.CharModSuit = Info.Char.ModSuitIndex
  end
  if ExtraModSuitIndex then
    Info.CharModSuit = ExtraModSuitIndex
  end
  return self:GetBattleInfoByInfo(Avatar, Info)
end

function BattleDumpUtils:GetWeaponBattleInfo(Avatar, Weapon, ExtraModSuitIndex)
  local Info = {}
  if Weapon then
    if Weapon:IsMelee() then
      Info.MeleeWeapon = Weapon
      Info.MeleeWeaponModSuit = Info.MeleeWeapon.ModSuitIndex
      if ExtraModSuitIndex then
        Info.MeleeWeaponModSuit = ExtraModSuitIndex
      end
    else
      Info.RangedWeapon = Weapon
      Info.RangedWeaponModSuit = Info.RangedWeapon.ModSuitIndex
      if ExtraModSuitIndex then
        Info.RangedWeaponModSuit = ExtraModSuitIndex
      end
    end
  end
  return self:GetBattleInfoByInfo(Avatar, Info)
end

function BattleDumpUtils:GetSquadInfoByQuestRoleId(RoleId, Avatar)
  local RoleInfo = DataMgr.QuestRoleInfo[RoleId]
  if not RoleInfo then
    return
  end
  local ReplaceCharId
  if RoleInfo.ExStroyInfo ~= nil then
    local Sex = Avatar.Sex
    if RoleInfo.ExStroyInfo == "Player" then
      Sex = Avatar.Sex
    else
      Sex = Avatar.WeitaSex
    end
    ReplaceCharId = DataMgr.Player2RoleId[RoleInfo.ExStroyInfo][Sex]
  end
  local TemplateAvatarComponent = require("BluePrints.Client.TemplateAvatar.TemplateAvatarComponent")
  local TemplateAvatar = TemplateAvatarComponent()
  TemplateDumpUtils:CreateTemplate_Char(TemplateAvatar, RoleInfo.CharTemplateRuleId, ReplaceCharId, true)
  TemplateAvatar.MeleeWeapon = TemplateDumpUtils:CreateTemplate_Weapon(TemplateAvatar, RoleInfo.MeleeWeaponRuleId, true)
  TemplateAvatar.RangedWeapon = TemplateDumpUtils:CreateTemplate_Weapon(TemplateAvatar, RoleInfo.RangedWeaponRuleId, true)
  local Info = TemplateAvatar:GetSquadCreateInfoByNow()
  Info.AvatarQuestRoleID = RoleId
  return Info, TemplateAvatar
end

function BattleDumpUtils:GetSquadInfoByTemplate(Avatar, AvatarSquad, TrialSquad, PetId)
  local TemplateAvatarComponent = require("BluePrints.Client.TemplateAvatar.TemplateAvatarComponent")
  local TemplateAvatar = TemplateAvatarComponent()
  local ExtraSquad = {}
  if AvatarSquad.Char then
    TemplateAvatar.CurrentChar = AvatarSquad.Char
    TemplateAvatar.Chars[AvatarSquad.Char] = Avatar.Chars[AvatarSquad.Char]
  end
  if TrialSquad.Char then
    TemplateDumpUtils:CreateTemplate_Char(TemplateAvatar, TrialSquad.Char, nil, true)
  end
  if AvatarSquad.MeleeWeapon then
    TemplateAvatar.MeleeWeapon = AvatarSquad.MeleeWeapon
    TemplateAvatar.Weapons[AvatarSquad.MeleeWeapon] = Avatar.Weapons[AvatarSquad.MeleeWeapon]
  end
  if TrialSquad.MeleeWeapon then
    TemplateAvatar.MeleeWeapon = TemplateDumpUtils:CreateTemplate_Weapon(TemplateAvatar, TrialSquad.MeleeWeapon)
  end
  if AvatarSquad.RangedWeapon then
    TemplateAvatar.RangedWeapon = AvatarSquad.RangedWeapon
    TemplateAvatar.Weapons[AvatarSquad.RangedWeapon] = Avatar.Weapons[AvatarSquad.RangedWeapon]
  end
  if TrialSquad.RangedWeapon then
    TemplateAvatar.RangedWeapon = TemplateDumpUtils:CreateTemplate_Weapon(TemplateAvatar, TrialSquad.RangedWeapon)
  end
  if AvatarSquad.Phantom1 then
    TemplateAvatar.Chars[AvatarSquad.Phantom1] = Avatar.Chars[AvatarSquad.Phantom1]
    ExtraSquad.Phantom1 = AvatarSquad.Phantom1
  end
  if TrialSquad.Phantom1 then
    local Ok, Uuid = TemplateDumpUtils:CreateTemplate_Char(TemplateAvatar, TrialSquad.Phantom1, nil, false)
    if Ok then
      ExtraSquad.Phantom1 = Uuid
    end
  end
  if AvatarSquad.Phantom2 then
    TemplateAvatar.Chars[AvatarSquad.Phantom2] = Avatar.Chars[AvatarSquad.Phantom2]
    ExtraSquad.Phantom2 = AvatarSquad.Phantom2
  end
  if TrialSquad.Phantom2 then
    local Ok, Uuid = TemplateDumpUtils:CreateTemplate_Char(TemplateAvatar, TrialSquad.Phantom2, nil, false)
    if Ok then
      ExtraSquad.Phantom2 = Uuid
    end
  end
  if AvatarSquad.PhantomWeapon1 then
    TemplateAvatar.Weapons[AvatarSquad.PhantomWeapon1] = Avatar.Weapons[AvatarSquad.PhantomWeapon1]
    ExtraSquad.PhantomWeapon1 = AvatarSquad.PhantomWeapon1
  end
  if TrialSquad.PhantomWeapon1 then
    ExtraSquad.PhantomWeapon1 = TemplateDumpUtils:CreateTemplate_Weapon(TemplateAvatar, TrialSquad.PhantomWeapon1)
  end
  if AvatarSquad.PhantomWeapon2 then
    TemplateAvatar.Weapons[AvatarSquad.PhantomWeapon2] = Avatar.Weapons[AvatarSquad.PhantomWeapon2]
    ExtraSquad.PhantomWeapon2 = AvatarSquad.PhantomWeapon2
  end
  if TrialSquad.PhantomWeapon2 then
    ExtraSquad.PhantomWeapon2 = TemplateDumpUtils:CreateTemplate_Weapon(TemplateAvatar, TrialSquad.PhantomWeapon2)
  end
  ExtraSquad.Pet = TemplateDumpUtils:CreateTemplate_Pet(TemplateAvatar, PetId)
  return TemplateAvatar:GetSquadCreateInfoByNow(ExtraSquad), TemplateAvatar
end

function BattleDumpUtils:GetBattleInfoByQuestRoleId(RoleId, Avatar)
  local Info, TemplateAvatar = self:GetSquadInfoByQuestRoleId(RoleId, Avatar)
  return self:GetBattleInfoByInfo(TemplateAvatar, Info)
end

function BattleDumpUtils:UpdateBattleInfo(AvatarInfo, UpdateInfo)
  if not UpdateInfo then
    return AvatarInfo
  end
  if UpdateInfo.RoleInfo then
    for k, v in pairs(UpdateInfo.RoleInfo) do
      AvatarInfo.RoleInfo[k] = v
    end
  end
  if UpdateInfo.MeleeWeapon then
    for k, v in pairs(UpdateInfo.MeleeWeapon) do
      AvatarInfo.MeleeWeapon[k] = v
    end
  end
  if UpdateInfo.RangedWeapon then
    for k, v in pairs(UpdateInfo.RangedWeapon) do
      AvatarInfo.RangedWeapon[k] = v
    end
  end
  if UpdateInfo.UltraWeapons then
    AvatarInfo.UltraWeapons = AvatarInfo.UltraWeapons or {}
    for i, extraWeapon in pairs(UpdateInfo.UltraWeapons) do
      AvatarInfo.UltraWeapons[i] = AvatarInfo.UltraWeapons[i] or {}
      for k, v in pairs(extraWeapon) do
        AvatarInfo.UltraWeapons[i][k] = v
      end
    end
  end
  return AvatarInfo
end

return BattleDumpUtils
