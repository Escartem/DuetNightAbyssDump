local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local BGM = Class("BGM", CustomTypes.CustomAttr)
BGM.__Props__ = {
  BgmPath = prop.prop("Str", "client save"),
  BgmParam = prop.prop("Str", "client save"),
  BgmParamValue = prop.prop("Int", "client save"),
  BgmSubRegionId = prop.prop("IntList", "client save")
}
FormatProperties(BGM)
local BGMDict = Class("BGMDict", CustomTypes.CustomDict)
BGMDict.KeyType = BaseTypes.Int
BGMDict.ValueType = BGM

function BGMDict:GetNewBGM(BgmId)
  if not self[BgmId] then
    self[BgmId] = self:NewBGM()
  end
  return self[BgmId]
end

function BGMDict:NewBGM()
  return BGM()
end

local DisableWeapon = Class("DisableWeapon", CustomTypes.CustomAttr)
DisableWeapon.__Props__ = {
  bForbid = prop.prop("Bool", "client save"),
  ForbidTag = prop.prop("Str", "client save"),
  bHideWhenForbid = prop.prop("Bool", "client save")
}
FormatProperties(DisableWeapon)
local DisableWeaponDict = Class("DisableWeaponDict", CustomTypes.CustomDict)
DisableWeaponDict.KeyType = BaseTypes.Str
DisableWeaponDict.ValueType = DisableWeapon

function DisableWeaponDict:GetNewDisableWeapon(DisableWeaponName)
  if not self[DisableWeaponName] then
    self[DisableWeaponName] = self:NewDisableWeapon()
  end
  return self[DisableWeaponName]
end

function DisableWeaponDict:NewDisableWeapon()
  return DisableWeapon()
end

local PlayerCharacterSuit = Class("PlayerCharacterSuit", CustomTypes.CustomAttr)
PlayerCharacterSuit.__Props__ = {
  HideUIInScreen = prop.prop("Str2BoolDict", "client save"),
  BGM = prop.prop("BGMDict", "client save"),
  SwitchRole = prop.prop("Int", "client save", -1),
  DisableWeapon = prop.prop("DisableWeaponDict", "client save"),
  DisableSkill = prop.prop("Str2BoolDict", "client save"),
  MonsterFirstSeenGuide = prop.prop("Str2BoolDict", "client save"),
  SwitchStoryMode = prop.prop("Str2BoolDict", "client save"),
  ContinuedGuide = prop.prop("Str2BoolDict", "client save"),
  NpcHideShowTag = prop.prop("Str2BoolDict", "client save"),
  BGMParams = prop.prop("StrList", "client save")
}

function PlayerCharacterSuit:HandleNpcHideShowTag(SuitKey, Value)
  if Value then
    self.NpcHideShowTag:AddValue(SuitKey, Value)
  else
    self.NpcHideShowTag:RemoveValue(SuitKey)
  end
end

function PlayerCharacterSuit:HandleBGMParams(SuitKey, Values)
  self.BGMParams:Clear()
  if Values then
    for _, Value in ipairs(Values) do
      self.BGMParams:Append(Value)
    end
  end
end

function PlayerCharacterSuit:HandleHideUIInScreen(SuitKey, Value)
  if nil ~= Value then
    self.HideUIInScreen:AddValue(SuitKey, Value)
  else
    self.HideUIInScreen:RemoveValue(SuitKey)
  end
end

function PlayerCharacterSuit:HandleContinuedGuide(SuitKey, Value)
  if nil ~= Value then
    self.ContinuedGuide:AddValue(SuitKey, Value)
  else
    self.ContinuedGuide:RemoveValue(SuitKey)
  end
end

function PlayerCharacterSuit:HandleBGM(SuitKey, Value)
  if nil ~= Value then
    local NewBgm = self.BGM:GetNewBGM(SuitKey)
    NewBgm.BgmPath = Value[1]
    NewBgm.BgmParam = Value[2]
    NewBgm.BgmParamValue = Value[3]
    NewBgm.BgmSubRegionId = Value[4]
  else
    self.BGM:RemoveValue(SuitKey)
  end
end

function PlayerCharacterSuit:HandleSwitchRole(SuitKey, Value)
  if nil ~= Value then
    self.SwitchRole = Value
  else
    self.SwitchRole = -1
  end
end

function PlayerCharacterSuit:HandleDisableWeapon(SuitKey, Value)
  if nil ~= Value then
    local TDisableWeapon = self.DisableWeapon:GetNewDisableWeapon(SuitKey)
    TDisableWeapon.bForbid = Value[1]
    TDisableWeapon.ForbidTag = Value[2]
    TDisableWeapon.bHideWhenForbid = Value[3]
    self.DisableWeapon:AddValue(SuitKey, TDisableWeapon)
  else
    self.DisableWeapon:RemoveValue(SuitKey)
  end
end

function PlayerCharacterSuit:HandleDisableSkill(SuitKey, Value)
  if nil ~= Value then
    self.DisableSkill:AddValue(SuitKey, Value)
  else
    self.DisableSkill:RemoveValue(SuitKey)
  end
end

function PlayerCharacterSuit:HandleMonsterFirstSeenGuide(SuitKey, Value)
  if nil ~= Value then
    self.MonsterFirstSeenGuide:AddValue(SuitKey, Value)
  else
    self.MonsterFirstSeenGuide:RemoveValue(SuitKey)
  end
end

function PlayerCharacterSuit:HandleSwitchStoryMode(SuitKey, Value)
  if nil ~= Value then
    self.SwitchStoryMode:AddValue(SuitKey, Value)
  else
    self.SwitchStoryMode:RemoveValue(SuitKey)
  end
end

function PlayerCharacterSuit:UpdateSuitBase(SuitSubType, SuitKey, Value)
  local HandleSuitSubTypeFunName = "Handle" .. SuitSubType
  if not self[HandleSuitSubTypeFunName] then
    return false
  end
  self[HandleSuitSubTypeFunName](self, SuitKey, Value)
  return true
end

function PlayerCharacterSuit:GetSubSuitBase(SubSuitType)
  local GetSuitTypeFunName = "Get" .. SubSuitType .. "SuitBase"
  return self[GetSuitTypeFunName](self)
end

function PlayerCharacterSuit:GetContinuedGuideSuitBase()
  return self.ContinuedGuide
end

function PlayerCharacterSuit:GetNpcHideShowTagSuitBase()
  return self.NpcHideShowTag
end

function PlayerCharacterSuit:GetBGMSuitBase()
  return self.BGM
end

function PlayerCharacterSuit:GetDisableWeaponSuitBase()
  return self.DisableWeapon
end

function PlayerCharacterSuit:GetDisableSkillSuitBase()
  return self.DisableSkill
end

function PlayerCharacterSuit:GetSwitchRoleSuitBase()
  return self.SwitchRole
end

function PlayerCharacterSuit:GetSwitchStoryModeSuitBase()
  return self.SwitchStoryMode
end

function PlayerCharacterSuit:GetHideUIInScreenSuitBase()
  return self.HideUIInScreen
end

function PlayerCharacterSuit:GetMonsterFirstSeenGuideSuitBase()
  return self.MonsterFirstSeenGuide
end

function PlayerCharacterSuit:GetBGMParamsSuitBase()
  return self.BGMParams
end

FormatProperties(PlayerCharacterSuit)
local GameModeSuit = Class("GameModeSuit", CustomTypes.CustomAttr)
GameModeSuit.__Props__ = {
  DropRule = prop.prop("Int2BoolDict", "client save")
}

function GameModeSuit:HandleDropRule(SuitKey, Value)
  if nil ~= Value then
    self.DropRule:AddValue(SuitKey, Value)
  else
    self.DropRule:RemoveValue(SuitKey)
  end
end

function GameModeSuit:GetSubSuitBase(SubSuitType)
  local GetSuitTypeFunName = "Get" .. SubSuitType .. "SuitBase"
  return self[GetSuitTypeFunName](self)
end

function GameModeSuit:GetDropRuleSuitBase()
  return self.DropRule
end

function GameModeSuit:UpdateSuitBase(SuitSubType, SuitKey, Value)
  local HandleSuitSubTypeFunName = "Handle" .. SuitSubType
  if not self[HandleSuitSubTypeFunName] then
    return false
  end
  self[HandleSuitSubTypeFunName](self, SuitKey, Value)
  return true
end

FormatProperties(GameModeSuit)
local Suits = Class("Suits", CustomTypes.CustomAttr)
Suits.__Props__ = {
  GameModeSuit = prop.prop("GameModeSuit", "client save"),
  PlayerCharacterSuit = prop.prop("PlayerCharacterSuit", "client save")
}

function Suits:GetGameModeSuit()
  return self.GameModeSuit
end

function Suits:GetPlayerCharacterSuit()
  return self.PlayerCharacterSuit
end

function Suits:GetSuitBase(SuitType)
  local HandleSuitTypeFunName = "Get" .. SuitType
  return self[HandleSuitTypeFunName](self)
end

FormatProperties(Suits)
return {
  BGM = BGM,
  BGMDict = BGMDict,
  PlayerCharacterSuit = PlayerCharacterSuit,
  GameModeSuit = GameModeSuit,
  Suits = Suits,
  DisableWeaponDict = DisableWeaponDict,
  DisableWeapon = DisableWeapon
}
