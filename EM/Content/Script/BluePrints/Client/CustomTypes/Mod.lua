local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local ItemUtils = require("Utils.ItemUtils")
local SkillUtils = require("Utils.SkillUtils")
local Mod = Class("Mod", CustomTypes.CustomAttr)
Mod.__Props__ = {
  Uuid = prop.prop("ObjId", "client save"),
  ModId = prop.prop("Int", "client save"),
  Level = prop.prop("Int", "client save", 0),
  Count = prop.prop("Int", "client save", 1),
  IsOriginal = prop.prop("Bool", "client save", true),
  LockState = prop.prop("Int", "client save", 0),
  Cost = prop.getter("CostGetter", "Cost"),
  CharUuids = prop.prop("ObjectIdList", "client save"),
  WeaponUuids = prop.prop("ObjectIdList", "client save"),
  ApplicationType = prop.getter("Data", "ApplicationType"),
  OriginalCost = prop.getter("Data", "Cost"),
  CostChange = prop.getter("Data", "CostChange"),
  Polarity = prop.getter("Data", "Polarity"),
  Rarity = prop.getter("Data", "Rarity"),
  RepeatGroup = prop.getter("Data", "RepeatGroup"),
  AddAttrs = prop.getter("Data", "AddAttrs"),
  PassiveEffects = prop.getter("Data", "PassiveEffects"),
  MaxLevel = prop.getter("Data", "MaxLevel"),
  Icon = prop.getter("Data", "Icon"),
  BreakDown = prop.getter("Data", "BreakDown"),
  ModUniteType = prop.getter("Data", "ModUniteType"),
  CurrentModCardLevel = prop.prop("Int", "client save"),
  CardLevelNeedNum = prop.getter("Data", "CardLevelNeedNum"),
  CardLevelNeedModId = prop.getter("Data", "CardLevelNeedModId"),
  ModCardLevelMax = prop.getter("Data", "ModCardLevelMax"),
  ReducePolarityEffect = prop.getter("Data", "ReducePolarityEffect"),
  ApplySlot = prop.getter("Data", "ApplySlot"),
  AddCharModCost = prop.getter("Data", "AddCharModCost"),
  RepeatModLevel = prop.getter("Data", "RepeatModLevel"),
  FilterTag = prop.getter("Data", "FilterTag"),
  TypeName = prop.getter("Data", "TypeName"),
  CardLevelNeedResourceId = prop.getter("Data", "CardLevelNeedResourceId")
}

function Mod:CostGetter()
  return {
    Cost = self:CalcCurrentCost()
  }
end

function Mod:_Init()
  if not skynet then
    self.ConflictUuids = CustomTypes.ObjectIdList()
  end
end

function Mod:IsCardLevelNeedModId(InModId)
  for _, ModId in ipairs(self.CardLevelNeedModId or {}) do
    if ModId == InModId then
      return true
    end
  end
  return false
end

function Mod:HasCardLevel()
  return self.CardLevelNeedNum and self.CardLevelNeedModId and self.ModCardLevelMax
end

function Mod:IsOriginalMaxLevel()
  return self.Level >= self.MaxLevel
end

function Mod:CalcExtralCharVolume(PreviewCost)
  if self.AddCharModCost and 0 ~= self.AddCharModCost then
    return math.floor((PreviewCost or self.Cost) * math.max(0, self.AddCharModCost or 0))
  end
  return 0
end

function Mod:GetSkillLevel()
  return self.Level
end

function Mod:ExpectCost(SkillLevel)
  return self:CalcCurrentCost() + (SkillLevel - self.Level) * self.CostChange
end

function Mod:NextCost()
  return self:ExpectCost(self:GetSkillLevel() + 1)
end

function Mod:Init(Uuid, ModId, Level)
  if not Uuid or not ModId then
    return
  end
  self.Uuid = Uuid
  self.ModId = ModId
  self:SetLevel(math.min(Level or 0, self:GetTotalMaxLevel()))
  self:_Init()
end

function Mod:IsMaxLevel()
  return self.Level == self:GetTotalMaxLevel()
end

function Mod:IsFinalMaxLevel()
  return self:IsMaxLevel()
end

function Mod:GetName()
  return GText(self:Data().TypeName) .. GText(self:Data().Name)
end

function Mod:IsAura()
  if not self.ApplySlot then
    return false
  end
  if type(self.ApplySlot) == "table" then
    for _, slot in ipairs(self.ApplySlot) do
      if 9 == slot then
        return true
      end
    end
  else
    return 9 == self.ApplySlot
  end
  return false
end

function Mod:Data()
  local Data = DataMgr.Mod[self.ModId]
  if not Data and not skynet then
    DebugPrint("ERROR::", "ModId:" .. self.ModId .. "\228\184\141\229\173\152\229\156\168, \229\133\136\230\155\180\230\150\176\239\188\140\228\184\141\232\166\129\231\148\168\232\128\129\229\143\183\239\188\140\231\148\168\230\150\176\229\143\183\233\135\141\232\175\149\239\188\140\232\191\152\230\156\137\233\151\174\233\162\152\229\176\177\230\137\190\231\173\150\229\136\146\230\163\128\230\159\165\228\184\139Mod\232\161\168\228\191\174\230\148\185\230\152\175\229\144\166\229\144\140\230\173\165\229\143\140\231\171\175")
    return
  end
  return Data
end

function Mod:CalcModCostData()
  local Data = DataMgr.Mod[self.ModId]
end

function Mod:LevelData()
  return DataMgr.ModLevel
end

function Mod:IsLock()
  return self.LockState == CommonConst.CommonStatus.Lock
end

function Mod:Lock()
  if not self:IsLock() then
    self.LockState = CommonConst.CommonStatus.Lock
    return true
  end
  return false
end

function Mod:UnLock()
  if not self:IsUnLock() then
    self.LockState = CommonConst.CommonStatus.UnLock
    return true
  end
  return false
end

function Mod:IsUnLock()
  return self.LockState == CommonConst.CommonStatus.UnLock
end

function Mod:CalcMultiplier(ModMultiplier)
  local ModData = self:Data()
  if not ModData.AddModMultiplier then
    return
  end
  for AttrName, Value in pairs(ModData.AddModMultiplier) do
    ModMultiplier[AttrName] = (ModMultiplier[AttrName] or 0) + Value
  end
end

function Mod:CountModPolarity(ModPolarityMap)
  if self.Polarity <= 0 then
    return
  end
  if not ModPolarityMap[self.Polarity] then
    ModPolarityMap[self.Polarity] = 0
  end
  ModPolarityMap[self.Polarity] = ModPolarityMap[self.Polarity] + 1
end

function Mod:CalcAttrs(BaseValues, ModRateValues, ModAddValues, ModUniteTypes, ModMultiplier, ModPolarityMap)
  local ModData = self:Data()
  if not ModData.AddAttrs then
    return
  end
  if ModData.PolarityNeedNum then
    for Polarity, NeedNum in pairs(ModData.PolarityNeedNum) do
      if not ModPolarityMap[Polarity] or NeedNum > ModPolarityMap[Polarity] then
        return
      end
    end
  end
  for Index, AttrData in pairs(ModData.AddAttrs) do
    local UniqueName = table.concat({
      "Mod:[",
      self.ModId,
      "]AddAttrs:[",
      Index,
      "]"
    })
    self:CalcOneAttrData(BaseValues, ModRateValues, ModAddValues, AttrData, 1, ModMultiplier, UniqueName)
  end
  if self.ModUniteType then
    local UniteNum = ModUniteTypes[self.ModUniteType]
    for Index, AttrData in pairs(ModData.UniteAddAttrs) do
      local UniqueName = table.concat({
        "Mod:[",
        self.ModId,
        "]UniteAddAttrs:[",
        Index,
        "]"
      })
      self:CalcOneAttrData(BaseValues, ModRateValues, ModAddValues, AttrData, UniteNum, ModMultiplier, UniqueName)
    end
  end
end

function Mod:CalcOneAttrData(BaseValues, ModRateValues, ModAddValues, AttrData, UniteNum, ModMultiplier, UniqueName)
  local AttrName = AvatarUtils:GetAttrNameFromAttrData(AttrData, UniqueName)
  if "ATK" == AttrName then
    for _AttrName, _ in pairs(DataMgr.Attribute) do
      if AttrData.Value then
        assert(nil, self.ModId .. "\229\143\183Mod\228\184\141\229\133\129\232\174\184\228\189\191\231\148\168Value\229\162\158\229\138\160ATK")
      end
      self:CalcOneAttrs("ATK_" .. _AttrName, BaseValues, ModRateValues, CommonConst.RateIndex.GlobalATK, ModAddValues, AttrData, UniteNum, ModMultiplier)
    end
  else
    self:CalcOneAttrs(AttrName, BaseValues, ModRateValues, CommonConst.RateIndex.Default, ModAddValues, AttrData, UniteNum, ModMultiplier)
  end
end

function Mod:CalcOneAttrs(AttrName, BaseValues, ModRateValues, RateIndex, ModAddValues, AttrData, UniteNum, ModMultiplier)
  if AttrData.Rate then
    if not ModRateValues[AttrName] then
      ModRateValues[AttrName] = {}
    end
    ModRateValues = ModRateValues[AttrName]
    local IncreaseRateValue
    if type(AttrData.Rate) == "number" then
      IncreaseRateValue = (AttrData.Rate + (AttrData.LevelGrow or 0) * self.Level) * (UniteNum or 1)
    else
      local _AttrData = SkillUtils.GrowProxyBySkillLevel("Mod", self.ModId, self.Level, AttrData)
      IncreaseRateValue = _AttrData.Rate * (UniteNum or 1)
    end
    if AttrData.AllowModMultiplier then
      if AttrData.AllowModMultiplier == "All" then
        local TotalValue = 0
        for MultiplierName, Value in pairs(ModMultiplier) do
          if not CommonUtils.HasValue(CommonConst.IndependentModMultiplier, MultiplierName) then
            TotalValue = TotalValue + Value
          end
        end
        IncreaseRateValue = IncreaseRateValue * (1 + TotalValue)
      elseif ModMultiplier[AttrData.AllowModMultiplier] then
        IncreaseRateValue = IncreaseRateValue * (1 + ModMultiplier[AttrData.AllowModMultiplier])
      end
    end
    ModRateValues[RateIndex] = (ModRateValues[RateIndex] or 0) + IncreaseRateValue
  end
  if AttrData.Value then
    local IncreaseValue
    if "number" == type(AttrData.Value) then
      IncreaseValue = (AttrData.Value + (AttrData.LevelGrow or 0) * self.Level) * (UniteNum or 1)
    else
      local _AttrData = SkillUtils.GrowProxyBySkillLevel("Mod", self.ModId, self.Level, AttrData)
      IncreaseValue = _AttrData.Value * (UniteNum or 1)
    end
    if AttrData.AllowModMultiplier then
      if AttrData.AllowModMultiplier == "All" then
        local TotalValue = 0
        for MultiplierName, Value in pairs(ModMultiplier) do
          if not CommonUtils.HasValue(CommonConst.IndependentModMultiplier, MultiplierName) then
            TotalValue = TotalValue + Value
          end
        end
        IncreaseValue = IncreaseValue * (1 + TotalValue)
      elseif ModMultiplier[AttrData.AllowModMultiplier] then
        IncreaseValue = IncreaseValue * (1 + ModMultiplier[AttrData.AllowModMultiplier])
      end
    end
    ModAddValues[AttrName] = (ModAddValues[AttrName] or 0) + IncreaseValue
  end
end

function Mod:GetLevelUpItems(CurrentLevel, TargetLevel)
  if TargetLevel <= CurrentLevel then
    return {}
  end
  local LevelInfo = self:LevelData()
  local result = {}
  local LevelConsume
  for i = CurrentLevel + 1, TargetLevel do
    LevelConsume = LevelInfo[i].ConsumeRarity[self.Rarity]
    if LevelConsume then
      ItemUtils:AddItemsToTarget(result, LevelConsume)
    end
  end
  return result
end

function Mod:GetTotalMaxLevel()
  return self.MaxLevel + (self.ModCardLevelMax or 0)
end

function Mod:CalcCurrentCost()
  return math.max(0, self.OriginalCost + self.Level * (self.CostChange or 1))
end

function Mod:SetLevel(Level)
  if Level > self:GetTotalMaxLevel() then
    return false
  end
  self.Level = Level
  return true
end

function Mod:AppendCharUuid(CharUuid)
  self.CharUuids:Append(CharUuid)
end

function Mod:RemoveCharUuid(CharUuid)
  return self.CharUuids:Remove(CharUuid)
end

function Mod:AppendWeaponUuid(WeaponUuid)
  self.WeaponUuids:Append(WeaponUuid)
end

function Mod:RemoveAllTargetCharUuid(CharUuid)
  for Index = 1, self.CharUuids:Length() do
    if not self:RemoveCharUuid(CharUuid) then
      return
    end
  end
end

function Mod:RemoveAllTargetWeaponUuid(WeaponUuid)
  for Index = 1, self.WeaponUuids:Length() do
    if not self:RemoveWeaponUuid(WeaponUuid) then
      return
    end
  end
end

function Mod:RemoveWeaponUuid(WeaponUuid)
  return self.WeaponUuids:Remove(WeaponUuid)
end

function Mod:IsEquipped()
  return self.WeaponUuids:Length() > 0 or self.CharUuids:Length() > 0
end

function Mod:AddCount(Count)
  if type(Count) == "number" and Count > 0 then
    self.Count = self.Count + Count
    return true
  end
  return false
end

function Mod:ReduceCount(Count)
  if type(Count) == "number" and Count > 0 and Count <= self.Count then
    self.Count = self.Count - Count
    return true
  end
  return false
end

function Mod:IsValid()
  return self.Count > 0
end

FormatProperties(Mod)
local ModDict = Class("ModDict", CustomTypes.CustomDict)
ModDict.KeyType = BaseTypes.ObjId
ModDict.ValueType = Mod

function ModDict:NewMod(Uuid, ModId, Level)
  Level = Level or 0
  local mod = Mod(Uuid, ModId, Level)
  return mod
end

function ModDict:GetNewMod(Uuid, ModId, Level)
  local Mod = self[Uuid]
  Mod = Mod or self:NewMod(Uuid, ModId, Level)
  return Mod
end

local ModSlot = Class("ModSlot", CustomTypes.CustomAttr)

function ModSlot:Init(SlotId, Polarity, Status, ModEid)
  if not SlotId then
    return
  end
  self.SlotId = SlotId
  self.Polarity = Polarity or CommonConst.NonePolarity
  self.ModEid = ModEid
  self.Status = Status or CommonConst.CommonStatus.UnLock
end

function ModSlot:IsLock()
  return self.Status == CommonConst.CommonStatus.Lock
end

function ModSlot:IsUnLock()
  return self.Status == CommonConst.CommonStatus.UnLock
end

function ModSlot:UnLock()
  self.Status = CommonConst.CommonStatus.UnLock
end

function ModSlot:IsPolarity()
  return self.Polarity > 0
end

function ModSlot:GetModCost(Polarity, Cost, ExPolarity)
  ExPolarity = ExPolarity or self.Polarity
  return AvatarUtils:GetModSlotCostImpl(Polarity, Cost, ExPolarity)
end

FormatProperties(ModSlot)
local ModSlots = Class("ModSlots", CustomTypes.CustomDict)
ModSlots.KeyType = BaseTypes.Int
ModSlots.ValueType = ModSlot

function ModSlots:Init(inner, PolarityList, StatusList, EnhanceLevel)
  self.Super.Init(self, inner)
  if nil == PolarityList then
    return
  end
  for SlotId = 1, PolarityList:Length() do
    local Status = StatusList[SlotId]
    self[SlotId] = ModSlot(SlotId, PolarityList[SlotId], Status)
  end
end

function ModSlots:AddModSlots(PolarityList, StatusList, EnhanceLevel)
  for SlotId = 1, PolarityList:Length() do
    local Status = CommonConst.CommonStatus.UnLock
    if nil ~= StatusList and nil ~= EnhanceLevel and EnhanceLevel < StatusList[SlotId] then
      Status = CommonConst.CommonStatus.Lock
    end
    self[SlotId] = ModSlot(SlotId, PolarityList[SlotId], Status)
  end
end

function ModSlots:NewModSlot(SlotId, Polarity, Status)
  local mod_slot = ModSlot(SlotId, Polarity, Status)
  return mod_slot
end

function ModSlots:AddModSlot(SlotId, Polarity, Status)
  if nil ~= self[SlotId] then
    return
  end
  self[SlotId] = ModSlot(SlotId, Polarity, Status)
end

function ModSlots:GetModSlotById(SlotId)
  return self[SlotId]
end

function ModSlots:GetModSlotByModEid(ModEid)
  for SlotId, ModSlot in pairs(self) do
    if ModSlot.ModEid == ModEid then
      return ModSlot
    end
  end
  return nil
end

function ModSlots:IsAllEmpty()
  for SlotId, ModSlot in pairs(self) do
    if ModSlot.ModEid and ModSlot.ModEid ~= "" then
      return false
    end
  end
  return true
end

local ModSuits = Class("ModSuits", CustomTypes.CustomList)
ModSuits.ValueType = ModSlots

function ModSuits:AddModSuit(PolarityList, StatusList, EnhanceLevel)
  local mod_Slots = ModSlots(nil, PolarityList, StatusList, EnhanceLevel)
  self:Append(mod_Slots)
  return mod_Slots
end

local SimpleMod = Class("SimpleMod", CustomTypes.CustomAttr)
SimpleMod.__Props__ = {
  ModId = prop.prop("Int", "client save"),
  Level = prop.prop("Int", "client save")
}

function SimpleMod:Init(ModId, Level)
  self.ModId = ModId
  self.Level = Level or 0
end

FormatProperties(SimpleMod)
local SimpleModSlot = Class("SimpleModSlot", CustomTypes.CustomAttr)
SimpleModSlot.__Props__ = {
  SlotId = prop.prop("Int", "client save"),
  Status = prop.prop("Int", "client save"),
  Polarity = prop.prop("Int", "client save"),
  ModId = prop.prop("Int", "client save"),
  Level = prop.prop("Int", "client save")
}
FormatProperties(SimpleModSlot)
local SimpleModSlots = Class("SimpleModSlots", CustomTypes.CustomDict)
SimpleModSlots.KeyType = BaseTypes.Int
SimpleModSlots.ValueType = SimpleModSlot
return {
  Mod = Mod,
  ModDict = ModDict,
  ModSlot = ModSlot,
  ModSlots = ModSlots,
  ModSuits = ModSuits,
  SimpleMod = SimpleMod,
  SimpleModSlot = SimpleModSlot,
  SimpleModSlots = SimpleModSlots
}
