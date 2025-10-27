local ClassMgr = require("NetworkEngine.Common.ClassManager")
local InstanceMeta = {}
local DictInstanceMeta = {}

local function new(t)
  local obj = {
    Super = t.Super,
    __IsClass__ = false,
    __Class__ = t,
    __Name__ = t.__Name__,
    Props = {}
  }
  setmetatable(obj, InstanceMeta)
  return obj
end

local function call(t, ...)
  local obj = {
    Super = t.Super,
    __IsClass__ = false,
    __Class__ = t,
    __Name__ = t.__Name__,
    Props = {}
  }
  setmetatable(obj, InstanceMeta)
  local InitFunc = t.Init
  if InitFunc then
    InitFunc(obj, ...)
  end
  return obj
end

local function Class(class_name, parent_class)
  local NewClass = {
    __IsClass__ = true,
    __Name__ = class_name,
    __New__ = new,
    Super = parent_class,
    Props = {},
    Getters = {}
  }
  if type(parent_class) == "table" then
    setmetatable(NewClass, {__index = parent_class, __call = call})
  else
    setmetatable(NewClass, {__call = call})
  end
  ClassMgr:RegisterClass(class_name, NewClass)
  return NewClass
end

local function IsClass(c)
  if rawget(c, "__IsClass__") == true then
    return true
  end
  return false
end

local function IsInstance(obj, class)
  if obj.__Class__ == class then
    return true
  end
  return false
end

local function IsSubClass(subclass, parent_class)
  if not subclass then
    return false
  end
  if rawget(subclass, "__IsClass__") == false then
    return false
  end
  if subclass.Super == parent_class then
    return true
  end
  return IsSubClass(subclass.Super, parent_class)
end

function InstanceMeta:__index(key)
  if nil == key then
    return nil
  end
  local result = self.Props[key]
  if nil ~= result then
    return result
  end
  local prop = self.__Class__.Props[key]
  if prop then
    local _value = prop:GetDefault()
    self.Props[key] = _value
    return _value
  end
  local getter = self.__Class__.Getters[key]
  if getter then
    local attr = self.__Class__[getter.attr]
    if type(attr) == "table" then
      return attr[getter.name]
    elseif type(attr) == "function" then
      local funcVal = attr(self)
      if funcVal then
        return funcVal[getter.name]
      else
        if getter.attr == "Data" and not skynet and GWorld.GameInstance then
          local avatar = GWorld:GetAvatar()
          if avatar.bAccountBroken then
            return nil
          end
          avatar.bAccountBroken = true
          local account = avatar and avatar.Account or ""
          local log = string.format("::Error::  CustomType\231\177\187Index\233\148\153\232\175\175 %s\231\177\187\231\154\132Data\229\135\189\230\149\176\229\190\151\229\136\176\231\154\132\231\187\147\230\158\156\230\152\175\231\169\186\231\154\132\239\188\140%s \232\191\153\228\184\170\229\143\183\229\186\159\228\186\134\239\188\140\229\176\157\232\175\149\230\141\162\228\184\170\230\150\176\229\143\183\239\188\140\232\191\152\230\152\175\228\184\141\232\161\140\229\176\177\230\155\180\230\150\176\228\189\160\231\154\132\229\174\162\230\136\183\231\171\175", self.__Class__.__Name__, account)
          if Battle and Battle(GWorld.GameInstance) and Battle(GWorld.GameInstance).ShowBattleError then
            Battle(GWorld.GameInstance):ShowBattleError(log)
          end
          UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\136\160\232\161\168\229\188\149\232\181\183\231\154\132\230\151\167\229\143\183\230\138\165\229\186\159", log)
        end
        return nil
      end
    end
  end
  result = self.__Class__[key]
  rawset(self, key, result)
  return result
end

function InstanceMeta:__newindex(key, value)
  local prop = self.__Class__.Props[key]
  if prop then
    local _value = prop:GetTypeInstance(value)
    self.Props[key] = _value
    return
  end
  rawset(self, key, value)
end

function DictInstanceMeta:__index(key)
  if nil == key then
    return nil
  end
  local result = self._inner[key]
  if nil ~= result then
    return result
  end
  result = self.__Class__[key]
  rawset(self, key, result)
  return result
end

function DictInstanceMeta:__newindex(key, value)
  local KeyType = self.KeyType
  local ValueType = self.ValueType
  self._inner[KeyType:convert(key)] = ValueType:convert(value)
end

local function DictNext(table, key)
  return next(table._inner, key)
end

function DictInstanceMeta:__pairs(key)
  return DictNext, self, key
end

return {
  Class = Class,
  IsClass = IsClass,
  IsInstance = IsInstance,
  IsSubClass = IsSubClass,
  InstanceMeta = InstanceMeta,
  DictInstanceMeta = DictInstanceMeta
}
