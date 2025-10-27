require("UnLua")
local M = Class()

function M:OnClick(url)
  EventManager:FireEvent(EventID.OnAchvHyperlinkClick, url)
end

return M
