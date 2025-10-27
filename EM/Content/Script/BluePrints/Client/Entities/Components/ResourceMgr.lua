local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local Component = {}

function Component:EnterWorld()
  ArmoryUtils:CreateReddotInfos(CommonConst.DataType.Resource)
end

function Component:_OnPropChangeResources(Keys)
  local ResourceId = Keys and Keys[1]
  if ResourceId then
    EventManager:FireEvent(EventID.OnResourcesChanged, ResourceId)
  end
end

function Component:GetResourceNum(ResourceId)
  local Resource = self.Resources[ResourceId]
  if not Resource then
    return 0
  end
  return Resource.Count
end

function Component:CheckEnough(Resources)
  for ResourceId, Count in pairs(Resources) do
    local Resource = self.Resources[ResourceId]
    if not Resource then
      return false
    end
    if Count > Resource.Count then
      return false
    end
  end
  return true
end

function Component:CheckResourceEnough(Resources)
  return self:CheckEnough(Resources)
end

function Component:ResourceSale(ResourceId, Count)
  self.logger.info("ResourceSale", ResourceId, Count)
  
  local function callback(Ret)
    self.logger.info("ResourceSale callback", Ret, ResourceId, Count)
    EventManager:FireEvent(EventID.OnUpdateBagItem, "SaleItems", Ret, ResourceId, Count)
  end
  
  self:CallServer("ResourceSale", callback, ResourceId, Count)
end

function Component:ResourceBulkSale(SaleResources)
  if not SaleResources or type(SaleResources) ~= "table" then
    return
  end
  
  local function callback(Ret, SaleSucc, SaleFali)
    self.logger.info("ZJT_ ResourceBulkSale callback", Ret, SaleFali)
    EventManager:FireEvent(EventID.OnUpdateBagItem, "ResourceBulkSale", Ret, SaleSucc, SaleFali)
  end
  
  self:CallServer("ResourceBulkSale", callback, SaleResources)
end

function Component:LockResourceInBag(Tag, Id, FishSize)
  FishSize = FishSize or 0
  
  local function callback(Ret)
    self.logger.info("zjt_ LockResourceInBag callback", Ret, Id, Tag)
    local OpAction = 0 == FishSize and "StateChange" or "FishStateChange"
    EventManager:FireEvent(EventID.OnUpdateBagItem, OpAction, Ret, Id, FishSize)
  end
  
  if Tag == CommonConst.AllType.Resource then
    self:CallServer("LockResourceInBag", callback, Id, FishSize)
  elseif Tag == CommonConst.AllType.Weapon then
    self:CallServer("LockWeaponInBag", callback, Id)
  elseif Tag == CommonConst.AllType.Mod then
    self:CallServer("LockModInBag", callback, Id)
  end
end

function Component:UnLockResourceInBag(Tag, Id, FishSize)
  FishSize = FishSize or 0
  
  local function callback(Ret)
    self.logger.info("UnLockResourceInBag callback", Ret, Id)
    local OpAction = 0 == FishSize and "StateChange" or "FishStateChange"
    EventManager:FireEvent(EventID.OnUpdateBagItem, OpAction, Ret, Id, FishSize)
  end
  
  if Tag == CommonConst.AllType.Resource then
    self:CallServer("UnLockResourceInBag", callback, Id, FishSize)
  elseif Tag == CommonConst.AllType.Weapon then
    self:CallServer("UnLockWeaponInBag", callback, Id)
  elseif Tag == CommonConst.AllType.Mod then
    self:CallServer("UnLockModInBag", callback, Id)
  end
end

function Component:ChangeWheel(TargetIndex)
  local function callback(ret)
    EventManager:FireEvent(EventID.OnChangeWheel, ret)
  end
  
  self:CallServer("ChangeWheel", callback, TargetIndex)
end

function Component:ChangeBattleWheel(WheelIndex, SlotId, ResourceId)
  local function callback(ret)
    self.logger.debug("ChangeBattleWheel", ret, WheelIndex, SlotId, ResourceId)
    
    EventManager:FireEvent(EventID.OnChangeBattleWheel, ret, WheelIndex, SlotId, ResourceId)
  end
  
  self:CallServer("ChangeBattleWheel", callback, WheelIndex, SlotId, ResourceId)
end

function Component:ExchangeBattleWheel(WheelIndex, SlotId, TargetSlotId)
  local function callback(ret)
    EventManager:FireEvent(EventID.OnExchangeBattleWheel, ret, WheelIndex, SlotId, TargetSlotId)
  end
  
  self:CallServer("ExchangeBattleWheel", callback, WheelIndex, SlotId, TargetSlotId)
end

function Component:TakeOffBattleWheel(WheelIndex, SlotId)
  local function callback(ret)
    EventManager:FireEvent(EventID.OnTakeOffBattleWheel, ret, WheelIndex, SlotId)
  end
  
  self:CallServer("TakeOffBattleWheel", callback, WheelIndex, SlotId)
end

function Component:EquipAssisterWeapon(AssisterId, WeaponUuid)
  local function callback(ret)
    EventManager:FireEvent(EventID.OnEquipAssisterWeapon, ret, AssisterId, WeaponUuid)
  end
  
  self:CallServer("EquipAssisterWeapon", callback, AssisterId, WeaponUuid)
end

function Component:TakeOffAssisterWeapon(AssisterId, WeaponUuid)
  local function Callback(Ret)
    self.logger.info("ZJT_ TakeOffAssisterWeapon ServerCallClient ", Ret, AssisterId, WeaponUuid)
    
    EventManager:FireEvent(EventID.OnTakeOffAssisterWeapon, Ret, AssisterId, WeaponUuid)
  end
  
  self:CallServer("TakeOffAssisterWeapon", Callback, AssisterId, WeaponUuid)
end

function Component:UseWheelItemInBattle(ResourceId)
  ResourceId = tonumber(ResourceId)
  
  local function callback(ret)
    self.logger.debug("UseItemInBattle", ret)
    ErrorCode:Check(ret)
  end
  
  self:CallServer("UseItemInBattle", callback, ResourceId)
end

function Component:UseResourceInBag(ResourceId, Count, InCallBack)
  local function callback(ErrCode)
    self.logger.info("UseResourceInBag", ErrorCode:Name(ErrCode))
    
    ErrorCode:Check(ErrCode)
    if InCallBack then
      InCallBack()
    end
  end
  
  self:CallServer("UseResourceInBag", callback, tonumber(ResourceId), tonumber(Count))
end

function Component:UseOptResourceInBag(ResourceId, OptIdxList, InCallBack)
  DebugPrint("gmy@ResourceMgr Component:UseOptResourceInBag", ResourceId, OptIdxList)
  
  local function callback(ErrCode)
    self.logger.info("UseOptResourceInBag", ErrorCode:Name(ErrCode))
    ErrorCode:Check(ErrCode)
    if InCallBack then
      InCallBack(ErrCode)
    end
  end
  
  self:CallServer("UseOptResourceInBag", callback, tonumber(ResourceId), OptIdxList)
end

function Component:ChangeWheelName(NewName, WheelIndex)
  local function Callback(Ret)
    self.logger.debug("ZJT_ ChangeWheelName ServerCallClient Ret ", Ret)
    
    EventManager:FireEvent(EventID.OnWheelNameChanged, Ret, NewName, WheelIndex)
  end
  
  self:CallServer("ChangeWheelName", Callback, NewName, WheelIndex)
end

function Component:TakeOffAllBattleWheel(WheelIndex)
  local function Callback(Ret)
    self.logger.debug("ZJT_ TakeOffAllBattleWheel ServerCallClient Ret ", Ret)
    
    EventManager:FireEvent(EventID.OnWheelItemCleared, Ret, WheelIndex)
  end
  
  self:CallServer("TakeOffAllBattleWheel", Callback, WheelIndex)
end

function Component:TransformCoin4ToCoin1(Count, InCallBack)
  self.logger.debug("TransformCoin4ToCoin1 Begin ", Count)
  
  local function Callback(Ret)
    self.logger.debug("TransformCoin4ToCoin1 Callback ", Ret, Count)
    if InCallBack then
      InCallBack(Count)
    end
  end
  
  self:CallServer("TransformCoin4ToCoin1", Callback, Count)
end

function Component:ResourceBulkSaleFish(SaleResources)
  if not SaleResources or type(SaleResources) ~= "table" then
    return
  end
  
  local function Callback(Ret, SaleSucc, SaleSuccTransformResource)
    self.logger.info("ResourceBulkSaleFish callback", Ret, SaleSucc, SaleSuccTransformResource)
    EventManager:FireEvent(EventID.OnUpdateBagItem, "FishResourceBulkSale", Ret, SaleSucc, SaleSuccTransformResource)
  end
  
  self:CallServer("ResourceBulkSaleFish", Callback, SaleResources)
end

function Component:WalnutBulkSale(SaleWalnuts)
  local function Callback(Ret, SaleFucc)
    self.logger.debug("ZJT_ WalnutBulkSale ", Ret, SaleFucc)
    
    EventManager:FireEvent(EventID.OnUpdateWalnutItem, "WalnutBulkSale", Ret, SaleFucc)
  end
  
  self:CallServer("WalnutBulkSale", Callback, SaleWalnuts)
end

function Component:GetStoredCollectReward(Callback, RewardPaths)
  local function cb(ret, Rewards)
    if not ErrorCode:Check(ret) then
      return
    end
    if Callback then
      Callback(ret, Rewards)
    end
  end
  
  self:CallServer("GetStoredCollectReward", cb, RewardPaths)
end

return Component
