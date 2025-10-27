require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:PressKeyA()
  self.List_Item:NavigateToIndex(0)
end

function M:PressKeyA_Item()
  self.List_Achievement:SetFocus()
end

function M:AchievementNavigateRight()
  self.List_Item:NavigateToIndex(0)
  return true
end

function M:ClickAchievement()
  self.List_Item:NavigateToIndex(0)
end

function M:OnClickItem()
end

return M
