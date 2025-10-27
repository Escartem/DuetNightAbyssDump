local CommonUtils = require("Utils.CommonUtils")
local Component = {}

function Component:GMAddChar(CharId, Level, Reason, NotLog, NeedEnhance)
  local info = DataMgr.Char[CharId] or DataMgr.BattleChar[CharId]
  if not info or 1 == info.GMNot then
    return
  end
  return self:AddChar(CharId, Level, Reason, true, NotLog, NeedEnhance)
end

function Component:AddChar(CharId, Level, Reason, GiveNotOpen, NotLog, NeedEnhance)
  return self:AddCharCommon(CharId, Level, Reason, GiveNotOpen, NotLog, NeedEnhance)
end

function Component:AddCharCommon(CharId, Level, Reason, GiveNotOpen, NotLog, NeedEnhance)
  self.logger.debug("AddCharCommon", CharId, Level, Reason)
  GiveNotOpen = GiveNotOpen or false
  local info = DataMgr.Char[CharId] or DataMgr.BattleChar[CharId]
  if not info or info.IsNotOpen and not GiveNotOpen then
    return
  end
  if not DataMgr.LevelUp[Level] then
    return
  end
  local ResultEid
  local CommonChar = self.CommonChars[CharId]
  if not CommonChar then
    self:AddCommonChar(CharId)
    ResultEid = self:RealAddChar(CharId, Level, NeedEnhance, Reason)
  elseif 0 == CommonChar.Count then
    CommonChar:AddOne()
    ResultEid = self:RealAddChar(CharId, Level, NeedEnhance, Reason)
  end
  return ResultEid
end

function Component:AddCommonChar(CharId)
  local CommonChar = self.CommonChars:GetNewCommonChar(CharId)
  if self.OtherCharSkins[CharId] then
    for _, SkinId in ipairs(self.OtherCharSkins[CharId]) do
      self:AddCommonCharSkin(CommonChar, SkinId, DataMgr.ReasonTypeGet.OTHER_CHAR_SKIN)
    end
    self.OtherCharSkins[CharId] = nil
  end
  self.CommonChars[CharId] = CommonChar
end

function Component:AddCommonCharSkin(CommonChar, SkinId, Reason)
  if not CommonChar then
    return
  end
  if not CommonUtils.HasValue(CommonChar.SkinIds, SkinId) then
    return
  end
  if CommonChar.OwnedSkins[SkinId] ~= nil then
    return
  end
  CommonChar.OwnedSkins:GetNewSkin(SkinId, CommonConst.SkinType.Char)
end

function Component:RealAddChar(CharId, Level, NeedEnhance, Reason)
  local uuid = bson.objectid()
  self.logger.debug("ZJT_ RealAddChar ", CommonUtils.ObjId2Str(uuid))
  local char = self.Chars:NewChar(uuid, CharId, Level)
  char:HandleSetLevel(Level, NeedEnhance)
  self:CharInitUltraWeapon(char, Level, DataMgr.ReasonTypeGet.WEAPON_ADDCHAR)
  self:InitCharSetCharAppearanceAccessory(char, Reason)
  self.Chars[char.Uuid] = char
  return char.Uuid
end

function Component:GMAddSkin(SkinId, Reason)
  local SkinInfo = DataMgr.Skin[SkinId]
  if not SkinInfo or not SkinInfo.CharId then
    return
  end
  if 1 == SkinInfo.GMNot then
    return
  end
  self:AddSkin(SkinId, Reason, true)
end

function Component:AddSkin(SkinId, Reason, GiveNotOpen)
  GiveNotOpen = GiveNotOpen or false
  local SkinInfo = DataMgr.Skin[SkinId]
  if not SkinInfo or not SkinInfo.CharId then
    return
  end
  if SkinInfo.IsNotOpen and not GiveNotOpen then
    return
  end
  local CharId = SkinInfo.CharId
  local CommonChar = self.CommonChars[CharId]
  if not CommonChar then
    self:AddOtherCharSkin(CharId, SkinId, Reason)
  else
    self:AddCommonCharSkin(CommonChar, SkinId, Reason)
    self.CommonChars[CharId] = CommonChar
  end
end

function Component:AddCommonCharSkin(CommonChar, SkinId, Reason)
  if not CommonChar then
    return
  end
  if not CommonUtils.HasValue(CommonChar.SkinIds, SkinId) then
    return
  end
  if CommonChar.OwnedSkins[SkinId] ~= nil then
    return
  end
  CommonChar.OwnedSkins:GetNewSkin(SkinId, CommonConst.SkinType.Char)
end

function Component:AddOtherCharSkin(CharId, SkinId, Reason)
  local CharInfo = DataMgr.Char[CharId]
  if not CharInfo then
    return
  end
  if not CommonUtils.HasValue(CharInfo.SkinId, SkinId) then
    return
  end
  local OtherCharSkin = self.OtherCharSkins[CharId]
  OtherCharSkin = OtherCharSkin or self.OtherCharSkins:NewIntList()
  if OtherCharSkin:HasValue(SkinId) then
    return
  end
  OtherCharSkin:Append(SkinId)
  self.OtherCharSkins[CharId] = OtherCharSkin
end

return Component
