local SimpleRewardBox = {}
local RewardTypeSet
local CacheRewardName = {}
local CacheValidGetName = {}
local RewardTag = {
  Normal = 1,
  Extra = 2,
  Walnut = 3,
  First = 4
}

local function RewardKeyReadIndex(t, key)
  rawset(t, key, 0)
  return rawget(t, key)
end

local function RewardTableIndex(t, key)
  if type(key) ~= "number" then
    return
  end
  local i_t = {}
  setmetatable(i_t, {__index = RewardKeyReadIndex})
  rawset(t, key, i_t)
  return rawget(t, key)
end

local function InitRewardTypeTable(self, TypeName)
  local t = {}
  setmetatable(t, {__index = RewardTableIndex})
  rawset(self, TypeName, t)
end

local function IndexFunc(t, key)
  local func = SimpleRewardBox[key]
  if func then
    return func
  else
    if CacheValidGetName[key] then
      InitRewardTypeTable(t, key)
    end
    return rawget(t, key)
  end
  return nil
end

local function AddFunction(Key, Name)
  rawset(SimpleRewardBox, Key, function(self, ...)
    SimpleRewardBox.AddByRewardType(self, Name, ...)
  end)
end

function SimpleRewardBox.InitConfigCache()
  RewardTypeSet = {}
  RewardTypeSet.Exp = true
  CacheRewardName.Exp = "Exps"
  AddFunction("AddExp", "Exp")
  CacheValidGetName.Exps = true
  for RewardType, _ in pairs(DataMgr.RewardType) do
    RewardTypeSet[RewardType] = true
    CacheRewardName[RewardType] = RewardType .. "s"
    local func_name = "Add" .. RewardType
    AddFunction(func_name, RewardType)
    CacheValidGetName[RewardType .. "s"] = true
  end
end

function SimpleRewardBox:New()
  local _self = {}
  if not RewardTypeSet then
    SimpleRewardBox.InitConfigCache()
  end
  rawset(_self, "bEmpty", true)
  rawset(_self, "Tags", {})
  rawset(_self, "CacheTagStr", {})
  rawset(_self, "OriginRewardIds", {})
  setmetatable(_self, {__index = IndexFunc})
  return _self
end

local function FastInsertTag(t, Tag)
  if 0 == Tag then
    return 0
  end
  local t_len = #t
  if 0 == t_len then
    t[1] = Tag
    return 1
  end
  local low, high = 1, t_len
  while low <= high do
    local mid = (low + high) // 2
    if t[mid] == Tag then
      return 0
    elseif Tag > t[mid] then
      low = mid + 1
    else
      high = mid - 1
    end
  end
  table.insert(t, low, Tag)
  return low
end

local function GenRewardTag(self, Tag)
  local Tags = rawget(self, "Tags")
  Tag = Tag or 0
  local CacheTagStr = rawget(self, "CacheTagStr")
  local CacheStr = CacheTagStr[Tag]
  if CacheStr then
    return CacheStr
  end
  local Index = FastInsertTag(Tags, Tag)
  local TagStr = "1"
  if #Tags > 0 then
    TagStr = table.concat(Tags, "&")
  end
  if Index > 0 then
    table.remove(Tags, Index)
  end
  CacheTagStr[Tag] = TagStr
  return TagStr
end

local function AddReward(self, RewardType, Tag, k, v)
  if not v or v <= 0 then
    return
  end
  k = tonumber(k)
  local TypeName = CacheRewardName[RewardType]
  if not rawget(self, TypeName) then
    InitRewardTypeTable(self, TypeName)
  end
  local FinalTag = GenRewardTag(self, Tag)
  self[TypeName][k][FinalTag] = self[TypeName][k][FinalTag] + v
  if self.bEmpty then
    self.bEmpty = false
  end
end

function SimpleRewardBox:AddByRewardType(RewardType, Id, Count, Tag)
  if type(Id) == "table" then
    for key, value in pairs(Id) do
      AddReward(self, RewardType, Tag, key, value)
    end
  else
    AddReward(self, RewardType, Tag, Id, Count)
  end
end

local function InnerMerge(T1, T2, Key, Tag)
  local s_t = rawget(T2, Key)
  if not s_t or not next(s_t) then
    return false
  end
  if not rawget(T1, Key) then
    InitRewardTypeTable(T1, Key)
  end
  Tag = Tag and tostring(Tag)
  local d_t = rawget(T1, Key)
  for k, v in pairs(s_t) do
    if type(v) == "table" then
      for ik, iv in pairs(v) do
        if iv > 0 then
          d_t[k][ik] = d_t[k][ik] + iv
        end
      end
    elseif Tag then
      d_t[k][Tag] = d_t[k][Tag] + v
    end
  end
  return true
end

function SimpleRewardBox:Merge(Box, Tag)
  if not Box then
    return
  end
  local result = false
  for name, _ in pairs(RewardTypeSet) do
    local TypeNames = CacheRewardName[name]
    if InnerMerge(self, Box, TypeNames, Tag) and not result then
      result = true
    end
  end
  local OriginKey = "OriginRewardIds"
  local s_t = rawget(Box, OriginKey)
  if s_t then
    local d_t = rawget(self, OriginKey)
    for k, v in pairs(s_t) do
      local d_v = d_t[k] or 0
      d_t[k] = d_v + v
    end
  end
  if self.bEmpty and result then
    self.bEmpty = false
  end
end

function SimpleRewardBox:IsEmpty(TableName)
  if TableName then
    return rawget(self, TableName) and next(self[TableName]) == nil
  else
    return self.bEmpty
  end
  return true
end

function SimpleRewardBox:Clear()
  for RewardType, _ in pairs(RewardTypeSet) do
    rawset(self, CacheRewardName[RewardType], nil)
  end
  self.bEmpty = true
  self.Tags = {}
  self.CacheTagStr = {}
end

function SimpleRewardBox:Dump()
  local result = {}
  for RewardType, _ in pairs(RewardTypeSet) do
    local TypeName = CacheRewardName[RewardType]
    local TypeTable = rawget(self, TypeName)
    if TypeTable then
      result[TypeName] = {}
      for k, v in pairs(TypeTable) do
        result[TypeName][k] = SimpleRewardBox:GetCount(v)
      end
    end
  end
  return result
end

function SimpleRewardBox:DumpWithOriginRewardIds()
  local result = self:Dump()
  result.OriginRewardIds = self.OriginRewardIds
  return result
end

function SimpleRewardBox:DumpAll()
  local result = {}
  for RewardType, _ in pairs(RewardTypeSet) do
    local TypeName = CacheRewardName[RewardType]
    local TypeTable = rawget(self, TypeName)
    if TypeTable then
      result[TypeName] = TypeTable
    end
  end
  return result
end

function SimpleRewardBox:AppendTag(Tag)
  if not Tag then
    return
  end
  FastInsertTag(rawget(self, "Tags"), Tag)
  rawset(self, "CacheTagStr", {})
end

function SimpleRewardBox:RemoveTag(Tag)
  if not Tag then
    return
  end
  local Tags = rawget(self, "Tags")
  local left, right = 1, #Tags
  local pos
  while left <= right do
    local mid = (left + right) // 2
    if Tags[mid] == Tag then
      pos = mid
      break
    elseif Tag > Tags[mid] then
      left = mid + 1
    else
      right = mid - 1
    end
  end
  if pos then
    table.remove(Tags, pos)
  end
  rawset(self, "CacheTagStr", {})
end

function SimpleRewardBox:GetCount(InnerReward)
  if not InnerReward then
    return 0
  end
  local count = 0
  for _, v in pairs(InnerReward) do
    count = count + v
  end
  return count
end

function SimpleRewardBox:GetTag(Tag)
  return RewardTag[Tag]
end

function SimpleRewardBox:ParseTag(TagStr)
  local result_table = {}
  for number in string.gmatch(TagStr, "%d+") do
    result_table[#result_table + 1] = tonumber(number)
  end
  return result_table
end

function SimpleRewardBox:HasTag(TagTable, Tag)
  if type(TagTable) == "string" then
    TagTable = self:ParseTag(TagTable)
  end
  return CommonUtils.HasValue(TagTable, Tag)
end

function SimpleRewardBox:FindCountByTag(InnerReward, Tag)
  return InnerReward[tostring(self:GetTag(Tag))] or 0
end

function SimpleRewardBox:AppendOriginRewardId(Id, Count)
  local OriginRewardIds = rawget(self, "OriginRewardIds")
  Count = Count or 1
  OriginRewardIds[Id] = (OriginRewardIds[Id] or 0) + Count
end

return SimpleRewardBox
