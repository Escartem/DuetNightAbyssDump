local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local RegionBaseChangeAttr = Class("RegionBaseChangeAttr", CustomTypes.CustomAttr)
RegionBaseChangeAttr.__Props__ = {
  CanOpen = prop.prop("Bool", "save"),
  OpenState = prop.prop("Bool", "save"),
  StateId = prop.prop("Int", "save"),
  IsActive = prop.prop("Bool", "save"),
  TN = prop.prop("Float", "client")
}
FormatProperties(RegionBaseChangeAttr)
local RegionBaseDataAttr = Class("RegionBaseDataAttr", CustomTypes.CustomAttr)
RegionBaseDataAttr.__Props__ = {
  WorldRegionEid = prop.prop("Str", "save"),
  SubRegionId = prop.prop("Int", "save"),
  LevelName = prop.prop("Str", "save"),
  RegionDataType = prop.prop("Int", "save"),
  UnitId = prop.prop("Int", "save"),
  UnitType = prop.prop("Str", "save"),
  Rotation = prop.prop("Str2FloatDict", "save"),
  BornLocation = prop.prop("Str2FloatDict", "save"),
  State = prop.prop("RegionBaseChangeAttr", "save"),
  CreatorId = prop.prop("Int", "save"),
  RandomTableId = prop.prop("Int", "save"),
  RandomIdxInRule = prop.prop("Int", "save"),
  RandomCreatorId = prop.prop("Int", "save"),
  RandomRuleId = prop.prop("Int", "save"),
  ManualItemId = prop.prop("Int", "save"),
  RarelyId = prop.prop("Int", "save"),
  IsUnlimited = prop.prop("Bool", "save"),
  QuestChainId = prop.prop("Int", "save"),
  QuestId = prop.prop("Int", "save"),
  IsBonus = prop.prop("Bool", "save"),
  IsDead = prop.prop("Bool", "save")
}
FormatProperties(RegionBaseDataAttr)
local RegionBaseDataAttrDict = Class("RegionBaseDataAttrDict", CustomTypes.CustomDict)
RegionBaseDataAttrDict.KeyType = BaseTypes.Str
RegionBaseDataAttrDict.ValueType = RegionBaseDataAttr

function RegionBaseDataAttrDict:Init(inner)
  self.Super.Init(self, inner)
end

function RegionBaseDataAttrDict:NewRegionBaseDataAttr()
  return RegionBaseDataAttr()
end

function RegionBaseDataAttrDict:GetNewRegionBaseDataAttr(WorldRegionEid)
  if not self[WorldRegionEid] then
    self[WorldRegionEid] = self:NewRegionBaseDataAttr()
  end
  return self[WorldRegionEid]
end

local LevelBaseDataAttrDict = Class("LevelBaseDataAttrDict", CustomTypes.CustomDict)
LevelBaseDataAttrDict.KeyType = BaseTypes.Str
LevelBaseDataAttrDict.ValueType = RegionBaseDataAttrDict

function LevelBaseDataAttrDict:Init(inner)
  self.Super.Init(self, inner)
end

function LevelBaseDataAttrDict:NewRegionBaseDataAttrDict()
  return RegionBaseDataAttrDict()
end

function LevelBaseDataAttrDict:GetNewRegionBaseDataAttrDict(LevelName)
  if not self[LevelName] then
    self[LevelName] = self:NewRegionBaseDataAttrDict()
  end
  return self[LevelName]
end

local SubRegionBaseDataAttrDict = Class("SubRegionBaseDataAttrDict", CustomTypes.CustomDict)
SubRegionBaseDataAttrDict.KeyType = BaseTypes.Str
SubRegionBaseDataAttrDict.ValueType = LevelBaseDataAttrDict

function SubRegionBaseDataAttrDict:NewLevelBaseDataAttrDict()
  return LevelBaseDataAttrDict()
end

function SubRegionBaseDataAttrDict:GetNewLevelBaseDataAttrDict(SubRegionId)
  if not self[SubRegionId] then
    self[SubRegionId] = self:NewLevelBaseDataAttrDict()
  end
  return self[SubRegionId]
end

local LastRegionData = Class("LastRegionData", CustomTypes.CustomAttr)
LastRegionData.__Props__ = {
  RegionId = prop.prop("Int", "client save", 0),
  SelfLocation = prop.prop("FloatList", "client save"),
  SelfRotation = prop.prop("FloatList", "client save"),
  IsSojourns = prop.prop("Bool", "client save")
}

function LastRegionData:UpdatePlayerInfo(Info)
  if not Info then
    return
  end
  if not self:SetRegionId(Info.RegionId) then
    return
  end
  self:SetLocation(Info.Location)
  self:SetRotation(Info.Rotation)
end

function LastRegionData:SetRegionId(RegionId)
  if not RegionId or tonumber(RegionId) <= 0 then
    return false
  end
  self.RegionId = RegionId
  return true
end

function LastRegionData:GetLocation()
  local Location = {}
  Location.X = self.SelfLocation[1]
  Location.Y = self.SelfLocation[2]
  Location.Z = self.SelfLocation[3]
  return Location
end

function LastRegionData:RemoveSojourns()
  self.IsSojourns = false
end

function LastRegionData:GetSojourns()
  return self.IsSojourns
end

function LastRegionData:SetSojourns(CurrentSubRegionId)
  self.IsSojourns = true
end

function LastRegionData:GetRotation()
  local Rotation = {}
  Rotation.Pitch = self.SelfRotation[1]
  Rotation.Yaw = self.SelfRotation[2]
  Rotation.Roll = self.SelfRotation[3]
  return Rotation
end

function LastRegionData:SetLocation(Location)
  if not Location then
    return
  end
  self.SelfLocation[1] = Location.X
  self.SelfLocation[2] = Location.Y
  self.SelfLocation[3] = Location.Z
end

function LastRegionData:SetRotation(Rotation)
  if not Rotation then
    return
  end
  self.SelfRotation[1] = Rotation.Pitch
  self.SelfRotation[2] = Rotation.Yaw
  self.SelfRotation[3] = Rotation.Roll
end

FormatProperties(LastRegionData)
local PetRegionAttr = Class("PetRegionAttr", CustomTypes.CustomAttr)
PetRegionAttr.__Props__ = {
  WorldRegionEid = prop.prop("Str", "client save"),
  PetState = prop.prop("Int", "client save"),
  PetId = prop.prop("Int", "client save"),
  CaptureResetMode = prop.getter("Data", "CaptureResetMode"),
  SubRegionId = prop.prop("Int", "client save"),
  InteractiveFailTime = prop.prop("Int", "client save")
}

function PetRegionAttr:Init(WorldRegionEid)
  self.WorldRegionEid = WorldRegionEid
end

function PetRegionAttr:Data()
  return DataMgr.Pet[self.PetId]
end

function PetRegionAttr:SetWorldRegionEid(WorldRegionEid)
  self.WorldRegionEid = WorldRegionEid
end

function PetRegionAttr:SetSubRegionId(SubRegionId)
  self.SubRegionId = SubRegionId
end

function PetRegionAttr:SetPetId(PetId)
  self.PetId = PetId
end

function PetRegionAttr:SetInteractiveFailTime()
  self.InteractiveFailTime = TimeUtils.NowTime()
end

function PetRegionAttr:GetInteractiveFailTime()
  return self.InteractiveFailTime
end

function PetRegionAttr:SetPetState(NewState)
  self.PetState = NewState
end

function PetRegionAttr:IsFailer()
  return self.PetState == CommonConst.NpcPetState.InteractiveFail
end

function PetRegionAttr:IsSuccess()
  return self.PetState == CommonConst.NpcPetState.InteractiveSuccess
end

function PetRegionAttr:IsActive()
  return self.PetState == CommonConst.NpcPetState.Active
end

function PetRegionAttr:ResetPetStateActive()
  self.PetState = CommonConst.NpcPetState.Active
end

FormatProperties(PetRegionAttr)
local PetRegionAttrDict = Class("PetRegionAttrDict", CustomTypes.CustomDict)
PetRegionAttrDict.KeyType = BaseTypes.Str
PetRegionAttrDict.ValueType = PetRegionAttr

function PetRegionAttrDict:NewPetRegionAttr(WorldRegionEid)
  return PetRegionAttr(WorldRegionEid)
end

function PetRegionAttrDict:GetNewPetRegionAttr(WorldRegionEid)
  if not self[WorldRegionEid] then
    self[WorldRegionEid] = self:NewPetRegionAttr(WorldRegionEid)
  end
  return self[WorldRegionEid]
end

function PetRegionAttrDict:GetPetRegionAttr(WorldRegionEid)
  return self[WorldRegionEid]
end

return {
  LastRegionData = LastRegionData,
  RegionBaseDataAttrDict = RegionBaseDataAttrDict,
  LevelBaseDataAttrDict = LevelBaseDataAttrDict,
  RegionBaseDataAttr = RegionBaseDataAttr,
  SubRegionBaseDataAttrDict = SubRegionBaseDataAttrDict,
  RegionBaseChangeAttr = RegionBaseChangeAttr,
  PetRegionAttrDict = PetRegionAttrDict,
  PetRegionAttr = PetRegionAttr
}
