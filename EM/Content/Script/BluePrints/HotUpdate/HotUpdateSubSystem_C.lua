require("Unlua")
local M = Class()

function M:ShowRestartDialog()
  local Params = {}
  Params.LeftCallbackObj = self
  Params.LeftCallbackFunction = self.QuitAndReopenGame
  Params.RightCallbackObj = self
  Params.RightCallbackFunction = self.QuitAndReopenGame
  Params.CloseBtnCallbackObj = self
  Params.CloseBtnCallbackFunction = self.QuitAndReopenGame
  UIManager(self):ShowCommonPopupUI(100053, Params)
end

return M
