require("UnLua")
local M = Class({
  "BluePrints.UI.WBP.Common.Tab.Widget.WBP_Com_TabSubItem01_P_C"
})

function M:Update(Idx, Info, PlatformDeviceName)
  M.Super.Update(self, Idx, Info, PlatformDeviceName)
  if Info.Icon then
    local Icon = LoadObject(Info.Icon)
    local Material = self.Icon_Tab:GetDynamicMaterial()
    Material:SetTextureParameterValue("IconTex", Icon)
  end
end

return M
