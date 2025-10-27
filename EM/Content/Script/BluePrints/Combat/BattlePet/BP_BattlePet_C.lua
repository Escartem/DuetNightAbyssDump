local SkillUtils = require("Utils.SkillUtils")
local BP_BattlePet_C = Class()

function BP_BattlePet_C:ApplyAddAttrs()
  self.Overridden.ApplyAddAttrs(self)
  local AddAttrs = DataMgr.BattlePet[self.BattlePetId].AddAttrs
  if not AddAttrs then
    return
  end
  local PhantomTeammate = self.PetMaster:GetPhantomTeammates()
  for i = 1, PhantomTeammate:Length() do
    local Character = PhantomTeammate:GetRef(i)
    if Character:IsPlayer() or Character.IsSpawnByResource or Character.IsSpawnByGM or Character.IsSpawnBySquad then
      for Index = 1, #AddAttrs do
        local AttrData = AddAttrs[Index]
        local PetLevel = 0 ~= self.PetLevel and self.PetLevel or 1
        AttrData = SkillUtils.GrowProxyBySkillLevel("BattlePet", self.BattlePetId, PetLevel, AttrData)
        local UniqueId = table.concat({
          "Pet:[",
          self.BattlePetId,
          "]AddAttrs:[",
          Index,
          "]"
        })
        local AttrName = AvatarUtils:GetAttrNameFromAttrData(AttrData, UniqueId)
        local Rate = AttrData.Rate
        local Value = AttrData.Value
        if "ATK" == AttrName then
          for _AttrName, _ in pairs(DataMgr.Attribute) do
            if Rate then
              Character:SetRateAttr("ATK_" .. _AttrName, "PetAddAttrs", CommonConst.RateIndex.GlobalATK, Rate)
            end
          end
        else
          if Rate then
            Character:SetRateAttr(AttrName, "PetAddAttrs", CommonConst.RateIndex.Default, Rate)
          end
          if Value then
            Character:SetAddAttr(AttrName, "PetAddAttrs", Value)
          end
        end
        local FuncName = "On" .. AttrName .. "ChangedByMod"
        if Character[FuncName] then
          Character[FuncName](Character)
        end
        Character:UpdateDamageRateAttr(AttrName)
        Character:SetAllWeaponModifier(AttrName)
      end
      Character:CalcATK()
    end
  end
end

function BP_BattlePet_C:ApplyAddAttrsByAffixId(AffixId)
  local PetEntryConfig = DataMgr.PetEntry[AffixId]
  if not PetEntryConfig then
    return
  end
  local AddAttrs = DataMgr.BattlePet[PetEntryConfig.BattlePetID] and DataMgr.BattlePet[PetEntryConfig.BattlePetID].AddAttrs
  if not AddAttrs then
    return
  end
  local BattlePetId = PetEntryConfig.BattlePetID
  local PhantomTeammate = self.PetMaster:GetPhantomTeammates()
  for i = 1, PhantomTeammate:Length() do
    local Character = PhantomTeammate:GetRef(i)
    if Character:IsPlayer() or Character.IsSpawnByResource or Character.IsSpawnByGM or Character.IsSpawnBySquad then
      for Index = 1, #AddAttrs do
        local AttrData = AddAttrs[Index]
        local PetLevel = PetEntryConfig.BattlePetLevel or 1
        AttrData = SkillUtils.GrowProxyBySkillLevel("BattlePet", BattlePetId, PetLevel, AttrData)
        local UniqueId = table.concat({
          "Pet:[",
          AffixId,
          "]AddAttrs:[",
          Index,
          "]"
        })
        local AttrName = AvatarUtils:GetAttrNameFromAttrData(AttrData, UniqueId)
        local Rate = AttrData.Rate
        local Value = AttrData.Value
        if "ATK" == AttrName then
          for _AttrName, _ in pairs(DataMgr.Attribute) do
            if Rate then
              Character:SetRateAttr("ATK_" .. _AttrName, "PetAffixAddAttrs" .. BattlePetId, CommonConst.RateIndex.GlobalATK, Rate)
            end
          end
        else
          if Rate then
            Character:SetRateAttr(AttrName, "PetAffixAddAttrs" .. AffixId, CommonConst.RateIndex.Default, Rate)
          end
          if Value then
            Character:SetAddAttr(AttrName, "PetAffixAddAttrs" .. AffixId, Value)
          end
        end
        local FuncName = "On" .. AttrName .. "ChangedByMod"
        if Character[FuncName] then
          Character[FuncName](Character)
        end
        Character:UpdateDamageRateAttr(AttrName)
        Character:SetAllWeaponModifier(AttrName)
      end
      Character:CalcATK()
    end
  end
end

function BP_BattlePet_C:ApplyAttrToPhantom(Phantom)
  if not Phantom.IsSpawnByResource and not Phantom.IsSpawnByGM and not Phantom.IsSpawnBySquad then
    return
  end
  local AddAttrs = DataMgr.BattlePet[self.BattlePetId].AddAttrs
  if not AddAttrs then
    return
  end
  for Index = 1, #AddAttrs do
    local AttrData = AddAttrs[Index]
    local PetLevel = 0 ~= self.PetLevel and self.PetLevel or 1
    AttrData = SkillUtils.GrowProxyBySkillLevel("BattlePet", self.BattlePetId, PetLevel, AttrData)
    local AttrName = AttrData.AttrName
    if DataMgr.AttributeType[AttrName] then
      AttrName = AttrName .. "_Normal"
    end
    local Rate = AttrData.Rate
    local Value = AttrData.Value
    if "ATK" == AttrName then
      for _AttrName, _ in pairs(DataMgr.Attribute) do
        if Rate then
          Phantom:SetRateAttr("ATK_" .. _AttrName, "PetAddAttrs", CommonConst.RateIndex.GlobalATK, Rate)
        end
      end
    else
      if Rate then
        Phantom:SetRateAttr(AttrName, "PetAddAttrs", CommonConst.RateIndex.Default, Rate)
      end
      if Value then
        Phantom:SetAddAttr(AttrName, "PetAddAttrs", Value)
      end
    end
    local FuncName = "On" .. AttrName .. "ChangedByMod"
    if Phantom[FuncName] then
      Phantom[FuncName](Phantom)
    end
  end
  Phantom:CalcATK()
end

function BP_BattlePet_C:ResetAddAttrs()
  local AddAttrs = DataMgr.BattlePet[self.BattlePetId].AddAttrs
  if not AddAttrs then
    return
  end
  local PhantomTeammate = self.PetMaster:GetPhantomTeammates()
  for i = 1, PhantomTeammate:Length() do
    local Character = PhantomTeammate:GetRef(i)
    if Character:IsPlayer() or Character.IsSpawnByResource or Character.IsSpawnByGM or Character.IsSpawnBySquad then
      for Index = 1, #AddAttrs do
        local AttrData = AddAttrs[Index]
        local AttrName = AttrData.AttrName
        if DataMgr.AttributeType[AttrName] then
          AttrName = AttrName .. "_Normal"
        end
        local Rate = AttrData.Rate
        local Value = AttrData.Value
        if "ATK" == AttrName then
          for _AttrName, _ in pairs(DataMgr.Attribute) do
            if Rate then
              Character:SetRateAttr("ATK_" .. _AttrName, "PetAddAttrs", CommonConst.RateIndex.GlobalATK, 0)
            end
          end
        else
          if Rate then
            Character:SetRateAttr(AttrName, "PetAddAttrs", CommonConst.RateIndex.Default, 0)
          end
          if Value then
            Character:SetAddAttr(AttrName, "PetAddAttrs", 0)
          end
        end
        local FuncName = "On" .. AttrName .. "ChangedByMod"
        if Character[FuncName] then
          Character[FuncName](Character)
        end
        Character:UpdateDamageRateAttr(AttrName)
        Character:SetAllWeaponModifier(AttrName)
      end
      Character:CalcATK()
    end
  end
end

function BP_BattlePet_C:ResetAddAttrsById(AffixId)
  local PetEntryConfig = DataMgr.PetEntry[AffixId]
  if not PetEntryConfig then
    return
  end
  local AddAttrs = DataMgr.BattlePet[PetEntryConfig.BattlePetID].AddAttrs
  if not AddAttrs then
    return
  end
  local PhantomTeammate = self.PetMaster:GetPhantomTeammates()
  for i = 1, PhantomTeammate:Length() do
    local Character = PhantomTeammate:GetRef(i)
    if Character:IsPlayer() or Character.IsSpawnByResource or Character.IsSpawnByGM or Character.IsSpawnBySquad then
      for Index = 1, #AddAttrs do
        local AttrData = AddAttrs[Index]
        local AttrName = AttrData.AttrName
        if DataMgr.AttributeType[AttrName] then
          AttrName = AttrName .. "_Normal"
        end
        local Rate = AttrData.Rate
        local Value = AttrData.Value
        if "ATK" == AttrName then
          for _AttrName, _ in pairs(DataMgr.Attribute) do
            if Rate then
              Character:SetRateAttr("ATK_" .. _AttrName, "PetAffixAddAttrs" .. AffixId, CommonConst.RateIndex.GlobalATK, 0)
            end
          end
        else
          if Rate then
            Character:SetRateAttr(AttrName, "PetAffixAddAttrs" .. AffixId, CommonConst.RateIndex.Default, 0)
          end
          if Value then
            Character:SetAddAttr(AttrName, "PetAffixAddAttrs" .. AffixId, 0)
          end
        end
        local FuncName = "On" .. AttrName .. "ChangedByMod"
        if Character[FuncName] then
          Character[FuncName](Character)
        end
        Character:UpdateDamageRateAttr(AttrName)
        Character:SetAllWeaponModifier(AttrName)
      end
      Character:CalcATK()
    end
  end
end

return BP_BattlePet_C
