local M = Class("BluePrints.UI.Reddot.ReddotTreeNode")
local GachaModel = require("BluePrints.UI.WBP.Gacha.GachaModel")

function M:OnInitNodeCache(NodeCache)
  GachaModel:CheckReddot()
end

return M
