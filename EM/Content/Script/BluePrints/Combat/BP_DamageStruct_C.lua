require("UnLua")
local BP_DamageStruct_C = Class({
  "BluePrints.Combat.Components.SkillLevelInterface"
})

function BP_DamageStruct_C:ShowDetails()
  if Const.bStatDamage and not Const.StartTime then
    Const.StartTime = os.clock()
  end
  Const.EndTime = os.clock()
  DebugPrint("-----------------\231\142\169\229\174\182\232\175\166\231\187\134\229\177\158\230\128\167------------------")
  local GameInstance = GWorld.GameInstance
  self.Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local ATK = self.Player:GetAttr("ATK")
  local ATK_Char = self.Player:GetAttr("ATK_Char")
  local ATK_Wepon = ATK - ATK_Char
  local SkillIntensity = self.Player:GetAttr("SkillIntensity")
  local SkillSustain = self.Player:GetAttr("SkillSustain")
  local SkillRange = self.Player:GetAttr("SkillRange")
  local SkillEfficiency = self.Player:GetAttr("SkillEfficiency")
  local StrongValue = string.format("%.3f", (1 + (self.Player:GetAttr("StrongValue") or 0)) * 100)
  local EnmityValue = string.format("%.3f", (1 + (self.Player:GetAttr("EnmityValue") or 0)) * 100)
  DebugPrint("\232\131\140\230\176\180\239\188\154" .. EnmityValue .. "%")
  DebugPrint("\230\152\130\230\137\172\239\188\154" .. StrongValue .. "%")
  local Weapon = self.Player:GetCurrentWeapon()
  if Weapon then
    local CRI = string.format("%.3f", Weapon:GetAttr("CRI") * 100)
    local CRD = string.format("%.3f", Weapon:GetAttr("CRD") * 100)
    local TRI = string.format("%.3f", Weapon:GetAttr("TriggerProbability") * 100)
    local MultiShoot = string.format("%.3f", Weapon:GetAttr("MultiShoot") * 100)
    DebugPrint("\229\164\154\233\135\141\229\176\132\229\135\187\239\188\154" .. MultiShoot .. "%")
    DebugPrint("\232\167\166\229\143\145\230\166\130\231\142\135\239\188\154" .. TRI .. "%")
    DebugPrint("\231\136\134\228\188\164\239\188\154" .. CRD .. "%")
    DebugPrint("\230\154\180\229\135\187\239\188\154" .. CRI .. "%")
  end
  DebugPrint("\230\138\128\232\131\189\230\149\136\231\155\138\239\188\154" .. string.format("%.3f", SkillEfficiency * 100) .. "%")
  DebugPrint("\230\138\128\232\131\189\232\128\144\228\185\133\239\188\154" .. string.format("%.3f", SkillSustain * 100) .. "%")
  DebugPrint("\230\138\128\232\131\189\232\140\131\229\155\180\239\188\154" .. string.format("%.3f", SkillRange * 100) .. "%")
  DebugPrint("\230\138\128\232\131\189\229\188\186\229\186\166\239\188\154" .. string.format("%.3f", SkillIntensity * 100) .. "%")
  DebugPrint("\230\173\166\229\153\168\230\148\187\229\135\187\239\188\154" .. ATK_Wepon)
  DebugPrint("\232\167\146\232\137\178\230\148\187\229\135\187\239\188\154" .. ATK_Char)
  DebugPrint("\230\128\187\230\148\187\229\135\187\239\188\154" .. ATK)
  DebugPrint("-----------------\228\188\164\229\174\179\232\175\166\231\187\134------------------")
  if Const.bStatDamage then
    Const.TotalDamage = Const.TotalDamage + self.TrueValue
  end
  DebugPrint(string.format("\233\128\160\230\136\144\231\154\132\230\128\187\228\188\164\229\174\179: %d", self.TrueValue))
  DebugPrint(string.format("\229\175\185\230\138\164\231\155\190\233\128\160\230\136\144\228\188\164\229\174\179: %d", self.TrueValue - self.FinalValue))
  DebugPrint(string.format("\229\175\185\232\161\128\233\135\143\233\128\160\230\136\144\228\188\164\229\174\179: %d", self.FinalValue))
  local DamageValues = {}
  for DamageType, RateStruct in pairs(self.DamageValues) do
    local BaseRate = self.DamageBaseRates:Find(DamageType) or 0
    local BaseParamRate = self.DamageBaseParamRates:Find(DamageType) or 0
    local BaseParamValue = self.DamageBaseParamValues:Find(DamageType) or 0
    local RealBaseValue = (RateStruct.BaseValue - BaseParamRate - BaseParamValue) / BaseRate
    local _Str = "BaseValue: " .. tostring(RateStruct.BaseValue)
    if 0 ~= BaseRate then
      _Str = _Str .. " (" .. tostring(string.format("%.3f", RealBaseValue)) .. " \195\151 " .. tostring(string.format("%.3f", BaseRate)) .. " + " .. tostring(string.format("%.3f", BaseParamValue))
      if 0 == BaseParamRate then
        _Str = _Str .. ") "
      end
    end
    if 0 ~= BaseParamRate then
      _Str = _Str .. " + " .. tostring(string.format("%.3f", BaseParamRate)) .. ") "
    end
    _Str = _Str .. ",FinalValue: " .. tostring(RateStruct.FinalValue)
    if RateStruct.ShieldValue > 0 then
      _Str = _Str .. ",ShieldValue: " .. tostring(RateStruct.ShieldValue)
    end
    local RateStr
    for k, RateZoneInfo in pairs(RateStruct.DamageRates) do
      if not RateStr then
        RateStr = ",Rates:"
        _Str = _Str .. RateStr
      else
        _Str = _Str .. ","
      end
      local ZoneRatesStr = ""
      for Index = 1, RateZoneInfo.ZoneRates:Length() do
        local Rate = RateZoneInfo.ZoneRates:GetRef(Index)
        if 1 ~= Index then
          ZoneRatesStr = ZoneRatesStr .. "+"
        end
        ZoneRatesStr = ZoneRatesStr .. tostring(string.format("%.3f", Rate))
      end
      _Str = _Str .. tostring(k) .. ":" .. tostring(ZoneRatesStr)
    end
    DamageValues[DamageType] = _Str
  end
  local DamageTags = {}
  for k, v in pairs(self.DamageTag) do
    DamageTags[k] = v
  end
  local Result = {
    SourceEid = self.SourceEid,
    TargetEid = self.TargetEid,
    DamageValues = DamageValues,
    FinalValue = self.FinalValue,
    TrueValue = self.TrueValue,
    DamageTags = DamageTags
  }
  local Res = PrintTable(Result, 10, "DamageStrcutDetails")
  return Res
end

function BP_DamageStruct_C:GetExtraEffectDamageTypes()
  local OutTypes = UE.TArray(FString)
  for DamageType, DamageRate in pairs(self.DamageValues) do
    if DamageRate.ExtraEffect then
      OutTypes:Add(DamageType)
    end
  end
  return OutTypes
end

function BP_DamageStruct_C:GetDamageTags()
  local OutDamageTags = UE.TArray(FString)
  if self.DamageTag then
    for _, v in pairs(self.DamageTag) do
      OutDamageTags:Add(v)
    end
  end
  return OutDamageTags
end

return BP_DamageStruct_C
