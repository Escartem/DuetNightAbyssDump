local pb = require("pb")
local Component = {}

function Component:EnterWorld()
  self.logger.debug("EntityBase EnterWorld")
  self.in_world = true
end

function Component:LeaveWorld()
  self.logger.debug("EntityBase LeaveWorld")
  self.in_world = false
end

function Component:InitFromDict(attrs, use_protoattr)
  self.UseProtoAttr = use_protoattr
  local _type = self.__Class__
  if not _type.Props then
    return
  end
  for name, value in pairs(attrs) do
    local prop = _type.Props[name]
    if prop then
      local object
      local type_name = prop:GetType().__Name__
      if self.UseProtoAttr and self.AttrTypes[type_name] then
        value = pb.decode("." .. type_name, value)
        object = prop:ProtoGetTypeInstance(value)
      else
        object = prop:GetTypeInstance(value)
      end
      self.Props[name] = object
    else
      self[name] = value
    end
  end
end

function Component:CreateSuccess()
  self:CallServerMethod("OnCreateClientEntity", true)
  if self.OnEntityInitSuccess then
    self.OnEntityInitSuccess(self)
  end
end

function Component:GetClientAttrs()
  if not self.ClientProps then
    return {}
  end
  local result = {}
  if not self.Props then
    return result
  end
  local _type = self.__Class__
  for _, name in ipairs(self.ClientProps) do
    local attr = self.Props[name]
    local prop = _type.Props[name]
    if prop then
      result[name] = prop:GetClientDump(attr)
    end
  end
  return result
end

function Component:GetCrossAttrs()
  if not self.CrossProps then
    return {}
  end
  local result = {}
  if not self.Props then
    return result
  end
  local _type = self.__Class__
  for i = 1, #self.CrossProps do
    local name = self.CrossProps[i]
    local attr = self[name]
    local prop = _type.Props[name]
    if attr and prop then
      result[name] = prop:GetCrossDump(attr)
    end
  end
  return result
end

function Component:ClientPropChanged(name, value)
  self.logger.debug("ClientPropChanged", name)
  local _type = self.__Class__
  local prop = _type.Props[name]
  if not prop then
    return
  end
  local object
  local type_name = prop:GetType().__Name__
  if self.UseProtoAttr and self.AttrTypes[type_name] and nil ~= value then
    value = pb.decode("." .. type_name, value)
    object = prop:ProtoGetTypeInstance(value)
  else
    object = prop:GetTypeInstance(value)
  end
  self.Props[name] = object
  local func = self["_OnPropChange" .. name]
  if nil ~= func then
    func(self, {})
  end
end

function Component:ClientPropSet(name, key, value)
  self.logger.debug("ClientPropSet", name, key)
  local _type = self.__Class__
  local prop = _type.Props[name]
  if not prop then
    return
  end
  local OldValue = self[name][key]
  if type(value) == "table" and value.__type and value.value then
    self[name][key] = value.value
  else
    local _type = prop:GetType()
    local _key_type = _type.KeyType
    local _value_type = _type.ValueType
    local _value_type_name = _value_type.__Name__
    if self.UseProtoAttr and self.AttrTypes[_value_type_name] and nil ~= value then
      value = pb.decode("." .. _value_type_name, value)
      self[name]._inner[_key_type:convert(key)] = _value_type:proto_load(value)
    else
      self[name][key] = value
    end
  end
  local func = self["_OnPropChange" .. name]
  if nil ~= func then
    func(self, {key}, OldValue)
  end
end

function Component:ClientPropDictChange(prop_name, key, second_prop_name, attr_value)
  self.logger.info("ClientPropDictChange", prop_name, key, second_prop_name, attr_value)
  local first_attr = self[prop_name]
  if not first_attr then
    self.logger.error(string.format("ClientPropDictChange, %s is not exit!", prop_name))
    return
  end
  local key_type = first_attr.KeyType
  if not key_type then
    self.logger.error(string.format("ClientPropDictChange, %s has no key type!", prop_name))
    return
  end
  key = key_type:convert(key)
  local value = first_attr[key]
  if not value then
    self.logger.error(string.format("ClientPropDictChange, %s has no value for %s", prop_name, key))
    return
  end
  local CustomChangePropFunc
  local OldValue = value[second_prop_name]
  if type(value[second_prop_name]) == "table" then
    CustomChangePropFunc = value[second_prop_name].CustomChangeProp
  end
  if CustomChangePropFunc then
    CustomChangePropFunc(value[second_prop_name], attr_value)
  else
    value[second_prop_name] = attr_value
  end
  local func = self["_OnPropChange" .. prop_name]
  if nil ~= func then
    func(self, {key, second_prop_name}, OldValue)
  end
end

function Component:ClientFlashSyncProp(CacheSyncProp)
  self.logger.info("ClientFlashSyncProp")
  if type(CacheSyncProp) ~= "table" then
    return
  end
  for _, info in ipairs(CacheSyncProp) do
    if "ClientPropChanged" == info[1] then
      self:ClientPropChanged(info[2], info[3])
    elseif "ClientPropSet" == info[1] then
      self:ClientPropSet(info[2], info[3], info[4])
    elseif "ClientPropDictChange" == info[1] then
      self:ClientPropDictChange(info[2], info[3], info[4], info[5])
    end
  end
end

function Component:OnDestroy()
  self.logger.debug("EntityBase OnDestroy")
  if self.in_world then
    self:LeaveWorld()
  end
  ReddotManager._Close()
  ReddotManager._Init()
  local EMCache = require("EMCache.EMCache")
  EMCache:SaveUser(true, self)
  self.Super.OnDestroy(self)
end

return Component
