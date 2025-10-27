local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local Char = Class("Char", CustomTypes.CustomAttr)
Char.__Props__ = {
  Uuid = prop.prop("ObjId", "client save"),
  CharId = prop.prop("Int", "client save"),
  Exp = prop.prop("Int", "client save"),
  Level = prop.prop("Int", "client save", 1),
  EnhanceLevel = prop.prop("Int", "client save", 0),
  GradeLevel = prop.prop("Int", "client save", 0),
  ModSlotPolarity = prop.prop("IntList", "client save"),
  ModSlotStatus = prop.prop("IntList", "client save"),
  ModSuit_1 = prop.prop("ObjectIdList", "client save"),
  ModSuit_2 = prop.prop("ObjectIdList", "client save"),
  ModSuit_3 = prop.prop("ObjectIdList", "client save"),
  ModSuitIndex = prop.prop("Int", "client save", 1),
  ModVolume = prop.getter("CharLevelData", "ModVolume"),
  ModSuitsName = prop.prop("StrList", "client save", ""),
  ExtralModVolumes = prop.prop("IntList", "client save"),
  Skills = prop.prop("Skill.SkillList", "client save"),
  SkillTree = prop.prop("Skill.SkillTree", "client save"),
  ProminentWeapon = prop.prop("ObjId", "client save"),
  UWeaponEids = prop.prop("ObjectIdList", "client save"),
  CharName = prop.getter("Data", "CharName"),
  ModelId = prop.getter("Data", "ModelId"),
  RoleId = prop.getter("Data", "RoleId"),
  CharRarity = prop.getter("Data", "CharRarity"),
  ModApplicationType = prop.getter("BattleData", "ModApplicationType"),
  MeleeWeapon = prop.getter("Data", "MeleeWeapon"),
  RangedWeapon = prop.getter("Data", "RangedWeapon"),
  UltraWeapon = prop.getter("BattleData", "UltraWeapon"),
  UWeapon = prop.getter("Data", "UWeapon"),
  MaxLevel = prop.getter("Data", "CharMaxLevel"),
  CurrentAppearanceIndex = prop.prop("Int", "client save", 1),
  AppearanceSuits = prop.prop("Appearance.AppearanceList", "client save"),
  CharAccessory = prop.getter("Data", "AccessoryId"),
  DispatchTag = prop.getter("Data", "DispatchTag"),
  DispatchUnlock = prop.getter("Data", "DispatchUnlock"),
  DefaultSkinId = prop.getter("Data", "DispatchUnlock"),
  DefaultAccessory = prop.getter("Data", "DefaultAccessory")
}

function Char:Init(Uuid, CharId, Level)
  if not Uuid or not CharId then
    return
  end
  self.Uuid = Uuid
  self.CharId = CharId
  self:SetLevel(Level or 1)
  self:InitModConfig()
  self:HandleBattleCharInfo()
  self:InitSkillTree()
  if CharId then
    self:_Init()
  end
  self:InitAppearance()
end

function Char:HandleBattleCharInfo()
  local BattleCharInfo = DataMgr.BattleChar[self.RoleId]
  if BattleCharInfo and BattleCharInfo.SkillList then
    for index, SkillId in ipairs(BattleCharInfo.SkillList) do
      local skill = self.Skills:NewSkill(SkillId, 1, 0)
      self.Skills:Append(skill)
    end
  end
end

function Char:GetModInitCount()
  local InitCount = 3
  if DataMgr.GlobalConstant.ModPlanMaxSuitCount and DataMgr.GlobalConstant.ModPlanMaxSuitCount.ConstantValue ~= nil and DataMgr.GlobalConstant.ModPlanMaxSuitCount.ConstantValue > 0 then
    InitCount = DataMgr.GlobalConstant.ModPlanMaxSuitCount.ConstantValue
  end
  return InitCount
end

function Char:InitModConfig()
  local CharInfo = self:Data()
  if not CharInfo then
    return
  end
  local ModSlot = CharInfo.ModSlot
  local ModSlotUnlock = CharInfo.ModSlotUnlock
  if not ModSlot or not ModSlotUnlock then
    return
  end
  local InitCount = self:GetModInitCount()
  for i = 1, InitCount do
    self.ModSuitsName:Append("")
    self.ExtralModVolumes:Append(0)
  end
  for i, v in ipairs(ModSlot) do
    self.ModSlotPolarity:Append(v)
    if self.EnhanceLevel >= ModSlotUnlock[i] then
      self.ModSlotStatus:Append(CommonConst.CommonStatus.UnLock)
    else
      self.ModSlotStatus:Append(CommonConst.CommonStatus.Lock)
    end
    for i = 1, InitCount do
      if self["ModSuit_" .. i] then
        self["ModSuit_" .. i]:Append(CommonConst.ModSlotUnequipped)
      end
    end
  end
end

function Char:GetCurrentExtralModVolume()
  return self.ExtralModVolumes[self.ModSuitIndex] or 0
end

function Char:GetModVolume()
  return self.ModVolume + (self.ExtralModVolumes[self.ModSuitIndex] or 0)
end

function Char:GetOriginlModVolume()
  return self.ModVolume
end

function Char:AddExtralModVolume(TargetVolume)
  if TargetVolume <= 0 then
    return
  end
  self.ExtralModVolumes[self.ModSuitIndex] = (self.ExtralModVolumes[self.ModSuitIndex] or 0) + TargetVolume
end

function Char:SetExtralModVolume(TargetVolume, ModSuitIndex)
  if TargetVolume < 0 then
    return
  end
  self.ExtralModVolumes[ModSuitIndex] = TargetVolume
end

function Char:ReduceExtralModVolume(TargetVolume, ModSuitIndex)
  if TargetVolume < 0 then
    return
  end
  self.ExtralModVolumes[ModSuitIndex] = (self.ExtralModVolumes[ModSuitIndex] or 0) - math.min(TargetVolume, self.ExtralModVolumes[ModSuitIndex] or 0)
end

function Char:GetCurrentUnlockDispatchTag(CurrentUnlockDispatch)
  CurrentUnlockDispatch = CurrentUnlockDispatch or {}
  for i = 1, #self.DispatchUnlock do
    if self.EnhanceLevel >= self.DispatchUnlock[i] and self.DispatchTag[i] then
      if not CurrentUnlockDispatch[self.DispatchTag[i]] then
        CurrentUnlockDispatch[self.DispatchTag[i]] = 0
      end
      CurrentUnlockDispatch[self.DispatchTag[i]] = CurrentUnlockDispatch[self.DispatchTag[i]] + 1
    end
  end
  return CurrentUnlockDispatch
end

function Char:InitSkillTree()
  local TreeInfo = DataMgr.SkillTree[self.CharId]
  if not TreeInfo then
    return
  end
  for TreeIndex = 1, CommonConst.CharSkillTreeCount do
    if TreeInfo["Skill" .. TreeIndex] then
      local SkillTreeNodes = self.SkillTree:NewSkillTreeNodes()
      for NodeId = 1, CommonConst.CharSkillTreeCount do
        if TreeInfo["Skill" .. TreeIndex][NodeId] then
          local NodeData = TreeInfo["Skill" .. TreeIndex][NodeId]
          local IsSkill = 0
          local IsLocked
          local Id = -1
          if DataMgr.SkillTreeNode2SkillTreeUnlock[self.CharId] and DataMgr.SkillTreeNode2SkillTreeUnlock[self.CharId][TreeIndex] and DataMgr.SkillTreeNode2SkillTreeUnlock[self.CharId][TreeIndex][NodeId] then
            IsLocked = 1
          else
            IsLocked = 0
          end
          if NodeData.Skill then
            Id = NodeData.Skill
          elseif NodeData.Attr then
            Id = NodeData.Attr
            IsSkill = 1
          end
          if -1 ~= Id then
            local SkillTreeNode = SkillTreeNodes:NewSkillTreeNode(Id, IsSkill, IsLocked)
            SkillTreeNodes:Append(SkillTreeNode)
          end
        end
      end
      self.SkillTree:Append(SkillTreeNodes)
    end
  end
end

function Char:CheckSkillTreeNodeIsActive(TreeIndex, NodeIndex)
  if not TreeIndex or not NodeIndex then
    return false
  end
  local SkillTreeNode = self.SkillTree[TreeIndex][NodeIndex]
  if SkillTreeNode then
    return not SkillTreeNode:IsLocked()
  end
  return false
end

function Char:ActivateSkillTreeNode(TreeIndex, NodeIndex)
  if not TreeIndex or not NodeIndex then
    return
  end
  local SkillTreeNode = self.SkillTree[TreeIndex][NodeIndex]
  if SkillTreeNode and SkillTreeNode:IsLocked() then
    SkillTreeNode:UnLock()
  end
end

function Char:CheckSkillIsLocked(SkillId)
  for _, NodeList in ipairs(self.SkillTree) do
    for _, Node in ipairs(NodeList) do
      if Node:IsSkill() and SkillId == Node.TargetId and Node:IsLocked() then
        return true
      end
    end
  end
  return false
end

function Char:InitAppearance()
  for i = 1, 3 do
    self.AppearanceSuits:AddCharAppearance(self.CharId)
  end
end

function Char:_Init()
  AvatarUtils:RebuildModSuit(self)
  self:UpdateSkill()
end

function Char:GetName()
  return GText(self.CharName)
end

function Char:Data()
  local CData = DataMgr.Char[self.CharId]
  if not CData then
    CData = DataMgr.BattleChar[self.CharId]
    if not CData and not skynet then
      DebugPrint("ERROR::", string.format("\232\167\146\232\137\178Id%s \230\151\160\230\149\136\239\188\140\229\133\136\230\155\180\230\150\176\239\188\140\228\184\141\232\166\129\231\148\168\232\128\129\229\143\183\239\188\140\231\148\168\230\150\176\229\143\183\233\135\141\232\175\149\239\188\140\232\191\152\230\156\137\233\151\174\233\162\152\229\176\177\230\137\190\231\173\150\229\136\146\230\163\128\230\159\165\228\184\139Char\232\161\168\228\191\174\230\148\185\230\152\175\229\144\166\229\144\140\230\173\165\229\136\176\229\143\140\231\171\175", self.CharId))
    end
  end
  return CData
end

function Char:BattleData()
  return DataMgr.BattleChar[self.RoleId]
end

function Char:BattleDefaultData()
  return DataMgr.BattleCharAttr
end

function Char:CharAddonAttrData()
  return DataMgr.CharAddonAttr
end

function Char:CharLevelData()
  return DataMgr.LevelUp[self.Level]
end

function Char:LevelUpData(level)
  level = level or self.Level
  return DataMgr.LevelUp[level]
end

function Char:GetModSuit(SuitIndex)
  SuitIndex = SuitIndex or self.ModSuitIndex
  if skynet then
    return AvatarUtils:GetTargetModSuit(self, SuitIndex)
  else
    return self.ModSuits[SuitIndex]
  end
end

function Char:GetModSuitCost(SuitIndex)
  SuitIndex = SuitIndex or self.ModSuitIndex
  return self.ModSuitsCostMap[SuitIndex] or 0
end

function Char:SetModSuitCost(Cost, SuitIndex)
  SuitIndex = SuitIndex or self.ModSuitIndex
  self.ModSuitsCostMap[SuitIndex] = Cost
end

function Char:AddExp(Count)
  if type(Count) ~= "number" or Count <= 0 then
    return
  end
  if self.Level >= self:GetCurrentMaxLevel() then
    self.Exp = 0
    return
  end
  local OldLevel = self.Level
  local _level = self.Level
  local _exp = self.Exp
  _exp = _exp + Count
  local info = self:LevelUpData(_level)
  local current_max_level = self:GetCurrentMaxLevel()
  while info and _level + 1 <= #DataMgr.LevelUp and _exp >= info.CharLevelMaxExp and _level < current_max_level do
    _exp = _exp - info.CharLevelMaxExp
    _level = _level + 1
    info = self:LevelUpData(_level)
  end
  if _level >= self:GetCurrentMaxLevel() then
    _exp = 0
  end
  self.Exp = _exp
  self:SetLevel(_level)
  local Result = {}
  Result.LevelUp = {
    OldLevel,
    self.Level
  }
  return Result
end

function Char:SetLevel(Level)
  if Level <= self.Level then
    return false
  end
  local LevelUpInfo = self:LevelUpData(Level)
  if not LevelUpInfo then
    return false
  end
  self.Level = Level
  return true
end

function Char:UnlockModSlotAfterCharBreakUp()
  local CharInfo = DataMgr.Char[self.CharId]
  if CharInfo and CharInfo.ModSlotUnlock then
    for i = 1, #CharInfo.ModSlotUnlock do
      if CharInfo.ModSlotUnlock[i] <= self.EnhanceLevel then
        AvatarUtils:UnLockModSlot(self, i)
      end
    end
  end
end

function Char:HandleSetLevel(Level, NeedEnhance)
  if nil == NeedEnhance or 1 == NeedEnhance then
    NeedEnhance = true
  else
    NeedEnhance = false
  end
  local LevelUpInfo = DataMgr.LevelUp[Level]
  if LevelUpInfo then
    self.Level = Level
    local BreakInfo = DataMgr.CharBreak[self.CharId]
    local NewEnhanceLevel = 0
    if BreakInfo then
      for key, value in pairs(BreakInfo) do
        if NeedEnhance then
          if Level >= value.CharBreakLevel then
            NewEnhanceLevel = math.max(NewEnhanceLevel, key)
          end
        elseif Level > value.CharBreakLevel then
          NewEnhanceLevel = math.max(NewEnhanceLevel, key)
        end
      end
      return self:SetEnhanceLevel(NewEnhanceLevel)
    end
    return true
  end
  return false
end

function Char:GMSetLevel(Level, NeedEnhance)
  return self:HandleSetLevel(Level, NeedEnhance)
end

function Char:SetEnhanceLevel(EnhanceLevel)
  local BreakInfo = DataMgr.CharBreak[self.CharId][EnhanceLevel]
  if BreakInfo or 0 == EnhanceLevel then
    self.EnhanceLevel = EnhanceLevel
    local CharInfo = DataMgr.Char[self.CharId]
    if CharInfo and CharInfo.ModSlotUnlock then
      for i = 1, #CharInfo.ModSlotUnlock do
        if CharInfo.ModSlotUnlock[i] <= self.EnhanceLevel then
          AvatarUtils:UnLockModSlot(self, i)
        end
      end
    end
    self:UpdateSkill()
    return true
  end
  return false
end

function Char:GMSetSkillLevel(level)
  for _, skill in ipairs(self.Skills) do
    skill:GMSetLevel(level)
  end
end

function Char:GetSkin(SkinId, Avatar)
  local CommonChar = Avatar and Avatar.CommonChars[self.CharId] or {
    OwnedSkins = {}
  }
  return CommonChar.OwnedSkins[SkinId]
end

Char.CommunityAttrs = {
  "MaxHp",
  "MaxES",
  "DEF",
  "MaxSp",
  "SkillRange",
  "SkillSustain",
  "SkillEfficiency",
  "SkillIntensity",
  "StrongValue",
  "EnmityValue"
}

function Char:GetCommunityData(Avatar)
  local ExtraInfo = {}
  ExtraInfo.ModSuit = self.ModSuitIndex
  AvatarUtils:InitModInfo(Avatar, ExtraInfo, self)
  local ReplaceAttrs = self:DumpBattleAttr(Avatar)
  local TotalValues = ReplaceAttrs.TotalValues
  local BattleInfo = self:BattleData()
  local ATK_AttrName = "ATK_" .. BattleInfo.Attribute
  local CommunityData = {
    ATK = TotalValues[ATK_AttrName],
    ExcelWeaponTags = BattleInfo.ExcelWeaponTags
  }
  for _, AttrName in pairs(Char.CommunityAttrs) do
    CommunityData[AttrName] = TotalValues[AttrName]
  end
  return CommunityData
end

function Char:BattleDump(Avatar, ExtraInfo)
  local ExtraInfo = ExtraInfo or {}
  AvatarUtils:InitModInfo(Avatar, ExtraInfo, self)
  local Result = {
    RoleId = self.RoleId,
    Level = self.Level,
    Exp = self.Exp,
    GradeLevel = self.GradeLevel,
    EnhanceLevel = self.EnhanceLevel,
    SkillInfos = self:DumpSkillInfos(Avatar, ExtraInfo),
    SkillTreeInfos = self:DumpSkillTreeInfos(Avatar, ExtraInfo),
    ModPassives = self:DumpPassiveEffects(Avatar, ExtraInfo),
    ReplaceAttrs = self:DumpBattleAttr(Avatar, ExtraInfo),
    AppearanceSuit = self:DumpAppearanceSuit(Avatar),
    ModData = AvatarUtils:DumpModData(ExtraInfo),
    SlotData = ExtraInfo.SlotData,
    ModSuitIndex = ExtraInfo.ModSuit
  }
  return Result
end

function Char:DumpSkillInfos(Avatar, ExtraInfo)
  local ModData = ExtraInfo.ModData
  local IsPhantom = ExtraInfo.IsPhantom
  local Skills = {}
  for _, Skill in ipairs(self.Skills) do
    if self:CheckSkillIsLocked(Skill.SkillId) then
    else
      local bOnlyPhantom = false
      local SkillData = DataMgr.Skill[Skill.SkillId][Skill.Level][self.GradeLevel]
      if SkillData then
        bOnlyPhantom = SkillData.OnlyPhantom
      end
      if not IsPhantom and bOnlyPhantom then
      else
        local SkillInfo = {}
        local Level, ExtraLevel = Skill:GetRealSkill()
        if 1 ~= Level then
          SkillInfo.Level = Level
        end
        if ExtraLevel and 0 ~= ExtraLevel then
          SkillInfo.ExtraLevel = ExtraLevel
        end
        if 0 ~= self.GradeLevel then
          SkillInfo.Grade = self.GradeLevel
        end
        table.insert(Skills, {
          SkillId = Skill.SkillId,
          SkillInfo = SkillInfo
        })
      end
    end
  end
  if ModData then
    for _, Mod in pairs(ModData) do
      local ModData = Mod:Data()
      if ModData.ModActivateSkills then
        for SkillId1, SkillId2 in pairs(ModData.ModActivateSkills) do
          for _, Data in ipairs(Skills) do
            if Data.SkillId == SkillId1 then
              Data.SkillId = SkillId2
              break
            end
          end
        end
      end
    end
  end
  return Skills
end

function Char:DumpSkillTreeInfos(Avatar, ExtraInfo)
  local SkillTreeInfos = {}
  for BranchIdx, SkillTreeNodes in ipairs(self.SkillTree) do
    SkillTreeInfos[BranchIdx] = {}
    for NodeIdx, SkillNode in ipairs(SkillTreeNodes) do
      if 1 ~= NodeIdx then
        SkillTreeInfos[BranchIdx][NodeIdx] = {
          TargetId = SkillNode.TargetId,
          LockState = SkillNode.LockState
        }
      end
    end
  end
  return SkillTreeInfos
end

function Char:DumpPassiveEffects(Avatar, ExtraInfo)
  local ModData = ExtraInfo.ModData
  if not ModData then
    return {}
  end
  local PassiveEffects = {}
  local ModPolarityMap = {}
  for _, Mod in pairs(ModData) do
    Mod:CountModPolarity(ModPolarityMap)
  end
  for _, Mod in pairs(ModData) do
    local ModData = Mod:Data()
    if ModData.PassiveEffects then
      local ShouldAddPassiveEffects = true
      if ModData.PolarityNeedNum then
        for Polarity, NeedNum in pairs(ModData.PolarityNeedNum) do
          if not ModPolarityMap[Polarity] or NeedNum > ModPolarityMap[Polarity] then
            ShouldAddPassiveEffects = false
            break
          end
        end
      end
      if ShouldAddPassiveEffects then
        for i = 1, #ModData.PassiveEffects do
          table.insert(PassiveEffects, {
            ModData.PassiveEffects[i],
            Mod.Level,
            ModData.SummonInherit
          })
        end
      end
    end
  end
  return PassiveEffects
end

function Char:DumpAccessorySuit(AppearanceSuit)
  local Accessories = AppearanceSuit and AppearanceSuit.Accessory
  if not Accessories then
    return
  end
  local AccessorySuit = {}
  local EquipAccessoryId
  for _, AccessoryTypeIndex in pairs(CommonConst.NewCharAccessoryTypes) do
    EquipAccessoryId = Accessories[AccessoryTypeIndex]
    if EquipAccessoryId and EquipAccessoryId > 0 then
      AccessorySuit[AccessoryTypeIndex] = EquipAccessoryId
    end
  end
  return AccessorySuit
end

function Char:DumpAppearanceSuit(Avatar, AppearanceIndex)
  local AppearanceSuit = self.AppearanceSuits[AppearanceIndex or self.CurrentAppearanceIndex]
  local SkinId = AppearanceSuit and AppearanceSuit.SkinId
  return {
    AccessorySuit = self:DumpAccessorySuit(AppearanceSuit),
    IsShowPartMesh = self:DumpIsShowPartMesh(Avatar, SkinId),
    IsCornerVisible = self:DumpIsCornerVisible(AppearanceSuit),
    SkinId = SkinId,
    Colors = self:DumpColors(Avatar, SkinId),
    CharId = self.CharId
  }
end

function Char:DumpColors(Avatar, SkinId)
  if not Avatar or not Avatar.CommonChars then
    return
  end
  local CommonChar = Avatar.CommonChars[self.CharId]
  local Skin = CommonChar and CommonChar.OwnedSkins[SkinId]
  if not Skin then
    return
  end
  local Colors = {}
  local CurrentColors = Skin:GetColors()
  for i, value in pairs(CurrentColors) do
    Colors[i] = value
  end
  return Colors
end

function Char:DumpIsShowPartMesh(Avatar, SkinId)
  if not Avatar or not Avatar.CommonChars then
    return
  end
  local CommonChar = Avatar.CommonChars[self.CharId]
  local Skin = CommonChar and CommonChar.OwnedSkins[SkinId]
  return Skin and Skin.IsShowPartMesh
end

function Char:DumpIsCornerVisible(AppearanceSuit)
  if not AppearanceSuit or AppearanceSuit.IsCornerVisible == nil then
    return true
  else
    return AppearanceSuit.IsCornerVisible
  end
end

function Char:SaLogDump(Avatar)
  local Mods = {}
  for ModSlotId, ModSlotEid in pairs(self:GetModSuit()) do
    local Mod = Avatar.Mods[ModSlotEid]
    if Mod then
      table.insert(Mods, {
        Mod.ModId,
        Mod.Level
      })
    end
  end
  local Skills = {}
  for _, Skill in ipairs(self.Skills) do
    table.insert(Skills, {
      Skill.SkillId,
      Skill.Level
    })
  end
  return Mods, Skills
end

Char.Attrs = {
  "MaxHp",
  "DEF",
  "MaxES",
  "MaxSp",
  "SkillRange",
  "SkillSustain",
  "SkillEfficiency",
  "SkillIntensity",
  "SPD"
}

function Char:GetDefaultAttrValue(AttrName)
  local BattleInfo = self:BattleData()
  if BattleInfo[AttrName] then
    return BattleInfo[AttrName]
  end
  if not self.BattleCharAttr then
    self.BattleCharAttr = DataMgr.BattleCharAttr
  end
  local AttrData = self.BattleCharAttr[AttrName]
  if not AttrData then
    return 0
  end
  return AttrData.DefaultValue or 0
end

function Char:CalcTotalValue(CardValues, BaseValues, ModRateValues, ModAddValues)
  local TotalValues = {}
  for AttrName, Value in pairs(BaseValues) do
    TotalValues[AttrName] = Value
  end
  for AttrName, Rates in pairs(ModRateValues) do
    for _, Rate in pairs(Rates) do
      if not TotalValues[AttrName] then
        local DefaultValue = self:GetDefaultAttrValue(AttrName)
        CardValues[AttrName] = DefaultValue
        TotalValues[AttrName] = DefaultValue
      end
      TotalValues[AttrName] = TotalValues[AttrName] * (Rate + 1)
    end
  end
  for AttrName, AddValue in pairs(ModAddValues) do
    if not TotalValues[AttrName] then
      local DefaultValue = self:GetDefaultAttrValue(AttrName)
      CardValues[AttrName] = DefaultValue
      TotalValues[AttrName] = DefaultValue
    end
    TotalValues[AttrName] = TotalValues[AttrName] + AddValue
  end
  for AttrName, _ in pairs(TotalValues) do
    if CommonUtils.AttrConvert[AttrName] then
      TotalValues[AttrName] = CommonUtils.AttrConvert[AttrName](TotalValues[AttrName])
    end
  end
  for _, Data in pairs(DataMgr.AttrLimit) do
    local AttachAttrName = Data.AttachAttrName
    if TotalValues[AttachAttrName] then
      TotalValues[AttachAttrName] = math.min(TotalValues[AttachAttrName], Data.LimitValue)
    end
  end
  return TotalValues
end

function Char:CalcBaseValue(CardValues, CardLevelValues)
  local BaseValues = {}
  for AttrName, Value in pairs(CardValues) do
    BaseValues[AttrName] = Value * (CardLevelValues[AttrName] or 1)
  end
  return BaseValues
end

function Char:DumpDefaultBattleAttr(Avatar, ExtraInfo)
  ExtraInfo = ExtraInfo or {}
  ExtraInfo.ModSuit = self.ModSuitIndex
  AvatarUtils:InitModInfo(Avatar, ExtraInfo, self)
  local BattleAttrs = self:DumpBattleAttr(Avatar, ExtraInfo)
  return BattleAttrs
end

function Char:DumpBattleAttr(Avatar, ExtraInfo)
  local CardValues, CardLevelValues = self:DumpCardValues()
  local BaseValues = self:CalcBaseValue(CardValues, CardLevelValues)
  local ModRateValues = {}
  local ModAddValues = {}
  local ModPolarityMap = {}
  local ModMultiplier = {}
  ExtraInfo = ExtraInfo or {}
  local Mods = ExtraInfo.ModData or {}
  local ModUniteTypes = {}
  for _, Mod in pairs(Mods) do
    if Mod then
      local ModUniteType = Mod.ModUniteType
      if ModUniteType then
        ModUniteTypes[ModUniteType] = (ModUniteTypes[ModUniteType] or 0) + 1
      end
    end
  end
  self:CalcAddonAttr(BaseValues, ModRateValues, ModAddValues)
  local Pet = ExtraInfo.Pet
  if Pet then
    Pet:CalcMultiplier(ModMultiplier)
  end
  for _, Mod in pairs(Mods) do
    Mod:CalcMultiplier(ModMultiplier)
  end
  for _, Mod in pairs(Mods) do
    Mod:CountModPolarity(ModPolarityMap)
  end
  if Pet then
    Pet:CalcAttrs(BaseValues, ModRateValues, ModAddValues, ModMultiplier)
  end
  for _, Mod in pairs(Mods) do
    Mod:CalcAttrs(BaseValues, ModRateValues, ModAddValues, ModUniteTypes, ModMultiplier, ModPolarityMap)
  end
  local MeleeWeapon = ExtraInfo.MeleeWeapon
  if MeleeWeapon then
    MeleeWeapon:CalcCharAddAttrs(BaseValues, ModRateValues, ModAddValues)
  end
  local RangedWeapon = ExtraInfo.RangedWeapon
  if RangedWeapon then
    RangedWeapon:CalcCharAddAttrs(BaseValues, ModRateValues, ModAddValues)
  end
  local TotalValues = self:CalcTotalValue(CardValues, BaseValues, ModRateValues, ModAddValues)
  local BattleAttrs = {
    CardValues = CardValues,
    CardLevelValues = CardLevelValues,
    ModRateValues = ModRateValues,
    ModAddValues = ModAddValues,
    TotalValues = TotalValues
  }
  return BattleAttrs
end

function Char:FillCardValues(CardValues, CardLevelValues, AttrName, CardValue, LevelGrowAttrName)
  CardValue = CardValue or self:GetDefaultAttrValue(AttrName)
  if not CardValue then
    return
  end
  CardValues[AttrName] = CardValue
  CardLevelValues[AttrName] = self:GetAttrLevelGrow(LevelGrowAttrName)
end

function Char:DumpCardValues()
  local CardValues = {}
  local CardLevelValues = {}
  local BattleInfo = self:BattleData()
  local DefaultInfo = self:BattleDefaultData()
  for AttrName, AttrData in pairs(DefaultInfo) do
    if (AttrData.RoleAttrDisplay == "AlwaysTrue" or AttrData.RoleAttrDisplay == "OnlyModified") and DefaultInfo[AttrName].DefaultValue then
      self:FillCardValues(CardValues, CardLevelValues, AttrName, BattleInfo[AttrName], AttrName)
    end
  end
  for _, AttrName in pairs(self.Attrs) do
    self:FillCardValues(CardValues, CardLevelValues, AttrName, BattleInfo[AttrName], AttrName)
  end
  for _AttrName, _ in pairs(DataMgr.Attribute) do
    local AttrName = "ATK_" .. _AttrName
    self:FillCardValues(CardValues, CardLevelValues, AttrName, BattleInfo[AttrName], "ATK")
  end
  self:FillCardValues(CardValues, CardLevelValues, "ATK_" .. BattleInfo.Attribute, BattleInfo.ATK, "ATK")
  return CardValues, CardLevelValues
end

function Char:CalcAddonAttr(BaseValues, ModRateValues, ModAddValues)
  local BattleInfo = self:BattleData()
  local AddonAttrData = self:CharAddonAttrData()
  for _, NodeList in ipairs(self.SkillTree) do
    for _, Node in ipairs(NodeList) do
      if not Node:IsSkill() and not Node:IsLocked() then
        local AddonAttrId = Node.TargetId
        local OneAddonNode = AddonAttrData[AddonAttrId]
        if OneAddonNode and OneAddonNode.AddAttrs then
          local AttrData = OneAddonNode.AddAttrs
          local AttrName = AttrData.AttrName
          AttrName = AvatarUtils:GetAttrNameFromAttrData(AttrData)
          if "ATK" == AttrName then
            for _AttrName, _ in pairs(DataMgr.Attribute) do
              if AttrData.Value then
                assert(nil, AddonData.AttrId .. "\229\143\183\233\162\157\229\164\150\229\177\158\230\128\167\228\184\141\229\133\129\232\174\184\228\189\191\231\148\168Value\229\162\158\229\138\160ATK")
              end
              self:CalcOneAttrs("ATK_" .. _AttrName, BaseValues, ModRateValues, CommonConst.RateIndex.GlobalATK, ModAddValues, AttrData)
            end
          else
            self:CalcOneAttrs(AttrName, BaseValues, ModRateValues, CommonConst.RateIndex.Default, ModAddValues, AttrData)
          end
        end
      end
    end
  end
end

function Char:CalcOneAttrs(AttrName, BaseValues, ModRateValues, RateIndex, ModAddValues, AttrData)
  if AttrData.Rate then
    if not ModRateValues[AttrName] then
      ModRateValues[AttrName] = {}
    end
    ModRateValues = ModRateValues[AttrName]
    local IncreaseRateValue
    if type(AttrData.Rate) == "number" then
      IncreaseRateValue = AttrData.Rate
    else
      assert(nil, "\233\162\157\229\164\150\229\177\158\230\128\167\228\184\141\229\133\129\232\174\184\229\161\171\229\134\153string")
    end
    ModRateValues[RateIndex] = (ModRateValues[RateIndex] or 0) + IncreaseRateValue
  end
  if AttrData.Value then
    local IncreaseValue
    if "number" == type(AttrData.Value) then
      IncreaseValue = AttrData.Value
    else
      assert(nil, "\233\162\157\229\164\150\229\177\158\230\128\167\228\184\141\229\133\129\232\174\184\229\161\171\229\134\153string")
    end
    ModAddValues[AttrName] = (ModAddValues[AttrName] or 0) + IncreaseValue
  end
end

function Char:GetAttrLevelGrow(AttrName)
  local BattleInfo = self:BattleData()
  local LevelGrow = BattleInfo[AttrName .. "LevelGrow"]
  if not LevelGrow then
    return
  end
  local LevelUpInfo = self:LevelUpData()
  local GrowFactor = LevelUpInfo[LevelGrow]
  return GrowFactor
end

function Char:HasApplicationType(ApplicationType)
  for _, value in ipairs(self.ModApplicationType) do
    if ApplicationType == value then
      return true
    end
  end
  return false
end

function Char:UpdateSkill()
  for index, skill in ipairs(self.Skills) do
    skill:Update(self.GradeLevel, self.EnhanceLevel)
  end
end

function Char:GetSkill(SkillId)
  for index, skill in ipairs(self.Skills) do
    if skill.SkillId == SkillId then
      return skill
    end
  end
end

function Char:UpGradeLevel(TargetLevel)
  local MaxGradeLevel = DataMgr.GlobalConstant.CharCardLevelMax.ConstantValue
  TargetLevel = TargetLevel or 1
  if self.GradeLevel == MaxGradeLevel or MaxGradeLevel < TargetLevel then
    return
  end
  self.GradeLevel = self.GradeLevel + TargetLevel
  self:UpdateSkill()
end

function Char:SetGradeLevel(TargetLevel)
  local MaxGradeLevel = DataMgr.GlobalConstant.CharCardLevelMax.ConstantValue
  TargetLevel = TargetLevel or 1
  if MaxGradeLevel < TargetLevel or TargetLevel < 1 then
    return
  end
  self.GradeLevel = TargetLevel
  self:UpdateSkill()
end

function Char:CheckCurrentLevelOfBreakUpLevel()
  if self.Level == self:GetCurrentMaxLevel() then
    return true
  end
  return false
end

function Char:GetCurrentMaxLevel()
  local CharBreakInfo = DataMgr.CharBreak[self.CharId]
  if not CharBreakInfo then
    return self.MaxLevel
  end
  local CharBreakLevelUpInfo = CharBreakInfo[self.EnhanceLevel + 1]
  if not CharBreakLevelUpInfo then
    return self.MaxLevel
  end
  return CharBreakLevelUpInfo.CharBreakLevel
end

function Char:CalculateCharLevelUpResources(ExpNeed, ExpResources)
  table.sort(ExpResources, function(a, b)
    return a.UseParam > b.UseParam
  end)
  local Length = #ExpResources
  local ExpSum = 0
  local Counts = {}
  local Res = {
    ResourceUse = {},
    ExpConsume = 0
  }
  for i = 1, Length do
    Res.ResourceUse[i] = {}
    Res.ResourceUse[i].ResourceId = ExpResources[i].ResourceId
    Res.ResourceUse[i].Count = 0
    Counts[i] = 0
  end
  local MinOverflow = ExpResources[1].UseParam
  for i = 1, Length do
    local num = ExpNeed // ExpResources[i].UseParam
    if num >= ExpResources[i].Count then
      ExpSum = ExpSum + ExpResources[i].Count * ExpResources[i].UseParam
      Counts[i] = ExpResources[i].Count
      ExpNeed = ExpNeed - ExpResources[i].Count * ExpResources[i].UseParam
    else
      ExpSum = ExpSum + (num + 1) * ExpResources[i].UseParam
      Counts[i] = num + 1
      ExpNeed = ExpNeed - (num + 1) * ExpResources[i].UseParam
    end
    if ExpNeed < 0 then
      if MinOverflow > -ExpNeed then
        for i = 1, Length do
          Res.ResourceUse[i].Count = Counts[i]
        end
        Res.ExpConsume = ExpSum
        MinOverflow = -ExpNeed
      end
      ExpNeed = ExpNeed + ExpResources[i].UseParam
      Counts[i] = Counts[i] - 1
      ExpSum = ExpSum - ExpResources[i].UseParam
    end
    if 0 == ExpNeed then
      for j = 1, Length do
        Res.ResourceUse[j].Count = Counts[j]
      end
      Res.ExpConsume = ExpSum
      return Res
    end
  end
  return Res
end

function Char:GetSimpleInfo(Avatar)
  local ModSlots = {}
  for ModSlotId, ModSlotEid in pairs(AvatarUtils:GetTargetModSuit(self, self.ModSuitIndex)) do
    local ModSlotInfo = {
      SlotId = ModSlotId,
      Status = self.ModSlotStatus[ModSlotId],
      Polarity = self.ModSlotPolarity[ModSlotId]
    }
    local mod = Avatar.Mods[ModSlotEid]
    if mod then
      ModSlotInfo.ModId = mod.ModId
      ModSlotInfo.Level = mod.Level
    end
    ModSlots[ModSlotId] = ModSlotInfo
  end
  return {
    CharId = self.CharId,
    Level = self.Level,
    EnhanceLevel = self.EnhanceLevel,
    GradeLevel = self.GradeLevel,
    Skills = self.Skills:all_dump(self.Skills),
    ModSlots = ModSlots
  }
end

function Char:CalculateCharGradeLevelUpResources(Data)
  local ResourceId = "ResourceId"
  local ResourceNum = "ResourceNum"
  local Idx = 1
  local Res = {}
  local Key = ResourceId .. tostring(Idx)
  local Value = ResourceNum .. tostring(Idx)
  while Data[Key] and Data[Value] do
    if nil == Res[Key] then
      Res[Data[Key]] = Data[Value]
    end
    Idx = Idx + 1
    Key = ResourceId .. tostring(Idx)
    Value = ResourceNum .. tostring(Idx)
  end
  return Res
end

function Char:GetAppearance(AppearanceIndex)
  return self.AppearanceSuits[AppearanceIndex or self.CurrentAppearanceIndex]
end

function Char:GetDefaultSkinId()
  return self:Data().DefaultSkinId
end

function Char:GetPartMeshAccessoryInfo(SkinId)
  local _SkinId = SkinId or self.CharId
  for AccessoryId, value in pairs(DataMgr.CharPartMesh) do
    if value.PartName == "PartMesh" then
      local SkinIds = value.Skin or {}
      for _, Id in pairs(SkinIds) do
        if Id == _SkinId then
          return AccessoryId, value.AccessoryType
        end
      end
    end
  end
  return -1
end

FormatProperties(Char)
local CharDict = Class("CharDict", CustomTypes.CustomDict)
CharDict.KeyType = BaseTypes.ObjId
CharDict.ValueType = Char

function CharDict:NewChar(Uuid, CharId, Level)
  local char = Char(Uuid, CharId, Level)
  return char
end

return {Char = Char, CharDict = CharDict}
