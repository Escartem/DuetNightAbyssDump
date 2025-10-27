require("UnLua")
local UpgradeUtils = {}

function UpgradeUtils.GetMaxLevel(Target, Type)
  if "Char" == Type then
    local EnhanceLevel = Target.EnhanceLevel or 0
    local Data = DataMgr.Char[Target.CharId]
    local MaxLevel = Data and Data.CharMaxLevel
    local BreakData = DataMgr.CharBreak[Target.CharId]
    local NextBreakLevelInfo = BreakData and BreakData[EnhanceLevel + 1]
    return NextBreakLevelInfo and NextBreakLevelInfo.CharBreakLevel or MaxLevel, MaxLevel
  elseif "Weapon" == Type then
    local EnhanceLevel = Target.EnhanceLevel or 0
    local Data = DataMgr.Weapon[Target.WeaponId] or DataMgr.UWeapon[Target.WeaponId]
    local MaxLevel = Data and Data.WeaponMaxLevel
    local BreakData = DataMgr.WeaponBreak[Target.WeaponId]
    local NextBreakLevelInfo = BreakData and BreakData[EnhanceLevel + 1]
    return NextBreakLevelInfo and NextBreakLevelInfo.WeaponBreakLevel or MaxLevel, MaxLevel
  elseif "Pet" == Type then
    local BreakNum = Target.BreakNum or 0
    local Data = DataMgr.Pet[Target.PetId]
    local MaxLevel = Data and Data.PetMaxLevel
    local BreakData = DataMgr.PetBreak[Target.PetId]
    local BreakLevelInfo = BreakData and BreakData[BreakNum]
    return BreakLevelInfo and BreakLevelInfo.PetBreakLevel, MaxLevel
  end
end

function UpgradeUtils.CalcCharOrWeaponLevelUp(Target, Type, Level, ComparedLevel)
  local Res = {
    CanUpgrade = false,
    CashConsume = 0,
    ExpConsume = 0,
    ExpNeed = 0,
    ErrorText = "",
    ResourceUse = {}
  }
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar or ComparedLevel - Level <= 0 then
    return Res
  end
  if ComparedLevel > UpgradeUtils.GetMaxLevel(Target, Type) then
    return Res
  end
  Res.ExpNeed = UpgradeUtils.CalcExpNeed(Target, Type, ComparedLevel)
  if Res.ExpNeed == nil or Res.ExpNeed <= 0 then
    return Res
  end
  local ExpResources = {}
  local AssumeExpResources = {}
  local AllResourceExpSum = 0
  local ExpIds = {}
  if DataMgr.ResourceSType2Resource and DataMgr.ResourceSType2Resource[Type .. "Exp"] then
    ExpIds = DataMgr.ResourceSType2Resource[Type .. "Exp"]
  end
  local Length = #ExpIds
  for i = 1, Length do
    local mResourceId = ExpIds[i]
    local TempTable = Avatar.Resources[mResourceId] or {Count = 0}
    local Resource = {
      ResourceId = mResourceId,
      Count = TempTable.Count,
      UseParam = DataMgr.Resource[mResourceId].UseParam
    }
    AllResourceExpSum = AllResourceExpSum + Resource.Count * Resource.UseParam
    ExpResources[i] = Resource
    AssumeExpResources[i] = {
      ResourceId = Resource.ResourceId,
      UseParam = Resource.UseParam,
      Count = 1000000
    }
  end
  if AllResourceExpSum < Res.ExpNeed then
    Res.ErrorText = "LevelUp_Insufficient_Exp"
    local res = Target["Calculate" .. Type .. "LevelUpResources"](Target, Res.ExpNeed, AssumeExpResources)
    Res.ResourceUse = res.ResourceUse
    Res.ExpConsume = res.ExpConsume
    Res.CashConsume = UpgradeUtils.CalcCashConsume(Target, Type, Res.ExpConsume, Res.ExpNeed, Level, ComparedLevel)
    return Res
  else
    local res = Target["Calculate" .. Type .. "LevelUpResources"](Target, Res.ExpNeed, ExpResources)
    Res.ResourceUse = res.ResourceUse
    Res.ExpConsume = res.ExpConsume
  end
  Res.CashConsume = UpgradeUtils.CalcCashConsume(Target, Type, Res.ExpConsume, Res.ExpNeed, Level, ComparedLevel)
  if Res.CashConsume <= 0 then
    return Res
  end
  local Cash = Avatar.Resources[CommonConst.Coins.Coin2] or {Count = 0}
  if Cash.Count < Res.CashConsume then
    Res.ErrorText = "Insufficient_Cash"
    return Res
  end
  Res.CanUpgrade = true
  return Res
end

function UpgradeUtils.CalcCashConsume(Target, Type, ExpConsume, ExpNeed, Level, ComparedLevel)
  local CashConsume = -1
  if ComparedLevel <= Level or Target.Level ~= Level then
    return CashConsume
  end
  local LevelUpData
  if "Char" == Type then
    LevelUpData = DataMgr.LevelUp
  elseif "Weapon" == Type then
    LevelUpData = DataMgr.WeaponLevelUp
  end
  local Exp = ExpConsume
  local ExpToMax = LevelUpData[Level][Type .. "LevelMaxExp"] - Target.Exp
  CashConsume = ExpToMax * LevelUpData[Target.Level].CashToExp
  Exp = Exp - ExpToMax
  for i = Level + 1, ComparedLevel - 1 do
    CashConsume = CashConsume + LevelUpData[i][Type .. "LevelMaxExp"] * LevelUpData[i].CashToExp
    Exp = Exp - LevelUpData[i][Type .. "LevelMaxExp"]
  end
  CashConsume = CashConsume + Exp * LevelUpData[ComparedLevel].CashToExp
  CashConsume = math.ceil(CashConsume)
  if ExpConsume - Exp ~= ExpNeed then
    return -1
  end
  return CashConsume
end

function UpgradeUtils.CalcExpNeed(Target, Type, Level)
  local LevelUpData
  if "Char" == Type then
    LevelUpData = DataMgr.LevelUp
  elseif "Weapon" == Type then
    LevelUpData = DataMgr.WeaponLevelUp
  end
  if Level > #LevelUpData then
    return -1
  end
  local ExpNeed = 0
  for i = Target.Level, Level - 1 do
    ExpNeed = ExpNeed + LevelUpData[i][Type .. "LevelMaxExp"]
  end
  ExpNeed = ExpNeed - Target.Exp
  return ExpNeed
end

function UpgradeUtils.CalcBreakLevelUp(Target, Type, BreakLevel)
  local TargetId
  if "Char" == Type then
    TargetId = Target.CharId
  elseif "Weapon" == Type then
    TargetId = Target.WeaponId
  end
  local Res = {
    CanUpgrade = false,
    FirstUpgrade = false,
    AvataLevelEnough = false,
    ResourceEnough = false,
    BreakHintText = "",
    ResourceUse = {}
  }
  local Avatar = GWorld:GetAvatar()
  local Data
  if DataMgr[Type .. "Break"][TargetId] then
    Data = DataMgr[Type .. "Break"][TargetId][BreakLevel]
  end
  if nil == Data or nil == Avatar then
    return Res
  end
  Res.CanUpgrade = true
  for i = 1, 4 do
    if Data.ItemId[i] and Data.ItemNum[i] then
      local ResourceInfo = {}
      ResourceInfo.ResourceId = Data.ItemId[i]
      ResourceInfo.Count = Data.ItemNum[i]
      local Resource = Avatar.Resources[ResourceInfo.ResourceId] or {Count = 0}
      if Resource.Count < ResourceInfo.Count then
        Res.BreakHintText = "BreakLevelUp_Insufficient_Resources"
        Res.CanUpgrade = false
      end
      table.insert(Res.ResourceUse, ResourceInfo)
    end
  end
  Res.ResourceEnough = Res.CanUpgrade
  local BreakLimitLevelData = DataMgr.GlobalConstant["BreakLimitLevel_" .. BreakLevel]
  if BreakLimitLevelData and Avatar.Level < BreakLimitLevelData.ConstantValue then
    Res.CanUpgrade = false
    Res.BreakHintText = string.format(GText("UI_COMMONPOP_TEXT_100030"), math.ceil(BreakLimitLevelData.ConstantValue))
    return Res
  end
  Res.AvataLevelEnough = true
  if Target.Level < Data[Type .. "BreakLevel"] then
    Res.CanUpgrade = false
    return Res
  end
  if Res.CanUpgrade then
    local TargetBreakKey = table.concat({
      Type,
      "Break",
      ".",
      TargetId,
      ".",
      BreakLevel
    })
    if not Avatar.CollectRewardExpRecord[TargetBreakKey] then
      Res.FirstUpgrade = true
      Res.BreakHintText = string.format(GText("UI_Armory_WeaponBreakExp"), math.ceil(BreakLevel), math.ceil(Data.CollectRewardExp))
    end
  end
  return Res
end

function UpgradeUtils.CheckCharCanUpgradeCardLevel(Char)
  local MaxGradeLevel = tonumber(DataMgr.GlobalConstant.CharCardLevelMax.ConstantValue)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if MaxGradeLevel <= Char.GradeLevel then
    return false
  end
  local Data = DataMgr.CharCardLevelUp[Char.CharId]
  if not Data or not Data[Char.GradeLevel] then
    return false
  end
  local CharGradeLevelUpInfo = Data[Char.GradeLevel]
  local ResourceNeeded = Char:CalculateCharGradeLevelUpResources(CharGradeLevelUpInfo)
  for ResourceId, Value in pairs(ResourceNeeded) do
    if not Avatar.Resources[ResourceId] or Value > Avatar.Resources[ResourceId].Count then
      return false
    end
  end
  return true
end

return UpgradeUtils
