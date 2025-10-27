local PropUtils = require("BluePrints.Client.PropUtils")
Classes = {}
Types = {}
local ClassMgr = {}

function ClassMgr:RegisterClass(Name, Type)
  if not Classes[Name] then
    Classes[Name] = Type
  end
  if not Types[Name] then
    Types[Name] = Type
  end
end

function ClassMgr:GetClass(Name)
  return Classes[Name]
end

function ClassMgr:GetType(Name)
  if Types[Name] ~= nil then
    return Types[Name]
  end
  if not self.BaseTypes then
    self.BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
  end
  if not self.CustomTypes then
    self.CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
  end
  if self.BaseTypes[Name] then
    return self.BaseTypes[Name]
  elseif self.CustomTypes[Name] then
    return self.CustomTypes[Name]
  else
    local split_str = PropUtils.Split(Name, ".")
    local module_name = "BluePrints.Client.CustomTypes." .. split_str[1]
    local type_name = split_str[2]
    local module = require(module_name)
    if module then
      Types[type_name] = module[type_name]
      return Types[type_name]
    end
  end
end

return ClassMgr
