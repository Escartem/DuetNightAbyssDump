local CharModel = require("BluePrints.Common.MVC.Model.CharModel")
local Component = {}

function Component:EnterWorld()
  CharModel:Init(self)
end

function Component:LeaveWorld()
  CharModel:Destory()
end

function Component:GetCharUuidByCharId(CharId)
  return CharModel:GetUuidByCharId(CharId)
end

function Component:CheckCharEnough(CheckData)
  for CharId, Count in pairs(CheckData) do
    local IsExist = false
    for key, Char in pairs(self.Chars) do
      if Char.CharId == CharId then
        IsExist = true
        break
      end
    end
    if not IsExist then
      return false
    end
  end
  return true
end

function Component:_OnPropChangeChars(Keys)
  local CharUuid = Keys and Keys[1]
  if CharUuid then
    local bHasChar = CharModel:GetCardLevelResourceByUuid(CharUuid)
    if bHasChar then
      if not self.Chars[CharUuid] then
        EventManager:FireEvent(EventID.OnCharDeleted, CharUuid)
      end
    elseif self.Chars[CharUuid] then
      EventManager:FireEvent(EventID.OnNewCharObtained, CharUuid)
    end
    if "GradeLevel" == Keys[2] then
      EventManager:FireEvent(EventID.OnCharCardLevelResourcesChanged, nil, nil, CharUuid)
    end
  end
end

function Component:_OnPropChangeCommonChars(Keys)
  local CharId = Keys and Keys[1]
  if not CharId then
    return
  end
  local CommonChar = self.CommonChars[CharId]
  if not CommonChar then
    return
  end
  for SkinId, Skin in pairs(CommonChar.OwnedSkins or {}) do
    if CharModel:GetCharIdBySkinId(SkinId) == nil then
      EventManager:FireEvent(EventID.OnNewCharSkinObtained, SkinId, CharId)
    end
  end
end

function Component:_OnPropChangeResources(Keys)
  local ResourceId = Keys and Keys[1]
  if ResourceId then
    local CharUuid = CharModel:GetUuidByCardLevelResource(ResourceId)
    local CharId = CharModel:GetCharIdByCardLevelResource(ResourceId)
    EventManager:FireEvent(EventID.OnCharCardLevelResourcesChanged, ResourceId, CharId, CharUuid)
  end
end

function Component:_OnPropChangeStoredCollectReward(Keys)
  local Strings = string.split(Keys and Keys[1] or "", ".")
  if #Strings > 0 then
    CharModel:OnPropChangeStoredCollectReward(Strings)
  end
end

function Component:IsCharHasReward(CharId)
  return CharModel:IsCharHasReward(CharId)
end

function Component:_OnPropChangeCharAccessorys()
  for _, AccessoryId in pairs(self.CharAccessorys) do
    if not CharModel:IsCharAccessoryExist(AccessoryId) then
      EventManager:FireEvent(EventID.OnNewCharAccessoryObtained, AccessoryId)
    end
  end
end

function Component:ChangeChar(cb)
  local function callback(ret, ResourceReturn)
    self.logger.debug("ChangeChar", ret, ResourceReturn)
    
    cb(ret, ResourceReturn)
  end
  
  self:CallServer("ChangeChar", callback)
end

function Component:SwitchCurrentChar(CharUuid)
  self.logger.debug("SwitchCurrentChar", CharUuid)
  self:CallServerMethod("SwitchCurrentChar", CharUuid)
end

function Component:OnSwitchCurrentChar(Ret, CharUuid)
  self.logger.debug("OnSwitchCurrentChar", Ret, CharUuid)
  EventManager:FireEvent(EventID.OnSwitchRole, CharUuid)
end

function Component:SwitchWeapon(WeaponTag, WeaponUuid)
  if not WeaponTag or not WeaponUuid then
    return
  end
  self:CallServerMethod("SwitchWeapon", WeaponTag, WeaponUuid)
end

function Component:OnSwitchWeapon(Ret, WeaponTag, WeaponUuid)
  if not ErrorCode:Check(Ret) then
    return
  end
  EventManager:FireEvent(EventID.OnSwitchWeapon, WeaponTag, WeaponUuid)
  print(_G.LogTag, "OnSwtichWeapon : " .. self.Weapons[WeaponUuid].WeaponId)
end

function Component:ChangeCharMod(InCallbackInfo, CharUuid, ModSuitIndex, ModSlotId, ModUuid)
  local function callback(Ret)
    self.logger.debug("ZJT_ ChangeCharMod callback", Ret)
    
    if not InCallbackInfo then
      return
    end
    local TakeOffModUuid = table.unpack(InCallbackInfo.ExParams)
    InCallbackInfo.Func(InCallbackInfo.Obj, Ret, CharUuid, ModSuitIndex, ModSlotId, ModUuid, TakeOffModUuid)
  end
  
  self:CallServer("ChangeCharMod", callback, CharUuid, ModSuitIndex, ModSlotId, ModUuid)
end

function Component:ExchangeCharMod(InCallbackInfo, CharUuid, ModSuitIndex, SModSlotId, TModSlotId)
  local function callback(Ret)
    self.logger.debug("ZJT_ ExchangeCharMod callback", Ret)
    
    if not InCallbackInfo then
      return
    end
    InCallbackInfo.Func(InCallbackInfo.Obj, Ret, CharUuid, ModSuitIndex, SModSlotId, TModSlotId)
  end
  
  self:CallServer("ExchangeCharMod", callback, CharUuid, ModSuitIndex, SModSlotId, TModSlotId)
end

function Component:TakeOffCharMod(InCallbackInfo, CharUuid, ModSuitIndex, ModSlotId)
  local function callback(Ret)
    self.logger.debug("ZJT_ TakeOffCharMod callback")
    
    if not InCallbackInfo then
      return
    end
    local TakeOffModUuid = table.unpack(InCallbackInfo.ExParams)
    InCallbackInfo.Func(InCallbackInfo.Obj, Ret, CharUuid, ModSuitIndex, ModSlotId, TakeOffModUuid)
  end
  
  self:CallServer("TakeOffCharMod", callback, CharUuid, ModSuitIndex, ModSlotId)
end

function Component:ChangeCharModSuit(InCallbackInfo, CharUuid, TargetModSuitIndex)
  local char = self.Chars[CharUuid]
  if char.ModSuitIndex == TargetModSuitIndex then
    return
  end
  
  local function callback(Ret)
    self.logger.debug("ChangeCharModSuit callback", Ret)
    if not InCallbackInfo then
      return
    end
    InCallbackInfo.Func(InCallbackInfo.Obj, Ret, CharUuid, TargetModSuitIndex)
  end
  
  self:CallServer("ChangeCharModSuit", callback, CharUuid, TargetModSuitIndex)
end

function Component:UpSkillLevel(Tag, Uuid, SkillId, CurrentLevel)
  local function callback(Ret)
    self.logger.debug("UpSkillLevel callback", Ret)
    
    EventManager:FireEvent(EventID.OnCharSkillLevelUp, Ret, SkillId, CurrentLevel, CurrentLevel + 1)
  end
  
  self:CallServer("UpSkillLevel", callback, Tag, Uuid, SkillId, CurrentLevel)
end

function Component:ActivateCharSkillTreeNode(CharUuid, TreeIndex, NodeIndex)
  self.logger.debug("ActivateCharSkillTreeNode Begin", TreeIndex, NodeIndex)
  
  local function callback(Ret)
    self.logger.debug("ActivateCharSkillTreeNode callback", Ret)
    EventManager:FireEvent(EventID.OnCharSkillTreeNodeActivated, Ret, CharUuid, TreeIndex, NodeIndex)
  end
  
  self:CallServer("ActivateCharSkillTreeNode", callback, CharUuid, TreeIndex, NodeIndex)
end

function Component:UnlockCharUsePiece(CharId)
  self.logger.debug("UnlockCharUsePiece Begin", CharId)
  
  local function Callback(Ret)
    self.logger.debug("UnlockCharUsePiece Callback", Ret)
    EventManager:FireEvent(EventID.OnUnlockCharUsePiece, Ret, CharId)
  end
  
  self:CallServer("UnlockCharUsePiece", Callback, CharId)
end

function Component:UpCharGradeLevel(CharUuid, CurrentGradeLevel)
  local function callback(Ret)
    self.logger.debug("UpCharGradeLevel callback", Ret)
    
    EventManager:FireEvent(EventID.OnCharGradeLevelUp, Ret, CharUuid, CurrentGradeLevel)
  end
  
  self:CallServer("UpCharGradeLevel", callback, CharUuid, CurrentGradeLevel)
end

function Component:CharLevelUp(CharUuid, CurrentLevel, TargetLevel)
  self.logger.debug("CharLevelUp", CommonUtils.ObjId2Str(CharUuid), CurrentLevel, TargetLevel)
  local Char = self.Chars[CharUuid]
  if not Char then
    return
  end
  if CurrentLevel ~= Char.Level or TargetLevel <= CurrentLevel then
    return
  end
  
  local function callback(Ret)
    self.logger.debug("CharLevelUp, Ret", Ret, CommonUtils.ObjId2Str(CharUuid), CurrentLevel, TargetLevel)
    EventManager:FireEvent(EventID.OnCharLevelUp, Ret, CharUuid, CurrentLevel, TargetLevel)
  end
  
  self:CallServer("CharLevelUp", callback, CharUuid, CurrentLevel, TargetLevel)
end

function Component:CharBreakLevelUp(CharUuid, TargetBreakLevel)
  local Char = self.Chars[CharUuid]
  if not Char then
    return
  end
  if Char.EnhanceLevel + 1 ~= TargetBreakLevel then
    return
  end
  
  local function callback(Ret)
    self.logger.debug("CharBreakLevelUp, Ret", Ret, CommonUtils.ObjId2Str(CharUuid), self.Chars[CharUuid].EnhanceLevel)
    EventManager:FireEvent(EventID.OnCharBreakLevelUp, Ret, CharUuid, self.Chars[CharUuid].EnhanceLevel)
  end
  
  self:CallServer("CharBreakLevelUp", callback, CharUuid)
end

function Component:GetCurrentCharConfigID()
  DebugPrint("GetCurrentCharConfigID")
  return self.Chars[self.CurrentChar].CharId
end

function Component:GetCurrentMeleeWeaponConfigID()
  return self.Weapons[self.MeleeWeapon].WeaponId
end

function Component:GetCurrentRangedWeaponConfigID()
  return self.Weapons[self.RangedWeapon].WeaponId
end

function Component:UpdateCharModSuitName(InCallbackInfo, CharUuid, ModSuitIndex, NewName)
  local function Callback(Ret)
    self.logger.debug("UpdateCharModSuitName callback", Ret)
    
    if not InCallbackInfo then
      return
    end
    InCallbackInfo.Func(InCallbackInfo.Obj, Ret, CharUuid, ModSuitIndex, NewName)
  end
  
  self:CallServer("UpdateCharModSuitName", Callback, CharUuid, ModSuitIndex, NewName)
end

function Component:TakeOffAllCharMod(InCallbackInfo, CharUuid, ModSuitIndex)
  assert(self.Chars[CharUuid])
  
  local function Callback(Ret)
    self.logger.debug("TakeOffAllCharMod ServerCallClient", Ret)
    if not InCallbackInfo then
      return
    end
    InCallbackInfo.Func(InCallbackInfo.Obj, Ret, CharUuid, ModSuitIndex)
  end
  
  self:CallServer("TakeOffAllCharMod", Callback, CharUuid, ModSuitIndex)
end

function Component:CheckAlternativeChar(InCallback)
  local function callback(ret)
    self.logger.debug("CheckAlternativeChar Callback", ret)
    
    InCallback(ret)
  end
  
  self:CallServer("CheckAlternativeChar", callback)
end

return Component
