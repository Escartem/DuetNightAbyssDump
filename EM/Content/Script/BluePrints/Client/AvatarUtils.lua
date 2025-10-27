local AvatarUtils = {}
local BattleDumpUtils = require("BluePrints.Client.BattleDumpUtils")
local CommonUtils = require("Utils.CommonUtils")

function AvatarUtils:GetModCostInSuit_ExchangeMod(Avatar, Tag, Uuid, ModSuitIndex, SModSlotId, TModSlotId)
  local CurrentCost, ReducePolarityEffect, PolarityCount, ModSuit, Target = self:GetModCostInSuit_SwitchMod(Avatar, Tag, Uuid, ModSuitIndex)
  local SModSlotEid = ModSuit[SModSlotId]
  local TModSlotEid = ModSuit[TModSlotId]
  local SMod = Avatar.Mods[SModSlotEid]
  local TMod = Avatar.Mods[TModSlotEid]
  local ExchangeBeforeCost = 0
  local ExchangeAfterCost = 0
  if SMod then
    ExchangeBeforeCost = ExchangeBeforeCost + self:GetModSlotCost(Target, SModSlotId, SMod) - (ReducePolarityEffect[SMod.Polarity] or 0)
    ExchangeAfterCost = ExchangeAfterCost + self:GetModSlotCost(Target, TModSlotId, SMod) - (ReducePolarityEffect[SMod.Polarity] or 0)
  end
  if TMod then
    ExchangeBeforeCost = ExchangeBeforeCost + self:GetModSlotCost(Target, TModSlotId, TMod) - (ReducePolarityEffect[TMod.Polarity] or 0)
    ExchangeAfterCost = ExchangeAfterCost + self:GetModSlotCost(Target, SModSlotId, TMod) - (ReducePolarityEffect[TMod.Polarity] or 0)
  end
  return math.max(0, CurrentCost - ExchangeBeforeCost + ExchangeAfterCost)
end

function AvatarUtils:GetModSlotCost(Target, ModSlotId, Mod)
  local SlotPolarity = Target.ModSlotPolarity[ModSlotId]
  local ModCost = Mod.Cost
  local ModPolarity = Mod.Polarity
  return self:GetModSlotCostImpl(ModPolarity, ModCost, SlotPolarity)
end

function AvatarUtils:GetModSlotCostImpl(ModPolarity, ModCost, SlotPolarity)
  if SlotPolarity <= 0 then
    return ModCost
  end
  if ModPolarity == SlotPolarity then
    return CommonUtils:PerfectPolarityCost(ModCost)
  elseif ModPolarity > 0 then
    return CommonUtils:WrongPolarityCost(ModCost)
  else
    return ModCost
  end
end

function AvatarUtils:GetModCostInSuit_ChangeMod(Avatar, Tag, Uuid, ModSuitIndex, TargetSlotId, NewMod)
  local Res, Cost, ReducePolarityEffect, PolarityCount, ModSuit, Target = self:CheckGetModCostInSuit(Avatar, Tag, Uuid, ModSuitIndex)
  if not Res then
    return Cost, ReducePolarityEffect, PolarityCount
  end
  for ModSlotId, ModSlotEid in pairs(ModSuit) do
    if ModSlotId == TargetSlotId then
      if NewMod then
        Cost = Cost + (NewMod and self:GetModSlotCost(Target, ModSlotId, NewMod) or 0)
        self:CalcReduceMod(NewMod, ReducePolarityEffect, PolarityCount)
      else
        local mod = Avatar.Mods[ModSlotEid]
        Cost = Cost + (mod and self:GetModSlotCost(Target, ModSlotId, mod) or 0)
        self:CalcReduceMod(mod, ReducePolarityEffect, PolarityCount)
      end
    else
      local mod = Avatar.Mods[ModSlotEid]
      Cost = Cost + (mod and self:GetModSlotCost(Target, ModSlotId, mod) or 0)
      self:CalcReduceMod(mod, ReducePolarityEffect, PolarityCount)
    end
  end
  for Polarity, Count in pairs(ReducePolarityEffect) do
    if PolarityCount[Polarity] then
      Cost = Cost - Count * PolarityCount[Polarity]
    end
  end
  return math.max(0, Cost)
end

function AvatarUtils:CheckGetModCostInSuit(Avatar, Tag, Uuid, ModSuitIndex)
  local Property
  local ReducePolarityEffect = {}
  local PolarityCount = {}
  local Cost = 0
  local ModSuit
  if "Char" == Tag then
    Property = Avatar.Chars[Uuid]
  elseif "Weapon" == Tag then
    Property = Avatar.Weapons[Uuid]
  elseif "UWeapon" == Tag then
    Property = Avatar.UWeapons[Uuid]
  end
  if not Property then
    return false, Cost, ReducePolarityEffect, PolarityCount, ModSuit, Property
  end
  ModSuit = self:GetTargetModSuit(Property, ModSuitIndex)
  if not ModSuit then
    return false, Cost, ReducePolarityEffect, PolarityCount, ModSuit, Property
  end
  return true, Cost, ReducePolarityEffect, PolarityCount, ModSuit, Property
end

function AvatarUtils:GetModCostInSuit_SwitchMod(Avatar, Tag, Uuid, ModSuitIndex, OldMod, NewMod, InitializeFunc)
  InitializeFunc = InitializeFunc or self.CheckGetModCostInSuit
  local Res, Cost, ReducePolarityEffect, PolarityCount, ModSuit, Target = InitializeFunc(self, Avatar, Tag, Uuid, ModSuitIndex)
  if not Res then
    return Cost, ReducePolarityEffect, PolarityCount, ModSuit, Target
  end
  for ModSlotId, ModSlotEid in pairs(ModSuit) do
    if OldMod then
      if ModSlotEid == OldMod.Uuid then
        if NewMod then
          Cost = Cost + (NewMod and self:GetModSlotCost(Target, ModSlotId, NewMod) or 0)
          self:CalcReduceMod(NewMod, ReducePolarityEffect, PolarityCount)
        else
          local mod = Avatar.Mods[OldMod.Uuid]
          Cost = Cost + (mod and self:GetModSlotCost(Target, ModSlotId, mod) or 0)
          self:CalcReduceMod(mod, ReducePolarityEffect, PolarityCount)
        end
      else
        local mod = Avatar.Mods[ModSlotEid]
        Cost = Cost + (mod and self:GetModSlotCost(Target, ModSlotId, mod) or 0)
        self:CalcReduceMod(mod, ReducePolarityEffect, PolarityCount)
      end
    elseif NewMod then
      Cost = Cost + (self:GetModSlotCost(Target, ModSlotId, NewMod) or 0)
      self:CalcReduceMod(NewMod, ReducePolarityEffect, PolarityCount)
    else
      local mod = Avatar.Mods[ModSlotEid]
      Cost = Cost + (mod and self:GetModSlotCost(Target, ModSlotId, mod) or 0)
      self:CalcReduceMod(mod, ReducePolarityEffect, PolarityCount)
    end
  end
  for Polarity, Count in pairs(ReducePolarityEffect) do
    if PolarityCount[Polarity] then
      Cost = Cost - Count * PolarityCount[Polarity]
    end
  end
  return math.max(0, Cost), ReducePolarityEffect, ReducePolarityEffect, ModSuit, Target
end

function AvatarUtils:GetModCostInSuit_TakeOffMod(Avatar, Tag, Uuid, ModSuitIndex, TargetSlotId)
  local Res, Cost, ReducePolarityEffect, PolarityCount, ModSuit, Target = self:CheckGetModCostInSuit(Avatar, Tag, Uuid, ModSuitIndex)
  local ExtraVolume = 0
  if not Res then
    return Cost, ReducePolarityEffect, PolarityCount, ExtraVolume
  end
  for ModSlotId, ModSlotEid in pairs(ModSuit) do
    if ModSlotId ~= TargetSlotId then
      local mod = Avatar.Mods[ModSlotEid]
      Cost = Cost + (mod and self:GetModSlotCost(Target, ModSlotId, mod) or 0)
      self:CalcReduceMod(mod, Avatar, ReducePolarityEffect, PolarityCount)
    else
      local mod = Avatar.Mods[ModSlotEid]
      ExtraVolume = mod and mod:CalcExtralCharVolume() or 0
    end
  end
  for Polarity, Count in pairs(ReducePolarityEffect) do
    if PolarityCount[Polarity] then
      Cost = Cost - Count * PolarityCount[Polarity]
    end
  end
  return math.max(0, Cost), ReducePolarityEffect, PolarityCount, ExtraVolume
end

function AvatarUtils:CalcReduceMod(Mod, ReducePolarityEffect, PolarityCount)
  if Mod then
    if Mod.ReducePolarityEffect then
      if ReducePolarityEffect[Mod.ReducePolarityEffect[1]] == nil then
        ReducePolarityEffect[Mod.ReducePolarityEffect[1]] = 0
      end
      ReducePolarityEffect[Mod.ReducePolarityEffect[1]] = ReducePolarityEffect[Mod.ReducePolarityEffect[1]] + Mod.ReducePolarityEffect[2]
    end
    Mod:CountModPolarity(PolarityCount)
  end
end

function AvatarUtils:GetProperty(Avatar, Tag, Uuid)
  local Property
  if "Char" == Tag then
    Property = Avatar.Chars[Uuid]
  elseif "Weapon" == Tag then
    Property = Avatar.Weapons[Uuid]
  elseif "UWeapon" == Tag then
    Property = Avatar.UWeapons[Uuid]
  end
  if not Property then
    return false
  end
  return true, Property
end

function AvatarUtils:CheckChangeModRepeat(Avatar, Tag, Uuid, ModSuitIndex, TargetModSlotId, ModUuid, ModSuit)
  local res, Property = self:GetProperty(Avatar, Tag, Uuid)
  if not res then
    return false
  end
  ModSuit = ModSuit or self:GetTargetModSuit(Property, ModSuitIndex)
  local TargetMod = Avatar.Mods[ModUuid]
  if not ModSuit or not TargetMod then
    return false
  end
  local ConflictMods = not skynet and {} or nil
  local SuitModIds = {}
  for ModSlotId, ModSlotEid in pairs(ModSuit) do
    local Mod = Avatar.Mods[ModSlotEid]
    if Mod and Mod.RepeatGroup == TargetMod.RepeatGroup then
      if TargetModSlotId ~= ModSlotId and Mod.IsOriginal and TargetMod.IsOriginal and Mod.ModId == TargetMod.ModId then
        if skynet then
          return false
        else
          table.insert(ConflictMods, Mod)
        end
      end
      SuitModIds[ModSlotId] = Mod
    end
  end
  for ModSlotId, Mod in pairs(SuitModIds) do
    if ModSlotId ~= TargetModSlotId then
      if Mod.ModId ~= TargetMod.ModId then
        if skynet then
          return false
        else
          table.insert(ConflictMods, Mod)
        end
      else
        if TargetMod.RepeatModLevel == nil or TargetMod.RepeatModLevel <= 0 then
          if skynet then
            return false
          else
            table.insert(ConflictMods, Mod)
          end
        end
        local TargetLevel = TargetMod.Level + (TargetMod.CurrentModCardLevel or 0)
        if Mod.IsOriginal then
          if TargetLevel < (TargetMod.RepeatModLevel or 0) then
            if skynet then
              return false
            else
              table.insert(ConflictMods, Mod)
            end
          end
        else
          local ModLevel = Mod.Level + (Mod.CurrentModCardLevel or 0)
          if ModLevel < (TargetMod.RepeatModLevel or 0) and TargetLevel < (TargetMod.RepeatModLevel or 0) then
            if skynet then
              return false
            else
              table.insert(ConflictMods, Mod)
            end
          end
        end
      end
    end
  end
  if skynet then
    return true
  else
    return table.isempty(ConflictMods), ConflictMods
  end
end

function AvatarUtils:CheckModRepeat(Avatar, Tag, Uuid, ModSuitIndex, ModUuid, ModSuit)
  return self:CheckChangeModRepeat(Avatar, Tag, Uuid, ModSuitIndex, nil, ModUuid, ModSuit)
end

function AvatarUtils:HasAvatarStatusChanged(OldStatus, NewStatus, StateEnum)
  OldStatus = OldStatus or {}
  if type(StateEnum) == "number" then
    local OldState = OldStatus[StateEnum]
    local NewState = NewStatus[StateEnum]
    return OldState ~= NewState
  elseif type(StateEnum) == "table" then
    for _, State in ipairs(StateEnum) do
      local OldState = OldStatus[State]
      local NewState = NewStatus[State]
      return OldState ~= NewState
    end
  end
end

function AvatarUtils:GetAttrNameFromAttrData(AttrData, UniqueName)
  local AttrName = AttrData.AttrName
  if "DamageRate" == AttrName or "DamagedRate" == AttrName then
    if AttrData.IndividualRateZone then
      AttrName = AttrName .. "_NoTag_" .. UniqueName
    else
      local Tag = AttrData.DamageTag or "NoTag"
      local RateZone = AttrData.RateZone or "Normal"
      AttrName = AttrName .. "_" .. tostring(Tag) .. "_" .. tostring(RateZone)
    end
  elseif DataMgr.AttributeType[AttrName] then
    AttrName = AttrName .. "_" .. (AttrData.Type or "Normal")
  end
  return AttrName
end

function AvatarUtils:IsStorylineComplete(Avatar, TalkTriggerId)
  return AvatarUtils:IsStorylineSuccess(Avatar, TalkTriggerId) or AvatarUtils:IsStorylineFailure(Avatar, TalkTriggerId)
end

function AvatarUtils:IsStorylineUnComplete(Avatar, TalkTriggerId)
  return not AvatarUtils:IsStorylineComplete(Avatar, TalkTriggerId)
end

function AvatarUtils:IsStorylineSuccess(Avatar, TalkTriggerId)
  return Avatar.ImpressionTalkTriggers[TalkTriggerId] == CommonConst.ImpressionCheckType.Success
end

function AvatarUtils:IsStorylineFailure(Avatar, TalkTriggerId)
  return Avatar.ImpressionTalkTriggers[TalkTriggerId] == CommonConst.ImpressionCheckType.Failed
end

function AvatarUtils:GetDefaultBattleInfo(...)
  local Info = BattleDumpUtils:GetDefaultBattleInfo(...)
  if Info then
    Info.Camp = "Player"
  end
  return Info
end

function AvatarUtils:GetCurrentBattleInfo(...)
  return {
    CharacterInfo = BattleDumpUtils:GetDefaultBattleInfo(...)
  }
end

function AvatarUtils:GetDefaultAvatarInfo()
  local DefaulAvatarInfo = {
    RoleId = Const.DefaultRoleId
  }
  if Const.DeafaultMeleeWeapon then
    DefaulAvatarInfo.MeleeWeapon = {
      WeaponId = Const.DeafaultMeleeWeapon
    }
  end
  if Const.DeafaultRangedWeapon then
    DefaulAvatarInfo.RangedWeapon = {
      WeaponId = Const.DeafaultRangedWeapon
    }
  end
  return DefaulAvatarInfo
end

function AvatarUtils:GetPhantomBattleInfo(...)
  return BattleDumpUtils:GetPhantomBattleInfo(...)
end

function AvatarUtils:GetCharBattleInfo(...)
  return BattleDumpUtils:GetCharBattleInfo(...)
end

function AvatarUtils:GetWeaponBattleInfo(...)
  return BattleDumpUtils:GetWeaponBattleInfo(...)
end

function AvatarUtils:GetBattleInfoByQuestRoleId(...)
  return BattleDumpUtils:GetBattleInfoByQuestRoleId(...)
end

function AvatarUtils:GetSquadInfoByQuestRoleId(...)
  return BattleDumpUtils:GetSquadInfoByQuestRoleId(...)
end

function AvatarUtils:UpdateBattleInfo(...)
  return BattleDumpUtils:UpdateBattleInfo(...)
end

function AvatarUtils:GetAbyssBattleInfo(Avatar, Char, MeleeWeapon, RangedWeapon, PhantomChar1, PhantomWeapon1, PhantomChar2, PhantomWeapon2, Pet)
  if not Avatar then
    return
  end
  local AvatarBattleInfo = {}
  local Info = {
    Char = Char,
    MeleeWeapon = MeleeWeapon,
    RangedWeapon = RangedWeapon,
    Pet = Pet
  }
  if Info.Char then
    Info.CharModSuit = Info.Char.ModSuitIndex
    Info.UltraWeapons = BattleDumpUtils:GetDefaultUltraWeaponInfo(Avatar, Info.Char)
  end
  if Info.MeleeWeapon then
    Info.MeleeWeaponModSuit = Info.MeleeWeapon.ModSuitIndex
  end
  if Info.RangedWeapon then
    Info.RangedWeaponModSuit = Info.RangedWeapon.ModSuitIndex
  end
  AvatarBattleInfo.CharacterInfo = BattleDumpUtils:GetBattleInfoByInfo(Avatar, Info)
  AvatarBattleInfo.PhantomInfo1 = self:GetPhantomBattleInfo(Avatar, PhantomChar1, PhantomWeapon1, Pet)
  AvatarBattleInfo.PhantomInfo2 = self:GetPhantomBattleInfo(Avatar, PhantomChar2, PhantomWeapon2, Pet)
  return AvatarBattleInfo
end

function AvatarUtils:ReShapeSquadInfo(Avatar, Squad)
  local Info = {
    Char = Avatar.Chars[Squad.Char],
    CharModSuit = Squad.ModSuit,
    MeleeWeapon = Avatar.Weapons[Squad.MeleeWeapon],
    MeleeWeaponModSuit = Squad.MeleeWeaponModSuit,
    RangedWeapon = Avatar.Weapons[Squad.RangedWeapon],
    RangedWeaponModSuit = Squad.RangedWeaponModSuit,
    Pet = Avatar.Pets[Squad.Pet],
    WheelIndex = Squad.WheelIndex,
    Phantom1 = Squad.Phantom1,
    PhantomWeapon1 = Squad.PhantomWeapon1,
    Phantom2 = Squad.Phantom2,
    PhantomWeapon2 = Squad.PhantomWeapon2
  }
  if Info.Char then
    Info.UltraWeapons = BattleDumpUtils:GetDefaultUltraWeaponInfo(Avatar, Info.Char)
  end
  return Info
end

function AvatarUtils:GetSquadBattleInfo(Avatar, Squad, bNotUseUWeapon)
  if not Avatar or not Squad then
    return
  end
  local Pet = Squad.Pet
  local AvatarBattleInfo = {}
  AvatarBattleInfo.CharacterInfo = BattleDumpUtils:GetBattleInfoByInfo(Avatar, Squad, bNotUseUWeapon)
  local PhantomChar1 = Avatar.Chars[Squad.Phantom1]
  local PhantomWeapon1 = Avatar.Weapons[Squad.PhantomWeapon1]
  AvatarBattleInfo.PhantomInfo1 = self:GetPhantomBattleInfo(Avatar, PhantomChar1, PhantomWeapon1, Pet, bNotUseUWeapon)
  local PhantomChar2 = Avatar.Chars[Squad.Phantom2]
  local PhantomWeapon2 = Avatar.Weapons[Squad.PhantomWeapon2]
  AvatarBattleInfo.PhantomInfo2 = self:GetPhantomBattleInfo(Avatar, PhantomChar2, PhantomWeapon2, Pet, bNotUseUWeapon)
  return AvatarBattleInfo
end

function AvatarUtils:GetWeaponDetails(WeaponId, Level)
  local WeaponInfo = {
    WeaponId = WeaponId,
    WeaponLevel = Level,
    NeedEnhance = false
  }
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return nil
  end
  local Weapon = self:AddTemplateWeapon(WeaponInfo, Avatar)
  if not Weapon then
    return nil
  end
  local WeaponDetails = Weapon:BattleDump(Avatar)
  return WeaponDetails
end

function AvatarUtils:GetTargetModSuit(Target, ModSuitIndex)
  if not Target then
    return nil
  end
  if not ModSuitIndex then
    return nil
  end
  local ParamsName = "ModSuit_" .. ModSuitIndex
  if not Target[ParamsName] then
    return nil
  end
  return Target[ParamsName]
end

function AvatarUtils:SetModSlotPolarity(Target, ModSlotId, Polarity)
  if Target and Target.ModSlotPolarity and ModSlotId and Target.ModSlotPolarity[ModSlotId] then
    Target.ModSlotPolarity[ModSlotId] = Polarity
  end
end

function AvatarUtils:GetModSlotPolarity(Target, ModSlotId)
  if Target and Target.ModSlotPolarity and ModSlotId and Target.ModSlotPolarity[ModSlotId] then
    return Target.ModSlotPolarity[ModSlotId]
  end
  return CommonConst.NonePolarity
end

function AvatarUtils:ModSlotIsUnLock(Target, ModSlotId)
  if nil ~= Target and nil ~= Target.ModSlotStatus and nil ~= ModSlotId and nil ~= Target.ModSlotStatus[ModSlotId] then
    return Target.ModSlotStatus[ModSlotId] == CommonConst.CommonStatus.UnLock
  end
  return false
end

function AvatarUtils:UnLockModSlot(Target, ModSlotId)
  if Target and Target.ModSlotStatus and ModSlotId and Target.ModSlotStatus[ModSlotId] then
    Target.ModSlotStatus[ModSlotId] = CommonConst.CommonStatus.UnLock
  end
end

function AvatarUtils:GenerateModSuitInfo(Avatar, Tag, Eid, ModSuitIndex)
  local Target, TargetInfo
  if "Char" == Tag then
    local Char = Avatar.Chars[Eid]
    if Char then
      Target = Char
      TargetInfo = {
        Tag,
        Char.CharId,
        Char.Level,
        Char.EnhanceLevel,
        Char.GradeLevel
      }
    end
  elseif "Weapon" == Tag then
    local Weapon = Avatar.Weapons[Eid]
    if Weapon then
      Target = Weapon
    end
    TargetInfo = {
      Tag,
      Weapon.WeaponId,
      Weapon.Level,
      Weapon.EnhanceLevel,
      Weapon.GradeLevel
    }
  elseif "UWeapon" == Tag then
    local UWeapon = Avatar.UWeapons[Eid]
    if UWeapon then
      Target = UWeapon
    end
    TargetInfo = {
      Tag,
      UWeapon.WeaponId,
      UWeapon.Level,
      UWeapon.EnhanceLevel,
      UWeapon.GradeLevel
    }
  end
  local SuitName = Target.ModSuitsName[ModSuitIndex]
  if not SuitName or "" == SuitName then
    SuitName = string.format("Mod_SuitName_%s", ModSuitIndex)
  end
  table.insert(TargetInfo, SuitName)
  if not Target then
    return
  end
  local ModSuit = self:GetTargetModSuit(Target, ModSuitIndex)
  if not ModSuit then
    return
  end
  local ModSuitInfo = {}
  ModSuitInfo.TargetInfo = TargetInfo
  local ModsInfo = {}
  for ModSlotId, ModSlotEid in pairs(ModSuit) do
    ModsInfo[ModSlotId] = {}
    if -1 ~= ModSlotEid then
      local Mod = Avatar.Mods[ModSlotEid]
      if Mod then
        ModsInfo[ModSlotId] = {
          Target.ModSlotPolarity[ModSlotId],
          Mod.ModId,
          Mod.Level,
          Mod.CurrentModCardLevel
        }
      else
        ModsInfo[ModSlotId] = {
          Target.ModSlotPolarity[ModSlotId]
        }
      end
    else
      ModsInfo[ModSlotId] = {
        Target.ModSlotPolarity[ModSlotId]
      }
    end
  end
  ModSuitInfo.ModsInfo = ModsInfo
  return ModSuitInfo
end

function AvatarUtils:InitModInfo(Avatar, Info, Target)
  if Info.ModData then
    return
  end
  local ModSuitIndex = Info.ModSuit
  if not ModSuitIndex then
    return
  end
  local ModSuit = self:GetTargetModSuit(Target, ModSuitIndex)
  if not ModSuit then
    return
  end
  local ModData = {}
  local SlotData = {}
  for ModSlotId, ModSlotEid in pairs(ModSuit) do
    local Mod = Avatar.Mods[ModSlotEid]
    if Mod then
      table.insert(ModData, Mod)
    end
    local OneSlotData = {
      SlotId = ModSlotId,
      Polarity = Target.ModSlotPolarity[ModSlotId],
      ModEid = ModSlotEid
    }
    table.insert(SlotData, OneSlotData)
  end
  Info.SlotData = SlotData
  Info.ModData = ModData
end

function AvatarUtils:DumpModData(Info)
  if not Info.ModData then
    return
  end
  local DumpedModData = {}
  for _, OneMod in ipairs(Info.ModData) do
    local OneModData = {
      Uuid = OneMod.Uuid,
      ModId = OneMod.ModId,
      Level = OneMod.Level,
      Count = OneMod.Count,
      IsOriginal = OneMod.IsOriginal,
      LockState = OneMod.LockState,
      Cost = OneMod.Cost,
      CharUuids = {},
      WeaponUuids = {},
      CurrentModCardLevel = OneMod.CurrentModCardLevel
    }
    for _, ObjId in ipairs(OneMod.CharUuids) do
      table.insert(OneModData.CharUuids, ObjId)
    end
    for _, ObjId in ipairs(OneMod.WeaponUuids) do
      table.insert(OneModData.WeaponUuids, ObjId)
    end
    table.insert(DumpedModData, OneModData)
  end
  return DumpedModData
end

function AvatarUtils:RebuildModSuit(Target)
  if skynet then
    return
  end
  local ModCom = require("BluePrints.Client.CustomTypes.Mod")
  local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
  local ModSuits = ModCom.ModSuits()
  for i = 1, 3 do
    local ModSlots = ModSuits:AddModSuit(Target.ModSlotPolarity, Target.ModSlotStatus, Target.EnhanceLevel)
    for SlotId, ModSlot in pairs(ModSlots) do
      ModSlot.ModEid = Target[string.format("ModSuit_%d", i)][SlotId]
    end
  end
  Target.ModSuits = ModSuits
  Target.ModSuitsCostMap = CustomTypes.Int2IntDict()
end

function AvatarUtils:CalculateFishPrice(FishResourceId, FishSize)
  if not FishResourceId then
    return 0
  end
  if not FishSize then
    return 0
  end
  local FishId = DataMgr.ResourceId2FishId[FishResourceId]
  if not FishId then
    return 0
  end
  local FishInfo = DataMgr.Fish[FishId]
  if not FishInfo.PriceOnWeight then
    return 0
  end
  local PriceOnWeight = FishInfo.PriceOnWeight
  local Price = PriceOnWeight[1]
  FishSize = math.min(FishSize, FishInfo.FishLength[2] * CommonConst.FishSizeScale)
  local Diff = FishInfo.FishLength[2] - FishInfo.FishLength[1]
  local Weight = Diff * CommonConst.FishSizeScale / PriceOnWeight[2]
  local Stage = (FishSize - FishInfo.FishLength[1] * CommonConst.FishSizeScale) // Weight
  local Remain = (FishSize - FishInfo.FishLength[1] * CommonConst.FishSizeScale) % Weight
  if 0 == Remain then
    Stage = math.max(Stage - 1, 0)
  end
  local FinalPrice = Price + Stage * PriceOnWeight[3]
  return FinalPrice
end

function AvatarUtils:GetTargetDataStatistics(Avatar, TargetType, TargetId)
  if not (Avatar and TargetId) or not TargetType then
    return 0
  end
  if "Char" == TargetType then
    local CommonChar = Avatar.CommonChars[TargetId]
    if CommonChar then
      return CommonChar.Count
    end
    return 0
  end
  return Avatar.DataStatistics[TargetType .. TargetId] or 0
end

function AvatarUtils:GetPlayerPersonalInfoChar(Avatar, FromDb)
  local PlayerPersonalInfoChar = {}
  if Avatar.PersonalInfo and Avatar.PersonalInfo.CharDisplay then
    for key, value in pairs(Avatar.PersonalInfo.CharDisplay) do
      local CharUuid = value.Id
      if FromDb then
        CharUuid = StrUtils.ObjId2Str(value.Id)
      end
      if Avatar.Chars and Avatar.Chars[CharUuid] then
        local Char = Avatar.Chars[CharUuid]
        local SkillInfo = {}
        for _, Skill in ipairs(Char.Skills) do
          table.insert(SkillInfo, {
            SkillId = Skill.SkillId,
            Level = Skill.Level or 1,
            ExtraLevel = Skill.ExtraLevel or 0,
            LockState = Skill.LockState or 1
          })
        end
        local SkillTree = {}
        for i = 1, CommonConst.CharSkillTreeCount do
          if not SkillTree[i] then
            SkillTree[i] = {}
          end
          for j = 1, CommonConst.CharSkillTreeCount do
            local SkillTreeNode = Char.SkillTree[i][j]
            if SkillTreeNode then
              SkillTree[i][j] = {
                TargetId = SkillTreeNode.TargetId,
                SkillOrAttr = SkillTreeNode.SkillOrAttr or 0,
                LockState = SkillTreeNode.LockState or 1
              }
            end
          end
        end
        local CurrentAppearanceIndex = Char.CurrentAppearanceIndex or 1
        if value.AppearancePlan and -1 ~= value.AppearancePlan then
          CurrentAppearanceIndex = value.AppearancePlan
        end
        local AppearanceSuit = Char.AppearanceSuits[CurrentAppearanceIndex]
        local CommonChar = Avatar.CommonChars[Char.CharId]
        if FromDb then
          CommonChar = Avatar.CommonChars[tostring(Char.CharId)]
        end
        local SkinId = AppearanceSuit and AppearanceSuit.SkinId
        local CharSkin = CommonChar.OwnedSkins[SkinId]
        if FromDb then
          CharSkin = CommonChar.OwnedSkins[tostring(SkinId)]
        end
        local Appearance = {
          SkinId = SkinId,
          Accessory = AppearanceSuit and AppearanceSuit.Accessory or {},
          CurrentPlanIndex = CharSkin.CurrentPlanIndex or 1
        }
        for key, value in pairs(CharSkin.Colors) do
          if not Appearance.SkinColors then
            Appearance.SkinColors = {}
          end
          Appearance.SkinColors[tonumber(key)] = value
        end
        local ModSuitIndex = value.ModPlan or 1
        local ModSuit = Char["ModSuit_" .. ModSuitIndex]
        local ModSuitInfo = {}
        for i, value in ipairs(ModSuit) do
          local ModSlotInfo = {}
          ModSlotInfo.Polarity = self:GetModSlotPolarity(Char, i)
          local ModEid = value
          if FromDb then
            ModEid = StrUtils.ObjId2Str(value)
          end
          if ModEid and ModEid ~= CommonConst.ModSlotUnequipped and Avatar.Mods[ModEid] then
            local Mod = Avatar.Mods[ModEid]
            ModSlotInfo.Mod = {
              ModId = Mod.ModId,
              Level = Mod.Level or 0,
              CurrentModCardLevel = Mod.CurrentModCardLevel or 0
            }
          end
          table.insert(ModSuitInfo, ModSlotInfo)
        end
        PlayerPersonalInfoChar[#PlayerPersonalInfoChar + 1] = {
          CharId = Char.CharId,
          Level = Char.Level or 1,
          EnhanceLevel = Char.EnhanceLevel or 0,
          GradeLevel = Char.GradeLevel or 0,
          Skills = SkillInfo,
          SkillTree = SkillTree,
          Appearance = Appearance,
          ModSuit = ModSuitInfo
        }
      end
    end
  end
  return PlayerPersonalInfoChar
end

function AvatarUtils:GetPlayerPersonalInfoWeapon(Avatar, FromDb)
  local PlayerPersonalInfoWeapon = {}
  if Avatar.PersonalInfo and Avatar.PersonalInfo.WeaponDisplay then
    for key, value in pairs(Avatar.PersonalInfo.WeaponDisplay) do
      local WeaponUuid = value.Id
      if FromDb then
        WeaponUuid = StrUtils.ObjId2Str(value.Id)
      end
      if Avatar.Weapons and Avatar.Weapons[WeaponUuid] then
        local Weapon = Avatar.Weapons[WeaponUuid]
        local CurrentAppearanceIndex = Weapon.CurrentAppearanceIndex or 1
        if value.AppearancePlan and -1 ~= value.AppearancePlan then
          CurrentAppearanceIndex = value.AppearancePlan
        end
        local AppearanceSuit = Weapon.AppearanceSuits[CurrentAppearanceIndex]
        local SkinId = AppearanceSuit and AppearanceSuit.SkinId or Weapon.WeaponId
        local WeaponSkin = Weapon.UsedSkins[SkinId]
        if FromDb then
          WeaponSkin = Weapon.UsedSkins[tostring(SkinId)]
        end
        local Appearance = {
          SkinId = SkinId,
          SpecialColor = WeaponSkin.SpecialColor,
          Accessory = AppearanceSuit and AppearanceSuit.Accessory or {},
          CurrentPlanIndex = WeaponSkin.CurrentPlanIndex or 1
        }
        for key, value in pairs(WeaponSkin.Colors) do
          if not Appearance.SkinColors then
            Appearance.SkinColors = {}
          end
          Appearance.SkinColors[tonumber(key)] = value
        end
        local ModSuitIndex = value.ModPlan or 1
        local ModSuit = Weapon["ModSuit_" .. ModSuitIndex]
        local ModSuitInfo = {}
        for i, value in ipairs(ModSuit) do
          local ModSlotInfo = {}
          ModSlotInfo.Polarity = self:GetModSlotPolarity(Weapon, i)
          local ModEid = value
          if FromDb then
            ModEid = StrUtils.ObjId2Str(value)
          end
          if ModEid and ModEid ~= CommonConst.ModSlotUnequipped and Avatar.Mods[ModEid] then
            local Mod = Avatar.Mods[ModEid]
            ModSlotInfo.Mod = {
              ModId = Mod.ModId,
              Level = Mod.Level or 0,
              CurrentModCardLevel = Mod.CurrentModCardLevel or 0
            }
          end
          table.insert(ModSuitInfo, ModSlotInfo)
        end
        PlayerPersonalInfoWeapon[#PlayerPersonalInfoWeapon + 1] = {
          WeaponId = Weapon.WeaponId,
          Level = Weapon.Level or 1,
          EnhanceLevel = Weapon.EnhanceLevel or 0,
          GradeLevel = Weapon.GradeLevel or 0,
          Appearance = Appearance,
          ModSuit = ModSuitInfo
        }
      end
    end
  end
  return PlayerPersonalInfoWeapon
end

function AvatarUtils:GetAbyssSeasonMaxProgress(Avatar, FromDb)
  local SeasonId = Avatar.CurrentAbyssSeasonId or -1
  local Abysses = Avatar.Abysses
  local Progress = {
    0,
    0,
    0
  }
  for AbyssId, Info in pairs(DataMgr.AbyssSeason) do
    if not Info.AbyssSeasonId and 1 == Info.AbyssType then
      local Abyss = Abysses[AbyssId]
      if FromDb then
        Abyss = Abysses[tostring(AbyssId)]
      end
      local MaxLevel = #Info.AbyssLevelId
      local IsAbyssNotPass = true
      local MaxAbyssProgress = Abyss.MaxAbyssProgress or {1, 0}
      if MaxLevel > MaxAbyssProgress[1] then
        IsAbyssNotPass = true
      else
        local LastAbyssLevelId = Info.AbyssLevelId[#Info.AbyssLevelId]
        local LevelInfo = DataMgr.AbyssLevel[LastAbyssLevelId]
        local LevelRoomCount = 0
        if LevelInfo.AbyssDungeon1 then
          local DungeonInfo = DataMgr.AbyssDungeon[LevelInfo.AbyssDungeon1]
          LevelRoomCount = LevelRoomCount + #DungeonInfo.RoomId
        end
        if LevelInfo.AbyssDungeon2 then
          local DungeonInfo = DataMgr.AbyssDungeon[LevelInfo.AbyssDungeon2]
          LevelRoomCount = LevelRoomCount + #DungeonInfo.RoomId
        end
        if MaxAbyssProgress[2] == LevelRoomCount then
          IsAbyssNotPass = false
        end
      end
      if not (not IsAbyssNotPass and SeasonId) or not DataMgr.AbyssSeasonList[SeasonId] then
        Progress[1] = Info.AbyssType
        Progress[2] = MaxAbyssProgress[1]
        Progress[3] = self:CalculateAbyssAllRoomCount(Abyss)
        return Progress
      end
    end
  end
  local SeasonData = DataMgr.AbyssSeasonList[SeasonId]
  if not SeasonData.Abyss then
    return Progress
  end
  local Infinite = SeasonData.Abyss.Infinite
  local AbyssInfinite = Abysses[Infinite]
  if FromDb then
    AbyssInfinite = Abysses[tostring(Infinite)]
  end
  local Rotate = SeasonData.Abyss.Rotate
  local AbyssRotate = Abysses[Rotate]
  if FromDb then
    AbyssRotate = Abysses[tostring(Rotate)]
  end
  local AbyssRotatePassRoomCount = self:CalculateAbyssAllRoomCount(AbyssRotate)
  if AbyssInfinite and AbyssInfinite.MaxAbyssProgress and (AbyssInfinite.MaxAbyssProgress[1] > 1 or 1 == AbyssInfinite.MaxAbyssProgress[1] and AbyssInfinite.MaxAbyssProgress[2] > 0) then
    local AbyssInfo = DataMgr.AbyssSeason[Infinite]
    Progress[1] = AbyssInfo.AbyssType
    Progress[2] = AbyssInfinite.MaxAbyssProgress[1]
    Progress[3] = self:CalculateAbyssAllRoomCount(AbyssInfinite) + AbyssRotatePassRoomCount
  else
    local AbyssInfo = DataMgr.AbyssSeason[Rotate]
    Progress[1] = AbyssInfo.AbyssType
    Progress[2] = 1
    if AbyssRotate.MaxAbyssProgress then
      Progress[2] = AbyssRotate.MaxAbyssProgress[1] or 1
    end
    Progress[3] = AbyssRotatePassRoomCount
  end
  return Progress
end

function AvatarUtils:CalculateAbyssAllRoomCount(Abyss)
  local AllPassRoomCount = 0
  local MaxAbyssProgress = Abyss.MaxAbyssProgress or {1, 0}
  for LevelIndex = 1, MaxAbyssProgress[1] - 1 do
    local AbyssLevel = Abyss.AbyssLevelList[LevelIndex]
    if AbyssLevel then
      AllPassRoomCount = AllPassRoomCount + (AbyssLevel.MaxAbyssLevelProgress or 0)
    end
  end
  return AllPassRoomCount + MaxAbyssProgress[2]
end

function AvatarUtils:GetPlayerPersonalInfoWeaponCount(Avatar)
  local MeleeWeaponCount = 0
  local RangedWeaponCount = 0
  for _, Weapon in pairs(Avatar.Weapons) do
    local WeaponId = Weapon.WeaponId
    local BattleWeaponInfo = DataMgr.BattleWeapon[WeaponId]
    if BattleWeaponInfo and BattleWeaponInfo.WeaponTag then
      if CommonUtils.HasValue(BattleWeaponInfo.WeaponTag, CommonConst.WeaponType.MeleeWeapon) then
        MeleeWeaponCount = MeleeWeaponCount + 1
      elseif CommonUtils.HasValue(BattleWeaponInfo.WeaponTag, CommonConst.WeaponType.RangedWeapon) then
        RangedWeaponCount = RangedWeaponCount + 1
      end
    end
  end
  return MeleeWeaponCount, RangedWeaponCount
end

function AvatarUtils:GetPlayerPersonalInfoCharSkinCount(Avatar)
  local CharSkinCount = 0
  for _, CommonChar in pairs(Avatar.CommonChars) do
    CharSkinCount = CharSkinCount + CommonUtils.TableLength(CommonChar.OwnedSkins)
  end
  for _, OtherSkin in pairs(Avatar.OtherCharSkins) do
    CharSkinCount = CharSkinCount + CommonUtils.TableLength(OtherSkin)
  end
  CharSkinCount = CharSkinCount - CommonUtils.TableLength(Avatar.Chars)
  return CharSkinCount
end

function AvatarUtils:GetPlayerPersonalInfoRougeLikeProgress(Avatar)
  local TimeUtils
  if GWorld:IsSkynetServer() then
    TimeUtils = require("src.utils.TimeUtils")
  else
    TimeUtils = require("Utils.TimeUtils")
  end
  local NowTime = TimeUtils.NowTime()
  local Progress = 0
  for SeasonId, SeasonInfo in pairs(DataMgr.RougeLikeSeason) do
    if SeasonId > 0 and NowTime >= SeasonInfo.SeasonStartTime and NowTime <= SeasonInfo.SeasonEndTime then
      for i = #SeasonInfo.DifficultyId, 1, -1 do
        local DifficultyId = SeasonInfo.DifficultyId[i]
        if not Avatar.RougeLike then
          return Progress
        end
        local PassCount = Avatar.RougeLike.PassCount or {}
        if PassCount[DifficultyId] then
          return DifficultyId
        end
      end
    end
  end
  return Progress
end

function AvatarUtils:GetPlayerPersonalInfoAchievementCount(Avatar, FromDb)
  local Achievement_Array = {}
  local Achievement_Count = 0
  for key, Achv in pairs(Avatar.Achvs) do
    local AchvInfo = DataMgr.Achievement[Achv.AchvId]
    if AchvInfo then
      local AchievementRarity = AchvInfo.AchievementRarity
      if AvatarUtils:IsAchvFinished(Achv, FromDb) and not AvatarUtils:IsAchvLocked(Avatar, Achv.AchvId, FromDb) then
        if Achievement_Array[AchievementRarity] then
          Achievement_Array[AchievementRarity] = Achievement_Array[AchievementRarity] + 1
        else
          Achievement_Array[AchievementRarity] = 1
        end
        Achievement_Count = Achievement_Count + 1
      end
    end
  end
  return Achievement_Array, Achievement_Count
end

function AvatarUtils:IsAchvFinished(Achv, FromDb)
  local AchvInfo = DataMgr.Achievement[Achv.AchvId]
  local FinishCount = 0
  for _, value in ipairs(AchvInfo.TargetId) do
    local Tid = value
    if FromDb then
      Tid = tostring(value)
    end
    FinishCount = FinishCount + (Achv.FinishedTargets[Tid] or 0)
  end
  if FinishCount >= AchvInfo.TargetProgress then
    return true
  end
  return false
end

function AvatarUtils:IsAchvLocked(Avatar, AchvId, FromDb)
  local AchvInfo = DataMgr.Achievement[AchvId]
  if not AchvInfo.AchievementRequire then
    return false
  end
  for _, preId in pairs(AchvInfo.AchievementRequire) do
    local achievePre = Avatar.Achvs[preId]
    if not (achievePre and AvatarUtils:IsAchvFinished(achievePre, FromDb)) or AvatarUtils:IsAchvLocked(Avatar, preId, FromDb) then
      return true
    end
  end
  return false
end

function AvatarUtils:HandleActiveRandomCreator(RandomRuleId, ParamsNum, ProportionList)
  local ClientRes = {}
  ProportionList = ProportionList or {}
  local RandomRuleInfo = DataMgr.RandomCreator[RandomRuleId]
  if not RandomRuleInfo then
    return false, ClientRes
  end
  ClientRes.RuleType = RandomRuleInfo.RuleType
  ClientRes.UnitType = RandomRuleInfo.UnitType
  if 1 == ClientRes.RuleType then
    ClientRes.UnitId, ClientRes.Level, ClientRes.CurrentTableId = self:GetRandomRuleType_One(RandomRuleInfo)
  else
    ClientRes.UnitId, ClientRes.Level, ClientRes.CurrentTableId = self:GetRandomRuleType_Two(RandomRuleInfo, ParamsNum, ProportionList or {})
  end
  return true, ClientRes
end

function AvatarUtils:GetRandomRuleType_Two(RandomRuleInfo, ParamsNum, ProportionList)
  local UnitInfoWeight = {}
  local UnitLevel = {}
  local WeightSum = 0
  local UnitIdToTableId = {}
  local UnitIdList = {}
  local MaxTableId = 0
  for _, ActorInfo in ipairs(RandomRuleInfo.RandomInfos) do
    UnitInfoWeight[ActorInfo.UnitId] = ActorInfo.Weight
    UnitLevel[ActorInfo.UnitId] = ActorInfo.UnitLevel or 1
    WeightSum = WeightSum + ActorInfo.Weight
    MaxTableId = MaxTableId + 1
    UnitIdList[MaxTableId] = ActorInfo.UnitId
    UnitIdToTableId[ActorInfo.UnitId] = MaxTableId
  end
  local Count = math.min(RandomRuleInfo.Count, ParamsNum)
  
  local function GetRandomRes()
    local CurrentTableId = 1
    for Id, Num in pairs(UnitInfoWeight) do
      if nil == ProportionList[Id] then
        ProportionList[Id] = 0
      end
      if ProportionList[Id] ~= math.floor(Num / WeightSum * Count) then
        ProportionList[Id] = ProportionList[Id] + 1
        return Id, UnitLevel[Id], UnitIdToTableId[Id]
      end
      CurrentTableId = CurrentTableId + 1
      if CurrentTableId > MaxTableId then
        return UnitIdList[CurrentTableId], UnitLevel[Id], math.random(1, MaxTableId)
      end
    end
  end
  
  return GetRandomRes()
end

function AvatarUtils:GetRandomRuleType_One(RandomRuleInfo)
  local UnitInfoWeight = {}
  local UnitLevel = {}
  local WeightSum = 0
  local UnitIdToTableId = {}
  local MaxTableId = 0
  for _, ActorInfo in ipairs(RandomRuleInfo.RandomInfos) do
    UnitInfoWeight[ActorInfo.UnitId] = ActorInfo.Weight
    UnitLevel[ActorInfo.UnitId] = ActorInfo.UnitLevel or 1
    WeightSum = WeightSum + ActorInfo.Weight
    MaxTableId = MaxTableId + 1
    UnitIdToTableId[ActorInfo.UnitId] = MaxTableId
  end
  
  local function GetRandomRes()
    for UnitId, Weight in pairs(UnitInfoWeight) do
      local RandomNumber = math.random(1, WeightSum)
      if Weight >= RandomNumber then
        return UnitId, UnitLevel[UnitId], UnitIdToTableId[UnitId]
      end
      WeightSum = WeightSum - Weight
    end
  end
  
  return GetRandomRes()
end

return AvatarUtils
