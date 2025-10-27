require("UnLua")
local M = Class({
  "BluePrints.UI.WBP.Common.Tab.Widget.WBP_Com_TabSubItem01_P_C"
})

function M:Update(Idx, Info, PlatformDeviceName)
  M.Super.Update(self, Idx, Info, PlatformDeviceName)
  if Info.IsLast then
    self.Arrow:SetVisibility(ESlateVisibility.Collapsed)
  end
end

return M
