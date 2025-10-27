require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(TabInfo)
  self.Text_DataNum:SetText(TabInfo.Count)
  self.Text_DataTitle:SetText(GText(TabInfo.Name))
end

return M
