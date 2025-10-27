local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local Skin = Class("Skin", CustomTypes.CustomAttr)
Skin.__Props__ = {
  SkinId = prop.prop("Int", "client save"),
  SkinType = prop.prop("Int", "client save"),
  CurrentPlanIndex = prop.prop("Int", "client save", 1),
  Colors = prop.prop("Int2IntListDict", "client save"),
  SpecialColor = prop.prop("IntList", "client save"),
  IsShowPartMesh = prop.prop("Bool", "client save", true)
}

function Skin:Init(SkinId, SkinType)
  if nil == SkinId or nil == SkinType then
    return
  end
  self.SkinId = SkinId
  self.SkinType = SkinType
  self:InitColor()
end

function Skin:SetShowPartMesh(NewValue)
  self.IsShowPartMesh = NewValue
end

function Skin:GetShowPartMesh()
  return self.IsShowPartMesh
end

function Skin:InitColor()
  self.CurrentPlanIndex = 1
  local MaxPart, MaxPlan, DefaultColor
  if 0 == self.SkinType then
    MaxPart = DataMgr.GlobalConstant.CharColorPart.ConstantValue
    MaxPlan = DataMgr.GlobalConstant.CharColorPlan.ConstantValue
    DefaultColor = DataMgr.GlobalConstant.CharDefaultColor.ConstantValue
  elseif 1 == self.SkinType then
    MaxPart = DataMgr.GlobalConstant.WeaponColorPart.ConstantValue
    MaxPlan = DataMgr.GlobalConstant.WeaponColorPlan.ConstantValue
    DefaultColor = DataMgr.GlobalConstant.WeaponDefaultColor.ConstantValue
    for i = 1, MaxPlan do
      self.SpecialColor[i] = DefaultColor
    end
  end
  for i = 1, MaxPlan do
    self.Colors[i] = {}
    for j = 1, MaxPart do
      self.Colors[i]:Append(DefaultColor)
    end
  end
end

function Skin:GetCurrentPlanIndex()
  return self.CurrentPlanIndex
end

function Skin:GetColors(PlanIndex)
  if PlanIndex and self.Colors[PlanIndex] then
    return self.Colors[PlanIndex]
  end
  return self.Colors[self.CurrentPlanIndex]
end

function Skin:GetWeaponSpecialColor(PlanIndex)
  if PlanIndex and self.SpecialColor[PlanIndex] then
    return self.SpecialColor[PlanIndex]
  end
  return self.SpecialColor[self.CurrentPlanIndex]
end

FormatProperties(Skin)
local SkinDict = Class("SkinDict", CustomTypes.CustomDict)
SkinDict.KeyType = BaseTypes.Int
SkinDict.ValueType = Skin

function SkinDict:NewSkin(SkinId, Type)
  return Skin(SkinId, Type)
end

function SkinDict:GetSkin(SkinId)
  return self[SkinId]
end

function SkinDict:GetNewSkin(SkinId, Type)
  if not self[SkinId] then
    self[SkinId] = self:NewSkin(SkinId, Type)
  end
  return self[SkinId]
end

local Appearance = Class("Appearance", CustomTypes.CustomAttr)
Appearance.__Props__ = {
  TargetId = prop.prop("Int", "client save"),
  TargetType = prop.prop("Int", "client save"),
  SkinId = prop.prop("Int", "client save"),
  Accessory = prop.prop("IntList", "client save"),
  IsCornerVisible = prop.prop("Bool", "client save"),
  AppearanceName = prop.prop("Str", "client save", "")
}

function Appearance:Init(TargetId, TargetType)
  self.TargetId = TargetId
  self.TargetType = TargetType
  self:InitDefaultSkin()
  self:InitAccessory()
end

function Appearance:InitDefaultSkin()
  local TargetInfo
  if self.TargetType == CommonConst.SkinType.Char then
    TargetInfo = DataMgr.Char[self.TargetId]
    self.IsCornerVisible = true
  elseif self.TargetType == CommonConst.SkinType.Weapon then
    self.SkinId = self.TargetId
  end
  if TargetInfo and TargetInfo.DefaultSkinId then
    self.SkinId = TargetInfo.DefaultSkinId
  end
end

function Appearance:UnloadCharSkin(SkinId, DefaultSkinId)
  if self.SkinId == DefaultSkinId then
    return
  end
  if self.SkinId == SkinId then
    self.SkinId = DefaultSkinId
  end
end

function Appearance:InitAccessory()
  if 0 == self.TargetType then
    for i = 1, 9 do
      self.Accessory:Append(-1)
    end
    self.IsShowPartMesh = true
  elseif 1 == self.TargetType then
    self.Accessory:Append(-1)
  end
end

FormatProperties(Appearance)
local AppearanceList = Class("AppearanceList", CustomTypes.CustomList)
AppearanceList.ValueType = Appearance

function AppearanceList:NewAppearance(TargetId, TargetType)
  local _Appearance = Appearance(TargetId, TargetType)
  return _Appearance
end

function AppearanceList:AddCharAppearance(TargetId)
  self:Append(self:NewAppearance(TargetId, CommonConst.SkinType.Char))
end

function AppearanceList:AddWeaponAppearance(TargetId)
  self:Append(self:NewAppearance(TargetId, CommonConst.SkinType.Weapon))
end

return {
  Skin = Skin,
  SkinDict = SkinDict,
  Appearance = Appearance,
  AppearanceList = AppearanceList
}
