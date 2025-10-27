local HOT_RELOAD_MARK = "HOT_RELOAD"
local loaded_modules = setmetatable({}, {__mode = "v"})
local ignore_modules = {}
local config = {
  debug = true,
  script_root_path = UE.UUnLuaFunctionLibrary.GetScriptRootPath(),
  ignore_modules = ignore_modules
}
local hook = {module_loaded = nil}
local M = {config = config, hook = hook}

local function dump(tbl, max_indent)
  local rep = string.rep
  local handled = {}
  
  local function traverse(tbl, indent)
    indent = indent or 0
    if type(tbl) ~= "table" then
      return tostring(tbl)
    end
    if indent > max_indent then
      return tostring(tbl)
    end
    if handled[tbl] then
      return ""
    end
    handled[tbl] = true
    local ret = rep(" ", indent) .. "{\r\n"
    indent = indent + 2
    for k, v in pairs(tbl) do
      ret = ret .. rep(" ", indent)
      if type(k) == "number" then
        ret = ret .. "[" .. k .. "] = "
      elseif type(k) == "string" then
        ret = ret .. k .. " = "
      else
        ret = ret .. tostring(k) .. " = "
      end
      if type(v) == "number" then
        ret = ret .. v .. ",\r\n"
      elseif type(v) == "string" then
        ret = ret .. "\"" .. v .. "\",\r\n"
      elseif type(v) == "table" then
        ret = ret .. tostring(v) .. traverse(v, indent + 2) .. ",\r\n"
      else
        ret = ret .. "\"" .. tostring(v) .. "\",\r\n"
      end
    end
    ret = ret .. rep(" ", indent - 2) .. "}"
    return ret
  end
  
  if nil == max_indent then
    max_indent = 64
  end
  return traverse(tbl)
end

local function print(...)
  if config.debug then
    UEPrint("HotReload ", ...)
  end
end

local table = _ENV.table
local debug = _ENV.debug
local pairs = _ENV.pairs
local origin_require = require

local function safe_pairs(t)
  local _next, _t, _nil = pairs(t)
  
  local function safe_next(_t, i)
    local ok, result, next_i, value = pcall(_next, _t, i)
    if ok then
      return result, next_i, value
    else
      return nil
    end
  end
  
  return safe_next, _t, _nil
end

local function load_error_handler(err)
  local msg = err .. "\n" .. debug.traceback()
  if ScreenPrint then
    ScreenPrint(msg, 100)
  else
    print(msg)
  end
end

local function call_hook(name, ...)
  local func = hook[name]
  if not func then
    return
  end
  local ok, result = pcall(func, ...)
  if not ok then
    print(string.format("calling hook function '%s' failed : %s", name, result))
  end
end

local loaded_module_times = {}

local function get_last_modified_time(module_name)
  local filename = config.script_root_path .. module_name:gsub("%.", "/") .. ".lua"
  return UE.UUnLuaFunctionLibrary.GetFileLastModifiedTimestamp(filename)
end

local function make_sandbox()
  local reloading, loaded
  local proxy = setmetatable({}, {
    __index = _G,
    __newindex = _G
  })
  local env_mt = {__index = proxy, __newindex = proxy}
  
  local function load(module_name)
    local found, chunk
    for i, searcher in ipairs(package.searchers) do
      chunk = searcher(module_name)
      if type(chunk) == "function" then
        found = true
        break
      end
    end
    if not found then
      return
    end
    local env = {}
    setmetatable(env, env_mt)
    debug.setupvalue(chunk, 1, env)
    return chunk, env
  end
  
  local function load_str(str)
    local function chunk()
      return _G.load(str)()
    end
    
    local env = {}
    setmetatable(env, env_mt)
    debug.setupvalue(chunk, 1, env)
    return chunk, env
  end
  
  local function require(module_name, ...)
    if package.loaded[module_name] ~= nil then
      return package.loaded[module_name], nil
    end
    local loaded = loaded_modules[module_name]
    if loaded then
      if package.loaded[module_name] == nil then
        package.loaded[module_name] = loaded
      end
      return loaded, nil
    end
    local func, env = load(module_name)
    if func then
      local _, new_module = xpcall(func, load_error_handler, ...)
      if nil == loaded_modules[module_name] then
        loaded_modules[module_name] = new_module
        package.loaded[module_name] = new_module
        loaded_module_times[module_name] = get_last_modified_time(module_name)
        call_hook("module_loaded", new_module, module_name, false)
        return new_module, nil
      end
    else
      return origin_require(module_name, ...)
    end
    return env, nil
  end
  
  local function enter(modules)
    reloading = true
    loaded = setmetatable({}, {__mode = "kv"})
    for name, module in pairs(modules) do
      loaded[name] = module
      loaded[module] = name
    end
  end
  
  local function exit()
    reloading = false
    loaded = setmetatable({}, {__mode = "kv"})
  end
  
  local function is_loaded(obj)
    return nil ~= loaded[obj]
  end
  
  function proxy.require(module_name, ...)
    if reloading and nil ~= loaded[module_name] then
      return loaded[module_name]
    end
    local ret = require(module_name, ...)
    if reloading then
      loaded[module_name] = ret
      loaded[ret] = module_name
    end
    return ret
  end
  
  return {
    enter = enter,
    exit = exit,
    load = load,
    load_str = load_str,
    require = require,
    is_loaded = is_loaded
  }
end

local sandbox = make_sandbox()

local function merge_objects(module_res)
  for _, m in ipairs(module_res) do
    assert(m.old_module)
    for index, v in ipairs(m.values) do
      for name, value_map in pairs(v) do
        for old, new in pairs(value_map) do
          if nil == old and not sandbox.is_loaded(new) then
            m.old_module[name] = new
          elseif type(new) == "table" and not sandbox.is_loaded(new) then
            print("COPY", tostring(new), tostring(old))
            for k, nv in pairs(new) do
              old[k] = nv
            end
          elseif type(new) == "function" then
            local i = 1
            while true do
              local name, v = debug.getupvalue(new, i)
              if nil == name or "" == name then
                break
              end
              local id = debug.upvalueid(new, i)
              local uv = m.upvalue_map[id]
              if uv then
                print("SET UV :", i, tostring(new), name, tostring(uv.replaced_upvalue))
                debug.setupvalue(new, i, uv.replaced_upvalue)
              end
              i = i + 1
            end
          end
        end
      end
    end
  end
end

local function collect_module_upvalues(moudule)
  local function collect_function_upvalues(func, upvalues)
    assert(type(func) == "function")
    
    local i = 1
    while true do
      local name, value = debug.getupvalue(func, i)
      if nil == name or "" == name then
        break
      end
      if not name:find("^[_%w]") then
        error("Invalid upvalue : " .. table.concat(path, "."))
      end
      if not upvalues[name] then
        upvalues[name] = value
        if type(value) == "function" then
          collect_function_upvalues(value, upvalues)
        end
      end
      i = i + 1
    end
  end
  
  local ret = {}
  for _, v in pairs(moudule) do
    if type(v) == "function" then
      collect_function_upvalues(v, ret)
    end
  end
  return ret
end

local function collect_module_info(module)
  local ret = {}
  if sandbox.is_loaded(module) then
    return ret
  end
  for k, v in pairs(module) do
    if sandbox.is_loaded(v) then
    elseif type(v) == "function" then
      table.insert(ret, {name = k, value = v})
    end
  end
  return ret
end

local function match_module(new_module_info, old_module)
  local ret = {}
  for _, v in ipairs(new_module_info) do
    local oldFun = rawget(old_module, v.name)
    if oldFun and oldFun ~= v.value then
      table.insert(ret, {
        [v.name] = {
          [oldFun] = v.value
        }
      })
    end
  end
  return ret
end

local function match_upvalues(value_info_map, old_upvalues)
  local ret = {}
  for index, v in ipairs(value_info_map) do
    for name, value_map in pairs(v) do
      for old, new in pairs(value_map) do
        if type(new) == "function" then
          local i = 1
          while true do
            local name, new_upvalue = debug.getupvalue(new, i)
            if nil == name or "" == name then
              break
            end
            local id = debug.upvalueid(new, i)
            if not ret[id] then
              local replaced_upvalue
              if nil ~= old_upvalues[name] then
                replaced_upvalue = new_upvalue
              else
                print("ADD NEW UPVALUE : ", tostring(new), name, tostring(new_upvalue))
                if type(new_upvalue) == "table" or type(new_upvalue) == "function" and nil ~= value_info_map[new_upvalue] then
                  replaced_upvalue = value_info_map[new_upvalue]
                else
                  replaced_upvalue = new_upvalue
                end
              end
              if replaced_upvalue then
                ret[id] = {replaced_upvalue = replaced_upvalue}
              end
            end
            i = i + 1
          end
        end
      end
    end
  end
  return ret
end

local function update_global(value_map)
  local running_state = coroutine.running()
  local exclude = {
    [debug] = true,
    [coroutine] = true,
    [io] = true
  }
  exclude[exclude] = true
  exclude[M] = true
  exclude[sandbox] = true
  exclude[value_map] = true
  local update_table
  
  local function update_running_stack(co, level)
    local info = debug.getinfo(co, level + 1, "f")
    if nil == info then
      return
    end
    local f = info.func
    info = nil
    update_table(f)
    local i = 1
    while true do
      local name, v = debug.getlocal(co, level + 1, i)
      if nil == name then
        if i > 0 then
          i = -1
        else
          break
        end
      end
      local nv = value_map[v]
      if nv then
        debug.setlocal(co, level + 1, i, nv)
        update_table(nv)
      else
        update_table(v)
      end
      if i > 0 then
        i = i + 1
      else
        i = i - 1
      end
    end
    return update_running_stack(co, level + 1)
  end
  
  function update_table(root)
    if nil == root or exclude[root] then
      return
    end
    exclude[root] = true
    local t = type(root)
    if "table" == t then
      if rawget(root, "__Dict__") then
        return
      end
      local mt = getmetatable(root)
      if mt then
        update_table(mt)
      end
      local ReplaceK = {}
      for key, value in safe_pairs(root) do
        local nv = value_map[value]
        if nv then
          rawset(root, key, nv)
          update_table(nv)
        else
          update_table(value)
        end
        nv = value_map[key]
        if nv then
          ReplaceK[key] = nv
        end
      end
      for key, value in pairs(ReplaceK) do
        root[key], root[value] = nil, root[key]
        update_table(value)
      end
    elseif "userdata" == t then
      local mt = getmetatable(root)
      if mt then
        update_table(mt)
      end
      local user_value = debug.getuservalue(root)
      if user_value then
        local nv = value_map[user_value]
        if nv then
          debug.setuservalue(root, user_value)
          update_table(nv)
        else
          update_table(user_value)
        end
      end
    elseif "function" == t then
      local i = 1
      while true do
        local name, v = debug.getupvalue(root, i)
        if nil == name then
          break
        end
        do
          local nv = value_map[v]
          if nv then
            update_table(nv)
          else
            update_table(v)
          end
        end
        i = i + 1
      end
    end
  end
  
  update_running_stack(running_state, 2)
  update_table(_G)
  update_table(debug.getregistry())
end

local function update_modules(old_modules, new_modules, new_envs)
  print("HOT RELOAD START")
  local result = {}
  for i, old_module in ipairs(old_modules) do
    local new_module = new_modules[i]
    local new_module_info = collect_module_info(new_module)
    print("--------------Print NewModuleInfo--------------")
    print(dump(new_module_info))
    local old_module_upvalues = collect_module_upvalues(old_module)
    print("--------------Print OldModuleUpValue--------------")
    print(dump(old_module_upvalues, 6))
    local moduleres = {
      values = {},
      upvalue_map = {},
      old_module = old_module
    }
    moduleres.values = match_module(new_module_info, old_module)
    table.insert(moduleres.values, {
      [new_module] = {
        [old_module] = new_module
      }
    })
    print("--------------Print ValueMap--------------")
    print(dump(moduleres.values))
    moduleres.upvalue_map = match_upvalues(moduleres.values, old_module_upvalues)
    print("--------------Print UVMap--------------")
    print(dump(moduleres.upvalue_map, 10))
    result[i] = moduleres
  end
  merge_objects(result)
  local all_value_maps = {}
  for _, rv in ipairs(result) do
    for _, v in ipairs(rv.values) do
      for name, value_map in pairs(v) do
        for key, value in pairs(value_map) do
          all_value_maps[key] = value
        end
      end
    end
  end
  print("--------------Print AllValueMap--------------")
  print(dump(all_value_maps))
  update_global(all_value_maps)
  print("HOT RELOAD END")
end

local function reload_modules(module_names)
  if not module_names or 0 == #module_names then
    return
  end
  local tmp_modules = {}
  for _, module_name in ipairs(module_names) do
    if loaded_modules[module_name] then
      tmp_modules[module_name] = loaded_modules[module_name]
    end
  end
  sandbox.enter(tmp_modules)
  local old_modules = {}
  local new_modules = {}
  local module_envs = {}
  for _, module_name in ipairs(module_names) do
    if nil == loaded_modules[module_name] then
      sandbox.require(module_name)
    else
      local func, env = sandbox.load(module_name)
      if nil ~= func then
        local ok, new_module = xpcall(func, load_error_handler)
        if not ok then
          sandbox.exit()
          return
        end
        if new_module then
          for k, v in pairs(env) do
            new_module[k] = v
          end
        else
          new_module = env
        end
        if string.sub(module_name, 1, string.len("Datas.")) == "Datas." then
          package.loaded[module_name] = new_module
        else
          old_modules[#old_modules + 1] = loaded_modules[module_name]
          new_modules[#new_modules + 1] = new_module
          module_envs[#module_envs + 1] = env
          call_hook("module_loaded", new_module, module_name, true)
        end
      else
        sandbox.exit()
        return
      end
    end
  end
  update_modules(old_modules, new_modules, module_envs)
  sandbox.exit()
end

function M.reload(module_names)
  if module_names then
    reload_modules(module_names)
    return
  end
  local modified_modules = {}
  for module_name, time in pairs(loaded_module_times) do
    if not ignore_modules[module_name] then
      local current_time = get_last_modified_time(module_name)
      if current_time ~= time then
        modified_modules[#modified_modules + 1] = module_name
        loaded_module_times[module_name] = current_time
      end
    end
  end
  print("modified modules:", dump(modified_modules))
  if #modified_modules > 0 then
    reload_modules(modified_modules)
  end
end

function M.RemoveLoadedModule(module_name)
  loaded_modules[module_name] = nil
  package.loaded[module_name] = nil
end

M.require = sandbox.require
return M
