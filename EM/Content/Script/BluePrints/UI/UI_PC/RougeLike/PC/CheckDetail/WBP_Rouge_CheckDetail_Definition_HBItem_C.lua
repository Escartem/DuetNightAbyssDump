require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  self.Text_Title:SetText(GText(Content.TermName))
  self.Text_DefinitionDesc:SetText(GText(Content.Explaination))
end

return M
