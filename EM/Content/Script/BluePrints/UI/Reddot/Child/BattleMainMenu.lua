local M = Class("BluePrints.UI.Reddot.ReddotTreeNode")

function M:OverrideSelfRdType()
  if self.ReddotType == EReddotType.Num or self.ReddotType == EReddotType.Gray then
    self.ReddotType = EReddotType.Normal
  end
end

return M
