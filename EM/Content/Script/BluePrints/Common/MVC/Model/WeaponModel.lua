local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class()
local _WeaponMap, _WeaponSkinMap, _WeaponAccessoryMap, _WeaponCount, _WeaponReward, _WeaponUuid2Id, _WeaponId2Uuid, _ConsumeWeaponRedCount

local function UpdateRedCountForWeaponId(WeaponTag, WeaponId)
  local allUuids = {}
  local consumableUuids = {}
  local weaponUuids = _WeaponId2Uuid[WeaponId]
  if weaponUuids then
    for Uuid, weapon in pairs(weaponUuids) do
      table.insert(allUuids, Uuid)
      if weapon then
        local Data = DataMgr.WeaponCardLevel[weapon.WeaponId]
        local MaxGradeLevel = Data and Data.CardLevelMax or 0
        if 0 == weapon.Status and weapon.Level < weapon.MaxLevel and MaxGradeLevel > weapon.GradeLevel then
          table.insert(consumableUuids, Uuid)
        end
      end
    end
  end
  for _, uuid in ipairs(allUuids) do
    local countExcludingSelf = 0
    for _, consumableUuid in ipairs(consumableUuids) do
      if consumableUuid ~= uuid then
        countExcludingSelf = countExcludingSelf + 1
      end
    end
    _ConsumeWeaponRedCount[WeaponTag][uuid] = countExcludingSelf
  end
end

local function AddWeaponToMap(Weapon)
  _WeaponUuid2Id[Weapon.Uuid] = Weapon.WeaponId
  if not _WeaponId2Uuid[Weapon.WeaponId] then
    _WeaponId2Uuid[Weapon.WeaponId] = {}
  end
  _WeaponId2Uuid[Weapon.WeaponId][Weapon.Uuid] = Weapon
  if Weapon:HasTag(CommonConst.WeaponType.MeleeWeapon) then
    _WeaponMap[Weapon.Uuid] = {
      WeaponTag = CommonConst.WeaponType.MeleeWeapon,
      WeaponId = Weapon.WeaponId
    }
    local Count = _WeaponCount[CommonConst.WeaponType.MeleeWeapon][Weapon.WeaponId] or 0
    _WeaponCount[CommonConst.WeaponType.MeleeWeapon][Weapon.WeaponId] = Count + 1
    UpdateRedCountForWeaponId(CommonConst.WeaponType.MeleeWeapon, Weapon.WeaponId)
  else
    _WeaponMap[Weapon.Uuid] = {
      WeaponTag = CommonConst.WeaponType.RangedWeapon,
      WeaponId = Weapon.WeaponId
    }
    local Count = _WeaponCount[CommonConst.WeaponType.RangedWeapon][Weapon.WeaponId] or 0
    _WeaponCount[CommonConst.WeaponType.RangedWeapon][Weapon.WeaponId] = Count + 1
    UpdateRedCountForWeaponId(CommonConst.WeaponType.RangedWeapon, Weapon.WeaponId)
  end
end

local function RemoveWeaponFromMap(Uuid)
  local Value = _WeaponMap[Uuid]
  if Value then
    local WeaponCount = _WeaponCount[Value.WeaponTag][Value.WeaponId] or 0
    if WeaponCount <= 1 then
      _WeaponCount[Value.WeaponTag][Value.WeaponId] = nil
    else
      _WeaponCount[Value.WeaponTag][Value.WeaponId] = WeaponCount - 1
    end
    _ConsumeWeaponRedCount[Value.WeaponTag][Uuid] = nil
    UpdateRedCountForWeaponId(Value.WeaponTag, Value.WeaponId)
  end
  local WeaponId = _WeaponUuid2Id[Uuid]
  if WeaponId and _WeaponId2Uuid[WeaponId] then
    _WeaponId2Uuid[WeaponId][Uuid] = nil
    if nil == next(_WeaponId2Uuid[WeaponId]) then
      _WeaponId2Uuid[WeaponId] = nil
    end
  end
  _WeaponMap[Uuid] = nil
  _WeaponUuid2Id[Uuid] = nil
end

local WeaponRewardStates = {Owned = 1, Unowned = 2}

local function MappingReward(self, Avatar)
  local Strings, WeaponId
  for Keys, _ in pairs(Avatar.StoredCollectReward or {}) do
    Strings = string.split(Keys, ".")
    if _WeaponReward[Strings[1]] and Strings[2] and Strings[3] then
      WeaponId = tonumber(Strings[2])
      if DataMgr.Weapon[WeaponId] then
        _WeaponReward[Strings[1]][WeaponId] = _WeaponReward[Strings[1]][WeaponId] or {}
        if self:GetWeaponCount(WeaponId) > 0 then
          _WeaponReward[Strings[1]][WeaponId][Strings[3]] = WeaponRewardStates.Owned
        else
          _WeaponReward[Strings[1]][WeaponId][Strings[3]] = WeaponRewardStates.Unowned
        end
      end
    end
  end
end

function M:Init(Avatar)
  _WeaponMap = {}
  _WeaponSkinMap = {}
  _WeaponAccessoryMap = {}
  _WeaponCount = {}
  _WeaponCount[CommonConst.WeaponType.MeleeWeapon] = {}
  _WeaponCount[CommonConst.WeaponType.RangedWeapon] = {}
  _WeaponReward = {
    WeaponBreak = {}
  }
  _WeaponUuid2Id = {}
  _ConsumeWeaponRedCount = {}
  _ConsumeWeaponRedCount[CommonConst.WeaponType.MeleeWeapon] = {}
  _ConsumeWeaponRedCount[CommonConst.WeaponType.RangedWeapon] = {}
  _WeaponId2Uuid = {}
  if Avatar.Weapons then
    for _, Weapon in pairs(Avatar.Weapons) do
      AddWeaponToMap(Weapon)
    end
  end
  if Avatar.OwnedWeaponSkins then
    for SkinId, _ in pairs(Avatar.OwnedWeaponSkins) do
      _WeaponSkinMap[SkinId] = true
    end
  end
  if Avatar.WeaponAccessorys then
    for _, AccessoryId in pairs(Avatar.WeaponAccessorys) do
      _WeaponAccessoryMap[AccessoryId] = true
    end
  end
  MappingReward(self, Avatar)
  EventManager:AddEvent(EventID.OnNewWeaponAccessoryObtained, self, self.OnNewWeaponAccessoryObtained)
  EventManager:AddEvent(EventID.OnNewWeaponSkinObtained, self, self.OnNewWeaponSkinObtained)
  ArmoryUtils:CreateReddotInfos(CommonConst.DataType.Weapon)
  ArmoryUtils:CreateReddotInfos(CommonConst.DataType.Weapon .. ArmoryUtils.ArmorySubTabNames.Appearance)
end

function M:HasWeapon(Uuid)
  return not not _WeaponMap[Uuid]
end

function M:GetWeaponCount(WeaponId)
  return _WeaponCount[CommonConst.WeaponType.MeleeWeapon][WeaponId] or _WeaponCount[CommonConst.WeaponType.RangedWeapon][WeaponId] or 0
end

function M:GetConsumeWeaponCount(Uuid)
  local count = _ConsumeWeaponRedCount[CommonConst.WeaponType.MeleeWeapon][Uuid] or _ConsumeWeaponRedCount[CommonConst.WeaponType.RangedWeapon][Uuid]
  return type(count) == "number" and count or 0
end

function M:IsWeaponConsumable(Uuid)
  local count = _ConsumeWeaponRedCount[CommonConst.WeaponType.MeleeWeapon][Uuid] or _ConsumeWeaponRedCount[CommonConst.WeaponType.RangedWeapon][Uuid]
  return type(count) == "number" and count > 0
end

function M:UpdateStoredWeapon(Avatar, Uuid)
  if Avatar and Avatar.Weapons and Avatar.Weapons[Uuid] then
    local weapon = Avatar.Weapons[Uuid]
    if not _WeaponId2Uuid[weapon.WeaponId] then
      _WeaponId2Uuid[weapon.WeaponId] = {}
    end
    _WeaponId2Uuid[weapon.WeaponId][Uuid] = weapon
  end
end

function M:UpdateWeaponConsumeStatus(Avatar, Uuid)
  local weaponData = _WeaponMap[Uuid]
  if not weaponData then
    return
  end
  self:UpdateStoredWeapon(Avatar, Uuid)
  UpdateRedCountForWeaponId(weaponData.WeaponTag, weaponData.WeaponId)
end

function M:OnWeaponStatusChanged(Avatar, Uuid)
  self:UpdateWeaponConsumeStatus(Avatar, Uuid)
end

function M:IsWeaponHasReward(WeaponId)
  local WeaponBreak = _WeaponReward.WeaponBreak[WeaponId]
  if WeaponBreak then
    for key, value in pairs(WeaponBreak) do
      if value == WeaponRewardStates.Owned then
        return true
      end
    end
  end
  return false
end

function M:GetWeaponRewardInfo()
  return _WeaponReward
end

function M:IsWeaponAccessoryExist(AccessoryId)
  return _WeaponAccessoryMap[AccessoryId]
end

function M:IsWeaponSkinExist(SkinId)
  return _WeaponSkinMap[SkinId]
end

function M:OnPropChangeStoredCollectReward(Strings)
  if _WeaponReward[Strings[1]] and Strings[2] and Strings[3] then
    local WeaponId = tonumber(Strings[2])
    if not DataMgr.Weapon[WeaponId] then
      return
    end
    _WeaponReward[Strings[1]][WeaponId] = _WeaponReward[Strings[1]][WeaponId] or {}
    local Reward = _WeaponReward[Strings[1]][WeaponId]
    if Reward[Strings[3]] then
      Reward[Strings[3]] = nil
      if nil == next(Reward) then
        if _WeaponCount[CommonConst.WeaponType.MeleeWeapon][WeaponId] then
          ArmoryUtils:_SetReddotReadCommon(WeaponId, DataMgr.ReddotNode.MeleeReward.Name, true)
        elseif _WeaponCount[CommonConst.WeaponType.RangedWeapon][WeaponId] then
          ArmoryUtils:_SetReddotReadCommon(WeaponId, DataMgr.ReddotNode.RangedReward.Name, true)
        end
      end
    elseif self:GetWeaponCount(WeaponId) > 0 then
      Reward[Strings[3]] = WeaponRewardStates.Owned
      ArmoryUtils:TryAddWeaponRewardReddot(WeaponId)
    else
      Reward[Strings[3]] = WeaponRewardStates.Unowned
    end
    EventManager:FireEvent(EventID.OnWeaponRewardStateChanged, WeaponId)
  end
end

function M:OnNewWeaponObtained(Uuid)
  local Avatar = GWorld:GetAvatar()
  local Weapon = Avatar.Weapons[Uuid]
  if Weapon then
    AddWeaponToMap(Weapon)
    ArmoryUtils:TryAddNewWeaponReddot(Weapon, CommonUtils.ObjId2Str(Uuid))
    local WeaponTag = _WeaponMap[Uuid] and _WeaponMap[Uuid].WeaponTag
    if WeaponTag then
      _WeaponReward.WeaponBreak[Weapon.WeaponId] = _WeaponReward.WeaponBreak[Weapon.WeaponId] or {}
      local WeaponRewardInfo = _WeaponReward.WeaponBreak[Weapon.WeaponId]
      for key, value in pairs(WeaponRewardInfo) do
        WeaponRewardInfo[key] = WeaponRewardStates.Owned
      end
      ArmoryUtils:TryAddWeaponRewardReddot(Weapon.WeaponId)
    end
  end
  EventManager:FireEvent(EventID.OnNewWeaponObtained, Uuid)
end

function M:OnWeaponDeleted(Uuid)
  local WeaponTag = _WeaponMap[Uuid] and _WeaponMap[Uuid].WeaponTag
  local WeaponId = _WeaponUuid2Id[Uuid]
  RemoveWeaponFromMap(Uuid)
  if WeaponTag then
    ArmoryUtils:SetItemReddotRead({
      ItemType = CommonConst.DataType.Weapon,
      Tag = WeaponTag,
      Uuid = Uuid
    }, true, true, true)
    if WeaponId and self:GetWeaponCount(WeaponId) <= 0 then
      local WeaponRewardInfo = _WeaponReward.WeaponBreak[WeaponId]
      if WeaponRewardInfo then
        for key, value in pairs(WeaponRewardInfo) do
          WeaponRewardInfo[key] = WeaponRewardStates.Unowned
        end
      end
      if WeaponTag == CommonConst.WeaponType.MeleeWeapon then
        ArmoryUtils:_SetReddotReadCommon(WeaponId, DataMgr.ReddotNode.MeleeReward.Name, true)
      elseif WeaponTag == CommonConst.WeaponType.RangedWeapon then
        ArmoryUtils:_SetReddotReadCommon(WeaponId, DataMgr.ReddotNode.RangedReward.Name, true)
      end
    end
  end
  EventManager:FireEvent(EventID.OnWeaponDeleted, Uuid)
end

function M:OnNewWeaponAccessoryObtained(AccessoryId)
  if not AccessoryId then
    return
  end
  _WeaponAccessoryMap[AccessoryId] = true
  ArmoryUtils:TryAddNewWeaponAccessoryReddot(AccessoryId)
end

function M:OnNewWeaponSkinObtained(SkinId)
  if not SkinId then
    return
  end
  _WeaponSkinMap[SkinId] = true
  ArmoryUtils:TryAddNewWeaponSkinReddot(SkinId)
end

function M:Destory()
  _WeaponMap = {}
  _WeaponSkinMap = {}
  _WeaponAccessoryMap = {}
  _WeaponId2Uuid = {}
  EventManager:RemoveEvent(EventID.OnNewWeaponSkinObtained, self)
  EventManager:RemoveEvent(EventID.OnNewWeaponAccessoryObtained, self)
end

return M
