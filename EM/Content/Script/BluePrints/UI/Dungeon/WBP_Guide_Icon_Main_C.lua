require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Initialize(Initializer)
  self.Super.Initialize(self)
  self.GuideIcons = {}
end

function M:AddGuideIcon(GuideIconObj)
  DebugPrint("WBP_Guide_Icon_Main_C AddGuideIcon", GuideIconObj.WidgetName)
  self.GuideIcons[GuideIconObj.WidgetName] = GuideIconObj
end

function M:DeleteGuideIcon(UIName)
  DebugPrint("WBP_Guide_Icon_Main_C DeleteGuideIcon", UIName)
  self.GuideIcons[UIName] = nil
end

function M:Show(ShowTag)
  M.Super.Show(self, ShowTag)
  for k, v in pairs(self.GuideIcons) do
    if v then
      v:Show(ShowTag)
    end
  end
end

function M:Hide(HideTag)
  M.Super.Hide(self, HideTag)
  for k, v in pairs(self.GuideIcons) do
    if v then
      v:Hide(HideTag)
    end
  end
end

return M
