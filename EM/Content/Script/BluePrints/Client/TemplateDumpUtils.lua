local CharCom = require("BluePrints.Client.CustomTypes.Character")
local WeaponCom = require("BluePrints.Client.CustomTypes.Weapon")
local ModCom = require("BluePrints.Client.CustomTypes.Mod")
local CharacterCommon = require("BluePrints.Client.CustomTypes.CharacterCommon")
local TemplateDumpUtils = {}

function TemplateDumpUtils:AddTemplateChar(TemplateRuleId, ReplaceCharId)
  local CharInfo = DataMgr.CharTemplate[TemplateRuleId]
  if not CharInfo then
    return
  end
  local Char = CharCom.CharDict:NewChar(-1, ReplaceCharId or CharInfo.CharId, CharInfo.CharLevel)
  local NeedEnhance = false
  if CharInfo.NeedEnhance == nil or 1 == CharInfo.NeedEnhance then
    NeedEnhance = true
  else
    NeedEnhance = false
  end
  if nil ~= DataMgr.CharBreak[CharInfo.CharId] then
    local CharBreak = DataMgr.CharBreak[CharInfo.CharId]
    for i = 1, #CharBreak do
      if NeedEnhance then
        if Char.Level >= CharBreak[i].CharBreakLevel then
          Char.EnhanceLevel = CharBreak[i].CharBreakNum
        end
      elseif Char.Level > CharBreak[i].CharBreakLevel then
        Char.EnhanceLevel = CharBreak[i].CharBreakNum
      end
    end
  end
  self:TemplateHandleCharSkill(Char, CharInfo)
  local ModData = {}
  local CharacterCommon = {}
  if nil ~= CharInfo.ModId then
    for i, ModId in ipairs(CharInfo.ModId) do
      local Mod = ModCom.ModDict:NewMod(-1, ModId, CharInfo.ModLevel[i])
      table.insert(ModData, Mod)
      local ModInfo = DataMgr.Mod[ModId]
      AvatarUtils:SetModSlotPolarity(Char, i, ModInfo.Polarity)
    end
  end
  if CharInfo.CharCostumeId then
    local CharCostumeInfo = DataMgr.CharCostumeTemplate[CharInfo.CharCostumeId]
    if CharCostumeInfo then
      CharacterCommon[Char.CharId] = self:AddTemplateChar_CreateCommonChar(Char, CharCostumeInfo)
    end
  end
  return Char, ModData, CharacterCommon
end

function TemplateDumpUtils:AddTemplateChar_CreateCommonChar(Char, CharCostumeInfo)
  local CharacterCommon = CharacterCommon.CommonCharDict:NewCommonChar(Char.CharId)
  local AppearanceSuit = Char.AppearanceSuits[Char.CurrentAppearanceIndex]
  local SkinInfo = DataMgr.Skin[CharCostumeInfo.SkinId]
  if SkinInfo then
    AppearanceSuit.SkinId = CharCostumeInfo.SkinId or Char:GetDefaultSkinId()
    CharacterCommon:AddSkin(AppearanceSuit.SkinId)
    local Skin = CharacterCommon:GetSkin(CharCostumeInfo.SkinId)
    if CharCostumeInfo.ColorId then
      for _, ColorId in ipairs(CharCostumeInfo.ColorId) do
        if DataMgr.Swatch[ColorId] and _ <= DataMgr.GlobalConstant.CharColorPart.ConstantValue then
          Skin.Colors[_] = ColorId
        end
      end
    end
  end
  return CharacterCommon
end

function TemplateDumpUtils:AddTemplateWeapon(TemplateRuleId)
  local WeaponInfo = DataMgr.WeaponTemplate[TemplateRuleId]
  if not WeaponInfo then
    return
  end
  local Weapon = WeaponCom.WeaponDict:NewWeapon(-1, WeaponInfo.WeaponId, WeaponInfo.WeaponLevel)
  Weapon:HandleSetLevel(WeaponInfo.WeaponLevel, WeaponInfo.NeedEnhance)
  local ModData = {}
  if WeaponInfo.ModId ~= nil then
    for i, ModId in ipairs(WeaponInfo.ModId) do
      local Mod = ModCom.ModDict:NewMod(-1, ModId, WeaponInfo.ModLevel[i])
      table.insert(ModData, Mod)
      local ModInfo = DataMgr.Mod[ModId]
      AvatarUtils:SetModSlotPolarity(Weapon, i, ModInfo.Polarity)
    end
  end
  if WeaponInfo.WeaponCostumeId then
    local WeaponCostumeInfo = DataMgr.WeaponCostumeTemplate[WeaponInfo.WeaponCostumeId]
    if WeaponCostumeInfo then
      local AppearanceSuit = Weapon:GetAppearance()
      if WeaponCostumeInfo.SkinId then
        Weapon:AddSkin(WeaponCostumeInfo.SkinId)
      end
      local NewSkin = Weapon:GetSkin(WeaponCostumeInfo.SkinId) or Weapon:GetSkin(Weapon.WeaponId)
      AppearanceSuit.SkinId = NewSkin.SkinId
      AppearanceSuit.Accessory[1] = WeaponCostumeInfo.WeaponAccessory
      if WeaponCostumeInfo.WeaponSpecialColor then
        NewSkin.SpecialColor = WeaponCostumeInfo.WeaponSpecialColor
      elseif WeaponCostumeInfo.WeaponColor then
        for _, ColorId in ipairs(WeaponCostumeInfo.WeaponColor) do
          NewSkin.Colors[_] = ColorId
        end
      end
    end
  end
  return Weapon, ModData
end

function TemplateDumpUtils:AddTemplateUltraWeapon(Char, UltraWeaponId, TemplateRuleId, Index)
  local CharInfo = DataMgr.CharTemplate[TemplateRuleId]
  if not CharInfo then
    return
  end
  local Weapon = WeaponCom.UWeaponDict:NewWeapon(-1, UltraWeaponId, Char.Level)
  Weapon.EnhanceLevel = Char.EnhanceLevel
  local WeaponData = DataMgr.BattleWeapon[Weapon.WeaponId]
  for _, Skill in ipairs(Char.Skills) do
    if WeaponData and WeaponData.InheritSkillId and Skill.SkillId == WeaponData.InheritSkillId then
      Weapon.InheritSkillLevel = Skill.Level
      Weapon.InheritSkillExtraLevel = Skill.ExtraLevel
    end
  end
  local ModData = {}
  local UltraWeaponModId = CharInfo.UltraWeaponModId or {}
  local UltraWeaponModLevel = CharInfo.UltraWeaponModLevel or {}
  local ModIdList = UltraWeaponModId[Index]
  local ModLevelList = UltraWeaponModLevel[Index]
  if ModIdList then
    for i, ModId in ipairs(ModIdList) do
      local Mod = ModCom.ModDict:NewMod(-1, ModId, ModLevelList[i] or 1)
      table.insert(ModData, Mod)
      local ModInfo = DataMgr.Mod[ModId]
      AvatarUtils:SetModSlotPolarity(Weapon, i, ModInfo.Polarity)
    end
  end
  return Weapon, ModData
end

function TemplateDumpUtils:CreateTemplate_ModSuit(Target, TemplateModInfo, Avatar)
  local mod_suit_1 = Target.ModSuit_1
  if not TemplateModInfo.ModId then
    return
  end
  for index, mod_id in ipairs(TemplateModInfo.ModId) do
    local level = TemplateModInfo.ModLevel[index]
    if mod_id and level then
      local ModUuid = Avatar:GMAddMod(mod_id, level)
      local mod_info = DataMgr.Mod[mod_id]
      AvatarUtils:SetModSlotPolarity(Target, index, mod_info.Polarity)
      mod_suit_1[index] = ModUuid
    end
  end
end

function TemplateDumpUtils:TemplateHandleCharSkill(Char, TemplateInfo)
  Char:GMSetSkillLevel(TemplateInfo.SkillLevel or 1, TemplateInfo.NeedEnhance)
  if TemplateInfo.SkillTreeUnlock then
    for TreeIndex, TreeNodeData in pairs(TemplateInfo.SkillTreeUnlock) do
      local SkillTree = Char.SkillTree[TreeIndex]
      if SkillTree then
        for index, NodeIndex in pairs(TreeNodeData) do
          local SkillTreeNode = SkillTree[NodeIndex]
          local NeedUnlock = true
          if SkillTreeNode then
            local LastSkillTreeNode = SkillTree[NodeIndex - 1]
            if LastSkillTreeNode and LastSkillTreeNode:IsLocked() then
              NeedUnlock = false
            end
            local SkillTreeUnlockInfo
            if DataMgr.SkillTreeNode2SkillTreeUnlock[Char.CharId] and DataMgr.SkillTreeNode2SkillTreeUnlock[Char.CharId][TreeIndex] and DataMgr.SkillTreeNode2SkillTreeUnlock[Char.CharId][TreeIndex][NodeIndex] then
              SkillTreeUnlockInfo = DataMgr.SkillTreeNode2SkillTreeUnlock[Char.CharId][TreeIndex][NodeIndex]
            else
              NeedUnlock = false
            end
            if SkillTreeUnlockInfo.NeedLevel and Char.Level < SkillTreeUnlockInfo.NeedLevel then
              NeedUnlock = false
            end
            if SkillTreeUnlockInfo.NeedBreak and Char.EnhanceLevel < SkillTreeUnlockInfo.NeedBreak then
              NeedUnlock = false
            end
            if NeedUnlock and SkillTreeNode:IsLocked() then
              SkillTreeNode:UnLock()
            end
          end
        end
      end
    end
  end
end

function TemplateDumpUtils:CreateTemplate_UWeaponModSuit(UWeapon, ModIndex, CharTemplateInfo, Avatar)
  local UltraWeaponModId = CharTemplateInfo.UltraWeaponModId[ModIndex]
  local w_mod_suit = AvatarUtils:GetTargetModSuit(UWeapon, UWeapon.ModSuitIndex)
  for index, mod_id in ipairs(UltraWeaponModId) do
    local level = CharTemplateInfo.UltraWeaponModLevel[ModIndex][index]
    if mod_id and level then
      local ModUuid = Avatar:GMAddMod(mod_id, level)
      local mod_info = DataMgr.Mod[mod_id]
      AvatarUtils:SetModSlotPolarity(UWeapon, index, mod_info.Polarity)
      w_mod_suit[index] = ModUuid
    end
  end
  return UWeapon
end

function TemplateDumpUtils:CreateTemplate_Char(Avatar, CharTemplateId, ReplaceCharId, IsSetCurrentChar)
  local CharTemInfo = DataMgr.CharTemplate[CharTemplateId]
  if not CharTemInfo then
    return false
  end
  return self:CreateTemplate_InternalChar(Avatar, CharTemInfo, ReplaceCharId or CharTemInfo.CharId, IsSetCurrentChar)
end

function TemplateDumpUtils:CreateTemplate_InternalChar(Avatar, CharTemInfo, CharId, IsSetCurrentChar)
  local IsCurrentChar = false
  if 1101 == CharId then
    local CurrentChar = Avatar.Chars[Avatar.CurrentChar]
    if CurrentChar.CharId == CharId then
      IsCurrentChar = true
    end
    Avatar:DelChar(1101, DataMgr.ReasonTypeConsume.GM_CONSUME)
  end
  local need_enhance = CharTemInfo.NeedEnhance or 0
  local char_eid = Avatar:GMAddChar(CharId, CharTemInfo.CharLevel, DataMgr.ReasonTypeGet.GM, nil, need_enhance)
  if not char_eid then
    return false
  end
  if IsCurrentChar then
    Avatar.CurrentChar = char_eid
  end
  if IsSetCurrentChar then
    Avatar.CurrentChar = char_eid
  end
  local char = Avatar.Chars[char_eid]
  self:CreateTemplate_ModSuit(char, CharTemInfo, Avatar)
  self:TemplateHandleCharSkill(char, CharTemInfo)
  for i, p_weapon_eid in ipairs(char.UWeaponEids) do
    if CharTemInfo.UltraWeaponModId and CharTemInfo.UltraWeaponModId[i] then
      local weapon = Avatar.UWeapons[p_weapon_eid]
      self:CreateTemplate_UWeaponModSuit(weapon, i, CharTemInfo, Avatar)
      Avatar.UWeapons[p_weapon_eid] = weapon
    end
  end
  for _, skill in ipairs(char.Skills) do
    self:HandleWeaponSkillLevelInheritCharSkillLevel(char, Avatar, skill)
  end
  self:CreateTemplate_CharCostumeId(CharTemInfo, char, Avatar)
  Avatar.Chars[char_eid] = char
  return true, char_eid
end

function TemplateDumpUtils:HandleWeaponSkillLevelInheritCharSkillLevel(Char, Avatar, Skill)
  for i, v in ipairs(Char.UWeaponEids) do
    local UWeapon = Avatar.UWeapons[v]
    if UWeapon then
      UWeapon:WeaponSkillLevelInheritCharSkillLevel(Skill)
    end
  end
end

function TemplateDumpUtils:CreateTemplate_Pet(Avatar, PetId)
  local PetConf = DataMgr.Pet[PetId]
  if not PetConf then
    return
  end
  return Avatar:GMAddPet(PetId)
end

function TemplateDumpUtils:CreateTemplate_Weapon(Avatar, WeaponTemplateId)
  local weapon_tem_info = DataMgr.WeaponTemplate[WeaponTemplateId]
  if not weapon_tem_info then
    return
  end
  local need_enhance = weapon_tem_info.NeedEnhance or 0
  local weapon_eid = Avatar:GMAddWeapon(weapon_tem_info.WeaponId, weapon_tem_info.WeaponLevel, DataMgr.ReasonTypeGet.GM, nil, need_enhance)
  if not weapon_eid then
    return
  end
  local weapon = Avatar.Weapons[weapon_eid]
  self:CreateTemplate_ModSuit(weapon, weapon_tem_info, Avatar)
  self:CreateTemplate_WeaponCostumeId(weapon_tem_info, weapon, Avatar)
  Avatar.Weapons[weapon_eid] = weapon
  return weapon_eid
end

function TemplateDumpUtils:CreateTemplate_SetCharSkin(Target, TargetCostumeInfo)
  local AppearanceSuit = Target.AppearanceSuits[Target.CurrentAppearanceIndex]
  local SkinInfo = DataMgr.Skin[TargetCostumeInfo.SkinId]
  if SkinInfo then
    AppearanceSuit.SkinId = TargetCostumeInfo.SkinId
  end
  return AppearanceSuit
end

function TemplateDumpUtils:CreateTemplate_SetAccessory(AppearanceSuit, CharCostumeInfo)
  local CharAccessoryIds = {}
  for Name, Index in pairs(CommonConst.NewCharAccessoryTypes) do
    local CharAccessoryName = Name .. "Accessory"
    if CharCostumeInfo[CharAccessoryName] then
      AppearanceSuit.Accessory[Index] = CharCostumeInfo[CharAccessoryName]
      table.insert(CharAccessoryIds, Index)
    end
  end
  return CharAccessoryIds
end

function TemplateDumpUtils:CreateTemplate_CharCostumeId(CharInfo, Char, Avatar)
  if not CharInfo.CharCostumeId then
    return
  end
  local CharCostumeInfo = DataMgr.CharCostumeTemplate[CharInfo.CharCostumeId]
  if not CharCostumeInfo then
    return
  end
  Avatar:GMAddSkin(CharCostumeInfo.SkinId, DataMgr.ReasonTypeGet.GM)
  local AppearanceSuit = self:CreateTemplate_SetCharSkin(Char, CharCostumeInfo)
  local CharAccessoryIds = self:CreateTemplate_SetAccessory(AppearanceSuit, CharCostumeInfo)
  for _, CharAccessoryId in ipairs(CharAccessoryIds) do
    Avatar:GMAddAccessory(CharAccessoryId, DataMgr.ReasonTypeGet.GM)
  end
  local SkinId = CharCostumeInfo.SkinId or Char:GetDefaultSkinId()
  local CommonChar = Avatar.CommonChars[Char.CharId]
  local TargetSkin = CommonChar:GetSkin(SkinId)
  local NewColorWithPart = CharCostumeInfo.ColorId or {}
  for Part, ColorId in pairs(NewColorWithPart) do
    local ColorInfo = DataMgr.Swatch[ColorId]
    Avatar.logger.debug("ZJT_ Part ", Part, ColorId, nil == ColorInfo)
    if ColorInfo and ColorInfo.ResourceID then
      TargetSkin.Colors[Part] = ColorId
      Avatar.logger.debug("ZJT_ Part ", Part, ColorId, nil == ColorInfo)
    end
  end
  Avatar.CommonChars[Char.CharId] = CommonChar
end

function TemplateDumpUtils:CreateTemplate_WeaponCostumeId(WeaponInfo, Weapon, Avatar)
  local WeaponCostumeInfo = DataMgr.WeaponCostumeTemplate[WeaponInfo.WeaponCostumeId]
  if not WeaponCostumeInfo then
    return
  end
  Avatar:GMAddWeaponSkin(WeaponCostumeInfo.SkinId, DataMgr.ReasonTypeGet.GM)
  local AppearanceSuit = Weapon:GetAppearance()
  local SkinInfo = DataMgr.WeaponSkin[WeaponCostumeInfo.SkinId]
  if WeaponCostumeInfo.SkinId then
    Weapon:AddSkin(WeaponCostumeInfo.SkinId)
  end
  local NewSkin = Weapon:GetSkin(WeaponCostumeInfo.SkinId) or Weapon:GetSkin(Weapon.WeaponId)
  if SkinInfo then
    AppearanceSuit.SkinId = NewSkin.SkinId
  end
  if WeaponCostumeInfo.WeaponAccessory then
    AppearanceSuit.Accessory[1] = WeaponCostumeInfo.WeaponAccessory
    Avatar:GMAddWeaponAccessory(WeaponCostumeInfo.WeaponAccessory, DataMgr.ReasonTypeGet.GM)
  end
  local DefaultColor = DataMgr.GlobalConstant.WeaponDefaultColor.ConstantValue
  if WeaponCostumeInfo.WeaponSpecialColor then
    local MaxPart = DataMgr.GlobalConstant.WeaponColorPart.ConstantValue
    for i = 1, MaxPart do
      NewSkin.Colors[i] = DefaultColor
    end
    NewSkin.SpecialColor = WeaponCostumeInfo.WeaponSpecialColor
  elseif WeaponCostumeInfo.WeaponColor then
    NewSkin.SpecialColor = DefaultColor
    for Part, ColorId in pairs(WeaponCostumeInfo.WeaponColor) do
      NewSkin.Colors[Part] = ColorId
    end
  end
end

return TemplateDumpUtils
