local M = Class("BluePrints.UI.Reddot.ReddotTreeNode")

function M:OnInitNodeCache(NodeCache)
  NodeCache.Count = 0
  for key, value in pairs(NodeCache.Detail) do
    if 1 == value then
      NodeCache.Count = NodeCache.Count + 1
    end
  end
end

function M:OnDecreaseCount(SubValue, CacheDetailChangedParams, OldCount)
  if 0 ~= self.Count then
    ReddotManager.TryInvokeEvent(self, self.Count, true)
  end
end

return M
