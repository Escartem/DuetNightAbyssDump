local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local RankInfo = require("BluePrints.Client.CustomTypes.RankInfo")
local Heap = require("BluePrints.Client.Wrapper.Heap")
local RankListItem = RankInfo.RankListItem
local TimeUtils
if GWorld:IsSkynetServer() then
  TimeUtils = require("src.utils.TimeUtils")
else
  TimeUtils = require("Utils.TimeUtils")
end
local Param2RankProp = {time = "CostTime", round = "Round"}
local RankList = Class("RankList", CustomTypes.CustomAttr)
RankList.__Props__ = {
  RankId = prop.prop("Int", "save"),
  RankSize = prop.prop("Int", "save"),
  RankListInfo = prop.prop("RankInfo.RankListContainer", "save"),
  RankDetailInfo = prop.prop("RankInfo.RankDetailInfos", "save"),
  DungeonId = prop.getter("Data", "DungeonId"),
  Param = prop.getter("Data", "Param"),
  SortRule = prop.getter("Data", "SortRule"),
  Capacity = prop.getter("Data", "Capacity")
}

function RankList:Data()
  return DataMgr.Rank[self.RankId]
end

function RankList:Init(RankId)
  if not RankId then
    return
  end
  self.RankId = RankId
  self.RankSize = math.min(self.Capacity, 100)
  self:_Init()
end

function RankList:_Init()
  self:SetCompFunc()
end

function RankList:IsAscend()
  return self.SortRule == "ascend"
end

function RankList:IsDescend()
  return self.SortRule == "descend"
end

function RankList:SetCompFunc()
  local RankProp = Param2RankProp[self.Param]
  if not RankProp then
    return
  end
  if self:IsAscend() then
    function self.CompFunc(item1, item2)
      if item1[RankProp] == item2[RankProp] then
        return item1.Time < item2.Time
      end
      return item1[RankProp] < item2[RankProp]
    end
  elseif self:IsDescend() then
    function self.CompFunc(item1, item2)
      if item1[RankProp] == item2[RankProp] then
        return item1.Time < item2.Time
      end
      return item1[RankProp] > item2[RankProp]
    end
  end
end

function RankList:SetRankSize(size)
  self.RankSize = math.min(size, 100)
end

function RankList:Top()
  local RankProp = Param2RankProp[self.Param]
  if self.RankListInfo:Length() > 0 then
    return self.RankListInfo[1][RankProp]
  end
end

function RankList:InsertItem(param, value, eid, detail)
  GWorld.logger.debug("InsertItem start", param, value)
  if param ~= self.Param then
    return false
  end
  if not self.CompFunc then
    return false
  end
  local item
  local now = TimeUtils.NowTime()
  if "time" == param then
    item = RankListItem(eid, value, nil, nil)
  elseif "round" == param then
    item = RankListItem(eid, nil, value, nil)
  end
  item:SetTime(now)
  local result = false
  GWorld.logger.debug("InsertItem start!!!")
  if self.RankListInfo:Length() < self.RankSize then
    GWorld.logger.debug("rank list is not full")
    Heap.HeapPushWithComp(self.RankListInfo._inner, item, self.CompFunc)
    detail.RankValue = value
    detail.Time = now
    self:UpdateRankDetailInfo(eid, detail)
    result = true
  elseif self:IsAscend() and value >= self:Top() then
    GWorld.logger.debug("IsAscend, value >= top")
    result = false
  elseif self:IsDescend() and value <= self:Top() then
    GWorld.logger.debug("IsDescend, value <= top")
    result = false
  else
    GWorld.logger.debug("rank list is full, insert new value")
    local pop_item = Heap.HeapPopWithComp(self.RankListInfo._inner, self.CompFunc)
    self.RankDetailInfo[pop_item.Eid] = nil
    Heap.HeapPushWithComp(self.RankListInfo._inner, item, self.CompFunc)
    detail.RankValue = value
    detail.Time = now
    self:UpdateRankDetailInfo(eid, detail)
    result = true
  end
  return result
end

function RankList:RemoveItem(eid, old_value)
  GWorld.logger.debug("RemoveItem start")
  local Length = self.RankListInfo:Length()
  if 0 == Length then
    return false
  end
  if self:GetRankValue(eid) ~= old_value then
    return false
  end
  self.RankDetailInfo[eid] = nil
  local index = self:IndexEid(eid)
  self.RankListInfo[index] = self.RankListInfo[Length]
  self.RankListInfo:Pop()
  local NewLength = self.RankListInfo:Length()
  if index < NewLength then
    Heap.AdjustUpWithComp(self.RankListInfo._inner, index, self.CompFunc)
    Heap.AdjustDownWithComp(self.RankListInfo._inner, index, NewLength, self.CompFunc)
  end
  GWorld.logger.debug("RemoveItem end")
  return true
end

function RankList:IndexEid(eid)
  for index, value in ipairs(self.RankListInfo) do
    if value.Eid == eid then
      return index
    end
  end
end

function RankList:UpdateRankDetailInfo(eid, detail)
  if not detail then
    return
  end
  if not self.RankDetailInfo[eid] then
    self.RankDetailInfo[eid] = self.RankDetailInfo:NewRankDetailInfo(eid)
  end
  self.RankDetailInfo[eid]:Update(detail)
end

function RankList:CanRefreshRank(eid, new_value)
  local old_value = self:GetRankValue(eid)
  if not old_value then
    return false
  end
  if self:IsAscend() and new_value < old_value then
    return true
  elseif self:IsDescend() and new_value > old_value then
    return true
  end
  return false
end

function RankList:GetRankValue(eid)
  if self.RankDetailInfo[eid] then
    return self.RankDetailInfo[eid].RankValue
  end
end

function RankList:GetTotalRankList()
  local SortedList = {}
  for index, value in ipairs(self.RankListInfo._inner) do
    table.insert(SortedList, value)
  end
  Heap.SortWithComp(SortedList, self.CompFunc)
  local infos = {}
  local Eids = {}
  for index, value in ipairs(SortedList) do
    if not Eids[value.Eid] then
      local info = self.RankDetailInfo[value.Eid]
      if info then
        info = info:all_dump(info)
        table.insert(infos, info)
        Eids[value.Eid] = 1
      end
    end
  end
  return infos
end

FormatProperties(RankList)
local RankLists = Class("RankLists", CustomTypes.CustomDict)
RankLists.KeyType = BaseTypes.Int
RankLists.ValueType = RankList

function RankLists:NewRankList(RankId)
  local _RankList = RankList(RankId)
  self[RankId] = _RankList
  return _RankList
end

return {RankList = RankList, RankLists = RankLists}
