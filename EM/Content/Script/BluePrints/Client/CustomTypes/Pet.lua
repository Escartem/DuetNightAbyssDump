local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local SkillUtils = require("Utils.SkillUtils")
local Pet = Class("Pet", CustomTypes.CustomAttr)
Pet.__Props__ = {
  UniqueId = prop.prop("Int", "client save"),
  PetId = prop.prop("Int", "client save"),
  Level = prop.prop("Int", "client save", 1),
  Exp = prop.prop("Int", "client save", 0),
  BreakNum = prop.prop("Int", "client save", 0),
  IsLock = prop.prop("Bool", "client save", false),
  Entry = prop.prop("IntList", "client save", {}),
  Name = prop.prop("Str", "client save", "")
}

function Pet:Init(PetId, UniqueId)
  self.PetId = PetId
  self.UniqueId = UniqueId
end

function Pet:Data()
  local Data = DataMgr.Pet[self.PetId]
  if not Data and not skynet then
    DebugPrint("ERROR::", "\229\174\160\231\137\169ID: " .. self.PetId .. "\230\178\161\230\156\137Pet\233\133\141\231\189\174\239\188\140\229\133\136\230\155\180\230\150\176\239\188\140\228\184\141\232\166\129\231\148\168\232\128\129\229\143\183\239\188\140\231\148\168\230\150\176\229\143\183\233\135\141\232\175\149\239\188\140\232\191\152\230\156\137\233\151\174\233\162\152\229\176\177\230\137\190\231\173\150\229\136\146\230\163\128\230\159\165\228\184\139Pet\232\161\168\228\191\174\230\148\185\230\152\175\229\144\166\229\144\140\230\173\165\229\136\176\229\143\140\231\171\175")
  end
  return Data
end

function Pet:GetName()
  return GText(self:Data().Name)
end

function Pet:BreakData()
  local BreakData = DataMgr.PetBreak[self.PetId]
  if not BreakData and not skynet then
    DebugPrint("ERROR::", "\229\174\160\231\137\169ID: " .. self.PetId .. "\230\178\161\230\156\137PetBreak\233\133\141\231\189\174\239\188\140\229\133\136\230\155\180\230\150\176\239\188\140\228\184\141\232\166\129\231\148\168\232\128\129\229\143\183\239\188\140\231\148\168\230\150\176\229\143\183\233\135\141\232\175\149\239\188\140\232\191\152\230\156\137\233\151\174\233\162\152\229\176\177\230\137\190\231\173\150\229\136\146\230\163\128\230\159\165\228\184\139Pet\232\161\168\228\191\174\230\148\185\230\152\175\229\144\166\229\144\140\230\173\165\229\136\176\229\143\140\231\171\175")
  end
  return BreakData
end

function Pet:LevelUpData(Level)
  if 0 == Level then
    return {PetLevel = 0, PetLevelMaxExp = 0}
  end
  local LevelUpData = DataMgr.PetLevelUp[Level and Level or self.Level]
  if not LevelUpData and not skynet then
    DebugPrint("ERROR::", "\229\174\160\231\137\169\231\173\137\231\186\167: " .. Level or self.Level .. "\230\178\161\230\156\137PetLevelUp\233\133\141\231\189\174\239\188\140\229\133\136\230\155\180\230\150\176\239\188\140\228\184\141\232\166\129\231\148\168\232\128\129\229\143\183\239\188\140\231\148\168\230\150\176\229\143\183\233\135\141\232\175\149\239\188\140\232\191\152\230\156\137\233\151\174\233\162\152\229\176\177\230\137\190\231\173\150\229\136\146\230\163\128\230\159\165\228\184\139Pet\232\161\168\228\191\174\230\148\185\230\152\175\229\144\166\229\144\140\230\173\165\229\136\176\229\143\140\231\171\175")
  end
  return LevelUpData
end

function Pet:IsMaxLevelBeforeBreak()
  return self.Level >= self:GetMaxLevel()
end

function Pet:IsMaxBreak()
  local BreakConf = self:BreakData()
  return self.BreakNum >= #BreakConf
end

function Pet:IsFinalMaxLevel()
  local Data = self:Data()
  local BreakConf = self:BreakData()
  local NextBreak = BreakConf[self.BreakNum + 1]
  if NextBreak then
    return false
  end
  return self.Level >= Data.PetMaxLevel
end

function Pet:GetNextMaxLevel()
  local BreakConf = self:BreakData()
  local NextBreak = BreakConf[self.BreakNum + 1]
  if NextBreak and NextBreak.PetBreakLevel then
    return NextBreak.PetBreakLevel
  else
    local Data = self:Data()
    return Data.PetMaxLevel
  end
end

function Pet:GetMaxLevel()
  local BreakConf = self:BreakData()
  local NowBreak = BreakConf[self.BreakNum]
  if NowBreak and NowBreak.PetBreakLevel then
    return NowBreak.PetBreakLevel
  else
    local Data = self:Data()
    return Data.PetMaxLevel
  end
end

function Pet:GetMaxExp()
  local LevelUpData = self:LevelUpData()
  return LevelUpData.PetLevelMaxExp
end

function Pet:GetPreviewLevelByExp(PreviewExp)
  local TempPreview = PreviewExp
  local PreviewLevel = self.Level
  for Level = self.Level, #DataMgr.PetLevelUp do
    if TempPreview < self:LevelUpData(Level).PetLevelMaxExp then
      break
    end
    PreviewLevel = PreviewLevel + 1
    TempPreview = TempPreview - self:LevelUpData(Level).PetLevelMaxExp
  end
  return PreviewLevel
end

function Pet:GetSkillLevel(BreakNum)
  return (BreakNum or self.BreakNum) + 1
end

function Pet:IsResourcePet()
  return 2 == self:Data().PetType
end

function Pet:IsPremium()
  return not not self:Data().Premium
end

function Pet:BattleData(PetOrEntryId)
  PetOrEntryId = PetOrEntryId or self.PetId
  local BattlePetId
  if DataMgr.Pet[PetOrEntryId] then
    BattlePetId = DataMgr.Pet[PetOrEntryId] and DataMgr.Pet[PetOrEntryId].BattlePetId
  else
    BattlePetId = DataMgr.PetEntry[PetOrEntryId] and DataMgr.PetEntry[PetOrEntryId].BattlePetID
  end
  local Data = DataMgr.BattlePet[BattlePetId]
  if not Data then
    DebugPrint("ERROR::", "\229\174\160\231\137\169ID: " .. PetOrEntryId .. "\230\178\161\230\156\137BattlePet\233\133\141\231\189\174\239\188\140\229\133\136\230\155\180\230\150\176\239\188\140\228\184\141\232\166\129\231\148\168\232\128\129\229\143\183\239\188\140\231\148\168\230\150\176\229\143\183\233\135\141\232\175\149\239\188\140\232\191\152\230\156\137\233\151\174\233\162\152\229\176\177\230\137\190\231\173\150\229\136\146\230\163\128\230\159\165\228\184\139Pet\232\161\168\228\191\174\230\148\185\230\152\175\229\144\166\229\144\140\230\173\165\229\136\176\229\143\140\231\171\175")
  end
  return Data
end

function Pet:EntryData(EntryId)
  local Data = DataMgr.PetEntry[EntryId]
  if not Data then
    DebugPrint("ERROR::", "\232\175\141\230\157\161ID: " .. EntryId .. "\230\178\161\230\156\137\229\175\185\229\186\148Data\239\188\140\229\133\136\230\155\180\230\150\176\232\175\149\232\175\149\239\188\140\232\191\152\230\156\137\233\151\174\233\162\152\229\176\177\230\137\190\231\173\150\229\136\146\230\163\128\230\159\165\228\184\139Pet\232\161\168\228\191\174\230\148\185\230\152\175\229\144\166\229\144\140\230\173\165\229\136\176\229\143\140\231\171\175")
  end
  return Data
end

function Pet:CalcProvideExp()
  local TotalValue = 0
  local BreakData = self:BreakData()
  local PetLvExp = DataMgr.PetLvToExp
  for i = 0, self.BreakNum do
    local MaxLevel = self.Level
    MaxLevel = i < self.BreakNum and BreakData and BreakData[i] and BreakData[i].PetBreakLevel or MaxLevel
    TotalValue = PetLvExp[MaxLevel] and TotalValue + PetLvExp[MaxLevel] or TotalValue
  end
  local ConsumePetBaseExpFix = self:PetConsumeExpFix()
  for _, EntryId in pairs(self.Entry) do
    if 0 ~= EntryId then
      local EntryConsumeExpFix = self:PetEntryConsumeExpFix(EntryId)
      ConsumePetBaseExpFix = ConsumePetBaseExpFix + EntryConsumeExpFix
    end
  end
  local Data = self:Data()
  return TotalValue + self.Exp + Data.PetExp * (1 + ConsumePetBaseExpFix)
end

function Pet:PetConsumeExpFix()
  local BattleData = self:BattleData()
  local ConsumeExpFix = BattleData and BattleData.ConsumeExpFix
  if not ConsumeExpFix then
    return 0
  end
  local GrowData = SkillUtils.GetGrowData("BattlePet", self:Data().BattlePetId, self.BreakNum + 1)
  if GrowData and string.sub(ConsumeExpFix, 1, 1) == "#" then
    ConsumeExpFix = tonumber(string.sub(ConsumeExpFix, 2, -1))
    return GrowData[ConsumeExpFix].Value
  end
  return 0
end

function Pet:PetEntryConsumeExpFix(EntryId)
  local BattlePetId = DataMgr.PetEntry[EntryId] and DataMgr.PetEntry[EntryId].BattlePetID
  if not BattlePetId then
    return 0
  end
  local BattlePetLevel = DataMgr.PetEntry[EntryId] and DataMgr.PetEntry[EntryId].BattlePetLevel
  if not BattlePetLevel then
    return 0
  end
  local ConsumeExpFix = DataMgr.BattlePet[BattlePetId] and DataMgr.BattlePet[BattlePetId].ConsumeExpFix
  if not ConsumeExpFix then
    return 0
  end
  local GrowData = SkillUtils.GetGrowData("BattlePet", BattlePetId, BattlePetLevel)
  if GrowData and string.sub(ConsumeExpFix, 1, 1) == "#" then
    ConsumeExpFix = tonumber(string.sub(ConsumeExpFix, 2, -1))
    return GrowData[ConsumeExpFix].Value
  end
  return 0
end

function Pet:BattleDump(Avatar)
  local Info = {
    PetId = self.PetId
  }
  local PetLevel = self:GetSkillLevel()
  if 1 ~= PetLevel then
    Info.PetLevel = PetLevel
  end
  Info.EntryIds = {}
  for _, EntryId in pairs(self.Entry) do
    table.insert(Info.EntryIds, EntryId)
  end
  return Info
end

function Pet:CalcMultiplier(ModMultiplier)
  local PetData = self:BattleData()
  local PetId = PetData.PetId
  if PetData.AddModMultiplier then
    local _PetData = SkillUtils.GrowProxyBySkillLevel("BattlePet", PetId, self:GetSkillLevel(), PetData.AddModMultiplier)
    for AttrName, _ in pairs(PetData.AddModMultiplier) do
      ModMultiplier[AttrName] = (ModMultiplier[AttrName] or 0) + _PetData[AttrName]
    end
  end
  for _, EntryId in pairs(self.Entry) do
    if 0 ~= EntryId then
      local EntryData = self:EntryData(EntryId)
      local AffixData = self:BattleData(EntryId)
      if AffixData.AddModMultiplier then
        local PetLevel = EntryData.BattlePetLevel
        local _AffixData = SkillUtils.GrowProxyBySkillLevel("BattlePet", AffixData.PetId, PetLevel, AffixData.AddModMultiplier)
        for AttrName, _ in pairs(AffixData.AddModMultiplier) do
          ModMultiplier[AttrName] = (ModMultiplier[AttrName] or 0) + _AffixData[AttrName]
        end
      end
    end
  end
end

function Pet:CalcAttrs(BaseValues, ModRateValues, ModAddValues, ModMultiplier)
  local PetData = self:BattleData()
  local PetId = PetData.PetId
  if PetData.AddAttrs then
    for Index, AttrData in pairs(PetData.AddAttrs) do
      local UniqueName = table.concat({
        "Pet:[",
        PetId,
        "]AddAttrs:[",
        Index,
        "]"
      })
      self:CalcOneAttrData(BaseValues, ModRateValues, ModAddValues, AttrData, ModMultiplier, UniqueName)
    end
  end
  for _, EntryId in pairs(self.Entry) do
    if 0 ~= EntryId then
      local EntryData = self:EntryData(EntryId)
      local AffixData = self:BattleData(EntryId)
      if AffixData.AddAttrs then
        local AffixEnhanceLevel = EntryData.BattlePetLevel
        for Index, AttrData in pairs(AffixData.AddAttrs) do
          local UniqueName = table.concat({
            "Pet:[",
            AffixData.PetId,
            "]AddAttrs:[",
            Index,
            "]"
          })
          self:CalcOneAttrData(BaseValues, ModRateValues, ModAddValues, AttrData, ModMultiplier, UniqueName, EntryId, AffixEnhanceLevel)
        end
      end
    end
  end
end

function Pet:CalcOneAttrData(BaseValues, ModRateValues, ModAddValues, AttrData, ModMultiplier, UniqueName, PetId, AffixEnhanceLevel)
  local AttrName = AvatarUtils:GetAttrNameFromAttrData(AttrData, UniqueName)
  if "ATK" == AttrName then
    for _AttrName, _ in pairs(DataMgr.Attribute) do
      if AttrData.Value then
        assert(nil, PetId or self.PetId .. "\229\143\183\229\174\160\231\137\169\228\184\141\229\133\129\232\174\184\228\189\191\231\148\168Value\229\162\158\229\138\160ATK")
      end
      self:CalcOneAttrs("ATK_" .. _AttrName, BaseValues, ModRateValues, CommonConst.RateIndex.GlobalATK, ModAddValues, AttrData, ModMultiplier, PetId, AffixEnhanceLevel)
    end
  else
    self:CalcOneAttrs(AttrName, BaseValues, ModRateValues, CommonConst.RateIndex.Default, ModAddValues, AttrData, ModMultiplier, PetId, AffixEnhanceLevel)
  end
end

function Pet:CalcOneAttrs(AttrName, BaseValues, ModRateValues, RateIndex, ModAddValues, AttrData, ModMultiplier, PetId, AffixEnhanceLevel)
  PetId = PetId or self.PetId
  local PetData = self:BattleData(PetId)
  PetId = PetData.PetId
  local SkillLevel = AffixEnhanceLevel or self:GetSkillLevel(self.BreakNum)
  if AttrData.Rate then
    if not ModRateValues[AttrName] then
      ModRateValues[AttrName] = {}
    end
    ModRateValues = ModRateValues[AttrName]
    local IncreaseRateValue
    if type(AttrData.Rate) == "number" then
      IncreaseRateValue = AttrData.Rate + (AttrData.LevelGrow or 0) * SkillLevel
    else
      AttrData = SkillUtils.GrowProxyBySkillLevel("BattlePet", PetId, SkillLevel, AttrData)
      IncreaseRateValue = AttrData.Rate
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
      IncreaseValue = AttrData.Value + (AttrData.LevelGrow or 0) * SkillLevel
    else
      AttrData = SkillUtils.GrowProxyBySkillLevel("BattlePet", PetId, SkillLevel, AttrData)
      IncreaseValue = AttrData.Value
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

FormatProperties(Pet)
local PetDict = Class("PetDict", CustomTypes.CustomDict)
PetDict.KeyType = BaseTypes.Int
PetDict.ValueType = Pet

function PetDict:NewPet(PetId, UniqueId)
  self[UniqueId] = Pet(PetId, UniqueId)
  return self[UniqueId]
end

return {Pet = Pet, PetDict = PetDict}
