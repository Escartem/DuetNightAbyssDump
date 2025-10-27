local WeaponModel = require("BluePrints.Common.MVC.Model.WeaponModel")
local Component = {}

function Component:EnterWorld()
  WeaponModel:Init(self)
end

function Component:LeaveWorld()
  WeaponModel:Destory()
end

function Component:RefreshWeapon()
  WeaponModel:Init(self)
end

function Component:CheckWeaponEnough(CheckData)
  local WeaponStatistics = {}
  for key, Weapon in pairs(self.Weapons) do
    if not WeaponStatistics[Weapon.WeaponId] then
      WeaponStatistics[Weapon.WeaponId] = 0
    end
    WeaponStatistics[Weapon.WeaponId] = WeaponStatistics[Weapon.WeaponId] + 1
  end
  for WeaponId, Count in pairs(CheckData) do
    if not WeaponStatistics[WeaponId] or Count > WeaponStatistics[WeaponId] then
      return false
    end
  end
  return true
end

function Component:_OnPropChangeWeapons(Keys)
  local WeaponUuid = Keys and Keys[1]
  if WeaponUuid then
    local bHasWeapon = WeaponModel:HasWeapon(WeaponUuid)
    if bHasWeapon then
      if not self.Weapons[WeaponUuid] then
        WeaponModel:OnWeaponDeleted(WeaponUuid)
      end
    elseif self.Weapons[WeaponUuid] then
      WeaponModel:OnNewWeaponObtained(WeaponUuid)
    end
    if "Status" == Keys[2] then
      WeaponModel:OnWeaponStatusChanged(self, WeaponUuid)
    end
    if "Level" == Keys[2] then
      WeaponModel:OnWeaponStatusChanged(self, WeaponUuid)
    end
    if "GradeLevel" == Keys[2] then
      WeaponModel:OnWeaponStatusChanged(self, WeaponUuid)
    end
  end
end

function Component:_OnPropChangeStoredCollectReward(Keys)
  local Strings = string.split(Keys and Keys[1] or "", ".")
  if #Strings > 0 then
    WeaponModel:OnPropChangeStoredCollectReward(Strings)
  end
end

function Component:IsWeaponHasReward(WeaponId)
  return WeaponModel:IsWeaponHasReward(WeaponId)
end

function Component:GetWeaponCountById(WeaponId)
  return WeaponModel:GetWeaponCount(WeaponId)
end

function Component:_OnPropChangeWeaponAccessorys()
  for _, AccessoryId in pairs(self.WeaponAccessorys) do
    if not WeaponModel:IsWeaponAccessoryExist(AccessoryId) then
      EventManager:FireEvent(EventID.OnNewWeaponAccessoryObtained, AccessoryId)
    end
  end
end

function Component:_OnPropChangeOwnedWeaponSkins()
  for SkinId, _ in pairs(self.OwnedWeaponSkins) do
    if not WeaponModel:IsWeaponSkinExist(SkinId) then
      EventManager:FireEvent(EventID.OnNewWeaponSkinObtained, SkinId)
    end
  end
end

function Component:SetDefaultWeapon()
  local function callback(Ret)
    self.logger.debug("SetDefaultWeapon", Ret)
    
    EventManager:FireEvent(EventID.SetDefaultWeapon)
  end
  
  self:CallServer("SetDefaultWeapon", callback)
end

function Component:ChooseRangedWeapon(Index, ChooseWeaponCallback)
  local function callback(Ret)
    ChooseWeaponCallback(Ret)
  end
  
  self:CallServer("ChooseRangedWeapon", callback, Index)
end

function Component:AddDefaultMeleeWeapon(GetMeleeCallback)
  local function callback(Ret)
    self.logger.debug("AddDefaultMeleeWeapon", Ret)
    
    if GetMeleeCallback then
      GetMeleeCallback(Ret)
    end
  end
  
  self:CallServer("AddDefaultMeleeWeapon", callback)
end

function Component:ChangeWeaponMod(InCallbackInfo, WeaponUuid, ModSuitIndex, ModSlotId, ModUuid)
  local function callback(Ret)
    self.logger.debug("ZJT_ ChangeWeaponMod callback", Ret)
    
    if not InCallbackInfo then
      return
    end
    local TakeOffModUuid = table.unpack(InCallbackInfo.ExParams)
    InCallbackInfo.Func(InCallbackInfo.Obj, Ret, WeaponUuid, ModSuitIndex, ModSlotId, ModUuid, TakeOffModUuid)
  end
  
  self:CallServer("ChangeWeaponMod", callback, WeaponUuid, ModSuitIndex, ModSlotId, ModUuid)
end

function Component:ExchangeWeaponMod(InCallbackInfo, WeaponUuid, ModSuitIndex, SModSlotId, TModSlotId)
  local function callback(Ret)
    self.logger.debug("ZJT_ ExchangeWeaponMod callback", Ret)
    
    if not InCallbackInfo then
      return
    end
    InCallbackInfo.Func(InCallbackInfo.Obj, Ret, WeaponUuid, ModSuitIndex, SModSlotId, TModSlotId)
  end
  
  self:CallServer("ExchangeWeaponMod", callback, WeaponUuid, ModSuitIndex, SModSlotId, TModSlotId)
end

function Component:TakeOffWeaponMod(InCallbackInfo, WeaponUuid, ModSuitIndex, ModSlotId)
  local function callback(Ret)
    self.logger.debug("ZJT_ TakeOffWeaponMod callback", Ret)
    
    if not InCallbackInfo then
      return
    end
    local TakeOffModUuid = table.unpack(InCallbackInfo.ExParams)
    InCallbackInfo.Func(InCallbackInfo.Obj, Ret, WeaponUuid, ModSuitIndex, ModSlotId, TakeOffModUuid)
  end
  
  self:CallServer("TakeOffWeaponMod", callback, WeaponUuid, ModSuitIndex, ModSlotId)
end

function Component:SaleWeapon(WeaponUuid)
  local function callback(Ret)
    self.logger.debug("SaleWeapon", Ret)
    
    EventManager:FireEvent(EventID.OnUpdateBagItem, "SaleWeapon", Ret, WeaponUuid, Count)
  end
  
  self:CallServer("SaleWeapon", callback, WeaponUuid)
end

function Component:WeaponBulkSale(WeaponUuids)
  if not WeaponUuids or type(WeaponUuids) ~= "table" then
    return
  end
  
  local function callback(Ret, SaleSucc)
    self.logger.debug("ZJT_ WeaponBulkSale ", Ret)
    EventManager:FireEvent(EventID.OnUpdateBagItem, "WeaponBulkSale", Ret, SaleSucc)
  end
  
  self:CallServer("WeaponBulkSale", callback, WeaponUuids)
end

function Component:ChangeWeaponModSuit(InCallbackInfo, WeaponUuid, TargetModSuitIndex)
  local function callback(Ret)
    self.logger.debug("ChangeWeaponModSuit", Ret)
    
    if not InCallbackInfo then
      return
    end
    InCallbackInfo.Func(InCallbackInfo.Obj, Ret, WeaponUuid, TargetModSuitIndex)
  end
  
  self:CallServer("ChangeWeaponModSuit", callback, WeaponUuid, TargetModSuitIndex)
end

function Component:WeaponLevelUp(WeaponUuid, CurrentLevel, TargetLevel)
  self.logger.debug("WeaponLevelUp", CommonUtils.ObjId2Str(WeaponUuid), CurrentLevel, TargetLevel)
  
  local function callback(Ret)
    self.logger.debug("WeaponLevelUp, Ret", Ret, CommonUtils.ObjId2Str(WeaponUuid), CurrentLevel, TargetLevel)
    EventManager:FireEvent(EventID.OnWeaponLevelUp, Ret, WeaponUuid, CurrentLevel, TargetLevel)
  end
  
  self:CallServer("WeaponLevelUp", callback, WeaponUuid, CurrentLevel, TargetLevel)
end

function Component:WeaponBreakLevelUp(WeaponUuid, TargetBreakLevel)
  local function callback(Ret)
    self.logger.debug("WeaponBreakeLevelUp, Ret", Ret, CommonUtils.ObjId2Str(WeaponUuid), TargetBreakLevel)
    
    EventManager:FireEvent(EventID.OnWeaponBreakLevelUp, Ret, WeaponUuid, TargetBreakLevel)
  end
  
  self:CallServer("WeaponBreakeLevelUp", callback, WeaponUuid)
end

function Component:UpWeaponGradeLevel(WeaponUuid, CurrentGradeLevel, ConsumeWeaponUuids, InCallback)
  self.logger.debug("UpWeaponGradeLevel Start", CommonUtils.ObjId2Str(WeaponUuid), CurrentGradeLevel)
  
  local function callback(Ret)
    self.logger.debug("UpWeaponGradeLevel callback", Ret)
    EventManager:FireEvent(EventID.OnWeaponGradeLevelUp, Ret, WeaponUuid, CurrentGradeLevel, ConsumeWeaponUuids)
    if InCallback then
      InCallback(Ret)
    end
  end
  
  self:CallServer("UpWeaponGradeLevel", callback, WeaponUuid, CurrentGradeLevel, ConsumeWeaponUuids, 0)
end

function Component:WeaponBreakDown(WeaponUuid)
  local function callback(Ret)
    self.logger.debug("Zjt_ ServerCallClient WeaponBreakDown callback", Ret)
    
    EventManager:FireEvent(EventID.OnUpdateBagItem, "WeaponBreakDown", Ret)
  end
  
  self:CallServer("WeaponBreakDown", callback, WeaponUuid)
end

function Component:WeaponBulkBreakDown(WeaponUuidTable)
  if not WeaponUuidTable or type(WeaponUuidTable) ~= "table" then
    return
  end
  
  local function callback(Ret, RewardBox, BreakDownSucc)
    self.logger.debug("ZJT_ ServerCallClient WeaponBulkBreakDown callback", Ret)
    EventManager:FireEvent(EventID.OnUpdateBagItem, "WeaponBulkBreakDown", Ret, RewardBox, BreakDownSucc)
  end
  
  self:CallServer("WeaponBulkBreakDown", callback, WeaponUuidTable)
end

function Component:UpdateWeaponModSuitName(InCallbackInfo, WeaponUuid, ModSuitIndex, NewName)
  local function Callback(Ret)
    self.logger.debug("UpdateWeaponModSuitName callback", Ret)
    
    if not InCallbackInfo then
      return
    end
    InCallbackInfo.Func(InCallbackInfo.Obj, Ret, WeaponUuid, ModSuitIndex, NewName)
  end
  
  self:CallServer("UpdateWeaponModSuitName", Callback, WeaponUuid, ModSuitIndex, NewName)
end

function Component:TakeOffAllWeaponMod(InCallbackInfo, WeaponUuid, ModSuitIndex)
  local function Callback(Ret)
    self.logger.debug("TakeOffAllWeaponMod ServerCallClient ", Ret)
    
    if not InCallbackInfo then
      return
    end
    InCallbackInfo.Func(InCallbackInfo.Obj, Ret, WeaponUuid, ModSuitIndex)
  end
  
  self:CallServer("TakeOffAllWeaponMod", Callback, WeaponUuid, ModSuitIndex)
end

return Component
