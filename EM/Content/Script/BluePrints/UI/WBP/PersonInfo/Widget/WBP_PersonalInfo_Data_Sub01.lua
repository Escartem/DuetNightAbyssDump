require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Name, Number)
  self.Text_DataNum:SetText(Number)
  self.Text_DataTitle:SetText(Name)
end

return M
