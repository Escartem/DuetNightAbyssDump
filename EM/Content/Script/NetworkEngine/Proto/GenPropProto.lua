package.path = package.path .. ";../../?.lua;"
local custom_types_path = "../../BluePrints/Client/CustomTypes"
local avatar_path = "../../BluePrints/Client/Implements"
local proto_file_path = "./file/"
local GWorld = {}

function GWorld:IsSkynetServer()
  return false
end

_G.TypeClass = require("NetworkEngine.Class").Class
_G.GWorld = GWorld
local class_module = require("NetworkEngine.Class")
local PropUtils = require("BluePrints.Client.PropUtils")
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local CustomAttr = CustomTypes.CustomAttr
local CustomMetaAttr = CustomTypes.CustomMetaAttr
local CustomDict = CustomTypes.CustomDict
local CustomList = CustomTypes.CustomList
local lfs = require("lfs")
local BaseType2ProtoType = {
  ObjId = "bytes",
  Str = "string",
  Int = "int64",
  Float = "float",
  Bool = "bool"
}
local MapKeyTypes = {
  ObjId = "string",
  Str = "string",
  Int = "int64"
}
local ExcludedFiles = {
  BaseTypes = true,
  CustomTypes = true,
  SimpleRewardBox = true
}
local ExcludedCustomTypes = {
  CustomType = true,
  CustomDict = true,
  CustomList = true,
  CustomAttr = true,
  CustomMetaAttr = true,
  CustomSet = true,
  CustomSetDict = true
}

local function traverse_folder(path)
  local result = {}
  for file in lfs.dir(path) do
    if "." ~= file and ".." ~= file then
      local file_path = path .. "/" .. file
      local mode = lfs.attributes(file_path, "mode")
      if "file" == mode then
        if string.find(file_path, ".lua") then
          result[#result + 1] = file_path
        end
      elseif "directory" == mode then
      end
    end
  end
  return result
end

local function process_custom_attr(attr_name, attr)
  local message = ""
  message = message .. "message " .. attr_name .. " {\n"
  local sort_props = PropUtils.Keys(attr.Props)
  table.sort(sort_props)
  for index, prop_name in ipairs(sort_props) do
    local prop = attr.Props[prop_name]
    local type_name = prop.type.__Name__
    local type_str = prop.type_str
    if "List" == type_name or "Dict" == type_name then
      print("List or Dict not support yet", attr_name, prop_name, type_name)
    elseif BaseType2ProtoType[type_name] then
      message = message .. "\t" .. BaseType2ProtoType[type_name] .. " " .. prop_name .. " = " .. index .. ";\n"
    elseif CustomTypes[type_name] then
      message = message .. "\t" .. type_name .. " " .. prop_name .. " = " .. index .. ";\n"
    else
      local split_str = PropUtils.Split(type_str, ".")
      if 1 == #split_str then
        local import_type = split_str[1]
        message = message .. "\t" .. import_type .. " " .. prop_name .. " = " .. index .. ";\n"
      elseif 2 == #split_str then
        local import_name = split_str[1]
        local import_type = split_str[2]
        message = message .. "\t" .. import_type .. " " .. prop_name .. " = " .. index .. ";\n"
      else
        error("Invalid type_str " .. type_str)
      end
    end
  end
  message = message .. "}\n"
  return message
end

local function process_custom_dict(attr_name, attr)
  local key_type_name = attr.KeyType.__Name__
  local value_type_name = attr.ValueType.__Name__
  local message = ""
  if "List" == value_type_name or "Dict" == value_type_name then
    print("List or Dict not support yet", attr_name)
    return message
  end
  if not MapKeyTypes[key_type_name] then
    error("Invalid key_type_name " .. key_type_name)
  end
  message = message .. "message " .. attr_name .. " {\n"
  if BaseType2ProtoType[value_type_name] then
    value_type_name = BaseType2ProtoType[value_type_name]
  end
  message = message .. "\tmap<" .. MapKeyTypes[key_type_name] .. ", " .. value_type_name .. "> " .. "key_values = 1;\n"
  message = message .. "}\n"
  return message
end

local function process_custom_list(attr_name, attr)
  local message = ""
  local value_type_name = attr.ValueType.__Name__
  if "List" == value_type_name or "Dict" == value_type_name then
    print("List or Dict not support yet", attr_name)
    return message
  end
  message = message .. "message " .. attr_name .. " {\n"
  if BaseType2ProtoType[value_type_name] then
    value_type_name = BaseType2ProtoType[value_type_name]
  end
  message = message .. "\trepeated " .. value_type_name .. " " .. "values = 1;\n"
  message = message .. "}\n"
  return message
end

local function GetAttrMessage(file_path, file_name)
  if ExcludedFiles[file_name] then
    return
  end
  local Attrs = require(file_path)
  local message_list = {}
  local message = ""
  if type(Attrs) ~= "table" then
    return
  end
  local attr_names = PropUtils.Keys(Attrs)
  table.sort(attr_names)
  for _, name in ipairs(attr_names) do
    local attr = Attrs[name]
    if class_module.IsSubClass(attr, CustomAttr) or class_module.IsSubClass(attr, CustomMetaAttr) then
      message = process_custom_attr(name, attr)
    elseif class_module.IsSubClass(attr, CustomList) then
      message = process_custom_list(name, attr)
    else
      if class_module.IsSubClass(attr, CustomDict) then
        message = process_custom_dict(name, attr)
      else
      end
    end
    if "" ~= message then
      message_list[#message_list + 1] = message
    end
  end
  table.sort(message_list)
  return message_list
end

local function GenCustomTypeProto()
  local attr_message_list = {}
  local attr_names = PropUtils.Keys(CustomTypes)
  table.sort(attr_names)
  local message = ""
  for _, name in ipairs(attr_names) do
    if not ExcludedCustomTypes[name] then
      local attr = CustomTypes[name]
      if class_module.IsSubClass(attr, CustomList) then
        message = process_custom_list(name, attr)
      else
        if class_module.IsSubClass(attr, CustomDict) then
          message = process_custom_dict(name, attr)
        else
        end
      end
      attr_message_list[#attr_message_list + 1] = message
    end
  end
  table.sort(attr_message_list)
  return table.concat(attr_message_list, "\n")
end

local function GenImplementsProto(name)
  local proto_path = avatar_path .. "/" .. name
  local props = require(proto_path)
  local message = ""
  message = message .. "message " .. name .. " {\n"
  local prop_names = PropUtils.Keys(props)
  table.sort(prop_names)
  for index, prop_name in ipairs(prop_names) do
    local prop = props[prop_name]
    local type_name = prop.type.__Name__
    local type_str = prop.type_str
    if "List" == type_name or "Dict" == type_name then
      print("List or Dict not support yet", prop_name, type_name)
    elseif BaseType2ProtoType[type_name] then
      message = message .. "\t" .. BaseType2ProtoType[type_name] .. " " .. prop_name .. " = " .. index .. ";\n"
    elseif CustomTypes[type_name] then
      message = message .. "\t" .. type_name .. " " .. prop_name .. " = " .. index .. ";\n"
    else
      local split_str = PropUtils.Split(type_str, ".")
      if 1 == #split_str then
        local import_type = split_str[1]
        message = message .. "\t" .. import_type .. " " .. prop_name .. " = " .. index .. ";\n"
      elseif 2 == #split_str then
        local import_name = split_str[1]
        local import_type = split_str[2]
        message = message .. "\t" .. import_type .. " " .. prop_name .. " = " .. index .. ";\n"
      else
        error("Invalid type_str " .. type_str)
      end
    end
  end
  message = message .. "}\n"
  return message
end

local function GenAttrProp()
  local attr_proto_path = proto_file_path .. "Attr.proto"
  local attr_proto_file = io.open(attr_proto_path, "w")
  if not attr_proto_file then
    print("Can not open file: " .. attr_proto_path)
    return
  end
  local attr_proto_str = ""
  attr_proto_str = attr_proto_str .. [[
syntax = "proto3";

]]
  local attr_message = ""
  local attr_message_list = {}
  local message_list
  local files = traverse_folder(custom_types_path)
  for _, file in ipairs(files) do
    file = string.sub(file, 1, -5)
    local rets = PropUtils.Split(file, "/")
    local file_name = rets[#rets]
    message_list = GetAttrMessage(file, file_name)
    if message_list then
      for _, message in ipairs(message_list) do
        attr_message_list[#attr_message_list + 1] = message
      end
    end
  end
  table.sort(attr_message_list)
  attr_message = table.concat(attr_message_list, "\n")
  local custom_type_message = GenCustomTypeProto()
  attr_proto_str = attr_proto_str .. custom_type_message .. [[


]] .. attr_message .. "\n"
  attr_proto_str = attr_proto_str .. GenImplementsProto("Avatar") .. "\n"
  attr_proto_file:write(attr_proto_str)
  attr_proto_file:close()
end

local function GenProtos()
  GenAttrProp()
end

GenProtos()
