local Decorator = require("BluePrints.Client.Wrapper.Decorator")
local ModController = require("BluePrints.UI.WBP.Armory.Mod.Utils.ModController")
local Component = {}
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
for key, value in pairs(Decorator) do
  Component[key] = value
end
setmetatable(Component, getmetatable(Decorator))

function Component:EnterWorld()
  ModController:Init()
  ArmoryUtils:CreateReddotInfos(CommonConst.DataType.Mod)
  self.ModCountMap = {}
  self.ModUuid2ModIdMap = {}
  for Uuid, Mod in pairs(self.Mods) do
    local ModId = Mod.ModId
    self.ModCountMap[ModId] = (self.ModCountMap[ModId] or 0) + Mod.Count
    self.ModUuid2ModIdMap[Uuid] = {
      Id = ModId,
      Count = Mod.Count
    }
  end
end

function Component:LeaveWorld()
  ModController:Destory()
end

function Component:CheckModEnough(CheckData)
  local ModStatistics = {}
  for key, Mod in pairs(self.Mods) do
    if not ModStatistics[Mod.ModId] then
      ModStatistics[Mod.ModId] = 0
    end
    ModStatistics[Mod.ModId] = ModStatistics[Mod.ModId] + 1
  end
  for ModId, Count in pairs(CheckData) do
    if not ModStatistics[ModId] or Count > ModStatistics[ModId] then
      return false
    end
  end
  return true
end

function Component:_OnPropChangeMods(keys)
  PrintTable(keys, 2, LXYTag .. " +_OnPropChangeMods")
  if #keys > 1 then
    local ModUuid, AttrName = table.unpack(keys)
    if "Count" == AttrName then
      local Mod = self.Mods[ModUuid]
      if 0 == Mod.Count and 0 == Mod.Level then
        local FakeContent = {
          UnitId = Mod.ModId,
          Type = CommonConst.DataType.Mod
        }
        ArmoryUtils:SetReddotRead(FakeContent, true, false, true)
      end
    end
  elseif 1 == #keys then
    local ModUuid = table.unpack(keys)
    local Mod = self.Mods[ModUuid]
    if Mod and Mod.Count > 0 and 0 == Mod.Level then
      ArmoryUtils:TryAddNewModReddot(Mod, Mod.ModId)
    end
  end
  local ModUuid = keys and keys[1]
  if ModUuid then
    if self.Mods[ModUuid] then
      local ModId = self.Mods[ModUuid].ModId
      if self.ModUuid2ModIdMap[ModUuid] then
        local PrevModCount = self.ModUuid2ModIdMap[ModUuid].Count
        local NewModCount = self.Mods[ModUuid].Count
        if not self.ModCountMap[ModId] then
          self.ModCountMap[ModId] = NewModCount
        else
          self.ModCountMap[ModId] = self.ModCountMap[ModId] - PrevModCount + NewModCount
        end
      else
        self.ModCountMap[ModId] = (self.ModCountMap[ModId] or 0) + self.Mods[ModUuid].Count
      end
      self.ModUuid2ModIdMap[ModUuid] = {
        Id = ModId,
        Count = self.Mods[ModUuid].Count
      }
    else
      if self.ModUuid2ModIdMap[ModUuid] then
        local ModId = self.ModUuid2ModIdMap[ModUuid].Id
        local ModCount = self.ModUuid2ModIdMap[ModUuid].Count or 1
        if self.ModCountMap[ModId] then
          self.ModCountMap[ModId] = self.ModCountMap[ModId] - ModCount
          if self.ModCountMap[ModId] <= 0 then
            self.ModCountMap[ModId] = nil
          end
        end
      else
        DebugPrint(LogTag.Error, "Tianyi@ ModUuid not found in ModUuid2ModIdMap, ModUuid = " .. CommonUtils.ObjId2Str(ModUuid))
      end
      self.ModUuid2ModIdMap[ModUuid] = nil
    end
  end
end

function Component:GetModCountById(ModId)
  return self.ModCountMap[ModId] or 0
end

function Component:ModCardLevelUp(InCallbackInfo, ModUuid, SelectParams)
  SelectParams = SelectParams or {}
  local PendingDeleteMods = {}
  for ModId, Value in pairs(SelectParams) do
    for Uuid, Count in pairs(Value) do
      table.insert(PendingDeleteMods, self.Mods[Uuid])
    end
  end
  
  local function Callback(Ret)
    self.logger.info("ZJT_ ServerCallClient ModCardLevelUp ", Ret)
    if not InCallbackInfo then
      return
    end
    for _, Mod in ipairs(PendingDeleteMods) do
      if 0 == Mod.Level and not self.Mods[Mod.Uuid] then
        local FakeContent = {
          UnitId = Mod.ModId,
          ApplicationType = Mod.ApplicationType,
          Type = CommonConst.DataType.Mod
        }
        ArmoryUtils:SetReddotRead(FakeContent, true, false, true)
      end
    end
    local bTakeOff = table.unpack(InCallbackInfo.ExParams)
    InCallbackInfo.Func(InCallbackInfo.Obj, Ret, ModUuid, SelectParams, bTakeOff)
  end
  
  self:CallServer("ModCardLevelUp", Callback, ModUuid, SelectParams)
end

Component:LimitCall(1)

function Component:ModLevelUp(InCallbackInfo, ModUuid, CurrentLevel, TargetLevel)
  self.logger.debug("ModLevelUp", CommonUtils.ObjId2Str(ModUuid), CurrentLevel, TargetLevel)
  local Mod = self.Mods[ModUuid]
  
  local function callback(Ret, NewModUuid)
    self.logger.debug("ModLevelUp callback", Ret, CommonUtils.ObjId2Str(ModUuid), CurrentLevel, TargetLevel)
    if not InCallbackInfo then
      return
    end
    if 0 == Mod.Level and not self.Mods[Mod.Uuid] then
      local FakeContent = {
        UnitId = Mod.ModId,
        ApplicationType = Mod.ApplicationType,
        Type = CommonConst.DataType.Mod
      }
      ArmoryUtils:SetReddotRead(FakeContent, true, false, true)
    end
    local bTakeOff = table.unpack(InCallbackInfo.ExParams)
    InCallbackInfo.Func(InCallbackInfo.Obj, Ret, ModUuid, NewModUuid, bTakeOff)
  end
  
  self:CallServer("ModLevelUp", callback, ModUuid, Mod.Count, CurrentLevel, TargetLevel)
end

function Component:ModBulkDecompose(TargetModDecompose)
  if not TargetModDecompose or type(TargetModDecompose) ~= "table" then
    return
  end
  local PendingDeleteMods = {}
  for K, _ in pairs(TargetModDecompose) do
    table.insert(PendingDeleteMods, self.Mods[K])
  end
  
  local function Callback(Ret, DecomposeSuccStuff, DecomposeSuccMod)
    EventManager:FireEvent(EventID.OnUpdateBagItem, "ModBulkSale", Ret, DecomposeSuccStuff, DecomposeSuccMod)
    for _, Mod in ipairs(PendingDeleteMods) do
      if 0 == Mod.Level and not self.Mods[Mod.Uuid] then
        local FakeContent = {
          UnitId = Mod.ModId,
          ApplicationType = Mod.ApplicationType,
          Type = CommonConst.DataType.Mod
        }
        ArmoryUtils:SetReddotRead(FakeContent, true, false, true)
      end
    end
  end
  
  self:CallServer("ModBulkDecompose", Callback, TargetModDecompose)
end

function Component:ChangeCharModSlotListPolarity(InCallbackInfo, CharUuid, ModSlotList, PolarityList)
  local function callback(Ret)
    self.logger.debug("ChangeCharModSlotListPolarity callback", Ret, CharUuid, ModSlotList, PolarityList)
    
    if not InCallbackInfo then
      return
    end
    InCallbackInfo.Func(InCallbackInfo.Obj, Ret, CharUuid, ModSlotList, PolarityList)
  end
  
  self:CallServer("ChangeCharModSlotListPolarity", callback, CharUuid, ModSlotList, PolarityList)
end

function Component:ChangeWeaponModSlotListPolarity(InCallbackInfo, WeaponUuid, ModSlotList, PolarityList)
  local function callback(Ret)
    self.logger.debug("ChangeWeaponModSlotListPolarity callback", Ret, WeaponUuid, ModSlotList, PolarityList)
    
    if not InCallbackInfo then
      return
    end
    InCallbackInfo.Func(InCallbackInfo.Obj, Ret, WeaponUuid, ModSlotList, PolarityList)
  end
  
  self:CallServer("ChangeWeaponModSlotListPolarity", callback, WeaponUuid, ModSlotList, PolarityList)
end

function Component:GetModCount2ModId(ModId)
  local Count = 0
  if not ModId or type(ModId) ~= "number" then
    return Count
  end
  for _, Mod in pairs(self.Mods) do
    if ModId == Mod.ModId then
      Count = Count + Mod.Count
    end
  end
  return Count
end

function Component:GetModsByModId(ModId)
  local ResultMods = {}
  for _, Mod in pairs(self.Mods) do
    if ModId == Mod.ModId then
      table.insert(ResultMods, Mod)
    end
  end
  return ResultMods
end

return Component
