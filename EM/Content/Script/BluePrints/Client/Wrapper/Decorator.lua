local ClassMgr = require("NetworkEngine.Common.ClassManager")
local PropUtils = require("BluePrints.Client.PropUtils")
local Decorator = {}

local function GetArgsName(fun)
  local args = {}
  
  local function hook(...)
    local info = debug.getinfo(3)
    if info.name ~= "pcall" then
      return
    end
    for i = 1, math.huge do
      local name, value = debug.getlocal(2, i)
      if "(*temporary)" == name or "(temporary)" == name or not name then
        debug.sethook()
        error("")
        return
      end
      args[i] = name
    end
  end
  
  debug.sethook(hook, "c")
  pcall(fun)
  return args
end

local function trim(input)
  return (string.gsub(input, "^%s*(.-)%s*$", "%1"))
end

local function SplitAndTrim(str, reps)
  local Results = {}
  string.gsub(str, "[^" .. reps .. "]+", function(w)
    table.insert(Results, trim(w))
  end)
  return Results
end

function Decorator:AddDecorator(Func)
  if not self.Decorators then
    self.Decorators = {}
  end
  table.insert(self.Decorators, Func)
end

local LuaBaseTypes = {
  Int = "number",
  Float = "number",
  number = "number",
  Callback = "number",
  Str = "string",
  string = "string",
  Bool = "boolean",
  boolean = "boolean",
  table = "table"
}

function Decorator:Rpc(args)
  self:AddDecorator(function(FuncName, f)
    local args_type = SplitAndTrim(args, ",")
    GWorld:AddRpcFunc(FuncName)
    
    local function NewFunc(obj, ...)
      local args_value = {
        ...
      }
      if #args_type ~= #args_value then
        error(string.format("The argument number is not match, %s need %d args, but %d args are given", FuncName, #args_type, #args_value))
      end
      for index, arg in ipairs(args_value) do
        local arg_type = args_type[index]
        if LuaBaseTypes[arg_type] then
          if type(arg) ~= LuaBaseTypes[arg_type] then
            error(string.format("The argument type is not match, %s %s arg need %s, but %s is given", FuncName, index, arg_type, type(arg)))
          end
          if "Int" == arg_type and math.type(arg) ~= "integer" then
            error(string.format("The argument type is not match, %s %s arg need Int, but %s is given", FuncName, index, math.type(arg)))
          end
        elseif "ObjId" == arg_type then
          if not PropUtils.IsObjId(arg) then
            error(string.format("The argument type is not match, %s %s arg need ObjId", FuncName, index))
          end
        else
          local real_type = ClassMgr:GetType(arg_type)
          if not real_type then
            error(string.format("The argument type is error, %s %s arg %s", FuncName, index, arg_type))
          end
          if arg.__Class__ ~= real_type then
            error(string.format("The argument class is not match, %s %s arg need %s, but %s is given", FuncName, index, arg_type, arg.__Name__))
          end
        end
      end
      f(obj, ...)
    end
    
    return NewFunc
  end)
end

function Decorator:LimitCall(interval)
  self:AddDecorator(function(FuncName, f)
    local function NewFunc(obj, ...)
      local now_time = os.time()
      
      local refresh_time = GWorld.LimitCallMethods[FuncName]
      refresh_time = refresh_time or 0
      if now_time > refresh_time then
        f(obj, ...)
        GWorld.LimitCallMethods[FuncName] = now_time + interval
      else
      end
    end
    
    return NewFunc
  end)
end

function Decorator:NoShipping()
  self:AddDecorator(function(FuncName, f)
    local function NewFunc(obj, ...)
      local IsDistribution = UE.URuntimeCommonFunctionLibrary.IsDistribution()
      
      local bEnableShippingLog = UE4.URuntimeCommonFunctionLibrary.EnableLogInShipping()
      if IsDistribution and not bEnableShippingLog then
        DebugPrint(FuncName .. " is not for Distribution")
        return
      end
      f(obj, ...)
    end
    
    return NewFunc
  end)
end

function Decorator:Time()
  self:AddDecorator(function(FuncName, f)
    local function NewFunc(obj, ...)
      local StartTime = GWorld:GetCurrentTime()
      
      DebugPrint(FuncName .. " Start Exe: ", StartTime)
      f(obj, ...)
      local EndTime = GWorld:GetCurrentTime()
      DebugPrint(FuncName .. " End Exe: ", EndTime)
      DebugPrint(FuncName .. " time-consuming is ", EndTime - StartTime)
    end
    
    return NewFunc
  end)
end

function Decorator:GM_CMD(args)
  self:AddDecorator(function(FuncName, f)
    local args_name = GetArgsName(f)
    local real_args_name = {}
    for index, arg_name in ipairs(args_name) do
      if "self" ~= arg_name and "Id" ~= arg_name and "fd" ~= arg_name and "docs" ~= arg_name and "doc" ~= arg_name then
        table.insert(real_args_name, arg_name)
      end
    end
    local args_type = SplitAndTrim(args, ",")
    GWorld:AddGmCmd(FuncName, real_args_name, args_type)
    return f
  end)
end

Decorator = setmetatable(Decorator, {
  __newindex = function(T, key, value)
    if type(value) == "function" then
      if not T.Decorators then
        T.Decorators = {}
      end
      for i = #T.Decorators, 1, -1 do
        value = T.Decorators[i](key, value)
        T.Decorators[i] = nil
      end
    end
    rawset(T, key, value)
  end
})
return Decorator
