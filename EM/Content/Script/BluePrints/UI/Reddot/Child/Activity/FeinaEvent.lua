local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ReddotTreeNode_FeinaEvent = Class("BluePrints.UI.Reddot.Child.Activity.ActivityBase")
local FeiNaEventId = {103010}

function ReddotTreeNode_FeinaEvent:_Judge(EventId)
  local Node = ReddotManager.GetTreeNode("FeinaEventReward")
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("FeinaEventReward")
  if ActivityUtils.CheckIsPermanentEvent(EventId) then
    if CacheDetail and Node and Node.Count > 0 then
      ReddotManager.DecreaseLeafNodeCount("FeinaEventReward", Node.Count)
    end
    return false
  end
  if not table.isempty(CacheDetail) then
    return true
  end
  return false
end

function ReddotTreeNode_FeinaEvent:OnInitNodeCache(NodeCache)
  ReddotTreeNode_FeinaEvent.Super.OnInitNodeCache(self, NodeCache)
  ReddotManager.AddListenerEx("FeinaEventReward", self, self.OnFeinaEventRewardChange)
end

function ReddotTreeNode_FeinaEvent:OnDisposeNode()
  ReddotManager.RemoveListener("FeinaEventReward", self)
end

function ReddotTreeNode_FeinaEvent:OnFeinaEventRewardChange(Count, RdType, RdName)
  if 0 ~= Count then
    return
  end
  for _, EventId in ipairs(FeiNaEventId) do
    ActivityUtils.TrySubActivityReddotCommon("Red", EventId, self.Name)
  end
end

return ReddotTreeNode_FeinaEvent
