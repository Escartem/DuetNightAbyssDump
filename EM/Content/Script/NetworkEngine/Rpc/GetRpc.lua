package.path = package.path .. ";../../?.lua;" .. ";../../../../../?.lua;"
local lfs = require("lfs")
local serpent = require("Utils/Serpent")
local exist_rpc = require("../../../../../Server/server/engine/common/rpc/IdxToRpcName")
local exist_rpc_names = {}
for key, value in pairs(exist_rpc) do
  exist_rpc_names[value] = true
end
local avatar_rpc_not_in_exist_rpcs = {}
local avatar_rpc_not_in_current_rpcs = {}
local avatar_gm_rpc_not_in_exist_rpcs = {}
local ds_rpc_not_in_exist_rpcs = {}
local avatar_component_path = {
  "../../BluePrints/Client/Entities/Components",
  "../../BluePrints/Client/Entities/CommonComponents"
}
local avatar_entity_paths = {
  "../../BluePrints/Client/Entities/Avatar.lua",
  "../../BluePrints/Client/Entities/Account.lua",
  "../../BluePrints/Client/GM_Command.lua",
  "../../BluePrints/Client/GM_Command_Region.lua"
}
local ds_component_path = {
  "../../BluePrints/Client/Entities/DSComponents",
  "../../BluePrints/Client/Entities/CommonComponents"
}
local ds_entity_paths = {
  "../../BluePrints/Client/Entities/DSEntity.lua"
}
local match_pattern = {
  "self:CallServerMethod%(\"([^\"]+)\"",
  "self:CallServer%(\"([^\"]+)",
  "Avatar:CallServerMethod%(\"([^\"]+)",
  "Avatar:CallServer%(\"([^\"]+)"
}

local function traverse_folder(path)
  local files_path = {}
  for file in lfs.dir(path) do
    if "." ~= file and ".." ~= file then
      local file_path = path .. "/" .. file
      local mode = lfs.attributes(file_path, "mode")
      if "file" == mode then
        if string.find(file_path, ".lua") then
          files_path[#files_path + 1] = file_path
        end
      elseif "directory" == mode then
        local sub_files = traverse_folder(file_path)
        for _, sub_file in ipairs(sub_files) do
          files_path[#files_path + 1] = sub_file
        end
      end
    end
  end
  return files_path
end

local function sleep(seconds)
  os.execute("sleep " .. tonumber(seconds))
end

local function GetAvatarRpcs()
  local avatar_component_paths = {}
  for _, value in ipairs(avatar_component_path) do
    local files_path = traverse_folder(value)
    for _, value in ipairs(files_path) do
      table.insert(avatar_component_paths, value)
    end
  end
  for index, value in ipairs(avatar_entity_paths) do
    table.insert(avatar_component_paths, value)
  end
  local file, content
  local avatar_rpcs = {}
  local avatar_gm_rpcs = {}
  local seen = {}
  for index, file_path in ipairs(avatar_component_paths) do
    file = io.open(file_path, "r")
    content = file:read("*all")
    file:close()
    for _, match_str in ipairs(match_pattern) do
      for method_name in content:gmatch(match_str) do
        if not seen[method_name] then
          seen[method_name] = true
          if "DoGmCommand" == method_name or string.match(method_name, "^GM%w+") or string.match(method_name, "^Gm%w+") then
            table.insert(avatar_gm_rpcs, method_name)
            if not exist_rpc_names[method_name] then
              table.insert(avatar_gm_rpc_not_in_exist_rpcs, method_name)
            end
          else
            table.insert(avatar_rpcs, method_name)
            if not exist_rpc_names[method_name] then
              table.insert(avatar_rpc_not_in_exist_rpcs, method_name)
            end
          end
        end
      end
    end
  end
  for index, value in pairs(exist_rpc) do
    if not seen[value] then
      table.insert(avatar_rpc_not_in_current_rpcs, value)
    end
  end
  table.sort(avatar_rpcs)
  table.sort(avatar_gm_rpcs)
  table.sort(avatar_rpc_not_in_exist_rpcs)
  table.sort(avatar_rpc_not_in_current_rpcs)
  table.sort(avatar_gm_rpc_not_in_exist_rpcs)
  print([[

avatar_rpc_not_in_exist_rpcs:]], serpent.block(avatar_rpc_not_in_exist_rpcs))
  print([[

avatar_rpc_not_in_current_rpcs:]], serpent.block(avatar_rpc_not_in_current_rpcs))
  print([[

avatar_gm_rpc_not_in_exist_rpcs:]], serpent.block(avatar_gm_rpc_not_in_exist_rpcs))
  return avatar_rpcs, avatar_gm_rpcs
end

local function GetDsRpcs()
  local ds_component_paths = {}
  for _, value in ipairs(ds_component_path) do
    local files_path = traverse_folder(value)
    for _, value in ipairs(files_path) do
      table.insert(ds_component_paths, value)
    end
  end
  for index, value in ipairs(ds_entity_paths) do
    table.insert(ds_component_paths, value)
  end
  local file, content
  local ds_rpcs = {}
  local seen = {}
  for index, file_path in ipairs(ds_component_paths) do
    file = io.open(file_path, "r")
    content = file:read("*all")
    file:close()
    for method_name in content:gmatch("self:CallServerMethod%(\"([^\"]+)\"") do
      if not seen[method_name] then
        seen[method_name] = true
        table.insert(ds_rpcs, method_name)
        if not exist_rpc_names[method_name] then
          table.insert(ds_rpc_not_in_exist_rpcs, method_name)
        end
      end
    end
    for method_name in content:gmatch("self:CallServer%(\"([^\"]+)\"") do
      if not seen[method_name] then
        seen[method_name] = true
        table.insert(ds_rpcs, method_name)
        if not exist_rpc_names[method_name] then
          table.insert(ds_rpc_not_in_exist_rpcs, method_name)
        end
      end
    end
  end
  table.sort(ds_rpcs)
  table.sort(ds_rpc_not_in_exist_rpcs)
  print([[

ds_rpc_not_in_exist_rpcs:]], serpent.block(ds_rpc_not_in_exist_rpcs))
  return ds_rpcs
end

local function GetRpcNames()
  local avatar_rpcs, avatar_gm_rpcs = GetAvatarRpcs()
  local ds_rpcs = GetDsRpcs()
  local rpc_names = {}
  local seen = {}
  for index, value in ipairs(avatar_rpcs) do
    if not seen[value] then
      seen[value] = true
      table.insert(rpc_names, value)
    end
  end
  for index, value in ipairs(ds_rpcs) do
    if not seen[value] then
      seen[value] = true
      table.insert(rpc_names, value)
    end
  end
  for index, value in ipairs(avatar_gm_rpcs) do
    if not seen[value] then
      seen[value] = true
      table.insert(rpc_names, value)
    end
  end
  table.sort(rpc_names)
  local file = io.open("RpcName.lua", "w")
  if file then
    file:write("return {\n")
    for i, name in ipairs(rpc_names) do
      file:write("\t\"" .. name .. "\",\n")
    end
    file:write("}\n")
    file:close()
  end
end

GetRpcNames()
