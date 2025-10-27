require("UnLua")
local SkillUtils = require("Utils.SkillUtils")
local UpgradeUtils = require("Utils.UpgradeUtils")
local Utils = require("Utils")
local CharCom = require("BluePrints.Client.CustomTypes.Character")
local CharacterCommon = require("BluePrints.Client.CustomTypes.CharacterCommon")
local WeaponCom = require("BluePrints.Client.CustomTypes.Weapon")
local ModCom = require("BluePrints.Client.CustomTypes.Mod")
local PetCom = require("BluePrints.Client.CustomTypes.Pet")
local M = {}
M.ArmoryMainTabNames = {
  Char = CommonConst.ArmoryTag.Char,
  Melee = CommonConst.ArmoryTag.Melee,
  Ranged = CommonConst.ArmoryTag.Ranged,
  UWeapon = CommonConst.ArmoryTag.UWeapon,
  Pet = CommonConst.ArmoryType.Pet,
  BattleWheel = "BattleWheel",
  Weapon = "Weapon"
}
M.ArmorySubTabNames = {
  Attribute = "Attribute",
  Skill = CommonConst.ArmoryTag.Skill,
  Grade = CommonConst.ArmoryTag.Grade,
  Appearance = "Appearance",
  Files = "Files",
  Entry = "Entry"
}
M.ArmorySubPageName = {
  Mod = "Mod",
  LevelUp = "LevelUp",
  SkillDetail = "SkillDetail",
  Skin = "Skin",
  Files = "Files",
  Grade = "Grade",
  PetMix = "PetMix",
  PetEnhance = "PetEnhance"
}
M.FilesTabType = {"CharVoice", "Record"}
M.ModSuitName = {
  "UI_MOD_PLAN1",
  "UI_MOD_PLAN2",
  "UI_MOD_PLAN3"
}
M.PreviewTargetStates = {
  Prime = 0,
  Max = 1,
  Custom = 2
}

function M:NewCharOrWeaponItemContent(Target, Type, Tag, bNotReddot, ReddotFrom)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.Uuid = Target.Uuid
  Obj.Type = Type
  Obj.ItemType = Type
  Obj.Tag = Tag
  Obj.UnitId = Target[Type .. "Id"]
  Obj.UnitName = GText(Target[Type .. "Name"])
  Obj.Rarity = Target[Type .. "Rarity"]
  Obj.Icon = Target:Data().Icon
  Obj.Level = Target.Level
  Obj.GradeLevel = Target.GradeLevel
  local Element = DataMgr["Battle" .. Type][Obj.UnitId].Attribute
  if Element then
    local IconName = "Armory_" .. Element
    Obj.AttrIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName
  end
  if not bNotReddot then
    local IsNew, Upgradeable, HasReward = M["TryAddNew" .. Type .. "Reddot"](M, Target)
    Obj.IsNew = IsNew
    Obj.Upgradeable = Upgradeable
    Obj.HasReward = HasReward
  end
  if "Archive" == ReddotFrom then
    Obj.IsNew = M.TryAddArchiveNewReddot(M, Obj, Tag)
  end
  if Obj.IsNew then
    Obj.RedDotType = UIConst.RedDotType.NewRedDot
  elseif Obj.Upgradeable or Obj.HasReward then
    Obj.RedDotType = UIConst.RedDotType.CommonRedDot
  end
  Obj.IsLocked = Target.IsLock and Target:IsLock()
  Obj.LockType = Obj.IsLocked and 1 or 0
  Obj.SortPriority = Target:Data().SortPriority or 0
  return Obj
end

function M:TryAddArchiveNewReddot(Content, Tag)
  if not ReddotManager.GetTreeNode("ArchiveNew" .. Tag) then
    return
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("ArchiveNew" .. Tag)
  return 1 == CacheDetail[Content.UnitId]
end

function M:NewCommonItemContent(Target, Type)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.Uuid = Target.Uuid
  Obj.Id = Target[Type .. "Id"]
  Obj.ItemType = Type
  Obj.Rarity = Target[Type .. "Rarity"]
  Obj.Icon = Target:Data().Icon
  Obj.SortPriority = Target:Data().SortPriority or 0
  return Obj
end

function M:CopyCharOrWeaponItemContent(Content)
  local Obj = {}
  Obj.Uuid = Content.Uuid
  Obj.Type = Content.Type
  Obj.ItemType = Content.ItemType
  Obj.Tag = Content.Tag
  Obj.UnitId = Content.UnitId
  Obj.Rarity = Content.Rarity
  Obj.Icon = Content.Icon
  Obj.Level = Content.Level
  Obj.AttrIcon = Content.AttrIcon
  Obj.IsNew = Content.IsNew
  Obj.GradeLevel = Content.GradeLevel
  Obj.SortPriority = Content.SortPriority
  return Obj
end

function M:NewPetItemContent(Target)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.UniqueId = Target.UniqueId
  Obj.Uuid = Target.UniqueId
  Obj.BreakNum = Target.BreakNum
  Obj.Type = CommonConst.ArmoryType.Pet
  Obj.ItemType = CommonConst.ArmoryType.Pet
  Obj.Tag = CommonConst.ArmoryType.Pet
  Obj.UnitId = Target.PetId
  local Data = DataMgr.Pet[Obj.UnitId]
  if Target.Name and Target.Name ~= "" then
    Obj.UnitName = Target.Name
  else
    Obj.UnitName = GText(Data.Name)
  end
  Obj.Rarity = Data.Rarity
  Obj.Icon = Data.Icon
  Obj.LockType = Target.IsLock and 1 or 0
  Obj.SortPriority = Data.SortPriority or 0
  Obj.IsResourcePet = Target:IsResourcePet()
  if Obj.IsResourcePet then
    Obj.PetEntry = {
      Target.Entry and Target.Entry[1]
    }
  else
    Obj.Level = Target.Level
  end
  Obj.IsPremium = Target:IsPremium()
  local IsNew, _ = M.TryAddNewPetReddot(M, Target)
  Obj.IsNew = IsNew
  if Obj.IsNew then
    Obj.RedDotType = UIConst.RedDotType.NewRedDot
  end
  return Obj
end

function M:NewPetItemContentWithEntry(Target)
  local Obj = self:NewPetItemContent(Target)
  Obj.PetEntry = {}
  for i, v in pairs(Target.Entry) do
    if 0 ~= v then
      table.insert(Obj.PetEntry, v)
    end
  end
  return Obj
end

function M:NewResourceItemContent(Target)
  local Data = Target:Data()
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.Count = GText("INFINITY_SYMBOL")
  Obj.Type = CommonConst.DataType.Resource
  Obj.ItemType = CommonConst.DataType.Resource
  Obj.UnitId = Target.ResourceId
  Obj.ResourceSType = Target.ResourceSType
  Obj.IsEquiped = false
  Obj.Rarity = Data.Rarity or 0
  Obj.Icon = Data.Icon
  Obj.CharId = Data.UseParam
  return Obj
end

function M:NewModItemContent(Target, Type)
  Type = Type or CommonConst.ArmoryType.Mod
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.Uuid = Target.Uuid
  Obj.Type = Type
  Obj.UnitId = Target[Type .. "Id"]
  Obj.UnitName = DataMgr[Obj.Type][Obj.UnitId].Name
  Obj.Rarity = Target.Rarity
  Obj.Polarity = Target.Polarity
  Obj.Icon = Target.Icon
  Obj.AddAttrs = Target.AddAttrs
  Obj.Level = Target.Level
  Obj.CardLevel = Target.CurrentModCardLevel or 0
  Obj.Cost = Target.Cost
  return Obj
end

function M:SortItemContents(InOutArr, OrderByAttrNames, SortType, CurrentContent, ExCmpFunc)
  local OrderBy = OrderByAttrNames
  ExCmpFunc = ExCmpFunc or function(a, b)
  end
  local CmpCopy, ExCmpRes
  
  local function Cmp(a, b, Idx)
    if CurrentContent then
      if a == CurrentContent then
        return true
      end
      if b == CurrentContent then
        return false
      end
    end
    ExCmpRes = ExCmpFunc(a, b)
    if nil ~= ExCmpRes then
      return ExCmpRes
    elseif a[OrderBy[Idx]] == b[OrderBy[Idx]] then
      if OrderBy[Idx + 1] then
        return CmpCopy(a, b, Idx + 1)
      end
    elseif SortType == CommonConst.ASC then
      return (a[OrderBy[Idx]] or 1) < (b[OrderBy[Idx]] or 1)
    else
      return (a[OrderBy[Idx]] or 1) > (b[OrderBy[Idx]] or 1)
    end
  end
  
  CmpCopy = Cmp
  
  local function SortFunc(a, b)
    return Cmp(a, b, 1)
  end
  
  table.sort(InOutArr, SortFunc)
end

function M.IsOwnedCmpFunc(a, b)
  if a.IsOwned ~= b.IsOwned then
    if a.IsOwned then
      return true
    else
      return false
    end
  end
end

function M:SortEntryPets(Pets, SortKind, IsASC)
  SortKind = 2 == SortKind and 2 or 1
  IsASC = nil == IsASC and true or IsASC
  
  local function getEntryId(pet)
    return pet.PetEntry and pet.PetEntry[1] or 0
  end
  
  local function getEntryRarity(pet)
    local entryId = getEntryId(pet)
    local entryData = entryId > 0 and DataMgr.PetEntry[entryId]
    return entryData and entryData.Rarity or 0
  end
  
  local function getEntryCount(pet)
    return pet.PetEntry and #pet.PetEntry or 0
  end
  
  local function compare(a, b)
    local aIsResource = not not a.IsResourcePet
    local bIsResource = not not b.IsResourcePet
    if aIsResource ~= bIsResource then
      if IsASC then
        return aIsResource
      else
        return bIsResource
      end
    end
    if aIsResource then
      if 1 == SortKind then
        local aEntryId, bEntryId = getEntryId(a), getEntryId(b)
        if aEntryId ~= bEntryId then
          if IsASC then
            return aEntryId < bEntryId
          else
            return aEntryId > bEntryId
          end
        end
        if a.UnitId ~= b.UnitId then
          if IsASC then
            return a.UnitId > b.UnitId
          else
            return a.UnitId < b.UnitId
          end
          return a.UnitId > b.UnitId
        end
        return false
      else
        local aRarity, bRarity = getEntryRarity(a), getEntryRarity(b)
        if aRarity ~= bRarity then
          if IsASC then
            return aRarity > bRarity
          else
            return aRarity < bRarity
          end
        end
        local aEntryId, bEntryId = getEntryId(a), getEntryId(b)
        if aEntryId ~= bEntryId then
          if IsASC then
            return aEntryId < bEntryId
          else
            return aEntryId > bEntryId
          end
        end
        if a.UnitId ~= b.UnitId then
          return a.UnitId > b.UnitId
        end
        return false
      end
    else
      local aCount, bCount = getEntryCount(a), getEntryCount(b)
      if aCount ~= bCount then
        if IsASC then
          return aCount < bCount
        else
          return aCount > bCount
        end
      end
      if a.UnitId ~= b.UnitId then
        if IsASC then
          return a.UnitId > b.UnitId
        else
          return a.UnitId < b.UnitId
        end
      end
      return false
    end
  end
  
  table.sort(Pets, compare)
  return Pets
end

function M:CustomDebugSort(arr, cmp)
  if type(arr) ~= "table" then
    error("Invalid array")
  end
  if type(cmp) ~= "function" then
    error("Invalid compare function")
  end
  for i = 2, #arr do
    local current = arr[i]
    local j = i - 1
    print(string.format("[DebugSort] \231\172\172%d\232\189\174\230\175\148\232\190\131\239\188\154\229\189\147\229\137\141\229\133\131\231\180\160\231\180\162\229\188\149=%d\239\188\140\229\128\188=%s", i, i, tostring(current)))
    while j >= 1 and cmp(current, arr[j]) do
      print(string.format("  \230\175\148\232\190\131 current=%s vs arr[%d]=%s \226\134\146 \231\187\147\230\158\156=%s", tostring(current), j, tostring(arr[j]), tostring(cmp(current, arr[j]))))
      arr[j + 1] = arr[j]
      j = j - 1
    end
    arr[j + 1] = current
    print(string.format("  \230\143\146\229\133\165\229\174\140\230\136\144\239\188\140\230\156\128\231\187\136\228\189\141\231\189\174=%d\n", j + 1))
  end
  return arr
end

function M:SetContentIsSelected(Content, IsSelected)
  if Content then
    Content.IsSelected = IsSelected
    if Content.Widget then
      Content.Widget:SetIsSelected(IsSelected)
    end
    if Content.UI then
      Content.UI:SetIsSelected(IsSelected)
    end
  end
end

function M:SetItemIsSelected(Content, IsSelect)
  if Content then
    Content.IsSelect = IsSelect
    Content.IsSelected = IsSelect
    if Content.Widget then
      Content.Widget:SetSelected(IsSelect)
    end
    if Content.SelfWidget then
      Content.SelfWidget:SetSelected(IsSelect)
    end
  end
end

function M:SetItemInGear(Content, bInGear)
  if Content then
    Content.bInGear = bInGear
    if Content.Widget then
      Content.Widget:SetInGear(bInGear)
    end
    if Content.SelfWidget then
      Content.SelfWidget:SetInGear(bInGear)
    end
  end
end

function M:SetItemSelectTag(Content, bSelectTag)
  if Content then
    Content.bSelectTag = bSelectTag
    if Content.Widget then
      Content.Widget:SetItemSelect(bSelectTag)
    end
    if Content.SelfWidget then
      Content.SelfWidget:SetItemSelect(bSelectTag)
      if bSelectTag then
        Content.SelfWidget:SetWeaponPhantomIcon(nil)
      else
        Content.SelfWidget:SetWeaponPhantomIcon(Content.Uuid)
      end
    end
  end
end

function M:SetItemLevel(Content, Level)
  if Content then
    Content.Level = Level
    if Content.Widget then
      Content.Widget:SetLevel(Level)
    end
    if Content.SelfWidget then
      Content.SelfWidget:SetLevel(Level)
    end
  end
end

function M:ResetResourcePetEntryIcons(Content, EntryId)
  if Content then
    Content.PetEntry = {EntryId}
    if Content.Widget then
      Content.Widget:SetPetEntryId(EntryId)
    end
    if Content.SelfWidget then
      Content.SelfWidget:SetPetEntryId(EntryId)
    end
  end
end

function M:SetContentPhantomIcon(Content)
  if Content then
    if Content.Widget and Content.Widget.SetWeaponPhantomIcon then
      Content.Widget:SetWeaponPhantomIcon(Content.Uuid)
    end
    if Content.SelfWidget and Content.SelfWidget.SetWeaponPhantomIcon then
      Content.SelfWidget:SetWeaponPhantomIcon(Content.Uuid)
    end
  end
end

function M:GenPetPassiveEffectDesc(PetBattleData, BaseLevel, ExpectLevel)
  local Desc = PetBattleData.PassiveEffectDesc and GText(PetBattleData.PassiveEffectDesc) or ""
  if not PetBattleData.PassiveEffectDescParameter then
    return Desc
  end
  ExpectLevel = nil == ExpectLevel and BaseLevel or ExpectLevel
  for i, DescValue in pairs(PetBattleData.PassiveEffectDescParameter) do
    local Percent = string.match(DescValue, "%%") or ""
    local ValStr = ""
    ValStr = "" == ValStr and self:_SkillGrowDesc(DescValue, BaseLevel, ExpectLevel, Percent) or ValStr
    Desc = string.gsub(Desc, "#" .. i, ValStr)
  end
  return Desc
end

function M:GetPetSkillLevel(BreakLevel)
  return BreakLevel + 1
end

function M:GetPet(UniqueId)
  local Avatar = GWorld:GetAvatar()
  return Avatar.Pets[UniqueId]
end

function M:GetMod(ModUuid)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if not ModUuid then
    return
  end
  ModUuid = CommonUtils.Str2ObjId(ModUuid)
  return Avatar.Mods[ModUuid]
end

function M:GetBlackPath(Path)
  local Strs = Split(Path, ".")
  for i, _ in pairs(Strs) do
    Strs[i] = Strs[i] .. "_B"
  end
  return table.concat(Strs, ".")
end

function M:GenModPassiveEffectDesc(ModConf, BaseLevel, ExpectLevel)
  local Desc = ModConf.PassiveEffectsDesc and GText(ModConf.PassiveEffectsDesc) or ""
  if not ModConf.DescValues then
    return Desc
  end
  ExpectLevel = nil == ExpectLevel and BaseLevel or ExpectLevel
  local CastTo
  for i, DescValue in pairs(ModConf.DescValues) do
    Desc, CastTo = SkillUtils.ReplaceDescValueTypeCast(Desc, i)
    CastTo = nil ~= string.find(DescValue, "math.floor")
    local Percent = string.match(DescValue, "%%") or ""
    local ValStr = self:_ModAttrGrowDesc2(DescValue, BaseLevel, ExpectLevel, Percent, CastTo)
    ValStr = "" == ValStr and self:_SkillGrowDesc(DescValue, BaseLevel, ExpectLevel, Percent, CastTo) or ValStr
    Desc = string.gsub(Desc, "#" .. i, ValStr)
  end
  return Desc
end

local function _GetModAttrConf(DescValue, ModId, AttrIdx, ValueType)
  local ModConf = DataMgr.Mod[ModId]
  if not ModConf.AddAttrs then
    error("\232\162\171\229\138\168\230\149\136\230\158\156\230\149\176\229\128\188\231\154\132ModId\229\161\171\233\148\153\228\186\134!!!" .. "\231\173\150\229\136\146\230\163\128\230\159\165\228\184\128\228\184\139" .. DescValue, 0)
    return nil
  end
  local ModAttrConf = ModConf.AddAttrs[AttrIdx]
  if not ModAttrConf then
    error("\232\162\171\229\138\168\230\149\136\230\158\156\230\149\176\229\128\188\231\154\132AddAttrs[\231\180\162\229\188\149]\231\180\162\229\188\149\229\161\171\233\148\153\228\186\134!!!" .. "\231\173\150\229\136\146\230\163\128\230\159\165\228\184\128\228\184\139" .. DescValue, 0)
    return nil
  end
  return ModAttrConf
end

function M:_ModAttrGrowDesc2(DescValue, BaseLevel, ExpectLevel, Percent, CastTo, ForbidFormat)
  if string.match(DescValue, "GetModValue") then
    local function _GetModValue(GetModValue_Level)
      return function(ModId, AttrIdx, ValueType)
        local ModAttrConf = _GetModAttrConf(DescValue, ModId, AttrIdx, ValueType)
        
        if not ModAttrConf then
          return 0
        end
        local Res = M:CalcModAttrByLevel(ModAttrConf, GetModValue_Level or 0, ValueType, ModId)
        return Res
      end
    end
    
    local OldValStr = SkillUtils.SplitEval(DescValue, "$", {
      GetModValue = _GetModValue(BaseLevel)
    }) .. Percent
    local NewValStr = SkillUtils.SplitEval(DescValue, "$", {
      GetModValue = _GetModValue(ExpectLevel)
    }) .. Percent
    if not ForbidFormat then
      OldValStr = SkillUtils.FormatDescValue1(OldValStr, CastTo)
      NewValStr = SkillUtils.FormatDescValue1(NewValStr, CastTo)
    end
    return OldValStr ~= NewValStr and OldValStr .. " -> " .. string.format("<H>%s</>", NewValStr) or NewValStr
  end
  if string.match(DescValue, "GetModPolarity") then
    local function _GetModPolarity()
      return function(ModId, AttrIdx, ValueType)
        if not DataMgr.Mod[ModId] then
          return DataMgr.ModPolarity[CommonConst.NonePolarity].Char
        end
        local Polarity = DataMgr.Mod[ModId].Polarity
        return DataMgr.ModPolarity[Polarity].Char
      end
    end
    
    local ValStr = SkillUtils.SplitEval(DescValue, "$", {
      GetModPolarity = _GetModPolarity()
    })
    return ValStr
  end
  return ""
end

function M:_SkillGrowDesc(DescValue, BaseLevel, ExpectLevel, Percent, CastTo, ForbidFormat)
  local OldValStr = SkillUtils.CalcSkillDesc(DescValue, BaseLevel) .. Percent
  local NewValStr = SkillUtils.CalcSkillDesc(DescValue, ExpectLevel) .. Percent
  local bRepeatModLevel = string.find(DescValue, "RepeatModLevel")
  if not ForbidFormat and not bRepeatModLevel then
    OldValStr = SkillUtils.FormatDescValue1(OldValStr, CastTo)
    NewValStr = SkillUtils.FormatDescValue1(NewValStr, CastTo)
  end
  return OldValStr ~= NewValStr and OldValStr .. " -> " .. string.format("<H>%s</>", NewValStr) or NewValStr
end

function M:GenModAttrData(ModAttrConf, ModLevel, AttrConf, ModId)
  local IsRate = ModAttrConf.Rate ~= nil
  local Value = M:CalcModAttrByLevel(ModAttrConf, ModLevel, nil, ModId)
  local ValueStr = CommonUtils.AttrValueToString(AttrConf, Value, IsRate)
  ValueStr = (Value > 0 and "+" or "") .. ValueStr
  return Value, ValueStr
end

function M:CalcModAttrByLevel(ModAttrConf, ModLevel, ValueType, ModId)
  local IsRate = ModAttrConf.Rate ~= nil
  local Base = IsRate and ModAttrConf.Rate or ModAttrConf.Value
  if ValueType then
    if string.lower(ValueType) == "rate" then
      Base = ModAttrConf.Rate
      IsRate = true
    elseif string.lower(ValueType) == "value" then
      Base = ModAttrConf.Value
      IsRate = false
    end
  end
  if type(Base) ~= "number" then
    local AttrData = SkillUtils.GrowProxy("Mod", ModId, {
      GetSkillLevelInfo = function(self)
        return {SkillLevel = ModLevel}
      end
    }, ModAttrConf)
    local Value = tonumber(IsRate and AttrData.Rate or AttrData.Value)
    if not Value then
      DebugPrint(ErrorTag, string.format("ModId: %s \231\154\132SkillGrow\233\133\141\231\189\174\230\156\137\233\151\174\233\162\152\239\188\140\231\188\186\229\176\145\231\173\137\231\186\167%s\231\154\132\230\136\144\233\149\191\230\149\176\229\128\188\239\188\140\232\175\183\230\163\128\230\159\165SkillGrow\232\161\168", ModId, ModLevel))
      return 0
    end
    return Value
  end
  return Base + (ModAttrConf.LevelGrow or 0) * ModLevel
end

local ReddotCreateFunctions = {}

function ReddotCreateFunctions.CreateCharReddotInfos(M)
  local Avatar = GWorld:GetAvatar()
  local AllChars = Avatar.Chars
  for Uuid, Char in pairs(AllChars) do
    M:TryAddNewCharReddot(Char, CommonUtils.ObjId2Str(Uuid))
  end
  
  local function RemoveUnknownChars(CacheDetail)
    if CacheDetail then
      local Uuid
      for key, _ in pairs(CacheDetail) do
        Uuid = CommonUtils.Str2ObjId(key)
        if nil == AllChars[Uuid] then
          M:SetItemReddotRead({
            ItemType = CommonConst.DataType.Char,
            Uuid = Uuid
          }, true, true, true)
        end
      end
    end
  end
  
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(DataMgr.ReddotNode.NewChar.Name)
  RemoveUnknownChars(CacheDetail)
  for CharId, value in pairs(DataMgr.Char) do
    M:TryAddUnlockableCharReddot(CharId)
  end
end

function ReddotCreateFunctions.CreateCharSkillReddotInfos(M)
  local Avatar = GWorld:GetAvatar()
  for Uuid, Char in pairs(Avatar.Chars) do
    for _, CharSkill in pairs(Char.Skills) do
      local Ret = SkillUtils.CalcSkillCanLvup(CharSkill.SkillId, CharSkill.Level, CharSkill.Level + 1, Uuid)
      M:TryAddNewCharSkillReddot(CharSkill, CharSkill.SkillId, Uuid, Ret.CanLevelUp)
    end
  end
end

function ReddotCreateFunctions.CreateWeaponReddotInfos(M)
  local Avatar = GWorld:GetAvatar()
  local AllWeapons = Avatar.Weapons
  for Uuid, Weapon in pairs(AllWeapons) do
    M:TryAddNewWeaponReddot(Weapon, CommonUtils.ObjId2Str(Uuid))
  end
  
  local function RemoveUnknownWeapons(CacheDetail, WeaponTag)
    if CacheDetail then
      local Uuid
      for key, _ in pairs(CacheDetail) do
        Uuid = CommonUtils.Str2ObjId(key)
        if nil == AllWeapons[Uuid] then
          M:SetItemReddotRead({
            ItemType = CommonConst.DataType.Weapon,
            Tag = WeaponTag,
            Uuid = Uuid
          }, true, true, true)
        end
      end
    end
  end
  
  local MeleeCacheDetail = ReddotManager.GetLeafNodeCacheDetail(CommonConst.WeaponType.MeleeWeapon)
  RemoveUnknownWeapons(MeleeCacheDetail, CommonConst.WeaponType.MeleeWeapon)
  local RangedCacheDetail = ReddotManager.GetLeafNodeCacheDetail(CommonConst.WeaponType.RangedWeapon)
  RemoveUnknownWeapons(RangedCacheDetail, CommonConst.WeaponType.RangedWeapon)
end

function ReddotCreateFunctions.CreateResourceReddotInfos()
  local Avatar = GWorld:GetAvatar()
  local WheelItems = {}
  for _, Wheel in pairs(Avatar.Wheels) do
    for _, Slot in ipairs(Wheel) do
      if Slot.ResourceId ~= nil and 0 ~= Slot.ResourceId then
        WheelItems[Slot.ResourceId] = 1
      end
    end
  end
  local AllResources = Avatar.Resources
  for RId, Resource in pairs(AllResources) do
    M:TryAddNewResourceReddot(Resource, RId)
    if Resource.Count <= 0 or WheelItems[RId] then
      M:SetItemReddotRead({
        ItemType = CommonConst.DataType.Resource,
        UnitId = RId
      }, true, true)
    end
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(DataMgr.ReddotNode.ArmoryBattleItem.Name)
  if CacheDetail then
    for key, _ in pairs(CacheDetail) do
      if nil == AllResources[tonumber(key)] then
        M:SetItemReddotRead({
          ItemType = CommonConst.DataType.Resource,
          UnitId = tonumber(key)
        }, true, true, true)
      end
    end
  end
end

function ReddotCreateFunctions.CreateModReddotInfos(M)
  local Avatar = GWorld:GetAvatar()
  local AllModIds = {}
  for Uuid, Mod in pairs(Avatar.Mods) do
    if Mod.Count > 0 and 0 == Mod.Level then
      M:TryAddNewModReddot(Mod, Mod.ModId)
      AllModIds[Mod.ModId] = CommonUtils.ObjId2Str(Uuid)
    end
  end
  if not next(AllModIds) then
    return
  end
  for ApplicationType, _ in pairs(DataMgr.ModTag) do
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(CommonConst.DataType.Mod .. ApplicationType)
    for key, _ in pairs(CacheDetail or {}) do
      if not AllModIds[key] or DataMgr.Mod[key].ApplicationType ~= ApplicationType then
        M:SetItemReddotRead({
          UnitId = key,
          ApplicationType = ApplicationType,
          ItemType = CommonConst.DataType.Mod
        }, true, false, true)
      end
    end
  end
end

function ReddotCreateFunctions.CreateRecordReddotInfos(M)
  pcall(M.InitAllCharRecordReddot(), M)
end

function ReddotCreateFunctions.CreateCharVoiceReddotInfos(M)
  local Avatar = GWorld:GetAvatar()
  local CharId = Avatar.Chars[Avatar.CurrentChar].CharId
  if not CharId then
    return
  end
  local CharVoiceData = DataMgr.CharVoice[CharId]
  if not CharVoiceData then
    print(_G.LogTag, "\231\186\162\231\130\185\230\183\187\229\138\160\229\164\177\232\180\165\239\188\140CharVoice\231\154\132\232\161\168\230\149\176\230\141\174\230\151\160\230\149\136\239\188\140\230\151\160\230\149\136Id: " .. CharId)
    return
  end
  for VoiceId, Data in pairs(CharVoiceData) do
    M:TryAddNewCharVoiceReddot(Data, table.concat({CharId, VoiceId}, "_"))
  end
end

local function CreateOneCharAppearanceReddotInfos(CharId)
  local Avatar = GWorld:GetAvatar()
  local CommonChar = Avatar.CommonChars[CharId]
  local AllAccessorys = Avatar.CharAccessorys
  local CharAllSkin = CommonChar.OwnedSkins
  for _, Skin in pairs(CharAllSkin) do
    if Skin.SkinId ~= CommonChar.CharId then
      M:TryAddNewCharSkinReddot(Skin.SkinId, CommonChar.CharId)
    end
    for AccessoryType, value in pairs(CommonConst.NewCharAccessoryTypes) do
      local LeafNodeName = CommonConst.DataType.CharAccessory .. AccessoryType .. Skin.SkinId
      local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(LeafNodeName)
      if CacheDetail then
        for key, _ in pairs(CacheDetail) do
          key = tonumber(key)
          if nil == AllAccessorys[key] then
            M:SetItemReddotRead({
              ItemType = CommonConst.DataType.CharAccessory,
              AccessoryId = key
            }, true, true, true)
          end
        end
      end
    end
  end
  local LeafNodeName = CommonConst.DataType.Char .. CommonConst.DataType.Skin .. CommonChar.CharId
  if not ReddotManager.GetTreeNode(LeafNodeName) then
    ReddotManager.AddNode(LeafNodeName, nil, 1)
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(LeafNodeName)
  if CacheDetail then
    for key, _ in pairs(CacheDetail) do
      key = tonumber(key)
      if nil == CharAllSkin[key] then
        M:SetItemReddotRead({
          ItemType = CommonConst.DataType.Skin,
          SkinId = key
        }, true, true, true)
      end
    end
  end
end

function ReddotCreateFunctions.CreateCharAppearanceReddotInfos(M)
  local Avatar = GWorld:GetAvatar()
  local AllAccessorys = Avatar.CharAccessorys
  local AccessoryIds = {}
  local DefaultAcceesories = {
    [CommonConst.CharAccessoryTypes.FX_Dead] = DataMgr.GlobalConstant.DefautFXDead.ConstantValue,
    [CommonConst.CharAccessoryTypes.FX_Teleport] = DataMgr.GlobalConstant.DefautFXTeleport.ConstantValue
  }
  for _, AccessoryId in pairs(AllAccessorys) do
    AccessoryIds[AccessoryId] = true
    local CharAccessoryData = DataMgr.CharAccessory[AccessoryId]
    if CharAccessoryData and CharAccessoryData.AccessoryType and (not DefaultAcceesories[CharAccessoryData.AccessoryType] or AccessoryId ~= DefaultAcceesories[CharAccessoryData.AccessoryType]) then
      for _, SkinId in ipairs(CharAccessoryData.Skin or {""}) do
        M:TryAddNewCharAccessoryReddot(AccessoryId, SkinId)
      end
    end
  end
  for AccessoryType, value in pairs(CommonConst.NewCharAccessoryTypes) do
    local LeafNodeName = CommonConst.DataType.CharAccessory .. AccessoryType
    if not ReddotManager.GetTreeNode(LeafNodeName) then
      ReddotManager.AddNode(LeafNodeName, nil, 1)
    end
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(LeafNodeName)
    if CacheDetail then
      for key, _ in pairs(CacheDetail) do
        key = tonumber(key)
        if nil == AccessoryIds[key] or key == DefaultAcceesories[AccessoryType] then
          M:SetItemReddotRead({
            ItemType = CommonConst.DataType.CharAccessory,
            AccessoryId = key
          }, true, true, true)
        end
      end
    end
  end
  for _, CommonChar in pairs(Avatar.CommonChars) do
    CreateOneCharAppearanceReddotInfos(CommonChar.CharId)
  end
end

function ReddotCreateFunctions.CreateWeaponAppearanceReddotInfos(M)
  local Avatar = GWorld:GetAvatar()
  if not ReddotManager.GetTreeNode(CommonConst.DataType.WeaponAccessory) then
    ReddotManager.AddNode(CommonConst.DataType.WeaponAccessory, nil, 1)
  end
  local AllAccessorys = Avatar.WeaponAccessorys
  local AccessoryIds = {}
  for _, AccessoryId in pairs(AllAccessorys) do
    AccessoryIds[AccessoryId] = true
    local AccessoryData = DataMgr.WeaponAccessory[AccessoryId]
    if AccessoryData then
      M:TryAddNewWeaponAccessoryReddot(AccessoryId)
    end
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(CommonConst.DataType.WeaponAccessory)
  if CacheDetail then
    for key, _ in pairs(CacheDetail) do
      key = tonumber(key)
      if nil == AccessoryIds[key] then
        M:SetItemReddotRead({
          ItemType = CommonConst.DataType.WeaponAccessory,
          AccessoryId = key
        }, true, true, true)
      end
    end
  end
  local AllWeaponSkins = Avatar.OwnedWeaponSkins
  for SkinId, _ in pairs(AllWeaponSkins) do
    local SkinData = DataMgr.WeaponSkin[SkinId]
    if SkinData then
      M:TryAddNewWeaponSkinReddot(SkinId)
    end
  end
  local AllWeaponSkinApplicationType = {}
  for WeaponId, value in pairs(DataMgr.Weapon) do
    if value.SkinApplicationType then
      for _, ApplicationType in ipairs(value.SkinApplicationType) do
        AllWeaponSkinApplicationType[ApplicationType] = true
      end
    end
  end
  for key, value in pairs(AllWeaponSkinApplicationType) do
    local LeftNodeName = CommonConst.DataType.WeaponSkin .. key
    if not ReddotManager.GetTreeNode(LeftNodeName) then
      ReddotManager.AddNode(LeftNodeName, nil, 1)
    end
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(LeftNodeName)
    if CacheDetail then
      for key, _ in pairs(CacheDetail) do
        key = tonumber(key)
        if nil == AllWeaponSkins[key] then
          M:SetItemReddotRead({
            ItemType = CommonConst.DataType.WeaponSkin,
            SkinId = key
          }, true, true, true)
        end
      end
    end
  end
end

function ReddotCreateFunctions.CreatePetReddotInfos(M)
  local Avatar = GWorld:GetAvatar()
  local AllPets = Avatar.Pets
  for UniqueId, Pet in pairs(AllPets) do
    M:TryAddNewPetReddot(Pet, UniqueId)
  end
  local PetCacheDetail = ReddotManager.GetLeafNodeCacheDetail(CommonConst.DataType.Pet) or {}
  local ResourcePetCacheDetail = ReddotManager.GetLeafNodeCacheDetail("Resource" .. CommonConst.DataType.Pet) or {}
  for key, _ in pairs(ResourcePetCacheDetail) do
    if AllPets[tonumber(key)] == nil then
      M:SetItemReddotRead({
        ItemType = CommonConst.DataType.Pet,
        UniqueId = key
      }, true, true, true)
    end
  end
  for key, _ in pairs(PetCacheDetail) do
    if AllPets[tonumber(key)] == nil then
      M:SetItemReddotRead({
        ItemType = CommonConst.DataType.Pet,
        UniqueId = key
      }, true, true, true)
    end
  end
end

function M:CreateReddotInfos(ItemType)
  if not ItemType or "" == ItemType then
    return
  end
  local FunctionName = "Create" .. ItemType .. "ReddotInfos"
  if ReddotCreateFunctions[FunctionName] then
    return ReddotCreateFunctions[FunctionName](M)
  end
end

function M:SetReddotRead(Content, ReadNew, ReadUpgradeable, bDeleteCache)
  if self.IsPreviewMode then
    return
  end
  if not Content then
    return
  end
  local functions = {}
  
  function functions.SetCharReddotRead()
    local UuidStr = CommonUtils.ObjId2Str(Content.Uuid)
    if ReadNew then
      M:_SetReddotReadCommon(UuidStr, DataMgr.ReddotNode.NewChar.Name, bDeleteCache)
    end
    if ReadUpgradeable then
      M:_SetReddotReadCommon(UuidStr, DataMgr.ReddotNode.PromoteChar.Name, bDeleteCache)
    end
  end
  
  function functions.SetCharSkillReddotRead()
    local NodeName = Content.Type .. CommonUtils.ObjId2Str(Content.CharUuid)
    local CacheKey = Content.SkillId
    M:_SetReddotReadCommon(CacheKey, NodeName)
  end
  
  function functions.SetWeaponReddotRead()
    local UuidStr = CommonUtils.ObjId2Str(Content.Uuid)
    M:_SetReddotReadCommon(UuidStr, Content.Tag, bDeleteCache)
  end
  
  function functions.SetResourceReddotRead()
    local ResData = DataMgr.Resource[Content.UnitId]
    if not ResData then
      local Avatar = GWorld:GetAvatar()
      if not Avatar then
        return
      end
      ResData = Avatar.Resources[Content.UnitId]
    end
    if not ResData then
      return
    end
    local bBattleItem = string.match(ResData.Type, "BattleItem")
    if not bBattleItem then
      return
    end
    M:_SetReddotReadCommon(Content.UnitId, DataMgr.ReddotNode.ArmoryBattleItem.Name, bDeleteCache)
  end
  
  function functions.SetModReddotRead()
    local ApplicationType = Content.ApplicationType
    local ModId = Content.UnitId
    ApplicationType = ApplicationType or DataMgr.Mod[ModId].ApplicationType
    local NodeName = CommonConst.DataType.Mod .. ApplicationType
    M:_SetReddotReadCommon(ModId, NodeName, bDeleteCache)
  end
  
  function functions.SetRecordReddotRead()
    local NodeName = table.concat({
      M.FilesTabType[2],
      Content.CharId,
      Content.ReddotType
    }, "_")
    local CacheKey = table.concat({
      Content.CharId,
      Content.CharDataTarget
    }, "_")
    M:_SetReddotReadCommon(CacheKey, NodeName)
  end
  
  function functions.SetCharVoiceReddotRead()
    local NodeName = table.concat({
      M.FilesTabType[1],
      Content.CharId,
      Content.ReddotType
    }, "_")
    local CacheKey = table.concat({
      Content.CharId,
      Content.VoiceId
    }, "_")
    M:_SetReddotReadCommon(CacheKey, NodeName)
  end
  
  function functions.SetCharAccessoryReddotRead()
    local AccessoryId = Content.AccessoryId
    local Data = DataMgr.CharAccessory[AccessoryId]
    if not Data then
      return
    end
    local NodeNamePre = CommonConst.DataType.CharAccessory .. Data.AccessoryType
    for _, CharId in ipairs(Data.Char or {""}) do
      local NodeName = NodeNamePre .. CharId
      M:_SetReddotReadCommon(AccessoryId, NodeName)
    end
  end
  
  function functions.SetPetReddotRead()
    local UniqueIdStr = Content.UniqueId
    M:_SetReddotReadCommon(UniqueIdStr, Content.Type, bDeleteCache)
  end
  
  if functions["Set" .. Content.Type .. "ReddotRead"] then
    functions["Set" .. Content.Type .. "ReddotRead"]()
    if ReadNew then
      Content.IsNew = false
    end
    if ReadUpgradeable then
      Content.Upgradeable = false
    end
    if Content.UI and Content.UI.SetReddot then
      Content.UI:SetReddot(Content.IsNew, Content.Upgradeable)
    end
    if Content.Widget and Content.Widget.SetReddot then
      Content.Widget:SetReddot(Content.IsNew, Content.Upgradeable)
    end
  end
end

function M:SetItemReddotRead(Content, ReadNew, ReadUpgradeable, bDeleteCache)
  if self.IsPreviewMode then
    return
  end
  if not Content then
    return
  end
  local functions = {}
  
  function functions.SetCharReddotRead()
    local UuidStr = CommonUtils.ObjId2Str(Content.Uuid)
    if ReadNew then
      M:_SetReddotReadCommon(UuidStr, DataMgr.ReddotNode.NewChar.Name, bDeleteCache)
    end
    if ReadUpgradeable then
      M:_SetReddotReadCommon(UuidStr, DataMgr.ReddotNode.PromoteChar.Name, bDeleteCache)
    end
  end
  
  function functions.SetCharSkillReddotRead()
    local NodeName = Content.Type .. CommonUtils.ObjId2Str(Content.CharUuid)
    local CacheKey = Content.SkillId
    M:_SetReddotReadCommon(CacheKey, NodeName)
  end
  
  function functions.SetWeaponReddotRead()
    local UuidStr = CommonUtils.ObjId2Str(Content.Uuid)
    M:_SetReddotReadCommon(UuidStr, Content.Tag, bDeleteCache)
  end
  
  function functions.SetResourceReddotRead()
    local ResData = DataMgr.Resource[Content.UnitId]
    if not ResData then
      local Avatar = GWorld:GetAvatar()
      if not Avatar then
        return
      end
      ResData = Avatar.Resources[Content.UnitId]
    end
    if not ResData then
      return
    end
    local bBattleItem = string.match(ResData.Type, "BattleItem")
    if not bBattleItem then
      return
    end
    M:_SetReddotReadCommon(Content.UnitId, DataMgr.ReddotNode.ArmoryBattleItem.Name, bDeleteCache)
  end
  
  function functions.SetModReddotRead()
    local ApplicationType = Content.ApplicationType
    local ModId = Content.UnitId
    ApplicationType = ApplicationType or DataMgr.Mod[ModId].ApplicationType
    local NodeName = CommonConst.DataType.Mod .. ApplicationType
    M:_SetReddotReadCommon(ModId, NodeName, bDeleteCache)
  end
  
  function functions.SetRecordReddotRead()
    local NodeName = table.concat({
      M.FilesTabType[2],
      Content.CharId,
      Content.ReddotType
    }, "_")
    local CacheKey = table.concat({
      Content.CharId,
      Content.CharDataTarget
    }, "_")
    M:_SetReddotReadCommon(CacheKey, NodeName)
  end
  
  function functions.SetCharVoiceReddotRead()
    local NodeName = table.concat({
      M.FilesTabType[1],
      Content.CharId,
      Content.ReddotType
    }, "_")
    local CacheKey = table.concat({
      Content.CharId,
      Content.VoiceId
    }, "_")
    M:_SetReddotReadCommon(CacheKey, NodeName)
  end
  
  function functions.SetCharAccessoryReddotRead()
    local AccessoryId = Content.AccessoryId
    local Data = DataMgr.CharAccessory[AccessoryId]
    if not Data then
      return
    end
    local NodeNamePre = CommonConst.DataType.CharAccessory .. Data.AccessoryType
    for _, SkinId in ipairs(Data.Skin or {""}) do
      local NodeName = NodeNamePre .. SkinId
      M:_SetReddotReadCommon(AccessoryId, NodeName)
    end
  end
  
  function functions.SetSkinReddotRead()
    if not Content.CharId then
      return
    end
    local NodeName = CommonConst.DataType.Char .. CommonConst.DataType.Skin .. Content.CharId
    M:_SetReddotReadCommon(Content.SkinId, NodeName)
  end
  
  function functions.SetWeaponSkinReddotRead()
    local SkinId = Content.SkinId
    local Data = DataMgr.WeaponSkin[SkinId]
    if not Data then
      return
    end
    local NodeName = CommonConst.DataType.WeaponSkin .. (Data.ApplicationType or "")
    M:_SetReddotReadCommon(SkinId, NodeName)
  end
  
  function functions.SetWeaponAccessoryReddotRead()
    local AccessoryId = Content.AccessoryId
    local Data = DataMgr.WeaponAccessory[AccessoryId]
    if not Data then
      return
    end
    local NodeName = CommonConst.DataType.WeaponAccessory
    M:_SetReddotReadCommon(AccessoryId, NodeName)
  end
  
  function functions.SetPetReddotRead()
    local UniqueIdStr = Content.UniqueId
    local NodeName = CommonConst.DataType.Pet
    M:_SetReddotReadCommon(UniqueIdStr, "Resource" .. NodeName, bDeleteCache)
    M:_SetReddotReadCommon(UniqueIdStr, NodeName, bDeleteCache)
    EventManager:FireEvent(EventID.OnPetReddotRead, UniqueIdStr, Content)
  end
  
  if functions["Set" .. (Content.ItemType or Content.Type) .. "ReddotRead"] then
    functions["Set" .. (Content.ItemType or Content.Type) .. "ReddotRead"]()
    if ReadNew then
      Content.IsNew = false
    end
    if ReadUpgradeable then
      Content.Upgradeable = false
    end
    M:UpdateContentRetDotType(Content)
  end
end

function M:UpdateContentRetDotType(Content)
  if Content.IsNew then
    Content.RedDotType = UIConst.RedDotType.NewRedDot
  elseif Content.Upgradeable or Content.HasReward or Content.Unlockable then
    Content.RedDotType = UIConst.RedDotType.CommonRedDot
  else
    Content.RedDotType = nil
  end
  if Content.SelfWidget and Content.SelfWidget.SetRedDot then
    Content.SelfWidget:SetRedDot(Content.RedDotType)
  end
  if Content.Widget and Content.Widget.SetReddot then
    Content.Widget:SetReddot(Content.RedDotType)
  end
end

function M:SetArchiveReddotRead(Content)
  if not Content.IsNew then
    return
  end
  Content.IsNew = false
  if Content.Upgradeable then
    Content.RedDotType = UIConst.RedDotType.CommonRedDot
  else
    Content.RedDotType = nil
  end
  if Content.SelfWidget and Content.SelfWidget.SetRedDot then
    Content.SelfWidget:SetRedDot(Content.RedDotType)
  end
  if Content.Widget and Content.Widget.SetReddot then
    Content.Widget:SetReddot(Content.RedDotType)
  end
  local NodeName
  if Content.Type == "Char" then
    NodeName = DataMgr.ReddotNode.ArchiveNewChar.Name
  elseif Content.Tag == "Melee" then
    NodeName = DataMgr.ReddotNode.ArchiveNewMelee.Name
  elseif Content.Tag == "Ranged" then
    NodeName = DataMgr.ReddotNode.ArchiveNewRanged.Name
  end
  if NodeName then
    if not ReddotManager.GetTreeNode(NodeName) then
      ReddotManager.AddNode(NodeName)
    end
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(NodeName)
    if 1 == CacheDetail[Content.UnitId] then
      CacheDetail[Content.UnitId] = 0
      ReddotManager.DecreaseLeafNodeCount(NodeName)
    end
  end
end

function M:SetReddotsRead(Contents, ReadNew, ReadUpgradeable)
  for _, Content in pairs(Contents) do
    self:SetItemReddotRead(Content, ReadNew, ReadUpgradeable)
  end
end

function M:TryAddNewModReddot(Mod, ModId)
  if Mod.Level > 0 then
    return
  end
  if 0 == Mod.Count then
    return
  end
  if self.IsPreviewMode then
    return
  end
  if not Mod:Data() then
    print(_G.LogTag, "\231\186\162\231\130\185\230\183\187\229\138\160\229\164\177\232\180\165\239\188\140Mod\231\154\132\232\161\168\230\149\176\230\141\174\230\151\160\230\149\136\239\188\140\230\151\160\230\149\136Id: " .. Mod.ModId)
    return false
  end
  if nil == ModId then
    ModId = Mod.ModId
  end
  self:TryAddNewModBookReddot(Mod, ModId)
  local NodeName = CommonConst.DataType.Mod .. Mod.ApplicationType
  return M:_TryAddNewReddotCommon(ModId, NodeName)
end

function M:TryAddNewModBookReddot(Mod, ModId)
  local Avatar = GWorld:GetAvatar()
  if Avatar.HoldMods and Avatar.HoldMods[ModId] then
    return
  end
  local ArchiveId = DataMgr.ModId2ArchiveId[ModId]
  if not ArchiveId then
    return
  end
  local ModList = DataMgr.ModGuideBookArchive[ArchiveId].ModList
  for i = 1, #ModList do
    if ModId ~= ModList[i] and not Avatar.HoldMods[ModList[i]] then
      return
    end
  end
  local ReddotNode = DataMgr.ModGuideBookArchiveTab[DataMgr.ModGuideBookArchive[ArchiveId].TabId].ReddotNode
  if not ReddotManager.GetTreeNode("ModArchive") then
    ReddotManager.AddNodeEx("ModArchive")
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(ReddotNode)
  CacheDetail = CacheDetail or {}
  if not CacheDetail.RedNum then
    CacheDetail.RedNum = 0
  end
  CacheDetail.RedNum = CacheDetail.RedNum + 1
  ReddotManager.IncreaseLeafNodeCount(ReddotNode, 1, CacheDetail)
end

function M:TryAddNewWeaponReddot(Weapon, UuidStr)
  if self.IsPreviewMode then
    return
  end
  if not Weapon:BattleData() or not Weapon:Data() then
    print(_G.LogTag, "\231\186\162\231\130\185\230\183\187\229\138\160\229\164\177\232\180\165\239\188\140Weapon\231\154\132\232\161\168\230\149\176\230\141\174\230\151\160\230\149\136\239\188\140\230\151\160\230\149\136Id: " .. Weapon.WeaponId)
    return false
  end
  if Weapon:HasTag(CommonConst.WeaponType.UltraWeapon) then
    return false
  end
  if nil == UuidStr then
    UuidStr = CommonUtils.ObjId2Str(Weapon.Uuid)
  end
  
  local function _TryAddNewWeaponReddot(WeaponType)
    return M:_TryAddNewReddotCommon(UuidStr, WeaponType)
  end
  
  local IsNew = false
  IsNew = Weapon:HasTag(CommonConst.WeaponType.MeleeWeapon) and _TryAddNewWeaponReddot(CommonConst.WeaponType.MeleeWeapon) or IsNew
  IsNew = Weapon:HasTag(CommonConst.WeaponType.RangedWeapon) and _TryAddNewWeaponReddot(CommonConst.WeaponType.RangedWeapon) or IsNew
  local HasReward = M:TryAddWeaponRewardReddot(Weapon.WeaponId)
  return IsNew, false, HasReward
end

function M:TryAddNewResourceReddot(Resource, Id)
  if self.IsPreviewMode then
    return
  end
  if not Resource:Data() then
    print(_G.LogTag, "\231\186\162\231\130\185\230\183\187\229\138\160\229\164\177\232\180\165\239\188\140Resource\231\154\132\232\161\168\230\160\188\230\149\176\230\141\174\230\151\160\230\149\136\239\188\140\230\151\160\230\149\136Id: " .. Resource.ResourceId)
    return false
  end
  local ResData = Resource:Data()
  if not ResData then
    return
  end
  if nil == Id then
    Id = Resource.ResourceId
  end
  local bBattleItem = string.match(ResData.Type, "BattleItem")
  if not bBattleItem then
    return
  end
  return M:_TryAddNewReddotCommon(Id, DataMgr.ReddotNode.ArmoryBattleItem.Name)
end

function M:TryAddNewCharReddot(Char, UuidStr)
  if self.IsPreviewMode then
    return
  end
  if not Char:Data() or not Char:BattleData() then
    print(_G.LogTag, "\231\186\162\231\130\185\230\183\187\229\138\160\229\164\177\232\180\165\239\188\140Char\231\154\132\232\161\168\230\149\176\230\141\174\230\151\160\230\149\136\239\188\140\230\151\160\230\149\136CharId: " .. Char.CharId .. "\230\151\160\230\149\136RoleId: " .. Char.RoleId)
    return false
  end
  if nil == UuidStr then
    UuidStr = CommonUtils.ObjId2Str(Char.Uuid)
  end
  local CardUpgradeable = UpgradeUtils.CheckCharCanUpgradeCardLevel(Char)
  local PromoteRes = M:_TryAddNewReddotCommon(UuidStr, DataMgr.ReddotNode.PromoteChar.Name, true, not CardUpgradeable)
  if not CardUpgradeable then
    self:_SetReddotReadCommon(UuidStr, DataMgr.ReddotNode.PromoteChar.Name)
  end
  CreateOneCharAppearanceReddotInfos(Char.CharId)
  local HasReward = M:TryAddCharRewardReddot(Char.CharId)
  return M:_TryAddNewReddotCommon(UuidStr, DataMgr.ReddotNode.NewChar.Name), PromoteRes, HasReward
end

function M:TryAddCharRewardReddot(CharId)
  if self.IsPreviewMode then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar:IsCharHasReward(CharId) then
    return M:_TryAddNewReddotCommon(CharId, DataMgr.ReddotNode.CharReward.Name)
  end
end

function M:TryAddWeaponRewardReddot(WeaponId)
  local Avatar = GWorld:GetAvatar()
  if Avatar:IsWeaponHasReward(WeaponId) then
    local WeaponType = CommonUtils.GetWeaponTypeById(WeaponId) or ""
    if WeaponType == CommonConst.WeaponType.MeleeWeapon then
      return M:_TryAddNewReddotCommon(WeaponId, DataMgr.ReddotNode.MeleeReward.Name)
    elseif WeaponType == CommonConst.WeaponType.RangedWeapon then
      return M:_TryAddNewReddotCommon(WeaponId, DataMgr.ReddotNode.RangedReward.Name)
    end
  end
end

function M:TryAddUnlockableCharReddot(CharId)
  if self.IsPreviewMode then
    return
  end
  local Avatar = GWorld:GetAvatar()
  local Data = DataMgr.Char[CharId]
  if not Data or Data.IsNotOpen or Avatar:GetCharUuidByCharId(CharId) then
    return
  end
  local Rid = Data.CharPieceId
  local Resource = Avatar.Resources[Rid] or {Count = 0}
  if Resource.Count <= 0 then
    return
  end
  if Data.CharUnlockRequiredPiece and Data.CharUnlockRequiredPiece <= Resource.Count then
    return M:_TryAddNewReddotCommon(CharId, DataMgr.ReddotNode.UnlockableChar.Name)
  end
end

function M:TryAddNewCharSkillReddot(CharSkill, Id, CharUuid, bCanLevelUp)
  if self.IsPreviewMode then
    return
  end
  if not CharSkill:Data() then
    print(_G.LogTag, "\231\186\162\231\130\185\230\183\187\229\138\160\229\164\177\232\180\165\239\188\140CharSkill\231\154\132\232\161\168\230\149\176\230\141\174\230\151\160\230\149\136\239\188\140\230\151\160\230\149\136Id: " .. CharSkill.SkillId)
    return false
  end
  if nil == Id then
    Id = CharSkill.SkillId
  end
  local UuidStr = CommonUtils.ObjId2Str(CharUuid)
  local NodeName = CommonConst.DataType.Char .. Const.Skill
  local SkillData = DataMgr.Skill[CharSkill.SkillId]
  if SkillData and SkillData[1] and SkillData[1][0] then
    if nil == bCanLevelUp then
      bCanLevelUp = true
    end
    return M:_TryAddNewReddotCommon(Id, NodeName .. UuidStr, true, not bCanLevelUp)
  end
  return false
end

function M:TryAddNewCharAccessoryReddot(AccessoryId, SkinId)
  if self.IsPreviewMode then
    return
  end
  local CharAccessoryData = DataMgr.CharAccessory[AccessoryId]
  if not CharAccessoryData then
    print(_G.LogTag, "\231\186\162\231\130\185\230\183\187\229\138\160\229\164\177\232\180\165\239\188\140CharAccessory\231\154\132\232\161\168\230\149\176\230\141\174\230\151\160\230\149\136\239\188\140\230\151\160\230\149\136Id: " .. AccessoryId)
    return false
  end
  local ReddotName = CommonConst.DataType.CharAccessory .. CharAccessoryData.AccessoryType
  SkinId = SkinId or ""
  return M:_TryAddNewReddotCommon(AccessoryId, ReddotName .. SkinId)
end

function M:TryAddNewCharSkinReddot(SkinId, CharId)
  if self.IsPreviewMode then
    return
  end
  local CharAccessoryData = DataMgr.Skin[SkinId]
  if not CharAccessoryData then
    return false
  end
  local ReddotName = CommonConst.DataType.Char .. CommonConst.DataType.Skin .. CharId
  for AccessoryType, value in pairs(CommonConst.NewCharAccessoryTypes) do
    local LeafNodeName = CommonConst.DataType.CharAccessory .. AccessoryType .. SkinId
    if not ReddotManager.GetTreeNode(LeafNodeName) then
      ReddotManager.AddNode(LeafNodeName, nil, 1)
    end
  end
  return M:_TryAddNewReddotCommon(SkinId, ReddotName)
end

function M:TryAddNewWeaponAccessoryReddot(AccessoryId)
  if self.IsPreviewMode then
    return
  end
  local AccessoryData = DataMgr.WeaponAccessory[AccessoryId]
  if not AccessoryData then
    return false
  end
  local ReddotName = CommonConst.DataType.WeaponAccessory
  return M:_TryAddNewReddotCommon(AccessoryId, ReddotName)
end

function M:TryAddNewWeaponSkinReddot(SkinId)
  if self.IsPreviewMode then
    return
  end
  local WeaponSkinData = DataMgr.WeaponSkin[SkinId]
  if not WeaponSkinData then
    return false
  end
  local ReddotName = CommonConst.DataType.WeaponSkin .. (WeaponSkinData.ApplicationType or "")
  return M:_TryAddNewReddotCommon(SkinId, ReddotName)
end

function M:TryAddNewCharVoiceReddot(VoiceData, CacheKey)
  if self.IsPreviewMode then
    return
  end
  CacheKey = CacheKey or table.concat({
    VoiceData.CharId,
    VoiceData.VoiceId
  }, "_")
  local ReddotName = table.concat({
    M.FilesTabType[1],
    VoiceData.CharId,
    VoiceData.VoiceType
  }, "_")
  return M:_TryAddNewReddotCommon(CacheKey, ReddotName)
end

function M:TryAddNewRecordReddot(RecordData, CacheKey)
  if self.IsPreviewMode then
    return
  end
  CacheKey = CacheKey or table.concat({
    RecordData.CharId,
    RecordData.CharDataTarget
  }, "_")
  local ReddotName = table.concat({
    M.FilesTabType[2],
    RecordData.CharId,
    RecordData.CharDataType
  }, "_")
  return M:_TryAddNewReddotCommon(CacheKey, ReddotName)
end

function M:TryAddNewPetReddot(Pet, UniqueId)
  if self.IsPreviewMode then
    return
  end
  if not Pet:Data() or not Pet:BattleData() then
    print(_G.LogTag, "\231\186\162\231\130\185\230\183\187\229\138\160\229\164\177\232\180\165\239\188\140\229\174\160\231\137\169\231\154\132\232\161\168\230\149\176\230\141\174\230\151\160\230\149\136\239\188\140\230\151\160\230\149\136Id: " .. Pet.PetId)
    return false
  end
  if nil == UniqueId then
    UniqueId = Pet.UniqueId
  end
  local NodeName = CommonConst.DataType.Pet
  if Pet:IsResourcePet() then
    M:_TryAddNewReddotCommon(UniqueId, "Resource" .. NodeName)
  end
  local Res = M:_TryAddNewReddotCommon(UniqueId, NodeName, false, false, NodeName)
  return Res
end

function M:_TryAddNewReddotCommon(CacheKey, NodeName, Recyclable, bDontIncrease, ModelName)
  if not ReddotManager.GetTreeNode(NodeName) then
    ReddotManager.AddNode(NodeName, nil, 1, nil, ModelName)
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(NodeName)
  if not CacheDetail then
    DebugPrint(Traceback(ErrorTag, "CacheDetail\228\184\186\231\169\186: " .. NodeName))
    return
  end
  if not CacheDetail[CacheKey] or Recyclable and 0 == CacheDetail[CacheKey] then
    if not bDontIncrease then
      CacheDetail[CacheKey] = 1
      ReddotManager.IncreaseLeafNodeCount(NodeName)
    else
      CacheDetail[CacheKey] = 0
    end
  end
  return 1 == CacheDetail[CacheKey]
end

function M:_SetReddotReadCommon(CacheKey, NodeName, bDeleteCache)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(NodeName)
  if not CacheDetail then
    DebugPrint(Warning, LXYTag, "\229\134\155\230\162\176\229\186\147\231\186\162\231\130\185\230\178\161\230\156\137\232\191\153\228\184\170\231\188\147\229\173\152 " .. NodeName)
    return
  end
  if not CacheDetail[CacheKey] then
    DebugPrint(Warning, LXYTag, NodeName .. "\229\134\155\230\162\176\229\186\147\231\186\162\231\130\185\231\188\147\229\173\152\230\178\161\230\156\137\232\191\153\228\184\170key " .. CacheKey)
    return
  end
  if 1 == CacheDetail[CacheKey] then
    CacheDetail[CacheKey] = 0
    ReddotManager.DecreaseLeafNodeCount(NodeName)
  end
  if bDeleteCache then
    CacheDetail[CacheKey] = nil
  end
end

function M:SetIsPreviewMode(IsPreviewMode)
  self.IsPreviewMode = IsPreviewMode
end

function M:GetIsPreviewMode()
  return self.IsPreviewMode
end

function M:SwitchPreviewTargetState(PreviewTargetState)
  if not self:HasAvatar(PreviewTargetState) then
    return
  end
  self.CurPreviewTargetState = PreviewTargetState
  EventManager:FireEvent(EventID.OnArmoryPreviewModeStateChanged, self.CurPreviewTargetState)
end

function M:GetPreviewTargetState()
  return self.CurPreviewTargetState
end

function M:GetDummyAvatar(State)
  State = State or self.CurPreviewTargetState
  if State == self.PreviewTargetStates.Prime then
    return self.DummyAvatar_Prime
  elseif State == self.PreviewTargetStates.Max then
    return self.DummyAvatar_Max
  elseif State == self.PreviewTargetStates.Custom then
    return self.DummyAvatar_Custom
  end
end

function M:DestroyDummyAvatar(State)
  if State then
    if State == self.PreviewTargetStates.Prime then
      self.DummyAvatar_Prime = nil
    elseif State == self.PreviewTargetStates.Max then
      self.DummyAvatar_Max = nil
    elseif State == self.PreviewTargetStates.Custom then
      self.DummyAvatar_Custom = nil
    end
  else
    self.DummyAvatar_Max = nil
    self.DummyAvatar_Prime = nil
    self.DummyAvatar_Custom = nil
    self.CurPreviewTargetState = nil
  end
end

local _NeedResetUuid = true

function M:DontResetUuid(bDontReset)
  _NeedResetUuid = not bDontReset
end

local _Uuid = 1

local function _ResetUuid()
  if _NeedResetUuid then
    _Uuid = 1
  end
end

local function _NextUuid()
  local uuid = _Uuid
  _Uuid = _Uuid + 1
  return uuid
end

local function _CreateDummyAvatarBase(DummyAvatar, _Params)
  DummyAvatar.Chars = {}
  DummyAvatar.CommonChars = {}
  DummyAvatar.Weapons = {}
  DummyAvatar.UWeapons = {}
  DummyAvatar.Pets = {}
  DummyAvatar.Mods = {}
  DummyAvatar.CharAccessorys = {}
  DummyAvatar.CurrentChar = _Params.CurrentChar
  DummyAvatar.CurrentPet = _Params.CurrentPet or 0
  DummyAvatar.MeleeWeapon = _Params.MeleeWeapon
  DummyAvatar.RangedWeapon = _Params.RangedWeapon
  DummyAvatar.WeaponId2UWeapon = {}
  
  function DummyAvatar.CheckUIUnlocked()
    return true
  end
  
  DummyAvatar.CreateInfo2Uuids = {
    Chars = {},
    Weapons = {},
    Pets = {}
  }
  DummyAvatar.Sex = _Params.Sex or GWorld:GetAvatar().Sex
end

local function _UnlockModSlot(Target, TargetInfo)
  if TargetInfo and TargetInfo.ModSlotUnlock then
    for i = 1, #TargetInfo.ModSlotUnlock do
      if TargetInfo.ModSlotUnlock[i] < Target.EnhanceLevel then
        Target.ModSuits[Target.ModSuitIndex][i]:UnLock()
        Target.ModSlotStatus[i] = CommonConst.CommonStatus.UnLock
      end
    end
  end
end

local function _DummyAvatarCreateMod(FakeUuid, ModId, Level, CardLevel)
  local Mod = ModCom.ModDict:NewMod(FakeUuid, ModId, Level)
  Mod.CurrentModCardLevel = CardLevel
  Mod.IsOriginal = Level > 0
  Mod.LockState = 1
  return Mod
end

local function _DummyAvatarCreateWeapon(Uuid, WeaponId, Level, NeedEnhance, ModSuitIndex)
  local weapon = WeaponCom.WeaponDict:NewWeapon(Uuid, WeaponId, Level)
  weapon:InitAppearance()
  NeedEnhance = NeedEnhance or true
  if DataMgr.WeaponBreak[WeaponId] ~= nil then
    local WeaponBreak = DataMgr.WeaponBreak[WeaponId]
    for i = 1, #WeaponBreak do
      if NeedEnhance then
        if Level >= WeaponBreak[i].WeaponBreakLevel then
          weapon.EnhanceLevel = WeaponBreak[i].WeaponBreakNum
        end
      elseif Level > WeaponBreak[i].WeaponBreakLevel then
        weapon.EnhanceLevel = WeaponBreak[i].WeaponBreakNum
      end
    end
  end
  if ModSuitIndex then
    weapon.ModSuitIndex = ModSuitIndex
  end
  local WeaponInfo = DataMgr.Weapon[weapon.WeaponId]
  _UnlockModSlot(weapon, WeaponInfo)
  return weapon
end

local function _AddWeaponToDummyAvatar(DummyAvatar, Weapon, WeaponInfo)
  DummyAvatar.Weapons[Weapon.Uuid] = Weapon
  DummyAvatar.CreateInfo2Uuids.Weapons[WeaponInfo] = Weapon.Uuid
end

local function _DummyAvatarCreateUWeapon(WeaponId, Level, EnhanceLevel, ModSuitIndex)
  local info = DataMgr.UWeapon[WeaponId]
  if not info or not DataMgr.WeaponLevelUp[Level] then
    return
  end
  local weapon = WeaponCom.UWeaponDict:NewWeapon(_NextUuid(), WeaponId, Level)
  weapon.EnhanceLevel = EnhanceLevel
  if ModSuitIndex then
    weapon.ModSuitIndex = ModSuitIndex
  end
  local WeaponInfo = DataMgr.UWeapon[weapon.WeaponId]
  _UnlockModSlot(weapon, WeaponInfo)
  return weapon
end

local function _CharInitUltraWeapon(DummyAvatar, Char, Level)
  if not Char or not Char.UWeapon then
    return
  end
  for i, v in ipairs(Char.UWeapon) do
    local NewUWeapon = _DummyAvatarCreateUWeapon(v, Level, Char.EnhanceLevel)
    if NewUWeapon then
      Char.UWeaponEids:Append(NewUWeapon.Uuid)
      DummyAvatar.UWeapons[NewUWeapon.Uuid] = NewUWeapon
      DummyAvatar.WeaponId2UWeapon[NewUWeapon.WeaponId] = NewUWeapon
    end
  end
end

local function _InitCharSetCharAppearanceAccessory(DummyAvatar, Char)
  if not Char then
    return
  end
  local DefaultAccessory = Char.DefaultAccessory
  if not DefaultAccessory then
    return
  end
  for AccessoryType, AccessoryId in pairs(DefaultAccessory) do
    table.insert(DummyAvatar.CharAccessorys, AccessoryId)
    local CharAccessoryTypeIndex = CommonConst.NewCharAccessoryTypes[AccessoryType]
    for AppearanceIndex, AppearanceSuit in pairs(Char.AppearanceSuits) do
      AppearanceSuit.Accessory[CharAccessoryTypeIndex] = AccessoryId
    end
  end
end

local function _DummyAvatarCreateChar(DummyAvatar, Uuid, CharId, Level, NeedEnhance, ModSuitIndex)
  local char = CharCom.CharDict:NewChar(Uuid, CharId, Level)
  NeedEnhance = NeedEnhance or true
  if DataMgr.CharBreak[CharId] ~= nil then
    local CharBreak = DataMgr.CharBreak[CharId]
    for i = 1, #CharBreak do
      if NeedEnhance then
        if Level >= CharBreak[i].CharBreakLevel then
          char.EnhanceLevel = CharBreak[i].CharBreakNum
        end
      elseif Level > CharBreak[i].CharBreakLevel then
        char.EnhanceLevel = CharBreak[i].CharBreakNum
      end
    end
  end
  if ModSuitIndex then
    char.ModSuitIndex = ModSuitIndex
  end
  local CharInfo = DataMgr.Char[char.CharId]
  _UnlockModSlot(char, CharInfo)
  char:UpdateSkill()
  _CharInitUltraWeapon(DummyAvatar, char, Level)
  _InitCharSetCharAppearanceAccessory(DummyAvatar, char)
  DummyAvatar.CommonChars[CharId] = CharacterCommon.CommonCharDict:NewCommonChar(CharId)
  return char
end

local function _AddCharToDummyAvatar(DummyAvatar, Char, CharInfo)
  DummyAvatar.Chars[Char.Uuid] = Char
  DummyAvatar.CreateInfo2Uuids.Chars[CharInfo] = Char.Uuid
end

local function _DummyAvatarCreatePet(PetId, UniqueId)
  local Pet = PetCom.Pet(PetId, UniqueId)
  local PetType = DataMgr.Pet[Pet.PetId] and DataMgr.Pet[Pet.PetId].PetType
  local PetBreak = DataMgr.PetBreak[Pet.PetId] and DataMgr.PetBreak[Pet.PetId][Pet.BreakNum]
  if PetType == CommonConst.PetType.Consumable then
  else
    for i = Pet.Entry:Length() + 1, PetBreak.EntryNum do
      Pet.Entry:Append(0)
    end
  end
  Pet.Entry = Pet.Entry
  return Pet
end

local function _AddPetToDummyAvatar(DummyAvatar, Pet, PetInfo)
  DummyAvatar.Pets[Pet.UniqueId] = Pet
  DummyAvatar.CreateInfo2Uuids.Pets[Pet.UniqueId] = PetInfo
end

local function _CreateDummyAvatarPrime(DummyAvatar, _Params)
  _CreateDummyAvatarBase(DummyAvatar, _Params)
  local Level = 1
  _ResetUuid()
  if _Params.CharIds then
    for i, CharId in ipairs(_Params.CharIds) do
      local Char = _DummyAvatarCreateChar(DummyAvatar, _NextUuid(), CharId, Level, 1)
      for _, value in ipairs(Char.Skills) do
        value:Lock()
      end
      _AddCharToDummyAvatar(DummyAvatar, Char, CharId)
    end
  end
  if _Params.WeaponIds then
    for i, WeaponId in ipairs(_Params.WeaponIds) do
      local Weapon = _DummyAvatarCreateWeapon(_NextUuid(), WeaponId, Level, 1)
      _AddWeaponToDummyAvatar(DummyAvatar, Weapon, WeaponId)
    end
  end
  if _Params.PetIds then
    for i, PetId in ipairs(_Params.PetIds) do
      local Pet = _DummyAvatarCreatePet(PetId, _NextUuid())
      _AddPetToDummyAvatar(DummyAvatar, Pet, PetId)
    end
  end
end

local function _CreateDummyAvatarMax(DummyAvatar, _Params)
  _CreateDummyAvatarBase(DummyAvatar, _Params)
  local Level = 1
  _ResetUuid()
  if _Params.CharIds then
    for i, CharId in ipairs(_Params.CharIds) do
      Level = DataMgr.Char[CharId].CharMaxLevel
      local Char = _DummyAvatarCreateChar(DummyAvatar, _NextUuid(), CharId, Level, 1)
      Char:SetGradeLevel(DataMgr.GlobalConstant.CharCardLevelMax.ConstantValue)
      for _, Skill in pairs(Char.Skills) do
        Skill:UnLock()
        if DataMgr.SkillLevelUp[Skill.SkillId] then
          while Skill:LevelUp() do
          end
        end
      end
      for _, SkillNodes in ipairs(Char.SkillTree) do
        for _, SkillNode in ipairs(SkillNodes) do
          SkillNode:UnLock()
        end
      end
      _AddCharToDummyAvatar(DummyAvatar, Char, CharId)
    end
  end
  if _Params.WeaponIds then
    for i, WeaponId in ipairs(_Params.WeaponIds) do
      Level = DataMgr.Weapon[WeaponId].WeaponMaxLevel
      local Weapon = _DummyAvatarCreateWeapon(_NextUuid(), WeaponId, Level, 1)
      local WeaponCardLevelData = DataMgr.WeaponCardLevel[WeaponId]
      local CardLevelMax = WeaponCardLevelData and WeaponCardLevelData.CardLevelMax
      if CardLevelMax then
        Weapon:SetGradeLevel(false, CardLevelMax)
      end
      _AddWeaponToDummyAvatar(DummyAvatar, Weapon, WeaponId)
    end
  end
  if _Params.PetIds then
    for i, PetId in ipairs(_Params.PetIds) do
      local Pet = _DummyAvatarCreatePet(PetId, _NextUuid())
      local BreakConf = Pet:BreakData()
      Pet.BreakNum = BreakConf and #BreakConf or 0
      Pet.Level = Pet:GetMaxLevel()
      _AddPetToDummyAvatar(DummyAvatar, Pet, PetId)
    end
  end
end

local function _SetUpModForTarget(DummyAvatar, Target, TargetInfo)
  if TargetInfo.SlotData and TargetInfo.ModSuitIndex then
    for SlotId, Slot in pairs(Target.ModSuits[TargetInfo.ModSuitIndex]) do
      local SlotData = TargetInfo.SlotData[SlotId] or {
        SlotId = SlotId,
        Polarity = -1,
        ModEid = -1
      }
      local SlotStatus = Target.ModSlotStatus[SlotId]
      Slot:Init(SlotData.SlotId, SlotData.Polarity, SlotStatus, SlotData.ModEid)
      Target["ModSuit_" .. TargetInfo.ModSuitIndex][SlotId] = SlotData.ModEid or -1
      Target.ModSlotPolarity[SlotId] = SlotData.Polarity
    end
  end
  for _, ModData in ipairs(TargetInfo.ModData or {}) do
    local Mod = _DummyAvatarCreateMod(ModData.Uuid, ModData.ModId, ModData.Level, ModData.CurrentModCardLevel)
    if Target.SetExtralModVolume then
      Target:SetExtralModVolume(Mod:CalcExtralCharVolume(), TargetInfo.ModSuitIndex)
    end
    if Target:GetTypeName() == "Char" then
      table.insert(Mod.CharUuids, Target.Uuid)
    else
      table.insert(Mod.WeaponUuids, Target.Uuid)
    end
    DummyAvatar.Mods[Mod.Uuid] = Mod
  end
end

function M._CreateDummyAvatarCustom(DummyAvatar, _Params)
  _CreateDummyAvatarBase(DummyAvatar, _Params)
  _ResetUuid()
  for i, CharInfo in ipairs(_Params.CharInfos or {}) do
    local Char = _DummyAvatarCreateChar(DummyAvatar, _NextUuid(), CharInfo.RoleId, CharInfo.Level, 1, CharInfo.ModSuitIndex)
    Char.Exp = CharInfo.Exp
    Char.GradeLevel = CharInfo.GradeLevel
    if CharInfo.EnhanceLevel then
      Char.EnhanceLevel = CharInfo.EnhanceLevel
    end
    local AppearanceSuit = Char.AppearanceSuits[Char.CurrentAppearanceIndex]
    AppearanceSuit.SkinId = CharInfo.SkinId or AppearanceSuit.SkinId
    if CharInfo.AppearanceSuit then
      AppearanceSuit.SkinId = CharInfo.AppearanceSuit.SkinId or AppearanceSuit.SkinId
      local AccessorySuit = CharInfo.AppearanceSuit.AccessorySuit
      if AccessorySuit then
        for key, value in pairs(AccessorySuit) do
          AppearanceSuit.Accessory[key] = value
        end
      end
    end
    local SkilMap = {}
    if CharInfo.SkillInfos then
      for _, value in ipairs(Char.Skills) do
        SkilMap[value.SkillId] = value
        for _, InfoValue in ipairs(CharInfo.SkillInfos) do
          if InfoValue.SkillId == value.SkillId then
            break
          end
        end
        value.LockState = 1
      end
      for _, value in ipairs(CharInfo.SkillInfos) do
        local Skill = SkilMap[value.SkillId]
        if Skill then
          local SkillData = DataMgr.SkillLevelUp[Skill.SkillId]
          local SkinInfo = SkillData and value.SkillInfo
          if SkinInfo and SkinInfo.Level then
            Skill.ExtraLevel = SkinInfo.ExtraLevel or 0
            while SkillData[Skill.Level] and Skill.Level < SkinInfo.Level do
              Skill:LevelUp()
            end
          end
        end
      end
    end
    if CharInfo.SkillTreeInfos then
      for BranchIdx, SkillNodes in ipairs(Char.SkillTree) do
        local BranchInfo = CharInfo.SkillTreeInfos[BranchIdx]
        if BranchInfo then
          for NodeIdx, SkillNode in ipairs(SkillNodes) do
            if BranchInfo[NodeIdx] then
              SkillNode.LockState = BranchInfo[NodeIdx].LockState
            end
          end
        end
      end
    end
    _SetUpModForTarget(DummyAvatar, Char, CharInfo)
    _AddCharToDummyAvatar(DummyAvatar, Char, CharInfo)
    local CommonChar = DummyAvatar.CommonChars[Char.CharId]
    local AppearanceSuit = CharInfo.AppearanceSuit
    if AppearanceSuit then
      CommonChar:AddSkin(AppearanceSuit.SkinId)
      local Skin = CommonChar:GetSkin(AppearanceSuit.SkinId)
      local CurrentPlanIndex = Skin.CurrentPlanIndex or 1
      if Skin then
        for i, value in pairs(AppearanceSuit.Colors or {}) do
          Skin.Colors[CurrentPlanIndex][i] = value
        end
        Skin.IsShowPartMesh = AppearanceSuit.IsShowPartMesh
      end
    end
  end
  for i, WeaponInfo in ipairs(_Params.WeaponInfos or {}) do
    local Weapon = _DummyAvatarCreateWeapon(_NextUuid(), WeaponInfo.WeaponId, WeaponInfo.Level, 1, WeaponInfo.ModSuitIndex)
    Weapon.Exp = WeaponInfo.Exp
    Weapon.GradeLevel = WeaponInfo.GradeLevel
    Weapon.EnhanceLevel = WeaponInfo.EnhanceLevel
    local AppearanceInfo = WeaponInfo.AppearanceInfo or {
      Colors = {},
      AccessoryId = -1
    }
    local Appearance = Weapon:GetAppearance()
    if Appearance then
      Appearance.Accessory = Appearance.Accessory or {}
      Appearance.Accessory[1] = AppearanceInfo.AccessoryId
      if AppearanceInfo.SkinId then
        Appearance.SkinId = AppearanceInfo.SkinId
        if Appearance.SkinId > 0 then
          Weapon:AddSkin(Appearance.SkinId)
        end
      end
    end
    local Skin = Weapon:GetCurrentSkin()
    if Skin then
      for key, value in pairs(Skin.SpecialColor) do
        Skin.SpecialColor[key] = AppearanceInfo.Colors.SpecialColor or Skin.SpecialColor[key]
      end
      local Colors = AppearanceInfo.Colors.Colors
      if Colors then
        for key, value in pairs(Colors) do
          for PlanIdx, _ in pairs(Skin.Colors) do
            Skin.Colors[PlanIdx][key] = value
          end
        end
      end
    end
    _SetUpModForTarget(DummyAvatar, Weapon, WeaponInfo)
    _AddWeaponToDummyAvatar(DummyAvatar, Weapon, WeaponInfo)
  end
  for i, UWeaponInfo in ipairs(_Params.UWeaponInfos or {}) do
    local UWeapon
    if DummyAvatar.WeaponId2UWeapon[UWeaponInfo.WeaponId] then
      UWeapon = DummyAvatar.WeaponId2UWeapon[UWeaponInfo.WeaponId]
      UWeapon.ModSuitIndex = UWeaponInfo.ModSuitIndex
      UWeapon.Level = UWeaponInfo.Level
    else
      UWeapon = _DummyAvatarCreateUWeapon(UWeaponInfo.WeaponId, UWeaponInfo.Level, UWeaponInfo.EnhanceLevel, UWeaponInfo.ModSuitIndex)
    end
    UWeapon.Exp = UWeaponInfo.Exp
    UWeapon.GradeLevel = UWeaponInfo.GradeLevel
    UWeapon.EnhanceLevel = UWeaponInfo.EnhanceLevel
    _SetUpModForTarget(DummyAvatar, UWeapon, UWeaponInfo)
    DummyAvatar.UWeapons[UWeapon.Uuid] = UWeapon
  end
  for i, PetInfo in ipairs(_Params.PetInfos or {}) do
    local Pet = _DummyAvatarCreatePet(PetInfo.PetId, _NextUuid())
    Pet.Level = PetInfo.Level or 1
    Pet.Exp = PetInfo.Exp or 0
    Pet.BreakNum = PetInfo.BreakNum or 0
    Pet.Name = PetInfo.Name or ""
    if PetInfo.EntryIds then
      for index, value in ipairs(PetInfo.EntryIds) do
        Pet.Entry[index] = value
      end
    end
    _AddPetToDummyAvatar(DummyAvatar, Pet, PetInfo)
  end
end

function M:CreateDummyAvatar(Params)
  if Params.CharIds or Params.WeaponIds or Params.PetIds then
    self.DummyAvatar_Prime = {}
    self.DummyAvatar_Max = {}
    _CreateDummyAvatarPrime(self.DummyAvatar_Prime, Params)
    _CreateDummyAvatarMax(self.DummyAvatar_Max, Params)
  end
  self:CreateDummyAvatarByDumpInfo(Params)
end

function M:CreateNewDummyAvatar(State, Params)
  local DummyAvatar = {}
  if State == self.PreviewTargetStates.Prime then
    _CreateDummyAvatarPrime(DummyAvatar, Params)
  elseif State == self.PreviewTargetStates.Max then
    _CreateDummyAvatarMax(DummyAvatar, Params)
  elseif State == self.PreviewTargetStates.Custom then
    self._CreateDummyAvatarCustom(DummyAvatar, Params)
  end
  return DummyAvatar
end

function M:CreateDummyAvatarByDumpInfo(Params)
  if Params.CharInfos or Params.WeaponInfos or Params.PetInfos then
    self.DummyAvatar_Custom = {}
    self._CreateDummyAvatarCustom(self.DummyAvatar_Custom, Params)
  end
end

function M:SetTemporaryAvatar(Avatar)
  self.TemporaryAvatar = Avatar
end

function M:GetAvatar()
  return self.TemporaryAvatar or self:GetDummyAvatar() or GWorld:GetAvatar()
end

function M:HasAvatar(PreviewTargetState)
  if PreviewTargetState == self.PreviewTargetStates.Prime then
    return not not self.DummyAvatar_Prime
  elseif PreviewTargetState == self.PreviewTargetStates.Max then
    return not not self.DummyAvatar_Max
  elseif PreviewTargetState == self.PreviewTargetStates.Custom then
    return not not self.DummyAvatar_Custom
  end
end

function M:GetPhantomWeaponUuid(PhantomResourceId)
  local Avatar = self:GetAvatar()
  local PhantomResource = Avatar.Resources[PhantomResourceId]
  return PhantomResource and PhantomResource.WeaponUuid
end

function M:GetCharByUuid(Uuid)
  local Avatar = self:GetAvatar()
  return Avatar.Chars[Uuid]
end

function M:GetWeaponByUuid(Uuid)
  local Avatar = self:GetAvatar()
  return Avatar.Weapons[Uuid] or Avatar.UWeapons[Uuid]
end

function M:GetCharNoneAccessoryIconPaths()
  local AccessoryIconPaths = {}
  for _, value in pairs(CommonConst.CharAccessoryTypes) do
    AccessoryIconPaths[value] = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Fashion_" .. value .. ".T_Tab_Fashion_" .. value
  end
  return AccessoryIconPaths
end

function M:InsertWeaponTypeImpl(WeaponId, AttrTable)
  local WeaponTypeKey = "WeaponType"
  local AttrConfigData = DataMgr.AttrConfig[WeaponTypeKey]
  if not AttrConfigData or not AttrConfigData.ShowInInspector then
    return
  end
  local MeleeTags, MeleeTagNames, RangedTags, RangedTagNames = UIUtils.GetAllWeaponTags()
  local WeaponTags, WeaponTagNames
  local BattleWeaponData = DataMgr.BattleWeapon[WeaponId]
  local WeaponTagData = BattleWeaponData.WeaponTag
  
  local function HasTag(Tag)
    for _, value in pairs(WeaponTagData) do
      if Tag == value then
        return true
      end
    end
    return false
  end
  
  local WeaponTag
  if HasTag("Melee") then
    WeaponTags, WeaponTagNames = MeleeTags, MeleeTagNames
  else
    WeaponTags, WeaponTagNames = RangedTags, RangedTagNames
  end
  for _, value in ipairs(WeaponTags) do
    if HasTag(value) then
      WeaponTag = value
      break
    end
  end
  if WeaponTag then
    for index, value in ipairs(WeaponTags) do
      if WeaponTag == value then
        AttrTable[WeaponTypeKey] = GText(WeaponTagNames[index])
        break
      end
    end
  end
end

function M:InitAllCharRecordReddot()
  local EMCache = require("EMCache.EMCache")
  if not EMCache then
    return false
  end
  local Avatar = GWorld:GetAvatar()
  local IsInit = EMCache:Get("IsInitCharRecord", true)
  local CharModel = require("BluePrints.Common.MVC.Model.CharModel")
  for ID, Char in pairs(Avatar.Chars) do
    local CharId = Char.CharId
    if DataMgr.CharacterDataTarget[CharId] == nil then
    else
      local CharNodeName = table.concat({
        M.FilesTabType[2],
        CharId
      }, "_")
      local CharNode = ReddotManager.GetTreeNode(CharNodeName)
      local LeafNodes = {}
      local SubTabNodes = {}
      for RecordType, _ in pairs(DataMgr.CharRecordType) do
        local SubTabNodeName = table.concat({CharNodeName, RecordType}, "_")
        LeafNodes[RecordType] = {}
        SubTabNodes[SubTabNodeName] = {
          1,
          nil,
          nil
        }
      end
      for RecordId, Value in pairs(DataMgr.CharacterDataTarget[CharId]) do
        local RecordNodeName = table.concat({
          M.FilesTabType[2],
          CharId,
          Value.CharDataType,
          RecordId
        }, "_")
        local RecordNode = ReddotManager.AddNodeEx(RecordNodeName, nil, 1, nil)
        local RecordTpe = Value.CharDataType
        if LeafNodes[RecordTpe] then
          LeafNodes[RecordTpe][RecordNodeName] = {
            1,
            nil,
            nil
          }
        else
          ScreenPrint("CharacterDataTarget\232\161\168\233\135\140\229\161\171\231\154\132CharDataType\230\178\161\230\156\137\229\156\168CharRecordType\232\161\168\233\135\140\230\137\190\229\136\176\239\188\140\232\175\183\231\173\150\229\136\146\230\163\128\230\159\165")
        end
        if not IsInit and M.CheckCharRecoedUnlock(self, CharId, RecordId, CharModel) then
          local RecordNodeCache = ReddotManager.GetLeafNodeCacheDetail(RecordNodeName)
          if RecordNodeCache then
            RecordNodeCache.IsRead = true
          end
        end
      end
      for RecordType, DataNodes in pairs(LeafNodes) do
        local SubTabNodeName = table.concat({CharNodeName, RecordType}, "_")
        ReddotManager.AddNodeEx(SubTabNodeName, DataNodes)
      end
      ReddotManager.AddNodeEx(CharNodeName, SubTabNodes)
    end
  end
  if not IsInit then
    EMCache:Set("IsInitCharRecord", true, true)
  end
end

function M:CreatCharRecordReddotNode(CharId)
  if DataMgr.CharacterDataTarget[CharId] == nil then
    return
  end
  local CharNodeName = table.concat({
    M.FilesTabType[2],
    CharId
  }, "_")
  local CharNode = ReddotManager.GetTreeNode(CharNodeName)
  local LeafNodes = {}
  local SubTabNodes = {}
  for RecordType, _ in pairs(DataMgr.CharRecordType) do
    local SubTabNodeName = table.concat({CharNodeName, RecordType}, "_")
    LeafNodes[RecordType] = {}
    SubTabNodes[SubTabNodeName] = {
      1,
      nil,
      nil
    }
  end
  for RecordId, Value in pairs(DataMgr.CharacterDataTarget[CharId]) do
    local RecordNodeName = table.concat({
      M.FilesTabType[2],
      CharId,
      Value.CharDataType,
      RecordId
    }, "_")
    local RecordNode = ReddotManager.AddNodeEx(RecordNodeName, nil, 1, nil)
    local RecordTpe = Value.CharDataType
    if LeafNodes[RecordTpe] then
      LeafNodes[RecordTpe][RecordNodeName] = {
        1,
        nil,
        nil
      }
    else
      ScreenPrint("CharacterDataTarget\232\161\168\233\135\140\229\161\171\231\154\132CharDataType\230\178\161\230\156\137\229\156\168CharRecordType\232\161\168\233\135\140\230\137\190\229\136\176\239\188\140\232\175\183\231\173\150\229\136\146\230\163\128\230\159\165")
    end
  end
  for RecordType, DataNodes in pairs(LeafNodes) do
    local SubTabNodeName = table.concat({CharNodeName, RecordType}, "_")
    ReddotManager.AddNodeEx(SubTabNodeName, DataNodes)
  end
  ReddotManager.AddNodeEx(CharNodeName, SubTabNodes)
end

function M:InitCharRecoedReddotNode(CharId)
  local HeadNodeName = table.concat({
    M.FilesTabType[2],
    CharId
  }, "_")
  local HeadNode = ReddotManager.GetTreeNode(HeadNodeName)
  if not DataMgr.CharacterDataTarget[CharId] then
    return
  end
  DebugPrint("yklua ..InitCharRecoedReddotNode" .. CharId)
  if not HeadNode then
    DebugPrint("yklua..InitCharRecoedReddotNode" .. CharId .. "\229\136\155\229\187\186\230\161\163\230\161\136\232\138\130\231\130\185")
    self:CreatCharRecordReddotNode(CharId)
  end
  local bHavaTryCreateNode = false
  for RecordId, Value in pairs(DataMgr.CharacterDataTarget[CharId]) do
    local LeafNodeName = table.concat({
      M.FilesTabType[2],
      CharId,
      Value.CharDataType,
      RecordId
    }, "_")
    local LeafNode = ReddotManager.GetTreeNode(LeafNodeName)
    if not LeafNode and not bHavaTryCreateNode then
      DebugPrint("yklua..InitCharRecoedReddotNode" .. CharId .. "\229\136\155\229\187\186\230\161\163\230\161\136\232\138\130\231\130\185" .. LeafNodeName)
      self:CreatCharRecordReddotNode(CharId)
      bHavaTryCreateNode = true
    end
    LeafNode = ReddotManager.GetTreeNode(LeafNodeName)
    if not LeafNode then
      ScreenPrint("\229\136\155\229\187\186\231\186\162\231\130\185\228\191\161\230\129\175\229\164\177\232\180\165" .. CharId)
    else
      local LeftNodeCache = ReddotManager.GetLeafNodeCacheDetail(LeafNodeName)
      if LeftNodeCache and (LeftNodeCache.IsRead == true or LeftNodeCache.IsRead == false) then
      else
        local IsNotLock = self:CheckCharRecoedUnlock(CharId, RecordId)
        if IsNotLock then
          ReddotManager.ClearLeafNodeCount(LeafNodeName)
          LeftNodeCache.IsRead = false
          ReddotManager.IncreaseLeafNodeCount(LeafNodeName, 1)
        else
          ReddotManager.ClearLeafNodeCount(LeafNodeName)
          LeftNodeCache.IsRead = nil
        end
      end
    end
  end
end

function M:CheckCharRecoedUnlock(CharId, DataId, CharModel)
  local UnlockLevel = DataMgr.CharacterDataTarget[CharId][DataId].CharDataUnlockLevel
  local ConditionId = DataMgr.CharacterDataTarget[CharId][DataId].CharDataUnlockCondition
  local Avatar = GWorld:GetAvatar()
  local bIsLevelEnough
  if UnlockLevel then
    CharModel = CharModel or require("BluePrints.Common.MVC.Model.CharModel")
    local CharLevel
    local Uuid = CharModel:GetUuidByCharId(CharId)
    if Uuid then
      CharLevel = Avatar.Chars[Uuid].Level
    else
      CharLevel = 0
    end
    bIsLevelEnough = UnlockLevel <= CharLevel
  else
    bIsLevelEnough = true
  end
  if not bIsLevelEnough then
    return false
  end
  local bConditionEnough
  if ConditionId then
    bConditionEnough = ConditionUtils.CheckCondition(Avatar, ConditionId)
  else
    bConditionEnough = true
  end
  if bIsLevelEnough and bConditionEnough then
    return true
  end
  return false
end

return M
