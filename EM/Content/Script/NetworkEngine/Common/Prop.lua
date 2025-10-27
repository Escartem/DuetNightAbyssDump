local PropUtils = require("BluePrints.Client.PropUtils")
local Class = _G.TypeClass
local ClassMgr = require("NetworkEngine.Common.ClassManager")
local Prop = Class("Prop")

function Prop:Init(type_str, options, default, others)
  self.is_prop = true
  if type(type_str) == "string" then
    self.type_str = type_str
    self:ParseType(type_str)
  end
  self:ParseOptions(options)
  if default then
    self.default = default
  end
  if others then
    for k, v in pairs(others) do
      rawset(self, k, v)
    end
  end
end

function Prop:ParseType(type_str)
  local _type = ClassMgr:GetType(type_str)
  if _type then
    self.type = _type
  end
end

function Prop:ParseOptions(options)
  self.save = false
  self.client = false
  self.cross = false
  self.meta = false
  self.proto = false
  for k, v in pairs(PropUtils.Split(options, " ")) do
    self[v] = true
  end
end

function Prop:SetName(name)
  self.name = name
  self.change_notifier = "_OnPropChange" .. name
end

function Prop:GetType()
  return self.type
end

function Prop:GetDefault()
  if self.default then
    return self.type:convert(self.default)
  else
    return self.type:GetDefault()
  end
end

function Prop:GetTypeDefault()
  return self.type:GetDefault()
end

function Prop:GetTypeInstance(value)
  return self.type:convert(value)
end

function Prop:GetSaveDump(value)
  return self.type:save_dump(value)
end

function Prop:GetClientDump(value)
  return self.type:client_dump(value)
end

function Prop:GetCrossDump(value)
  local result = self.type:cross_dump(value)
  if not result then
    result = self:GetDefault()
    if type(result) == "table" and result.__Class__ then
      result = result:cross_dump(result)
    end
  end
  return result
end

function Prop:GetAllDump(value)
  return self.type:all_dump(value)
end

function Prop:GetBinaryDump(value)
  return self.type:binary_dump(value)
end

function Prop:ProtoGetTypeInstance(value)
  return self.type:proto_convert(value)
end

function Prop:GetProtoSaveDump(value)
  return self.type:proto_save_dump(value)
end

function Prop:GetProtoClientDump(value)
  return self.type:proto_client_dump(value)
end

function Prop:GetProtoAllDump(value)
  return self.type:proto_all_dump(value)
end

function Prop:SetAttrOwnerInfo(value, owner)
  self.type.SetOwnerInfo(value, owner, self)
end

local Getter = Class("Getter")

function Getter:Init(attr, name)
  self.is_getter = true
  self.attr = attr
  self.name = name
end

local prop = {}

function prop.prop(type_str, options, default, others)
  return Prop(type_str, options, default, others)
end

function prop.getter(attr, name)
  return Getter(attr, name)
end

return prop
