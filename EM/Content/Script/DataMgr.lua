DataMgr = setmetatable({}, {
  __index = function(t, key)
    return require("Datas." .. key)
  end
})

function DataMgr.Print_t(t)
  local print_r_cache = {}
  
  local function sub_print_r(t, indent)
    if print_r_cache[tostring(t)] then
      print(indent .. "*" .. tostring(t))
    else
      print_r_cache[tostring(t)] = true
      if type(t) == "table" then
        for pos, val in pairs(t) do
          if type(val) == "table" then
            print(indent .. "[" .. pos .. "] => " .. tostring(t) .. " {")
            sub_print_r(val, indent .. string.rep(" ", string.len(pos) + 8))
            print(indent .. string.rep(" ", string.len(pos) + 6) .. "}")
          elseif type(val) == "string" then
            print(indent .. "[" .. pos .. "] => \"" .. val .. "\"")
          else
            print(indent .. "[" .. pos .. "] => " .. tostring(val))
          end
        end
      else
        print(indent .. tostring(t))
      end
    end
  end
  
  if type(t) == "table" then
    print(tostring(t) .. " {")
    sub_print_r(t, "  ")
    print("}")
  else
    sub_print_r(t, "  ")
  end
  print()
end

function DataMgr.GetData(filename)
  local pro_path = UE4.UKismetSystemLibrary.GetProjectContentDirectory()
  local file = io.open(pro_path .. "../Datas/" .. filename .. ".json", "r")
  local info = file:read("*a")
  file:close()
  local json = require("rapidjson")
  local res = json.decode(info)
  return res
end

function DataMgr.GetLevelLoaderJsonData(shortname)
  local pro_path = UE4.UKismetSystemLibrary.GetProjectContentDirectory()
  local path = pro_path .. "Script/Datas/Houdini_data/" .. shortname .. ".json"
  local info = UE4.URuntimeCommonFunctionLibrary.LoadFile(path)
  local json = require("rapidjson")
  local res = json.decode(info)
  return res
end

function DataMgr.PreLoad()
  local DataNames = require("Datas.DataNames")
  for _, DataName in pairs(DataNames) do
    require("Datas." .. DataName)
  end
end

local all_tables = {}

function DataMgr.CollectTable(Table)
  for k, tbl in pairs(all_tables) do
    if tbl == Table then
      all_tables[k] = nil
      for k, v in pairs(tbl) do
        if type(v) == "table" then
          DataMgr.CollectTable(v)
        end
      end
      break
    end
  end
end

DataMgr.PartitionCache = {
  Cache = {},
  MaxPartitionsPerFile = 10
}

function GetMaxPartitionsByFileName(FileName)
  local MaxVal = DataMgr.PartitionCache.MaxPartitionsPerFile
  if not FileName or "" == FileName then
    return MaxVal
  end
  local CacheLimitArray = {
    Talk_Sound = 10,
    Dialogue_Content = 2,
    DialogueConvert = 2
  }
  for key, val in pairs(CacheLimitArray) do
    if string.find(FileName, key, 1, true) then
      MaxVal = val
    end
  end
  return MaxVal
end

function DataMgr.BinarySearch(Key, DataIndexTable)
  local Low, High = 1, #DataIndexTable
  while Low <= High do
    local Mid = math.floor((Low + High) / 2)
    local Entry = DataIndexTable[Mid]
    if Key >= Entry.MinKey and Key <= Entry.MaxKey then
      return Entry.Loader(), Entry.MinKey, Entry.MaxKey
    elseif Key < Entry.MinKey then
      High = Mid - 1
    else
      Low = Mid + 1
    end
  end
  return nil
end

local function UpdatePartitionLRU(FileName, PartitionKey)
  local FileCache = DataMgr.PartitionCache.Cache[FileName]
  if not FileCache then
    return
  end
  for i, key in ipairs(FileCache.LRUQueue) do
    if key == PartitionKey then
      table.remove(FileCache.LRUQueue, i)
      break
    end
  end
  table.insert(FileCache.LRUQueue, 1, PartitionKey)
end

function DataMgr.QueryTable(Key, FileName, Data)
  local Cache = DataMgr.PartitionCache
  local FileCache = Cache.Cache[FileName]
  if not FileCache then
    local Limit = GetMaxPartitionsByFileName(FileName)
    FileCache = {
      Partitions = {},
      LRUQueue = {},
      MaxPartitions = Limit
    }
    Cache.Cache[FileName] = FileCache
  end
  for PartitionKey, CachedPartition in pairs(FileCache.Partitions) do
    if Key >= CachedPartition.MinKey and Key <= CachedPartition.MaxKey then
      UpdatePartitionLRU(FileName, PartitionKey)
      return CachedPartition.Data[Key]
    end
  end
  local PartitionData, MinKey, MaxKey = DataMgr.BinarySearch(Key, Data)
  if not PartitionData or not PartitionData[Key] then
    return nil
  end
  local PartitionKey = MinKey .. ":" .. MaxKey
  FileCache.Partitions[PartitionKey] = {
    Data = PartitionData,
    MinKey = MinKey,
    MaxKey = MaxKey
  }
  UpdatePartitionLRU(FileName, PartitionKey)
  if #FileCache.LRUQueue > FileCache.MaxPartitions then
    local OldestKey = table.remove(FileCache.LRUQueue)
    FileCache.Partitions[OldestKey] = nil
  end
  return PartitionData[Key]
end

function DataMgr.GetPartitionData(Key, Data)
  local PartitionData, MinKey, MaxKey = DataMgr.BinarySearch(Key, Data)
  if not PartitionData or not PartitionData[Key] then
    return nil
  end
  return PartitionData
end

function DataMgr.ReadOnly_NewIndex(t, k, v)
  local rawset = _ENV.rawset
  local getmetatable = _ENV.getmetatable
  error("\230\178\161\230\179\149\229\175\185\229\175\188\232\161\168\230\149\176\230\141\174\227\128\144" .. tostring(t.__name) .. "\227\128\145\228\184\173\229\173\151\230\174\181\227\128\144" .. tostring(k) .. "\227\128\145\232\191\155\232\161\140\229\134\153\230\147\141\228\189\156")
end

function DataMgr.CleanAllTable()
  all_tables = {}
  local DataNames = require("Datas.DataNames")
  local HotFix = require("HotFix")
  local data_module_table = rawget(HotFix, "data_module_table")
  for _, DataName in pairs(DataNames) do
    if not data_module_table or not data_module_table[DataName] then
      require("UnLuaHotReload").RemoveLoadedModule("Datas." .. DataName)
    end
  end
end

function read_only(name, tbl)
  if not all_tables[tbl] then
    local tbl_mt = getmetatable(tbl)
    if not tbl_mt then
      tbl_mt = {}
      setmetatable(tbl, tbl_mt)
    end
    local proxy = tbl_mt.__read_only_proxy
    if not proxy then
      proxy = {__name = name}
      tbl_mt.__read_only_proxy = proxy
      do
        local proxy_mt = {
          __index = tbl,
          __newindex = DataMgr.ReadOnly_NewIndex,
          __pairs = function(t)
            return pairs(tbl)
          end,
          __len = function(t)
            return #tbl
          end,
          __read_only_proxy = proxy
        }
        setmetatable(proxy, proxy_mt)
      end
    end
    all_tables[tbl] = proxy
    for k, v in pairs(tbl) do
      if type(v) == "table" then
        tbl[k] = read_only(name, v)
      end
    end
  end
  return all_tables[tbl]
end

if URuntimeCommonFunctionLibrary.IsDebugDataTable() then
  DataMgr.ReadOnly = read_only
else
  function DataMgr.ReadOnly(name, tbl)
    return tbl
  end
end
return DataMgr
