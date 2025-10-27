require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:SetInfo(Info)
  self.Text_Title:SetText(GText(Info.MainTitle))
  if Info.SubTitle then
    self.Text_SubTitle:SetText(GText(Info.SubTitle))
    self.Panel_SubTitle:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Panel_SubTitle:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

return M
