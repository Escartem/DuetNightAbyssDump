if _UNLUA ~= nil then
  return
end
_UNLUA = 1
local rawget = _ENV.rawget
local rawset = _ENV.rawset
local type = _ENV.type
local getmetatable = _ENV.getmetatable
local setmetatable = _ENV.setmetatable
local require = _ENV.require
local str_sub = string.sub
local GetUProperty = _ENV.GetUProperty
local SetUProperty = _ENV.SetUProperty
local RegisterClass = _ENV.RegisterClass
local RegisterEnum = _ENV.RegisterEnum
local print = UEPrint or _ENV.print
local netprint = NetPrint
local UE = _ENV.UE
_NotExist = _NotExist or {}
local NotExist = _NotExist

local function Index(t, k)
  local mt = getmetatable(t)
  local p = rawget(mt, k)
  if nil == p then
    p = mt[k]
    if nil == p then
      rawset(mt, k, NotExist)
      return nil
    end
    rawset(mt, k, p)
  end
  if rawequal(p, NotExist) then
    return nil
  end
  if "userdata" == type(p) then
    return GetUProperty(t, p)
  end
  rawset(t, k, p)
  return p
end

local function NewIndex(t, k, v)
  local mt = getmetatable(t)
  local p = mt[k]
  if "userdata" == type(p) then
    return SetUProperty(t, p, v)
  end
  rawset(t, k, v)
end

local function copy_table(source, target)
  for k, f in pairs(source) do
    if "__index" ~= k and "__newindex" ~= k and "Super" ~= k and "function" == type(f) then
      rawset(target, k, f)
    end
  end
end

local a

local function Get_G()
  return a
end

local function Class(super_name)
  local new_class = {}
  new_class.__index = Index
  new_class.__newindex = NewIndex
  new_class.Super = nil
  if "table" == type(super_name) then
    for i, v in pairs(super_name) do
      local require_module
      if "table" == type(v) then
        require_module = v
      else
        require_module = require(v)
      end
      if nil == require_module then
        print("Can not require file " .. tostring(v))
      else
        if new_class.Super == nil then
          new_class.Super = require_module
          setmetatable(new_class, getmetatable(new_class.Super))
        end
        copy_table(require_module, new_class)
      end
    end
  elseif nil ~= super_name then
    local require_module = require(super_name)
    if nil == require_module then
      print("Can not require file " .. tostring(super_name))
    else
      new_class.Super = require_module
      setmetatable(new_class, getmetatable(new_class.Super))
      copy_table(require_module, new_class)
    end
  end
  new_class.Get_G = Get_G
  
  function new_class.add_ref(ref_table)
    if not new_class.ref_tables then
      new_class.ref_tables = setmetatable({}, {__mode = "kv"})
    end
    table.insert(new_class.ref_tables, ref_table)
  end
  
  return new_class
end

local function IsInExceptionList(Name, ExceptionList)
  if not ExceptionList then
    return false
  end
  for i, v in pairs(ExceptionList) do
    if Name == v then
      return true
    end
  end
  return false
end

local function AssembleComponents(M, ExceptionList)
  local NameToFuncTable = {}
  for name, value in pairs(M) do
    if "function" == type(value) and string.sub(name, 1, 2) ~= "__" then
      if nil == NameToFuncTable[name] then
        NameToFuncTable[name] = {}
      end
      table.insert(NameToFuncTable[name], value)
    end
  end
  local components = rawget(M, "_components")
  if "table" == type(components) then
    for _, component_name in ipairs(components) do
      local component = require(component_name)
      for name, value in pairs(component) do
        local NameInExceptionList = IsInExceptionList(name, ExceptionList)
        if "function" == type(value) and string.sub(name, 1, 2) ~= "__" and not NameInExceptionList then
          if nil == NameToFuncTable[name] then
            NameToFuncTable[name] = {}
          end
          table.insert(NameToFuncTable[name], value)
        end
      end
    end
  end
  for name, func_t in pairs(NameToFuncTable) do
    if 1 == #func_t then
      rawset(M, name, func_t[1])
    else
      local function _wrapper(...)
        for _, func in ipairs(func_t) do
          func(...)
        end
      end
      
      rawset(M, name, _wrapper)
    end
  end
end

local function global_index(t, k)
  if "string" == type(k) then
    local s = str_sub(k, 1, 1)
    if "U" == s or "A" == s or "F" == s or "E" == s or "T" == s then
      local v = UE[k]
      if nil ~= v then
        rawset(t, k, v)
      end
    end
  end
  return rawget(t, k)
end

if WITH_UE4_NAMESPACE then
  local global_mt = {}
  global_mt.__index = global_index
  setmetatable(_G, global_mt)
  _G.UE4 = UE
  print("WITH_UE4_NAMESPACE==true")
else
  local global_mt = {}
  global_mt.__index = global_index
  setmetatable(_G, global_mt)
  _G.UE4 = _G
  _G.UE = _G
  print("WITH_UE4_NAMESPACE==false")
end

local function print_t(logTag, ...)
  if _G.LogTag == "nil" then
    print(logTag, ...)
  elseif logTag == _G.LogTag then
    print(logTag, ...)
  end
end

function math.clamp(v, minValue, maxValue)
  if v < minValue then
    return minValue
  end
  if maxValue < v then
    return maxValue
  end
  return v
end

function math.lerp(a, b, t)
  return a + (b - a) * t
end

function math.sign(number)
  if number > 0 then
    return 1
  end
  if number < 0 then
    return -1
  end
  return 0
end

function table.slice(t, i, j)
  return {
    table.unpack(t, i, j)
  }
end

function table.reverse(t)
  local n = #t
  for i = 1, math.floor(n / 2) do
    t[i], t[n - i + 1] = t[n - i + 1], t[i]
  end
  return t
end

function table.join(...)
  local tt = {
    ...
  }
  local nt = {}
  for _, t in ipairs(tt) do
    for _, v in ipairs(t) do
      table.insert(nt, v)
    end
  end
  return nt
end

function table.isempty(t)
  return nil == t or nil == next(t)
end

function table.findValue(t, targetValue, finder)
  finder = finder or function(v, target)
    return v == target
  end
  for i, v in pairs(t) do
    if finder(v, targetValue) then
      return v, i
    end
  end
end

function string.split(str, reps)
  local resultStrList = {}
  string.gsub(str, "[^" .. reps .. "]+", function(w)
    table.insert(resultStrList, w)
  end)
  return resultStrList
end

function string.trim(str)
  return (string.gsub(str, "^[%s\n\r\t]*(.-)[%s\n\r\t]*$", "%1"))
end

function string.startswith(str, prefix)
  return string.sub(str, 1, string.len(prefix)) == prefix
end

function string.endswith(str, postfix)
  local strLen = string.len(str)
  return string.sub(str, strLen - string.len(postfix) + 1, strLen) == postfix
end

function string.insert(str, pos, rep)
  return string.sub(str, 1, pos) .. rep .. string.sub(str, pos + 1)
end

function string.isempty(str)
  return nil == str or "" == str
end

function try(block, ...)
  if not block.catch then
    function block.catch(err)
      LogError(Traceback(ErrorTag, err, false))
      
      local EMSentrySubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld and GWorld.GameInstance, UEMSentrySubsystem)
      if EMSentrySubsystem then
        local SceneId = WorldTravelSubsystem and tostring(WorldTravelSubsystem():GetCurrentSceneId()) or "nil"
        local ErrorMsg = debug.traceback(tostring(err), 2)
        EMSentrySubsystem:ReportLuaTrace(ErrorMsg, {
          SceneId = SceneId,
          SceneName = "unlua.try",
          Location = "unlua.try"
        })
      end
    end
  end
  local Res = table.pack(xpcall(block.exec, block.catch, ...))
  local ok = Res[1]
  if block.final then
    block.final(ok, ...)
  end
  if ok then
    return table.unpack(Res, 2)
  end
end

function CreateCoroutine(Func, ...)
  return coroutine.create(function(...)
    try({exec = Func}, ...)
  end)
end

function RunAsyncTask(Obj, TaskName, TaskFunc)
  if Obj[TaskName] then
    return
  end
  Obj[TaskName] = coroutine.create(function()
    local Co = Obj[TaskName]
    try({exec = TaskFunc}, Co, Obj)
    Obj[TaskName] = nil
    coroutine.close(Co)
  end)
  coroutine.resume(Obj[TaskName])
end

function ForceStopAsyncTask(Obj, TaskName)
  if not Obj[TaskName] then
    return
  end
  local Co = Obj[TaskName]
  Obj[TaskName] = nil
  local Status = coroutine.status(Co)
  if "running" == Status or "suspended" == Status then
    coroutine.close(Co)
  end
end

_G.print = print_t
_G.Get_G = Get_G
_G.netprint = netprint
_G.ServerPrint = LogEMServer
_G.Index = Index
_G.NewIndex = NewIndex
_G.Class = Class
_G.CopyTable = copy_table
_G.DrawDebugTest = false
_G.AutoCameraReset = true
_G.ShouldUseCreaturePool = true
_G.LogTag = "nil"
_G.ErrorTag = "::Error::"
_G.WarningTag = "::Warning::"
_G.DebugTag = "::Debug::"
_G.AssembleComponents = AssembleComponents
_G.TypeClassModule = require("NetworkEngine.Class")
_G.TypeClass = _G.TypeClassModule.Class
_G.DataMgr = require("DataMgr")
_G.CommonConst = require("CommonConst")
_G.Const = require("Const")
_G.UIConst = require("BluePrints.UI.UIConst")
_G.GWorld = require("GWorld")
_G.BattleEventName = require("BluePrints/Combat/BattleEvents/BattleEventName")
_G.EventManager, _G.EventID = table.unpack(require("BluePrints.Managers.EventManager"))
_G.DialogEvent = require("BluePrints.UI.UI_PC.Common.Common_Dialog.DialogEvent")
_G.ErrorCode = require("BluePrints.Client.ErrorCode")
_G.ConditionUtils = require("BluePrints.Common.ConditionUtils")
_G.AvatarUtils = require("BluePrints.Client.AvatarUtils")
_G.ItemUtils = require("Utils.ItemUtils")
_G.CommonUtils = require("Utils.CommonUtils")
_G.RpcUtils = require("Utils.RpcUtils")
_G.RewardUtils = require("Utils.RewardUtils")
_G.UIUtils = require("Utils.UIUtils")
_G.UseDungeonLevelBounds = false
_G.UseMinimumLoad = true
_G.LuaMemoryManager = require("LuaMemoryManager")
_G.SystemGuideManager = require("BluePrints.Managers.SystemGuideManager")
_G.MissionIndicatorManager = require("BluePrints.Managers.MissionIndicatorManager")
_G.ReddotManager = require("BluePrints.UI.Reddot.ReddotManager")
_G.I18nUtils = require("Utils.I18nUtils")
_G.PageJumpUtils = require("Utils.PageJumpUtils")
_G.ShopUtils = require("Utils.ShopUtils")
_G.RougeUtils = require("Utils.RougeUtils")
_G.SerializeUtils = require("Utils.SerializeUtils")
_G.TestClass = TestClass or function()
  local Class = {}
  Class.__index = Class
  
  function Class.New()
    local o = {}
    setmetatable(o, Class)
    return o
  end
  
  return Class
end
_G.Serpent = require("Utils.Serpent")
_G.EMGlobalLuaTable = require("EMGlobalLuaTable")
_G.bEnableNewSTLDataFeature = false
_G.ServerConfig = require("ServerConfig")
_G.Json = require("rapidjson")
_G.bson = require("bson")
_G.Utils = require("Utils")
_G.TimeUtils = require("Utils.TimeUtils")
_G.StubFunctionList = require("StubFunctionList")
local Utils = require("Utils")
for k, v in pairs(Utils) do
  rawset(_G, k, v)
end
local FEffectStruct = UE.FEffectStruct
local FEffectSkillInfo = UE.FSkillEffectInfo
local FMonsterSpawnPointParam = UE.FMonsterSpawnPointParam
local FPointCheckInfo = UE.FPointCheckInfo
local FNameArray = UE.FNameArray
local FMonsterEidArray = UE.FMonsterEidArray
local FClientTimerStruct = UE.FClientTimerStruct
local FClientTimerInfo = UE.FClientTimerInfo
local FSkillLevelStruct = UE.FSkillLevelStruct
local FMessage = UE.FMessage
local SetupClient = require("SetupClient")
SetupClient:Setup()
require("LogPrint")
