require("UnLua")
local SkillUtils = require("Utils.SkillUtils")
local Component = Class({
  "BluePrints.Combat.Components.CampComponent",
  "BluePrints.Combat.Components.EffectSourceAttrLogic",
  "BluePrints.Combat.Components.EffectSourceAttrOperate",
  "BluePrints.Common.TimerMgr"
})

function Component:GetEid()
  return self:GetEid_Lua()
end

function Component:GetEid_Lua()
  return self.Eid
end

function Component:OnDead_Lua(...)
  self:OnDead(...)
end

function Component:GetLevelTable()
  if self.IsCharacter and self:IsCharacter() then
    return DataMgr.LevelUp
  else
    return DataMgr.WeaponLevelUp
  end
end

function Component:SetLevel(Level)
  if nil == Level then
    return
  end
  local LevelUpTable = self:GetLevelTable()
  local LevelUpInfo = LevelUpTable[Level]
  if nil == LevelUpInfo then
    return
  end
  self:SetAttr("Level", Level)
end

function Component:SetTimeDilationByBattle(TimeDilation, bPause)
  if not bPause then
    self:SetCanNotChangeTimeDilation(false)
    if self:IsPlayer() then
      self:RemoveDisableInputTag("BattlePause")
    end
  end
  self:SetTimeDilation(TimeDilation, true)
  if bPause then
    self:SetCanNotChangeTimeDilation(true)
    if self:IsPlayer() then
      self:AddDisableInputTag("BattlePause")
      self:ClearInputCache()
    end
  end
  if self.PassiveEffects then
    for _, PassiveEffect in pairs(self.PassiveEffects) do
      PassiveEffect.CustomTimeDilation = TimeDilation
    end
  end
  Battle(self).CustomTimeDilation = TimeDilation
end

function Component:ApplyHitPerformLiftHeight(Source, Content)
  if not Content.LiftHeight or not Content.LiftTime then
    return
  end
  if not self.GetMovementComponent then
    return
  end
  if self:GetMovementComponent().MovementMode == EMovementMode.MOVE_None then
    return
  end
  if self:GetMovementComponent().MovementMode == EMovementMode.MOVE_Flying then
    return
  end
  self:GetMovementComponent():SetMovementMode(EMovementMode.MOVE_Flying)
  self.LiftHeightDuration = Content.LiftTime
  self.LiftHeightDeltaValue = Content.LiftHeight / Content.LiftTime
  self:GetMovementComponent().bSkipLaunchSetFalling = true
end

function Component:GetMaxBloodVolume()
  return self:GetAttr("MaxHp")
end

function Component:GetCurrentBloodVolume()
  return self:GetAttr("Hp")
end

function Component:SetAttrByAttrData(RealAttrName, AttrData, RateIndex, ModId, ModLevel, ReverseValue)
  if AttrData.Rate then
    local FinalRate
    if type(AttrData.Rate) == "string" then
      AttrData = SkillUtils.GrowProxyBySkillLevel("Mod", ModId, tonumber(ModLevel), AttrData)
      FinalRate = AttrData.Rate
    else
      FinalRate = AttrData.Rate + (AttrData.LevelGrow or 0) * ModLevel
    end
    if ReverseValue then
      FinalRate = -FinalRate
    end
    DebugPrint("Rate:", FinalRate)
    FinalRate = FinalRate + self:GetRateAttr(RealAttrName, "Mod", RateIndex)
    self:SetRateAttr(RealAttrName, "Mod", RateIndex, FinalRate)
  end
  if AttrData.Value then
    local FinalValue
    if "string" == type(AttrData.Value) then
      AttrData = SkillUtils.GrowProxyBySkillLevel("Mod", ModId, tonumber(ModLevel), AttrData)
      FinalValue = AttrData.Value
    else
      FinalValue = AttrData.Value + (AttrData.LevelGrow or 0) * ModLevel
    end
    if ReverseValue then
      FinalValue = -FinalValue
    end
    DebugPrint("Value:", FinalValue)
    FinalValue = FinalValue + self:GetAddAttr(RealAttrName, "Mod")
    self:SetAddAttr(RealAttrName, "Mod", FinalValue)
  end
end

function Component:SetAttrByMod(ModId, ModLevel, ReverseValue)
  ModLevel = ModLevel or 0
  local ModData = DataMgr.Mod[ModId]
  local AddAttrs = ModData.AddAttrs
  if AddAttrs then
    for Index, AttrData in pairs(AddAttrs) do
      local UniqueId = table.concat({
        "Mod:[",
        ModId,
        "]AddAttrs:[",
        Index,
        "]"
      })
      local AttrName = AvatarUtils:GetAttrNameFromAttrData(AttrData, UniqueId)
      if "ATK" == AttrName then
        for _AttrName, _ in pairs(DataMgr.Attribute) do
          local RealAttrName = "ATK_" .. _AttrName
          self:SetAttrByAttrData(RealAttrName, AttrData, CommonConst.RateIndex.GlobalATK, ModId, ModLevel, ReverseValue)
        end
      else
        self:SetAttrByAttrData(AttrName, AttrData, CommonConst.RateIndex.Default, ModId, ModLevel, ReverseValue)
      end
      local FuncName = "On" .. AttrName .. "ChangedByMod"
      if self[FuncName] then
        self[FuncName](self)
      end
      self:UpdateDamageRateAttr(AttrName)
      self:SetAllWeaponModifier(AttrName)
    end
  end
  self:CalcATK()
end

function Component:GetCurrentWeaponAttr(AttrName, DefaultValue)
  if self.GetCurrentWeapon then
    local Weapon = self:GetCurrentWeapon()
    if Weapon then
      return Weapon:GetAttr(AttrName) or DefaultValue
    end
  end
  return DefaultValue
end

function Component:OnDropDistanceChangedByMod()
  if self.InteractiveTriggerComponent then
    self:SetInteractiveTriggerDistance(self:GetAttr("DropDistance"))
  end
end

function Component:GetEMObject(EMObjectClassName)
  local EMObject = self.Overridden.GetEMObject(self, EMObjectClassName)
  return EMObject
end

return Component
