require("UnLua")
local M = Class({
  "BluePrints.UI.UI_PC.Common.Common_Item.WBP_ShowItem_Base_C"
})

function M:InitData(Content)
  self.Super.InitData(self, Content)
end

function M:InitCompView()
  self.Super.InitCompView(self)
end

return M
