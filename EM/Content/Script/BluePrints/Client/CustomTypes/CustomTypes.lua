local ClassModule = _G.TypeClassModule
local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local PropUtils = require("BluePrints.Client.PropUtils")
local table = _ENV.table
local rawset = _ENV.rawset
local rawget = _ENV.rawget
local CustomType = Class("CustomType", BaseTypes.BaseType)
CustomType.IsBaseType = false
CustomType.IsCustomType = true

function CustomType:GetDefault()
  return self()
end

function CustomType.SetOwnerInfo(value, owner, prop)
  if owner._OnPropChange and owner._OnPropSet then
    rawset(value, "__Owner", owner)
    rawset(value, "__Prop", prop)
  end
end

local CustomAttr = Class("CustomAttr", CustomType)

function CustomAttr:load(data)
  local _type = ClassModule.IsClass(self) and self or self.__Class__
  if ClassModule.IsInstance(data, _type) then
    return data
  end
  local object = _type:__New__()
  for key, value in pairs(data) do
    local prop = _type.Props[key]
    if prop then
      object.Props[key] = prop:GetTypeInstance(value)
    end
  end
  object:_Init()
  return object
end

function CustomAttr:save_dump(value)
  if nil == value then
    return value
  end
  local result = {}
  local _type = value.__Class__
  for _, name in ipairs(_type.SaveProps) do
    local prop = _type.Props[name]
    local attr = value.Props[name]
    if prop and nil ~= attr and attr ~= prop:GetDefault() then
      result[name] = prop:GetSaveDump(attr)
    end
  end
  return result
end

function CustomAttr:client_dump(value)
  if nil == value then
    return value
  end
  local result = {}
  local _type = value.__Class__
  for _, name in ipairs(_type.ClientProps) do
    local prop = _type.Props[name]
    local attr = value.Props[name]
    if prop and nil ~= attr and attr ~= prop:GetDefault() then
      result[name] = prop:GetClientDump(attr)
    end
  end
  return result
end

function CustomAttr:cross_dump(value)
  if nil == value then
    return value
  end
  local result = {}
  local _type = value.__Class__
  for _, name in ipairs(_type.CrossProps) do
    local attr = value.Props[name]
    local prop = _type.Props[name]
    if prop then
      result[name] = prop:GetCrossDump(attr)
    end
  end
  return result
end

function CustomAttr:all_dump(value)
  if nil == value then
    return value
  end
  local result = {}
  local _type = value.__Class__
  for name, prop in pairs(_type.Props) do
    local attr = value.Props[name]
    if prop and nil ~= attr and attr ~= prop:GetDefault() then
      result[name] = prop:GetAllDump(attr)
    end
  end
  return result
end

function CustomAttr:Clear()
  local _type = self.__Class__
  for name, prop in pairs(_type.Props) do
    self.Props[name] = prop:GetDefault()
  end
end

function CustomAttr:binary_dump(value)
  if nil == value then
    return value
  end
  local result = {}
  local _type = value.__Class__
  for name, prop in pairs(_type.Props) do
    local attr = value.Props[name]
    if prop then
      result[name] = prop:GetBinaryDump(attr)
    end
  end
  return result
end

function CustomAttr:proto_load(data)
  setmetatable(data, nil)
  local _type = ClassModule.IsClass(self) and self or self.__Class__
  if ClassModule.IsInstance(data, _type) then
    return data
  end
  local object = _type:__New__()
  for key, value in pairs(data) do
    local prop = _type.Props[key]
    if prop then
      object.Props[key] = prop:ProtoGetTypeInstance(value)
    end
  end
  object:_Init()
  return object
end

function CustomAttr:proto_save_dump(value)
  if nil == value then
    return value
  end
  local result = {}
  local _type = value.__Class__
  for _, name in ipairs(_type.SaveProps) do
    local prop = _type.Props[name]
    local attr = value.Props[name]
    if nil == attr then
      attr = prop:GetDefault()
    end
    result[name] = prop:GetProtoSaveDump(attr)
  end
  return result
end

function CustomAttr:proto_client_dump(value)
  if nil == value then
    return value
  end
  local result = {}
  local _type = value.__Class__
  for _, name in ipairs(_type.ClientProps) do
    local prop = _type.Props[name]
    local attr = value.Props[name]
    if nil == attr then
      attr = prop:GetDefault()
    end
    result[name] = prop:GetProtoClientDump(attr)
  end
  return result
end

function CustomAttr:proto_all_dump(value)
  if nil == value then
    return value
  end
  local result = {}
  local _type = value.__Class__
  for name, prop in pairs(_type.Props) do
    local attr = value.Props[name]
    if nil == attr then
      attr = prop:GetDefault()
    end
    result[name] = prop:GetProtoAllDump(attr)
  end
  return result
end

function CustomAttr:SetDictOwner(owner)
  if owner then
    rawset(self, "__DictOwner", owner)
  end
end

function CustomAttr:GetDictOwner()
  return rawget(self, "__DictOwner")
end

function CustomAttr:SetKeyId(id)
  if id then
    rawset(self, "__KeyId", id)
  end
end

function CustomAttr:GetKeyId()
  return rawget(self, "__KeyId")
end

function CustomAttr:_OnPropChange(prop, value)
  local dict_owner = self:GetDictOwner()
  local key_id = self:GetKeyId()
  if prop.client and dict_owner and key_id then
    local attr_client = prop:GetClientDump(value)
    dict_owner:_OnDictValueChange(key_id, prop.name, attr_client)
  end
end

local CustomMetaAttr = Class("CustomMetaAttr", CustomAttr)
CustomAttr.IsMeta = 1

function CustomMetaAttr:Init(...)
  self.IsMeta = 0
end

function CustomMetaAttr:load(data)
  local _type = ClassModule.IsClass(self) and self or self.__Class__
  if ClassModule.IsInstance(data, _type) then
    return data
  end
  local object = _type:__New__()
  for key, value in pairs(data) do
    local prop = _type.Props[key]
    if prop then
      object.Props[key] = prop:GetTypeInstance(value)
    end
  end
  object.IsMeta = data.IsMeta or 1
  object:_Init()
  return object
end

function CustomMetaAttr:on_load_meta(data)
  local _type = ClassModule.IsClass(self) and self or self.__Class__
  for name, prop in pairs(_type.Props) do
    local value = data[name]
    if value and not prop.save then
      self.Props[name] = prop:GetTypeInstance(value)
    end
  end
  self.IsMeta = 0
  self:_Init()
end

function CustomMetaAttr:client_dump(value)
  if nil == value then
    return value
  end
  local result = {}
  local _type = value.__Class__
  for _, name in ipairs(_type.ClientProps) do
    local attr = value.Props[name]
    local prop = _type.Props[name]
    if prop and nil ~= attr and attr ~= prop:GetDefault() then
      result[name] = prop:GetClientDump(attr)
    end
  end
  result.IsMeta = value.IsMeta
  return result
end

function CustomMetaAttr:cross_dump(value)
  if nil == value then
    return value
  end
  local result = {}
  local _type = value.__Class__
  for _, name in ipairs(_type.CrossProps) do
    local attr = value.Props[name]
    local prop = _type.Props[name]
    if prop then
      result[name] = prop:GetCrossDump(attr)
    end
  end
  result.IsMeta = value.IsMeta
  return result
end

function CustomMetaAttr:all_dump(value)
  if nil == value then
    return value
  end
  local result = {}
  local _type = value.__Class__
  for name, prop in pairs(_type.Props) do
    local attr = value.Props[name]
    if prop and nil ~= attr and attr ~= prop:GetDefault() then
      result[name] = prop:GetAllDump(attr)
    end
  end
  result.IsMeta = value.IsMeta
  return result
end

function CustomMetaAttr:binary_dump(value)
  if nil == value then
    return value
  end
  local result = {}
  local _type = value.__Class__
  for name, prop in pairs(_type.Props) do
    local attr = value.Props[name]
    if prop then
      result[name] = prop:GetBinaryDump(attr)
    end
  end
  result.IsMeta = value.IsMeta
  return result
end

function CustomMetaAttr:proto_load(data)
  setmetatable(data, nil)
  local _type = ClassModule.IsClass(self) and self or self.__Class__
  if ClassModule.IsInstance(data, _type) then
    return data
  end
  local object = _type:__New__()
  for key, value in pairs(data) do
    local prop = _type.Props[key]
    if prop then
      object.Props[key] = prop:ProtoGetTypeInstance(value)
    end
  end
  object.IsMeta = data.IsMeta or 1
  object:_Init()
  return object
end

function CustomMetaAttr:proto_client_dump(value)
  if nil == value then
    return value
  end
  local result = {}
  local _type = value.__Class__
  for _, name in ipairs(_type.ClientProps) do
    local prop = _type.Props[name]
    local attr = value.Props[name]
    if nil == attr then
      attr = prop:GetDefault()
    end
    result[name] = prop:GetProtoClientDump(attr)
  end
  result.IsMeta = value.IsMeta
  return result
end

function CustomMetaAttr:proto_all_dump(value)
  if nil == value then
    return value
  end
  local result = {}
  local _type = value.__Class__
  for name, prop in pairs(_type.Props) do
    local attr = value.Props[name]
    if nil == attr then
      attr = prop:GetDefault()
    end
    result[name] = prop:GetProtoAllDump(attr)
  end
  result.IsMeta = value.IsMeta
  return result
end

local CustomDict = Class("CustomDict", CustomType)
CustomDict.KeyType = nil
CustomDict.ValueType = nil

function CustomDict:Init(inner, ...)
  assert(BaseTypes[self.KeyType.__Name__])
  self._inner = inner or {}
  setmetatable(self, ClassModule.DictInstanceMeta)
end

function CustomDict:load(data)
  local _type = ClassModule.IsClass(self) and self or self.__Class__
  if ClassModule.IsInstance(data, _type) then
    return data
  end
  local items = {}
  for key, value in pairs(data) do
    items[_type.KeyType:convert(key)] = _type.ValueType:convert(value)
  end
  return _type(items)
end

function CustomDict:save_dump(data)
  if nil == data then
    return data
  end
  local result = {}
  local _type = data.__Class__
  for key, value in pairs(data) do
    if type(key) == "string" and PropUtils.IsObjId(key) then
      result[PropUtils.ObjId2Str(key)] = _type.ValueType:save_dump(value)
    else
      result[tostring(_type.KeyType:save_dump(key))] = _type.ValueType:save_dump(value)
    end
  end
  return result
end

function CustomDict:client_dump(data)
  if nil == data then
    return data
  end
  local result = {}
  local _type = data.__Class__
  for key, value in pairs(data) do
    if type(key) == "string" and PropUtils.IsObjId(key) then
      result[PropUtils.ObjId2Str(key)] = _type.ValueType:client_dump(value)
    else
      result[tostring(_type.KeyType:client_dump(key))] = _type.ValueType:client_dump(value)
    end
  end
  return result
end

function CustomDict:cross_dump(data)
  if nil == data then
    return data
  end
  local result = {}
  local _type = data.__Class__
  for key, value in pairs(data) do
    if type(key) == "string" and PropUtils.IsObjId(key) then
      result[PropUtils.ObjId2Str(key)] = _type.ValueType:cross_dump(value)
    elseif _type.KeyType == BaseTypes.Int then
      result[_type.KeyType:cross_dump(key)] = _type.ValueType:cross_dump(value)
    else
      result[tostring(_type.KeyType:cross_dump(key))] = _type.ValueType:cross_dump(value)
    end
  end
  return result
end

function CustomDict:all_dump(data)
  if nil == data then
    return data
  end
  local result = {}
  local _type = data.__Class__
  for key, value in pairs(data) do
    if type(key) == "string" and PropUtils.IsObjId(key) then
      result[PropUtils.ObjId2Str(key)] = _type.ValueType:all_dump(value)
    else
      result[tostring(_type.KeyType:all_dump(key))] = _type.ValueType:all_dump(value)
    end
  end
  return result
end

function CustomDict:binary_dump(data)
  if nil == data then
    return data
  end
  local result = {}
  local _type = data.__Class__
  for key, value in pairs(data) do
    result[_type.KeyType:binary_dump(key)] = _type.ValueType:binary_dump(value)
  end
  return result
end

function CustomDict:proto_load(data)
  local _type = ClassModule.IsClass(self) and self or self.__Class__
  if ClassModule.IsInstance(data, _type) then
    return data
  end
  local items = {}
  local key_values = data.key_values or {}
  for key, value in pairs(key_values) do
    items[_type.KeyType:proto_convert(key)] = _type.ValueType:proto_convert(value)
  end
  return _type(items)
end

function CustomDict:proto_save_dump(data)
  if nil == data then
    return data
  end
  local result = {
    key_values = {}
  }
  local _type = data.__Class__
  for key, value in pairs(data) do
    local _key, _value
    if type(key) == "string" and PropUtils.IsObjId(key) then
      result.key_values[PropUtils.ObjId2Str(key)] = _type.ValueType:proto_save_dump(value)
    else
      result.key_values[tostring(_type.KeyType:proto_save_dump(key))] = _type.ValueType:proto_save_dump(value)
    end
  end
  return result
end

function CustomDict:proto_client_dump(data)
  if nil == data then
    return data
  end
  local result = {
    key_values = {}
  }
  local _type = data.__Class__
  for key, value in pairs(data) do
    local _key, _value
    if type(key) == "string" and PropUtils.IsObjId(key) then
      _key = PropUtils.ObjId2Str(key)
    else
      _key = tostring(_type.KeyType:proto_client_dump(key))
    end
    _value = _type.ValueType:proto_client_dump(value)
    result.key_values[_key] = _value
  end
  return result
end

function CustomDict:proto_all_dump(data)
  if nil == data then
    return data
  end
  local result = {
    key_values = {}
  }
  local _type = data.__Class__
  for key, value in pairs(data) do
    local _key, _value
    if type(key) == "string" and PropUtils.IsObjId(key) then
      _key = PropUtils.ObjId2Str(key)
    else
      _key = tostring(_type.KeyType:proto_all_dump(key))
    end
    _value = _type.ValueType:proto_all_dump(value)
    result.key_values[_key] = _value
  end
  return result
end

function CustomDict:SetDefault(key, value)
  local result
  key = self.KeyType:convert(key)
  local ExistValue = self._inner[key]
  if ExistValue then
    result = ExistValue
  else
    result = self.ValueType:convert(value)
    self._inner[key] = result
  end
  return result
end

function CustomDict:Get(key, _value)
  local value = self._inner[key]
  if value then
    return value
  else
    return _value
  end
end

function CustomDict:Keys()
  local result = {}
  for key, value in pairs(self._inner) do
    result[#result + 1] = key
  end
  return result
end

function CustomDict:Values()
  local result = {}
  for key, value in pairs(self._inner) do
    result[#result + 1] = value
  end
  return result
end

function CustomDict:Length()
  local length = 0
  for key, value in pairs(self._inner) do
    length = length + 1
  end
  return length
end

function CustomDict:IsEmpty()
  return 0 == self:Length()
end

function CustomDict:AddValue(key, value)
  self._inner[self.KeyType:convert(key)] = self.ValueType:convert(value)
end

function CustomDict:RemoveValue(key)
  self._inner[self.KeyType:convert(key)] = nil
end

function CustomDict:Clear()
  self._inner = {}
end

function CustomDict:_OnDictValueChange(key_id, prop_name, attr_client)
  local owner = rawget(self, "__Owner")
  if owner and owner._OnPropDictChange then
    owner:_OnPropDictChange(rawget(self, "__Prop"), key_id, prop_name, attr_client)
  end
end

local CustomList = Class("CustomList", CustomDict)
CustomList.KeyType = BaseTypes.Int
CustomList.ValueType = nil

function CustomList:Length()
  return #self._inner
end

function CustomList:HasValue(value)
  local _value = self.ValueType:convert(value)
  for _, item in ipairs(self._inner) do
    if item == _value then
      return true
    end
  end
  return false
end

function CustomList:Append(value)
  local _value = self.ValueType:convert(value)
  table.insert(self._inner, _value)
end

function CustomList:Pop(index)
  index = index or #self._inner
  if index > 0 and index <= #self._inner then
    return table.remove(self._inner, index)
  end
end

function CustomList:Remove(value)
  local _value = self.ValueType:convert(value)
  local Pos
  for index, item in ipairs(self._inner) do
    if item == _value then
      Pos = index
      break
    end
  end
  if Pos then
    table.remove(self._inner, Pos)
    return true
  end
  return false
end

function CustomList:RemoveByIndex(index)
  if index <= 0 or index > #self._inner then
    return
  end
  table.remove(self._inner, index)
end

function CustomList:load(data)
  local _type = ClassModule.IsClass(self) and self or self.__Class__
  if ClassModule.IsInstance(data, _type) then
    return data
  end
  local items = {}
  for index, value in ipairs(data) do
    items[#items + 1] = _type.ValueType:convert(value)
  end
  return _type(items)
end

function CustomList:save_dump(data)
  if nil == data then
    return data
  end
  local result = {}
  local _type = data.__Class__
  for index, value in ipairs(data) do
    result[#result + 1] = _type.ValueType:save_dump(value)
  end
  return result
end

function CustomList:client_dump(data)
  if nil == data then
    return data
  end
  local result = {}
  local _type = data.__Class__
  for index, value in ipairs(data) do
    result[#result + 1] = _type.ValueType:client_dump(value)
  end
  return result
end

function CustomList:cross_dump(data)
  if nil == data then
    return data
  end
  local result = {}
  local _type = data.__Class__
  for index, value in ipairs(data) do
    result[#result + 1] = _type.ValueType:cross_dump(value)
  end
  return result
end

function CustomList:all_dump(data)
  if nil == data then
    return data
  end
  local result = {}
  local _type = data.__Class__
  for index, value in ipairs(data) do
    result[#result + 1] = _type.ValueType:all_dump(value)
  end
  return result
end

function CustomList:binary_dump(data)
  if nil == data then
    return data
  end
  local result = {}
  local _type = data.__Class__
  for index, value in ipairs(data) do
    result[#result + 1] = _type.ValueType:binary_dump(value)
  end
  return result
end

function CustomList:proto_load(data)
  local _type = ClassModule.IsClass(self) and self or self.__Class__
  if ClassModule.IsInstance(data, _type) then
    return data
  end
  local items = {}
  local values = data.values
  for _, value in ipairs(values) do
    items[#items + 1] = _type.ValueType:proto_convert(value)
  end
  return _type(items)
end

function CustomList:proto_save_dump(data)
  if nil == data then
    return data
  end
  local result = {
    values = {}
  }
  local _type = data.__Class__
  for index, value in ipairs(data) do
    result.values[#result.values + 1] = _type.ValueType:proto_save_dump(value)
  end
  return result
end

function CustomList:proto_client_dump(data)
  if nil == data then
    return data
  end
  local result = {
    values = {}
  }
  local _type = data.__Class__
  for index, value in ipairs(data) do
    result.values[#result.values + 1] = _type.ValueType:proto_client_dump(value)
  end
  return result
end

function CustomList:proto_all_dump(data)
  if nil == data then
    return data
  end
  local result = {
    values = {}
  }
  local _type = data.__Class__
  for index, value in ipairs(data) do
    result.values[#result.values + 1] = _type.ValueType:proto_all_dump(value)
  end
  return result
end

local IntList = Class("IntList", CustomList)
IntList.ValueType = BaseTypes.Int
local FloatList = Class("FloatList", CustomList)
FloatList.ValueType = BaseTypes.Float
local ObjectIdList = Class("ObjectIdList", CustomList)
ObjectIdList.ValueType = BaseTypes.ObjId
local StrList = Class("StrList", CustomList)
StrList.ValueType = BaseTypes.Str
local Int2IntDict = Class("Int2IntDict", CustomDict)
Int2IntDict.KeyType = BaseTypes.Int
Int2IntDict.ValueType = BaseTypes.Int

function Int2IntDict:CustomChangeProp(value)
  for k, v in pairs(value) do
    self[k] = v
  end
end

local Int2FloatDict = Class("Int2FloatDict", CustomDict)
Int2FloatDict.KeyType = BaseTypes.Int
Int2FloatDict.ValueType = BaseTypes.Float

function Int2FloatDict:CustomChangeProp(value)
  for k, v in pairs(value) do
    self[k] = v
  end
end

local Int2ObjIdDict = Class("Int2ObjIdDict", CustomDict)
Int2ObjIdDict.KeyType = BaseTypes.Int
Int2ObjIdDict.ValueType = BaseTypes.ObjId
local Int2IntListDict = Class("Int2IntListDict", CustomDict)
Int2IntListDict.KeyType = BaseTypes.Int
Int2IntListDict.ValueType = IntList

function Int2IntListDict:NewIntList()
  return IntList()
end

local Str2StrListDict = Class("Str2StrListDict", CustomDict)
Str2StrListDict.KeyType = BaseTypes.Str
Str2StrListDict.ValueType = StrList
local Str2StrDict = Class("Str2StrDict", CustomDict)
Str2StrDict.KeyType = BaseTypes.Str
Str2StrDict.ValueType = BaseTypes.Str
local Str2IntDict = Class("Str2IntDict", CustomDict)
Str2IntDict.KeyType = BaseTypes.Str
Str2IntDict.ValueType = BaseTypes.Int
local Str2FloatDict = Class("Str2FloatDict", CustomDict)
Str2FloatDict.KeyType = BaseTypes.Str
Str2FloatDict.ValueType = BaseTypes.Float
local ObjectId2Int = Class("ObjectId2Int", CustomDict)
ObjectId2Int.KeyType = BaseTypes.ObjId
ObjectId2Int.ValueType = BaseTypes.Int
local Str2BoolDict = Class("Str2BoolDict", CustomDict)
Str2BoolDict.KeyType = BaseTypes.Str
Str2BoolDict.ValueType = BaseTypes.Bool
local Int2BoolDict = Class("Int2BoolDict", CustomDict)
Int2BoolDict.KeyType = BaseTypes.Int
Int2BoolDict.ValueType = BaseTypes.Bool
local Str2IntListDict = Class("Str2IntListDict", CustomDict)
Str2IntListDict.KeyType = BaseTypes.Str
Str2IntListDict.ValueType = IntList

function Str2IntListDict:NewIntList()
  return IntList()
end

function Str2IntListDict:GetNewIntList(key)
  if not self[key] then
    self[key] = self:NewIntList()
  end
  return self[key]
end

local CustomSet = Class("CustomSet", CustomDict)
CustomSet.KeyType = nil
CustomSet.ValueType = BaseTypes.Int

function CustomSet:AddElement(key)
  if self:HasElement(key) then
    return
  end
  self:AddValue(key, 1)
end

function CustomSet:RemoveElement(key)
  local v = self:Get(key)
  if not v then
    return
  end
  self:RemoveValue(key)
end

function CustomSet:HasElement(key)
  local v = self:Get(key, 0)
  return v > 0
end

local IntSet = Class("IntSet", CustomSet)
IntSet.KeyType = BaseTypes.Int
local StrSet = Class("StrSet", CustomSet)
StrSet.KeyType = BaseTypes.Str
local CustomSetDict = Class("CustomSet", CustomDict)
CustomSetDict.KeyType = nil
CustomSetDict.ValueType = CustomSet

function CustomSetDict:AddElement(key, value)
  if not self[key] then
    self[key] = {}
  end
  self[key]:AddElement(value)
  return true
end

function CustomSetDict:RemoveElement(key, value)
  local set = self[key]
  if not set then
    return
  end
  set:RemoveElement(value)
end

function CustomSetDict:HasElement(key, value)
  local set = self[key]
  if not set then
    return false
  end
  return set:HasElement(value)
end

local Str2IntSetDict = Class("Str2IntSetDict", CustomSetDict)
Str2IntSetDict.KeyType = BaseTypes.Str
Str2IntSetDict.ValueType = IntSet
local Int2IntSetDict = Class("Int2IntSetDict", CustomSetDict)
Int2IntSetDict.KeyType = BaseTypes.Int
Int2IntSetDict.ValueType = IntSet
local Int2StrSetDict = Class("Int2StrSetDict", CustomSetDict)
Int2StrSetDict.KeyType = BaseTypes.Int
Int2StrSetDict.ValueType = StrSet
local Str2StrSetDict = Class("Str2StrSetDict", CustomSetDict)
Str2StrSetDict.KeyType = BaseTypes.Str
Str2StrSetDict.ValueType = StrSet
local CustomTypes = {
  CustomType = CustomType,
  CustomAttr = CustomAttr,
  CustomMetaAttr = CustomMetaAttr,
  CustomDict = CustomDict,
  CustomList = CustomList,
  CustomSet = CustomSet,
  CustomSetDict = CustomSetDict,
  IntList = IntList,
  StrList = StrList,
  FloatList = FloatList,
  ObjectIdList = ObjectIdList,
  Int2IntDict = Int2IntDict,
  Int2FloatDict = Int2FloatDict,
  Int2ObjIdDict = Int2ObjIdDict,
  Int2IntListDict = Int2IntListDict,
  Str2StrListDict = Str2StrListDict,
  Str2StrDict = Str2StrDict,
  Str2IntDict = Str2IntDict,
  Str2FloatDict = Str2FloatDict,
  ObjectId2Int = ObjectId2Int,
  Str2BoolDict = Str2BoolDict,
  Str2IntListDict = Str2IntListDict,
  Int2BoolDict = Int2BoolDict,
  Str2IntSetDict = Str2IntSetDict,
  Int2IntSetDict = Int2IntSetDict,
  Int2StrSetDict = Int2StrSetDict,
  Str2StrSetDict = Str2StrSetDict,
  IntSet = IntSet,
  StrSet = StrSet
}
return CustomTypes
