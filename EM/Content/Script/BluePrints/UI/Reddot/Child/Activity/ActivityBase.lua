local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ReddotTreeNode_ActivityBase = Class("BluePrints.UI.Reddot.ReddotTreeNode")

function ReddotTreeNode_ActivityBase:OverrideSelfRdType()
  self:_JudgeReddotType(self.Cache.Detail)
end

function ReddotTreeNode_ActivityBase:OnRefreshNodeData(EventId)
  ReddotManager.IncreaseLeafNodeCount(self.Name, 1, {CacheKey = "New", EventId = EventId})
  if self:_Judge(EventId) then
    ReddotManager.IncreaseLeafNodeCount(self.Name, 1, {CacheKey = "Red", EventId = EventId})
  else
    ReddotManager.DecreaseLeafNodeCount(self.Name, 1, {CacheKey = "Red", EventId = EventId})
  end
end

function ReddotTreeNode_ActivityBase:OnIncreaseJudge(AddValue, CacheDetailChangedParams)
  if not CacheDetailChangedParams then
    return true
  end
  local CacheDetail = self.Cache.Detail
  local CacheKey = CacheDetailChangedParams.CacheKey
  local EventId = CacheDetailChangedParams.EventId
  if CacheKey and EventId and 1 == AddValue then
    if "New" == CacheKey and not CacheDetail[CacheKey] then
      return true
    elseif "Red" == CacheKey and 1 ~= CacheDetail[CacheKey] then
      return self:_Judge(EventId)
    end
  end
  return false
end

function ReddotTreeNode_ActivityBase:OnDecreaseJudge(SubValue, CacheDetailChangedParams)
  if not CacheDetailChangedParams then
    return true
  end
  if CacheDetailChangedParams.bClearAll then
    return true
  end
  local CacheDetail = self.Cache.Detail
  local CacheKey = CacheDetailChangedParams.CacheKey
  local EventId = CacheDetailChangedParams.EventId
  if 1 == SubValue and CacheKey and EventId and 1 == CacheDetail[CacheKey] then
    if "New" == CacheKey then
      return true
    elseif "Red" == CacheKey then
      return not self:_Judge(EventId)
    end
  end
  return false
end

function ReddotTreeNode_ActivityBase:_Judge(EventId)
  return false
end

function ReddotTreeNode_ActivityBase:OnIncreaseCount(AddValue, CacheDetailChangedParams)
  if not CacheDetailChangedParams then
    return
  end
  local CacheDetail = self.Cache.Detail
  local CacheKey = CacheDetailChangedParams.CacheKey
  CacheDetail[CacheKey] = 1
  self:JudgeReddotType(CacheDetail)
end

function ReddotTreeNode_ActivityBase:OnDecreaseCount(SubValue, CacheDetailChangedParams)
  if not CacheDetailChangedParams then
    return
  end
  local CacheDetail = self.Cache.Detail
  local bClearAll = CacheDetailChangedParams.bClearAll
  if not bClearAll then
    local CacheKey = CacheDetailChangedParams.CacheKey
    CacheDetail[CacheKey] = 0
  elseif 0 == self.Count then
    CacheDetail.New = 0
    CacheDetail.Red = 0
    CacheDetail.bClose = true
  end
  self:JudgeReddotType(CacheDetail)
end

function ReddotTreeNode_ActivityBase:JudgeReddotType(CacheDetail)
  self:_JudgeReddotType(CacheDetail)
  self:UpdateRdType()
end

function ReddotTreeNode_ActivityBase:_JudgeReddotType(CacheDetail)
  local NewRdType = self.ReddotType
  local bRed = CacheDetail.Red and CacheDetail.Red >= 1
  local bNew = CacheDetail.New and CacheDetail.New >= 1
  if bRed then
    NewRdType = EReddotType.Normal
  elseif bNew then
    NewRdType = EReddotType.New
  end
  self.ReddotType = NewRdType
end

function ReddotTreeNode_ActivityBase:OnInitNodeCache(NodeCache)
  NodeCache.Count = 0
  for k, v in pairs(NodeCache.Detail) do
    if 1 == v then
      NodeCache.Count = NodeCache.Count + 1
    end
  end
  self.bInvokeEveryTime = true
  self:JudgeReddotType(NodeCache.Detail)
end

return ReddotTreeNode_ActivityBase
