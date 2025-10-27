local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local Resource = Class("Resource", CustomTypes.CustomAttr)
Resource.__Props__ = {
  ResourceId = prop.prop("Int", "client save"),
  Count = prop.prop("Int", "client save"),
  Status = prop.prop("Int", "client save", 0),
  WeaponUuid = prop.prop("ObjId", "client save"),
  ResourceName = prop.getter("Data", "ResourceName"),
  Type = prop.getter("Data", "Type"),
  ResourceSType = prop.getter("Data", "ResourceSType"),
  Rarity = prop.getter("Data", "Rarity"),
  UseEffectType = prop.getter("Data", "UseEffectType"),
  UseParam = prop.getter("Data", "UseParam"),
  Description = prop.getter("Data", "Description"),
  Icon = prop.getter("Data", "Icon"),
  MaterialClassify = prop.getter("Data", "MaterialClassify"),
  ResourceToCoinType = prop.getter("Data", "ResourceToCoinType"),
  ResourceValue = prop.getter("Data", "ResourceValue"),
  BattleItemLimit = prop.getter("Data", "BattleItemLimit"),
  CreateMechanism = prop.getter("Data", "CreateMechanism")
}

function Resource:Init(ResourceId)
  if not ResourceId then
    return
  end
  self.ResourceId = ResourceId
end

function Resource:Data()
  return DataMgr.Resource[self.ResourceId]
end

function Resource:IsBattleItem()
  return self.Type == "BattleItem"
end

function Resource:IsInfiniteBattleItem()
  return self.Type == "InfiniteBattleItem"
end

function Resource:SubTypeIsGestureItem()
  if not self.ResourceSType then
    return false
  end
  return self.ResourceSType == "GestureItem"
end

function Resource:IsPhantomItem()
  return self.ResourceSType == "PhantomItem"
end

function Resource:AddCount(count)
  if type(count) == "number" and count > 0 then
    if self:IsInfiniteBattleItem() then
      self.Count = 1
    else
      self.Count = self.Count + count
    end
    return true
  end
  return false
end

function Resource:ReduceCount(count)
  if type(count) == "number" and count > 0 then
    if self:IsInfiniteBattleItem() then
      self.Count = 1
    else
      self.Count = self.Count - count
    end
    return true
  end
  return false
end

function Resource:IsLock()
  return self.Status == CommonConst.CommonStatus.Lock
end

function Resource:Lock()
  if not self:IsLock() then
    self.Status = CommonConst.CommonStatus.Lock
    return true
  end
  return false
end

function Resource:UnLock()
  if self:IsLock() then
    self.Status = CommonConst.CommonStatus.UnLock
    return true
  end
  return false
end

function Resource:GetStatus()
  return self.Status
end

FormatProperties(Resource)
local ResourceDict = Class("ResourceDict", CustomTypes.CustomDict)
ResourceDict.KeyType = BaseTypes.Int
ResourceDict.ValueType = Resource

function ResourceDict:NewResource(ResourceId)
  return Resource(ResourceId)
end

function ResourceDict:GetResource(ResourceId)
  if nil == self[ResourceId] then
    self[ResourceId] = self:NewResource(ResourceId)
  end
  return self[ResourceId]
end

function ResourceDict:QueryResourceCount(ResourceId)
  if nil == self[ResourceId] then
    return 0
  end
  return self[ResourceId].Count
end

function ResourceDict:ClearResource(ResourceId)
  self[ResourceId] = nil
end

return {Resource = Resource, ResourceDict = ResourceDict}
