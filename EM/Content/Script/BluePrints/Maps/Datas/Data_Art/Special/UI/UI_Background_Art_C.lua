local M = Class()

function M:ReceiveBeginPlay()
  _G.UIPreviewPreviewLevel = self
end

function M:ReceiveEndPlay()
  _G.UIPreviewPreviewLevel = nil
end

return M
