local json = require("rapidjson")
local ModDatas = require("BluePrints.UI.WBP.Armory.Mod.Utils.ModDatas")
local ImportPayload = ModDatas.ImportPayload
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local Component = {}

function Component:StartImport(NewTarget)
  local PrevTarget = self:GetTarget()
  self.ImportData = ImportPayload.New()
  self.ImportData.PrevTarget = PrevTarget
  self:SetTarget(NewTarget)
end

function Component:StopImport()
  if not self:IsInImport() then
    return
  end
  local CallBack = self.ImportData.CallBack
  local PrevTarget = self.ImportData.PrevTarget
  self.ImportData = nil
  if CallBack then
    CallBack(-1)
  end
  self:SetTarget(PrevTarget)
  self:GenerateSlotUIDatas(1)
end

function Component:IsInImport()
  return self.ImportData ~= nil
end

function Component:CalcImportSlotsList(Target, Mod, bIgnorePolarity)
  local SortedSlots = {}
  if not Mod then
    return SortedSlots
  end
  for SlotId, Slot in pairs(Target.ModSuits[Target.ModSuitIndex]) do
    if self.ImportData.UsedSlots[SlotId] then
    elseif not self:IsSpecificSlotByMod(Mod, SlotId) then
    elseif not bIgnorePolarity and Mod.Polarity ~= CommonConst.NonePolarity and Slot.Polarity ~= CommonConst.NonePolarity and Slot.Polarity ~= Mod.Polarity then
    elseif 0 == Slot.Status then
      table.insert(SortedSlots, Slot)
    end
  end
  
  local function SortFunc(Slot1, Slot2)
    if Mod.Polarity == Slot1.Polarity and Mod.Polarity == Slot2.Polarity then
      return Slot1.SlotId < Slot2.SlotId
    end
    if Mod.Polarity == Slot1.Polarity then
      return true
    end
    if Mod.Polarity == Slot2.Polarity then
      return false
    end
    if Mod.Polarity ~= CommonConst.NonePolarity then
      if Slot1.Polarity == CommonConst.NonePolarity and Slot2.Polarity == CommonConst.NonePolarity then
        return Slot1.SlotId < Slot2.SlotId
      end
      if CommonConst.NonePolarity == Slot1.Polarity then
        return true
      end
      if CommonConst.NonePolarity == Slot2.Polarity then
        return false
      end
    end
    return Slot1.SlotId < Slot2.SlotId
  end
  
  table.sort(SortedSlots, SortFunc)
  return SortedSlots
end

function Component:CalcImportModList()
  local SortedModList = {}
  local Tag = self.TargetType
  for SlotId, SlotUIData in pairs(self.CurSlots) do
    if SlotUIData.ModEid then
      local Mod = self:GetMod(SlotUIData.ModEid)
      table.insert(SortedModList, {
        SlotId = SlotId,
        ModId = Mod.ModId,
        Polarity = SlotUIData:GetPolarity(),
        Level = Mod.Level,
        Cost = Mod.Cost,
        bNotOwned = SlotUIData.bNotOwned
      })
    end
  end
  
  local function SortFunc(ImportMod1, ImportMod2)
    if "Char" == Tag and 9 == ImportMod1.SlotId then
      return true
    end
    if "Char" == Tag and 9 == ImportMod2.SlotId then
      return false
    end
    if ImportMod1.Cost == ImportMod2.Cost then
      if ImportMod1.Polarity == ImportMod2.Polarity then
        return ImportMod1.ModId > ImportMod2.ModId
      end
      return ImportMod1.Polarity > ImportMod2.Polarity
    end
    return ImportMod1.Cost > ImportMod2.Cost
  end
  
  table.sort(SortedModList, SortFunc)
  return SortedModList
end

function Component:CacheSuitInfoCopyed()
  local Target = self:GetTarget()
  self.SuitInfoCopyed = {
    MsgCopyed = string.format(GText("UI_Chat_ModSuitFormat"), Target:GetName()),
    TypeName = Target:GetTypeName(),
    Uuid = Target.Uuid,
    SuitIndex = Target.ModSuitIndex
  }
  ULowEntryExtendedStandardLibrary.ClipboardSet(self.SuitInfoCopyed.MsgCopyed)
end

function Component:GetSuitInfoCopyed()
  return self.SuitInfoCopyed
end

function Component:IsModSuitInfoMsg(InMsgStr)
  local SuitInfoCopyed = self:GetSuitInfoCopyed()
  if not SuitInfoCopyed then
    return false
  end
  if InMsgStr ~= SuitInfoCopyed.MsgCopyed then
    return false
  end
  return true
end

function Component:GenerateModSuitInfoMsg()
  local SuitInfoCopyed = self:GetSuitInfoCopyed()
  local Table = AvatarUtils:GenerateModSuitInfo(self:GetAvatar(), SuitInfoCopyed.TypeName, SuitInfoCopyed.Uuid, SuitInfoCopyed.SuitIndex)
  if Table.ModsInfo then
    local bEmptySuit = true
    for _, ModInfo in pairs(Table.ModsInfo) do
      if ModInfo[2] then
        bEmptySuit = false
        break
      end
    end
    if bEmptySuit then
      return nil
    end
  end
  return ChatCommon.ModSuitCopyHeader .. json.encode(Table)
end

function Component:CreateDummyAvatarForCopyMode(ModSuitInfo)
  self.DummyAvatar_CopyMode = {}
  local TargetType = ModSuitInfo.TargetInfo[1]
  local TargetId = ModSuitInfo.TargetInfo[2]
  local Level = ModSuitInfo.TargetInfo[3]
  local EnhanceLevel = ModSuitInfo.TargetInfo[4]
  local GradeLevel = ModSuitInfo.TargetInfo[5]
  local ModData, SlotData = self:_DumpModData(ModSuitInfo)
  if TargetType == CommonConst.DataType.Char then
    ArmoryUtils._CreateDummyAvatarCustom(self.DummyAvatar_CopyMode, {
      CharInfos = {
        {
          RoleId = TargetId,
          Exp = 0,
          Level = Level,
          GradeLevel = GradeLevel,
          EnhanceLevel = EnhanceLevel,
          ModData = ModData,
          SlotData = SlotData,
          ModSuitIndex = 1
        }
      }
    })
    self:SetTarget(self:GetAvatar().Chars[1])
  elseif TargetType == CommonConst.DataType.Weapon then
    ArmoryUtils._CreateDummyAvatarCustom(self.DummyAvatar_CopyMode, {
      WeaponInfos = {
        {
          WeaponId = TargetId,
          Exp = 0,
          Level = Level,
          GradeLevel = GradeLevel,
          EnhanceLevel = EnhanceLevel,
          ModData = ModData,
          SlotData = SlotData,
          ModSuitIndex = 1
        }
      }
    })
    self:SetTarget(self:GetAvatar().Weapons[1])
  elseif TargetType == CommonConst.ArmoryTag.UWeapon then
    ArmoryUtils._CreateDummyAvatarCustom(self.DummyAvatar_CopyMode, {
      UWeaponInfos = {
        {
          WeaponId = TargetId,
          Exp = 0,
          Level = Level,
          GradeLevel = GradeLevel,
          EnhanceLevel = EnhanceLevel,
          ModData = ModData,
          SlotData = SlotData,
          ModSuitIndex = 1
        }
      }
    })
    self:SetTarget(self:GetAvatar().UWeapons[1])
  end
  self:CalcModSuitTotalCost(self:GetTarget(), 1, true)
end

function Component:_DumpModData(ModSuitInfo)
  local ModData, SlotData = {}, {}
  for SlotId, ModInfo in ipairs(ModSuitInfo.ModsInfo) do
    local SlotPolarity = ModInfo[1]
    local ModId = ModInfo[2]
    local ModLevel = ModInfo[3]
    local ModCardLevel = ModInfo[4]
    local OneSlotData = {
      SlotId = SlotId,
      Polarity = SlotPolarity,
      ModEid = ModId and SlotId or nil
    }
    table.insert(SlotData, OneSlotData)
    if ModId then
      local OneModData = {
        Uuid = SlotId,
        ModId = ModId,
        Level = ModLevel,
        CurrentModCardLevel = ModCardLevel
      }
      table.insert(ModData, OneModData)
    end
  end
  return ModData, SlotData
end

function Component:CreateModSuitCopyCode()
  local Target = self:GetTarget()
  local ModSuit = Target:GetModSuit()
  local CodeList = {}
  if self.TargetType == CommonConst.DataType.Char then
    table.insert(CodeList, "C")
  elseif self.TargetType == CommonConst.DataType.Weapon then
    table.insert(CodeList, "W")
  elseif self.TargetType == CommonConst.ArmoryTag.UWeapon then
    table.insert(CodeList, "U")
  end
  table.insert(CodeList, self:NumberToBase36(Target[self.TargetType .. "Id"], 4))
  for SlotId, SlotData in ipairs(ModSuit) do
    local Mod = self:GetMod(SlotData.ModEid)
    if Mod then
      table.insert(CodeList, self:NumberToBase36(Mod.ModId, 4))
    else
      table.insert(CodeList, self:NumberToBase36(0, 4))
    end
  end
  local Code = table.concat(CodeList)
  ULowEntryExtendedStandardLibrary.ClipboardSet(Code)
  return Code
end

function Component:CopyCodeToModSuitInfo(Code)
  local ModSuitInfo = {}
  local TargetInfo = {}
  local Pos = 1
  if Pos <= string.len(Code) then
    local TargetTypeCode = string.sub(Code, Pos, Pos)
    if "C" == TargetTypeCode then
      TargetInfo[1] = CommonConst.DataType.Char
    elseif "W" == TargetTypeCode then
      TargetInfo[1] = CommonConst.DataType.Weapon
    elseif "U" == TargetTypeCode then
      TargetInfo[1] = CommonConst.DataType.UWeapon
    else
      return
    end
    Pos = Pos + 1
  else
    return
  end
  if Pos + 3 <= string.len(Code) then
    local TargetIdCode = string.sub(Code, Pos, Pos + 3)
    TargetInfo[2] = self:Base36ToNumber(TargetIdCode)
    Pos = Pos + 4
  else
    return
  end
  TargetInfo[3] = 1
  TargetInfo[4] = 0
  TargetInfo[5] = 0
  TargetInfo[6] = "DummySuitName"
  local ModsInfo = {}
  while Pos + 3 <= string.len(Code) do
    local ModIdCode = string.sub(Code, Pos, Pos + 3)
    local ModId = self:Base36ToNumber(ModIdCode)
    local ModSlotInfo = {}
    if 0 == ModId then
      ModSlotInfo[1] = -1
    else
      local ModConf = DataMgr.Mod[ModId]
      if not ModConf then
        return
      end
      ModSlotInfo[1] = ModConf.Polarity
      ModSlotInfo[2] = ModId
      ModSlotInfo[3] = 0
      ModSlotInfo[4] = 0
    end
    table.insert(ModsInfo, ModSlotInfo)
    Pos = Pos + 4
  end
  ModSuitInfo.TargetInfo = TargetInfo
  ModSuitInfo.ModsInfo = ModsInfo
  return ModSuitInfo
end

return Component
