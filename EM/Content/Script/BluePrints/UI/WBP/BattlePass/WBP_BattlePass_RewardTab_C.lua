require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init(Parent)
  self.Parent = Parent
  self.Tab_Normal:SetText(GText("UI_BattlePass_FreeRank"))
end

function M:SetReddotVisibility(Visibility)
  self.Reddot:SetVisibility(Visibility)
end

return M
