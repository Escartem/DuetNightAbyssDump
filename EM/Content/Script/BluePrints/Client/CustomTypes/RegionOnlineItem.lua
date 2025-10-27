local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local RegionOnlineItemBase = Class("RegionOnlineItemBase", CustomTypes.CustomAttr)
RegionOnlineItemBase.__Props__ = {
  UniqueId = prop.prop("Int", "client"),
  RegionOnlineItemId = prop.prop("Int", "client"),
  State = prop.prop("Int", "client"),
  OwnerAvatarEid = prop.prop("ObjId", "client"),
  RegionOnlineItemStartCD = prop.prop("Int", "client"),
  RegionMechanismId = prop.prop("Int", "client"),
  UseEid = prop.prop("ObjId", "client"),
  ChangeStateTime = prop.prop("Int", "client")
}

function RegionOnlineItemBase:Init(RegionOnlineItemId, OwnerAvatarEid, UniqueId, RegionMechanismId)
  self.UniqueId = UniqueId
  self.RegionOnlineItemId = RegionOnlineItemId
  self.OwnerAvatarEid = OwnerAvatarEid
  self.RegionMechanismId = RegionMechanismId
end

function RegionOnlineItemBase:ChangeOnlineItemState(UseEid, NewState)
  self.UseEid = UseEid
  self.State = NewState
  self.ChangeStateTime = TimeUtils.NowTime()
end

function RegionOnlineItemBase:LeaveOnlineItem()
  self.UseEid = nil
  self.State = 0
end

function RegionOnlineItemBase:GetChangeStateTime()
  return self.ChangeStateTime
end

function RegionOnlineItemBase:GetRegionOnlineItemId()
  return self.RegionOnlineItemId
end

function RegionOnlineItemBase:GetOwnerAvatarEid()
  return self.OwnerAvatarEid
end

function RegionOnlineItemBase:SetRegionOnlineItemStartCD(NewTime)
  self.RegionOnlineItemStartCD = NewTime
end

function RegionOnlineItemBase:GetRegionOnlineItemStartCD()
  return self.RegionOnlineItemStartCD
end

FormatProperties(RegionOnlineItemBase)
local RegionOnlineItemBaseDict = Class("RegionOnlineItemBaseDict", CustomTypes.CustomDict)
RegionOnlineItemBaseDict.KeyType = BaseTypes.Int
RegionOnlineItemBaseDict.ValueType = RegionOnlineItemBase

function RegionOnlineItemBaseDict:GetNewRegionOnlineItemBase(RegionOnlineItemId, OwnerAvatarEid, UniqueId, RegionMechanismId)
  if not self[UniqueId] then
    self[UniqueId] = self:NewRegionOnlineItemBase(RegionOnlineItemId, OwnerAvatarEid, UniqueId, RegionMechanismId)
  end
  return self[UniqueId]
end

function RegionOnlineItemBaseDict:GetRegionOnlineItemBase(UniqueId)
  return self[UniqueId]
end

function RegionOnlineItemBaseDict:NewRegionOnlineItemBase(RegionOnlineItemId, OwnerAvatarEid, UniqueId, RegionMechanismId)
  return RegionOnlineItemBase(RegionOnlineItemId, OwnerAvatarEid, UniqueId, RegionMechanismId)
end

local RegionOnlineItemAttr = Class("RegionOnlineItemAttr", CustomTypes.CustomAttr)
RegionOnlineItemAttr.__Props__ = {
  RegionOnlineItemBaseDict = prop.prop("RegionOnlineItemBaseDict", "client"),
  RegionOnlineItemId = prop.prop("Int", "client"),
  OwnerAvatarEid = prop.prop("ObjId", "client"),
  OnlineItemCount = prop.prop("Int", "client", 0)
}

function RegionOnlineItemAttr:Init(RegionOnlineItemId, OwnerAvatarEid)
  self.RegionOnlineItemId = RegionOnlineItemId
  self.OwnerAvatarEid = OwnerAvatarEid
  self.RegionOnlineItemBaseDict = RegionOnlineItemBaseDict()
end

function RegionOnlineItemAttr:AddRegionOnlineItem(RegionMechanismId)
  self.OnlineItemCount = (self.OnlineItemCount or 0) + 1
  self.RegionOnlineItemBaseDict:GetNewRegionOnlineItemBase(self.RegionOnlineItemId, self.OwnerAvatarEid, self.OnlineItemCount, RegionMechanismId)
end

function RegionOnlineItemAttr:GetRegionOnlineItemBase(UniqueId)
  return self.RegionOnlineItemBaseDict[UniqueId]
end

FormatProperties(RegionOnlineItemAttr)
local RegionOnlineItemDict = Class("RegionOnlineItemDict", CustomTypes.CustomDict)
RegionOnlineItemDict.KeyType = BaseTypes.Int
RegionOnlineItemDict.ValueType = RegionOnlineItemAttr

function RegionOnlineItemDict:GetNewRegionOnlineItemDict(RegionOnlineItemId, OwnerAvatarEid)
  if not self[RegionOnlineItemId] then
    self[RegionOnlineItemId] = self:NewRegionOnlineItemDict(RegionOnlineItemId, OwnerAvatarEid)
  end
  return self[RegionOnlineItemId]
end

function RegionOnlineItemDict:GetRegionOnlineItemDict(RegionOnlineItemId)
  return self[RegionOnlineItemId]
end

function RegionOnlineItemDict:NewRegionOnlineItemDict(RegionOnlineItemId, OwnerAvatarEid)
  return RegionOnlineItemAttr(RegionOnlineItemId, OwnerAvatarEid)
end

return {
  RegionOnlineItemDict = RegionOnlineItemDict,
  RegionOnlineItemAttr = RegionOnlineItemAttr,
  RegionOnlineItemBaseDict = RegionOnlineItemBaseDict,
  RegionOnlineItemBase = RegionOnlineItemBase
}
