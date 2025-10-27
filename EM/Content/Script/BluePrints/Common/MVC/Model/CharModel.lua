local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class()
local _CardLevelResourceToUuid = {}
local _CardLevelResourceToCharId = {}
local _UuidToCardLevelResourceId = {}
local _SkinIdToCharId = {}
local _CharAccessoryMap = {}
local _CharReward = {
  CharBreak = {}
}
local _CharIdToUuid = {}
local _UuidToCharId = {}
local _DefaultAccessories = {
  [DataMgr.GlobalConstant.DefautFXDead.ConstantValue] = true,
  [DataMgr.GlobalConstant.DefautFXTeleport.ConstantValue] = true
}

local function MappingChar(Char)
  if nil == Char then
    return
  end
  _CharIdToUuid[Char.CharId] = Char.Uuid
  _UuidToCharId[Char.Uuid] = Char.CharId
  local CardLevelUpData = DataMgr.CharCardLevelUp[Char.CharId]
  local Rid = CardLevelUpData and CardLevelUpData[0] and CardLevelUpData[0].ResourceId1
  if Rid then
    _CardLevelResourceToUuid[Rid] = Char.Uuid
    _UuidToCardLevelResourceId[Char.Uuid] = Rid
    return true
  end
end

local function MappingCardLevelResource2CharId()
  _CardLevelResourceToCharId = {}
  for CharId, value in pairs(DataMgr.CharCardLevelUp) do
    local Rid = value[0] and value[0].ResourceId1
    if Rid then
      _CardLevelResourceToCharId[Rid] = CharId
    end
  end
end

local function MappingSkin(CommonChar)
  if nil == CommonChar then
    return
  end
  local CharId = CommonChar.CharId
  for SkinId, Skin in pairs(CommonChar.OwnedSkins or {}) do
    _SkinIdToCharId[SkinId] = CharId
  end
end

local function MappingReward(Avatar)
  local Strings, CharId
  for Keys, _ in pairs(Avatar.StoredCollectReward or {}) do
    Strings = string.split(Keys, ".")
    if _CharReward[Strings[1]] and Strings[2] and Strings[3] then
      CharId = tonumber(Strings[2])
      if DataMgr.Char[CharId] then
        _CharReward[Strings[1]][CharId] = _CharReward[Strings[1]][CharId] or {}
        _CharReward[Strings[1]][CharId][Strings[3]] = true
      end
    end
  end
end

function M:GetCharIdBySkinId(SkinId)
  return _SkinIdToCharId[SkinId]
end

function M:GetUuidByCardLevelResource(ResourceId)
  return _CardLevelResourceToUuid[ResourceId]
end

function M:GetUuidByCharId(CharId)
  return _CharIdToUuid[CharId]
end

function M:GetCharIdByCardLevelResource(ResourceId)
  return _CardLevelResourceToCharId[ResourceId]
end

function M:IsCharHasReward(CharId)
  local CharBreak = _CharReward.CharBreak[CharId]
  if CharBreak and next(CharBreak) then
    return true
  end
  return false
end

function M:GetCharRewardInfo()
  return _CharReward
end

function M:Init(Avatar)
  _UuidToCardLevelResourceId = {}
  _CardLevelResourceToUuid = {}
  _SkinIdToCharId = {}
  _CharAccessoryMap = {}
  _CharReward = {
    CharBreak = {}
  }
  _CharIdToUuid = {}
  _UuidToCharId = {}
  if not Avatar then
    return
  end
  if Avatar.Chars then
    for Uuid, Char in pairs(Avatar.Chars) do
      MappingChar(Char)
      MappingSkin(Avatar.CommonChars[Char.CharId])
    end
  end
  MappingCardLevelResource2CharId()
  if Avatar.CharAccessory then
    for AccessoryId, value in pairs(Avatar.CharAccessory) do
      _CharAccessoryMap[AccessoryId] = true
    end
  end
  MappingReward(Avatar)
  EventManager:AddEvent(EventID.OnCharCardLevelResourcesChanged, self, self.OnCharCardLevelResourcesChanged)
  EventManager:AddEvent(EventID.OnNewCharObtained, self, self.OnNewCharObtained)
  EventManager:AddEvent(EventID.OnCharDeleted, self, self.OnCharDeleted)
  EventManager:AddEvent(EventID.OnNewCharSkinObtained, self, self.OnNewCharSkinObtained)
  EventManager:AddEvent(EventID.OnNewCharAccessoryObtained, self, self.OnNewCharAccessoryObtained)
  ArmoryUtils:CreateReddotInfos(CommonConst.DataType.Char)
  ArmoryUtils:CreateReddotInfos(CommonConst.DataType.Char .. ArmoryUtils.ArmorySubTabNames.Appearance)
  ArmoryUtils:CreateReddotInfos(CommonConst.DataType.Char .. Const.Skill)
  ArmoryUtils:CreateReddotInfos(ArmoryUtils.FilesTabType[1])
  ArmoryUtils:CreateReddotInfos(ArmoryUtils.FilesTabType[2])
end

function M:GetCardLevelResourceByUuid(Uuid)
  return _UuidToCardLevelResourceId[Uuid]
end

function M:OnCharCardLevelResourcesChanged(ResourceId, CharId, CharUuid)
  local Avatar = GWorld:GetAvatar()
  local Char = Avatar.Chars[CharUuid]
  if Char then
    ArmoryUtils:SetItemReddotRead({
      ItemType = CommonConst.DataType.Char,
      Uuid = CharUuid
    }, false, true)
    ArmoryUtils:TryAddNewCharReddot(Char, CommonUtils.ObjId2Str(CharUuid))
  else
    ArmoryUtils:TryAddUnlockableCharReddot(CharId)
  end
end

function M:OnNewCharObtained(CharUuid)
  local Avatar = GWorld:GetAvatar()
  local Char = Avatar.Chars[CharUuid]
  if Char then
    MappingChar(Char)
    ArmoryUtils:_SetReddotReadCommon(Char.CharId, DataMgr.ReddotNode.UnlockableChar.Name, true)
    ArmoryUtils:TryAddNewCharReddot(Char, CommonUtils.ObjId2Str(CharUuid))
  end
end

function M:OnCharDeleted(CharUuid)
  local CardLevelResourceId = _UuidToCardLevelResourceId[CharUuid]
  if CardLevelResourceId then
    local CharId = self:GetCharIdByCardLevelResource(CardLevelResourceId)
    if CharId then
      ArmoryUtils:_SetReddotReadCommon(CharId, DataMgr.ReddotNode.UnlockableChar.Name, true)
    end
  end
  local CharId = _UuidToCharId[CharUuid]
  _UuidToCharId[CharUuid] = nil
  _CharIdToUuid[CharId] = nil
  _UuidToCardLevelResourceId[CharUuid] = nil
  _CardLevelResourceToUuid[CardLevelResourceId] = nil
  ArmoryUtils:SetItemReddotRead({
    ItemType = CommonConst.DataType.Char,
    Uuid = CharUuid
  }, true, true, true)
end

function M:OnNewCharSkinObtained(SkinId, CharId)
  _SkinIdToCharId[SkinId] = CharId
  if SkinId ~= CharId then
    ArmoryUtils:TryAddNewCharSkinReddot(SkinId, CharId)
  end
end

function M:OnNewCharAccessoryObtained(AccessoryId)
  _CharAccessoryMap[AccessoryId] = true
  local CharAccessoryData = DataMgr.CharAccessory[AccessoryId]
  if not CharAccessoryData or _DefaultAccessories[AccessoryId] then
    return
  end
  if CharAccessoryData.Skin then
    for _, SkinId in pairs(CharAccessoryData.Skin) do
      ArmoryUtils:TryAddNewCharAccessoryReddot(AccessoryId, SkinId)
    end
  else
    ArmoryUtils:TryAddNewCharAccessoryReddot(AccessoryId)
  end
end

function M:OnPropChangeStoredCollectReward(Strings)
  if _CharReward[Strings[1]] and Strings[2] and Strings[3] then
    local CharId = tonumber(Strings[2])
    if not DataMgr.Char[CharId] then
      return
    end
    _CharReward[Strings[1]][CharId] = _CharReward[Strings[1]][CharId] or {}
    local Reward = _CharReward[Strings[1]][CharId]
    if Reward[Strings[3]] then
      Reward[Strings[3]] = nil
      if nil == next(Reward) then
        ArmoryUtils:_SetReddotReadCommon(CharId, DataMgr.ReddotNode.CharReward.Name, true)
      end
    else
      Reward[Strings[3]] = true
      ArmoryUtils:TryAddCharRewardReddot(CharId)
    end
    EventManager:FireEvent(EventID.OnCharRewardStateChanged, CharId)
  end
end

function M:IsCharAccessoryExist(AccessoryId)
  return not not _CharAccessoryMap[AccessoryId]
end

function M:Destory()
  _UuidToCardLevelResourceId = {}
  _CardLevelResourceToUuid = {}
  _SkinIdToCharId = {}
  _CharAccessoryMap = {}
  EventManager:RemoveEvent(EventID.OnNewCharObtained, self)
  EventManager:RemoveEvent(EventID.OnCharCardLevelResourcesChanged, self)
  EventManager:RemoveEvent(EventID.OnCharDeleted, self)
  EventManager:RemoveEvent(EventID.OnNewCharSkinObtained, self)
  EventManager:RemoveEvent(EventID.OnNewCharAccessoryObtained, self)
end

return M
