local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ReddotTreeNode_Theater = Class("BluePrints.UI.Reddot.Child.Activity.ActivityBase")
local TheaterEventId = {103011}

function ReddotTreeNode_Theater:_Judge(EventId)
  local Avatar = GWorld:GetAvatar()
  local TabInfo = {false, false}
  local IsEmpty = true
  local TheaterTaskData = DataMgr.TheaterTask
  local TheaterData = Avatar.TheaterActivity[EventId]
  if not TheaterData then
    return false
  end
  for TaskId, TaskInfo in pairs(TheaterData.Tasks) do
    if TaskInfo.Progress >= TaskInfo.Target then
      IsEmpty = false
      local Node = ReddotManager.GetTreeNode("TheaterEventReward")
      if not Node then
        ReddotManager.AddNodeEx("TheaterEventReward")
      end
      local isDaily = TheaterTaskData[TaskId].IsDaily
      local index = isDaily and 1 or 2
      local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("TheaterEventReward")
      if not CacheDetail[index] then
        CacheDetail[index] = {}
      end
      if not CacheDetail[index] and not TabInfo[index] then
        CacheDetail[index] = 1
        ReddotManager.IncreaseLeafNodeCount("TheaterEventReward")
        TabInfo[index] = true
      end
    end
  end
  return not IsEmpty
end

function ReddotTreeNode_Theater:OnInitNodeCache(NodeCache)
  ReddotTreeNode_Theater.Super.OnInitNodeCache(self, NodeCache)
  ReddotManager.AddListenerEx("TheaterEventReward", self, self.OnTheaterEventRewardChange)
end

function ReddotTreeNode_Theater:OnDisposeNode()
  ReddotManager.RemoveListener("TheaterEventReward", self)
end

function ReddotTreeNode_Theater:OnTheaterEventRewardChange(Count, RdType, RdName)
  if 0 ~= Count then
    return
  end
  for _, EventId in ipairs(TheaterEventId) do
    ActivityUtils.TrySubActivityReddotCommon("Red", EventId, self.Name)
  end
end

return ReddotTreeNode_Theater
