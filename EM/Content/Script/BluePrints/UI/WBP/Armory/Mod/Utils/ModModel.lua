local ModCommon = require("BluePrints.UI.WBP.Armory.Mod.Utils.ModCommon")
local ModDatas = require("BluePrints.UI.WBP.Armory.Mod.Utils.ModDatas")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local SkillUtils = require("Utils.SkillUtils")
local MiscUtils = require("Utils.MiscUtils")
local CommonUtils = require("Utils.CommonUtils")
local ModSlotUIData = ModDatas.ModSlotUIData
local SelectedStuff = ModDatas.SelectedStuff
local PolarityEditModePayload = ModDatas.PolarityEditModePayload
local AutoEquipPayload = ModDatas.AutoEquipPayload
local M = Class("BluePrints.Common.MVC.Model")
M._components = {
  "BluePrints.UI.WBP.Armory.Mod.Utils.ModModel_CopyModeComp",
  "BluePrints.UI.WBP.Armory.ModModel_DyePlanCopyModeComp"
}

function M:Init()
  M.Super.Init(self)
  self:InitSortFunc()
  self.TargetType = nil
  self.CurModTarget = nil
  self.TargetMods = {}
  self:ResetUIData()
  self.SuitInfoCopyed = nil
end

function M:Destory()
  self.CurModTarget = nil
  self.TargetType = nil
  self.SuitInfoCopyed = nil
  self.TargetMods = {}
  self:ResetUIData()
  M.Super.Destory(self)
end

function M:GetAvatar()
  if self:IsInImport() then
    return M.Super.GetAvatar(self)
  end
  if self.DummyAvatar_CopyMode then
    return self.DummyAvatar_CopyMode
  end
  return ArmoryUtils:GetAvatar()
end

function M:ResetUIData()
  self.CurModList = {}
  self.CurModToIndex = {}
  self.CurSlots = {}
  self.EquipedMods = {}
  self.PolarityEditModeData = nil
  self.AutoEquipData = nil
  self.SortType = CommonConst.DESC
  self.SortBy = 1
  self.SelectedSiftItems = nil
  self.SelectedStuff = nil
  self.SiftItemDatas = nil
  self.CurSelectMod = nil
  self.MainUICase = ModCommon.MainUICase.Normal
  self.GamePadSelectedStuff = nil
  self.DummyAvatar_CopyMode = nil
end

function M:GenerateSlotUIDatas(SuitIndex)
  if not self.CurModTarget then
    return
  end
  self.CurSlots = {}
  self.EquipedMods = {}
  for SlotId, Slot in pairs(self:GetTarget():GetModSuit(SuitIndex)) do
    local NewSlotUIData = ModSlotUIData.New()
    NewSlotUIData:Init(SlotId, self:GetTarget())
    self.CurSlots[SlotId] = NewSlotUIData
    if NewSlotUIData.ModEid then
      self:SetEquipedMod(SlotId, NewSlotUIData.ModEid)
    end
  end
end

function M:CreateModContent(Mod)
  local ModContent = ArmoryUtils:NewModItemContent(Mod)
  ModContent.bEnableDrag = true
  ModContent.IsSelected = false
  ModContent.IsArmoryMod = true
  ModContent.IsNew = ArmoryUtils:TryAddNewModReddot(Mod)
  ModContent.bDontOpenTipsWhenClick = true
  ModContent.bAura = false
  local ApplySlot = Mod:Data().ApplySlot
  if ApplySlot and 1 == #ApplySlot and table.findValue(ApplySlot, 9) then
    ModContent.bAura = true
  end
  return ModContent
end

function M:SetMainUICase(MainUICase)
  self.MainUICase = MainUICase
end

function M:SetSelectedStuff(ModUuid, SlotId)
  if self:IsInPolarityEditMode() then
    self.PolarityEditModeData:SetSelectedStuff(SlotId)
    return
  end
  if not ModUuid and not SlotId then
    self.SelectedStuff = nil
    self.CurSelectMod = nil
    return
  end
  self.SelectedStuff = SelectedStuff.New()
  self.SelectedStuff.ModUuid = ModUuid
  self.SelectedStuff.SlotId = SlotId
  self:_SetCurrSelectMod(ModUuid)
end

function M:SetEquipedMod(SlotId, ModUuid)
  if not self.EquipedMods[ModUuid] then
    self.EquipedMods[ModUuid] = {}
  end
  table.insert(self.EquipedMods[ModUuid], SlotId)
end

function M:RemoveEquipedMod(SlotId, ModUuid)
  if self.EquipedMods[ModUuid] then
    local Res, i = table.findValue(self.EquipedMods[ModUuid], SlotId)
    if Res then
      table.remove(self.EquipedMods[ModUuid], i)
    end
    if table.isempty(self.EquipedMods[ModUuid]) then
      self.EquipedMods[ModUuid] = nil
    end
  end
end

function M:CalcQuickEquipSlotsList(ModUuid)
  local SortedSlots = {}
  local Mod = self:GetMod(ModUuid)
  if not Mod then
    return SortedSlots
  end
  for SlotId, SlotUIData in pairs(self.CurSlots) do
    if not self:IsSpecificSlot(ModUuid, SlotId) then
    elseif SlotUIData:InState(ModCommon.SlotState.UnLock) and not SlotUIData:InState(ModCommon.SlotState.Used) then
      table.insert(SortedSlots, SlotUIData)
    end
  end
  
  local function SortFunc(SlotUIData1, SlotUIData2)
    if Mod.Polarity == SlotUIData1:GetPolarity() and Mod.Polarity == SlotUIData2:GetPolarity() then
      return SlotUIData1.SlotId < SlotUIData2.SlotId
    end
    if Mod.Polarity == SlotUIData1:GetPolarity() then
      return true
    end
    if Mod.Polarity == SlotUIData2:GetPolarity() then
      return false
    end
    if Mod.Polarity ~= CommonConst.NonePolarity then
      if SlotUIData1:GetPolarity() == CommonConst.NonePolarity and SlotUIData2:GetPolarity() == CommonConst.NonePolarity then
        return SlotUIData1.SlotId < SlotUIData2.SlotId
      end
      if CommonConst.NonePolarity == SlotUIData1:GetPolarity() then
        return true
      end
      if CommonConst.NonePolarity == SlotUIData2:GetPolarity() then
        return false
      end
    end
    return SlotUIData1.SlotId < SlotUIData2.SlotId
  end
  
  table.sort(SortedSlots, SortFunc)
  return SortedSlots
end

function M:AddMod(ModUuid)
  self:GenerateModRepeatData(ModUuid)
  table.insert(self.CurModList, ModUuid)
  self:SortMods()
end

function M:RemoveMod(ModUuid)
  local Index = self.CurModToIndex[ModUuid]
  if Index then
    local ModUuid = self.CurModList[Index]
    table.remove(self.CurModList, Index)
    self.CurModToIndex[ModUuid] = nil
  end
end

function M:GenerateModRepeatData(ModUuid, Target)
  Target = Target or self:GetTarget()
  local Tag = self.TargetType
  local SuitIndex = Target.ModSuitIndex
  local ModSuit = {}
  for SlotId, Slot in pairs(Target:GetModSuit(SuitIndex)) do
    if self:IsModUuidValid(Slot.ModEid) then
      ModSuit[SlotId] = Slot.ModEid
    else
      ModSuit[SlotId] = -1
    end
  end
  local Res, OtherConflictMods = AvatarUtils:CheckModRepeat(self:GetAvatar(), Tag, Target.Uuid, SuitIndex, ModUuid, ModSuit)
  local Mod = self:GetMod(ModUuid)
  if not Mod then
    return
  end
  Mod.ConflictUuids:Clear()
  if not Res then
    for _, OtherConflictMod in ipairs(OtherConflictMods or {}) do
      if OtherConflictMod and OtherConflictMod.Uuid ~= ModUuid and not self:IsEquipedInCurrSuit(ModUuid) then
        Mod.ConflictUuids:Append(OtherConflictMod.Uuid)
      end
    end
  end
end

function M:_SetCurrSelectMod(ModUuid)
  if not ModUuid then
    self.CurSelectMod = nil
  else
    local Mod = self:GetMod(ModUuid)
    self.CurSelectMod = Mod
  end
end

function M:SetTarget(Target)
  self:CalcModSuitTotalCost(Target, Target.ModSuitIndex, true)
  self.CurModTarget = Target.Uuid
  self.TargetType = Target:GetTypeName()
  self.TargetMods = {}
  for ModUuid, Mod in pairs(self:GetAvatar().Mods) do
    if self:IsModMatchApplicationType(Mod) then
      self.TargetMods[ModUuid] = ModUuid
    end
  end
  self:UpdateConflictMods()
end

function M:CalcModSuitTotalCost(Target, ModSuitIndex, bCache)
  ModSuitIndex = ModSuitIndex or Target.ModSuitIndex
  local Cost = AvatarUtils:GetModCostInSuit_SwitchMod(self:GetAvatar(), Target:GetTypeName(), Target.Uuid, ModSuitIndex, nil, nil, function(_, Avatar, Tag, Uuid, ModSuitIndex)
    local ModSuit = AvatarUtils:GetTargetModSuit(Target, ModSuitIndex)
    if not ModSuit then
      return false, 0, {}, {}, ModSuit, Target
    end
    ModSuit = {}
    for SlotId, Slot in pairs(Target:GetModSuit(ModSuitIndex)) do
      if self:IsModUuidValid(Slot.ModEid) then
        ModSuit[SlotId] = Slot.ModEid
      else
        ModSuit[SlotId] = -1
      end
    end
    return true, 0, {}, {}, ModSuit, Target
  end)
  if bCache then
    Target:SetModSuitCost(Cost, ModSuitIndex)
  end
  return Cost
end

function M:CalcModVolumeDiff(Case, Target, ...)
  local MaxModVolume = Target:GetModVolume()
  local ModSuitIndex = Target.ModSuitIndex
  local CurrentModVolume = self:CalcModSuitTotalCost(Target, ModSuitIndex)
  local PreviewModVolume = CurrentModVolume
  if Case == ModCommon.CalcVolumeDiffCase.Exchange then
    local SSlotId, TSlotId = ...
    local SModSlot = Target:GetModSuit(ModSuitIndex)[SSlotId]
    local TModSlot = Target:GetModSuit(ModSuitIndex)[TSlotId]
    local SModSlotModUuid = SModSlot.ModEid
    local TModSlotModUuid = TModSlot.ModEid
    SModSlot.ModEid = TModSlotModUuid
    TModSlot.ModEid = SModSlotModUuid
    PreviewModVolume = self:CalcModSuitTotalCost(Target, ModSuitIndex)
    TModSlot.ModEid = TModSlotModUuid
    SModSlot.ModEid = SModSlotModUuid
  elseif Case == ModCommon.CalcVolumeDiffCase.Change then
    local SlotId, ModUuid = ...
    local ModSlot = Target:GetModSuit(ModSuitIndex)[SlotId]
    local ModSlotModUid = ModSlot.ModEid
    ModSlot.ModEid = ModUuid or ""
    PreviewModVolume = self:CalcModSuitTotalCost(Target, ModSuitIndex)
    ModSlot.ModEid = ModSlotModUid
    local Mod = self:GetMod(ModUuid)
    if Mod then
      MaxModVolume = MaxModVolume + Mod:CalcExtralCharVolume()
    end
  end
  if PreviewModVolume > MaxModVolume then
    return false, PreviewModVolume - CurrentModVolume
  end
  return true, PreviewModVolume - CurrentModVolume
end

function M:CalcSlotRealCost(SlotId, SuitInfo, ModInfo, SlotPolarity)
  local ModSuit = SuitInfo:GetModSuit()
  local TargetSlot = ModSuit[SlotId]
  local ReduceCost = 0
  for _, Slot in pairs(ModSuit) do
    local SlotMod = self:GetAvatar().Mods[Slot.ModEid]
    if SlotMod and not table.isempty(SlotMod.ReducePolarityEffect) and SlotMod.ReducePolarityEffect[1] == ModInfo.Polarity then
      ReduceCost = ReduceCost + SlotMod.ReducePolarityEffect[2]
    end
  end
  local SlotCost = TargetSlot:GetModCost(ModInfo.Polarity, ModInfo.Cost, SlotPolarity)
  return math.max(0, SlotCost - ReduceCost)
end

function M:ForceCalcSlotsCost(ExcludeModUuid, bTakeOff)
  local ExcludeMod = self:GetMod(ExcludeModUuid)
  local DirtySlotIds = {}
  for SlotId, SlotUIData in pairs(self.CurSlots) do
    local ModUuid = SlotUIData.ModEid
    if ModUuid and ModUuid ~= ExcludeModUuid then
      local Mod = self:GetMod(ModUuid)
      if ExcludeMod.AddCharModCost or Mod.Polarity == ExcludeMod.ReducePolarityEffect[1] then
        self.CurSlots[SlotId] = ModSlotUIData.New()
        self.CurSlots[SlotId]:Init(SlotId, self:GetTarget())
        if not self:IsModUuidValid(self.CurSlots[SlotId].ModEid) then
          self:RemoveEquipedMod(SlotId, ModUuid)
          DirtySlotIds[SlotId] = ModUuid
        else
          DirtySlotIds[SlotId] = ""
        end
      end
    elseif bTakeOff then
      self.CurSlots[SlotId]:SetModEid(nil)
    end
  end
  return DirtySlotIds
end

function M:UpdateConflictMods()
  for i, ModUuid in ipairs(self.CurModList) do
    self:GenerateModRepeatData(ModUuid)
  end
end

function M:GetSelectStuff()
  if self:IsInPolarityEditMode() then
    return self.PolarityEditModeData.SelectedStuff
  end
  return self.SelectedStuff
end

function M:GetSlotUIData(SlotId)
  return self.CurSlots[SlotId]
end

function M:GetSlotIdsWhichEquiped(ModUuid)
  return self.EquipedMods[ModUuid]
end

function M:IsEquipedInCurrSuit(ModUuid)
  local ClentRes = not table.isempty(self:GetSlotIdsWhichEquiped(ModUuid))
  local ServerRes = false
  local Target = self:GetTarget()
  for _, Uuid in ipairs(AvatarUtils:GetTargetModSuit(Target, Target.ModSuitIndex)) do
    if ModUuid == Uuid then
      ServerRes = true
      break
    end
  end
  return ClientRes or ServerRes
end

function M:GetModCountById(Id)
  local Count = 0
  for _, Mod in pairs(self:GetAvatar().Mods) do
    if Mod.ModId == Id then
      Count = Count + Mod.Count
    end
  end
  return Count
end

function M:GetSlotUIDatasWhichConflict(ModUuid)
  local Res = {}
  local Mod = self:GetMod(ModUuid)
  if not Mod or 0 == Mod.ConflictUuids:Length() then
    return Res
  end
  for _, ConflictUuid in ipairs(Mod.ConflictUuids) do
    local SlotIds = self:GetSlotIdsWhichEquiped(ConflictUuid) or {}
    for _, SlotId in ipairs(SlotIds) do
      table.insert(Res, self.CurSlots[SlotId])
    end
  end
  return Res
end

function M:IsAnyModEquiped()
  if self:IsInImport() then
    local Target = self:GetTarget()
    local ModSuit = Target:GetModSuit()
    return not ModSuit:IsAllEmpty()
  end
  return not table.isempty(self.EquipedMods)
end

function M:GetTarget()
  if not self.TargetType then
    return nil
  end
  if self.TargetType == CommonConst.DataType.Char then
    return self:GetAvatar().Chars[self.CurModTarget]
  elseif self.TargetType == CommonConst.DataType.Weapon then
    return self:GetAvatar().Weapons[self.CurModTarget]
  elseif self.TargetType == CommonConst.ArmoryTag.UWeapon then
    return self:GetAvatar().UWeapons[self.CurModTarget]
  end
end

function M:GetCurrSelectMod()
  return self.CurSelectMod
end

function M:IsSpecificSlot(ModUuid, SlotId)
  local Mod = self:GetMod(ModUuid)
  return self:IsSpecificSlotByMod(Mod, SlotId)
end

function M:IsSpecificSlotByMod(Mod, SlotId)
  local SpecificSlots = Mod:Data().ApplySlot
  if table.isempty(SpecificSlots) then
    return true
  end
  for _, CSlotId in ipairs(SpecificSlots) do
    if CSlotId == SlotId then
      return true
    end
  end
  return false
end

function M:GetMod(ModUuid)
  if not self:IsModUuidValid(ModUuid) then
    return
  end
  return self:GetAvatar().Mods[ModUuid]
end

function M:IsBugMod(ModUuid)
  if not GWorld.IsDev then
    return false
  end
  local Mod = self:GetMod(ModUuid)
  local ModConf = Mod:Data()
  local GenDesc = ArmoryUtils:GenModPassiveEffectDesc(ModConf, Mod.Level)
  if GenDesc == ModConf.PassiveEffectsDesc then
    GWorld.logger.error(string.format("ModId: %s \231\154\132\232\162\171\229\138\168\230\143\143\232\191\176\230\178\161\230\156\137\229\161\171\229\165\189 \230\143\143\232\191\176\230\150\135\230\156\172:%s", Mod.ModId, GenDesc))
    return true
  end
  for _, AddAttr in ipairs(ModConf.AddAttrs or {}) do
    AddAttr = SkillUtils.GrowProxyBySkillLevel("Mod", Mod.ModId, Mod.Level, AddAttr)
    local AttrVal = AddAttr.Value or AddAttr.Rate
    if type(AttrVal) ~= "number" then
      GWorld.logger.error(string.format("ModId: %s \231\154\132\229\177\158\230\128\167\233\133\141\231\189\174\230\156\137\233\151\174\233\162\152\239\188\140\229\177\158\230\128\167\229\144\141%s\231\154\132\231\180\162\229\188\149%s\230\137\190\228\184\141\229\136\176\231\155\184\229\133\179\231\154\132\230\136\144\233\149\191\233\133\141\231\189\174\n(AllowModMultiplier:%s)", Mod.ModId, AddAttr.AttrName, AttrVal, AddAttr.AllowModMultiplier or "\230\151\160"))
      return true
    end
  end
  return false
end

function M:IsModUuidValid(ModUuid)
  if type(ModUuid) == "number" then
    return -1 ~= ModUuid
  end
  if type(ModUuid) == "string" then
    return not string.isempty(ModUuid)
  end
  return false
end

function M:GetCurrentSuitCost(Target)
  Target = Target or self:GetTarget()
  return Target:GetModSuitCost()
end

function M:GetTargetMaxCost(Target)
  Target = Target or self:GetTarget()
  return Target:GetModVolume()
end

function M:GetModSlot(Target, SlotId, SuitIndex)
  local ModSuit = Target:GetModSuit(SuitIndex)
  local ModSlot = ModSuit[SlotId]
  return ModSlot
end

function M:IsRecommendedMod(SlotUIData, ModUuid)
  if not SlotUIData.ModEid then
    return false
  end
  local SlotMod = self:GetMod(SlotUIData.ModEid)
  local OtherMod = self:GetMod(ModUuid)
  local Case = ModCommon.CalcVolumeDiffCase.Change
  local Target = self:GetTarget()
  local Res, CostDiff = self:CalcModVolumeDiff(Case, Target, SlotUIData.SlotId, ModUuid)
  if Res and OtherMod.Rarity > SlotMod.Rarity then
    return true
  end
  return false
end

function M:IsOwnedBySkillTree(SkillId)
  local Target = self:GetTarget()
  if not Target or Target:GetTypeName() ~= "Char" then
    return false
  end
  local SkillTreeInfo = Target.SkillTree
  for BranchIdx, BranchInfo in ipairs(SkillTreeInfo) do
    local NodeInfo = BranchInfo[1]
    if NodeInfo:IsSkill() and NodeInfo.TargetId == SkillId and 0 == NodeInfo.SkillOrAttr then
      return true
    end
  end
  return false
end

function M:GetSuitName(SuitIndex, Target)
  Target = Target or self:GetTarget()
  SuitIndex = SuitIndex or Target.ModSuitIndex
  if Target and 1 == Target.Uuid and Target.CharId then
    local RealAvatar = ArmoryUtils:GetAvatar()
    if RealAvatar and RealAvatar.Chars then
      for CharUuid, RealChar in pairs(RealAvatar.Chars) do
        if RealChar.CharId == Target.CharId then
          local RealSuitName = RealChar.ModSuitsName[SuitIndex]
          if not string.isempty(RealSuitName) then
            return RealSuitName
          end
          break
        end
      end
    end
  end
  local SuitName = Target.ModSuitsName[SuitIndex]
  if string.isempty(SuitName) then
    SuitName = GText(string.format("Mod_SuitName_%s", SuitIndex))
  end
  return SuitName
end

function M:GetPolarityText(Polarity)
  return DataMgr.ModPolarity[Polarity].Char or ""
end

function M:GetSortedPolarityConfs()
  local SortedConfs = MiscUtils.Values(DataMgr.ModPolarity)
  table.sort(SortedConfs, function(a, b)
    return a.Id < b.Id
  end)
  return SortedConfs
end

function M:IsModUINormal()
  return self.MainUICase == ModCommon.MainUICase.Normal
end

function M:IsModUICopyMode()
  return self.MainUICase == ModCommon.MainUICase.CopyMode
end

function M:IsModUIPreview()
  return self.MainUICase == ModCommon.MainUICase.Preview
end

function M:FilterModsOfTarget()
  if not self.CurModTarget then
    return
  end
  self.CurModList = {}
  for ModUuid, _ in pairs(self.TargetMods) do
    local Mod = self:GetMod(ModUuid)
    if self:FilterSingleModOfTarget(CommonConst.NonePolarity, false, Mod) then
      self:GenerateModRepeatData(Mod.Uuid)
      table.insert(self.CurModList, Mod.Uuid)
    end
  end
  self:SortMods()
end

function M:IsModMatchApplicationType(Mod)
  if not Mod or not Mod.ApplicationType then
    return false
  end
  if not self:GetTarget():HasApplicationType(Mod.ApplicationType) then
    return false
  end
  return true
end

function M:IsModMatchPolarity(Mod, Polarity, bStrictMatch)
  if Mod.Polarity ~= Polarity and (bStrictMatch or Polarity > 0) then
    return false
  end
  return true
end

function M:FilterSingleModOfTarget(Polarity, bStrictMatch, Mod)
  if not self:IsModMatchApplicationType(Mod) then
    return false
  end
  if not self:IsModMatchPolarity(Mod, Polarity, bStrictMatch) then
    return false
  end
  if not self:IsModMatchSift(Mod) then
    return false
  end
  return true
end

function M:InitSortFunc()
  if not self.ModSortFunc then
    self.ModSortFunc = {
      [2] = function(x, y)
        if type(x) ~= "table" and type(y) ~= "table" then
          x = self:GetMod(x)
          y = self:GetMod(y)
        end
        if x.Level ~= y.Level then
          return self:_Compare(x.Level, y.Level)
        end
        if x.Rarity ~= y.Rarity then
          return self:_Compare(x.Rarity, y.Rarity)
        end
        if x.Cost ~= y.Cost then
          return self:_Compare(x.Cost, y.Cost)
        end
        if x.Polarity ~= y.Polarity then
          return self:_Compare(y.Polarity, x.Polarity)
        end
        return self:_Compare(y.ModId, x.ModId)
      end,
      [1] = function(x, y)
        if type(x) ~= "table" and type(y) ~= "table" then
          x = self:GetMod(x)
          y = self:GetMod(y)
        end
        if x.Rarity ~= y.Rarity then
          return self:_Compare(x.Rarity, y.Rarity)
        end
        if x.Level ~= y.Level then
          return self:_Compare(x.Level, y.Level)
        end
        if x.Cost ~= y.Cost then
          return self:_Compare(x.Cost, y.Cost)
        end
        if x.Polarity ~= y.Polarity then
          return self:_Compare(y.Polarity, x.Polarity)
        end
        return self:_Compare(y.ModId, x.ModId)
      end,
      [3] = function(x, y)
        if type(x) ~= "table" and type(y) ~= "table" then
          x = self:GetMod(x)
          y = self:GetMod(y)
        end
        if x.Cost ~= y.Cost then
          return self:_Compare(x.Cost, y.Cost)
        end
        if x.Rarity ~= y.Rarity then
          return self:_Compare(x.Rarity, y.Rarity)
        end
        if x.Level ~= y.Level then
          return self:_Compare(x.Level, y.Level)
        end
        if x.Polarity ~= y.Polarity then
          return self:_Compare(y.Polarity, x.Polarity)
        end
        return self:_Compare(y.ModId, x.ModId)
      end
    }
  end
end

function M:_Compare(x, y)
  return CommonUtils:Compare(x, y, self.SortType)
end

function M:SetSortConf(SortBy, SortType)
  if SortType and SortType ~= self.SortType then
    self.SortType = SortType
  end
  if SortBy and SortBy ~= self.SortBy then
    self.SortBy = SortBy
  end
end

function M:SetSiftConf(SelectedItems, ItemDatas)
  self.SelectedSiftItems = SelectedItems
  self.SiftItemDatas = ItemDatas
end

function M:SortMods()
  table.sort(self.CurModList, self.ModSortFunc[self.SortBy])
  self.CurModToIndex = {}
  for i, ModUuid in ipairs(self.CurModList) do
    self.CurModToIndex[ModUuid] = i
  end
end

function M:IsModMatchSift(ModItem)
  if table.isempty(self.SelectedSiftItems) then
    return true
  end
  local fieldMapping = {}
  local SubIds = DataMgr.SiftModel[ModCommon.ModSiftId].SubId
  for i, SiftId in ipairs(SubIds) do
    local SiftData = DataMgr.SiftDimens[SiftId]
    fieldMapping[i] = SiftData.SelectionField[1]
  end
  for i, SiftItem in pairs(self.SelectedSiftItems) do
    local FieldName = fieldMapping[i]
    local modFieldValue
    if "FilterTag" == FieldName then
      modFieldValue = ModItem.FilterTag
    else
      modFieldValue = ModItem[FieldName]
      if "Level" == FieldName and type(modFieldValue) == "number" and modFieldValue > 1 then
        modFieldValue = 1
      end
      if "bAura" == FieldName then
        local bAura = ModItem:IsAura()
        if bAura then
          modFieldValue = 1
        else
          modFieldValue = 0
        end
      end
      if type(modFieldValue) == "number" then
        modFieldValue = tostring(modFieldValue)
      end
    end
    if not modFieldValue then
      return false
    end
    local siftValues = {}
    for _, index in pairs(SiftItem) do
      local siftValue = self.SiftItemDatas[i].SelectionDatas[index]
      if siftValue then
        table.insert(siftValues, siftValue)
      end
    end
    local matched = false
    if "FilterTag" == fieldMapping[i] then
      for _, tagValue in ipairs(modFieldValue) do
        for _, siftValue in ipairs(siftValues) do
          if tagValue == siftValue then
            matched = true
            break
          end
        end
        if matched then
          break
        end
      end
    else
      for _, siftValue in ipairs(siftValues) do
        if modFieldValue == siftValue then
          matched = true
          break
        end
      end
    end
    if not matched then
      return false
    end
  end
  return true
end

function M:StartPolarityEditMode()
  local SelectedStuff = self:GetSelectStuff()
  self.PolarityEditModeData = PolarityEditModePayload.New(self:GetCurrentSuitCost())
  if SelectedStuff and SelectedStuff:IsSlot() then
    self.PolarityEditModeData:SetSelectedStuff(SelectedStuff.SlotId)
  end
  for SlotId, SlotUIData in pairs(self.CurSlots) do
    SlotUIData:SetPolarityEditMode(true)
  end
end

function M:StopPolarityEditMode()
  self.PolarityEditModeData = nil
  for SlotId, SlotUIData in pairs(self.CurSlots) do
    SlotUIData:SetPolarityEditMode(false)
  end
end

function M:IsInPolarityEditMode()
  return self.PolarityEditModeData ~= nil
end

function M:IsInAutoEquip()
  return self.AutoEquipData ~= nil
end

function M:StartAutoEquip(CoroutineObj, ModSuitCopyInfo)
  self.AutoEquipData = AutoEquipPayload.New(CoroutineObj)
  self.ModListForAutoEquip = {}
  if not ModSuitCopyInfo then
    for ModUuid, _ in pairs(self.TargetMods) do
      local Mod = self:GetMod(ModUuid)
      if self:IsModMatchApplicationType(Mod) then
        table.insert(self.ModListForAutoEquip, Mod.Uuid)
      end
    end
  else
    for SlotId, SlotData in ipairs(ModSuitCopyInfo.ModsInfo) do
      local ModId = SlotData[2]
      local Mods = self:GetAvatar():GetModsByModId(ModId)
      for _, Mod in ipairs(Mods) do
        if self:IsModMatchApplicationType(Mod) then
          table.insert(self.ModListForAutoEquip, Mod.Uuid)
        end
      end
    end
  end
  if not self.SortSlotForAutoEquip then
    function self.SortSlotForAutoEquip(Id1, Id2)
      local Slot1 = self:GetSlotUIData(Id1)
      
      local Slot2 = self:GetSlotUIData(Id2)
      local Res = Slot1:GetPolarity() > Slot2:GetPolarity()
      local bAuraSlot1 = Id1 == ModCommon.MaxSlotCount
      local bAuraSlot2 = Id2 == ModCommon.MaxSlotCount
      if bAuraSlot1 == bAuraSlot2 then
        return Res
      end
      if bAuraSlot1 then
        return true
      end
      if bAuraSlot2 then
        return false
      end
      return Res
    end
  end
end

function M:StopAutoEquip()
  self.AutoEquipData = nil
  self.ModListForAutoEquip = nil
end

function M:PickSuitableModForSlot(SlotUIData, bAllSlotPolarized)
  local FilteredList = self:_FilterListOfPolarity(SlotUIData:GetPolarity(), false, SlotUIData)
  local ModPendingList = {}
  for _, Mod in ipairs(FilteredList) do
    if 0 == Mod.ConflictUuids:Length() then
      table.insert(ModPendingList, Mod)
    end
  end
  local bNeedOneMore = false
  if 0 == #ModPendingList then
    ModPendingList = self:_FilterListOfPolarity(CommonConst.NonePolarity, true, SlotUIData)
  else
    bNeedOneMore = true
  end
  if 0 == #ModPendingList and (SlotUIData:GetPolarity() == CommonConst.NonePolarity or bAllSlotPolarized) then
    ModPendingList = self:_FilterListOfPolarity(CommonConst.NonePolarity, false, SlotUIData)
  end
  if 0 == #ModPendingList then
    return 0
  end
  local TempSortType = self.SortType
  self.SortType = 2
  table.sort(ModPendingList, self.ModSortFunc[2])
  self.SortType = TempSortType
  local Mod = self:_PickSuitableModInPendingList(ModPendingList, SlotUIData)
  if Mod then
    return Mod
  end
  if bNeedOneMore then
    local OneMorePendingList = self:_FilterListOfPolarity(CommonConst.NonePolarity, true, SlotUIData)
    Mod = self:_PickSuitableModInPendingList(OneMorePendingList, SlotUIData)
    if Mod then
      return Mod
    end
  end
  return nil
end

function M:_FilterListOfPolarity(Polarity, bStrictMatch, SlotUIData)
  local ModPendingList = {}
  for _, ModUuid in ipairs(self.ModListForAutoEquip) do
    local Mod = self:GetMod(ModUuid)
    if self:IsModMatchPolarity(Mod, Polarity, bStrictMatch) then
      local IsAuraSlot = SlotUIData:IsAura()
      if IsAuraSlot and Mod:IsAura() or not IsAuraSlot then
        table.insert(ModPendingList, Mod)
      end
    end
  end
  return ModPendingList
end

function M:_PickSuitableModInPendingList(ModPendingList, SlotUIData)
  for _, Mod in ipairs(ModPendingList) do
    if Mod.ConflictUuids:Length() > 0 then
    elseif self.AutoEquipData:IsModEquiped(Mod.Uuid) then
    elseif not self:IsSpecificSlot(Mod.Uuid, SlotUIData.SlotId) then
    elseif self:IsBugMod(Mod.Uuid) then
    else
      local Case = ModCommon.CalcVolumeDiffCase.Change
      local Res, _ = self:CalcModVolumeDiff(Case, self:GetTarget(), SlotUIData.SlotId, Mod.Uuid)
      if Res then
        self.AutoEquipData:SetEquipMod(Mod.Uuid)
        return Mod
      end
    end
  end
  return nil
end

function M:GetPureAttrsOfTarget(WeaponOwnerChar, Target)
  Target = Target or self:GetTarget()
  local PureTargetAttrs = {}
  local ExtraInfo = {}
  if WeaponOwnerChar then
    ExtraInfo = {Char = WeaponOwnerChar}
  end
  PureTargetAttrs = Target:DumpBattleAttr(self:GetAvatar(), ExtraInfo).TotalValues or {}
  return PureTargetAttrs
end

function M:GenerateAttrList(PreAttrs, NowAttrs, Index2AttrKey, bPinned, PureTargetAttrs, bModAdditionOnly, ExtraVolume)
  local Target = self:GetTarget()
  local DisplayAttrs = {}
  local Type = Target:GetTypeName()
  if Type == CommonConst.ArmoryTag.UWeapon then
    Type = CommonConst.DataType.Weapon
  end
  local Tag = "Char" == Type and "Char" or Target:HasTag("Melee") and "Melee" or "Ranged"
  local TargetId = Target[Type .. "Id"]
  if Type == CommonConst.DataType.Char then
    for id, value in pairs(NowAttrs) do
      if CommonUtils:ShouldDisplayAttr(id, value, Type, Tag, TargetId) then
        table.insert(Index2AttrKey, id)
        DisplayAttrs[id] = value
      end
    end
    DisplayAttrs.ModVolume = PreAttrs.ModVolume
    if ExtraVolume then
      DisplayAttrs.ModVolume = DisplayAttrs.ModVolume + ExtraVolume
    end
  else
    ArmoryUtils:InsertWeaponTypeImpl(TargetId, NowAttrs)
    local WeaponTypeKey = "WeaponType"
    if NowAttrs[WeaponTypeKey] then
      table.insert(Index2AttrKey, WeaponTypeKey)
      DisplayAttrs[WeaponTypeKey] = NowAttrs[WeaponTypeKey]
    end
    local WeaponAttrData = DataMgr.BattleWeaponAttr
    for id, Data in pairs(WeaponAttrData) do
      local value = NowAttrs[id] or PureTargetAttrs[id]
      if next(PreAttrs) and not PreAttrs[id] then
        if value == NowAttrs[id] then
          PreAttrs[id] = PureTargetAttrs[id]
        else
          PreAttrs[id] = value
        end
      end
      if CommonUtils:ShouldDisplayAttr(id, value, Type, Tag, TargetId) then
        table.insert(Index2AttrKey, id)
        DisplayAttrs[id] = value
      end
    end
  end
  NowAttrs = DisplayAttrs
  if bModAdditionOnly then
    for key, value in pairs(PureTargetAttrs or {}) do
      if type(value) == "number" then
        if NowAttrs[key] then
          NowAttrs[key] = NowAttrs[key] - value
        end
        if PreAttrs[key] then
          PreAttrs[key] = PreAttrs[key] - value
        end
      end
    end
  end
  local bDiff = false
  if not table.isempty(PreAttrs) then
    local TempAttr = CommonUtils.TableLength(NowAttrs) > CommonUtils.TableLength(PreAttrs) and NowAttrs or PreAttrs
    for key, value in pairs(TempAttr) do
      local IsValueChange = PreAttrs[key] ~= NowAttrs[key]
      local IsKeyAdded = not PreAttrs[key] and NowAttrs[key]
      local IsKeyRemoved = PreAttrs[key] and not NowAttrs[key]
      local IsShowAttr = CommonUtils:ShouldDisplayAttr(key, NowAttrs[key], Type, Tag, TargetId)
      if IsValueChange or IsKeyAdded and IsShowAttr or IsKeyRemoved then
        bDiff = true
        break
      end
    end
  end
  if "UWeapon" == Type then
    Tag = "UWeapon"
  end
  local sortType = "SortIndex" .. ModCommon.AttrSortIndexes[Tag]
  table.sort(Index2AttrKey, function(x, y)
    local Res = DataMgr.AttrConfig[x][sortType] < DataMgr.AttrConfig[y][sortType]
    if bPinned then
      local bXValueChange = PreAttrs[x] ~= NowAttrs[x] or not PreAttrs[x] and NowAttrs[x]
      local bYValueChange = PreAttrs[y] ~= NowAttrs[y] or not PreAttrs[y] and NowAttrs[y]
      if bXValueChange == bYValueChange then
        return Res
      end
      if bXValueChange then
        return true
      end
      if bYValueChange then
        return false
      end
    end
    return Res
  end)
  return bDiff, PreAttrs, NowAttrs
end

function M:IsRecommendAttr(AttrKey)
  local Target = self:GetTarget()
  for _, Key in ipairs(Target:BattleData().RecommendAttr or {}) do
    if AttrKey == Key then
      return true
    end
  end
  return false
end

function M:_GenerateModUserOverCostMsg(TargetMod, PreviewLevel, User, Res)
  if not User then
    DebugPrint(ErrorTag, LXYTag, "Mod\231\154\132User\228\184\141\229\186\148\232\175\165\228\184\186\231\169\186\239\188\140Mod\231\154\132\229\143\141\229\144\145\229\188\149\231\148\168Uuid\229\136\151\232\161\168\230\156\137\233\151\174\233\162\152\239\188\140 Mod\239\188\154", TargetMod:GetName())
    return
  end
  local ExtraVolume = TargetMod:CalcExtralCharVolume(TargetMod:ExpectCost(PreviewLevel))
  for i, ModSlots in ipairs(User.ModSuits or {}) do
    if i == User.ModSuitIndex and User.Uuid == self:GetTarget().Uuid then
    else
      local MaxCost = User:GetModVolume() + ExtraVolume
      local bOverflow = false
      local SlotIds = {}
      for SlotId, SlotData in ipairs(User.ModSuits[i]) do
        if SlotData.ModEid == TargetMod.Uuid then
          table.insert(SlotIds, SlotId)
        end
      end
      for _, SlotId in ipairs(SlotIds) do
        local SlotUIData = self:GetSlotUIData(SlotId)
        local SuitInfo = {
          GetModSuit = function()
            return ModSlots
          end
        }
        local ModInfo = {
          Polarity = TargetMod.Polarity,
          Cost = TargetMod:ExpectCost(PreviewLevel)
        }
        local RealModCost = self:CalcSlotRealCost(SlotUIData.SlotId, SuitInfo, ModInfo)
        local SrcModCost = self:CalcSlotRealCost(SlotUIData.SlotId, SuitInfo, TargetMod)
        local NewCost = self:CalcModSuitTotalCost(User, i) + RealModCost - SrcModCost + ExtraVolume
        if MaxCost < NewCost then
          bOverflow = true
          break
        end
      end
      if bOverflow then
        table.insert(Res, {
          User:GetName(),
          self:GetSuitName(i, User)
        })
      end
    end
  end
end

function M:GetOtherModUserOverCostMsg(TargetMod, PreviewLevel)
  local Res = {}
  local VisitedUuid = {}
  if TargetMod:IsAura() then
    return Res
  end
  for _, UserUuid in pairs(TargetMod.CharUuids) do
    if not VisitedUuid[UserUuid] then
      local User = self:GetAvatar().Chars[UserUuid]
      self:_GenerateModUserOverCostMsg(TargetMod, PreviewLevel, User, Res)
      VisitedUuid[UserUuid] = true
    end
  end
  for _, UserUuid in pairs(TargetMod.WeaponUuids) do
    if not VisitedUuid[UserUuid] then
      local User = self:GetAvatar().Weapons[UserUuid]
      User = User or self:GetAvatar().UWeapons[UserUuid]
      self:_GenerateModUserOverCostMsg(TargetMod, PreviewLevel, User, Res)
      VisitedUuid[UserUuid] = true
    end
  end
  return Res
end

function M:UpdateModAttrListForIntensify(Attrs, ComparedAttrs, TargetMod, InPreviewLevel)
  local ModConf = TargetMod:Data()
  for _, Attr in pairs(ModConf.AddAttrs or {}) do
    local AttrConf = DataMgr.AttrConfig[Attr.AttrName]
    if not AttrConf then
    else
      local OldValue, OldValStr = ArmoryUtils:GenModAttrData(Attr, TargetMod.Level, AttrConf, ModConf.Id)
      table.insert(Attrs, {
        AttrName = GText(AttrConf.Name),
        AttrValue = OldValStr
      })
      local NewValue, NewValStr = ArmoryUtils:GenModAttrData(Attr, InPreviewLevel, AttrConf, ModConf.Id)
      local DiffValue = NewValue - OldValue
      if ComparedAttrs then
        table.insert(ComparedAttrs, {AttrValue = NewValStr, Delta = DiffValue})
      end
    end
  end
end

function M:UpdateModCostPreviewForIntensify(Attrs, ComparedAttrs, TargetMod, InPreviewLevel)
  local bTakeOff = false
  local OldCost = TargetMod.Cost
  local ExtraCostVolume = TargetMod:CalcExtralCharVolume()
  table.insert(Attrs, {
    AttrName = GText("UI_Select_Cost"),
    AttrValue = OldCost
  })
  if TargetMod.AddCharModCost then
    table.insert(Attrs, {
      AttrName = GText("UI_Mod_CostIncrease"),
      AttrValue = "+" .. ExtraCostVolume
    })
  end
  if ComparedAttrs then
    local NewCost = TargetMod:ExpectCost(InPreviewLevel)
    local DiffCost = NewCost - OldCost
    table.insert(ComparedAttrs, {
      AttrValue = NewCost,
      Delta = DiffCost,
      CalcColorType = function(Delta)
        return Delta < 0 and "Positive" or "Nagative"
      end
    })
    if TargetMod.AddCharModCost then
      local NewExtraCostVolume = TargetMod:CalcExtralCharVolume(NewCost)
      local DiffExtraCostVolume = NewExtraCostVolume - ExtraCostVolume
      table.insert(ComparedAttrs, {
        AttrValue = "+" .. NewExtraCostVolume,
        Delta = DiffExtraCostVolume
      })
    end
    local SelectedStuff = self:GetSelectStuff()
    if not SelectedStuff or not SelectedStuff:IsSlot() then
      return
    end
    local SlotId = SelectedStuff.SlotId
    local SlotUIData = self:GetSlotUIData(SlotId)
    OldCost = SlotUIData.UICost
    local FakeMod = {
      Polarity = TargetMod.Polarity,
      Cost = NewCost
    }
    NewCost = self:CalcSlotRealCost(SlotId, self:GetTarget(), FakeMod)
    DiffCost = NewCost - OldCost
    local RestCost = self:GetTargetMaxCost() + ExtraCostVolume - self:GetCurrentSuitCost()
    if DiffCost > RestCost then
      bTakeOff = true
    else
      bTakeOff = false
    end
  end
  return bTakeOff
end

function M:SetGamePadSelectedStuff(ModUuid, SlotId)
  if not ModUuid and not SlotId then
    self.GamePadSelectedStuff = nil
    return
  end
  self.GamePadSelectedStuff = SelectedStuff.New()
  self.GamePadSelectedStuff.ModUuid = ModUuid
  self.GamePadSelectedStuff.SlotId = SlotId
end

function M:GetGamePadSelectedStuff()
  return self.GamePadSelectedStuff
end

function M:FetchRunningGuide()
  self.bRunningGuide = CommonUtils:IfExistSystemGuideUI()
end

function M:GetOnceRunningGuide()
  local bRunning = self.bRunningGuide
  self.bRunningGuide = false
  return bRunning
end

AssembleComponents(M)
return M
