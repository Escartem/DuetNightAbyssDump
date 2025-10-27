local M = Class("Blueprints.UI.WBP.StoryInteractive.View.StoryInteractiveView")
local Common = require("BluePrints.UI.WBP.StoryInteractive.StoryInteractiveCommon")

function M:InitUIInfo(Name, IsInUIMode, EventList, NpcId, EndCallback)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, NpcId, EndCallback)
  self:InitBaseView(NpcId, EndCallback)
end

return M
