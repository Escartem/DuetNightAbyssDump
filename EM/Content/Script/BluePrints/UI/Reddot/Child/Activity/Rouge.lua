local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ReddotTreeNode_Rouge = Class("BluePrints.UI.Reddot.Child.Activity.ActivityBase")
local RougeEventIds = {103001}

function ReddotTreeNode_Rouge:_Judge(EventId)
  local Node = ReddotManager.GetTreeNode("RougeMain")
  Node = Node or ReddotManager.AddNodeEx("RougeMain")
  return Node.Count > 0
end

function ReddotTreeNode_Rouge:OnInitNodeCache(NodeCache)
  ReddotTreeNode_Rouge.Super.OnInitNodeCache(self, NodeCache)
  ReddotManager.AddListenerEx("RougeMain", self, self.OnRougeRewardChange)
end

function ReddotTreeNode_Rouge:OnDisposeNode()
  ReddotManager.RemoveListener("RougeMain", self)
end

function ReddotTreeNode_Rouge:OnRougeRewardChange(Count, RdType, RdName)
  if 0 ~= Count then
    return
  end
  for _, EventId in ipairs(RougeEventIds) do
    ActivityUtils.TrySubActivityReddotCommon("Red", EventId, self.Name)
  end
end

return ReddotTreeNode_Rouge
